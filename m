Return-Path: <linux-media+bounces-25593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E3A25DE4
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFEF93A4439
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 14:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59034201026;
	Mon,  3 Feb 2025 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nktcvqBX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621A1E493
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594695; cv=none; b=rFk1F34V1xC9gYIcbc/IJeDE6YtrRdKxjE4KCbp4nkptexjXoN1uC9ZwAcqe5WN/GoiezlM175nFOAgpD2+z5tZu5PRW3jKQ2mZtmXAJFlSrh8q+4Ke2hje2LQ+mzG3zz68gB/5ESMyrJU98Yz+melDySP4VRNsmnEN3IRWJX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594695; c=relaxed/simple;
	bh=/LyI1RNtQ8OdYcUo/g3qhFoZS80Va3AXEqR03G7WvI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmElQ/dXt54EpqiPhNHnXh4cjkllHH2L5dmpsI/QGFEjAoy52G/em+Nw96cJw556UT+yeqCTurSZnBOvZNPNL2w10nuokMgvJECCnOf4hK5qSZn0UJsExDNXY/ihk4l5QYYQChX2wacrdAdB+i/hKv2IWO+zSrwlU/WTnCiC4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nktcvqBX; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-518954032b2so1361388e0c.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738594693; x=1739199493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7GX9V2E4IM1Fg9sH/39i37bB9jAfDbFXWQbkjZ3ATE=;
        b=nktcvqBX60t7ZWSuUX3TU9yBLHDWPy3AyeONuLb99D6SZYbbnrPpt8YSNE7tc4Hg4i
         oDKzyS9B+s39mr3gZ1RsYJAMRKd6KLXsPQkbuYiMBwTdmnfmtoMsTvCtYkwHvoL+n7Th
         u3Zhonwk1ADBdKTmnMytwimpu2FmG+GXTRWFlAV5S6fjETQm5nR/xbclkdaIaYplZrHt
         1GEfyS70DZx9Emfb2LWumCMxMkhbpnpwbBDZ0DcjB8oKJD5ki1d2+MIqMdtbq/ahwDxH
         dC/D73bBO6ue80tMguWaLsL+Fm5pz8b0pUaoNYAt0O4o9rnVTjLiezDVmRuV5DWq/Cmp
         gGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738594693; x=1739199493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7GX9V2E4IM1Fg9sH/39i37bB9jAfDbFXWQbkjZ3ATE=;
        b=fZyBHHPs7HRehdKcF2ffmtOnYtHTTVfzNzv5SAkVzTQXcaTsFmbYTgqpfrMPdutVGv
         aNU9eCdW63NdBiFhizcBvP/NFjPG07zHEuxJffLd4od7te+PLmD4vnsoH3TTy/lamUtv
         z7UVHS59QxlEnKDhYZ6bPCbVzXb7l25EPfVKCyrIFGS7CuQz6QyLBUBWqNES3+CeZg5T
         WsaWDkHg8egsW1Bu1R/7gVX/xS79r/yspi+0aYAS1boIbqqe405TJjP705ZIqcg2ZG/K
         CKfvWKpY4aPhbHUPwOYB0wjTBLU2UE/a+W7LnitOFg+gcRmjOSfqRfCnB1MbsHjPyDVJ
         MHgw==
X-Gm-Message-State: AOJu0YwSPIynReA88WrTjSWFE4dE14518q2O8tNY+2Auli0KyhpvCRUE
	CVSCuJzukNAg4oCYOtT1IUbfd4vZ6aPuBNWnA1roEWX3UmexzTG3FQFH0lcl3gFsQby6X0w4VKJ
	nIPiQglPwDaoG8Qi8IeVSFcdSK5w=
X-Gm-Gg: ASbGncvCv7IqFcoNHTi2RzLPlH0KLB3bRSdlxALoe6egZnqnUtcWkJ2uXKKoP9rKy9o
	Bn62GGei5K8g5kcU8fjSsUvO9nS+AGP/xkoC8t/LlW1B3rLVd2h+TuTKqVFslonTwBXo8yu2u
X-Google-Smtp-Source: AGHT+IHrhfU+8INIR0UyrozWs4h4PZxTknIEgOG5nR/o6ZleqmRY5a6E85sctsXNrw34G9GMtK51X/0gUOWtNDHhHt8=
X-Received: by 2002:a05:6122:130e:b0:51b:a11f:cbdb with SMTP id
 71dfb90a1353d-51e9e41df0cmr16306107e0c.4.1738594692914; Mon, 03 Feb 2025
 06:58:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com> <20250203085853.1361401-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20250203085853.1361401-4-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Feb 2025 14:57:47 +0000
X-Gm-Features: AWEUYZmOuFi4OpHa-IK4TmWEpRGaLAbo_BJSL5oieAOZ1yPtms0faRCRadGgC2g
Message-ID: <CA+V-a8th_JkYOJ-7_sjivbP5Vn+L51xe=Re8HpFy-51H+5i6-Q@mail.gmail.com>
Subject: Re: [RFC v5 03/15] media: Documentation: Reword split of sensor
 driver to two classes
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
> The sensor drivers do not configure the output size of the sensors but th=
e
> entire internal pipeline. Reflect this in the documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 9a1e8aa9fc77..bc55c861fb69 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -10,11 +10,13 @@ used to control the camera sensor drivers.
>
>  You may also find :ref:`media_writing_camera_sensor_drivers` useful.
>
> -Frame size
> -----------
> +Sensor internal pipeline configuration
> +--------------------------------------
>
> -There are two distinct ways to configure the frame size produced by came=
ra
> -sensors.
> +Camera sensors have an internal processing pipeline including cropping a=
nd
> +binning functionality. The sensor drivers belong to two distinct classes=
, freely
> +configurable and register list-based drivers, depending on how the drive=
r
> +configures this functionality.
>
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
> 2.39.5
>

