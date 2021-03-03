Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD8232BB09
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358604AbhCCMON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhCCKaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 05:30:55 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED5BC061788
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 02:30:10 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u4so27951636ljh.6
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 02:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ul5d5eo5jjguw4uCkJHVtdEjPOboupeNtSzAVz4Rmio=;
        b=ThpGElSJaCEbZZncSCI7UVnPIpXqQjO7Q4JJCYgYQ5obCM9YSBam90bydANSj3gDJj
         goYyHSbLByqsIFWn/0d9nyPpQrSNEwpWzB1GvB89Pmnx90aZRKA/uvkwcHmfaj47ChC/
         g4MbCiU8TMHgSsfVHS1LWSrMaKVvq+02Hdhak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ul5d5eo5jjguw4uCkJHVtdEjPOboupeNtSzAVz4Rmio=;
        b=dLms/Pcn0rJcgJYsqz7l8MalId4NCmfacy1NW7kZGW+5WsWyz15CG7PRMCH3w3G7ex
         7yRVQE3JQZ/L6xnpJkUtSvM5qHW/1WFYCIwANrScM6RiJ4zPZGtKtuJ3MGIDHDQ3j/yc
         NlSJagI1c38z4fSbId2rDcqGYfsPHN4wAKdKlejAvMLsXso+u+1hhAz+Qt0+i+BFZbix
         w4uThbZgZanQ8i54Ycu4Wj9InoSob3blpAV0xGpF6aiNYP6+3UrlnQgS1rYjy/wjoZoR
         V5/XmqCqY9z3c49c2DlLFJFljimeTd2LcO33oE64AZaQ0G9ous5wPYHbkuABV3lnCxEt
         LIDg==
X-Gm-Message-State: AOAM533cOCvBAPBlt5ntlYz8HBjsv+bNN0ErR3IpvcZinMoviMhBI4W7
        e57U/AwYY3lbrb3a1apAkgH1btTkr8oY5A==
X-Google-Smtp-Source: ABdhPJy0NFxcnTpUjcSEreS5/Q2RJeu9TGksjksgsEuqT+OutJQHb2eDsSDonc+LvFTEJQF79TPgaQ==
X-Received: by 2002:a2e:b555:: with SMTP id a21mr5678719ljn.69.1614767409057;
        Wed, 03 Mar 2021 02:30:09 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id k18sm2919450lfm.88.2021.03.03.02.30.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 02:30:07 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id k9so16368546lfo.12
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 02:30:07 -0800 (PST)
X-Received: by 2002:a19:712:: with SMTP id 18mr14809919lfh.591.1614767406688;
 Wed, 03 Mar 2021 02:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20210225101612.2832444-1-acourbot@chromium.org>
 <20210225101612.2832444-4-acourbot@chromium.org> <4cb93f828695f7f6307077da466a58ba478c9824.camel@ndufresne.ca>
In-Reply-To: <4cb93f828695f7f6307077da466a58ba478c9824.camel@ndufresne.ca>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 3 Mar 2021 19:29:55 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUUDSwRNEiuDy8s-CMwosraS25P2o109XyJCms9RTRBsQ@mail.gmail.com>
Message-ID: <CAPBb6MUUDSwRNEiuDy8s-CMwosraS25P2o109XyJCms9RTRBsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] media: add Mediatek's MM21 format
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Wed, Mar 3, 2021 at 2:38 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le jeudi 25 f=C3=A9vrier 2021 =C3=A0 19:16 +0900, Alexandre Courbot a =C3=
=A9crit :
> > Add Mediatek's non-compressed 8 bit block video mode. This format is
> > produced by the MT8183 codec and can be converted to a non-proprietary
> > format by the MDP3 component.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
> >  include/uapi/linux/videodev2.h                            | 1 +
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > index c9231e18859b..187ea89f7a25 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> > @@ -242,6 +242,13 @@ please make a proposal on the linux-media mailing =
list.
> >         It is an opaque intermediate format and the MDP hardware must b=
e
> >         used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M`=
`,
> >         ``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> > +    * .. _V4L2-PIX-FMT-MM21:
> > +
> > +      - ``V4L2_PIX_FMT_MM21``
> > +      - 'MM21'
> > +      - Non-compressed, tiled two-planar format used by Mediatek MT818=
3.
> > +       This is an opaque intermediate format and the MDP3 hardware can=
 be
> > +       used to convert it to other formats.
> >      * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
>
> The SUNXI one was a mistake,  it's linear layout 32x32 tiles. The problem=
 with
> calling this a vendor format, is that other vendor might be using it too.=
 But
> they won't know and the format might endup duplicated, even if it's the s=
ame
> one.
>
> So here's my request, have you tried to understand a bit more what the ti=
ling
> layout is ? Could be tiled + SAND, could use zigzag layout like Samsung d=
o. I
> think if we can avoid vendor formats, we can preserve the pixel format li=
st
> sanity here. Most of the HW I've encoutered was very easy to reverse, eve=
n if
> undocumented (except the compressed one).

Unfortunately I don't think I can look too closely into that, for
non-technical reasons. But if MTK could come forward and document
their format, that would be indeed ideal.

>
> If not possible, I would like to suggest:
>
>   V4L2_PIX_FMT_MTK_NV21
>
> The important part is to add a clear seperation for the vendor name, it e=
asy to
> recognize then.

The MTK prefix makes sense, but I do not know if NV21 is a correct
denomination for that format. Note that we have another MTK-only
format currently named V4L2_PIX_FMT_MT21C, which is already public. It
would be nice to rename it as well, but since it is part of the public
API I'm afraid the cat is already out of the bag for that one...

>
> >
> >        - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> > core/v4l2-ioctl.c
> > index 31d1342e61e8..0b85b2bbc628 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1384,6 +1384,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >         case V4L2_PIX_FMT_TM6000:       descr =3D "A/V + VBI Mux Packet=
"; break;
> >         case V4L2_PIX_FMT_CIT_YYVYUY:   descr =3D "GSPCA CIT YYVYUY"; b=
reak;
> >         case V4L2_PIX_FMT_KONICA420:    descr =3D "GSPCA KONICA420"; br=
eak;
> > +       case V4L2_PIX_FMT_MM21:         descr =3D "Mediatek 8-bit block=
 format";
> > break;
> >         case V4L2_PIX_FMT_HSV24:        descr =3D "24-bit HSV 8-8-8"; b=
reak;
> >         case V4L2_PIX_FMT_HSV32:        descr =3D "32-bit XHSV 8-8-8-8"=
; break;
> >         case V4L2_SDR_FMT_CU8:          descr =3D "Complex U8"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index 79dbde3bcf8d..e6890dae76ec 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -731,6 +731,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greys=
cale
> > 12-bit L/R interleaved */
> >  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth=
 data
> > 16-bit */
> >  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Media=
tek
> > compressed block mode  */
> > +#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Media=
tek 8-
> > bit block mode, two non-contiguous planes */
> >  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel=
 Planar
> > Greyscale 10-bit and Depth 16-bit */
> >  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') =
/*
> > Sunxi Tiled NV12 Format */
> >  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel=
 4-bit
> > packed depth confidence information */
>
>
