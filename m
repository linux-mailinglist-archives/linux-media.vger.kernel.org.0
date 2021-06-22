Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706703B0932
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 17:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhFVPg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 11:36:28 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:46555 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231964AbhFVPg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 11:36:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id viPflkQUdhqltviPilLP6V; Tue, 22 Jun 2021 17:34:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624376050; bh=gSSE/fLfI1ejPnE86IaZK8sJwbdWDjg3sLcaw/MPeKs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KQgdbqVyXuBW8okkXzttrdK7d/yJbjYByxqcIsA3NM2bb9DES/aWArXRzFgdYT5jx
         LZg5vjHe08r/e2NY0T2ao/PasJRNG0gwQRP4KjVhKjOUxModYyuZ8WBqns+rDnK3f3
         cbgZLLiOFB2/jKnD72g+NS9IRdgdfGb0stRIMvg54XQaMfpY8PiaJd3RG6ep1gdSz/
         YCPPrKdkalejj/6Fu2P3sKbPPK057DX/AdfENvaP6bZ0oLLbTMt/Ubct9FRH+eDYGY
         M1qTwi3kPm8zUVN6ioJjFvnjl1zBdvEK+ASjtW0KCNCp1qZ5xOs7sDwjDOZeFufwyt
         DAoJq8PbQQfIQ==
Subject: Re: [PATCH v3 2/3] cec: expand One Touch Record On/Off tests
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1624336366.git.deborahbrouwer3563@gmail.com>
 <2ba6c2ae5a132910fb166dddd244118fe59cc308.1624336366.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d8ccb7fc-0c05-41e9-b3db-090ce645aba3@xs4all.nl>
Date:   Tue, 22 Jun 2021 17:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2ba6c2ae5a132910fb166dddd244118fe59cc308.1624336366.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOmXDBE3qlc75UBGqSfk1ajPX9C9TkYWuzKzyAcZOpEAtB82+aDpWoP5gGr7byQdo5AogVDBPeJjKcFUihgOG6etVWHfhUGAfIShawnc7lnoVvVJIdw+
 qf/2qKmBf243MTUNGGwYjQOZRz/nj6M/5G66bezIC0FWihg860FjkWclpMNgN50hJ/JAMr01Tj5iKhBFeiC7l8PVmO0dZY9h1ucJSM/tvDNc+lPG3ImOJ8TD
 j8sv7lc6pIiXN3t+O4AMY5qJgE3pwQGhBof3iwMeGiQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/06/2021 06:36, Deborah Brouwer wrote:
> Send all Record On source operands and check that the follower responds
> with a corresponding Record Status. Send invalid Record On operands and
> check that the follower returns Feature Abort with Invalid Operand or
> Record Status indicating why the recording has failed.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.h |   5 +
>  utils/cec-compliance/cec-test.cpp     | 157 ++++++++++++++++++++++++--
>  utils/cec-follower/cec-follower.cpp   |   1 +
>  utils/cec-follower/cec-follower.h     |   3 +-
>  utils/cec-follower/cec-processing.cpp |   7 +-
>  utils/cec-follower/cec-tuner.cpp      | 101 ++++++++++++++++-
>  6 files changed, 255 insertions(+), 19 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index 818181ab..d6c11d70 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -331,6 +331,11 @@ static inline bool is_playback_or_rec(unsigned la)
>  	return cec_has_playback(1 << la) || cec_has_record(1 << la);
>  }
>  
> +static inline bool is_record(unsigned la, unsigned prim_type)
> +{
> +	return cec_has_record(1 << la) || (cec_has_backup(1 << la) && prim_type == CEC_OP_PRIM_DEVTYPE_RECORD);
> +}
> +
>  static inline bool cec_msg_status_is_abort(const struct cec_msg *msg)
>  {
>  	return msg->rx_status & CEC_RX_STATUS_FEATURE_ABORT;
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 2ea1b712..4712f993 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -48,6 +48,45 @@ static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play
>  	return OK;
>  }
>  
> +static int one_touch_rec_on_send(struct node *node, unsigned me, unsigned la, const struct cec_op_record_src &rec_src, __u8 &rec_status)

