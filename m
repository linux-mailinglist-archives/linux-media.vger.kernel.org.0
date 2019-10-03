Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE05AC98A0
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 08:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbfJCGvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 02:51:09 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50091 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbfJCGvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 02:51:09 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Fux5iGhyzJQzFFux8i8tmI; Thu, 03 Oct 2019 08:51:07 +0200
Subject: Re: [PATCH v5 2/2] Add test for new features in cec-follower
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20191001031823.312020-1-c0d1n61at3@gmail.com>
 <20191003031816.168985-3-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4da933ff-70c9-3226-11be-990330f70968@xs4all.nl>
Date:   Thu, 3 Oct 2019 08:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003031816.168985-3-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA+CwUe9La2d5I4cOo5ctVoxLRVzSAEZI+wybRXaqiI8uIA+bUNGslkCLSchazU8NZWNuwdNyYOqeRKCYKp2w/XC1J9DrFbDDsylmm0p5CWAPWOfOKHH
 52tVTyYJ0KQPpgCcbjkRXIdDh9el2YMocZkxC5JM/mdWSzyUXX4tjievAkNRR2csd4kgMCFwaYsvQoeIrGZSCvEepeFBBILIpj8xKih4ogx0NUxzSXJ7NE2f
 NMD7TRvJL8W2/6qZtXbTs6TNhkpbYnCcwlunv285ukw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/19 5:18 AM, Jiunn Chang wrote:
> Analog tuner control test tuner_ctl_test():
>   - give analog tuner status
>   - select tuner analog service
>   - analog tuner step features
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 74 +++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 017d1ef8..669df4b7 100644
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
> @@ -722,6 +723,78 @@ static struct remote_subtest deck_ctl_subtests[] = {
>    TODO: These are very rudimentary tests which should be expanded.
>   */
>  
> +static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	struct cec_msg msg = {};
> +	struct cec_op_tuner_device_info info = {};
> +	__u16 start_freq;
> +	std::vector<struct cec_op_tuner_device_info> info_vec;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (timed_out(&msg) || unrecognized_op(&msg))
> +		return NOTSUPPORTED;
> +	if (refused(&msg))
> +		return REFUSED;

You're missing a 'fail_on_test(cec_msg_status_is_abort(&msg));' line here,
since any other abort reason means the test should fail.

> +	cec_ops_tuner_device_status(&msg, &info);
> +	start_freq = info.analog.ana_freq;
> +	info_vec.push_back(info);
> +
> +	while (1) {
> +		cec_msg_init(&msg, me, la);
> +		cec_msg_tuner_step_increment(&msg);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		fail_on_test(cec_msg_status_is_abort(&msg));
> +		if (cec_msg_status_is_abort(&msg)) {
> +			fail_on_test(abort_reason(&msg) == CEC_OP_ABORT_UNRECOGNIZED_OP);
> +			if (abort_reason(&msg) == CEC_OP_ABORT_REFUSED) {
> +				warn("Tuner step increment does not wrap.\n");
> +				break;
> +			} else {
> +				warn("Tuner at end of service list did not receive feature abort refused.\n");
> +				break;
> +			}
> +		}
> +		cec_msg_init(&msg, me, la);
> +		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		fail_on_test(timed_out_or_abort(&msg));
> +		cec_ops_tuner_device_status(&msg, &info);
> +		if (info.analog.ana_freq == start_freq)
> +			break;
> +		info_vec.push_back(info);
> +	}
> +
> +	for (std::vector<struct cec_op_tuner_device_info>::iterator iter = info_vec.begin();
> +			iter != info_vec.end(); iter++) {
> +		cec_msg_init(&msg, me, la);
> +		cec_msg_select_analogue_service(&msg, iter->analog.ana_bcast_type,
> +			iter->analog.ana_freq, iter->analog.bcast_system);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		fail_on_test(cec_msg_status_is_abort(&msg));
> +		cec_msg_init(&msg, me, la);
> +		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
> +		fail_on_test(!transmit_timeout(node, &msg));
> +		fail_on_test(timed_out_or_abort(&msg));
> +		cec_ops_tuner_device_status(&msg, &info);
> +		fail_on_test(info.analog.ana_freq != iter->analog.ana_freq);
> +		if (iter->is_analog) {
> +			double freq_mhz = (iter->analog.ana_freq * 625) / 10000.0;

Add newline.

> +			info("Analog channel freq: %.2f MHz\n", freq_mhz);
> +		}
> +	}
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_select_analogue_service(&msg, 3, 16000, 9);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(unrecognized_op(&msg));

This test is unnecessary, since the next test will catch this.

> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	return 0;
> +}
> +
>  static int tuner_ctl_give_status(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> @@ -885,6 +958,7 @@ static int tuner_ctl_step_inc(struct node *node, unsigned me, unsigned la, bool
>  }
>  
>  static struct remote_subtest tuner_ctl_subtests[] = {
> +	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
>  	{ "Give Tuner Device Status", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_give_status },
>  	{ "Select Analogue Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_analog_service },
>  	{ "Select Digital Service", CEC_LOG_ADDR_MASK_TUNER, tuner_ctl_sel_digital_service },
> 

Regards,

	Hans
