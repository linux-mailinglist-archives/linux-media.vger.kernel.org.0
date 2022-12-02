Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F16640995
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbiLBPxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233041AbiLBPxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:53:43 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7AD2D1C7
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:53:38 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id j14so2483053vkp.3
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq/0NCwlNIblUhzj7Ba5rSEzEP6y1TnT23yqXbOFc7c=;
        b=fAiClDCG++algJEe5ZIOlzY0GkhejNEbN+9Jfyt0JvYCOnJ7Df6gXNN3pynaSldRUH
         Vpo6AzLAl3y6+8i7a4esTf+GAtlUz9aV2WTyL3qYOPQq7FYo+SyMkMF+UFD2uR+VCjXz
         /VdSALDk7Zg6PBTtdv0wjpmNbi7KpZM35toElwkvmO5J/dMuSw6GFV55u4AISt70+vkp
         Nw/SnIhUyOFP5D4iZ9DDsSIIWhqOhIOCWl223FGjaNacZ50/sPgV6AdN3qcL1QlRydYC
         NmtxO/SjSwcA0MTE/TVeplBXl9aTrgkpx1KE/uKAZULWsLqKbArSP/Q6LRL4V9tKnORf
         sStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq/0NCwlNIblUhzj7Ba5rSEzEP6y1TnT23yqXbOFc7c=;
        b=L6Wh9k60hz2yHDo4Twg6oKUp5oO4ZZlY8SukdsyjunJR/eJ4yrRf68t4k6+In4CF5d
         67H3LKvp5HeBzlG9Rn58UHOqusEleSBxF2R9JWmNSEwRWxKgnkUpCc+xBKeLGaGhqztw
         pdV9V8YwBMDf67L7i7xmfxyqyZkysMxjf+st5ofhXKz9kLrnvrvLRQ1o4yDQZ0DG7i6G
         HKNfXCRmiyLn4AeQJbJR80D4RV9ou7CXMiH/vrzS0NGVKyP10m4ifQhfVUsx8EgH5s8N
         kPLgFRuySYXnmfGNt6eQ817+0h9liUJshTLvfd1RKA6fvoZ/+fvwKHoqdrj782L8i0x8
         Bnuw==
X-Gm-Message-State: ANoB5pm1ogvDmkCBNbIPoEW6pBAeoYTKpxlzAT3sE6xK8GQpKAPprYPN
        D9DFrxuNGgnO5rqTOuyTqNrMz/5BBhhZoIgFrnMh2Q==
X-Google-Smtp-Source: AA0mqf79pbfoxLRtUZgJ3f929MaX1u8rV0XzihUTNPbcbtP78CCyxLXw/5EKYJzYdC7KadrccIApjR/4OweTMnR2ijA=
X-Received: by 2002:a1f:2b8e:0:b0:3bc:5598:2096 with SMTP id
 r136-20020a1f2b8e000000b003bc55982096mr32430654vkr.36.1669996416728; Fri, 02
 Dec 2022 07:53:36 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntC4XjhTC5jQd6OZF_6WsS+BLUD1QbxzjKTTLdiSgO2VzA@mail.gmail.com>
 <9afffc8e-00b0-fdfc-93fa-3fcb648ad5e6@xs4all.nl> <CAPY8ntBz10bc1c119EZVSCM2E0iw5Nt6jbeAb3x_6qDNOuRO5g@mail.gmail.com>
 <a0db73c5-fd80-cce5-8669-0b26128304e7@xs4all.nl> <Y36Sm+xu8zKyVD2A@pendragon.ideasonboard.com>
 <c203741f-fcf9-55b3-7991-80375bf91e7e@xs4all.nl> <Y3/ryX/mGUV9B/jM@pendragon.ideasonboard.com>
 <8bdce348-06d2-1d63-c0b1-5c85d3e022e5@xs4all.nl>
In-Reply-To: <8bdce348-06d2-1d63-c0b1-5c85d3e022e5@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 2 Dec 2022 15:53:20 +0000
Message-ID: <CAPY8ntDCPWgm=t_jcDynYGrA=MWUt5tQF_vY9B5rkv0rRvp1Pg@mail.gmail.com>
Subject: Re: Handling of colorspace fields in image format
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        David Plowman <david.plowman@raspberrypi.com>
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

Hi Hans & Laurent

Sorry, this last week has been crazy.

On Fri, 25 Nov 2022 at 10:01, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote=
:
>
> On 24/11/2022 23:10, Laurent Pinchart wrote:
> > Hi Hans,
> >
> > (CC'ing David)
> >
> > Thank you for your answer.
> >
> > On Thu, Nov 24, 2022 at 01:54:27PM +0100, Hans Verkuil wrote:
> >> On 23/11/2022 22:37, Laurent Pinchart wrote:
> >>> On Wed, Nov 23, 2022 at 03:17:16PM +0100, Hans Verkuil wrote:
> >>>> On 23/11/2022 10:52, Dave Stevenson wrote:
> >>>>> On Tue, 22 Nov 2022 at 14:23, Hans Verkuil wrote:
> >>>>>> On 11/22/22 12:49, Dave Stevenson wrote:
> >>>>>>> Hi Hans
> >>>>>>>
> >>>>>>> This has come about from a discussion with Laurent over how to ha=
ndle
> >>>>>>> colorspace fields, whether a particular configuration is legitima=
te,
> >>>>>>> and whether we're looking at the correct behaviour. You're the go=
-to
> >>>>>>> person for that sort of question :-)
> >>>>>>>
> >>>>>>> - CAPTURE queue (in this case on a M2M ISP device, but that doesn=
't
> >>>>>>> really matter).
> >>>>>>> - Limited colorspace options are available from the device (stand=
ard
> >>>>>>> SDTV BT601 limited range, HDTV BT709 limited range, and JPEG's BT=
601
> >>>>>>> full range).
> >>>>>>> - VIDIOC_ENUM_FMT flags returns V4L2_FMT_FLAG_CSC_COLORSPACE. It =
does
> >>>>>>> NOT set V4L2_FMT_FLAG_CSC_XFER_FUNC, V4L2_FMT_FLAG_CSC_YCBCR_ENC,=
 or
> >>>>>>> V4L2_FMT_FLAG_CSC_QUANTIZATION. (No documentation saying this isn=
't
> >>>>>>> permitted, and why have 4 flags if they aren't independent).
> >>>>>>> - VIDIOC_S_FMT called with V4L2_PIX_FMT_FLAG_SET_CSC set.
> >>>>>>>
> >>>>>>> Which colourspace fields from the format are applied?
> >>>>>>
> >>>>>> If only V4L2_FMT_FLAG_CSC_COLORSPACE is set, then only the colorsp=
ace
> >>>>>> field from userspace is applied. Which is almost certainly wrong
> >>>>>> sicne switching between the colorspace that is received and the
> >>>>>> colorspace that you want requires complex calculations. And if a
> >>>>>> device can do that, then it certainly can also allow userspace to
> >>>>>> override the other three colorimetry fields. So setting just
> >>>>>> V4L2_FMT_FLAG_CSC_COLORSPACE makes no sense.
> >>>
> >>> I think part of the confusion is that we use the word "colorspace"
> >>> through the API to mean two things. The text below refers to capture
> >>> queues only, for output queues the story is different.
> >>>
> >>> Historically, the colorspace field and the word colorspace has meant =
a
> >>> colour space preset, a single value combining the primary colours
> >>> chromaticities, the transfer function, and, for YUV formats, the YCbC=
r
> >>> encoding and the quantization range.
> >>>
> >>> Later, explicit fields were added to describe the transfer function,
> >>> YCbCr encoding and quantization range. The colorspace field kept is
> >>> name, but, if my understanding is correct, shifted to describe the
> >>> primary colours chromaticities *only*.
> >>
> >> Correct. And technically, that is also correct: a colorspace describes
> >> just the primaries and whitepoint.
> >
> > This dual definition of colorspace (historical vs current) really hurts
> > :-( Is it worth stating this *very* explicitly in the documentation ?
>
> It wouldn't hurt. Patches are welcome.
>
> >
> >>> Drivers that didn't support the new fields would set them to 0, which
> >>> maps to V4L2_MAP_XFER_FUNC_DEFAULT, V4L2_MAP_YCBCR_ENC_DEFAULT and
> >>> V4L2_MAP_QUANTIZATION_DEFAULT. To preserve backward compatibility,
> >>> userspace was required to interpret DEFAULT values as the default
> >>> implied by the colorspace field and the format type (RGB vs. YUV).
> >>>
> >>> This scheme was designed to only cover drivers that do no allow
> >>> userspace to modify the colour space, as all this predates the additi=
on
> >>> to the V4L2 specification of the V4L2_FMT_FLAG_CSC_* flags. Drivers t=
hat
> >>> support V4L2_FMT_FLAG_CSC_* must use the new scheme, and interpret th=
e
> >>> colorspace field as meaning the primary colours chromaticities only.
> >>>
> >>> Hans, is this correct ?
> >>
> >> Yes.

Minor issue that this isn't explicitly stated anywhere. (I know,
comprehensive documentation is hard).

Actually worse than that in para 1 of [1]:
"Most of the time only the colorspace field of struct v4l2_pix_format
or struct v4l2_pix_format_mplane needs to be filled in."

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/colorspa=
ces-defs.html#defining-colorspaces-in-v4l2

> >>>>>> The V4L2_FMT_FLAG_CSC_* flags come into play if you want to allow
> >>>>>> userspace to convert the colorimetry of the captured data to anoth=
er
> >>>>>> colorimetry. That's often not supported, the colorimetry fields ar=
e
> >>>>>> just filled in based on what was captured. Often there is some sup=
port
> >>>>>> to convert between YCBCR/RGB/QUANTIZATION settings, so such device=
s
> >>>>>> can set V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_QUANTIZATI=
ON
> >>>>>> if they want. This is typically a 3x3 matrix + one vector in the h=
ardware.
> >>>>>
> >>>>> It's not a simple 3x3 matrix + vector in this case, and selection i=
s
> >>>>> via an enum.
> >>>
> >>> As far as I understand, for this specific device, the firmware API us=
es
> >>> an enum, but the hardware could do more than the enum values exposed =
by
> >>> the firmware, is that right ?
> >>
> >> I assume that's a question for Dave, but that is what I would expect.
> >> My gut feeling is that the enum just selects one of three predefined
> >> 3x3 matrices + vector. In which case it does not touch the transfer
> >> function, let alone the colorspace.
> >>
> >> But without knowing the details, I can't be certain of course.
> >
> > As far as I understand, the colorspace enum passed to the firmware also
> > influences the tone mapping LUT. It doesn't set the LUT values by
> > itself, as there are other imaging parameters that need to be taken int=
o
> > account to calculate the LUT, but it influences it (the tone mapping LU=
T
> > is really two LUTs combined into one, a transfer function LUT and a ton=
e
> > mapping LUT).
>
> That makes sense, and that suggests also that the firmware does more-or-l=
ess
> the right thing. Good to know.

Sorry if I hadn't said it was an ISP.

I will confess that a number of the settings are derived from those
who designed the hardware back in our days at Broadcom. Whilst I
haven't validated them in great detail, I do have a fair amount of
faith in them to matching the requirements for video encoding at SD
and HD resolutions, and for JPEG.
It's always a bit moot with image sensors anyway, as each manufacturer
will have their own view of what an image should look like, and this
is largely signalling just to ensure that the encode/decode/display
path all interprets the data as that manufacturer wants.

We also have an added complication that we have 2 video outputs,
termed as the high and low res outputs. The pipeline ends up as YUV
before splitting to feed the two outputs.
The low res path has a resize before output, but outputs the YUV
colorimetry as at the end of the pipe.
The high res path has a conversion block so it can produce RGB.
Messing with masses of colorimetry options means that you need all the
corresponding parameters for that CSC block to be able to convert back
to RGB correctly. This is one of the main reasons I don't want to go
adding all manner of colorimetry options.

> >>>>>>> The driver is saying that only colorspace is supported, and [1] s=
ays that
> >>>>>>
> >>>>>> No, the driver is saying that it can convert to another colorspace
> >>>>>> if requested to do so by userspace, while leaving the xfer functio=
n,
> >>>>>> ycbcr encoding and quantization range untouched.
> >>>>>> That's a highly unlikely situation, and I think it's likely a bug
> >>>>>> in the driver. It should probably drop that flag.
> >>>>>>
> >>>>>>> "The first is the colorspace identifier (enum v4l2_colorspace) wh=
ich
> >>>>>>> defines the chromaticities, the default transfer function, the de=
fault
> >>>>>>> Y=E2=80=99CbCr encoding and the default quantization method"
> >>>>>>> so we have all 4 parameters defined via the defaults.
> >>>>>>> I read it that the ycbcr_enc, quantization, and xfer_func values
> >>>>>>> passed in should be ignored and replaced with the "default" value=
s
> >>>>>>> derived from the colorspace value (use V4L2_MAP_XFER_FUNC_DEFAULT=
,
> >>>>>>> V4L2_MAP_YCBCR_ENC_DEFAULT, and V4L2_MAP_QUANTIZATION_DEFAULT)
> >>>>>>> Is this a valid interpretation?
> >>>>>>
> >>>>>> No. First of all, unless one or more of the V4L2_FMT_FLAG_CSC_* fl=
ags are
> >>>>>> set, the driver fills in these fields, and ignores what userspace
> >>>>>> filled in. So [1] just describes what these fields mean, and that =
you
> >>>>>> can use those DEFAULT macros to determine what the actual xfer_fun=
c,
> >>>>>> ycbcr_enc or quantization is if the driver left those values to 0.
> >>>>>>
> >>>>>> What those defaults are depends on the chosen colorspace field.
> >>>>>>
> >>>>>>> Confusion comes from [2] for V4L2_PIX_FMT_FLAG_SET_CSC saying:
> >>>>>>
> >>>>>> So if this flag is set, then userspace can ask the driver to conve=
rt
> >>>>>> to specific colorimetry settings, if supported (what is supported =
is
> >>>>>> indicated by the V4L2_FMT_FLAG_CSC_* flags returned by ENUM_FMT).
> >>>>>>
> >>>>>>> "If the colorimetry field (colorspace, xfer_func, ycbcr_enc, hsv_=
enc
> >>>>>>> or quantization) is set to *_DEFAULT, then that colorimetry setti=
ng
> >>>>>>> will remain unchanged from what was received."
> >>>>>>> What is "received" in this case?
> >>>>>>
> >>>>>> This relates to a capture device, so for an m2m device that means
> >>>>>> the colorimetry that userspace set for the output device.
> >>>>>
> >>>>> This is an ISP. What is the xfer function, ycbcr encoding and
> >>>>> quantization range settings for a Bayer image with colorspace
> >>>>> V4L2_COLORSPACE_RAW? The documentation does not work for that use
> >>>>> case.
> >>>>
> >>>> It wasn't clear to me that this was specifically about raw Bayer.
> >>>>
> >>>> For COLORSPACE_RAW there really is no xfer_func as such. V4L2_MAP_XF=
ER_FUNC_DEFAULT
> >>>> sets it to NONE for COLORSPACE_RAW, but the documentation for NONE i=
s a bit
> >>>> misleading since it says that that means linear. For COLORSPACE_RAW =
is really
> >>>> means custom. I am wondering if a XFER_FUNC_RAW or _CUSTOM should be=
 introduced
