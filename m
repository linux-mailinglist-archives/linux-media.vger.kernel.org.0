Return-Path: <linux-media+bounces-36989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237FAFB27E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE193BD36D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A17299AAF;
	Mon,  7 Jul 2025 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jQCZOV16"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A016D289360
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888664; cv=none; b=eBrIIM+jx2FCAXKIjw6XGmS4BY3re3SNloLhyz6uppoLK9k1gCgQxvBGzmxWrER5d59MQO9f+3WI8eJf4+kfxA3JVwI0fSfzFDFnAAZ41SRiTqJ56qQUACYM3X2Y/fj5vzdgmkPkMA6AZlVjpBYWWsjCzLdT783XNPtR18E3/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888664; c=relaxed/simple;
	bh=f8RJ+DitmfZ4xbh6kkh9v9uuyJ0l7Z2ubyGai5pB8TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M81x6NQ6D920OL+4YT+ikTKAmCFTEBnnUeeDzUHeV2KwcbtiuqQ5VNwMFWU1jHBRv53n+s/V63VSFBsDvLjjx3YG/ZabaYBH+SGhMTfC803Q6VeImSSIonuOaAQ/LmS3CtYb2PqRcdspq2YBN1k/+1rBFDxjxXhF6tYx7scBjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jQCZOV16; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b3316160so3637590e87.2
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751888660; x=1752493460; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeLoSM7pzBdYskymtjqKlwv9zdVc21GR+UaEdj1iAvo=;
        b=jQCZOV16GmpsjlWKx/ZtOLvQlvvk/hDSPKodE2uTZBgjgZnpz6TZZyyn03ENWaW1xG
         RGOklLna/MKNBTmZCZhQXU3ueQYpRpmao+M16aZS29+Fgd9EQ+RWN0Od2Shp6sTiUr1C
         KlAo+k3R1nMQOuOeSgI8xW6dwvbuk4hPzFbxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888660; x=1752493460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeLoSM7pzBdYskymtjqKlwv9zdVc21GR+UaEdj1iAvo=;
        b=pyb6an/br8nWy/cjfnKWULZD5ArqKu4Juvl/BWGNX0Ku/jysXDpdxscHiRrCb72g3+
         EfIk/zxl4Nukyysx+DOgHFvPyleEGrDmxxJUiy1BsfqJlMm2ovkz7EFffflIHcIayKX0
         c01wEz8FwW+vvrLcxII4NoA45jbqvZTSJKCMRzKc6FZOFpzDGE0bsVmnKG3es7BQllO6
         PLVLB+vFB0C9syLc5OJFN/Y/r9xIXbGxL3v+qlYUwTkEEUAglySpKjWLES9f14nC/pk6
         K4yon8/E4T490Oy8dEpINhDR0AHxzZY+G9ajy2xNPMebCQDjpR751pn1KNovBplctNgH
         fh4g==
X-Forwarded-Encrypted: i=1; AJvYcCV/3+B4LrAYWKDVHVvFdwU492hBvfZg4N/giw/w+4vVEyiyVMwvHOvF8hqL0gDb7thK63Z+jHpnNaBGEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeV4yASEH84DOk1bQAQy+udWgLRDFmjpbbl0ncDBRc/zgushaY
	3uu7hi+uBEall/GutXiqAVOVv/9N2N8ExfPvQRCQj4OH5MxejmQqP1p7hQYX++zsTWrLkbMya5a
	d6qc=
X-Gm-Gg: ASbGncsYd9p81852lIrLodXuRGg7DHof8K44GNyM3awcouyaOdy0wOrKutqVT6vKLl9
	Gr0QFHdTQgVpl4Q2Z2V9VAGJXzqBYkMAf8B+dcU1oX+OIB1M93WXQi2OOMcj8lmOP3EmTWzXfZw
	z/0rrHIJeYRrDPFMrnDltpeWYBJHyAAWi3NxFHiu4oFJ4mdut1TtBRstb66kHRFHur1x4T/vvmr
	XuWZN6621al92jZGTd0IUs+XodCzdp3jh2HOBlCFOsNRtOJYwab/y3W+ihsY2/YDdPld7A97073
	WC12m2rxsjg1E0cyihOMDY8L3i/lM/tVnOQcL+IZ9iGliebWM+1qa+oSErOZZS+xU8xs7YYlxEA
	Owbz1woDYgxxrancG+5OsYfju903S
