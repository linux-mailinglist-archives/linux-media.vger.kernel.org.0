Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FB125066D
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 19:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgHXRc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 13:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728073AbgHXRcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 13:32:32 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23695C061574
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 10:32:32 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id x2so5604951ybf.12
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ddsLqQt8oXIjRzbD4HLDTh6J/Y7zE4iYiBCGnfr+FIY=;
        b=cvv75uvuQyrE1XSS73riAVxrfXUhaMlYrGLg/gLIC6k0LGXjxaA/dH5fuNhvfhSgBm
         6guxTnG/oR9hgKhgPk5txlt5H14P10BDPbQYupAq97KU2ChPNc9WCDaTK88QyWpXGZAh
         TwAB+a8Ij057bdpUkj/x7Ffx0Zq0kO+86QCU4QI7/iOqwCeLhhn1GvR24xIPVHVRQaTE
         oEANpE2taVB0Azl5dPfw5WCg5AbgGucCq37WjF7J/YFJUZgpM/L1YLLozD9BFQn1Ozg+
         /EpFv2nrW+c9jfJWoxvg0WozCSVXOMtUq5XZaDAozQzCAZelRlEHOXkQa3SRIegXQxJW
         diRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ddsLqQt8oXIjRzbD4HLDTh6J/Y7zE4iYiBCGnfr+FIY=;
        b=LGLrForQOEzQprqUrTTsifYaNPfnGWa3hxzPpDDOnD2N8qhimwn0m4JeaWK1En33+o
         dtpAFJMowUjTbH8hRbQJGoBA9DvBylAtm26qxP3GmL6vI7F5XsAKIM5owxm9p+rAdEbk
         3L7neaNdlKL0pXgiFgzS9dwxECoKppXHw0U09jgAXVI6vd9B9wi1MOlLJ0DhH8JoAlk1
         umRBKBE+BKKf3uvTPzo1d8DCoeHLQYjK4XriqAGVXdWrM11fI/7pbHfz45fr1ReQvUaz
         5QVyB78YFqaSiGv4DswwVBpnrlp+uZwen0+QrI7Mbvy504t0SNhmdGr/+5gQSx5Pph5F
         N/kQ==
X-Gm-Message-State: AOAM5305drikY+MN7MSG2nfHlr9m9MAfnwhOruOwrmrDcRVAB9ciwg+F
        r2DxsyuY5g0SzhucEROAopI4wKaltz6cSsr1gEes3ayE4oOXdQ==
X-Google-Smtp-Source: ABdhPJy7j61v/clVCb/7pMChmGU+IrjpMZbGrIPXidBxp4dVYe1EpiNUN+A+s4WrHbEJ7ROogiG3yij17vUHNT64+js=
X-Received: by 2002:a25:414:: with SMTP id 20mr9006913ybe.97.1598290350561;
 Mon, 24 Aug 2020 10:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200823012134.3813457-1-agoode@google.com> <20200823012134.3813457-2-agoode@google.com>
 <20200823145417.GC6002@pendragon.ideasonboard.com> <20200823150822.GD6002@pendragon.ideasonboard.com>
 <5a2882e5-c029-dde7-c6ff-bd6f57aa7850@xs4all.nl> <CAOf41NnrfW6h++nR42R1OxR0B3DVrKg9RVLTQVJ=nEkn3GW4aw@mail.gmail.com>
 <6538b14c-e386-2fab-d178-7bb3e98b3525@xs4all.nl>
In-Reply-To: <6538b14c-e386-2fab-d178-7bb3e98b3525@xs4all.nl>
From:   Adam Goode <agoode@google.com>
Date:   Mon, 24 Aug 2020 13:31:54 -0400
Message-ID: <CAOf41NmOdb1Y3ZSO7YLxyStbSfUCo8p204TdvkwH91cXdmNq5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Convey full ycbcr colorspace
 information to v4l2
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 10:38 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wr=
ote:
>
> On 24/08/2020 15:56, Adam Goode wrote:
> > On Mon, Aug 24, 2020 at 4:48 AM Hans Verkuil <hverkuil-cisco@xs4all.nl>=
 wrote:
> >>
> >> On 23/08/2020 17:08, Laurent Pinchart wrote:
> >>> Hi Adam,
> >>>
> >>> (CC'ing Hans Verkuil)
> >>>
> >>> On Sun, Aug 23, 2020 at 05:54:24PM +0300, Laurent Pinchart wrote:
> >>>> Hi Adam,
> >>>>
> >>>> Thank you for the patch.
> >>>>
> >>>> On Sat, Aug 22, 2020 at 09:21:34PM -0400, Adam Goode wrote:
> >>>>> The Color Matching Descriptor has been present in USB cameras since
> >>>>> the original version of UVC, but it has never been fully used
> >>>>> in Linux.
> >>>>>
> >>>>> This change informs V4L2 of all of the critical colorspace paramete=
rs:
> >>>>> colorspace (called "color primaries" in UVC), transfer function
> >>>>> (called "transfer characteristics" in UVC), ycbcr encoding (called
> >>>>> "matrix coefficients" in UVC), and quantization, which is always
> >>>>> LIMITED for UVC, see section 2.26 in USB_Video_FAQ_1.5.pdf.
> >>>>
> >>>> Isn't this valid for MJPEG only though ? There's not much else we ca=
n do
> >>>> though, as UVC cameras don't report quantization information. Should=
n't
> >>>> we however reflect this in the commit message, and in the comment be=
low,
> >>>> to state that UVC requires limited quantization range for MJPEG, and
> >>>> while it doesn't explicitly specify the quantization range for other
> >>>> formats, we can only assume it should be limited as well ?
> >>>>
> >
> > Yes, I am happy to improve the comment to be clearer.
> >
> >
> >>>> The code otherwise looks good to me.
> >>>>
> >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>
> >>>> Please let me know if you'd like to address the above issue.
> >>>>
> >>>>> The quantization is the most important improvement for this patch,
> >>>>> because V4L2 will otherwise interpret MJPEG as FULL range. Web brow=
sers
> >>>>> such as Chrome and Firefox already ignore V4L2's quantization for U=
SB
> >>>>> devices and use the correct LIMITED value, but other programs such
> >>>>> as qv4l2 will incorrectly interpret the output of MJPEG from USB
> >>>>> cameras without this change.
> >>>>>
> >>>>> Signed-off-by: Adam Goode <agoode@google.com>
> >>>>> ---
> >>>>>  drivers/media/usb/uvc/uvc_driver.c | 52 ++++++++++++++++++++++++++=
+---
> >>>>>  drivers/media/usb/uvc/uvc_v4l2.c   |  6 ++++
> >>>>>  drivers/media/usb/uvc/uvcvideo.h   |  5 ++-
> >>>>>  3 files changed, 58 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb=
/uvc/uvc_driver.c
> >>>>> index 431d86e1c94b..c0c81b089b7d 100644
> >>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>>>> @@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format_by_=
guid(const u8 guid[16])
> >>>>>     return NULL;
> >>>>>  }
> >>>>>
> >>>>> -static u32 uvc_colorspace(const u8 primaries)
> >>>>> +static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
> >>>>>  {
> >>>>> -   static const u8 colorprimaries[] =3D {
> >>>>> -           0,
> >>>>> +   static const enum v4l2_colorspace colorprimaries[] =3D {
> >>>>> +           V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> >>>>>             V4L2_COLORSPACE_SRGB,
> >>>>>             V4L2_COLORSPACE_470_SYSTEM_M,
> >>>>>             V4L2_COLORSPACE_470_SYSTEM_BG,
> >>>>> @@ -262,7 +262,43 @@ static u32 uvc_colorspace(const u8 primaries)
> >>>>>     if (primaries < ARRAY_SIZE(colorprimaries))
> >>>>>             return colorprimaries[primaries];
> >>>>>
> >>>>> -   return 0;
> >>>>> +   return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> >>>>> +}
> >>>>> +
> >>>>> +static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_charact=
eristics)
> >>>>> +{
> >>>>> +   static const enum v4l2_xfer_func xfer_funcs[] =3D {
> >>>>> +           V4L2_XFER_FUNC_DEFAULT,  /* Unspecified */
> >>>>> +           V4L2_XFER_FUNC_709,
> >>>>> +           V4L2_XFER_FUNC_709,      /* BT.470-2 M */
> >>>>> +           V4L2_XFER_FUNC_709,      /* BT.470-2 B, G */
> >>>>> +           V4L2_XFER_FUNC_709,      /* SMPTE 170M */
> >>>>> +           V4L2_XFER_FUNC_SMPTE240M,
> >>>>> +           V4L2_XFER_FUNC_NONE,     /* Linear (V =3D Lc) */
> >>>>> +           V4L2_XFER_FUNC_SRGB,
> >>>>> +   };
> >>>>> +
> >>>>> +   if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
> >>>>> +           return xfer_funcs[transfer_characteristics];
> >>>>> +
> >>>>> +   return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
> >>>>> +}
> >>>>> +
> >>>>> +static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coef=
ficients)
> >>>>> +{
> >>>>> +   static const enum v4l2_ycbcr_encoding ycbcr_encs[] =3D {
> >>>>> +           V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
> >>>>> +           V4L2_YCBCR_ENC_709,
> >>>>> +           V4L2_YCBCR_ENC_601,      /* FCC */
> >>>
> >>> I may have spoken a bit too fast. Doesn't FCC differ from BT.601 ?
> >>> According to https://en.wikipedia.org/wiki/Talk%3AYCbCr, the former u=
ses
> >>>
> >>>  E'Y =3D 0.59 E'G + 0.11 E'B + 0.30 E'R
> >>>  E'PB =3D =E2=80=93 0.331 E'G + 0.500 E'B =E2=80=93 0.169 E'R
> >>>  E'PR =3D =E2=80=93 0.421 E'G =E2=80=93 0.079 E'B + 0.500 E'R
> >>>
> >>> while the latter uses
> >>>
> >>>  E'Y =3D 0.587 E'G + 0.114 E'B + 0.299 E'R
> >>>  E'PB =3D =E2=80=93 0.331 E'G + 0.500 E'B =E2=80=93 0.169 E'R
> >>>  E'PR =3D =E2=80=93 0.419 E'G =E2=80=93 0.081 E'B + 0.500 E'R
> >>>
> >>> We seems to be missing FCC in the V4L2 color space definitions.
> >>
> >> The differences between the two are minuscule. Add to that that NTSC 1=
953
> >> hasn't been in use for many decades. So I have no plans to add another=
 YCC
> >> encoding for this. I'll double check this in a few weeks time when I h=
ave
> >> access to a better book on colorimetry.
> >>
> >
> > I can add a comment directly to clarify, but I am following the
> > mappings described in videodev2.h (with the assumption that "FCC" is
> > close enough to 601):
> >
> > /*
> > * Mapping of V4L2_XFER_FUNC_DEFAULT to actual transfer functions
> > * for the various colorspaces:
> > *
> > * V4L2_COLORSPACE_SMPTE170M, V4L2_COLORSPACE_470_SYSTEM_M,
> > * V4L2_COLORSPACE_470_SYSTEM_BG, V4L2_COLORSPACE_REC709 and
> > * V4L2_COLORSPACE_BT2020: V4L2_XFER_FUNC_709
> > *
> > * V4L2_COLORSPACE_SRGB, V4L2_COLORSPACE_JPEG: V4L2_XFER_FUNC_SRGB
> > *
> > * V4L2_COLORSPACE_OPRGB: V4L2_XFER_FUNC_OPRGB
> > *
> > * V4L2_COLORSPACE_SMPTE240M: V4L2_XFER_FUNC_SMPTE240M
> > *
> > * V4L2_COLORSPACE_RAW: V4L2_XFER_FUNC_NONE
> > *
> > * V4L2_COLORSPACE_DCI_P3: V4L2_XFER_FUNC_DCI_P3
> > */
> >
> > /*
> > * Mapping of V4L2_YCBCR_ENC_DEFAULT to actual encodings for the
> > * various colorspaces:
> > *
> > * V4L2_COLORSPACE_SMPTE170M, V4L2_COLORSPACE_470_SYSTEM_M,
> > * V4L2_COLORSPACE_470_SYSTEM_BG, V4L2_COLORSPACE_SRGB,
> > * V4L2_COLORSPACE_OPRGB and V4L2_COLORSPACE_JPEG: V4L2_YCBCR_ENC_601
> > *
> > * V4L2_COLORSPACE_REC709 and V4L2_COLORSPACE_DCI_P3: V4L2_YCBCR_ENC_709
> > *
> > * V4L2_COLORSPACE_BT2020: V4L2_YCBCR_ENC_BT2020
> > *
> > * V4L2_COLORSPACE_SMPTE240M: V4L2_YCBCR_ENC_SMPTE240M
> > */
> >
> > We could potentially do with some more xfer functions, though.
> >
> >>>
> >>>>> +           V4L2_YCBCR_ENC_601,      /* BT.470-2 B, G */
> >>>>> +           V4L2_YCBCR_ENC_601,      /* SMPTE 170M */
> >>>>> +           V4L2_YCBCR_ENC_SMPTE240M,
> >>>>> +   };
> >>>>> +
> >>>>> +   if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
> >>>>> +           return ycbcr_encs[matrix_coefficients];
> >>>>> +
> >>>>> +   return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
> >>>>>  }
> >>>>>
> >>>>>  /* Simplify a fraction using a simple continued fraction decomposi=
tion. The
> >>>>> @@ -704,6 +740,14 @@ static int uvc_parse_format(struct uvc_device =
*dev,
> >>>>>             }
> >>>>>
> >>>>>             format->colorspace =3D uvc_colorspace(buffer[3]);
> >>>>> +           format->xfer_func =3D uvc_xfer_func(buffer[4]);
> >>>>> +           format->ycbcr_enc =3D uvc_ycbcr_enc(buffer[5]);
> >>>>> +           /* All USB YCbCr encodings use LIMITED range as of UVC =
1.5.
> >>>>> +            * This is true even for MJPEG, which V4L2 otherwise as=
sumes to
> >>>>> +            * be FULL.
> >>>>> +            * See section 2.26 in USB_Video_FAQ_1.5.pdf.
> >>
> >> Not true. I checked the FAQ: the FAQ describes what happens when a vid=
eo renderer
> >> incorrectly interprets the decoded JPEG color components as limited ra=
nge instead
> >> of full range (which they are to be JPEG compliant). JPEG always encod=
es YCbCr as
> >> full range.
> >>
> >
> > Here is what the FAQ says:
> >
> > "If the images are encoded with the luma and chroma units in the 0-255
> > range that is used
> > for typical JPEG still images, then the saturation and contrast will
> > look artificially boosted
> > when the video is rendered under the assumption that the levels were
> > in the YCbCr color
> > space. BT601 specifies eight-bit coding where Y is in the range of 16
> > (black) to 235 (white)
> > inclusive."
> >
> > I read this as saying "if you encode MJPEG the same as typical JPEG
> > still images, it is wrong because Y must be in the range 16-235". Am I
> > reading this incorrectly?
>
> I think so. It's the 'when the video is rendered under the assumption tha=
t
> the levels were in the YCbCr color space.' that is the reason why the col=
ors
> are boosted. Normally a JPEG is either decoded to full range RGB or limit=
ed
> range YCbCr. If it is decoded to full range YCbCr, then the renderer shou=
ld
> take that into account, otherwise the colors will be wrong ('boosted').
>
> The text is a bit ambiguous, but JPEG always uses full range YCbCr, that'=
s
> just part of the JPEG standard.
>
> Regards,
>
>         Hans
>

Hmm. The text is definitely confusing. Here are some facts I know:

About JPEG and JFIF:
- JPEG itself doesn't mandate the YCbCr encoding (this is specified in
JFIF). [https://www.w3.org/Graphics/JPEG/jfif3.pdf]
- JFIF specifies YCbCr encoding and range as 601 but with an explicit
change: "Y, Cb, and Cr are converted from R, G, and B as defined in
CCIR Recommendation 601 but are normalized so as to occupy the full
256 levels of a 8-bit binary encoding".
- A JPEG file isn't JFIF unless it has an APP0 with 'JFIF'.

About MJPEG:
- MJPEG doesn't specify explicit YCbCr encoding information (there
isn't really a specification?).
- The USB devices I have that output MJPEG do not output JFIF (no APP0
with 'JFIF').

About color in UVC:
- MJPEG in UVC is required to be 8-bit YCbCr encoded
[USB_Video_Payload_MJPEG_1.5.pdf, section 3.3] with the color encoding
information specified via the Color Matching descriptor
[USB_Video_Payload_MJPEG_1.5.pdf, section 3].
- The UVC Color Matching descriptor cites BT.601 and other standards
without mentioning any changes to them [UVC Class Specification
1.5.pdf, 3.9.2.6].
- BT.601 and BT.709 require limited-range YCbCr encoding.

Real-world observations:
- The USB webcams I have (Logitech) output limited-range UVC MJPEG.
- The ATEM Mini outputs full-range UVC MJPEG, but this is considered
to be incorrect behavior
(https://forum.blackmagicdesign.com/viewtopic.php?f=3D4&t=3D108315,
https://www.youtube.com/watch?v=3DBEXQ5s2HpwE).
- Chrome, Firefox, and Safari interpret UVC MJPEG as limited-range.


I would agree that if the MJPEG coming out of UVC has JFIF headers, we
would have a problem, because we would have conflicting YCbCr encoding
metadata.

But since:
1. UVC is pretty clear about how to encode color,
2. JPEG-without-JFIF doesn't define YCbCr encoding,
3. MJPEG devices output non-JFIF JPEG,
4. UVC only specifies limited-range encoding for YCbCr,

I would conclude that UVC MJPEG should be expected to be limited-range.



Thanks,

Adam

> >
> >>>>> +            */
> >>>>> +           format->quantization =3D V4L2_QUANTIZATION_LIM_RANGE;
> >>
> >> What about sRGB? That uses full range.
> >>
> >
> > It is a little confusing in the code, but I only set the quantization
> > explicitly when we get a Color Matching descriptor from the device. My
> > reading of the spec says that this descriptor isn't present for RGB
> > formats, only YCrCb. When the spec mentions sRGB in Color Matching, it
> > is referring only to primaries or gamma.
> >
> >> Regards,
> >>
> >>         Hans
> >>
> >>>>>
> >>>>>             buflen -=3D buffer[0];
> >>>>>             buffer +=3D buffer[0];
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/u=
vc/uvc_v4l2.c
> >>>>> index 7f14096cb44d..79daf46b3dcd 100644
> >>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>>>> @@ -279,6 +279,9 @@ static int uvc_v4l2_try_format(struct uvc_strea=
ming *stream,
> >>>>>     fmt->fmt.pix.sizeimage =3D probe->dwMaxVideoFrameSize;
> >>>>>     fmt->fmt.pix.pixelformat =3D format->fcc;
> >>>>>     fmt->fmt.pix.colorspace =3D format->colorspace;
> >>>>> +   fmt->fmt.pix.xfer_func =3D format->xfer_func;
> >>>>> +   fmt->fmt.pix.ycbcr_enc =3D format->ycbcr_enc;
> >>>>> +   fmt->fmt.pix.quantization =3D format->quantization;
> >>>>>
> >>>>>     if (uvc_format !=3D NULL)
> >>>>>             *uvc_format =3D format;
> >>>>> @@ -315,6 +318,9 @@ static int uvc_v4l2_get_format(struct uvc_strea=
ming *stream,
> >>>>>     fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(format,=
 frame);
> >>>>>     fmt->fmt.pix.sizeimage =3D stream->ctrl.dwMaxVideoFrameSize;
> >>>>>     fmt->fmt.pix.colorspace =3D format->colorspace;
> >>>>> +   fmt->fmt.pix.xfer_func =3D format->xfer_func;
> >>>>> +   fmt->fmt.pix.ycbcr_enc =3D format->ycbcr_enc;
> >>>>> +   fmt->fmt.pix.quantization =3D format->quantization;
> >>>>>
> >>>>>  done:
> >>>>>     mutex_unlock(&stream->mutex);
> >>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/u=
vc/uvcvideo.h
> >>>>> index 6ab972c643e3..6508192173dd 100644
> >>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>>>> @@ -370,7 +370,10 @@ struct uvc_format {
> >>>>>     u8 type;
> >>>>>     u8 index;
> >>>>>     u8 bpp;
> >>>>> -   u8 colorspace;
> >>>>> +   enum v4l2_colorspace colorspace;
> >>>>> +   enum v4l2_xfer_func xfer_func;
> >>>>> +   enum v4l2_ycbcr_encoding ycbcr_enc;
> >>>>> +   enum v4l2_quantization quantization;
> >>>>>     u32 fcc;
> >>>>>     u32 flags;
> >>>>>
> >>>
> >>
>