> >>>> to properly signal this. I am certainly not opposed to that.
> >>>>
> >>>> The YCbCr encoding will be DEFAULT for Bayer (really, it is ignored,=
 but
> >>>> it is good practice to set it to DEFAULT in that case). If you DO co=
nvert
> >>>> to YCbCr, then it has to follow some standard.
> >>>>
> >>>> The quantization range will be FULL for Bayer. Again, something else=
 doesn't
> >>>> make sense for Bayer.
> >>>
> >>> Note that it's the ISP input that is a raw bayer frame. The ISP outpu=
t
> >>> is processed RGB or YUV, and has a colour space. In this case, the
> >>> documentation of the V4L2_PIX_FMT_FLAG_SET_CSC isn't great. Quoting i=
t
> >>> again,
> >>>
> >>>   If the colorimetry field (colorspace, xfer_func, ycbcr_enc, hsv_enc=
 or
> >>>   quantization) is set to *_DEFAULT, then that colorimetry setting wi=
ll
> >>>   remain unchanged from what was received.
> >>>
> >>> Clearly, when outputting RGB or YUV, even if userspace sets color
> >>> space-related fields to *_DEFAULT, the ISP will not output "what was
> >>> received". I think it should pick a suitable default. Does this make
> >>> sense to everybody ?
> >>
> >> Yes. Perhaps this would be better:
> >>
> >> "then that colorimetry setting will be ignored and the driver will set=
 it
> >> to a suitable value."
> >>
> >> Or something along those lines...
> >
> > How about this ?
> >
> >   Set by the application. It is only used for capture and is ignored fo=
r
> >   output streams. If set, then request the device to do colorspace
> >   conversion from the received colorspace to the requested colorspace
> >   values. If the colorimetry field (colorspace, xfer_func, ycbcr_enc,
> >   hsv_enc or quantization) is set to *_DEFAULT, then the driver will se=
t
> >   that field to a suitable value. Drivers may also adjust any of the
> >   colorimetry fields when the requested values are not supported, in
> >   isolation or combined together.
> >
> >   When possible and applicable, drivers should select the default value=
s
> >   to match the colorimetry of the data that was received (from a live
> >   source for a captude device, or from memory for a memory-to-memory
>
> captude -> capture
> from memory -> from the output colorimetry as set by the application with
>                 VIDIOC_S_FMT
>
> >   device). In cases where this isn't possible drivers should select the
> >   default values to match the known parameters. For instance, a driver
> >   for an ISP converting raw Bayer data to YUV should select the default
> >   YCbCr encoding based on the colorspace field.
> >
> >   As drivers are given a degree of freedom to select default colorimetr=
y
> >   values, applications should always set the four colorimetry fields to
> >   avoid unexpected behaviours and maximize portability between devices.
>
> I disagree with that last paragraph. Which fields to set depends on what
> the pixelformat supports. In the case of this driver that only sets the
> V4L2_FMT_FLAG_CSC_COLORSPACE flag, you only set that field, the others
> will be set for you. And it also really depends on what the application
> wants: it might want to select a specific YCbCr encoding, but not care
> that much about the quantization, so it would set the ycbcr_enc field,
> but keep the other at 0.
>
> Personally I would just drop that last paragraph.
>
> >
> >>>>>> A typical m2m device will just copy the colorimetry fields from ou=
tput
> >>>>>> to capture format. If you want it to act as a csc device, then it =
will
> >>>>>> have to advertise the relevant V4L2_FMT_FLAG_CSC_* flags.
> >>>>>>
> >>>>>> If it converts between different pixelformats (e.g. RGB to YUV), t=
hen
> >>>>>> there is an implicit csc step, of course, but the result will be u=
sing
> >>>>>> the default rules.
> >>>>>>
> >>>>>> Example: userspace passes a frame with V4L2_COLORSPACE_BT2020, V4L=
2_XFER_FUNC_709,
> >>>>>> V4L2_YCBCR_ENC_DEFAULT (n/a) and V4L2_QUANTIZATION_FULL_RANGE, and=
 wants
