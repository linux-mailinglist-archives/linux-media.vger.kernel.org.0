Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E88E509DB2
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 12:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238291AbiDUKdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 06:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235786AbiDUKdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 06:33:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B145237CE
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 03:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25A3AB823E5
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 10:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C11C385A5;
        Thu, 21 Apr 2022 10:30:16 +0000 (UTC)
Message-ID: <bf945836-a7fb-a67f-1f89-e5cc85fec808@xs4all.nl>
Date:   Thu, 21 Apr 2022 12:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] media: coda: enable capture G_PARM for stateful
 encoder
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
 <20220404163533.707508-6-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220404163533.707508-6-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On 04/04/2022 18:35, Philipp Zabel wrote:
> Allow to call G_PARM with type == V4L2_BUF_TYPE_VIDEO_CAPTURE,
> to fix the following v4l2-compliance test failure:
> 
> 		fail: v4l2-test-formats.cpp(1344): ret && node->has_frmintervals
> 	test VIDIOC_G/S_PARM: FAIL
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/platform/chips-media/coda-common.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
> index c068c16d1eb4..33fcd8c7d72b 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -1341,9 +1341,6 @@ static int coda_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	struct coda_ctx *ctx = fh_to_ctx(fh);
>  	struct v4l2_fract *tpf;
>  
> -	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> -		return -EINVAL;
> -
>  	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
>  	tpf = &a->parm.output.timeperframe;
>  	tpf->denominator = ctx->params.framerate & CODA_FRATE_RES_MASK;

I think this is actually a v4l2-compliance bug, not a driver bug.

G/S_PARM doesn't make sense for the capture queue of a stateful encoder, unless
V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL is set to reserve HW resources.

See https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-enum-fmt.html#fmtdesc-flags

That flags isn't used, so v4l2-compliance shouldn't complain.

Try this v4l2-compliance patch to see if it resolved the fails for this patch
and the next patch (7/7).

v4l2-compliance patch:

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 3761b1fa..269a3832 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -1341,8 +1341,16 @@ static int testParmType(struct node *node, unsigned type)
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (node->g_caps() & buftype2cap[type]) {
-			fail_on_test(ret && node->has_frmintervals);
-			fail_on_test(ret && node->has_enc_cap_frame_interval);
+			if (is_stateful_enc) {
+				if (V4L2_TYPE_IS_OUTPUT(type))
+					fail_on_test(ret && node->has_frmintervals);
+				else if (node->has_enc_cap_frame_interval)
+					fail_on_test(ret);
+				else
+					fail_on_test(!ret);
+			} else {
+				fail_on_test(ret && node->has_frmintervals);
+			}
 		}
 		break;
 	default:
