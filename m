Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE28C2E6C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 09:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbfJAHwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 03:52:05 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58435 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726388AbfJAHwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 03:52:05 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FCwxiz97mKKNGFCx1iStP7; Tue, 01 Oct 2019 09:52:03 +0200
Subject: Re: [PATCH v4 3/3] cec-compliance: add tuner control test
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
 <20191001031823.312020-4-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f4d378d4-ae11-867a-137a-c46bd703c3e2@xs4all.nl>
Date:   Tue, 1 Oct 2019 09:51:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001031823.312020-4-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBXp4oZMXqbgHz2rh/bVtQEQzgt89NyPwxkjxJyuD6vEM3Lcojm2ilyZpTWVTeTGOJh9lbFjOA8oRxxvL7MJk5MiL1nOSZ1CX8Sl6ksdl8w9mqMmpPi1
 1ZMGRpUjPbhI/ZLHv1OA4xy1j5gF05LuzBmRk8+KDRGlCHE2dR93ChcPfZFBMy7/yBCZVx9jjNgr+2I0PkCEyj0eIM+PRpIpyyEcDpy8dmR9W5XCKWxy8ZbF
 0aMZ/VjCNL0LM4tp/HPyAcVXePyTwZWI2gPx5DyKus8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 5:18 AM, Jiunn Chang wrote:
> Add test for new features added to cec-follower.
> 
> Analog tuner control test tuner_ctl_test():
>   - give analog tuner status
>   - select tuner analog service
>   - analog tuner step features
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 91 +++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index aece546c..17f72cc6 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -16,6 +16,7 @@
>  #include <sys/ioctl.h>
>  #include <config.h>
>  #include <sstream>
> +#include <vector>
>  
>  #include "cec-compliance.h"
>  
> @@ -722,6 +723,95 @@ static struct remote_subtest deck_ctl_subtests[] = {
>    TODO: These are very rudimentary tests which should be expanded.
>   */
>  
> +static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	std::vector<struct cec_op_tuner_device_info> info_vec;
> +	__u16 start_freq;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);

That's interesting! I never noticed this Status Request argument. This is something that
the follower doesn't implement at the moment. It also means that the cec_msg_give_tuner_device_status
function is slightly buggy in that it sets the reply field unconditionally, even though
there will not be a reply if status_req is CEC_OP_STATUS_REQ_OFF.

I'll post a patch for this and cec_msg_give_deck_status which has the same problem.

> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(timed_out(&msg));

Don't fail on this. Instead add to the next if:

> +	if (unrecognized_op(&msg))

if (timed_out(&msg) || unrecognized_op(&msg))

Too many devices time out if they don't support a message rather than
replying with Feature Abort.

> +		return NOTSUPPORTED;
> +	if (refused(&msg))
> +		return REFUSED;
> +	cec_ops_tuner_device_status(&msg, &info);
> +	start_freq = info.analog.ana_freq;
> +	info_vec.push_back(info);
> +
> +	while (1) {
> +		struct cec_op_tuner_device_info new_info;

No need, you can reuse the existing info variable.

> +
> +		cec_msg_init(&msg, me, la);
> +		cec_msg_tuner_step_increment(&msg);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		if (unrecognized_op(&msg))
> +			return NOTSUPPORTED;
> +		if (refused(&msg))
> +			return REFUSED;

This needs a bit more work:

It should fail if the command timed_out. If it returned feature abort, then
if the reason is CEC_OP_ABORT_UNRECOGNIZED_OP it should fail as well.
For any other reason you can assume that the tuner has reached the end of
the service list and you can break out of the loop. I would warn as well in that
case if the abort reason is anything else but REFUSED.

If give_tuner_device_status is working, but not tuner_step_increment, then
that counts as a fail.

> +		cec_msg_init(&msg, me, la);
> +		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		fail_on_test(timed_out(&msg));
> +		if (unrecognized_op(&msg))
> +			return NOTSUPPORTED;
> +		if (refused(&msg))
> +			return REFUSED;

Just fail: fail_on_test(timed_out_or_abort(&msg));

It worked above, so if this one fails, then something is seriously wrong.

> +		cec_ops_tuner_device_status(&msg, &new_info);
> +		if (new_info.analog.ana_freq == start_freq)
> +			break;
> +		if (new_info.analog.ana_freq == info_vec.back().analog.ana_freq) {
> +			warn("Tuner channel step increment does not wrap.\n");
> +			break;
> +		}
> +		info_vec.push_back(new_info);
> +	}
> +
> +	
> +	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
> +			iter != info_vec.end(); iter++) {
> +		struct cec_op_tuner_device_info current;

Again, you can just reuse the info variable above.

> +
> +		cec_msg_init(&msg, me, la);
> +		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
> +			iter->analog.ana_freq, iter->analog.bcast_system);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		if (unrecognized_op(&msg))
> +			return NOTSUPPORTED;
> +		if (refused(&msg))
> +			return REFUSED;

I think that there is no reason why this would fail, so just do
fail_on_test(timed_out_or_abort(&msg));

In my experience it is usually best to be a bit strict in the tests and relax them
if you find real cases where the strict test would fail.

> +		cec_msg_init(&msg, me, la);
> +		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		fail_on_test(timed_out(&msg));
> +		if (unrecognized_op(&msg))
> +			return NOTSUPPORTED;
> +		if (refused(&msg))
> +			return REFUSED;

Definitely a fail.

> +		cec_ops_tuner_device_status(&msg, &current);
> +		fail_on_test(current.analog.ana_freq != iter->analog.ana_freq);
> +		if (iter->is_analog) {
> +			float freq_mhz = (iter->analog.ana_freq * 625) / 10000;

I think this should be 10000.0 to force this division to be a division of floats,
not integers. I'd also use double instead of float.

> +			info("Analog channel freq: %.2f MHz\n", freq_mhz);
> +		}
> +	}
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return NOTSUPPORTED;
> +	if (refused(&msg))
> +		return REFUSED;

Any time out or unrecognized_op reason is a fail.

> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	return 0;
> +}
> +
>  static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> @@ -885,6 +975,7 @@ static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool
>  }
>  
>  static struct remote_subtest tuner_ctl_subtests[] = {
> +	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
>  	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
>  	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
>  	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
> 

This looks promising!

Regards,

	Hans
