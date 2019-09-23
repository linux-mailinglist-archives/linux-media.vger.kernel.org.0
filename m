Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E98BB010
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 10:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731860AbfIWI4m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 04:56:42 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47841 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729422AbfIWI4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 04:56:42 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CK95ivZGMKKNGCK99ikXvL; Mon, 23 Sep 2019 10:56:39 +0200
Subject: Re: [PATCH v7] cec-follower: add tuner analog service emulation
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190920193236.217671-1-c0d1n61at3@gmail.com>
 <20190920211752.310836-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <40a3a638-b328-5efd-4296-d8c1b031a9a5@xs4all.nl>
Date:   Mon, 23 Sep 2019 10:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920211752.310836-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGBTsKeDb4tMO7B+/qHU7KtTtkDkXHFYSVqmyHgKuKju1LkRVvybPcqyNKcMLiPx1Msp4Itekpe/EqBOq04md0ztp7/xqjG2DC9HLPcrniahdwFkVwLV
 Ce9UpppjuJw5wkxlrx7IAtcmpV6f3csKFFGudUejuJGXZPAVX8oKOJT10Jk7ycBMSTOwmWcn1CWxppx3W36dG49ZoIH6Jg2DdxOWd06T6GoWgN8tLLr+dDtB
 zWnlW0HU/lqEQ+t6XXl0XRig+uq8bav5HPMd7ZoH/PQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/20/19 11:17 PM, Jiunn Chang wrote:
> The cec-follower will now emulate an analog service.  This allows an
> initiator device can directly select an analog service by choosing an
> analog broadcast type, broadcast system, and frequency. After an analog
> service is selected, the cec-follower will also provide the tuner device
> status upon request.
> 
> Opcodes implemented:
>   - <Select Analogue Service>
>   - <Give Tuner Device Status>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
> 
> Changes made since v6:
>   - Add more information to commit message
> 
> Changes made since v5:
>   - Add analog_tuner_init() to cec-tuner.cpp
>   - Change state_init() in cec-follower.cpp to use analog_tuner_init()
>   - Rename function to analog_get_nearest_freq()
>   - Change analog_get_nearest_freq() to only return freq in Khz
>   - Change analog_set_tuner_dev_info() to set analog freq too
> 
> Changes made since v4:
>   - Remove int casting in abs()
>   - Add temp variables: info, freq to make code easier to read
>   - Use NUM_ANALOG_FREQS macro
> 
> Changes made since v3:
>   - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp
> 
> Changes made since v2:
>   - Fix typos/bugs
>   - Use state from node in cec-follower.h
>   - Rename functions to analog_ prefix
> 
> Changes made since v1:
>   - Fix typos/bugs
>   - Import reply_feature_abort() from cec-processing.cpp
>   - Add functionality to choose nearest frequency
> 
> ---
>  utils/cec-follower/cec-follower.cpp |  1 +
>  utils/cec-follower/cec-follower.h   |  2 +
>  utils/cec-follower/cec-tuner.cpp    | 73 ++++++++++++++++++++++++-----
>  3 files changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index dca0f627..4243fdd9 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -298,6 +298,7 @@ void state_init(struct node &node)
>  	node.state.sac_active = false;
>  	node.state.volume = 50;
>  	node.state.mute = false;
> +	analog_tuner_init(&node.state.tuner_dev_info);
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 954e001f..a53c16fe 100644
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
> @@ -220,6 +221,7 @@ std::string opcode2s(const struct cec_msg *msg);
>  void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
>  
>  // cec-tuner.cpp
> +void analog_tuner_init(struct cec_op_tuner_device_info *tuner_dev_info);
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
>  
>  // CEC processing
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index bdeda342..68d945d5 100644
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
> @@ -89,6 +90,51 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
>  	}
>  };
>  
> +void analog_tuner_init(struct cec_op_tuner_device_info *info)
> +{
> +	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
> +	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
> +	info->is_analog = true;
> +	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
> +	info->analog.ana_freq =
> +		analog_freqs_khz[CEC_OP_ANA_BCAST_TYPE_CABLE][CEC_OP_BCAST_SYSTEM_PAL_BG][0];
> +	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;

Set bcast_system before setting ana_freq, and when you set ana_freq use the
analog.ana_bcast_type and analog.bcast_system as indices.

That way you avoid the case where in the future someone changes e.g. ana_bcast_type
but forgets to update the index in the ana_freq assignment as well.

It's a little thing, but it makes for more robust programs.

> +}
> +
> +static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
> +                                            int ana_freq_khz)
> +{
> +	int nearest = analog_freqs_khz[ana_bcast_type][ana_bcast_system][0];
> +
> +	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
> +		int freq = analog_freqs_khz[ana_bcast_type][ana_bcast_system][i];
> +
> +		if (abs(ana_freq_khz - freq) < abs(ana_freq_khz - nearest))
> +			nearest = freq;
> +	}
> +	return nearest;
> +}
> +
> +static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
> +{
> +	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +	__u8 type = 0;
> +	__u16 freq = 0;
> +	__u8 system = 0;

No need to zero these three variables. cec_ops_select_analogue_service will always
overwrite them.

> +
> +	cec_ops_select_analogue_service(msg, &type, &freq, &system);
> +	if (info->analog.ana_bcast_type < 3 && info->analog.bcast_system < 9) {
> +		int freq_khz = (freq * 625) / 10;
> +		unsigned int nearest = analog_get_nearest_freq(type, system,
> +							       freq_khz);

Add empty line between variable declarations and the following code.

> +		info->analog.ana_bcast_type = type;
> +		info->analog.ana_freq = (nearest * 10) / 625;
> +		info->analog.bcast_system = system;
> +		return true;
> +	}
> +	return false;
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
> @@ -105,21 +151,11 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
> @@ -128,6 +164,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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

Regards,

	Hans
