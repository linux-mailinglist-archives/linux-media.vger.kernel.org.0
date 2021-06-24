Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43633B29C9
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 09:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhFXH77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 03:59:59 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52893 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231630AbhFXH77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 03:59:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id wKExlwtS4ZxD2wKF0lyBOn; Thu, 24 Jun 2021 09:57:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624521459; bh=nSdDsPD0zNN43aj2widDU98b1/7Qe5l5Pz5AZmv/cGo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X9MRt0GAKA1bMHK2RA+KUltltezeFmFpPlRQlmJx+Cgj1fFECF4mBJdxhRZcEZgzO
         OW09LRP6pg3fPbY2Cj2/W4A/ZJKwC2EKqt2LkQgI0DlyhOigp84he4NC74cC687TyH
         BoJ6ImsVzDR1f5yLYuMfZo61mSiDwAEvI8Y2+chQlAYQLF4mspO5n6n9BEuIls0Dd9
         F4QUmKyoeej1Zg+BpY1/EqyT5X8SovoyGeMNUg8gZp4pR4D7TnuOeREYVzbj4ltojM
         +VySr77xDZMJasdazPDupnYcFi65jBZTD3NyIbp46v8FfsIo++NcLR7c6vuDLcvGFW
         3lZ2GBPqDxR7w==
Subject: Re: [PATCH v4 2/3] cec: expand One Touch Record tests
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1624506445.git.deborahbrouwer3563@gmail.com>
 <a278444457e148d39318bb3eb51fc097b61316aa.1624506445.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <45e2b172-b475-5360-b231-ff9b3a993855@xs4all.nl>
Date:   Thu, 24 Jun 2021 09:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a278444457e148d39318bb3eb51fc097b61316aa.1624506445.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHT1UEVuPiqH0e+o+gMto4An+gJWGr/X9DXKl+HOIKcxXBPkyxbwkb85rNxUyUvVneGTnbf3y1ymay30O+PNwHCG41+cUL4Q81jxuArPtZwVlmmZELoX
 5QDi3IPgiXkX9EcWcqivDvIyhOXWBdyfVl4e/llqX6CqYCUcVw7IMID/cNlGbD/UsJ2x+POPnLaYLRxVQR4dq5Vav1j2eHPNPd1kGz6fAowErSUjgXTAY+JH
 b8twNbwCP+KSxGUgJHxI6vFZSWj3cdENGCYUT3MxfME=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2021 06:06, Deborah Brouwer wrote:
> Expand the One Touch Record tests so that the follower and initiator know
> their local and remote device types and respond accordingly. Send Record
> TV Screen and check that Record On source replies are valid. Send Record
> On source messages and check that Record Status replies are valid. Send
> Record Off and check that the recording terminates.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp |   1 +
>  utils/cec-compliance/cec-compliance.h   |   1 +
>  utils/cec-compliance/cec-test.cpp       | 366 ++++++++++++++++++++++--
>  utils/cec-follower/cec-follower.cpp     |   1 +
>  utils/cec-follower/cec-follower.h       |   3 +-
>  utils/cec-follower/cec-processing.cpp   |   4 +-
>  utils/cec-follower/cec-tuner.cpp        | 222 ++++++++++++--
>  7 files changed, 549 insertions(+), 49 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
> index c04904c2..d4b12298 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -1236,6 +1236,7 @@ int main(int argc, char **argv)
>  	node.num_log_addrs = laddrs.num_log_addrs;
>  	memcpy(node.log_addr, laddrs.log_addr, laddrs.num_log_addrs);
>  	node.adap_la_mask = laddrs.log_addr_mask;
> +	node.prim_devtype = laddrs.primary_device_type[0];
>  
>  	printf("Find remote devices:\n");
>  	printf("\tPolling: %s\n", ok(poll_remote_devs(&node)));
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index 818181ab..41e2d63d 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -166,6 +166,7 @@ struct node {
>  	struct remote remote[16];
>  	__u16 phys_addr;
>  	bool in_standby;
> +	__u8 prim_devtype;
>  };
>  
>  struct remote_subtest {
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 40d8369d..864ab83c 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -48,6 +48,69 @@ static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play
>  	return OK;
>  }
>  
> +static int one_touch_rec_on_send(struct node *node, unsigned me, unsigned la,
> +                                 const struct cec_op_record_src &rec_src, __u8 &rec_status)
> +{
> +	struct cec_msg msg;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_off(&msg, false);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on(&msg, true, &rec_src);

Add a comment here why you need a 10000 ms timeout.

> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	fail_on_test(timed_out_or_abort(&msg));
> +	cec_ops_record_status(&msg, &rec_status);
> +
> +	return OK;
> +}
> +
> +static int one_touch_rec_on_send_invalid(struct node *node, unsigned me, unsigned la,
> +                                         const struct cec_op_record_src &rec_src)
> +{
> +	struct cec_msg msg;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on(&msg, true, &rec_src);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	return OK;
> +}
> +
> +/*
> + * Returns true if the Record Status is an error and the request

I would rephrase this to: ...is an error indicating that the request...

> + * to start recording has failed.
> + */
> +static bool rec_status_is_a_valid_error_status(__u8 rec_status)
> +{
> +	switch (rec_status) {
> +	case CEC_OP_RECORD_STATUS_NO_DIG_SERVICE:
> +	case CEC_OP_RECORD_STATUS_NO_ANA_SERVICE:
> +	case CEC_OP_RECORD_STATUS_NO_SERVICE:
> +	case CEC_OP_RECORD_STATUS_INVALID_EXT_PLUG:
> +	case CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR:
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
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /* System Information */
>  
>  int system_info_polling(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1141,24 +1204,14 @@ static const vec_remote_subtests tuner_ctl_subtests{
>  
>  /* One Touch Record */
>  
> -/*
> -  TODO: These are very rudimentary tests which should be expanded.
> -
> -  - The HDMI CEC 1.4b spec details that Standby shall not be acted upon while the
> -    device is recording, but it should remember that it received Standby.
> - */
> -
>  static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
> -	/*
> -	  TODO:
> -	  - Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
> -	    checked for.
> -	  - The TV should ignore this message when received from other LA than Recording or
> -	    Reserved.
> -	 */
>  	struct cec_msg msg;
>  
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_report_physical_addr(&msg, node->phys_addr, node->prim_devtype);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
>  	cec_msg_init(&msg, me, la);
>  	cec_msg_record_tv_screen(&msg, true);
>  	fail_on_test(!transmit_timeout(node, &msg));
> @@ -1172,45 +1225,283 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
> +	/* Follower should ignore this message if it is not sent by a recording device */
> +	if (node->prim_devtype != CEC_OP_PRIM_DEVTYPE_RECORD) {
> +		fail_on_test(!timed_out(&msg));
> +		return OK;
> +	}
> +	fail_on_test(timed_out(&msg));
>  
> -	return 0;
> +	struct cec_op_record_src rec_src = {};
> +
> +	cec_ops_record_on(&msg, &rec_src);
> +
> +	if (rec_src.type < CEC_OP_RECORD_SRC_OWN || rec_src.type > CEC_OP_RECORD_SRC_EXT_PHYS_ADDR)
> +		return fail("Invalid source.\n");

I would use the normal fail_on_test for this.

> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL &&
> +	    rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
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
> +			return fail("Invalid digital service broadcast system operand.\n");
> +		}
> +	}
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_ANALOG) {
> +		fail_on_test(rec_src.analog.ana_bcast_type > CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL);
> +		fail_on_test(rec_src.analog.bcast_system > CEC_OP_BCAST_SYSTEM_PAL_DK &&
> +		             rec_src.analog.bcast_system != CEC_OP_BCAST_SYSTEM_OTHER);
> +		fail_on_test(rec_src.analog.ana_freq == 0 || rec_src.analog.ana_freq == 0xffff);
> +	}
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_EXT_PLUG)
> +		fail_on_test(rec_src.ext_plug.plug == 0);
> +
> +	return OK;
>  }
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
> +	/* Allow 10s for reply because the spec says it may take several seconds to accurately respond. */
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
>  	fail_on_test(timed_out(&msg));
> -	fail_on_test(cec_has_record(1 << la) && unrecognized_op(&msg));
> -	if (unrecognized_op(&msg))
> +	if (unrecognized_op(&msg)) {
> +		fail_on_test(node->remote[la].prim_type == CEC_OP_PRIM_DEVTYPE_RECORD);
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
> +	if (rec_status != CEC_OP_RECORD_STATUS_CUR_SRC)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +

Add a comment here stating that these digital services are taken from the
cec-follower tuner emulation.

I would also order these tests by broadcast system: so first test the ARIB variants,
then ATSC, then DVB.

> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
> +	rec_src.digital.arib.transport_id = 1046;
> +	rec_src.digital.arib.service_id = 30505;
> +	rec_src.digital.arib.orig_network_id = 1;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T;
> +	rec_src.digital.atsc.transport_id = 1675;
> +	rec_src.digital.atsc.program_number = 3;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2;
> +	rec_src.digital.dvb.transport_id = 61;
> +	rec_src.digital.dvb.service_id = 7193;
> +	rec_src.digital.dvb.orig_network_id = 70;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T;
> +	rec_src.digital.channel.channel_number_fmt = 1;
> +	rec_src.digital.channel.major = 0;
> +	rec_src.digital.channel.minor = 51992;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT;
> +	rec_src.digital.channel.channel_number_fmt = 2;
> +	rec_src.digital.channel.major = 3;
> +	rec_src.digital.channel.minor = 55295;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T;
> +	rec_src.digital.channel.channel_number_fmt = 1;
> +	rec_src.digital.channel.major = 0;
> +	rec_src.digital.channel.minor = 21;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +

Add a comment here as well, mentioning that these channels are based on what
the cec-follower emulates.

> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
> +	rec_src.analog.ana_freq = (471250 * 10) / 625;
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_ANA_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_SATELLITE;
> +	rec_src.analog.ana_freq = (551250 * 10) / 625;
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_SECAM_BG;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_ANA_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL;
> +	rec_src.analog.ana_freq = (185250 * 10) / 625;
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_DK;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_ANA_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
> +	rec_src.ext_plug.plug = 1;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_EXT_PHYS_ADDR;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_EXT_INPUT)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	return OK;
>  }
>  
> -static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int one_touch_rec_on_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_record_off(&msg, false);
> +	cec_msg_record_on_own(&msg);
> +	msg.msg[2] = 0;  /* Invalid source operand */
>  	fail_on_test(!transmit_timeout(node, &msg));
> -	fail_on_test(cec_has_record(1 << la) && unrecognized_op(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_on_own(&msg);
> +	msg.msg[2] = 6;  /* Invalid source operand */
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	struct cec_op_record_src rec_src = {};
> +
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> +	rec_src.digital.dig_bcast_system = 0x7f; /* Invalid digital service broadcast system */
> +	rec_src.digital.channel.channel_number_fmt = 1;
> +	rec_src.digital.channel.major = 0;
> +	rec_src.digital.channel.minor = 30203;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT;
> +	rec_src.digital.atsc.transport_id = 0; /* Invalid transport id */
> +	rec_src.digital.atsc.program_number = 50316;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T;
> +	rec_src.digital.dvb.transport_id = 1004;
> +	rec_src.digital.dvb.service_id = 0; /* Invalid service id */
> +	rec_src.digital.dvb.orig_network_id = 8945;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = 0xff; /* Invalid analog broadcast type */
> +	rec_src.analog.ana_freq = (519250 * 10) / 625;
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL;
> +	rec_src.analog.ana_freq = 0; /* Invalid analog frequency */
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_NTSC_M;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
> +	rec_src.analog.ana_freq = 0xffff; /* Invalid analog frequency */
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_SECAM_L;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_SATELLITE;
> +	rec_src.analog.ana_freq = (703250 * 10) / 625;
> +	rec_src.analog.bcast_system = 0xff; /* Invalid analog broadcast system */
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_EXT_PLUG;
> +	rec_src.ext_plug.plug = 0; /* Invalid plug */
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	return OK;
> +}
> +
> +static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	struct cec_msg msg;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_record_off(&msg, true);
> +	fail_on_test(!transmit_timeout(node, &msg));

Is a 10s timeout also needed for <Record Off>? It sounds reasonable.

> +	if (unrecognized_op(&msg)) {
> +		fail_on_test(node->remote[la].prim_type == CEC_OP_PRIM_DEVTYPE_RECORD);
> +		return OK_NOT_SUPPORTED;
> +	}
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
> @@ -1218,13 +1509,30 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
>  	if (timed_out(&msg))
>  		return OK_PRESUMED;
>  
> -	return 0;
> +	__u8 rec_status;
> +
> +	cec_ops_record_status(&msg, &rec_status);
> +
> +	fail_on_test(rec_status != CEC_OP_RECORD_STATUS_TERMINATED_OK &&
> +	             rec_status != CEC_OP_RECORD_STATUS_ALREADY_TERM);
> +
> +	return OK;
>  }
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
> +
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
> index 343ae998..589ea6bf 100644
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
> @@ -62,6 +63,7 @@ struct node {
>  	const char *device;
>  	unsigned caps;
>  	unsigned available_log_addrs;
> +	__u8 remote_prim_devtype;
>  	unsigned adap_la_mask;
>  	unsigned remote_la_mask;
>  	__u16 remote_phys_addr[15];
> @@ -74,7 +76,6 @@ struct node {
>  	bool has_deck_ctl;
>  	bool has_rec_tv;
>  	bool has_osd_string;
> -

Please keep this newline.

>  	bool ignore_la[16];
>  	unsigned short ignore_opcode[256];
>  };
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index b1c8f3d9..f985a841 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -396,8 +396,10 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8
>  		__u8 prim_dev_type;
>  
>  		cec_ops_report_physical_addr(&msg, &phys_addr, &prim_dev_type);
> -		if (from < 15)
> +		if (from < 15) {
>  			node->remote_phys_addr[from] = phys_addr;
> +			node->remote_prim_devtype = prim_dev_type;
> +		}
>  		return;
>  	}
>  
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index d1718986..4ecb62a6 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -482,6 +482,155 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	return false;
>  }
>  
> +static bool digital_service_info_valid(const struct cec_op_record_src &rec_src)
> +{
> +	switch (rec_src.digital.dig_bcast_system) {
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S:
> +		return true;
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.arib.transport_id == digital_arib_data[0][i].tsid &&
> +				    rec_src.digital.arib.service_id == digital_arib_data[0][i].sid &&
> +				    rec_src.digital.arib.orig_network_id == digital_arib_data[0][i].onid)
> +				    return true;
> +			}
> +		} else {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.channel.channel_number_fmt == digital_arib_data[0][i].fmt &&
> +				    rec_src.digital.channel.major == digital_arib_data[0][i].major &&
> +				    rec_src.digital.channel.minor == digital_arib_data[0][i].minor)
> +				    return true;
> +			}
> +		}
> +		return false;

