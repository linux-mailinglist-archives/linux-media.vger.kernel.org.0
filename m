Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9F0BD912
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 09:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442577AbfIYHW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 03:22:27 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33201 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2442575AbfIYHW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 03:22:27 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id D1cyiB55zKKNGD1d2itdWU; Wed, 25 Sep 2019 09:22:24 +0200
Subject: Re: [PATCH v2 2/2] cec-compliance: add/refactor tuner control tests
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
 <20190924192445.93575-3-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6f30bcb2-cf4a-471a-9015-cf277c4b7372@xs4all.nl>
Date:   Wed, 25 Sep 2019 09:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924192445.93575-3-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPjQ3SiHk6expp9W7I4Gca8hnEhHc9ByLnpHjeRhpSnc5H8zx0Gs/le+SC+YBWzt+aaKA7LHV2WxftI3L9VAi8SqRVsAwYFlxKVfxzNn8BXs9VqsxdXo
 5nR1sRiSi/bdkBwhlorTojHgygLgp/NaufQnSk8UHihecs/8gxmHc1Qzp1LZXqCTmr+Wg2+0oHEt9CR7571ch4Ny6x4UXvcBJtKRALjWAEQ0+AC4AWMTx+9p
 tXCC4sr2oIEDhz/BKHdn50VOirwAk/XCqH8nQSfPcdQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiunn,

On 9/24/19 9:24 PM, Jiunn Chang wrote:
> Tests added/refactored for new features added to the cec-follower.
> 
> Analog tuner control tests added/refactored:
>   - give analog tuner status
>   - select tuner analog service
>   - analog tuner step decrement
>   - analog tuner step increment
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>

I've been thinking about how to test this and I think this needs to be
redesigned. Right now we have little tests for each CEC message, but
it's all too uncoordinated.

I think we should have a single tuner_ctl_test() function that tests the
whole Tuner Control feature.

Basically it should:

1) Test Give Tuner Device Status and store the returned channel to a
   data structure
2) Call Tuner Step Increment repeatedly followed by Give Tuner Device Status
   and store the new channels into the data struct until the Tuner Step Increment
   either returns with an already found channel (it cycled back), or possibly
   failed if it reached the end of the channel list (then it doesn't cycle. Sadly
   the spec is unclear whether the Tuner Step commands should wrap around or not).
   If it failed, then call Select Analog/Digital Service with the initial channel
   found in 1) and call Tuner Step Decrement to find the remaining channel.
3) For all channels in the data structure call Select Analog/Digital Service and
   check with Give Tuner Device Status that it succeeded.
4) Test Select Analog/Digital Service as well with an invalid service (i.e., one
   that was not found in the channel search).

This tests everything in one coherent test.

In addition, this tests what channels are available. If --verbose was given, then
you want to log each found channel.

Regards,

	Hans

> ---
>  utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
>  1 file changed, 140 insertions(+), 41 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index aece546c..91600d39 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -722,9 +722,19 @@ static struct remote_subtest deck_ctl_subtests[] = {
>    TODO: These are very rudimentary tests which should be expanded.
>   */
>  
> -static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
> +			                7668, CEC_OP_BCAST_SYSTEM_PAL_BG); // 479.25 MHz analog frequency
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return NOTSUPPORTED;
> +	if (refused(&msg))
> +		return REFUSED;
>  
>  	cec_msg_init(&msg, me, la);
>  	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> @@ -737,6 +747,14 @@ static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bo
>  	if (cec_msg_status_is_abort(&msg))
>  		return PRESUMED_OK;
>  
> +	cec_ops_tuner_device_status(&msg, &info);
> +	if (info.analog.ana_bcast_type != CEC_OP_ANA_BCAST_TYPE_CABLE)
> +		return FAIL;
> +	if (info.analog.ana_freq != 7668)
> +		return FAIL;
> +	if (info.analog.bcast_system != CEC_OP_BCAST_SYSTEM_PAL_BG)
> +		return FAIL;
> +
>  	return 0;
>  }
>  
> @@ -745,23 +763,24 @@ static int tuner_ctl_sel_analog_service(struct node *node, unsigned me, unsigned
>  	struct cec_msg msg = {};
>  
>  	node->remote[la].bcast_sys = ~0;
> -	for (unsigned sys = 0; sys <= 8; sys++) {
> -		cec_msg_init(&msg, me, la);
> -		cec_msg_select_analogue_service(&msg, CEC_OP_ANA_BCAST_TYPE_CABLE,
> -						7668, sys); // 479.25 MHz analog frequency
> -		fail_on_test(!transmit_timeout(node, &msg));
> -		if (unrecognized_op(&msg))
> -			return NOTSUPPORTED;
> -		if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
> -			info("Tuner supports %s, but cannot select that service.\n",
> -			     bcast_system2s(sys));
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 7668, sys); // 479.25 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (abort_reason(&msg) == CEC_OP_ABORT_INVALID_OP) {
> +				info("Tuner supports %s, but cannot select that service.\n",
> +				bcast_system2s(sys));
> +				node->remote[la].bcast_sys = sys;
> +				continue;
> +			}
> +			if (cec_msg_status_is_abort(&msg))
> +				continue;
> +			info("Tuner supports %s\n", bcast_system2s(sys));
>  			node->remote[la].bcast_sys = sys;
> -			continue;
>  		}
> -		if (cec_msg_status_is_abort(&msg))
> -			continue;
> -		info("Tuner supports %s\n", bcast_system2s(sys));
> -		node->remote[la].bcast_sys = sys;
>  	}
>  
>  	if (node->remote[la].bcast_sys == (__u8)~0)
> @@ -854,43 +873,123 @@ static int tuner_ctl_tuner_dev_status(struct node *node, unsigned me, unsigned l
>  	return 0;
>  }
>  
> -static int tuner_ctl_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_step_dec(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 freq = 0;
> +
> +	info.is_analog = true;
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 16000, sys); // 1000 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			freq = info.analog.ana_freq;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_tuner_step_decrement(&msg);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			if (cec_msg_status_is_abort(&msg))
> +				return PRESUMED_OK;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			if (!(info.analog.ana_freq < freq))
> +				return FAIL;
> +		}
> +	}
>  
> -	cec_msg_init(&msg, me, la);
> -	cec_msg_tuner_step_decrement(&msg);
> -	fail_on_test(!transmit_timeout(node, &msg));
> -	if (unrecognized_op(&msg))
> -		return NOTSUPPORTED;
> -	if (refused(&msg))
> -		return REFUSED;
> -
> -	return PRESUMED_OK;
> +	return 0;
>  }
>  
> -static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
> +static int tuner_ctl_analog_step_inc(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 freq = 0;
> +
> +	info.is_analog = true;
> +	for (unsigned type = 0; type < 3; type++) {
> +		for (unsigned sys = 0; sys < 9; sys++) {
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_select_analogue_service(&msg, type, 0, sys); // 0 MHz analog frequency
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			freq = info.analog.ana_freq;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_tuner_step_increment(&msg);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			if (cec_msg_status_is_abort(&msg))
> +				return PRESUMED_OK;
> +
> +			cec_msg_init(&msg, me, la);
> +			cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +			fail_on_test(!transmit_timeout(node, &msg));
> +			fail_on_test(timed_out(&msg));
> +			if (unrecognized_op(&msg))
> +				return NOTSUPPORTED;
> +			if (refused(&msg))
> +				return REFUSED;
> +			cec_ops_tuner_device_status(&msg, &info);
> +			if (!(info.analog.ana_freq > freq))
> +				return FAIL;
> +		}
> +	}
>  
> -	cec_msg_init(&msg, me, la);
> -	cec_msg_tuner_step_increment(&msg);
> -	fail_on_test(!transmit_timeout(node, &msg));
> -	if (unrecognized_op(&msg))
> -		return NOTSUPPORTED;
> -	if (refused(&msg))
> -		return REFUSED;
> -
> -	return PRESUMED_OK;
> +	return 0;
>  }
>  
>  static struct remote_subtest tuner_ctl_subtests[] = {
> -	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
> -	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
> -	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
> +	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_give_status },
> +	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_analog_service },
> +	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_sel_digital_service },
>  	{ "Tuner Device Status", CEC_LOG_ADDR_MASK_ALL, tuner_ctl_tuner_dev_status },
> -	{ "Tuner Step Decrement", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_dec },
> -	{ "Tuner Step Increment", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_step_inc },
> +	{ "Tuner Analog Step Decrement", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_dec },
> +	{ "Tuner Analog Step Increment", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_analog_step_inc },
>  };
>  
>  
> 

