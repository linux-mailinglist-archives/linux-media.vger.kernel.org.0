Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E4E633ED3
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 15:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbiKVOXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 09:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiKVOXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 09:23:36 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340B827B2A
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 06:23:30 -0800 (PST)
X-KPN-MessageId: ae75b2d5-6a70-11ed-888a-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id ae75b2d5-6a70-11ed-888a-005056992ed3;
        Tue, 22 Nov 2022 15:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=s5U1L4Cd2k7c7JJwOp3Bn5DnOQH4TuBfCzOOFY+3Dbw=;
        b=j9qZ75b0imMf5+U5qcVSXD9FJytbg28ZXdhMISsOoI+VfLjEdN6Ya6MwicWFIqltEAATmeU84YvRT
         mvlmW8BJ2mG1357SglBxK5CL0WReCYCgoDD3h6WH3mYst1TBL3Us8Bm1Gu2KfP0B/1Gx7sjZcAD2jO
         odUYX5uYc1KDRFfy8g6zEPKXZBFC91BCyfMSS594sl6EM3pB6zb0eUCOSdE7Bn0gy+GiS9ce029+k/
         vNcS7EGfWe+8SwpTyPjP4cMYlVs7QD55Girnm7nWyI+j3+yBOCKuNg8oKfDrGRvMz7XGzlboR0OrCb
         79QTEGvRhxLdTPzJgbcAFVjIdvdqykg==
X-KPN-MID: 33|+VMLsTZCZTrYBypysOnFM6y3FbLbBSyipN0IW2fgWDazpiXSVJF8+yRbHwpwTWN
 MtSFEsN8klAwtgX+awytW7RCEdzKU+ed3bExjDt3apeA=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|81/TbkWVcLWH1WqlrafaCm3Lcxa//x4CexHyn45HXx003U+wTWbKkLDKq3dJ47b
 xTnRBl4++uOOE4ZBYoU6Xdg==
X-Originating-IP: 173.38.220.59
Received: from [10.47.77.219] (unknown [173.38.220.59])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 3b93ba34-6a71-11ed-9b28-00505699d6e5;
        Tue, 22 Nov 2022 15:23:29 +0100 (CET)
Message-ID: <9afffc8e-00b0-fdfc-93fa-3fcb648ad5e6@xs4all.nl>
Date:   Tue, 22 Nov 2022 15:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Handling of colorspace fields in image format
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <CAPY8ntC4XjhTC5jQd6OZF_6WsS+BLUD1QbxzjKTTLdiSgO2VzA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAPY8ntC4XjhTC5jQd6OZF_6WsS+BLUD1QbxzjKTTLdiSgO2VzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/22/22 12:49, Dave Stevenson wrote:
> Hi Hans
> 
> This has come about from a discussion with Laurent over how to handle
> colorspace fields, whether a particular configuration is legitimate,
> and whether we're looking at the correct behaviour. You're the go-to
> person for that sort of question :-)
> 
> - CAPTURE queue (in this case on a M2M ISP device, but that doesn't
> really matter).
> - Limited colorspace options are available from the device (standard
> SDTV BT601 limited range, HDTV BT709 limited range, and JPEG's BT601
> full range).
> - VIDIOC_ENUM_FMT flags returns V4L2_FMT_FLAG_CSC_COLORSPACE. It does
> NOT set V4L2_FMT_FLAG_CSC_XFER_FUNC, V4L2_FMT_FLAG_CSC_YCBCR_ENC, or
> V4L2_FMT_FLAG_CSC_QUANTIZATION. (No documentation saying this isn't
> permitted, and why have 4 flags if they aren't independent).
> - VIDIOC_S_FMT called with V4L2_PIX_FMT_FLAG_SET_CSC set.
> 
> Which colourspace fields from the format are applied?

If only V4L2_FMT_FLAG_CSC_COLORSPACE is set, then only the colorspace
field from userspace is applied. Which is almost certainly wrong
sicne switching between the colorspace that is received and the
colorspace that you want requires complex calculations. And if a
device can do that, then it certainly can also allow userspace to
override the other three colorimetry fields. So setting just
V4L2_FMT_FLAG_CSC_COLORSPACE makes no sense.

The V4L2_FMT_FLAG_CSC_* flags come into play if you want to allow
userspace to convert the colorimetry of the captured data to another
colorimetry. That's often not supported, the colorimetry fields are
just filled in based on what was captured. Often there is some support
to convert between YCBCR/RGB/QUANTIZATION settings, so such devices
can set V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_QUANTIZATION
if they want. This is typically a 3x3 matrix + one vector in the hardware.

> 
> The driver is saying that only colorspace is supported, and [1] says that

No, the driver is saying that it can convert to another colorspace
if requested to do so by userspace, while leaving the xfer function,
ycbcr encoding and quantization range untouched.

That's a highly unlikely situation, and I think it's likely a bug
in the driver. It should probably drop that flag.

> "The first is the colorspace identifier (enum v4l2_colorspace) which
> defines the chromaticities, the default transfer function, the default
> Y’CbCr encoding and the default quantization method"
> so we have all 4 parameters defined via the defaults.
> I read it that the ycbcr_enc, quantization, and xfer_func values
> passed in should be ignored and replaced with the "default" values
> derived from the colorspace value (use V4L2_MAP_XFER_FUNC_DEFAULT,
> V4L2_MAP_YCBCR_ENC_DEFAULT, and V4L2_MAP_QUANTIZATION_DEFAULT)
> Is this a valid interpretation?

No. First of all, unless one or more of the V4L2_FMT_FLAG_CSC_* flags are
set, the driver fills in these fields, and ignores what userspace
filled in. So [1] just describes what these fields mean, and that you
can use those DEFAULT macros to determine what the actual xfer_func,
ycbcr_enc or quantization is if the driver left those values to 0.

What those defaults are depends on the chosen colorspace field.

> 
> Confusion comes from [2] for V4L2_PIX_FMT_FLAG_SET_CSC saying:

So if this flag is set, then userspace can ask the driver to convert
to specific colorimetry settings, if supported (what is supported is
indicated by the V4L2_FMT_FLAG_CSC_* flags returned by ENUM_FMT).

> "If the colorimetry field (colorspace, xfer_func, ycbcr_enc, hsv_enc
> or quantization) is set to *_DEFAULT, then that colorimetry setting
> will remain unchanged from what was received."
> What is "received" in this case?