> >>>>>> a NV12 back. The colorimetry for that will be V4L2_COLORSPACE_BT20=
20,
> >>>>>> V4L2_XFER_FUNC_709, V4L2_YCBCR_ENC_BT2020 (most likely, hw limitat=
ions might
> >>>>>> force this to 709 or 601) and V4L2_QUANTIZATION_LIM_RANGE.
> >>>
> >>> That example is a bit underspecified, to clarify it, did you mean the
> >>> above for the case where userspace sets all four colorimetry fields t=
o
> >>> *_DEFAULT on the capture side ? If so, I agree about the colorspace,
> >>> xfer_func and ycbcr_enc values. For the quantization values, followin=
g
> >>> the specification to the letter ("then that colorimetry setting will
> >>> remain unchanged from what was received"), shouldn't quantization be
> >>> V4L2_QUANTIZATION_FULL_RANGE on the capture side ?
> >>
> >> This example describes what happens without any overrides from userspa=
ce.
> >> So either V4L2_PIX_FMT_FLAG_SET_CSC is cleared, or all four colorimetr=
y
> >> fields are set to DEFAULT.
> >>
> >> And see above for a better description of what the spec should say.
> >
> > Then my proposal above isn't quite right, as selecting LIM_RANGE on the
> > capture side when the received data has FULL_RANGE doesn't match the
> > text in my opinion. I'm not sure how to word it, how would you express
> > why a driver would select LIM_RANGE here ?
>
> Because YCbCr is almost always limited range. The only exception is if
> it will feed into a JPEG encoder since that one wants full range.
>
> So V4L2_MAP_QUANTIZATION_DEFAULT will select limited range.
>
> >
> >>>>>> So this is all determined by the driver, not userspace.
> >>>>>
> >>>>> Now I pass a Bayer frame of colorspace V4L2_COLORSPACE_RAW,
> >>>>> V4L2_XFER_FUNC_NONE in, and ask for NV12 out. What properties do I =
use
> >>>>> on that NV12 frame please?
> >>>
> >>> Let's be precise. Is that with or without V4L2_PIX_FMT_FLAG_SET_CSC ?=
 If
> >>> with it, what values do you set for all the colorimetry fields,
> >>> *_DEFAULT ? I'll assume so in the comments below.
> >>
> >> Without SET_CSC. Sorry, I should have been clearer.
> >>
> >>>> Bayer frame:
> >>>> colorspace =3D RAW
> >>>> xfer_func =3D NONE
> >>>> ycbcr_enc =3D DEFAULT (ignored)
> >>>> quantization =3D FULL
> >>>>
> >>>> NV12 frame:
> >>>> colorspace =3D RAW
> >>>> xfer_func =3D NONE
> >>>
> >>> While this is technically valid, the RAW primary colours chromaticiti=
es
> >>> would effectively be unusable for anyone who cares about colours, and
> >>> the linear transfer function would likely not be what a user would
> >>> expect.
> >>>
> >>> One option would be to consider this to be userspace's fault, and
> >>> produce what has been requested, even if broken. I'm not opposed to
> >>> that.
> >>
> >> It all depends what the device actually does: if it takes the raw data=
,
> >> then does color correction and produces a usable picture, then that
> >> would imply that the final image conforms to one of the colorspaces
> >> and transfer functions.
> >>
> >> If it just converts from Bayer to NV12, then it would produce, as you
> >> say, an unusable picture. Garbage in, garbage out.
> >
> > Agreed. But it gets tricky :-)
> >
> > For a device that only performs CFA interpolation, I agree, the
> > colorspace on the capture side should be RAW in the above example.
> > That's the easy part.
> >
> > An ISP will, under normal circumstances, produce a well-defined
> > colorspace. For this to happen, the quantum efficiency of the camera
> > sensor to different wavelengths need to be taken into account, and
> > suitable values must be programmed in the linearization LUT and the RGB
> > to RGB matrix (possibly among other parameters) The process involves
> > calculations that are often done in userspace. The colorspace on the
> > capture video node is thus the result of a set of ISP parameters and
> > intrinsic sensor information, instead of being a value set by userspace
> > that drives the configuration of the ISP. It's not really feasible in
> > that case for the ISP driver to know what colorspace it outputs. That i=
s
> > why the rkisp1 driver will blindly accept any colorspace set by
> > userspace on the ISP's subdev source pad, in order to propagate that
> > value along the pipeline up to the capture video node.
> >
> > In other cases, the ISP driver may expose a higher-level API that
> > accepts a colorspace value and calculates all the low-level ISP
> > parameters internally (likely in the firmware, possibly in the driver,
> > although the latter doesn't make much sense in my opinion). I don't
> > think this is what the Raspberry Pi ISP does for the colorspace, as it
> > has a CCM matrix exposed to userspace (Dave, please correct me if I'm
> > wrong).

The Pi ISP driver exposes control V4L2_CID_USER_BCM2835_ISP_CC_MATRIX
- that is a CCM immediately post demosaic and pre gamma.
It does not expose the controls for setting up the output colourspace
control except by the enum at port->es.video.color_space.

> > For the Raspberry Pi ISP, I think the driver should turn colorspace =3D
> > DEFAULT into RAW as it can't know what colorspace will be output, and
> > accept any other colorspace value blindly. Unless I'm mistaken (David,
> > please correct me if I'm wrong), the tuning tool (part of libcamera)
> > computes the color correction matrix values in order to produce sRGB,
> > and the algorithms (still in libcamera) don't modify that at runtime.
> > The ISP will thus always produce sRGB, but I don't think we should
> > hardcode that in the driver.
>
> At some point someone will have to decide somewhere what colorimetry to
> assign to the picture. Whether that is the driver or userspace is depende=
nt
> on how the pipeline works.
>
> It's easy for e.g. video receivers since the received video will typicall=
y
> use well defined colorimetry values (usually transmitted through metadata=
).
> And Codecs will encode that information in the compressed stream, so ther=
e
> is it also available.

AFAIK Not JPEG.
Presumably a JPEG codec therefore needs to reject colorimetry
properties that don't match the spec. (Really amend in TRY_FMT as you
can't reject outright).

> The purpose of an ISP is really to take raw images and covert them to som=
ething
> that looks good when interpreted using specific colorimetry values. What =
those
> are and who sets them is dependent on the ISP.
>
> >
> >> I have considered adding an XFER_FUNC_RAW setting. As opposed to NONE,
> >> which really just means a linear mapping. It might make sense to
> >> introduce that, I would have no problem with it.
> >
> > I'm not opposed to it, as long as we carefully consider the implication=
s
> > on userspace code (libcamera would be a great playground for that, our
> > colour space coding is quite complex already, it would be good to see i=
f
> > a new value would be easily manageable in respect to both forward and
> > backward compatibility).
>
> Right now COLORSPACE_RAW kind of implies (undocumented) the xfer_func
> is undetermined, and XFER_FUNC_NONE is used in that case. But I think it
> is a bit misleading. V4L2_XFER_FUNC_NONE is used in a few sensor drivers,
> probably with the meaning of 'undetermined' and not 'linear'.
>
> >
> >>> When the hardware can not produce linear output, it would adjust the
> >>> colorimetry fields to what is supported. A suitable default would be
> >>> picked for xfer_func in that case. We could also pick suitable defaul=
ts
> >>> for fields set to *_DEFAULT instead of producing RAW and NONE.
> >>> Obviously, if the hardware supports linear output and xfer_func is se=
t
> >>> to NONE on the capture side by userspace, then linear should be
> >>> produced.
> >>>
> >>>> ycbcr_enc =3D 601 for SDTV, 709 for !SDTV
> >>>> quantization =3D LIMITED
> >>>>
> >>>>> Likewise I could pass in RGB with colorspace V4L2_COLORSPACE_SRGB a=
nd
> >>>>> ask for NV12 out that is to be JPEG encoded. How do I ensure I get =
the
> >>>>> appropriate conversion parameters?
> >>>>
> >>>> RGB frame:
> >>>> colorspace =3D SRGB
> >>>> xfer_func =3D SRGB
> >>>> ycbcr_enc =3D DEFAULT (ignored)
> >>>> quantization =3D FULL
> >>>>
> >>>> JPEG frame:
> >>>> colorspace =3D SRGB
> >>>> xfer_func =3D SRGB
> >>>> ycbcr_enc =3D 601
> >>>> quantization =3D FULL
> >>>>
> >>>> (or you just set colorspace to COLORSPACE_JPEG, which is a shorthand=
 for this)
> >>>
> >>> This last sentence makes me *very* uncomfortable, if the colorspace
> >>> field describes the primary colours chromaticities only in the recent
> >>> colorimetry API, we should stop talking about shorhands at all.
> >>
> >> Either is fine. But historically you will see a lot of COLORSPACE_JPEG=
 usage,
> >> and that won't go away. So you'll have to support both in libcamera.
> >
> > We've already spend lots of time trying to support colour space
> > management correctly, and I'm sure we will continue doing so :-) David
> > has already raised some issues related to code changes I've recently
> > proposed.
>
> It's hard to do right. It is often ignored, since in many cases there isn=
't a
> whole lot that you can do about it to correct it, and the differences bet=
ween
> the various colorspace/xfer_func/ycbcr_enc values is hard to see for most
> people, unless you see it side-by-side. Exception is the quantization ran=
ge,
> if that's wrong then it is very visible.
>
> In the future this is going to be more important when HDR and Bt.2020 bec=
omes
> more common: those look very different from e.g. Rec.709.
>
> > Let's first reach an agreement on how the Raspberry Pi ISP driver shoul=
d
> > handle the V4L2 colorimetry fields upstream, and then we'll implement
> > this correctly in libcamera (with as much backward compatibility as
> > possible).
>
> Yup!
>
> >
> >>>>>>> There is no inherent colourspace for
> >>>>>>> the device as it is M2M, so does that come back to being default
> >>>>>>> anyway, or reflecting the OUTPUT queue which might be Bayer and h=
ave
> >>>>>>> no range? Can we still ignore them all as the relevant
> >>>>>>> V4L2_FMT_FLAG_CSC_* flags aren't set?
> >>>>>>>
> >>>>>>> Hopefully you can enlighten us.
> >>>>>>
> >>>>>> So, to recap:
> >>>>>>
> >>>>>> 1) for an m2m device it is userspace that provides the colorimetry=
 data
