Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39330B8D4A
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 10:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389804AbfITI4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 04:56:43 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39553 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388411AbfITI4n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 04:56:43 -0400
Received: from [IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d] ([IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BEiViUMqB9D4hBEiWicqyB; Fri, 20 Sep 2019 10:56:40 +0200
Subject: Re: [PATCH v5] cec-follower: add tuner analog service emulation
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190919041844.346514-1-c0d1n61at3@gmail.com>
 <20190919174702.140335-3-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <358f32a2-4cf0-77c9-ffb3-15d3486eeb6e@xs4all.nl>
Date:   Fri, 20 Sep 2019 10:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190919174702.140335-3-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNwlQdBGsRdd/wgZmcIrs5UZus4HvZCgSYwfi6JpO8+aO1QEbz3JqQWdGfcKgJQPLC6LzjUGh18eETDVsSs7buh9vPpNxTylYeaDZQcYnffk0/HZVJeU
 671ZHGj3ze6aDHOmzJwS7tstjPqrqAleaIEqBRg0AJrlfcIhV488e0HX2kwuzsd4kAZxwXBNVEvB29r1P5Rlv+HQiMu+uke5k/Yww0FS05f9zZKOU0aGBCPE
 9CoZXLKlquAVoXsUOgYnc01CASYrnJsA3uzT/9fcF62doHCimJOlktybx8b2oYiD0NtlqzWFTJ0VaW2Bg2a403GUpGOiJJXu9MDdBnUUvpxDHbN792UDaGJp
 SQZVlooPcUm44M7JHkBVfmnsJmDNfg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiunn,

This is a lot better. Just a few more comments:

On 9/19/19 7:47 PM, Jiunn Chang wrote:
> Implement the following tuner control features:
>   - <Select Analogue Service>
>   - <Give Tuner Device Status> and reply <Tuner Device Status>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
> 
> Changes made since v1:
>   - Fix typos/bugs
>   - Import reply_feature_abort() from cec-processing.cpp
>   - Add functionality to choose nearest frequency
> 
> Changes made since v2:
>   - Fix typos/bugs
>   - Use state from node in cec-follower.h
>   - Rename functions to analog_ prefix
> 
> Changes made since v3:
>   - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp
> 
> Changes made since v4:
>   - Remove int casting in abs()
>   - Add temp variables: info, freq to make code easier to read
>   - Use NUM_ANALOG_FREQS macro
> 
> ---
>  utils/cec-follower/cec-follower.h |  1 +
>  utils/cec-follower/cec-tuner.cpp  | 62 +++++++++++++++++++++++++------
>  2 files changed, 51 insertions(+), 12 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 03b52217..91b9e037 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -51,6 +51,7 @@ struct state {
>  	__u64 rc_press_rx_ts;
>  	unsigned rc_press_hold_count;
>  	unsigned rc_duration_sum;
> +	struct cec_op_tuner_device_info tuner_dev_info;
>  };
>  
>  struct node {
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index bdeda342..87425083 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <sys/ioctl.h>
> +#include <stdlib.h>
>  
>  #include "cec-follower.h"
>  
> @@ -89,6 +90,40 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
>  	}
>  };
>  
> +static void analog_set_tuner_chan_freq(struct node *node)
> +{
> +	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
> +	int nearest = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
> +
> +	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
> +		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
> +
> +		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest)) {
> +			nearest = freq;
> +		}

You can drop the { } as per the kernel coding style.

> +	}
> +	info->analog.ana_freq = (nearest * 10) / 625;
> +}
> +
> +static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
> +{
> +	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +
> +	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
> +	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
> +	info->is_analog = true;
> +	cec_ops_select_analogue_service(msg,
> +					&info->analog.ana_bcast_type,
> +					&info->analog.ana_freq,
> +					&info->analog.bcast_system);
> +	if (info->analog.ana_bcast_type > 2 ||
> +	    info->analog.bcast_system > 8)
> +		return false;

cec_ops_select_analogue_service should store the results in temp variables first
and this function should only change node->state.tuner_dev_info if the test above
succeeds. Otherwise you would change the internal state to invalid values.

I also think that analog_set_tuner_chan_freq() shouldn't set info->analog.ana_freq.
That really should happen in this function as that keeps the code that updates
node->state.tuner_dev_info in a single place. Instead that function should just
find the nearest valid frequency, so the prototype becomes something like this:

static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
					    int ana_freq_khz);

This will be needed for e.g. timer/record support as well.


> +	analog_set_tuner_chan_freq(node);
> +	return true;
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
> @@ -105,21 +140,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		*/
>  
>  	case CEC_MSG_GIVE_TUNER_DEVICE_STATUS: {
> -		if (!cec_has_tuner(1 << me))
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>  			break;
>  
> -		struct cec_op_tuner_device_info tuner_dev_info = {};
> -
>  		cec_msg_set_reply_to(&msg, &msg);
> -		tuner_dev_info.rec_flag = CEC_OP_REC_FLAG_NOT_USED;
> -		tuner_dev_info.tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_NONE;
> -		tuner_dev_info.is_analog = false;
> -		tuner_dev_info.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> -		tuner_dev_info.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C;
> -		tuner_dev_info.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
> -		tuner_dev_info.digital.channel.minor = 1;
> -
> -		cec_msg_tuner_device_status(&msg, &tuner_dev_info);
> +		cec_msg_tuner_device_status(&msg, &node->state.tuner_dev_info);
>  		transmit(node, &msg);
>  		return;
>  	}
> @@ -128,6 +153,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		return;
>  
>  	case CEC_MSG_SELECT_ANALOGUE_SERVICE:
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
> +
> +		if (node->state.tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_REFUSED);
> +			return;
> +		}
> +		if (!analog_set_tuner_dev_info(node, &msg)) {
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
> +			return;
> +		}
> +		return;
> +
>  	case CEC_MSG_SELECT_DIGITAL_SERVICE:
>  	case CEC_MSG_TUNER_STEP_DECREMENT:
>  	case CEC_MSG_TUNER_STEP_INCREMENT:
> 

I think there is one more thing to do here: state_init() in cec-follower.cpp should
initialize node->state.tuner_dev_info with sane initial values.

It is probably best to have it call a analog_tuner_init() function in cec-tuner.cpp
since it will need to access the analog_freqs_khz table.

Regards,

	Hans
