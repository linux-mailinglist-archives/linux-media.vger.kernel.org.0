Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE2FC2E00
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 09:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732615AbfJAHNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 03:13:04 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:54883 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbfJAHND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 03:13:03 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FCLBiyrTDKKNGFCLEiSg5l; Tue, 01 Oct 2019 09:13:00 +0200
Subject: Re: [PATCH v4 2/3] cec-follower: add tuner step increment/decrement
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
 <20191001031823.312020-3-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <32aff389-a4c0-3f9a-73cf-a8c5def9ea29@xs4all.nl>
Date:   Tue, 1 Oct 2019 09:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001031823.312020-3-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN90AtSTh5o8xqumG4uAOYVRdQarhyVPo63C3GLZZIdMpuOEMGj7SKFQ4FBDP3fIJff/NIw06lP8CGZrCtuLINBabXogN4bOgp2wKtEIlW4ucoVz4fhJ
 UvRosneo4FbZRiGe8VRNAUT00/GoeP0+I69HleVs5OCKAtewrrzEv8yIrcaYoxdhWxidAtNfNH4vagGRZy2igWm2fpjnCye78jQnY99elCNHyiXaG4XFvLiu
 rvEGdDzoGZRjGA+2Ad171bXDrMW3HmKDsd+DkKvandU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 5:18 AM, Jiunn Chang wrote:
> Tuner step increment/decrement will select the next highest or next
> lowest service frequency.  There are a total of three possible
> frequencies given a broadcast type and system for a total of 81 analog
> channels.
> 
> Opcodes implemented:
>   - <Tuner Step Increment>
>   - <Tuner Step Decrement>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-follower/cec-follower.cpp |  2 +-
>  utils/cec-follower/cec-follower.h   |  3 +-
>  utils/cec-follower/cec-tuner.cpp    | 65 ++++++++++++++++++++++-------
>  3 files changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 4243fdd9..8375404e 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -298,7 +298,7 @@ void state_init(struct node &node)
>  	node.state.sac_active = false;
>  	node.state.volume = 50;
>  	node.state.mute = false;
> -	analog_tuner_init(&node.state.tuner_dev_info);
> +	analog_tuner_init(&node.state);
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index a53c16fe..d8ac4e77 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -52,6 +52,7 @@ struct state {
>  	unsigned rc_press_hold_count;
>  	unsigned rc_duration_sum;
>  	struct cec_op_tuner_device_info tuner_dev_info;
> +	unsigned int freq_idx;
>  };
>  
>  struct node {
> @@ -221,7 +222,7 @@ std::string opcode2s(const struct cec_msg *msg);
>  void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
>  
>  // cec-tuner.cpp
> -void analog_tuner_init(struct cec_op_tuner_device_info *tuner_dev_info);
> +void analog_tuner_init(struct state *state);
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
>  
>  // CEC processing
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index d74981b2..6f14b059 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -9,6 +9,8 @@
>  #include "cec-follower.h"
>  
>  #define NUM_ANALOG_FREQS	3
> +#define ARRAY_SIZE_ANA_FREQS(x) \
> +	ARRAY_SIZE(x) * ARRAY_SIZE(*x) * ARRAY_SIZE(**x)

This can be a bit easier:

#define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_khz[0][0][0]))

>  
>  /*
>   * This table contains analog television channel frequencies in KHz.  There are
> @@ -90,10 +92,12 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
>  	}
>  };
>  
> -void analog_tuner_init(struct cec_op_tuner_device_info *info)
> +void analog_tuner_init(struct state *state)
>  {
> +	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
>  	unsigned int freq_khz;
>  
> +	state->freq_idx = 0;
>  	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
>  	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
>  	info->is_analog = true;
> @@ -103,23 +107,41 @@ void analog_tuner_init(struct cec_op_tuner_device_info *info)
>  	info->analog.ana_freq = (freq_khz * 10) / 625;
>  }
>  
> -static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
> -                                            int ana_freq_khz)
> +static unsigned int analog_get_nearest_freq_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
> +						int ana_freq_khz)
>  {
>  	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
> +	unsigned int offset = 0;
>  
>  	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
>  		int freq = analog_freqs_khz[ana_bcast_type][ana_bcast_system][i];
>  
> -		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest))
> +		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest)) {
>  			nearest = freq;
> +			offset++;

This should be 'offset = i;'

> +		}
>  	}
> -	return nearest;
> +	return NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system) + offset;
>  }
>  
> -static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
> +static void analog_get_type_system_idx(struct node *node)

'get' implies that data is returned, and that's not the case here.

How about analog_update_tuner_dev_info(struct node *node, unsigned int idx);

So the index is passed as an argument and this function sets state.freq_idx as well.

>  {
>  	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +	unsigned int tot_freqs = NUM_ANALOG_FREQS * 9;
> +	unsigned int freq_idx = node->state.freq_idx;
> +	unsigned int freq_khz;
> +	unsigned int idx;
> +
> +	info->analog.ana_bcast_type = freq_idx / tot_freqs;
> +	info->analog.bcast_system =
> +		(freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
> +	idx = freq_idx % NUM_ANALOG_FREQS;
> +	freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][idx];
> +	info->analog.ana_freq = (freq_khz * 10) / 625;
> +}
> +
> +static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
> +{
>  	__u8 type;
>  	__u16 freq;
>  	__u8 system;
> @@ -127,11 +149,9 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	cec_ops_select_analogue_service(msg, &type, &freq, &system);
>  	if (type < 3 && system < 9) {
>  		int freq_khz = (freq * 625) / 10;
> -		unsigned int nearest = analog_get_nearest_freq(type, system,
> -							       freq_khz);
> -		info->analog.ana_bcast_type = type;
> -		info->analog.ana_freq = (nearest * 10) / 625;
> -		info->analog.bcast_system = system;
> +
> +		node->state.freq_idx = analog_get_nearest_freq_idx(type, system, freq_khz);
> +		analog_get_type_system_idx(node);
>  		return true;
>  	}
>  	return false;
> @@ -180,12 +200,29 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
> +		if (node->state.freq_idx == 0)
> +			node->state.freq_idx = ARRAY_SIZE_ANA_FREQS(analog_freqs_khz) - 1;
> +		else
> +			node->state.freq_idx--;
> +		analog_get_type_system_idx(node);
>  		return;
> +	}
>  
> +	case CEC_MSG_TUNER_STEP_INCREMENT: {
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
> +
> +		if (node->state.freq_idx == ARRAY_SIZE_ANA_FREQS(analog_freqs_khz) - 1)
> +			node->state.freq_idx = 0;
> +		else
> +			node->state.freq_idx++;
> +		analog_get_type_system_idx(node);
> +		return;
> +	}
>  
>  		/*
>  		  One Touch Record
> 

It's getting close...

Regards,

	Hans
