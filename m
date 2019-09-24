Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F072BCB0D
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 17:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732324AbfIXPUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 11:20:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56583 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730625AbfIXPUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 11:20:31 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Cmc4i6LZvKKNGCmc8irIVP; Tue, 24 Sep 2019 17:20:28 +0200
Subject: Re: [PATCH 1/2] cec-follower: add tuner step increment/decrement
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
 <20190924141752.5508-2-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <373a02cd-bb48-3f10-45a7-6b318889715c@xs4all.nl>
Date:   Tue, 24 Sep 2019 17:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924141752.5508-2-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMdw4oZ50lPH8a6S5PfZ1phyUkyxuxzs0FC2E3SvnhP/GNrzfWJwvVX1OqWIv/fDb/DAg6uE9Ue7nxCLIYzBxedQUsfU4eqvtosWAKYeQIOwwyUmLnuc
 OS13rb0F+w++fuLRGoawTuZYAskDD1Sga48OtmkaoV1+dxVIYwBVp8z14kCFKqjJh10MG42wAHBLFxyLlfIlVy0EipexaUPOrEjxGR7qb+s4hvL3rvcl/vl+
 lif9UVj2gwaYhncxItoi4As/3fTU5NtiomU4TR9UQ1Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/24/19 4:17 PM, Jiunn Chang wrote:
> Tuner step increment/decrement will select the next highest or next
> lowest service frequency.  There are a total of three possible
> frequencies from analog_freqs_khz given a broadcast type and system.
> 
> Opcodes implemented:
>   - <Tuner Step Increment>
>   - <Tuner Step Decrement>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-follower/cec-tuner.cpp | 49 ++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index acc3fd00..adb2f63c 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -135,6 +135,22 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	return false;
>  }
>  
> +static int analog_find_freq_index(struct cec_op_tuner_device_info *info)
> +{
> +	if (info->analog.ana_freq == 0)
> +		return -1;

Can this ever be 0? With the current emulation code this cannot happen, I think.
I'd drop this check.

> +
> +	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
> +
> +	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
> +		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
> +
> +		if (ana_freq_khz == freq)
> +			return i;
> +	}
> +	return -1;

If it can't be found, just return 0. Again, this can't happen with the current code.

> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
> @@ -178,12 +194,39 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		return;
>  
>  	case CEC_MSG_SELECT_DIGITAL_SERVICE:
> -	case CEC_MSG_TUNER_STEP_DECREMENT:
> -	case CEC_MSG_TUNER_STEP_INCREMENT:
> -		if (!cec_has_tuner(1 << me))
> +	case CEC_MSG_TUNER_STEP_DECREMENT: {
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>  			break;
> +
> +		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +		int idx = analog_find_freq_index(info);
> +
> +		if (idx == -1 || idx == 0)

If idx == 0, then just wrap around to the highest index. That's what typically happens
when you press Previous Channel on the TV's remote as well.

> +			return;
> +		if (info->is_analog) {
> +			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][--idx];
> +
> +			info->analog.ana_freq = (freq * 10) / 625;
> +		}
>  		return;
> +	}
> +
> +	case CEC_MSG_TUNER_STEP_INCREMENT: {
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
>  
> +		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +		int idx = analog_find_freq_index(info);
> +
> +		if (idx == -1 || idx == 2)

Same here, just wrap around to 0. And don't use 2, use the NUM_ANALOG_FREQS define.

> +			return;
> +		if (info->is_analog) {
> +			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][++idx];
> +
> +			info->analog.ana_freq = (freq * 10) / 625;
> +		}
> +		return;
> +	}
>  
>  		/*
>  		  One Touch Record
> 

Regards,

	Hans