This line is too long, add a line break after the la argument.

> +{
> +	struct cec_msg msg;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_off(&msg, false);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on(&msg, true, &rec_src);
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	cec_ops_record_status(&msg, &rec_status);
> +
> +	return OK;
> +}
> +
> +static bool one_touch_rec_status_not_shared(__u8 rec_status)
> +{
> +	switch (rec_status) {
> +	case CEC_OP_RECORD_STATUS_UNSUP_CA:
> +	case CEC_OP_RECORD_STATUS_NO_CA_ENTITLEMENTS:
> +	case CEC_OP_RECORD_STATUS_CANT_COPY_SRC:
> +	case CEC_OP_RECORD_STATUS_NO_MORE_COPIES:
> +	case CEC_OP_RECORD_STATUS_NO_MEDIA:
> +	case CEC_OP_RECORD_STATUS_PLAYING:
> +	case CEC_OP_RECORD_STATUS_ALREADY_RECORDING:
> +	case CEC_OP_RECORD_STATUS_MEDIA_PROT:
> +	case CEC_OP_RECORD_STATUS_NO_SIGNAL:
> +	case CEC_OP_RECORD_STATUS_MEDIA_PROBLEM:
> +	case CEC_OP_RECORD_STATUS_NO_SPACE:
> +	case CEC_OP_RECORD_STATUS_PARENTAL_LOCK:
> +	case CEC_OP_RECORD_STATUS_OTHER:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
>  /* System Information */
>  
>  int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1216,27 +1255,116 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
>  
>  static int one_touch_rec_on(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/*
> -	  TODO: Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
> -	  checked for.
> -	 */
>  	struct cec_msg msg;
>  	struct cec_op_record_src rec_src = {};
>  
>  	rec_src.type = CEC_OP_RECORD_SRC_OWN;
>  	cec_msg_init(&msg, me, la);
>  	cec_msg_record_on(&msg, true, &rec_src);
> -	fail_on_test(!transmit_timeout(node, &msg));
> +	/* Allow 10s for reply because specs say it may take several seconds to accurately respond. */

specs -> the spec

There is only on spec, so singular.

> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
>  	fail_on_test(timed_out(&msg));
> -	fail_on_test(cec_has_record(1 << la) && unrecognized_op(&msg));
> -	if (unrecognized_op(&msg))
> +	if (unrecognized_op(&msg)) {
> +		fail_on_test(is_record(la, node->remote[la].prim_type));
>  		return OK_NOT_SUPPORTED;
> +	}
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
>  
> -	return 0;
> +	__u8 rec_status;
> +
> +	cec_ops_record_status(&msg, &rec_status);
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_CUR_SRC &&
> +	             one_touch_rec_status_not_shared(rec_status));

As discussed in irc I suggest something like this:

	if (rec_status != CEC_OP_RECORD_STATUS_CUR_SRC)
		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));

I.e., if it did not start recording with the current source, then check if
the status is a valid error, otherwise something strange happened and that should
be marked as a failure.

> +
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_DIG_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&

I wouldn't test for these error cases, just add that to rec_status_is_a_valid_error_status().

> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_ANA_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_ANA_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&

Ditto.

> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	rec_src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
> +	rec_src.ext_plug.plug = 1;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT &&
> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_EXT_PHYS_ADDR;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT &&
> +	             rec_status != CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR &&
> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	return OK;
> +}
> +
> +static int one_touch_rec_on_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	struct cec_msg msg;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on_own(&msg);
> +	msg.msg[2] = 0;  /* Invalid source operand */
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));

Reacting to invalid operands shouldn't take 10 seconds, just use the default timeout.
Same below.

> +	if (unrecognized_op(&msg))
> +		return OK_NOT_SUPPORTED;
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on_own(&msg);
> +	msg.msg[2] = 6;  /* Invalid source operand */
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	if (unrecognized_op(&msg))
> +		return OK_NOT_SUPPORTED;
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	struct cec_op_record_src rec_src = {};
> +	__u8 rec_status;
> +
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = 3; /* Invalid digital broadcast system */
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));