X-Google-Smtp-Source: AGHT+IExa9QlHzVfJj7MdLSLYEcVYbtwaHTlO9DiU+26I3ScCe4lzXpAkgr4Gn4ZF6rBWkYhPycZLA==
X-Received: by 2002:a05:6512:1089:b0:553:2dce:3aac with SMTP id 2adb3069b0e04-557a19df0e7mr3265306e87.16.1751888660322;
        Mon, 07 Jul 2025 04:44:20 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a8205sm1311089e87.145.2025.07.07.04.44.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:44:19 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32f2947ab0bso7625231fa.3
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 04:44:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJWsBfUfFytFXnhyGGQMaiO+2mHNSUU6IdowzdungAVH2fdCZokvDOOoBZ3Bs281ZPV9aPsn0qhPjLuw==@vger.kernel.org
X-Received: by 2002:a2e:8a9b:0:b0:32a:778d:be76 with SMTP id
 38308e7fff4ca-32f092c6cb8mr15725141fa.26.1751888659299; Mon, 07 Jul 2025
 04:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
 <20250617-uvc-meta-v7-4-9c50623e2286@chromium.org> <60643043-4543-4882-81fe-18a809d02b1c@kernel.org>
In-Reply-To: <60643043-4543-4882-81fe-18a809d02b1c@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Jul 2025 13:44:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqB6ktOXPg5S+He4bk8X_xA9y1r9AE9qc1AZ=edDYfrQ@mail.gmail.com>
X-Gm-Features: Ac12FXyMgZJcDLsLBARWJcOJliOjvsCtrHA-WbCVwiSE3PPGiKY4lEVDW4cSxQA
Message-ID: <CANiDSCsqB6ktOXPg5S+He4bk8X_xA9y1r9AE9qc1AZ=edDYfrQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jul 2025 at 13:34, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> Thank you for the new version of this series.
>
> On 17-Jun-25 16:42, Ricardo Ribalda wrote:
> > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > V4L2_META_FMT_D4XX copies the whole metadata section.
> >
> > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > devices, but it is useful to have the whole metadata payload for any
> > device where vendors include other metadata, such as the one described by
> > Microsoft:
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> >
> > This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> > identical to V4L2_META_FMT_D4XX.
> >
> > Let the user enable this format with a quirk for now. This way they can
> > test if their devices provide useful metadata without rebuilding the
> > kernel. They can later contribute patches to auto-quirk their devices.
> > We will also work in methods to auto-detect devices compatible with this
> > new metadata format.
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> >  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  drivers/media/usb/uvc/uvc_metadata.c               | 20 +++++++++++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> >  include/uapi/linux/videodev2.h                     |  1 +
> >  7 files changed, 46 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..0de80328c36bf148051a19abe9e5241234ddfe5c 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
> >      metafmt-pisp-fe
> >      metafmt-rkisp1
> >      metafmt-uvc
> > +    metafmt-uvc-msxu-1-5
> >      metafmt-vivid
> >      metafmt-vsp1-hgo
> >      metafmt-vsp1-hgt
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..dd1c3076df243d770a13e7f6d07c3296a269e16a
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > @@ -0,0 +1,23 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-meta-fmt-uvc-msxu-1-5:
> > +
> > +***********************************
> > +V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
> > +***********************************
> > +
> > +Microsoft(R)'s UVC Payload Metadata.
> > +
> > +
> > +Description
> > +===========
> > +
> > +V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
> > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > +metadata in the `buffer[]` field, not just the first 2-12 bytes.
> > +
> > +The metadata format follows the specification from Microsoft(R) [1].
> > +
> > +.. _1:
> > +
> > +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e8f3dc93a56921924f57e7d5a03ea2fa182a4448..87101630e528297c57b22ffc2fe553e3864d25cc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25816,6 +25816,7 @@ S:    Maintained
> >  W:   http://www.ideasonboard.org/uvc/
> >  T:   git git://linuxtv.org/media.git
> >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >  F:   drivers/media/common/uvc.c
> >  F:   drivers/media/usb/uvc/
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index bc84e849174397f41d1e20bf890a876eeb5a9c67..b09f81d907d64f7d7a3b0dc52de319879b7e68be 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -190,13 +190,29 @@ int uvc_meta_init(struct uvc_device *dev)
> >       static const u32 uvch_only[] = {V4L2_META_FMT_UVC, 0};
> >       static const u32 d4xx_format[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
> >                                         0};
> > +     static const u32 all_formats[] = {V4L2_META_FMT_UVC, V4L2_META_FMT_D4XX,
> > +                                       V4L2_META_FMT_UVC_MSXU_1_5, 0};
> > +     static const u32 ms_format[] = {V4L2_META_FMT_UVC,
> > +                                     V4L2_META_FMT_UVC_MSXU_1_5, 0};
>
> Hmm, this does not look great, I guess we are not expecting any
> new metadata formats soon but just needing the 4 arrays here and
> then ... (continued below).