This relates to a capture device, so for an m2m device that means
the colorimetry that userspace set for the output device.

A typical m2m device will just copy the colorimetry fields from output
to capture format. If you want it to act as a csc device, then it will
have to advertise the relevant V4L2_FMT_FLAG_CSC_* flags.

If it converts between different pixelformats (e.g. RGB to YUV), then
there is an implicit csc step, of course, but the result will be using
the default rules.

Example: userspace passes a frame with V4L2_COLORSPACE_BT2020, V4L2_XFER_FUNC_709,
V4L2_YCBCR_ENC_DEFAULT (n/a) and V4L2_QUANTIZATION_FULL_RANGE, and wants
a NV12 back. The colorimetry for that will be V4L2_COLORSPACE_BT2020,
V4L2_XFER_FUNC_709, V4L2_YCBCR_ENC_BT2020 (most likely, hw limitations might
force this to 709 or 601) and V4L2_QUANTIZATION_LIM_RANGE.

So this is all determined by the driver, not userspace.

> There is no inherent colourspace for
> the device as it is M2M, so does that come back to being default
> anyway, or reflecting the OUTPUT queue which might be Bayer and have
> no range? Can we still ignore them all as the relevant
> V4L2_FMT_FLAG_CSC_* flags aren't set?
> 
> Hopefully you can enlighten us.

So, to recap:

1) for an m2m device it is userspace that provides the colorimetry data
   in the output format. For a regular capture device it is the
   video receiver driver that sets it (typically determined by the
   sensor driver or a video receiver driver).
2) Implicit CSC conversion might take place when converting between
   different pixel formats. Typically this will only affect the
   ycbcr_enc and quantization fields, since that's usually all that
   is supported. The colorspace and xfer_func fields are just copied
   from the output pixelformat.
3) If explicit CSC conversion is signaled by the driver by setting
   V4L2_FMT_FLAG_CSC_* flags, then userspace can request specific
   colorimetry results, and the hardware will be configured by the
   driver to give that result.

I hope this helps!

Regards,

	Hans

> 
> Cheers
>   Dave
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspaces-defs.html
> [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-v4l2.html#v4l2-pix-fmt-flag-set-csc