Shouldn't this feature abort with invalid op? This looks weird. Same below.

> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_NO_DIG_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = 3; /* Invalid analog broadcast type */
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_NO_ANA_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
> +	rec_src.analog.bcast_system = 9; /* Invalid analog broadcast system */
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_NO_ANA_SERVICE &&
> +	             rec_status != CEC_OP_RECORD_STATUS_NO_SERVICE &&
> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
> +	rec_src.ext_plug.plug = 0; /* Invalid plug */
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_INVALID_EXT_PLUG &&
> +	             one_touch_rec_status_not_shared(rec_status));
> +
> +	return OK;
>  }
>  
>  static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1261,8 +1389,17 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
>  
>  static const vec_remote_subtests one_touch_rec_subtests{
>  	{ "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
> -	{ "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
> -	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
> +	{
> +		"Record On",
> +		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
> +		one_touch_rec_on,
> +	},
> +	{
> +		"Record On Invalid Operand",
> +		CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP,
> +		one_touch_rec_on_invalid,
> +	},
> +	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_BACKUP, one_touch_rec_off },
>  };
>  
>  /* Timer Programming */
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index ff47d698..482192e7 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -317,6 +317,7 @@ void state_init(struct node &node)
>  	node.state.deck_report_changes_to = 0;
>  	node.state.deck_state = CEC_OP_DECK_INFO_STOP;
>  	node.state.deck_skip_start = 0;
> +	node.state.one_touch_record_on = false;
>  	tuner_dev_info_init(&node.state);
>  	node.state.last_aud_rate_rx_ts = 0;
>  }
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 3fa95417..8e8877d7 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -53,6 +53,7 @@ struct state {
>  	__u8 deck_report_changes_to;
>  	__u8 deck_state;
>  	__u64 deck_skip_start;
> +	bool one_touch_record_on;
>  	time_t toggle_power_status;
>  	__u64 last_aud_rate_rx_ts;
>  };
> @@ -222,7 +223,7 @@ void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
>  
>  // cec-tuner.cpp
>  void tuner_dev_info_init(struct state *state);
> -void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
> +void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me, __u8 type);
>  
>  // CEC processing
>  void reply_feature_abort(struct node *node, struct cec_msg *msg,
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 41bb990c..b1c8f3d9 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -271,7 +271,7 @@ static void update_deck_state(struct node *node, unsigned me, __u8 deck_state_ne
>  	}
>  }
>  
> -static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
> +static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8 type)

Adding the type argument and wiring it up to process_tuner_record_timer_msgs() should
be done in a separate patch. It's not related to the record tests as such.

>  {
>  	__u8 to = cec_msg_destination(&msg);
>  	__u8 from = cec_msg_initiator(&msg);
> @@ -672,7 +672,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  	case CEC_MSG_SET_TIMER_PROGRAM_TITLE:
>  	case CEC_MSG_TIMER_CLEARED_STATUS:
>  	case CEC_MSG_TIMER_STATUS:
> -		process_tuner_record_timer_msgs(node, msg, me);
> +		process_tuner_record_timer_msgs(node, msg, me, type);
>  		return;
>  
>  		/* Dynamic Auto Lipsync */
> @@ -1009,6 +1009,7 @@ void testProcessing(struct node *node, bool wallclock)
>  	doioctl(node, CEC_S_MODE, &mode);
>  	doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
>  	me = laddrs.log_addr[0];
> +	__u8 type = laddrs.log_addr_type[0];
>  
>  	poll_remote_devs(node, me);
>  
> @@ -1088,7 +1089,7 @@ void testProcessing(struct node *node, bool wallclock)
>  					       msg.sequence, ts2s(msg.rx_ts, wallclock).c_str());
>  			}
>  			if (node->adap_la_mask)
> -				processMsg(node, msg, me);
> +				processMsg(node, msg, me, type);
>  		}
>  
>  		__u8 pwr_state = current_power_state(node);
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index fd11bd10..c6dd47f0 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -482,7 +482,47 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	return false;
>  }
>  
> -void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
> +bool digital_service_info_valid(const struct cec_op_record_src &rec_src)