> >>>>>>    in the output format. For a regular capture device it is the
> >>>>>>    video receiver driver that sets it (typically determined by the
> >>>>>>    sensor driver or a video receiver driver).
> >>>
> >>> Agreed.
> >>>
> >>>>>> 2) Implicit CSC conversion might take place when converting betwee=
n
> >>>>>>    different pixel formats. Typically this will only affect the
> >>>>>>    ycbcr_enc and quantization fields, since that's usually all tha=
t
> >>>>>>    is supported. The colorspace and xfer_func fields are just copi=
ed
> >>>>>>    from the output pixelformat.
> >>>>>
> >>>>> As above, RGB or Bayer in to NV12 out makes no sense to copy
> >>>>> colorspace and xfer_func fields from the output pixelformat.
> >>>
> >>> Why does it make no sense ? Especially for RGB inputs, the primary
> >>> colours chromaticities and the transfer function should be well-defin=
ed
> >>> on the output side, so they could be copied to the capture side.
> >>
> >> Right.
> >>
> >>> For Bayer formats it makes less sense in that the output would then b=
e
> >>> unusable for anyone who cares about proper colour rendering. As the I=
SP
> >>> will likely output images that have defined primary colours
> >>> chromaticities, it could replace the colorspace =3D DEFAULT on the ca=
pture
> >>> side with the real colorspace (chromaticities) as proposed above, and
> >>> also possibly replace xfer_func =3D DEFAULT with a proper non-linear
> >>> default instead of setting it to NONE. However, also as mentioned abo=
ve,
> >>> I would be fine considering that if userspace wants to shoot itself i=
n
> >>> the foot, we could let it do so. It would then be userspace's
> >>> responsibility to set the colorspace and xfer_func fields to proper
> >>> non-default values on the capture side.
> >>
> >> Exactly. The precise behavior of the driver will depend on what the
> >> device actually does.
> >>
> >>>> Perhaps you should describe what your m2m device actually *does*? Ah=
,
> >>>> you did at the end :-)
> >>>>
> >>>> The m2m devices that I know just convert RGB to YUV or JPEG (or vice
> >>>> versa). In both cases the colorspace and transfer function remain as=
-is,
> >>>> so copying these two values from the output pixelformat is the right
> >>>> thing to do. It's all you have, nobody else can fill it in. Typicall=
y
> >>>> userspace will get this information from the sensor or video receive=
r.
> >>>>
> >>>> The process of converting a raw Bayer sensor to something presentabl=
e
> >>>> is something an ISP does, but the end result will have to specify
> >>>> valid (i.e. non-raw) colorspace/xfer_func/ycbcr_enc/quantization col=
orimetry,
> >>>> otherwise nobody will know how to interpret the resulting frame.
> >>>
> >>> ISPs typically handle colorimetry in various places in the processing
> >>> pipeline. There's often a linearization LUT early on, followed by CFA
> >>> interpolation (debayering), a 3x3 RGB to RGB matrix (to compensate fo=
r
> >>> cross-talk and also to convert primary colours chromaticities), a ton=
e
> >>> mapping LUT that handles the transfer function (plus other parameters=
),
> >>> a 3x3 matrix + 1x3 offset vector to convert RGB to YUV, and a clamp f=
or
> >>> the quantization range. The 1x3 offset vector is sometimes automatica=
lly
> >>> computed by the hardware from the quantization range settings, and th=
e
> >>> 3x3 matrix may or may not take quantization into account. Given that =
the
> >>> Y line of the matrix has to have a sum of 1.0 and the U and V lines a
> >>> sum of 0.0, some hardware may not allow specifying all 9 values, but
> >>> derive some automatically.
> >>>
> >>> All those parameters interact with colorimetry, but they can't be ful=
ly
> >>> controlled by the four colorimetry fields. Drivers may compute values
> >>> for all parameters based on the four colorimetry fields and program t=
he
> >>> ISP accordingly, but in many cases the ISP driver will expose those
> >>> low-level parameters to provide full configurability. In that case th=
e
> >>> colorimetry fields will be ignored. Some drivers also mix-and-match t=
he
> >>> two options, exposing some low-level parameters directly (for instanc=
e
> >>> the linearization LUT, RGB to RGB matrix and tone mapping LUT), and
> >>> control other parameters through the colorimetry fields (in the same
> >>> example, the RGB to YUV 3x3 matrix and 1x3 vector and the clamp range=
,
> >>> exposed through the ycbcr_enc and quantization fields, while the
> >>> colorspace and xfer_func fields are ignored).
> >>
> >> True, but in order to know how to display final picture the ISP delive=
rs,
> >> you need to know against what colorspace and transfer function have to=
 be
