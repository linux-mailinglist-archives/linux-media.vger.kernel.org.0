Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE73D63588C
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbiKWKAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237175AbiKWJ7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 04:59:15 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BC011A712
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:52:44 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id h2so7604730ile.11
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+hIj0UlmmDfkSHZtcAAkXa3pt/t4947D39io9rN+X0=;
        b=ML2vjydsGlDQcUyrgARmvZuD9uOqTi0Nli/6qyriXgbhbcWKcyHrndYUtTTSe9GE51
         gLY1WJXnmUJmPAs0sLbmrwNo4OVbT9mT+1BuXh947bCM1nYmApM24h+z7eXpxNNvAPkD
         cJNo0DT4SUq3mIZQmjpN56NXFCnD2lmrS4WmJpXdPBg9DG+fx8VjkoX85WvoFJHbiiWi
         hU7Fzx+Li7/JpDClNADAHYtbHHvy8Ar2pE3merTAOK//qRGVgEtwdBeiWk8qKKjnVQ44
         fExzatwGrB6JQjKIe7FksfYOz/MG4n0QLs/WcCV9X0ZT0hp1yUKNceY+DRUHjTqEfu03
         pmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+hIj0UlmmDfkSHZtcAAkXa3pt/t4947D39io9rN+X0=;
        b=UFCk+Vy2tOvJtIBxWbeFmB00WIDcogAtu3NTxQ2Z5NtvaBVvH3tONAfDZ8RpRyMGMJ
         ge32HrJD3d0NPwl+LB8k1b6XO7SmTvZljtnns0IjUEbKRVX3ifAQCEdpST/TdIrKyJg2
         RVkxUOYRJBmE46UwSyQQUgSlQlajgdxjpruiCZfkTpIN0eE0BJr9aI+iQ6PhFIKEzUfe
         2H7UxRju/tuLeq+vHMg3if9Hi+l+jqm0ekAsdYl0RbpkZa1vyIJFdqSyGX5gXjLafTaV
         EZr1iA1Gq0rqKTos7khnSjml6SlvLD767nUL6mlK5mOrp5CHvxu6WfqaLbiezWlEM9QI
         5rvQ==
X-Gm-Message-State: ANoB5pkSiq33i/CIhV9e/WhQyc3SUoINPCpfdKvQZFNU48ll/DD+6Q2E
        exGLV7yXC3RRY0EmEoLQmr+T5kU5sF5FXpVoYsIQ0hZLRCRwqQ==
X-Google-Smtp-Source: AA0mqf4xSvQAtMqvKJp3Bt7JMvW1NC/n03OH7Jy8vOEWkwRm++mjlj+0soF9GOmmCxZm5YWe7oOHzkltGKnjxgxIKF4=
X-Received: by 2002:a92:1948:0:b0:302:4d37:9e66 with SMTP id
 e8-20020a921948000000b003024d379e66mr4696156ilm.277.1669197163852; Wed, 23
 Nov 2022 01:52:43 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntC4XjhTC5jQd6OZF_6WsS+BLUD1QbxzjKTTLdiSgO2VzA@mail.gmail.com>
 <9afffc8e-00b0-fdfc-93fa-3fcb648ad5e6@xs4all.nl>
In-Reply-To: <9afffc8e-00b0-fdfc-93fa-3fcb648ad5e6@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 23 Nov 2022 09:52:26 +0000
Message-ID: <CAPY8ntBz10bc1c119EZVSCM2E0iw5Nt6jbeAb3x_6qDNOuRO5g@mail.gmail.com>
Subject: Re: Handling of colorspace fields in image format
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans
Thanks for the response