Can this be a static function? It's only used in this source, so I think t should be.
Ditto for the similar bool functions below.

> +{
> +	if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +

Drop this newline.

> +		switch (rec_src.digital.dig_bcast_system) {
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
> +		case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
> +			break;
> +		default:
> +			return false;
> +		}
> +	}
> +	//To do: check digital_arib_data, digital_atsc_data and digital_dvb_data
> +	return true;
> +}
> +
> +bool analog_service_info_valid(const cec_op_record_src &rec_src)
> +{
> +	if (rec_src.analog.ana_bcast_type > CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL)
> +		return false;
> +
> +	if(rec_src.analog.bcast_system > CEC_OP_BCAST_SYSTEM_PAL_DK &&
> +	   rec_src.analog.bcast_system != CEC_OP_BCAST_SYSTEM_OTHER)
> +		return false;
> +
> +	//To do: check analog valid channels analog_freqs_khz
> +	return true;
> +}
> +
> +void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me, __u8 type)
>  {
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
>  
> @@ -605,19 +645,70 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		transmit(node, &msg);
>  		return;
>  	}
> -	case CEC_MSG_RECORD_ON:
> -		if (!cec_has_record(1 << me))
> +	case CEC_MSG_RECORD_ON: {
> +		if (type != CEC_LOG_ADDR_TYPE_RECORD)
> +			break;
> +
> +		__u8 rec_status;
> +		bool start_recording = false;
> +		struct cec_op_record_src rec_src = {};
> +
> +		cec_ops_record_on(&msg, &rec_src);
> +
> +		switch (rec_src.type) {
> +		case CEC_OP_RECORD_SRC_OWN:
> +			rec_status = CEC_OP_RECORD_STATUS_CUR_SRC;
> +			start_recording = true;
> +			break;
> +		case CEC_OP_RECORD_SRC_DIGITAL:
> +			if (digital_service_info_valid(rec_src)) {
> +				rec_status = CEC_OP_RECORD_STATUS_DIG_SERVICE;
> +				start_recording = true;
> +			} else {
> +				rec_status = CEC_OP_RECORD_STATUS_NO_DIG_SERVICE;

Huh? Shouldn't this feature abort with invalid op? Since you provide invalid data here.

> +			}
> +			break;
> +		case CEC_OP_RECORD_SRC_ANALOG:
> +			if (analog_service_info_valid(rec_src)) {
> +				rec_status = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +				start_recording = true;
> +			} else {
> +				rec_status = CEC_OP_RECORD_STATUS_NO_ANA_SERVICE;
> +			}
> +			break;
> +		case CEC_OP_RECORD_SRC_EXT_PLUG:
> +			/* Plug number range is 1-255 in specs, but a realistic range of connectors is 6. */
> +			if (rec_src.ext_plug.plug < 1 || rec_src.ext_plug.plug > 6) {
> +				rec_status = CEC_OP_RECORD_STATUS_INVALID_EXT_PLUG;
> +			} else {
> +				rec_status = CEC_OP_RECORD_STATUS_EXT_INPUT;
> +				start_recording = true;
> +			}
> +			break;
> +		case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
> +			rec_status = CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR;
>  			break;
> +		default:
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
> +			return;
> +		}
> +		if (node->state.one_touch_record_on)
> +			rec_status = CEC_OP_RECORD_STATUS_ALREADY_RECORDING;
>  		cec_msg_set_reply_to(&msg, &msg);
> -		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_CUR_SRC);
> +		cec_msg_record_status(&msg, rec_status);
>  		transmit(node, &msg);
> +		if (start_recording)
> +			node->state.one_touch_record_on = true;
>  		return;
> +	}
>  	case CEC_MSG_RECORD_OFF:
> -		if (!cec_has_record(1 << me))
> +		if (type != CEC_LOG_ADDR_TYPE_RECORD)
>  			break;
> +
>  		cec_msg_set_reply_to(&msg, &msg);
>  		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
>  		transmit(node, &msg);
> +		node->state.one_touch_record_on = false;
>  		return;
>  	case CEC_MSG_RECORD_STATUS:
>  		return;
> 

Regards,

	Hans