> >> used to interpret the result.
> >>
> >> An ISP takes a raw image and processes it to deliver something that is
> >> using well-defined colorimetry. If it is not well defined you basicall=
y
> >> still have no idea how to interpret the colors.
> >
> > We agree on this.
> >
> >>>>>> 3) If explicit CSC conversion is signaled by the driver by setting
> >>>>>>    V4L2_FMT_FLAG_CSC_* flags, then userspace can request specific
> >>>>>>    colorimetry results, and the hardware will be configured by the
> >>>>>>    driver to give that result.
> >>>>>
> >>>>> Not all results are achievable by all hardware.
> >>>>> So do we set all the V4L2_FMT_FLAG_CSC_* flags and just alter the b=
its
> >>>>> of the request that aren't supported in a way that the driver sees
> >>>>> fit?
> >>>
> >>> If not all combinations are supported by the hardware (or firmware,
> >>> although in that case one may dream of getting the firmware updated t=
o
> >>> offer more control of individual settings ;-)), that is what I would
> >>> recommend, yes. My understanding is that setting the
> >>> V4L2_FMT_FLAG_CSC_COLORSPACE flag only and using the colorspace field=
 as
> >>> a preset doesn't comply with the V4L2 specification. Hans, is this
> >>> correct ?
> >>
> >> No, this is a valid thing to do.
> >
> > OK, this is the only part where I'm confused, as it doesn't match my
> > recollection of our discussions that the colorspace field never acts as
> > a preset in the new API. I'll read on and comment just below.
> >
> >> So if I understand it the device always produces YUV video, but in
> >
> > The ISP has two outputs, which can independently produce RGB or YUV.
> >
> >> three different modes: something that is suitable for a JPEG encoder
> >> that expects full range sRGB, SDTV-style colorimetry and HDTV-style
> >> colorimetry. In that case setting V4L2_FMT_FLAG_CSC_COLORSPACE is
> >> actually valid. If userspace doesn't override the colorspace, then
> >> the default behavior will be used (SDTV or HDTV, depending on the
> >> resolution), or it outputs according to the chosen colorspace and
> >> the settings for the other three fields implied by the preset.
> >
> > First of all, if V4L2_COLORSPACE_JPEG shouldn't be used (as you
> > mentioned below), how would userspace do this ? Let's assume the
> > application wants to capture YUV data from the ISP in order to compress
> > it in JPEG. It needs the ISP to produce sRGB primary colours
> > chromaticities, sRGB transfer functio, BT.601 YCbCr encoding and full
> > quantization. If V4L2_COLORSPACE_JPEG can't be used, I see no other way
> > than requesting the following values :
> >
> >       .colorspace =3D V4L2_COLORSPACE_SRGB,
> >       .xfer_func =3D V4L2_XFER_FUNC_SRGB,
> >       .ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> >       .quantization =3D V4L2_QUANTIZATION_FULL_RANGE,
> >
> > As a consequence, the driver would need to report all the
> > V4L2_FMT_FLAG_CSC_COLORSPACE, V4L2_FMT_FLAG_CSC_XFER_FUNC,
> > V4L2_FMT_FLAG_CSC_YCBCR_ENC and V4L2_FMT_FLAG_CSC_QUANTIZATION flags to
> > make it possible to set individual fields.
>
> As I understand it, selecting the SRGB colorspace preset in the firmware
> will produce exactly this. The firmware doesn't allow you to specify the
> other three fields, they are hardcoded depending on the preset. So tellin=
g
> userspace that they can 'set' these fields is not right. They can only
> select the colorspace and the driver will fill in the other fields with
> 'suitable values', in this case depending on the preset, which in turn
> is selected with the colorspace.
>
> >
> > The next consequence is that, if the application sets
> > V4L2_PIX_FMT_FLAG_SET_CSC, and wants to use a preset by setting
> > colorspace to a preset value and set xfer_func, ycbcr_enc and
> > quantization to *_DEFAULT, then the driver will be free to select
> > defaults in an unspecified way (copying them from the input would be
> > valid behaviour for instance). This will lead to unpredictable behaviou=
r
> > for userspace.
>
> I'm not sure I understand. If you leave it up to the driver, then the
> driver has to set correct values. Depending on what it does that will
> indeed be from what was specified on the output, or using the
> V4L2_MAP_YCBCR_ENC_DEFAULT etc. macros, or retrieving it from a
> compressed stream (if it is a decoder). It still has to state what it
> produces based on whatever information it has.
>
> >
> > The only way I could see presets working is if the driver reports
> > V4L2_FMT_FLAG_CSC_COLORSPACE only, without the other three
> > V4L2_FMT_FLAG_CSC_* flags.
>
> Yes, exactly. That will work here.
>
> > In that case we could define the colorspace
> > field as a preset, as I don't think there will ever be hardware that ca=
n
> > modify the primary colours chromaticities only without also allowing
> > modifications of the other colorimetry values. This means that a driver
> > that uses presets will not be able to support any combination of
> > colorimetry parameters that do not match one of the presets. If a drive=
r
> > wanted to support such non-standard combinations, it would need to set
> > multiple V4L2_FMT_FLAG_CSC_*, and we would be back to the problem
> > described in the previous paragraph.
> >
> > This is probably doable, but I think it will significantly increase
> > complexity in userspace. Userspace will need to check if only
> > V4L2_FMT_FLAG_CSC_COLORSPACE is set or if other flags are set too, and
> > use that to decided whether to use the preset API or the full API
> > (hopefully that would work, but I'm always worried I'm forgetting about
> > some corner cases).
> >
> > This also means that, among the available V4L2 presets, only
> > V4L2_COLORSPACE_REC709, V4L2_COLORSPACE_SRGB and V4L2_COLORSPACE_JPEG
> > would correctly match the fact that the ISP produces sRGB primary
> > colours chromaticities. I suppose we could ignore that, as the
> > chromaticities are not configured through the colorspace field (the
> > colour correction matrix is passed explicitly to the driver), but it
> > will make it even more difficult in userspace. If a user were to reques=
t
> > different chromaticities, libcamera could calculate a different colour
> > correction matrix, but it wouldn't be able to reflect that in the
> > presets it selects to program the ISP. There would be a need for
> > device-specific logic to convert the colorimetry information exposed to
> > applications to the V4L2 preset.
>
> So what does the preset do exactly? It is now starting to sound like
> it actually selects the xfer_func, ycbcr_enc and quantization, but not th=
e
> colorspace since that's defined by the CCM set by userspace.
>
> It would actually make more sense to me that way.
>
> > Documenting all this properly will also be difficult, and without prope=
r
> > documentation, nobody will get it right (even with proper documentation
> > most drivers and applications get it wrong :-)).
>
> One thing that is missing in the documentation is a rule what to do if
> userspace asks for a combination of fields that is not supported by the
> driver. In that case there has to be a priority given to each of the four
> fields. Luckily for colorimetry that is clear: colorspace has the highest
> prio, then xfer_func, then ycbcr_enc and quantization is last.
>
> > As you can probably tell, I don't think all that is worth it. I think w=
e
> > would be better off not dealing with presets and specifying the four
> > colorimetry fields explicitly. If someone really believes we need to
> > also support a preset API and is willing to document it (and make sure
> > it will work in all corner cases), then I'm fine with accepting support
> > for it in libcamera, if it can be done in a clean way.
>
> The CSC flags tell you what you can override. You are at all times free
> to just fill in what you want, but only those fields that the hardware
> supports will be used.
>
> The driver shouldn't lie about what it supports, i.e. if the quantization
> range is hardcoded depending on the other colorimetry fields, then it
> shouldn't say it can.
>
> Based on how I now understand the ISP works the three presets map to:
>
> XFER_FUNC_SRGB, YCBCR_ENC_601, FULL_RANGE
> XFER_FUNC_REC709, YCBCR_ENC_601, LIM_RANGE
> XFER_FUNC_REC709, YCBCR_ENC_709, LIM_RANGE
>
> So to pick the correct preset it needs the XFER_FUNC and YCBCR_ENC
> from userspace, but not the QUANTIZATION.
>
> If userspace would select XFER_FUNC_SRGB/ENC_709, then it would prioritiz=
e
> XFER_FUNC_SRGB and replace ENC_709 with ENC_601.
>
> The colorspace depends on the CCM from userspace, so the driver can
> just copy this field from the output to the capture side. It is up to
> userspace to decide whether to leave it at RAW or fill in the actual
> colorspace the CCM will produce.
>
> Based on this the driver would set V4L2_FMT_FLAG_CSC_XFER_FUNC and
> V4L2_FMT_FLAG_CSC_YCBCR_ENC. The application can fill in all four fields,
> but only these two would be used to select the preset. The colorspace
> would just be copied from output to capture, and the quantization would
> be hardcoded based on the chosen preset.
>
> >
> >> You wouldn't set the other V4L2_FMT_FLAG_CSC_ flags since you can't
> >> influence them separately, they are fixed depending on the colorspace
> >> (aka preset) itself.
> >
> > At least the chromaticities can be (and actually are, in all cases)
> > influenced separately. It's not a blocker, we can probably live with th=
e
> > device producing chromaticities that don't match the colour space prese=
t
> > (at the price of device-specific logic in userspace), but I would prefe=
r
> > keeping hacks as a last resort, not as the primary design option :-)
> >
> > I still would prefer if the firmware allowed the YCbCr encoding and
> > quantization to also be set separately from the transfer function, but
> > that's not my call.
> >
> >>>>>> I hope this helps!
> >>>>>
> >>>>> Sort of, but only by muddying the waters.
> >>>>>
> >>>>> Flipping it around then and asking how it should be implemented.
> >>>>>
> >>>>> We have configuration for the ISP output path that produces 3
> >>>>> configurations regardless of input format corresponding to:
> >>>>> - V4L2_COLORSPACE_JPEG, V4L2_YCBCR_ENC_601, V4L2_XFER_FUNC_SRGB,
> >>>>> V4L2_QUANTIZATION_FULL_RANGE
> >>>>
> >>>> Here you request the JPEG pixelformat, so that forces the output
> >>>> configuration. So no need for any V4L2_FMT_FLAG_CSC_* for this pixel
> >>>> format.
> >>>
> >>> The ISP doesn't produce JPEG data, it produces YUV.
> >>
> >> Ah, I didn't know that. Then you really should not use COLORSPACE_JPEG=
,
> >> that is something that should only be used for actual JPEG compressed
> >> video. It's very weird to see it used for uncompressed video. Legal,
> >> but weird.

