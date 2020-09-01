Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820772591C8
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgIAOz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 10:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgIALbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 07:31:00 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9343CC061249
        for <linux-media@vger.kernel.org>; Tue,  1 Sep 2020 04:30:17 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id u6so572847ybf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2020 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n28fWIJF1yinGP0ye5l0pbs9Eu2gWOsqkmtaBsPGHWU=;
        b=n4SMm50g7xSAVKOGOvfIknYjieeysKXWk71kSf0c2lGRlU+v2nRZoFfWZIGUk47wsc
         s5vufUS6WEkNcia/DgD5xTQom4qpyckSGWasJBNXnJ4g7NE12zMjQ7S5+FvhtlFGo7hg
         l1LsBR5l1oLW646eeylgktco6Y7Qsc3WOHLJfqsWw8fMfZNeR55OwHYSY99P/ZJi1+Bp
         fnWZMSdipl8xVdkQAueg2Zo4tEy9A9KuSALsV30UwCxKCmsekkemPMdKbec+tUukXG6T
         FCyoTmGffVIHPrl9jw8bSV8A+bTYDKiVQ0Wu3e/0IKErZTZZsz7nM4ZyIhRF1NQhBjrA
         pk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n28fWIJF1yinGP0ye5l0pbs9Eu2gWOsqkmtaBsPGHWU=;
        b=Jo0JS1FYas0OfHrwC/Q/vaw60FBv8t/QL9H3xBt42sOzIc9XpBXtEElLJ3qzQT/sgy
         IjxSA4wjQ0/KUXBHfKKPiAqiBr3UHi0rwD/w1+As4eKVxJ/we6s6YmZ/bs8gAoAB6whe
         IWpCw1DgDM0/XiJXe3m81+/W1svKuzw6XeuuO30XCmy8YxSRwtakSPwLxybtxqaMCF9y
         VPy140HC+DpsTB39t1zuYCn+YUYQsIfAxtr8jAkfpC368sslxBAm50d/VbrArLVO8VjT
         HEPMC3sxWbl1BQzbMbgpvwjlPu/6W4ukLGM0lmjmFckM/1M/ys/oWbizQXtixBptzWQR
         We8Q==
X-Gm-Message-State: AOAM531Abq1BQRd/Yrru9piFChFqrZ+OYejt/sgW2tzz7fXyYKzwO8/H
        dQit9AjDwJQiLeP8LGuIjIjPd2VPcdTiX76dXAD7hA==
X-Google-Smtp-Source: ABdhPJweu2wMmXP08uwTU1KAP75VfiVuFN3gruv8xdt+fwPZOl1IomvGAtIWQAUnikEAqSPzEsIokBRzN4fYjjPih6o=
X-Received: by 2002:a25:5f4c:: with SMTP id h12mr2013429ybm.97.1598959815033;
 Tue, 01 Sep 2020 04:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200823012134.3813457-1-agoode@google.com> <20200823012134.3813457-2-agoode@google.com>
 <20200823145417.GC6002@pendragon.ideasonboard.com> <20200823150822.GD6002@pendragon.ideasonboard.com>
 <5a2882e5-c029-dde7-c6ff-bd6f57aa7850@xs4all.nl> <CAOf41NnrfW6h++nR42R1OxR0B3DVrKg9RVLTQVJ=nEkn3GW4aw@mail.gmail.com>
 <6538b14c-e386-2fab-d178-7bb3e98b3525@xs4all.nl> <CAOf41NmOdb1Y3ZSO7YLxyStbSfUCo8p204TdvkwH91cXdmNq5A@mail.gmail.com>
 <20200901011714.GF16155@pendragon.ideasonboard.com>
