Return-Path: <linux-media+bounces-25591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF383A25DC5
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B26883AF5E2
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2F91FBE9C;
	Mon,  3 Feb 2025 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELxdh0wg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D39208973
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594388; cv=none; b=YdOFrS0ATrW7hVXQkogqmU/5b/LthtXcbELnRx1gTn93yIvUk6wSE+IA9HiJsr66Gw9+bWjjyXpEx4mYgfJBRCDlv5spcWSL40M8jwhhAlNSogrqsZQRjVEFDEODvDvcvF8ZQB9f20VHGJZrKAg6IuHHUDDBPa2fApv6ZnJiVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594388; c=relaxed/simple;
	bh=rWsUXD3bPCXJa9a5WaPqcR4qZSFWyJknZel1VV7senM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5G68URp3yKJ/XI49dEVWIV9xmwaJztPSPr4QI7VChYLj4oKMbE18F7kUw6CuFImE+3Fep4W+7a2ucNdfZzi8RaCdDYIrueYjB6I8LyT2YdhGkQeQrK67MjZVtKArTsO3AGqMzb+Yy9OdYpi0eHFRAoEMEsmmEakR7GyXIRn23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELxdh0wg; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5189a440a65so2860562e0c.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 06:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738594385; x=1739199185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEFmN1u6p4UDoKbH2dlUXrb2bsLXIXw7j6X/C+f8NyY=;
        b=ELxdh0wgLeieqy4i2NjEsonvJGoo0lZKbSy2RxGqf56tAMvqLnpRoEgSTe8awtR1Jq
         Xqrdz1n5tFFbN/oIHLUumW15ES0sRLeQ+0OgHJ3vn3KY6vmjGw5Af8xGTF5ZjCMZs9Bz
         twoO0oBBxPyevgxwX2dmGNBtZTat7S4n6OdhXgfMesFOzIwe4HMaezKt3jQAaYojbdAD
         4ZaWfJEUQP91XhgcCJbzT2lGpmJ3+ffjhzlweFKdLVdZv+4uu8T6SrDBu1dOYDfku3qa
         Ow+2Q9Q0jGI9QhEOzEzUMGj/CgaHkkgXTobW5j2P3/+aj4IjGR/oWN9TKffNgDL1RL1Z
         39EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738594385; x=1739199185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEFmN1u6p4UDoKbH2dlUXrb2bsLXIXw7j6X/C+f8NyY=;
        b=GwCfiEa43FMf8dU0POJhJldhJYtM/NbzqojxLxRoVv+7o8IDp8Wlrb5GUE6s49LkWe
         S6VqvbZ61gu7vH2bqsjsbelHgciPStJ4LFSmhzvzGiR7ysjhIfNkpJSBsIjOh5EBrInW
         BCTdOGCd+EnLIJrLx7R6lKgRDdkWj/6h3R6s+JeAGppnV0xMaC1ITKXg6uHQ+2IOzJdD
         k1qq9ApmdK3TQhxmOzdn0uAVX1bC+1dLxee+i60zcsT5nh4rQ4eWGB80Th8R8UDB9FO4
         f2yn5meo1TLo8fuvpnbFEawGXeJnAEG0nI42lSlUL6yQFjomyCzwCFnX5GMNANPjWO41
         pJaA==
X-Gm-Message-State: AOJu0Yzq8YIdQR2UyQPN9yyAWrUUZA0T4UtD95HqKisBbz6nwhhNgkds
	pVYmHbYjjWiHVY+miNBo3AMkYcLrx97gMmHxygId0ug3X0j8RoyPEMcy4JRCLfr+nD7BPMUBgmE
	e7we7v/TCh/u1qrL6OFd9C+ZG0J4=
X-Gm-Gg: ASbGncu4dVJ3X7W2CPeodWIU5iTjz+IDEA4QgeqzvDw6pVX5Oi7s8z6KkE85hQsdVTZ
	FdG6cXLbciytjvVSMzsyaSSeJViAF0NchI3bqY5L3YVoWNW6vc2HRswsTKvnfIaXshOv33bae
X-Google-Smtp-Source: AGHT+IEa2PNUfA05d7u1ltx6htoJCAL56og7eOaOXKOE3FOk9P1lkBkdciBNrrsRFK0usldCkHzQwFSk2CZm6JHt6mo=
X-Received: by 2002:a05:6122:238c:b0:51b:8949:c9a8 with SMTP id
 71dfb90a1353d-51e9e42ff0bmr16726570e0c.9.1738594385584; Mon, 03 Feb 2025
 06:53:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com> <20250203085853.1361401-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20250203085853.1361401-2-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Feb 2025 14:52:39 +0000
X-Gm-Features: AWEUYZmIlZipyPvDPnsoxqXSXSaxwImxITQ0CI6f9c-d8UUi6QefYRRgPVXGF4w
Message-ID: <CA+V-a8ub_5c94ndyF1XsEknOiH_M7oTLU3rM9128xQickR1T0g@mail.gmail.com>
Subject: Re: [RFC v5 01/15] media: Documentation: Rework embedded data documentation
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:59=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Rework embedded data documentation by removing the reference to the pixel
> data stream. The specific documentation of the embedded data interface
> will be elsewhere, in the near future either CCS or common raw camera
> sensor model documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index dc415b8f6c8e..8e1083417ae1 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -111,13 +111,12 @@ the sensor configuration for the captured frame bac=
k to the host. While CSI-2 is
>  the most common data interface used by such sensors, embedded data can b=
e
>  available on other interfaces as well.
>
> -Such sensors expose two internal sink pads (pads that have both the
> -``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> -<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image an=
d
> -embedded data streams. Both of these pads produces a single stream, and =
the
> -sub-device routes those streams to the external (source) pad. If the sub=
-device
> -driver supports disabling embedded data, this can be done by disabling t=
he
> -embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +Embedded data support is indicated by the precence of an internal sink p=
ad (pad
> +that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
> +``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a meta=
data
> +format to model the embedded data stream. If the sub-device driver suppo=
rts
> +disabling embedded data, this can be done by disabling the embedded data=
 route
> +via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
>
>  In general, changing the embedded data format from the driver-configured=
 values
>  is not supported. The height of the metadata is device-specific and the =
width
> --
> 2.39.5
>

