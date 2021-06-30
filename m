Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70393B7FEC
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 11:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhF3J3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 05:29:38 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36349 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233696AbhF3J3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 05:29:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yWUmlqfdt48ZvyWUplDTCZ; Wed, 30 Jun 2021 11:27:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625045223; bh=YWHQpIWVZyfOptN51tyUOkMmnfviYXpLV2JdO24420Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YabN4XECaTj54vfhbBhuA8Otqw2/Owa+6XW11hk67d3jtY9AOHDf/McpwdaCCCjUa
         LBcTIbqWrrp74x3mLwj5p/xPUrcp97R5VsQJkGOkKr0HrpYXCIr4DRK10OAGr2dFV1
         wgNCE3bky5IX3er+QZ2XBE7h/vtGZpZYxd9hPJLH+275ECsnpSW0B+KyKydX0e5CyV
         HtWc9tZbna5124RZA1ZrQ+kK7rVR5VjIE4UuaOubQbgf7UETN16NklAn52RlzXeuVB
         xB4WmD7vSAlq/j5MnfHNg0twaUUVep/jQp6NEVPCmZkwFiZMSaLHoS36TFlDBupgEk
         JGribkYsd3YHA==
Subject: Re: [PATCH v6 1/2] cec: expand One Touch Record tests
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1624989704.git.deborahbrouwer3563@gmail.com>
 <f5657920242da62914f2d7541f4d485312a8ee29.1624989704.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fb2f8e9e-e173-4790-db37-15f3edd83a3d@xs4all.nl>
Date:   Wed, 30 Jun 2021 11:27:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f5657920242da62914f2d7541f4d485312a8ee29.1624989704.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJhBPB3oka+y4eJSzRqZ5qZSmOuFb3VahGl4QhgcmNUcuO1BKxxP/YV+ovo8nwFatny1OtQadqNhWbbB/TAnx3GOZD9/LhdQ/iT48k7oncmu6ieaF+yG
 MwJGI/sHqvYnkLG+ztZXDCx6hjuDa7W3ZxT+O4u9KTh3MfrSzD7qb7qQ+kmEqPX90ET8QcYrVXdfsumeb835Swe/H2tkMNT+Lurcg9DSTFdYR0Xu/nbgZCO2
 AQg67BDNcJuRiXDG2fNONGMFOz85IEpwX+2ng/ehX/E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2021 20:21, Deborah Brouwer wrote:
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
>  utils/cec-compliance/cec-test.cpp       | 334 ++++++++++++++++++++++--
>  utils/cec-follower/cec-follower.cpp     |   1 +
>  utils/cec-follower/cec-follower.h       |   2 +
>  utils/cec-follower/cec-processing.cpp   |   4 +-
>  utils/cec-follower/cec-tuner.cpp        | 141 ++++++++--
>  7 files changed, 439 insertions(+), 45 deletions(-)
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

This won't work if the CEC device is configured with multiple logical addresses
since this always picks the primary device type of the first logical address.

Instead, this should be assigned further down:

        if (test_remote) {
                for (unsigned from = 0; from <= 15; from++) {
                        if (!(node.adap_la_mask & (1 << from)))
                                continue;

// Here you need to find the primary device type for 'from'.

                        for (unsigned to = 0; to <= 15; to++)
                                if (!(node.adap_la_mask & (1 << to)) &&
                                    (remote_la_mask & (1 << to)))
                                        testRemote(&node, from, to, test_tags, options[OptInteractive]);
                }
        }