In-Reply-To: <20200901011714.GF16155@pendragon.ideasonboard.com>
From:   Adam Goode <agoode@google.com>
Date:   Tue, 1 Sep 2020 07:29:39 -0400
Message-ID: <CAOf41NkiTJJ8pXO1hFBB8N_z+z+Wic4=vxK+w=y4j5fQ87hdRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Convey full ycbcr colorspace
 information to v4l2
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 31, 2020 at 9:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Mon, Aug 24, 2020 at 01:31:54PM -0400, Adam Goode wrote:
> > On Mon, Aug 24, 2020 at 10:38 AM Hans Verkuil wrote:
> > > On 24/08/2020 15:56, Adam Goode wrote:
> > > > On Mon, Aug 24, 2020 at 4:48 AM Hans Verkuil wrote:
> > > >> On 23/08/2020 17:08, Laurent Pinchart wrote:
> > > >>> On Sun, Aug 23, 2020 at 05:54:24PM +0300, Laurent Pinchart wrote:
> > > >>>> On Sat, Aug 22, 2020 at 09:21:34PM -0400, Adam Goode wrote:
> > > >>>>> The Color Matching Descriptor has been present in USB cameras s=
ince
> > > >>>>> the original version of UVC, but it has never been fully used
> > > >>>>> in Linux.
> > > >>>>>
> > > >>>>> This change informs V4L2 of all of the critical colorspace para=
meters:
> > > >>>>> colorspace (called "color primaries" in UVC), transfer function
> > > >>>>> (called "transfer characteristics" in UVC), ycbcr encoding (cal=
led
> > > >>>>> "matrix coefficients" in UVC), and quantization, which is alway=
s
> > > >>>>> LIMITED for UVC, see section 2.26 in USB_Video_FAQ_1.5.pdf.
> > > >>>>
> > > >>>> Isn't this valid for MJPEG only though ? There's not much else w=
e can do
> > > >>>> though, as UVC cameras don't report quantization information. Sh=
ouldn't
> > > >>>> we however reflect this in the commit message, and in the commen=
t below,
> > > >>>> to state that UVC requires limited quantization range for MJPEG,=
 and
