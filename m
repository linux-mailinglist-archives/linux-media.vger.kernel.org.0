Return-Path: <linux-media+bounces-37592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF6B0383D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 09:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55232167AAC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 07:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B34323496F;
	Mon, 14 Jul 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gSoq8zui"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFDF1E9B1A
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479067; cv=none; b=uWCfxjwGOXGruvGJmLcfGaaqY3m6sgb8afKsukRYpCt2jEicKRIFyA3PIKG5FDhEHDbtF8E9zKphZh8u+Zwc1oIv6cLf+40SZq+sC+Mop5rq+6Mxe8F0kMEB47OAE516EM8PNHUZ/6Sxmhnus7KouTwS3mJsntKN5fakvL0ZXiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479067; c=relaxed/simple;
	bh=meIXVFuhwo0U7DlXFwTqTWPNohJSUxEpilpiwQSBqfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHS0jHcfmuVzttopP8HeXmo81jZ4AriIcv7ESwLV/BAnrrbI/QL/0RtJhX5bEhVPdZs7g1IwP3DYkC5SSo/lzKHDI+1Dx2AyA8UjjdCg0Wwuw5W4XphRel/L+YD4mglK9KchMHfFJ0oGsHQjzf7c+aP+paEgn8NLhuCdi9WfySc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gSoq8zui; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-558fa0b2cc8so3104560e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752479064; x=1753083864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiHcBWKp9YgqBe1/PxkbmZBsucMVnC9XKVlBV7M2C8g=;
        b=gSoq8zui7HFYbg02XxhBoNYcuDG5RP0r+UnHnLdpQRIktoDhkovWXlggtdnCtWrFEp
         YY5AW365dzJW5rHXQ6i1Tjd1nKk2+j5Krtn/vLLmFpuEkpttWGA2Kdow/1IIGfQhsZ5E
         k4g6VI9/2Cu/IoaJHVdDNVlxyzGQwGPe6LLaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752479064; x=1753083864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiHcBWKp9YgqBe1/PxkbmZBsucMVnC9XKVlBV7M2C8g=;
        b=kUHz+ZUzW5GkVoaVNPOI8LDXhMwiFiPfpwPCGUlGdMoUP0SGz5pISXEhBHvMwBCZeM
         11d0q+HW4C7OgmSyCK2Mekh+VSx3DNvLQAfaoyp9z9KrsZBgi1w3hsEhXkGtUF79Z+jG
         keOWce3fskqbpZu6KTMmMLjDHRxEJFkXRG1GKIeoef6pO+GhB4M7KPz0/FyAnomv34ks
         PinlNRyRAE9RGSP6zmHN9tTrqA2Wdd6GHbVLv7g2kdlRWOyHoJ+a3RWb9BuT471EW+OY
         t9CQwAmcsBfYrQWhUDlndkdDWPSqxRfYRA+NwviqACzCPQc8y2qb+Cy/w2EcNgIhaGzb
         91hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPTtcS4Yq7MNbIMRp5RX5SjLy8TFk8P6sQK6N3Qg+z18Ei/SVzderk1cWq2Ss8F0G2DFhlOAC0A1jb2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5THxyn5gJzX8TM1KyTs0QgIrqAls4vkZyO/87iv6kSQ+pcwi
	c5vJJlhv03+TwACCkuPJHrqWRNKwN29qgzAJM9F2Udu7PM9oMx9SxU/2QCbfZbhKmnB0QLkGGLk
	gLoI=
X-Gm-Gg: ASbGnctKIuVnp6JEOi4JYombeNJ/ulhVz51edpBVcieK8zb8m4P0OGrTjGeR7KVrnDY
	b4zmwjivGF3E8XRyx7xp08APszQOSwOB+o8u/3Z3TEqcmYhcc601jPaxaA+puD4cwkQq5BunGBt
	/p3clh/JjQJaORteDuwM62cPGX0tbZnZ5GIu/qu9yGxwefhvdCdoOsNITaJpFmwIkIUvh81kEI+
	m7BSPm5tlY+mWE5QP2mdQX/udLpMNycxDu6+WnuOzVKZcKvMv4mxeXfV4YyuxyLCsuvQxCH2YEp
	jI4koPTy7eMtlneIWAKnaq/J98VH+jEv/M4UPnfiTlp6QsrlGBvBbhuD4RPfio2swyq5dl+20sx
	mrfRyzJZcPPE9iaqMqOJqbtTbTvNTwJmcfvk22DHWi4mtsdHzNrLuSCsudnWU18zW