Frankly, I don't think it is smart to check for 1 bits in adap_la_mask.
It is much simpler to just do:

		for (unsigned i = 0; i < node.num_log_addrs; i++) {
			from = node.log_addr[i];
			node.prim_devtype = laddrs.primary_device_type[i];

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
> index 40d8369d..a7538eeb 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -48,6 +48,70 @@ static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play
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
> +	/* Allow 10s for reply because the spec says it may take several seconds to accurately respond. */
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
> + * Returns true if the Record Status is an error indicating that the
> + * request to start recording has failed.
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
> @@ -1141,23 +1205,17 @@ static const vec_remote_subtests tuner_ctl_subtests{
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
> +	struct cec_msg msg;
> +
>  	/*
> -	  TODO:
> -	  - Page 36 in HDMI CEC 1.4b spec lists additional behaviors that should be
> -	    checked for.
> -	  - The TV should ignore this message when received from other LA than Recording or
> -	    Reserved.
> +	 * Send the initiator's primary device type to the remote device since the remote
> +	 * device should ignore this message if it is not sent by a recording device.
>  	 */
> -	struct cec_msg msg;
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_report_physical_addr(&msg, node->phys_addr, node->prim_devtype);
> +	fail_on_test(!transmit_timeout(node, &msg));

Ah, I see what you want to achieve here. Normally <Report Physical Addr> is transmitted
when a logical address is claimed (i.e. when the CEC adapter is configured). But in this
test situation it makes sense to transmit it explicitly since that way there is no
excuse for a follower not to know the primary device type. But I would move this to the
start of testRemote(), just before the main test for loop. That way other tests can also
assume that the remote CEC device will know the primary device type.

>  
>  	cec_msg_init(&msg, me, la);
>  	cec_msg_record_tv_screen(&msg, true);
> @@ -1172,45 +1230,248 @@ static int one_touch_rec_tv_screen(struct node *node, unsigned me, unsigned la,
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
> +	fail_on_test(rec_src.type < CEC_OP_RECORD_SRC_OWN ||
> +	             rec_src.type > CEC_OP_RECORD_SRC_EXT_PHYS_ADDR);
> +
> +	if (rec_src.type == CEC_OP_RECORD_SRC_DIGITAL) {
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
> +
> +		if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL)
> +			fail_on_test(rec_src.digital.channel.channel_number_fmt < CEC_OP_CHANNEL_NUMBER_FMT_1_PART ||
> +			             rec_src.digital.channel.channel_number_fmt > CEC_OP_CHANNEL_NUMBER_FMT_2_PART);
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
> +	/* In the following tests, these digital services are taken from the cec-follower tuner emulation. */
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
> +	rec_src.digital.arib.transport_id = 1032;
> +	rec_src.digital.arib.service_id = 30203;
> +	rec_src.digital.arib.orig_network_id = 1;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T;
> +	rec_src.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_2_PART;
> +	rec_src.digital.channel.major = 4;
> +	rec_src.digital.channel.minor = 1;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T;
> +	rec_src.digital.dvb.transport_id = 1004;
> +	rec_src.digital.dvb.service_id = 1040;
> +	rec_src.digital.dvb.orig_network_id = 8945;
> +	fail_on_test(one_touch_rec_on_send(node, me, la, rec_src, rec_status));
> +	if (rec_status != CEC_OP_RECORD_STATUS_DIG_SERVICE)
> +		fail_on_test(!rec_status_is_a_valid_error_status(rec_status));
> +
> +	/* In the following tests, these channels taken from the cec-follower tuner emulation. */
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
> +	rec_src.digital.dig_bcast_system = 0x7f; /* Invalid digital service broadcast system operand */
> +	rec_src.digital.channel.channel_number_fmt = CEC_OP_CHANNEL_NUMBER_FMT_1_PART;
> +	rec_src.digital.channel.major = 0;
> +	rec_src.digital.channel.minor = 30203;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	rec_src.type = CEC_OP_RECORD_SRC_DIGITAL;
> +	rec_src.digital.service_id_method = CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL;
> +	rec_src.digital.dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
> +	rec_src.digital.channel.channel_number_fmt = 0; /* Invalid channel number format operand */
> +	rec_src.digital.channel.major = 0;
> +	rec_src.digital.channel.minor = 30609;
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
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_SATELLITE;
> +	rec_src.analog.ana_freq = (703250 * 10) / 625;
> +	rec_src.analog.bcast_system = 0xff; /* Invalid analog broadcast system */
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL;
> +	rec_src.analog.ana_freq = 0; /* Invalid frequency */
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_NTSC_M;
> +	fail_on_test(one_touch_rec_on_send_invalid(node, me, la, rec_src));
> +
> +	memset(&rec_src, 0, sizeof(rec_src));
> +	rec_src.type = CEC_OP_RECORD_SRC_ANALOG;
> +	rec_src.analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
> +	rec_src.analog.ana_freq = 0xffff; /* Invalid frequency */
> +	rec_src.analog.bcast_system = CEC_OP_BCAST_SYSTEM_SECAM_L;
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
> +	/* Allow 10s for reply because the spec says it may take several seconds to accurately respond. */
> +	fail_on_test(!transmit_timeout(node, &msg, 10000));
> +	if (unrecognized_op(&msg)) {
> +		fail_on_test(node->remote[la].prim_type == CEC_OP_PRIM_DEVTYPE_RECORD);
> +		return OK_NOT_SUPPORTED;
> +	}
>  	if (refused(&msg))
>  		return OK_REFUSED;
>  	if (cec_msg_status_is_abort(&msg))
> @@ -1218,13 +1479,30 @@ static int one_touch_rec_off(struct node *node, unsigned me, unsigned la, bool i
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
> index 343ae998..8dfbd39f 100644
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
> +	__u8 remote_prim_devtype[15];
>  	unsigned adap_la_mask;
>  	unsigned remote_la_mask;
>  	__u16 remote_phys_addr[15];
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 6db3f98e..e1a71d6c 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -396,8 +396,10 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8
>  		__u8 prim_dev_type;
>  
>  		cec_ops_report_physical_addr(&msg, &phys_addr, &prim_dev_type);
> -		if (from < 15)
> +		if (from < 15) {
>  			node->remote_phys_addr[from] = phys_addr;
> +			node->remote_prim_devtype[from] = prim_dev_type;
> +		}
>  		return;
>  	}
>  
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index d1718986..13cf6d20 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -482,8 +482,68 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	return false;
>  }
>  
> +static bool digital_operand_invalid(const struct cec_op_record_src &rec_src)
> +{
> +	switch (rec_src.digital.dig_bcast_system) {
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_GEN:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_GEN:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_GEN:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_CS:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_CABLE:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_C:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
> +	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
> +		break;
> +	default:
> +		return true;
> +	}
> +
> +	if (rec_src.digital.service_id_method == CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL) {
> +		if (rec_src.digital.channel.channel_number_fmt < CEC_OP_CHANNEL_NUMBER_FMT_1_PART ||
> +		    rec_src.digital.channel.channel_number_fmt > CEC_OP_CHANNEL_NUMBER_FMT_2_PART)
> +		    return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool analog_operand_invalid(const cec_op_record_src &rec_src)
> +{
> +	if (rec_src.analog.ana_bcast_type > CEC_OP_ANA_BCAST_TYPE_TERRESTRIAL)
> +		return true;
> +
> +	if (rec_src.analog.bcast_system > CEC_OP_BCAST_SYSTEM_PAL_DK &&
> +	    rec_src.analog.bcast_system != CEC_OP_BCAST_SYSTEM_OTHER)
> +		return true;
> +
> +	if (rec_src.analog.ana_freq == 0 || rec_src.analog.ana_freq == 0xffff)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool analog_channel_is_available(const cec_op_record_src &rec_src)
> +{
> +	__u8 bcast_type = rec_src.analog.ana_bcast_type;
> +	unsigned freq = (rec_src.analog.ana_freq * 625) / 10;
> +	__u8 bcast_system = rec_src.analog.bcast_system;
> +
> +	for (unsigned i = 0; i < NUM_ANALOG_FREQS; i++) {
> +		if (freq == analog_freqs_khz[bcast_type][bcast_system][i])
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me, __u8 type)
>  {
> +	__u8 from = cec_msg_initiator(&msg);
>  	bool is_bcast = cec_msg_is_broadcast(&msg);
>  
>  	switch (msg.msg[1]) {
> @@ -577,23 +637,16 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
> +		if (!cec_has_record(1 << from) && node->remote_prim_devtype[from] != CEC_OP_PRIM_DEVTYPE_RECORD)
> +			return;
> +
>  		struct cec_op_record_src rec_src = {};
>  
>  		rec_src.type = CEC_OP_RECORD_SRC_OWN;
> @@ -602,19 +655,75 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
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
>  			break;
> +		case CEC_OP_RECORD_SRC_DIGITAL:
> +			if (digital_operand_invalid(rec_src)) {
> +				feature_abort = true;
> +				break;
> +			}
> +			if (digital_get_service_idx(&rec_src.digital) >= 0)
> +				rec_status = CEC_OP_RECORD_STATUS_DIG_SERVICE;
> +			else
> +				rec_status = CEC_OP_RECORD_STATUS_NO_DIG_SERVICE;
> +			break;
> +		case CEC_OP_RECORD_SRC_ANALOG:
> +			if (analog_operand_invalid(rec_src)) {
> +				feature_abort = true;
> +				break;
> +			}
> +			if (analog_channel_is_available(rec_src))
> +				rec_status = CEC_OP_RECORD_STATUS_ANA_SERVICE;
> +			else
> +				rec_status = CEC_OP_RECORD_STATUS_NO_ANA_SERVICE;
> +			break;
> +		case CEC_OP_RECORD_SRC_EXT_PLUG:
> +			if (rec_src.ext_plug.plug == 0)
> +				feature_abort = true;
> +			/* Plug number range is 1-255 in spec, but a realistic range of connectors is 6. */
> +			else if (rec_src.ext_plug.plug > 6)
> +				rec_status = CEC_OP_RECORD_STATUS_INVALID_EXT_PLUG;
> +			else
> +				rec_status = CEC_OP_RECORD_STATUS_EXT_INPUT;
> +			break;
> +		case CEC_OP_RECORD_SRC_EXT_PHYS_ADDR:
> +			rec_status = CEC_OP_RECORD_STATUS_INVALID_EXT_PHYS_ADDR;
> +			break;
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
> 

Otherwise this looks good!

Regards,

	Hans
