Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA00C50A370
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389799AbiDUO6A convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 21 Apr 2022 10:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389824AbiDUO5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:57:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3A13A2
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:54:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhYCr-00074W-QG; Thu, 21 Apr 2022 16:54:53 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhYCs-004Ncy-E0; Thu, 21 Apr 2022 16:54:52 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nhYCp-000BtJ-U8; Thu, 21 Apr 2022 16:54:51 +0200
Message-ID: <84356b059e572118136d93d294069ae976c22743.camel@pengutronix.de>
Subject: Re: [PATCH 5/7] media: coda: fix default JPEG colorimetry
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Date:   Thu, 21 Apr 2022 16:54:51 +0200
In-Reply-To: <0f5d9c16-860b-015f-8028-234d2fb96959@xs4all.nl>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
         <20220404163533.707508-5-p.zabel@pengutronix.de>
         <0f5d9c16-860b-015f-8028-234d2fb96959@xs4all.nl>
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

On Do, 2022-04-21 at 12:02 +0200, Hans Verkuil wrote:
[...]
> > -	if (fmt->pixelformat == V4L2_PIX_FMT_JPEG)
> > -		colorspace = V4L2_COLORSPACE_JPEG;
> 
> It's perfectly fine to keep this, the problem occurs with the raw image side
> (capture for the decoder, output for the encoder).
> 
> There the colorspace must be SRGB, the xfer_func may be 0 or SRGB,

v4l2-compliance doesn't allow xfer_func 0:

		fail: v4l2-test-formats.cpp(835): fmt_jpeg.g_xfer_func() != V4L2_XFER_FUNC_SRGB
	test VIDIOC_S_FMT: FAIL

Is this too strict?

> and the
> ycbcr_enc is 0 (if not a YUV pixelformat) or ENC_601 (if it is a YUV format).

Why does it have to be ENC_601 for YUV formats? Both
V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_JPEG) and
V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB) map to
V4L2_YCBCR_ENC_601 regardless of the pixel format, so there should be
no difference if 0 was allowed as well.

On the other hand, quantization should be set to
V4L2_QUANTIZATION_FULL_RANGE for YUV formats on the raw image side, as
that defaults to LIM_RANGE for raw YUV images with SRGB colorspace.

Basically, I wonder whether or not it would be a good idea to apply the
following change to v4l2-compliance:

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 269a3832fcdf..902c66367ff7 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -832,8 +832,10 @@ static int testJPEGColorspace(const cv4l_fmt &fmt_raw, const cv4l_fmt &fmt_jpeg,
        }
        /* V4L2_COLORSPACE_JPEG is shorthand for these values: */
        fail_on_test(fmt_jpeg.g_colorspace() != V4L2_COLORSPACE_SRGB);
-       fail_on_test(fmt_jpeg.g_xfer_func() != V4L2_XFER_FUNC_SRGB);
-       fail_on_test(fmt_jpeg.g_ycbcr_enc() != V4L2_YCBCR_ENC_601);
+       fail_on_test(fmt_jpeg.g_xfer_func() != V4L2_XFER_FUNC_DEFAULT &&
+                    fmt_jpeg.g_xfer_func() != V4L2_XFER_FUNC_SRGB);
+       fail_on_test(fmt_jpeg.g_ycbcr_enc() != V4L2_YCBCR_ENC_DEFAULT &&
+                    fmt_jpeg.g_ycbcr_enc() != V4L2_YCBCR_ENC_601);
        fail_on_test(fmt_jpeg.g_quantization() != V4L2_QUANTIZATION_FULL_RANGE);
        return 0;
 }

Actually, if the hardware can convert from other YUV encodings such as 709,
then other YUV encodings are valid, but I assume that's not the case.

True, the hardware is completely oblivious to colorimetry.

regards
Philipp
