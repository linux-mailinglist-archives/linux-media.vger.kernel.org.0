Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0056DD5FA9
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 12:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731222AbfJNKEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 06:04:00 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52139 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730941AbfJNKEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 06:04:00 -0400
Received: from [IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d] ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JxCmiGD2kop0AJxCnidhYx; Mon, 14 Oct 2019 12:03:57 +0200
Subject: Re: [PATCH 6/8] cec-follower: add tuner digital service emulation
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
 <20191014041721.52025-7-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6430c3aa-ab0f-5e97-2b12-eac92d7b710d@xs4all.nl>
Date:   Mon, 14 Oct 2019 12:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014041721.52025-7-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLwZRoEQFn9e3IYlmB8fcWo3VknyGU0eXOp9aY6V1GqMLehHtkuVMtzUfgKEijfKuAhN11brt5GmlHx8RSFT4d7ZWGMqizxoQn9/RlN1Mm09S4iDbDiR
 DP0IBtFdGlEukE5LFJ3cXg7udvycsVzr57zo23igqFDTtitwEIibWdVyA96oZp0y2xXUgvDrAJ6AMwdXxc+K3hxNlJDH+duy67Ivs3aTVwGgjwOx/j1p25F/
 O0wYS9Vpc5xEQIGQT/wnHFgHZbPmzvUNIVfjL/F/rHtFI2522uFvX7h7jRuULDAuGBkcYenoSqYz12SV+zoD5EDeMm3a5/TWs+0c1Fi+QUfgt4HJHfPcRNZv
 YunCH6y7ruRgxvzZf5LwiczYa/f6EA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/14/19 6:17 AM, Jiunn Chang wrote:
> The cec-follower will now emulate a digital service.  This allows an
> initiator device can directly select a digital service by choosing a
> digital service ID method and broadcast system along with the proper
> digital IDs or channel data.  After a digital service is selected,
> the cec-follower will also provide the tuner device status upon
> request.
> 
> Opcodes implemented:
>   - <Select Digital Service>
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-follower/cec-tuner.cpp | 169 +++++++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 04e7e4c3..760eed2a 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -244,6 +244,162 @@ void analog_tuner_init(struct state *state)
>  	info->analog.ana_freq = (freq_khz * 10) / 625;
>  }
>  
> +static int digital_get_service_offset(struct cec_op_digital_service_id *digital)
> +{
> +	__u8 method = digital->service_id_method;
> +	struct cec_op_dvb_data *dvb = &digital->dvb;
> +	struct cec_op_atsc_data *atsc = &digital->atsc;
> +	struct cec_op_channel_data *channel = &digital->channel;
> +	unsigned int sys =
> +		(digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T ||
> +		 digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T ||
> +		 digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T) ? 1 : 0;
> +
> +	for (int i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +		switch (method) {
> +		case CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID:
> +			if (dvb->transport_id == digital_arib_data[sys][0][i].tsid &&
> +			    dvb->service_id == digital_arib_data[sys][0][i].sid &&
> +			    dvb->orig_network_id == digital_arib_data[sys][0][i].onid) {
> +				return (sys * NUM_DIGITAL_CHANS) + i;
> +			}
> +			if (atsc->transport_id == digital_atsc_data[sys][0][i].tsid &&
> +			    atsc->program_number == digital_atsc_data[sys][0][i].sid) {
> +				return (sys * NUM_DIGITAL_CHANS) + i;
> +			}
> +			if (dvb->transport_id == digital_dvb_data[sys][0][i].tsid &&
> +			    dvb->service_id == digital_dvb_data[sys][0][i].sid &&
> +			    dvb->orig_network_id == digital_dvb_data[sys][0][i].onid) {
> +				return (sys * NUM_DIGITAL_CHANS) + i;
> +			}
> +			break;
> +		case CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL:
> +			if (channel->minor == digital_arib_data[sys][0][i].minor) {
> +				return (sys * NUM_DIGITAL_CHANS) + i;
> +			}
> +			if (channel->major == digital_atsc_data[sys][0][i].major &&
> +			    channel->minor == digital_atsc_data[sys][0][i].minor) {
> +				return (sys * NUM_DIGITAL_CHANS) + i;
> +			}
> +			if (channel->minor == digital_dvb_data[sys][0][i].minor) {
> +				return (sys * NUM_DIGITAL_CHANS) + i;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +	return -1;
> +}
> +
> +static int digital_get_service_idx(struct cec_op_digital_service_id *digital)
> +{
> +	__u8 system = digital->dig_bcast_system;
> +	int offset = digital_get_service_offset(digital);
> +
> +	switch (system) {
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
> +		return offset;
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T: {
> +		return offset == -1 ? offset : NUM_DIGITAL_CHANS * 2 + offset;
> +	}
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T: {
> +		return offset == -1 ? offset : NUM_DIGITAL_CHANS * 4 + offset;
> +	}
> +	default:
> +		break;
> +	}
> +	return -1;
> +}

This makes no sense: how can you get the offset without first checking which
bcast system to use? You might get a match for e.g. ARIB when the given
bcast system is DVB.

This can be done much easier by something like this:

static int digital_get_service_idx(struct cec_op_digital_service_id *digital)
{
	struct service_info *info;
	bool is_terrestrial = false;
	unsigned offset, idx;

	switch (digital->dig_bcast_system) {
	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
		is_terrestrial = true;
		/* fall through */
	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
		info = &digital_arib_data[is_terrestrial][0];
		offset = is_terrestrial * NUM_DIGITAL_CHANS;
		break;
	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
		is_terrestrial = true;
		/* fall through */
	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
		info = &digital_atsc_data[is_terrestrial][0];
		offset = (2 + is_terrestrial) * NUM_DIGITAL_CHANS;
		break;
	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
		is_terrestrial = true;
		/* fall through */
	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
		info = &digital_dvb_data[is_terrestrial][0];
		offset = (4 + is_terrestrial) * NUM_DIGITAL_CHANS;
		break;
	default:
		return -1;
	}
	idx = digital_get_service_offset(info, digital);
	return idx >= 0 ? idx + offset : -1;
}

And digital_get_service_offset() checks the NUM_DIGITAL_CHANS
entries of the info pointer for a possible match and returns 0-2
as index.

> +
> +static void digital_update_tuner_dev_info(struct node *node, unsigned int idx,
> +					  __u8 method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID)

Why add ' = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID'? This function is always called with this
third argument, so there is no need for specifying a default value for method.

> +{
> +	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
> +	struct cec_op_digital_service_id *digital = &info->digital;
> +	struct cec_op_dvb_data *dvb = &digital->dvb;
> +	struct cec_op_atsc_data *atsc = &digital->atsc;

Also add a cec_op_arib_data *arib here.

> +	struct cec_op_channel_data *channel = &digital->channel;
> +	unsigned int tbl = idx / (NUM_DIGITAL_CHANS * 2);
> +	unsigned int sys = (idx % (NUM_DIGITAL_CHANS * 2)) / NUM_DIGITAL_CHANS;
> +	unsigned int offset = idx % NUM_DIGITAL_CHANS;
> +
> +	node->state.service_idx = idx;
> +	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_DIGITAL;
> +	info->is_analog = false;
> +	digital->service_id_method = method;

Ah, this is interesting, I hadn't thought about that.

When you ask a tuner device what the current service it, it will either use
the channel method or the digital ID method, but not both.

This means that the service ID method has to be something that needs to be specified
with an option to cec-follower.

This also leads to another question: if a tuner uses channels, can you still select
a digital service using the digital ID method, or vice versa? In my opinion I would
say that it is one or the other, but that you cannot mix them.

> +	switch (tbl) {
> +	case 0: {
> +		if (sys)
> +			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T;
> +		else
> +			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
> +		if (digital->service_id_method) {
> +			channel->channel_number_fmt = digital_arib_data[sys][0][offset].fmt;
> +			channel->major = digital_arib_data[sys][0][offset].major;
> +			channel->minor = digital_arib_data[sys][0][offset].minor;
> +		} else {
> +			dvb->transport_id = digital_arib_data[sys][0][offset].tsid;
> +			dvb->orig_network_id = digital_arib_data[sys][0][offset].onid;
> +			dvb->service_id = digital_arib_data[sys][0][offset].sid;

Use arib pointer.

> +		}
> +		break;
> +	}
> +	case 1: {
> +		if (sys)
> +			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T;
> +		else
> +			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT;
> +		if (digital->service_id_method) {
> +			channel->channel_number_fmt = digital_atsc_data[sys][0][offset].fmt;
> +			channel->major = digital_atsc_data[sys][0][offset].major;
> +			channel->minor = digital_atsc_data[sys][0][offset].minor;
> +		} else {
> +			atsc->transport_id = digital_atsc_data[sys][0][offset].tsid;
> +			atsc->program_number = digital_atsc_data[sys][0][offset].sid;
> +		}
> +		break;
> +	}
> +	case 2: {
> +		if (sys)
> +			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T;
> +		else
> +			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2;
> +		if (digital->service_id_method) {
> +			channel->channel_number_fmt = digital_dvb_data[sys][0][offset].fmt;
> +			channel->major = digital_dvb_data[sys][0][offset].major;
> +			channel->minor = digital_dvb_data[sys][0][offset].minor;
> +		} else {
> +			dvb->transport_id = digital_dvb_data[sys][0][offset].tsid;
> +			dvb->orig_network_id = digital_dvb_data[sys][0][offset].onid;
> +			dvb->service_id = digital_dvb_data[sys][0][offset].sid;
> +		}
> +		break;
> +	}
> +	default:
> +		break;
> +	}
> +}
> +
> +static bool digital_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
> +{
> +	struct cec_op_digital_service_id digital = {};
> +	__u8 method;
> +	int idx;
> +
> +	cec_ops_select_digital_service(msg, &digital);
> +	method = digital.service_id_method;
> +	idx = digital_get_service_idx(&digital);
> +	if (idx > -1) {
> +		digital_update_tuner_dev_info(node, idx, method);
> +		return true;
> +	}
> +	return false;
> +}
> +
>  static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
>  						   int ana_freq_khz)
>  {
> @@ -340,6 +496,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		return;
>  
>  	case CEC_MSG_SELECT_DIGITAL_SERVICE:
> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
> +			break;
> +
> +		if (node->state.tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_REFUSED);
> +			return;
> +		}
> +		if (!digital_set_tuner_dev_info(node, &msg)) {
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
> +			return;
> +		}
> +		return;
> +
>  	case CEC_MSG_TUNER_STEP_DECREMENT: {
>  		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>  			break;
> 

Regards,

	Hans