Yeah, this looks better :)


Will implement it as you describe. Just a couple of comments.



>
>
> > +     bool support_msxu;
> > +
> > +     support_msxu = dev->quirks & UVC_QUIRK_MSXU_META;
> >
> >       switch (dev->info->meta_format) {
> > +     case V4L2_META_FMT_UVC_MSXU_1_5:
> > +             dev->meta_formats = ms_format;
> > +             break;
> >       case V4L2_META_FMT_D4XX:
> > -             dev->meta_formats = d4xx_format;
> > +             if (support_msxu)
> > +                     dev->meta_formats = all_formats;
> > +             else
> > +                     dev->meta_formats = d4xx_format;
> >               break;
> >       case 0:
> > -             dev->meta_formats = uvch_only;
> > +             if (support_msxu)
> > +                     dev->meta_formats = ms_format;
> > +             else
> > +                     dev->meta_formats = uvch_only;
>
> Also having these if else's here both don't look nice /
> this does not feel clean.
>
> My suggestion would be to instead do the following:
>
> 1. Add a #define UVC_MAX_META_DATA_FORMATS 3 to uvcvideo.h
> 2. In the struct uvc_device definition change meta_formats to:
>
>         u32 meta_formats[UVC_MAX_META_DATA_FORMATS + 1];
>
> 3. Change uvc_meta_init() to:
>
> void uvc_meta_init(struct uvc_device *dev)
> {
>         unsigned int i = 0;
>
>         dev->meta_formats[i++] = V4L2_META_FMT_UVC;
>
>         if (dev->info->meta_format)
>                 dev->meta_formats[i++] = dev->info->meta_format;
>
>         if (dev->quirks & UVC_QUIRK_MSXU_META)

         if (dev->quirks & UVC_QUIRK_MSXU_META) &&
dev->meta_formats[i-1] != V4L2_META_FMT_UVC_MSXU_1_5)
>                 dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
>
>         /* IMPORTANT for new meta-formats update UVC_MAX_META_DATA_FORMATS */

Do we really need this comment? Even if we add more formats the total
number of formats supported will never be more than 3.

FMT_UVC, device_specific, msxu


>
>         dev->meta_formats[i++] = 0;
> }
>
> Note uvc_meta_init() now also is void, so no more need to error check it.
>
> The only downside I can see is that if we ever actually start setting
> dev->info->meta_format = V4L2_META_FMT_UVC_MSXU_1_5 and a user manually
> enables the quirk we get V4L2_META_FMT_UVC_MSXU_1_5 listed twice, but
> that should not cause any issues and normally that will never happen.
>
> IMHO this is better, then the switch-case + if-else code.
>
> Stating the obvious: some / most of these changes should be done in patch 3/5
> already.
>
> Regards,
>
> Hans
>
>
>
>
> >               break;
> >       default:
> >               dev_err(&dev->udev->dev, "Unknown metadata format 0x%x\n",
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 502f1d5608637cd28ce6f01aee31c4f5df160081..3578ce72fb6a1153ae79c244ec10093e8efdd739 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -77,6 +77,7 @@
> >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00008000
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> > +#define UVC_QUIRK_MSXU_META          0x00040000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 650dc1956f73d2f1943b56c42140c7b8d757259f..ba508f7fb577021497009ab23a7be5add23fd08c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1459,6 +1459,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >       case V4L2_META_FMT_VSP1_HGO:    descr = "R-Car VSP1 1-D Histogram"; break;
> >       case V4L2_META_FMT_VSP1_HGT:    descr = "R-Car VSP1 2-D Histogram"; break;
> >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> > +     case V4L2_META_FMT_UVC_MSXU_1_5:        descr = "UVC MSXU Metadata"; break;
> >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> >       case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A Parameters"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 9e3b366d5fc79d8a04c6f0752858fc23363db65c..75f2096b2d4fed5e0235ea4732d35044ff77a98b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -861,6 +861,7 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
> >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> > +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
> >  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> >
> >  /* Vendor specific - used for RK_ISP1 camera sub-system */
> >
>


-- 
Ricardo Ribalda

