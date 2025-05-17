Return-Path: <linux-media+bounces-32694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E4ABAC81
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 22:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A69189C46C
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 20:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F89215173;
	Sat, 17 May 2025 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QJErmAz4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED15215079
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514601; cv=none; b=fX1uaFeW7+loQj9OMPE8GSHGdkeXXf6tPRd9A/C8ReICiZ6GJXxoEMTy2RsU1TRUKlcp7w+n+e4HvXjtlawrqXaujWKL3rK4KlIl8MxvE/utj29GICqHozUFDt+UF5qdWRoPpZP1ziYVTCv4agWME05TH4fn9ok2fUPHL8PrDrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514601; c=relaxed/simple;
	bh=K+qbeB59ymf2SerqPdYTYr5lj+seFhMsPB5JAWOF/08=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=B38NSXKqN4xQxfqZuKHlCtQo1dvU+Aev+fEa/vvohBrKNegOQxCfIimV1qPQ/hZjGE5RdLFOYFSj1N0KmDEbkBcf+kVpuMwg3Ru+Mp+XK/5CQcnq2GaYvZzLi7qmPsSqsaghkhM+n7PNJn3f0D7hp2Z+PfwhVegiZ9wraNIkmGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QJErmAz4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E2904AD;
	Sat, 17 May 2025 22:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747514580;
	bh=K+qbeB59ymf2SerqPdYTYr5lj+seFhMsPB5JAWOF/08=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QJErmAz4b12epzn23Z8NzY/ybV3swi6FP6cb92KM3kcw7U9cXSfnvZfzLmLh+QOb5
	 F3J+AfZj3la/Gz5GNVY6IbsjjdrP3YGyKRMGUOvsil4k5Q3zDq0L4IUq7qLvf4X6Ul
	 jM2uGnjCDLGkCBAeOFC0wKNfEvuskbbUtlOh4S64=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-3-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-3-hdegoede@redhat.com>
Subject: Re: [PATCH 02/23] media: atomisp: gc0310: Drop unused GC0310_FOCAL_LENGTH_NUM define
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 May 2025 21:43:16 +0100
Message-ID: <174751459660.281096.3910087151941157563@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2025-05-17 12:40:45)
> Drop the unused GC0310_FOCAL_LENGTH_NUM define, the focal-length
> is a property of the sensor-module, not of the raw sensor itself.
>=20

That's going to be an interesting one that we should identify for camera
tuning files in libcamera sometime too ...

But I agree it's not suitable here in the driver. Especially if it's
unused...


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index cc74e90a1457..f253b4b494f2 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -25,8 +25,6 @@
>  #define GC0310_FPS                             30
>  #define GC0310_SKIP_FRAMES                     3
> =20
> -#define GC0310_FOCAL_LENGTH_NUM                        278 /* 2.78mm */
> -
>  #define GC0310_ID                              0xa310
> =20
>  #define GC0310_RESET_RELATED                   0xFE
> --=20
> 2.49.0
>

