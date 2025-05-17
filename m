Return-Path: <linux-media+bounces-32695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D638ABAC82
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 22:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2462189C4BF
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 20:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C85D214A6C;
	Sat, 17 May 2025 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="igZRKIwM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF381B422A
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514738; cv=none; b=XoiBcpIgljuIRPX9iN68sT/VoePi1IEtiygDtWu9wnqFtI4ncw98MpX/PYYSY6CWVPl+HUhiYYI3CuR4CrFyTpsaMIRtSQMMgcSo6EivwfFUe8I1t4en2zmT1h+dhTnBjG/U5rk27pEN4UX5wi1nc9pXeV9CTAVwrO3jlj9Z6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514738; c=relaxed/simple;
	bh=MK0gmFfq+bir9xM+8NrO9AwOUvcsv6ENQlbZiTSve6I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nFKI3rXpo/G5ZXmhiHXlAMjH76mvWt2OLzcIPAM1icf6GNlQdv0nspdjAc/WEQBk7lKDQ772/nRs9FGiTP8T91PQX/MlmOBPKbB/Sj3o/xhbcarzT0pqHrfVAAYSVyw/hjfTmWwBjszzWSOfqDfmBwW5a4lOd3x0Sz7CVruP7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=igZRKIwM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 415F04AD;
	Sat, 17 May 2025 22:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747514717;
	bh=MK0gmFfq+bir9xM+8NrO9AwOUvcsv6ENQlbZiTSve6I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=igZRKIwM5+pdfgIqpPm4O0JlLgNxvETcVImuJVqPsQZlgc5HJ0y/65oZVGBWcxekh
	 hW9HXnneBgyBXyJ54NAxaIp2xnE8uCIi1Mvl6WnKy8DzMEyc+GkL+Jdta16BcGY9x+
	 4g4VEn82xyXzKEJd/Gziu81qffI8nA7q7/BO67io=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250517114106.43494-4-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-4-hdegoede@redhat.com>
Subject: Re: [PATCH 03/23] media: atomisp: gc0310: Modify vblank value to run at 30 fps
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 May 2025 21:45:32 +0100
Message-ID: <174751473241.281096.3129147080083675169@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2025-05-17 12:40:46)
> Currently the sensor is running 30.9 fps, increase vblank
> to have it actually run at 30.0 fps.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index f253b4b494f2..6b11f0ff6088 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -141,7 +141,7 @@ static const struct gc0310_reg gc0310_reset_register[=
] =3D {
>         { 0x05, 0x00 },
>         { 0x06, 0xb2 }, /* 0x0a //HB */
>         { 0x07, 0x00 },
> -       { 0x08, 0x0c }, /* 0x89 //VB */
> +       { 0x08, 0x1b }, /* 0x89 //VB */

I would wonder why we have 0x0a and 0x89 in the comments here ... but I
see that this later gets reworked to directly support setting
hblank/vblank controls so I'm not going to dwell on the specifics here.

I've no idea whether an RB or an Acked tag or something else is
appropriate here ;-) But I think this patch should be kept ;-)


>         { 0x09, 0x00 }, /* row start */
>         { 0x0a, 0x00 },
>         { 0x0b, 0x00 }, /* col start */
> --=20
> 2.49.0
>

