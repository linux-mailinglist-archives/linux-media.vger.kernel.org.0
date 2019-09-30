Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2224BC1E11
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 11:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbfI3JfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 05:35:15 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46351 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727884AbfI3JfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 05:35:14 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Es5Eid9l89D4hEs5HiLFjC; Mon, 30 Sep 2019 11:35:11 +0200
Subject: Re: [PATCH v3 2/3] cec-follower: add tuner step increment/decrement
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
 <20190930043017.474025-3-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fe38781f-fd08-3721-d8e6-b01dc00dd22d@xs4all.nl>
Date:   Mon, 30 Sep 2019 11:35:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930043017.474025-3-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD4RdoCQuN1u4HVuZeo11uWUSiDhKxDCslJPKA6/A2kHNuACldhqmXVRPvfdgeZg3jcL4TBR9xy1+Wgn94A5ju/H27amyXiBWe5btLfKRX0CtFIq9/Uu
 9JawAMkOjsicxYXuGcAbKe8V0XAdfEvpsSTXcUImBggImD6yS9XrjlqioxEizyBg1w6W99vqJsidyKHxGyYmv6iLoXiZN0N1deiSDVUCU0FmhlX89GoMQ/l8
 7rKh8VgSsFYzfFuVcrF6qfI4h6i9EysirZNbrybkZfE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/30/19 6:30 AM, Jiunn Chang wrote:
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
>  utils/cec-follower/cec-tuner.cpp    | 85 +++++++++++++++++++++++++----
>  3 files changed, 76 insertions(+), 14 deletions(-)
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
> index 2f6e3425..d3c6f9e8 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -90,8 +90,9 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
>  	}
>  };
>  
> -void analog_tuner_init(struct cec_op_tuner_device_info *info)
> +void analog_tuner_init(struct state *state)
>  {
> +	struct cec_op_tuner_device_info *info = &state->tuner_dev_info;
>  	unsigned int freq_khz =
>  		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
>  
> @@ -101,20 +102,24 @@ void analog_tuner_init(struct cec_op_tuner_device_info *info)
>  	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
>  	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
>  	info->analog.ana_freq = (freq_khz * 10) / 625;
> +	state->freq_idx = 18;

Hmm, see below.

>  }
>  
> -static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
> -                                            int ana_freq_khz)
> +static void analog_get_nearest_freq_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
> +					int ana_freq_khz, int *nearest, int *idx)

Why not have this function return 'unsigned int' containing the index?

And I see no reason why 'nearest' is in the argument list. AFAICT this can
be entirely local to this function.

>  {
> -	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
> +	*nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
> +	int offset = 0;
>  
>  	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
>  		int freq = analog_freqs_khz[ana_bcast_type][ana_bcast_system][i];
>  
> -		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest))
> -			nearest = freq;
> +		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - *nearest)) {
> +			*nearest = freq;
> +			offset++;
> +		}
>  	}
> -	return nearest;
> +	*idx = 18 + (NUM_ANALOG_FREQS * ((ana_bcast_type * 9) + ana_bcast_system)) + offset;

The value 18 is probably the offset for future digital channels. But since those are
not added yet in this patch series, this value is completely magical. Just start at
0, and make this change when support for digital channels is added.

>  }
>  
>  static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
> @@ -127,8 +132,11 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	cec_ops_select_analogue_service(msg, &type, &freq, &system);
>  	if (type < 3 && system < 9) {
>  		int freq_khz = (freq * 625) / 10;
> -		unsigned int nearest = analog_get_nearest_freq(type, system,
> -							       freq_khz);
> +		int idx;

unsigned int.

> +		int nearest;
> +
> +		analog_get_nearest_freq_idx(type, system, freq_khz, &nearest, &idx);
> +		node->state.freq_idx = idx;
>  		info->analog.ana_bcast_type = type;
>  		info->analog.ana_freq = (nearest * 10) / 625;
>  		info->analog.bcast_system = system;

Use analog_get_type_system_idx() to fill in these fields (see below for more info).

> @@ -137,6 +145,42 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	return false;
>  }
>  
> +static void analog_get_type_system_idx(unsigned int freq_idx, int *type, int *system, int *idx)
> +{
> +	int num_freqs = NUM_ANALOG_FREQS * 9;

Add empty line between variable declarations and code.

> +	*type = (freq_idx - 18) / num_freqs;
> +	*system = (freq_idx - (18 + num_freqs * *type)) / NUM_ANALOG_FREQS;
> +	*idx = freq_idx % NUM_ANALOG_FREQS;

The idx value is really not that interesting. Why not return the ana_freq value instead?

So this function would fill in the ana_bcast_type, ana_freq and bcast_system fields
based on the freq_idx.

> +}
> +
> +static void reset_tuner_dev_info(struct node *node)
> +{
> +	/*
> +	  There are a total of 18 digital and 81 analog indexes with digital
> +	  occurring before analog.  0-17 are digital and 18-98 are analog.
> +	 */

Just postpone mentioning digital until this is actually added.

Multiline comment blocks in the kernel coding style use:

/*
 *
 *
 */

> +
> +	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +
> +	if (node->state.freq_idx < 18) {
> +		// digital
> +		info->is_analog = false;
> +	} else {
> +		// analog
> +		int type;
> +		int system;
> +		int idx;
> +		int freq_khz;
> +
> +		analog_get_type_system_idx(node->state.freq_idx, &type, &system, &idx);
> +		info->is_analog = true;
> +		info->analog.ana_bcast_type = type;
> +		info->analog.bcast_system = system;
> +		freq_khz = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][idx];
> +		info->analog.ana_freq = (freq_khz * 10) / 625;
> +	}
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
> @@ -180,12 +224,29 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
> +		if (node->state.freq_idx == 18)
> +			node->state.freq_idx = 98;

'98' is a magic number: this should be a define instead using ARRAY_SIZE(analog_freqs_khz).

> +		else
> +			node->state.freq_idx--;
> +		reset_tuner_dev_info(node);
>  		return;
> +	}
>  
> +	case CEC_MSG_TUNER_STEP_INCREMENT: {
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
> +
> +		if (node->state.freq_idx == 98)
> +			node->state.freq_idx = 18;
> +		else
> +			node->state.freq_idx++;
> +		reset_tuner_dev_info(node);
> +		return;
> +	}
>  
>  		/*
>  		  One Touch Record
> 

Regards,

	Hans