Shall I mention things not being documented again?

It also makes an M2M JPEG codec weird as the source image colorimetry
has to define the raw image, but the CAPTURE side is going to be
V4L2_COLORSPACE_JPEG?

> > In libcamera we call V4L2_COLORSPACE_JPEG "sYCC". It decouples the
> > colour space name from the image format.
> >
> >> I think there are still a bunch of old sensor drivers that incorrectly
> >> report JPEG as well, even though they just transmit uncompressed video=
.
> >> I never dared to change them, it's hard to predict what might break.
> >>
> >>> Hans, do I understand correctly that, when producing YUV, for a drive=
r
> >>> that have all the V4L2_FMT_FLAG_CSC_* flags set, if userspace sets
> >>> V4L2_PIX_FMT_FLAG_SET_CSC, the following two settings
> >>>
> >>>     .colorspace =3D V4L2_COLORSPACE_JPEG,
> >>>     .xfer_func =3D V4L2_XFER_FUNC_SRGB,
> >>>     .ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> >>>     .quantization =3D V4L2_QUANTIZATION_FULL_RANGE,
> >>>
> >>> and
> >>>
> >>>     .colorspace =3D V4L2_COLORSPACE_SRGB,
> >>>     .xfer_func =3D V4L2_XFER_FUNC_SRGB,
> >>>     .ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> >>>     .quantization =3D V4L2_QUANTIZATION_FULL_RANGE,
> >>>
> >>> will produce the exact same result ?
> >>
> >> Yes.
> >>
> >>>>> - V4L2_COLORSPACE_SMPTE170M, V4L2_YCBCR_ENC_601, V4L2_XFER_FUNC_709=
,
> >>>>> V4L2_QUANTIZATION_LIM_RANGE
> >>>>> - V4L2_COLORSPACE_REC709, V4L2_YCBCR_ENC_709, V4L2_XFER_FUNC_709,
> >>>>> V4L2_QUANTIZATION_LIM_RANGE
> >>>>
> >>>> Here you select a YUV format (NV12 or similar). The default colorime=
try
> >>>> it should select is V4L2_COLORSPACE_SMPTE170M for SDTV and V4L2_COLO=
RSPACE_REC709
> >>>> otherwise. If you want to allow this to be overridden, then that can=
 be