> > > >>>> while it doesn't explicitly specify the quantization range for o=
ther
> > > >>>> formats, we can only assume it should be limited as well ?
> > > >
> > > > Yes, I am happy to improve the comment to be clearer.
> > > >
> > > >>>> The code otherwise looks good to me.
> > > >>>>
> > > >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com=
>
> > > >>>>
> > > >>>> Please let me know if you'd like to address the above issue.
> > > >>>>
> > > >>>>> The quantization is the most important improvement for this pat=
ch,
> > > >>>>> because V4L2 will otherwise interpret MJPEG as FULL range. Web =
browsers
> > > >>>>> such as Chrome and Firefox already ignore V4L2's quantization f=
or USB
> > > >>>>> devices and use the correct LIMITED value, but other programs s=
uch
> > > >>>>> as qv4l2 will incorrectly interpret the output of MJPEG from US=
B
> > > >>>>> cameras without this change.
> > > >>>>>
> > > >>>>> Signed-off-by: Adam Goode <agoode@google.com>
> > > >>>>> ---
> > > >>>>>  drivers/media/usb/uvc/uvc_driver.c | 52 ++++++++++++++++++++++=
+++++---
> > > >>>>>  drivers/media/usb/uvc/uvc_v4l2.c   |  6 ++++
> > > >>>>>  drivers/media/usb/uvc/uvcvideo.h   |  5 ++-
> > > >>>>>  3 files changed, 58 insertions(+), 5 deletions(-)
> > > >>>>>
> > > >>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media=
/usb/uvc/uvc_driver.c
> > > >>>>> index 431d86e1c94b..c0c81b089b7d 100644
> > > >>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
> > > >>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > >>>>> @@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format=
_by_guid(const u8 guid[16])
> > > >>>>>     return NULL;
> > > >>>>>  }
> > > >>>>>
> > > >>>>> -static u32 uvc_colorspace(const u8 primaries)
> > > >>>>> +static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
> > > >>>>>  {
> > > >>>>> -   static const u8 colorprimaries[] =3D {
> > > >>>>> -           0,
> > > >>>>> +   static const enum v4l2_colorspace colorprimaries[] =3D {
> > > >>>>> +           V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> > > >>>>>             V4L2_COLORSPACE_SRGB,
> > > >>>>>             V4L2_COLORSPACE_470_SYSTEM_M,
> > > >>>>>             V4L2_COLORSPACE_470_SYSTEM_BG,
> > > >>>>> @@ -262,7 +262,43 @@ static u32 uvc_colorspace(const u8 primari=
es)
> > > >>>>>     if (primaries < ARRAY_SIZE(colorprimaries))
> > > >>>>>             return colorprimaries[primaries];
> > > >>>>>
> > > >>>>> -   return 0;
> > > >>>>> +   return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> > > >>>>> +}
> > > >>>>> +
> > > >>>>> +static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_cha=
racteristics)
> > > >>>>> +{
> > > >>>>> +   static const enum v4l2_xfer_func xfer_funcs[] =3D {
> > > >>>>> +           V4L2_XFER_FUNC_DEFAULT,  /* Unspecified */
> > > >>>>> +           V4L2_XFER_FUNC_709,
> > > >>>>> +           V4L2_XFER_FUNC_709,      /* BT.470-2 M */
> > > >>>>> +           V4L2_XFER_FUNC_709,      /* BT.470-2 B, G */
> > > >>>>> +           V4L2_XFER_FUNC_709,      /* SMPTE 170M */
> > > >>>>> +           V4L2_XFER_FUNC_SMPTE240M,
> > > >>>>> +           V4L2_XFER_FUNC_NONE,     /* Linear (V =3D Lc) */
> > > >>>>> +           V4L2_XFER_FUNC_SRGB,
> > > >>>>> +   };
> > > >>>>> +
> > > >>>>> +   if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
> > > >>>>> +           return xfer_funcs[transfer_characteristics];
> > > >>>>> +
> > > >>>>> +   return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
> > > >>>>> +}
> > > >>>>> +
> > > >>>>> +static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_=
coefficients)
> > > >>>>> +{
> > > >>>>> +   static const enum v4l2_ycbcr_encoding ycbcr_encs[] =3D {
> > > >>>>> +           V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
> > > >>>>> +           V4L2_YCBCR_ENC_709,
> > > >>>>> +           V4L2_YCBCR_ENC_601,      /* FCC */
> > > >>>
> > > >>> I may have spoken a bit too fast. Doesn't FCC differ from BT.601 =
?
> > > >>> According to https://en.wikipedia.org/wiki/Talk%3AYCbCr, the form=
er uses
> > > >>>
> > > >>>  E'Y =3D 0.59 E'G + 0.11 E'B + 0.30 E'R
> > > >>>  E'PB =3D =E2=80=93 0.331 E'G + 0.500 E'B =E2=80=93 0.169 E'R
> > > >>>  E'PR =3D =E2=80=93 0.421 E'G =E2=80=93 0.079 E'B + 0.500 E'R
> > > >>>
> > > >>> while the latter uses
> > > >>>
> > > >>>  E'Y =3D 0.587 E'G + 0.114 E'B + 0.299 E'R
> > > >>>  E'PB =3D =E2=80=93 0.331 E'G + 0.500 E'B =E2=80=93 0.169 E'R
> > > >>>  E'PR =3D =E2=80=93 0.419 E'G =E2=80=93 0.081 E'B + 0.500 E'R
> > > >>>
> > > >>> We seems to be missing FCC in the V4L2 color space definitions.
> > > >>
> > > >> The differences between the two are minuscule. Add to that that NT=
SC 1953
> > > >> hasn't been in use for many decades. So I have no plans to add ano=
ther YCC
> > > >> encoding for this. I'll double check this in a few weeks time when=
 I have
> > > >> access to a better book on colorimetry.
> > > >>
> > > >
> > > > I can add a comment directly to clarify, but I am following the
> > > > mappings described in videodev2.h (with the assumption that "FCC" i=
s
> > > > close enough to 601):
> > > >
> > > > /*
> > > > * Mapping of V4L2_XFER_FUNC_DEFAULT to actual transfer functions
> > > > * for the various colorspaces:
> > > > *
> > > > * V4L2_COLORSPACE_SMPTE170M, V4L2_COLORSPACE_470_SYSTEM_M,
> > > > * V4L2_COLORSPACE_470_SYSTEM_BG, V4L2_COLORSPACE_REC709 and
> > > > * V4L2_COLORSPACE_BT2020: V4L2_XFER_FUNC_709
> > > > *
> > > > * V4L2_COLORSPACE_SRGB, V4L2_COLORSPACE_JPEG: V4L2_XFER_FUNC_SRGB
> > > > *
> > > > * V4L2_COLORSPACE_OPRGB: V4L2_XFER_FUNC_OPRGB
> > > > *
> > > > * V4L2_COLORSPACE_SMPTE240M: V4L2_XFER_FUNC_SMPTE240M
> > > > *
> > > > * V4L2_COLORSPACE_RAW: V4L2_XFER_FUNC_NONE
> > > > *
> > > > * V4L2_COLORSPACE_DCI_P3: V4L2_XFER_FUNC_DCI_P3
> > > > */
> > > >
> > > > /*
> > > > * Mapping of V4L2_YCBCR_ENC_DEFAULT to actual encodings for the
> > > > * various colorspaces:
> > > > *
> > > > * V4L2_COLORSPACE_SMPTE170M, V4L2_COLORSPACE_470_SYSTEM_M,
> > > > * V4L2_COLORSPACE_470_SYSTEM_BG, V4L2_COLORSPACE_SRGB,
> > > > * V4L2_COLORSPACE_OPRGB and V4L2_COLORSPACE_JPEG: V4L2_YCBCR_ENC_60=
1
> > > > *
> > > > * V4L2_COLORSPACE_REC709 and V4L2_COLORSPACE_DCI_P3: V4L2_YCBCR_ENC=
_709
> > > > *
> > > > * V4L2_COLORSPACE_BT2020: V4L2_YCBCR_ENC_BT2020
> > > > *
> > > > * V4L2_COLORSPACE_SMPTE240M: V4L2_YCBCR_ENC_SMPTE240M
> > > > */
> > > >
> > > > We could potentially do with some more xfer functions, though.
> > > >
> > > >>>
> > > >>>>> +           V4L2_YCBCR_ENC_601,      /* BT.470-2 B, G */
> > > >>>>> +           V4L2_YCBCR_ENC_601,      /* SMPTE 170M */
> > > >>>>> +           V4L2_YCBCR_ENC_SMPTE240M,
> > > >>>>> +   };
> > > >>>>> +
> > > >>>>> +   if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
> > > >>>>> +           return ycbcr_encs[matrix_coefficients];
> > > >>>>> +
> > > >>>>> +   return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
> > > >>>>>  }
> > > >>>>>
> > > >>>>>  /* Simplify a fraction using a simple continued fraction decom=
position. The
> > > >>>>> @@ -704,6 +740,14 @@ static int uvc_parse_format(struct uvc_dev=
ice *dev,
> > > >>>>>             }
> > > >>>>>
> > > >>>>>             format->colorspace =3D uvc_colorspace(buffer[3]);
> > > >>>>> +           format->xfer_func =3D uvc_xfer_func(buffer[4]);
> > > >>>>> +           format->ycbcr_enc =3D uvc_ycbcr_enc(buffer[5]);
> > > >>>>> +           /* All USB YCbCr encodings use LIMITED range as of =
UVC 1.5.
> > > >>>>> +            * This is true even for MJPEG, which V4L2 otherwis=
e assumes to
> > > >>>>> +            * be FULL.
> > > >>>>> +            * See section 2.26 in USB_Video_FAQ_1.5.pdf.
> > > >>
> > > >> Not true. I checked the FAQ: the FAQ describes what happens when a=
 video renderer
> > > >> incorrectly interprets the decoded JPEG color components as limite=
d range instead
> > > >> of full range (which they are to be JPEG compliant). JPEG always e=
ncodes YCbCr as
> > > >> full range.
> > > >>
> > > >
> > > > Here is what the FAQ says:
> > > >
> > > > "If the images are encoded with the luma and chroma units in the 0-=
255
> > > > range that is used
> > > > for typical JPEG still images, then the saturation and contrast wil=
l
> > > > look artificially boosted
> > > > when the video is rendered under the assumption that the levels wer=
e
> > > > in the YCbCr color
> > > > space. BT601 specifies eight-bit coding where Y is in the range of =
16
> > > > (black) to 235 (white)
> > > > inclusive."
> > > >
> > > > I read this as saying "if you encode MJPEG the same as typical JPEG
> > > > still images, it is wrong because Y must be in the range 16-235". A=
m I
> > > > reading this incorrectly?
> > >
> > > I think so. It's the 'when the video is rendered under the assumption=
 that
> > > the levels were in the YCbCr color space.' that is the reason why the=
 colors
> > > are boosted. Normally a JPEG is either decoded to full range RGB or l=
imited
> > > range YCbCr. If it is decoded to full range YCbCr, then the renderer =
should
> > > take that into account, otherwise the colors will be wrong ('boosted'=
).
> > >
> > > The text is a bit ambiguous, but JPEG always uses full range YCbCr, t=
hat's
> > > just part of the JPEG standard.
> >
> > Hmm. The text is definitely confusing. Here are some facts I know:
> >
> > About JPEG and JFIF:
> > - JPEG itself doesn't mandate the YCbCr encoding (this is specified in
> > JFIF). [https://www.w3.org/Graphics/JPEG/jfif3.pdf]
> > - JFIF specifies YCbCr encoding and range as 601 but with an explicit
> > change: "Y, Cb, and Cr are converted from R, G, and B as defined in
> > CCIR Recommendation 601 but are normalized so as to occupy the full
> > 256 levels of a 8-bit binary encoding".
> > - A JPEG file isn't JFIF unless it has an APP0 with 'JFIF'.
> >
> > About MJPEG:
> > - MJPEG doesn't specify explicit YCbCr encoding information (there
> > isn't really a specification?).
> > - The USB devices I have that output MJPEG do not output JFIF (no APP0
> > with 'JFIF').
> >
> > About color in UVC:
> > - MJPEG in UVC is required to be 8-bit YCbCr encoded
> > [USB_Video_Payload_MJPEG_1.5.pdf, section 3.3] with the color encoding
> > information specified via the Color Matching descriptor
> > [USB_Video_Payload_MJPEG_1.5.pdf, section 3].
> > - The UVC Color Matching descriptor cites BT.601 and other standards
> > without mentioning any changes to them [UVC Class Specification
> > 1.5.pdf, 3.9.2.6].
> > - BT.601 and BT.709 require limited-range YCbCr encoding.
> >
> > Real-world observations:
> > - The USB webcams I have (Logitech) output limited-range UVC MJPEG.
>
> How have you determined that ? I'd like to run tests locally, and before
> writing an application that decompresses JPEG without any colorspace
> conversion, I'd like to know if one already exists.
>

I spoke too soon! I did some additional tests and found that I am
getting full-range JPEG out of the Logitech C922 camera. (I think the
camera was accidentally in uncompressed mode for one test.) Thank you
so much for keeping me honest here, and sorry for confusion.

My methodology is this:

1. Use qv4l2 and make sure the camera is in MJPEG mode. Make sure
OpenGL decoding is turned on, otherwise the MJPEG image is always
full-range on the screen in qv4l2.
2. Cover the camera with my finger.
3. Use a screen capture device (gpick is ok) to measure the black values.
4. Flip between override of full range and limited range.

The RGB values should be between 1-15 (not 0) for black when the range
is correct.

You can switch to the uncompressed format to verify that the black
values are in the same range. Uncompressed YUV should be decoded as
limited range to get the same black value as full-range decoded MJPEG.

If you have a light to shine into the camera, you can do the same for
the white value. Again, the RGB values should be >235 but not 255.

I've also used v4l2-ctl to capture a direct JPEG frame (useful for
reading JPEG headers):

v4l2-ctl --stream-mmap --stream-count=3D1 --stream-to=3Dfile.jpg

> > - The ATEM Mini outputs full-range UVC MJPEG, but this is considered
> > to be incorrect behavior
> > (https://forum.blackmagicdesign.com/viewtopic.php?f=3D4&t=3D108315,
> > https://www.youtube.com/watch?v=3DBEXQ5s2HpwE).

I think that the ATEM Mini is one of the first high-quality devices to
use MJPEG, so even though it is outputting the same full-range image
as other devices, people are noticing it for the first time.


> > - Chrome, Firefox, and Safari interpret UVC MJPEG as limited-range.
> >

I guess even though the UVC spec seems to say otherwise, MJPEG UVC is
(at least for some devices) full range. I will at least try to fix
Chrome. Zoom also is decoding this wrong. I haven't looked at the
behavior on Windows yet, just webbrowsers on Mac and Linux (and Zoom
on Linux).

Probably we'll find some MJPEG devices that are limited range, in
which case, we are stuck in the same mess as now.

> >
> > I would agree that if the MJPEG coming out of UVC has JFIF headers, we
> > would have a problem, because we would have conflicting YCbCr encoding
> > metadata.
> >
> > But since:
> > 1. UVC is pretty clear about how to encode color,
> > 2. JPEG-without-JFIF doesn't define YCbCr encoding,
> > 3. MJPEG devices output non-JFIF JPEG,
> > 4. UVC only specifies limited-range encoding for YCbCr,
> >
> > I would conclude that UVC MJPEG should be expected to be limited-range.
> >
> > > >>>>> +            */
> > > >>>>> +           format->quantization =3D V4L2_QUANTIZATION_LIM_RANG=
E;
> > > >>
> > > >> What about sRGB? That uses full range.
> > > >>
> > > >
> > > > It is a little confusing in the code, but I only set the quantizati=
on
> > > > explicitly when we get a Color Matching descriptor from the device.=
 My