On Tue, 22 Nov 2022 at 14:23, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote=
:
>
> On 11/22/22 12:49, Dave Stevenson wrote:
> > Hi Hans
> >
> > This has come about from a discussion with Laurent over how to handle
> > colorspace fields, whether a particular configuration is legitimate,
> > and whether we're looking at the correct behaviour. You're the go-to
> > person for that sort of question :-)
> >
> > - CAPTURE queue (in this case on a M2M ISP device, but that doesn't
> > really matter).
> > - Limited colorspace options are available from the device (standard
> > SDTV BT601 limited range, HDTV BT709 limited range, and JPEG's BT601
> > full range).
> > - VIDIOC_ENUM_FMT flags returns V4L2_FMT_FLAG_CSC_COLORSPACE. It does
> > NOT set V4L2_FMT_FLAG_CSC_XFER_FUNC, V4L2_FMT_FLAG_CSC_YCBCR_ENC, or
> > V4L2_FMT_FLAG_CSC_QUANTIZATION. (No documentation saying this isn't
> > permitted, and why have 4 flags if they aren't independent).
> > - VIDIOC_S_FMT called with V4L2_PIX_FMT_FLAG_SET_CSC set.
> >
> > Which colourspace fields from the format are applied?
>
> If only V4L2_FMT_FLAG_CSC_COLORSPACE is set, then only the colorspace
> field from userspace is applied. Which is almost certainly wrong
> sicne switching between the colorspace that is received and the
> colorspace that you want requires complex calculations. And if a
> device can do that, then it certainly can also allow userspace to
> override the other three colorimetry fields. So setting just
> V4L2_FMT_FLAG_CSC_COLORSPACE makes no sense.
>
> The V4L2_FMT_FLAG_CSC_* flags come into play if you want to allow
> userspace to convert the colorimetry of the captured data to another
> colorimetry. That's often not supported, the colorimetry fields are
> just filled in based on what was captured. Often there is some support
> to convert between YCBCR/RGB/QUANTIZATION settings, so such devices
> can set V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_QUANTIZATION
> if they want. This is typically a 3x3 matrix + one vector in the hardware=
.

It's not a simple 3x3 matrix + vector in this case, and selection is
via an enum.

> >
> > The driver is saying that only colorspace is supported, and [1] says th=
at
>
> No, the driver is saying that it can convert to another colorspace
> if requested to do so by userspace, while leaving the xfer function,
> ycbcr encoding and quantization range untouched.
> That's a highly unlikely situation, and I think it's likely a bug
> in the driver. It should probably drop that flag.
>
> > "The first is the colorspace identifier (enum v4l2_colorspace) which
> > defines the chromaticities, the default transfer function, the default
> > Y=E2=80=99CbCr encoding and the default quantization method"
> > so we have all 4 parameters defined via the defaults.
> > I read it that the ycbcr_enc, quantization, and xfer_func values
> > passed in should be ignored and replaced with the "default" values
> > derived from the colorspace value (use V4L2_MAP_XFER_FUNC_DEFAULT,
> > V4L2_MAP_YCBCR_ENC_DEFAULT, and V4L2_MAP_QUANTIZATION_DEFAULT)
> > Is this a valid interpretation?
>
> No. First of all, unless one or more of the V4L2_FMT_FLAG_CSC_* flags are
> set, the driver fills in these fields, and ignores what userspace
> filled in. So [1] just describes what these fields mean, and that you
> can use those DEFAULT macros to determine what the actual xfer_func,
> ycbcr_enc or quantization is if the driver left those values to 0.
>
> What those defaults are depends on the chosen colorspace field.
>
> >
> > Confusion comes from [2] for V4L2_PIX_FMT_FLAG_SET_CSC saying:
>
> So if this flag is set, then userspace can ask the driver to convert
> to specific colorimetry settings, if supported (what is supported is
> indicated by the V4L2_FMT_FLAG_CSC_* flags returned by ENUM_FMT).
>
> > "If the colorimetry field (colorspace, xfer_func, ycbcr_enc, hsv_enc
> > or quantization) is set to *_DEFAULT, then that colorimetry setting
> > will remain unchanged from what was received."
> > What is "received" in this case?
>
> This relates to a capture device, so for an m2m device that means
> the colorimetry that userspace set for the output device.

This is an ISP. What is the xfer function, ycbcr encoding and
quantization range settings for a Bayer image with colorspace
V4L2_COLORSPACE_RAW? The documentation does not work for that use
case.

> A typical m2m device will just copy the colorimetry fields from output
> to capture format. If you want it to act as a csc device, then it will
> have to advertise the relevant V4L2_FMT_FLAG_CSC_* flags.
>
> If it converts between different pixelformats (e.g. RGB to YUV), then
> there is an implicit csc step, of course, but the result will be using
> the default rules.
>
> Example: userspace passes a frame with V4L2_COLORSPACE_BT2020, V4L2_XFER_=
FUNC_709,
> V4L2_YCBCR_ENC_DEFAULT (n/a) and V4L2_QUANTIZATION_FULL_RANGE, and wants
> a NV12 back. The colorimetry for that will be V4L2_COLORSPACE_BT2020,
> V4L2_XFER_FUNC_709, V4L2_YCBCR_ENC_BT2020 (most likely, hw limitations mi=
ght
> force this to 709 or 601) and V4L2_QUANTIZATION_LIM_RANGE.
>
> So this is all determined by the driver, not userspace.