> >>>> done with V4L2_FMT_FLAG_CSC_COLORSPACE for these two pixelformats.
> >>>>
> >>>> If userspace selects an unsupported colorspace, then the driver shou=
ld
> >>>> pick a supported colorspace (almost certainly you would want V4L2_CO=
LORSPACE_REC709).
> >>>>
> >>>>> (Those should be the the same ycbcr_enc, xfer_func, and quantizatio=
n
> >>>>> as the defaults for each colourspace, and translate to the normal
> >>>>> values used for JPEG, SDTV, and HDTV respectively).
> >>>>> These are selected by enum and we are not proposing on adding any e=
xtra ones.
> >>>>>
> >>>>> The input is going to be Bayer with colorspace set to
> >>>>> V4L2_COLORSPACE_RAW. There are therefore no colorspace parameters t=
hat
> >>>>> can be "left unchanged" or otherwise copied from the OUPTUT queue.
> >>>>
> >>>> So this device does a lot more than most m2m devices: it apparently =
knows
> >>>> how to convert the raw Bayer data to a proper picture.
> >>>>
> >>>> I do wonder if it is really converting correctly to these three colo=
rimetry
> >>>> permutations. If you give it a test pattern, then save the result in=
 these
> >>>> three format and visually compare them, do they look identical? If t=
he ISP
> >>>> really does convert correctly, then you should not be able to see an=
y
> >>>> difference.
> >>>
> >>> Do you mean not seeing any difference when displaying the images on a
> >>> display that correctly takes the different colour spaces into account=
,
> >>> or not seeing any difference in the binary contents of the captured
> >>> images ? I would assume the former.
> >>
> >> The former, yes.
> >>
> >>>> There is a clear difference between V4L2_XFER_FUNC_SRGB and
> >>>> V4L2_XFER_FUNC_709 when seen side-by-side. Note that the difference =
between
> >>>> V4L2_COLORSPACE_SMPTE170M and V4L2_COLORSPACE_REC709 is pretty much =
impossible
> >>>> to see, they are very close.
> >>>>
> >>>>> What is the correct way to allow userspace selection of those optio=
ns
> >>>>> within V4L2?
> >>>>>
> >>>>> Looking at the datasheet for TC358743 (a chip that your company
> >>>>> maintains the driver for), it can convert the incoming HDMI to 6
> >>>>> output formats via the VI_REP register field VOUT_COLOR_SEL:
> >>>>> RGB Full
> >>>>> RGB Limited
> >>>>> 601YCbCr Full
> >>>>> 601 YCbCr Limited
> >>>>> 709 YCbCr Full
> >>>>> 709 YCbCr Limited
> >>>>> This is the same situation as for our ISP - configuration through a=
n
> >>>>> enum even though there is more complexity underneath.
> >>>>>
> >>>>> Currently the driver always selects 601 YCbCr Limited for UYVY outp=
ut,
> >>>>> or RGB Full for 24bpp RGB.
> >>>>> If we were to extend that driver in a non-media controller system t=
o
> >>>>> allow selection of the converted colourspace, how do we enforce tho=
se
> >>>>> restrictions?
> >>>>
> >>>> That chip can only convert between RGB/YUV and limited/full quantiza=
tion
> >>>> range. The colorspace and xfer_func will be whatever is received in =
the AVI
> >>>> InfoFrame of the HDMI video stream. So this is a typical example of =
a
> >>>> 3x3 matrix + vector implementation. It comes with a bunch of default=
 matrixes
> >>>> (hardcoded and selected by the enum), but I believe it can be manual=
ly set
> >>>> as well. I can't remember if that's done in this driver.

I don't see anything in the datasheet allowing manual configuration of
the matrix, only presets.
The driver always chooses converting to "601 YCbCr Limited" if
producing YUYV, and "RGB Full" for 24bpp RGB.

> >>>> If you want to manually set ycbcr_enc and quantization, then you wou=
ld
> >>>> have to specify V4L2_FMT_FLAG_CSC_YCBCR_ENC | V4L2_FMT_FLAG_CSC_QUAN=
TIZATION.

OK, that seems feasible. One day if I get some time....

> >>>>> Under MC you get a similar set of flags in V4L2_MBUS_FRAMEFMT_SET_C=
SC
> >>>>> for struct v4l2_mbus_framefmt and set_format, and
> >>>>> V4L2_SUBDEV_MBUS_CODE_CSC_* in struct v4l2_subdev_mbus_code_enum, s=
o
> >>>>> the same principles will presumably apply there too.
> >>>>
> >>>> Yes.
> >>>>
> >>>>> (I'm noting that the tc358743 driver currently doesn't bother setti=
ng
> >>>>> any of the colorimetry fields other than colorspace).
> >>>>
> >>>> I believe the driver predates these additional colorimetry fields.
> >>>
> >>> Very few drivers implement the API correctly. Hopefully this ISP driv=
er
> >>> will join the ranks of the good ones :-)
> >>
> >> I believe this is the first time an ISP needs this, so it's good to di=
scuss
> >> this!
> >
> > The rkisp1 driver was the first :-) It was the first to use the
> > V4L2_PIX_FMT_FLAG_SET_CSC flag. It didn't implement everything correctl=
y
> > though, we have fixed that in v6.1.
>
> If you think a video call would be helpful/quicker, just let me know.

I must confess to having got a little lost on some of the discussions,
however if Laurent is happy then that's fine by me.

  Dave