> > > > reading of the spec says that this descriptor isn't present for RGB
> > > > formats, only YCrCb. When the spec mentions sRGB in Color Matching,=
 it
> > > > is referring only to primaries or gamma.
> > > >
> > > >>>>>
> > > >>>>>             buflen -=3D buffer[0];
> > > >>>>>             buffer +=3D buffer[0];
> > > >>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/u=
sb/uvc/uvc_v4l2.c
> > > >>>>> index 7f14096cb44d..79daf46b3dcd 100644
> > > >>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > >>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > >>>>> @@ -279,6 +279,9 @@ static int uvc_v4l2_try_format(struct uvc_s=
treaming *stream,
> > > >>>>>     fmt->fmt.pix.sizeimage =3D probe->dwMaxVideoFrameSize;
> > > >>>>>     fmt->fmt.pix.pixelformat =3D format->fcc;
> > > >>>>>     fmt->fmt.pix.colorspace =3D format->colorspace;
> > > >>>>> +   fmt->fmt.pix.xfer_func =3D format->xfer_func;
> > > >>>>> +   fmt->fmt.pix.ycbcr_enc =3D format->ycbcr_enc;
> > > >>>>> +   fmt->fmt.pix.quantization =3D format->quantization;
> > > >>>>>
> > > >>>>>     if (uvc_format !=3D NULL)
> > > >>>>>             *uvc_format =3D format;
> > > >>>>> @@ -315,6 +318,9 @@ static int uvc_v4l2_get_format(struct uvc_s=
treaming *stream,
> > > >>>>>     fmt->fmt.pix.bytesperline =3D uvc_v4l2_get_bytesperline(for=
mat, frame);
> > > >>>>>     fmt->fmt.pix.sizeimage =3D stream->ctrl.dwMaxVideoFrameSize=
;
> > > >>>>>     fmt->fmt.pix.colorspace =3D format->colorspace;
> > > >>>>> +   fmt->fmt.pix.xfer_func =3D format->xfer_func;
> > > >>>>> +   fmt->fmt.pix.ycbcr_enc =3D format->ycbcr_enc;
> > > >>>>> +   fmt->fmt.pix.quantization =3D format->quantization;
> > > >>>>>
> > > >>>>>  done:
> > > >>>>>     mutex_unlock(&stream->mutex);
> > > >>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/u=
sb/uvc/uvcvideo.h
> > > >>>>> index 6ab972c643e3..6508192173dd 100644
> > > >>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> > > >>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > >>>>> @@ -370,7 +370,10 @@ struct uvc_format {
> > > >>>>>     u8 type;
> > > >>>>>     u8 index;
> > > >>>>>     u8 bpp;
> > > >>>>> -   u8 colorspace;
> > > >>>>> +   enum v4l2_colorspace colorspace;
> > > >>>>> +   enum v4l2_xfer_func xfer_func;
> > > >>>>> +   enum v4l2_ycbcr_encoding ycbcr_enc;
> > > >>>>> +   enum v4l2_quantization quantization;
> > > >>>>>     u32 fcc;
> > > >>>>>     u32 flags;
> > > >>>>>
>
> --
> Regards,
>
> Laurent Pinchart

Thanks again for working through this with me. I will revise the patch
to remove the quantization change. I think the color space information
is still useful to expose (though maybe not, given how confused things
are).


Adam