I think you are mixing up two different things here: detecting whether one of the
operands is invalid, and whether the operands are valid, but do not match one of
the emulated channels/services.

In the first case you Feature Abort with Invalid Op, in the second case the recording
status changes to an error (CEC_OP_RECORD_STATUS_NO_DIG/ANA_SERVICE).

For the second case (validating service information), you should be able to use
existing functions in cec-tuner.cpp, I think at least digital_get_service_idx() can
be used. I'm not sure about analog_get_nearest_service_idx(): getting the closest
analog channel may not be appropriate.

> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.arib.transport_id == digital_arib_data[1][i].tsid &&
> +				    rec_src.digital.arib.service_id == digital_arib_data[1][i].sid &&
> +				    rec_src.digital.arib.orig_network_id == digital_arib_data[1][i].onid)
> +				    return true;
> +			}
> +		} else {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.channel.channel_number_fmt == digital_arib_data[1][i].fmt &&
> +				    rec_src.digital.channel.major == digital_arib_data[1][i].major &&
> +				    rec_src.digital.channel.minor == digital_arib_data[1][i].minor)
> +				    return true;
> +			}
> +		}
> +		return false;
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.atsc.transport_id == digital_atsc_data[0][i].tsid &&
> +				    rec_src.digital.atsc.program_number == digital_atsc_data[0][i].sid)
> +				    return true;
> +			}
> +		} else {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.channel.channel_number_fmt == digital_atsc_data[0][i].fmt &&
> +				    rec_src.digital.channel.major == digital_atsc_data[0][i].major &&
> +				    rec_src.digital.channel.minor == digital_atsc_data[0][i].minor)
> +				    return true;
> +			}
> +		}
> +		return false;
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.atsc.transport_id == digital_atsc_data[1][i].tsid &&
> +				    rec_src.digital.atsc.program_number == digital_atsc_data[1][i].sid)
> +				    return true;
> +			}
> +		} else {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.channel.channel_number_fmt == digital_atsc_data[1][i].fmt &&
> +				    rec_src.digital.channel.major == digital_atsc_data[1][i].major &&
> +				    rec_src.digital.channel.minor == digital_atsc_data[1][i].minor)
> +				    return true;
> +			}
> +		}
> +		return false;
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +				if (rec_src.digital.dvb.transport_id == digital_dvb_data[0][i].tsid &&
> +				    rec_src.digital.dvb.service_id == digital_dvb_data[0][i].sid &&
> +				    rec_src.digital.dvb.orig_network_id == digital_dvb_data[0][i].onid)
> +				    return true;
> +			}
> +		} else {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.channel.channel_number_fmt == digital_dvb_data[0][i].fmt &&
> +				    rec_src.digital.channel.major == digital_dvb_data[0][i].major &&
> +				    rec_src.digital.channel.minor == digital_dvb_data[0][i].minor)
> +				    return true;
> +			}
> +		}
> +		return false;
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID) {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.dvb.transport_id == digital_dvb_data[1][i].tsid &&
> +				    rec_src.digital.dvb.service_id == digital_dvb_data[1][i].sid &&
> +				    rec_src.digital.dvb.orig_network_id == digital_dvb_data[1][i].onid)
> +				    return true;
> +			}
> +		} else {
> +			for (unsigned i = 0; i < NUM_DIGITAL_CHANS; i++) {
> +
> +				if (rec_src.digital.channel.channel_number_fmt == digital_dvb_data[1][i].fmt &&
> +				    rec_src.digital.channel.major == digital_dvb_data[1][i].major &&
> +				    rec_src.digital.channel.minor == digital_dvb_data[1][i].minor)
> +				    return true;
> +			}
> +		}
> +		return false;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool analog_service_info_valid(const cec_op_record_src &rec_src)
> +{
> +	__u8 bcast_type = rec_src.analog.ana_bcast_type;
> +	unsigned freq = (rec_src.analog.ana_freq * 625) / 10;
> +	__u8 bcast_system = rec_src.analog.bcast_system;
> +
> +	if (bcast_type > CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL)
> +		return false;
> +
> +	if (bcast_system > CEC_OP_BCAST_SYSTEM_PAL_DK && bcast_system != CEC_OP_BCAST_SYSTEM_OTHER)
> +		return false;
> +
> +	for (unsigned i = 0; i < NUM_ANALOG_FREQS; i++) {
> +
> +		if (freq == analog_freqs_khz[bcast_type][bcast_system][i])
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me, __u8 type)
>  {
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
> @@ -577,23 +726,16 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		return;
>  	}
>  
> -		/*
> -		  One Touch Record
> -
> -		  This is only a basic implementation.
> -
> -		  TODO:
> -		  - If we are a TV, we should only send Record On if the
> -		    remote end is a Recording device or Reserved. Otherwise ignore.
> -
> -		  - Device state should reflect whether we are recording, etc. In
> -		    recording mode we should ignore Standby messages.
> -		*/
> +		/* One Touch Record */
>  
>  	case CEC_MSG_RECORD_TV_SCREEN: {
>  		if (!node->has_rec_tv)
>  			break;
>  
> +		/* Ignore if initiator is not a recording device */
> +		if (node->remote_prim_devtype != CEC_OP_PRIM_DEVTYPE_RECORD)
> +			return;
> +
>  		struct cec_op_record_src rec_src = {};
>  
>  		rec_src.type = CEC_OP_RECORD_SRC_OWN;
> @@ -602,24 +744,68 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
> +		bool feature_abort = false;
> +		struct cec_op_record_src rec_src = {};
> +
> +		cec_ops_record_on(&msg, &rec_src);
> +		switch (rec_src.type) {
> +		case CEC_OP_RECORD_SRC_OWN:
> +			rec_status = CEC_OP_RECORD_STATUS_CUR_SRC;
> +			break;
> +		case CEC_OP_RECORD_SRC_DIGITAL:
> +			if (digital_service_info_valid(rec_src))
> +				rec_status = CEC_OP_RECORD_STATUS_DIG_SERVICE;
> +			else
> +				feature_abort = true;
> +			break;
> +		case CEC_OP_RECORD_SRC_ANALOG:
> +			if (analog_service_info_valid(rec_src))
> +				rec_status = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +			else
> +				feature_abort = true;
> +			break;
> +		case CEC_OP_RECORD_SRC_EXT_PLUG:
> +			/* Plug number range is 1-255 in spec, but a realistic range of connectors is 6. */
> +			if (rec_src.ext_plug.plug < 1 || rec_src.ext_plug.plug > 6)
> +				feature_abort = true;
> +			else
> +				rec_status = CEC_OP_RECORD_STATUS_EXT_INPUT;
> +			break;
> +		case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
> +			rec_status = CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR;
>  			break;
> +		default:
> +			feature_abort = true;
> +			break;
> +		}
> +		if (feature_abort) {
> +			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
> +			return;
> +		}
> +		if (node->state.one_touch_record_on)
> +			rec_status = CEC_OP_RECORD_STATUS_ALREADY_RECORDING;
>  		cec_msg_set_reply_to(&msg, &msg);
> -		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_CUR_SRC);
> +		cec_msg_record_status(&msg, rec_status);
>  		transmit(node, &msg);
> +		node->state.one_touch_record_on = true;
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
> -
> -
>  		/*
>  		  Timer Programming
>  
> 

Regards,

	Hans
