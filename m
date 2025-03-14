Return-Path: <linux-media+bounces-28177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C174A60937
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 07:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 866D117D4F8
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76BC1547E0;
	Fri, 14 Mar 2025 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfVqAqKi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F32F4A;
	Fri, 14 Mar 2025 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741934102; cv=none; b=WGJxt6OQhn13I5L2zZdXb4EnfCMmZxiF/OSWNTsuAk3JIxWGoSF2XV545kcVSoVpLuExcrO9MgK2X3RYvVTHNWG7/y4to7sHJfwbkqVjUDGrwKZqLz1Mzroul4MaJh0ZSqnESLxqqM10KtKBMMoGrynW+vxvOV7KoSHFaZjKDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741934102; c=relaxed/simple;
	bh=zHa1YR43gS+g+8/IcC54v4zmSih9SACYwhm1yGincVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KI30O9AYlItROcpxeWJalgJgEcaRH/xTVs8tK5InL/N99Y10pTKxPFYNrvO9hx6sBxQbikYa5AZl1ECrwA9yEfJmJ2ZrvoqYBX1KKwFcKdsU8mDJxb4bRGWQj+DGxWflUij+tb+ZDOLO7Xm1dZSAZ42mCtbTZdB2tRaaNxluiUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfVqAqKi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28F1C4CEE3;
	Fri, 14 Mar 2025 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741934101;
	bh=zHa1YR43gS+g+8/IcC54v4zmSih9SACYwhm1yGincVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qfVqAqKiSFbgrzaWubxdV5cdnie0qi43IqStGiLj/XlAXiThAl8eGS0iZqLBULNWb
	 dRKLQUKZmIkaP4BIdBgEwis/gz0yvUQQzYrdkLyQmdNK3a95ztTYw2SpNjVhLdeAzT
	 zPP+o9s5Q6kVgNE+uVo9duQlOe8omR/wekTow6g5ayRFEnORMt/C2ZTt9MuvT0CCNa
	 ACTeB54QLLlV6NpLWcBb1XuPOzKmvD7KshNrMQ0wrnJ5cwBpiJHdcG+xF80Wg1SGZ6
	 ygZ39b3IwDWUuxoU5jKAJK6szOUEqzdR9UmCQRmB+PwAGIF/unxxmE9pukXV9wNuQb
	 qNTINQdTAPeTg==
Date: Fri, 14 Mar 2025 07:34:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_CUSTOM
Message-ID: <20250314073456.25817a3d@foz.lan>
In-Reply-To: <20250313-uvc-metadata-v3-3-c467af869c60@chromium.org>
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
	<20250313-uvc-metadata-v3-3-c467af869c60@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Mar 2025 12:06:27 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> V4L2_META_FMT_D4XX copies the whole metadata section.
> 
> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> devices, but it is useful to have the whole metadata section for any
> device where vendors include other metadata, such as the one described by
> Microsoft:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> 
> This patch introduces a new format V4L2_META_FMT_UVC_CUSTOM, that is
> identical to V4L2_META_FMT_D4XX but it is available to all the UVC
> devices.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 31 +++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  6 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..9fd83f4a3cc8509702a2a9f032fdc04bf6c6d1bc 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-pisp-fe
>      metafmt-rkisp1
>      metafmt-uvc
> +    metafmt-uvc-custom
>      metafmt-vivid
>      metafmt-vsp1-hgo
>      metafmt-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..9f150fc2b6f379cc4707ff45041dd014956ae11a
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-meta-fmt-uvc-custom:
> +
> +*********************************
> +V4L2_META_FMT_UVC_CUSTOM ('UVCC')
> +*********************************
> +
> +UVC Custom Payload Metadata.
> +
> +
> +Description
> +===========
> +
> +V4L2_META_FMT_UVC_CUSTOM buffers follow the metadata buffer layout of
> +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> +metadata, not just the first 2-12 bytes.
> +
> +The most common metadata format is the one proposed by Microsoft(R)'s UVC
> +extension [1_], but other vendors might have different formats.
> +
> +Applications might use information from the Hardware Database (hwdb)[2_] to
> +process the camera's metadata accordingly.

Having something like that at the userspace API shouldn't be handled
lightly. This sounds to me that passing a blank check for vendors to stream
whatever they want without any requirements to provide and sort of
documentation for the usersace to decode it.

Also, it would be hard for userspace to distinguish what metatata
is contained for a random UVC camera. Please let's not do that.

As the specific issue here is to support an already known extension,
which is already documented, Just add an specific format for it, e.g. 
you could add something like that at the documentation:

	V4L2_META_FMT_MSXU_UVC_1_5
	   Microsoft extensions to USB Video Class 1.5 specification.
	
	   For more details, see: https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5	

And then add the corresponding format to V4L2 API.

Regards,
Mauro

