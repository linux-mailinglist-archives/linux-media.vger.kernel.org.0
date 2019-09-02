Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D132DA5374
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730825AbfIBJyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:54:32 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38697 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730287AbfIBJyc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 05:54:32 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4j2YiCM6KThuu4j2binbMx; Mon, 02 Sep 2019 11:54:30 +0200
Subject: Re: [PATCH] cec-compliance: system audio control tests
To:     Jiunn Chang <c0d1n61at3@gmail.com>, rainer.auran@gmail.com,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190902093346.20041-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6fa47daa-c76e-ece8-41a6-9a2a76f25eab@xs4all.nl>
Date:   Mon, 2 Sep 2019 11:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902093346.20041-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEV1o5rBmiCHhi9VPZqQe5vfKD2anAsjfm7xKekRWk8d6o7bd7sxEWee+jVRgZsmY1llWlPMDPEf5Jv0guLRYdWZVmN/c1hYCkPMT/SVdxPtklG4p/3S
 XaEv0tbHhIUvwI9tauykA/ScVPWKcFR8rmQthHW/X+6TIqe4OP2mIgBmEIaC/7k1SUXJ9vCr1Lr9F4JYK7JJnrt6YkvPoYzFk72Fit7+JyeNIj3ETaYcOfRl
 PQL4typ5Qt4Tod0dqw2Ip55vGh4EK46mhZ6LoVmixIk6T4vAPB8fcUCJWGVatkp+Ska6+fOAsnQYd3ORmCL78g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just one small correction:

On 9/2/19 11:33 AM, Jiunn Chang wrote:
> Add user control press operands:
>  - Mute Function
>  - Restore Volume Function
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 32 +++++++++++++++++++++++++
>  utils/cec-follower/cec-processing.cpp   |  6 +++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 8611350e..872bb9ad 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -673,6 +673,32 @@ static int sac_user_control_press_mute(struct node *node, unsigned me, unsigned
>  	return 0;
>  }
>  
> +static int sac_user_control_press_mute_function(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	__u8 ret;
> +
> +	if ((ret = sac_util_send_user_control_press(node, me, la, 0x65)))
> +		return ret;
> +	fail_on_test_v2(node->remote[la].cec_version,
> +			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
> +			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_ON);
> +
> +	return 0;
> +}
> +
> +static int sac_user_control_press_restore_volume_function(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	__u8 ret;
> +
> +	if ((ret = sac_util_send_user_control_press(node, me, la, 0x66)))
> +		return ret;
> +	fail_on_test_v2(node->remote[la].cec_version,
> +			la == CEC_LOG_ADDR_AUDIOSYSTEM &&
> +			node->remote[la].mute == CEC_OP_AUD_MUTE_STATUS_OFF);
> +
> +	return 0;
> +}
> +
>  static int sac_user_control_release(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> @@ -763,6 +789,12 @@ struct remote_subtest sac_subtests[] = {
>  	{ "User Control Pressed (Mute)",
>  	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>  	  sac_user_control_press_mute },
> +	{ "User Control Pressed (Restore Volume Function)",
> +	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +	  sac_user_control_press_restore_volume_function },
> +	{ "User Control Pressed (Mute Function)",
> +	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +	  sac_user_control_press_mute_function },
>  	{ "User Control Released",
>  	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>  	  sac_user_control_release },
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 27172560..c6d88647 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -516,6 +516,12 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		case 0x43:
>  			node->state.mute = !node->state.mute;
>  			break;
> +		case 0x65:
> +			node->state.mute = CEC_OP_AUD_MUTE_STATUS_ON;
> +			break;
> +		case 0x66:
> +			node->state.mute = CEC_OP_AUD_MUTE_STATUS_OFF;

state.mute is a bool, so just use true and false instead of CEC_OP_AUD_MUTE_STATUS_ON/OFF.

> +			break;
>  		case 0x6B:
>  			if (!enter_standby(node))
>  				exit_standby(node);
> 

Regards,

	Hans