X-Google-Smtp-Source: AGHT+IFpglEWXAFCg9jZ8yxo8fzghPOx2b/lpGDLOI+OnGOJgx6fnbId5LwxsD2sQovGmrkSO+DTjA==
X-Received: by 2002:a05:6512:304f:b0:553:2e0f:96c with SMTP id 2adb3069b0e04-55a044b4d83mr3018918e87.23.1752479063545;
        Mon, 14 Jul 2025 00:44:23 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bb46csm1864866e87.8.2025.07.14.00.44.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 00:44:22 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32f2947ab0cso34996291fa.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 00:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtXbdf2lhmyNxXcGqjMSsLtnIs4nsMgtXIwC7rpbLoVxqTqOXl3nZZmzpRnN2dC3+1yH2zO/QS/azVhA==@vger.kernel.org
X-Received: by 2002:a2e:be9e:0:b0:32b:95ca:8103 with SMTP id
 38308e7fff4ca-330532d1539mr34334811fa.14.1752479062312; Mon, 14 Jul 2025
 00:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org> <20250711201308.GI27674@pendragon.ideasonboard.com>
In-Reply-To: <20250711201308.GI27674@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 09:44:09 +0200
X-Gmail-Original-Message-ID: <CANiDSCsfMaOTb90yJ6gbN6NOPqMAZSiLVcfq6YnpVkdabrW6xw@mail.gmail.com>
X-Gm-Features: Ac12FXyBJ3g138qqv6DvaCM4IcR-em_Kp08H9lGf8-r7VoyYMA1D6l_p7Q8nePY
Message-ID: <CANiDSCsfMaOTb90yJ6gbN6NOPqMAZSiLVcfq6YnpVkdabrW6xw@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 11 Jul 2025 at 22:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 07, 2025 at 06:34:04PM +0000, Ricardo Ribalda wrote:
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
> >  drivers/media/usb/uvc/uvc_metadata.c               |  4 ++++
> >  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> >  include/uapi/linux/videodev2.h                     |  1 +
> >  7 files changed, 32 insertions(+)
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
> > index 658543062bba3b7e600699d7271ffc89250ba7e5..fdde1d37ed2ef9058e3ea3417bec25afe454dfc0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25827,6 +25827,7 @@ S:    Maintained
> >  W:   http://www.ideasonboard.org/uvc/
> >  T:   git git://linuxtv.org/media.git
> >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >  F:   drivers/media/common/uvc.c
> >  F:   drivers/media/usb/uvc/
> > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > index 4bcbc22f47e67c52baf6e133f240131ff3d32a03..77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7 100644
> > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > @@ -195,6 +195,10 @@ void uvc_meta_init(struct uvc_device *dev)
> >           !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
> >               dev->meta_formats[i++] = dev->info->meta_format;
> >
> > +     if (dev->quirks & UVC_QUIRK_MSXU_META &&
> > +         !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC_MSXU_1_5))
> > +             dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
>
> Just to clarify, does this mean that your goal is to set
> dev->info->meta_format to V4L2_META_FMT_UVC_MSXU_1_5 as devices are
> reported to support the format ?

That is correct. Compatible devices shall either be autodetected via
the special control or manually added to the quirk list.

Quirking via module parameter should be just used for development purposes.


>
> > +
> >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> >       dev->meta_formats[i++] = 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b3c094c6591e7a71fc00e1096bcf493a83f330ad..616adc417c62a58686beccbc440a5dfac0a2d588 100644
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
> > index be94a79b976e3de4eb957f5d2584ec6d4230469e..993b36417b4655456ce545cb42a41b55b98e4d6c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1463,6 +1463,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >       case V4L2_META_FMT_VSP1_HGO:    descr = "R-Car VSP1 1-D Histogram"; break;
> >       case V4L2_META_FMT_VSP1_HGT:    descr = "R-Car VSP1 2-D Histogram"; break;
> >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> > +     case V4L2_META_FMT_UVC_MSXU_1_5:        descr = "UVC MSXU Metadata"; break;
> >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> >       case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A Parameters"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..863bc5b7dec32303e852d7e9c3891011ce5a3d71 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -867,6 +867,7 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
> >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> > +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
> >  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> >
> >  /* Vendor specific - used for RK_ISP1 camera sub-system */
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