Now I pass a Bayer frame of colorspace V4L2_COLORSPACE_RAW,
V4L2_XFER_FUNC_NONE in, and ask for NV12 out. What properties do I use
on that NV12 frame please?
Likewise I could pass in RGB with colorspace V4L2_COLORSPACE_SRGB and
ask for NV12 out that is to be JPEG encoded. How do I ensure I get the
appropriate conversion parameters?

> > There is no inherent colourspace for
> > the device as it is M2M, so does that come back to being default
> > anyway, or reflecting the OUTPUT queue which might be Bayer and have
> > no range? Can we still ignore them all as the relevant
> > V4L2_FMT_FLAG_CSC_* flags aren't set?
> >
> > Hopefully you can enlighten us.
>
> So, to recap:
>
> 1) for an m2m device it is userspace that provides the colorimetry data
>    in the output format. For a regular capture device it is the
>    video receiver driver that sets it (typically determined by the
>    sensor driver or a video receiver driver).
> 2) Implicit CSC conversion might take place when converting between
>    different pixel formats. Typically this will only affect the
>    ycbcr_enc and quantization fields, since that's usually all that
>    is supported. The colorspace and xfer_func fields are just copied
>    from the output pixelformat.

As above, RGB or Bayer in to NV12 out makes no sense to copy
colorspace and xfer_func fields from the output pixelformat.

> 3) If explicit CSC conversion is signaled by the driver by setting
>    V4L2_FMT_FLAG_CSC_* flags, then userspace can request specific
>    colorimetry results, and the hardware will be configured by the
>    driver to give that result.

Not all results are achievable by all hardware.
So do we set all the V4L2_FMT_FLAG_CSC_* flags and just alter the bits
of the request that aren't supported in a way that the driver sees
fit?

> I hope this helps!

Sort of, but only by muddying the waters.

Flipping it around then and asking how it should be implemented.

We have configuration for the ISP output path that produces 3
configurations regardless of input format corresponding to:
- V4L2_COLORSPACE_JPEG, V4L2_YCBCR_ENC_601, V4L2_XFER_FUNC_SRGB,
V4L2_QUANTIZATION_FULL_RANGE
- V4L2_COLORSPACE_SMPTE170M, V4L2_YCBCR_ENC_601, V4L2_XFER_FUNC_709,
V4L2_QUANTIZATION_LIM_RANGE
- V4L2_COLORSPACE_REC709, V4L2_YCBCR_ENC_709, V4L2_XFER_FUNC_709,
V4L2_QUANTIZATION_LIM_RANGE
(Those should be the the same ycbcr_enc, xfer_func, and quantization
as the defaults for each colourspace, and translate to the normal
values used for JPEG, SDTV, and HDTV respectively).
These are selected by enum and we are not proposing on adding any extra one=
s.

The input is going to be Bayer with colorspace set to
V4L2_COLORSPACE_RAW. There are therefore no colorspace parameters that
can be "left unchanged" or otherwise copied from the OUPTUT queue.

What is the correct way to allow userspace selection of those options
within V4L2?


Looking at the datasheet for TC358743 (a chip that your company
maintains the driver for), it can convert the incoming HDMI to 6
output formats via the VI_REP register field VOUT_COLOR_SEL:
RGB Full
RGB Limited
601YCbCr Full
601 YCbCr Limited
709 YCbCr Full
709 YCbCr Limited
This is the same situation as for our ISP - configuration through an
enum even though there is more complexity underneath.

Currently the driver always selects 601 YCbCr Limited for UYVY output,
or RGB Full for 24bpp RGB.
If we were to extend that driver in a non-media controller system to
allow selection of the converted colourspace, how do we enforce those
restrictions?
Under MC you get a similar set of flags in V4L2_MBUS_FRAMEFMT_SET_CSC
for struct v4l2_mbus_framefmt and set_format, and
V4L2_SUBDEV_MBUS_CODE_CSC_* in struct v4l2_subdev_mbus_code_enum, so
the same principles will presumably apply there too.
(I'm noting that the tc358743 driver currently doesn't bother setting
any of the colorimetry fields other than colorspace).

Thanks
  Dave

> Regards,
>
>         Hans
>
> >
> > Cheers
> >   Dave
> >
> > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colo=
rspaces-defs.html
> > [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixf=
mt-v4l2.html#v4l2-pix-fmt-flag-set-csc
>
