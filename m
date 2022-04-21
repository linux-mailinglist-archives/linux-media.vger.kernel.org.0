Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB2150A382
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389800AbiDUPBi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 21 Apr 2022 11:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389797AbiDUPBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 11:01:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5797D4507D
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:58:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhYGa-0007fR-OJ; Thu, 21 Apr 2022 16:58:44 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhYGb-004NdR-B3; Thu, 21 Apr 2022 16:58:43 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhYGZ-000BxH-5I; Thu, 21 Apr 2022 16:58:43 +0200
Message-ID: <f788dd2e580d01cb91bde968e8c5fba2035c264f.camel@pengutronix.de>
Subject: Re: [PATCH 6/7] media: coda: enable capture G_PARM for stateful
 encoder
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Thu, 21 Apr 2022 16:58:43 +0200
In-Reply-To: <bf945836-a7fb-a67f-1f89-e5cc85fec808@xs4all.nl>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-6-p.zabel@pengutronix.de>
         <bf945836-a7fb-a67f-1f89-e5cc85fec808@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Do, 2022-04-21 at 12:30 +0200, Hans Verkuil wrote:
[...]
> I think this is actually a v4l2-compliance bug, not a driver bug.
> 
> G/S_PARM doesn't make sense for the capture queue of a stateful encoder, unless
> V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL is set to reserve HW resources.
> 
> See https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-enum-fmt.html#fmtdesc-flags
> 
> That flags isn't used, so v4l2-compliance shouldn't complain.
> 
> Try this v4l2-compliance patch to see if it resolved the fails for this patch
> and the next patch (7/7).
> 
> v4l2-compliance patch:
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 3761b1fa..269a3832 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -1341,8 +1341,16 @@ static int testParmType(struct node *node, unsigned type)
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		if (node->g_caps() & buftype2cap[type]) {
> -			fail_on_test(ret && node->has_frmintervals);
> -			fail_on_test(ret && node->has_enc_cap_frame_interval);
> +			if (is_stateful_enc) {
> +				if (V4L2_TYPE_IS_OUTPUT(type))
> +					fail_on_test(ret && node->has_frmintervals);
> +				else if (node->has_enc_cap_frame_interval)
> +					fail_on_test(ret);
> +				else
> +					fail_on_test(!ret);
> +			} else {
> +				fail_on_test(ret && node->has_frmintervals);
> +			}
>  		}
>  		break;
>  	default:

You are right, this patch resolves the compliance failures addressed by
patches 6 and 7.

regards
Philipp
