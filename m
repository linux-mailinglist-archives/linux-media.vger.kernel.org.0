Return-Path: <linux-media+bounces-22941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726B9E9A07
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F809188A8E0
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925CF1BEF9E;
	Mon,  9 Dec 2024 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PRMBkc6/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3521BEF8D;
	Mon,  9 Dec 2024 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756711; cv=none; b=tACNgZ6ES75fjqU8yc6CGig/ZRBSEu89l6ythxl33FlxPt1gUuKFdz+VpOMgo+q7TFR77DTqS6OTb/WAuCZC5G3dPo3CBaQGkHh7+Ez4A/jZa9HayRwzl51fkLuT8+GTBiJ0YqcG1/1tEoh3Ro9jz1l6IXv4+cVgrHrkdC5zGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756711; c=relaxed/simple;
	bh=DKQ87bO3su7dJqWjZvJgPKNbxjWk5OSD77eSkEr/FPw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=D2ESJTFuEwjhUU6/hZXnC54Rao+eX1SVqRgQxkprUJPE25j7etbhI2K+7lGzmiRFPuRI0nommZv7wl44WRUYVvNkdCvxMB9DjEV68UusvjfcnFZIMnpLmdDWxrC4C0cM2+6dsLl+869BDtwaBpBmlYi7P7c0V0LjsVfsK663+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PRMBkc6/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44C94502;
	Mon,  9 Dec 2024 16:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733756674;
	bh=DKQ87bO3su7dJqWjZvJgPKNbxjWk5OSD77eSkEr/FPw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PRMBkc6/8IPIUsz7pHkTBFqnZdM942c17RiI/DrnsJiSBWOAkQsyF25TJCCXTA4ml
	 ZBkkqSHsJapPejP6lDd9NUP4xUci5dk1cgXfh9LBxbR37m0MRlvGDmdgBfD1gqYwFQ
	 bCV61inYYRNASSSczmEfEDGHa5izoyixDXrpm3Lk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241209-media-ov9282-fix-v1-1-d06bb7546f18@raspberrypi.com>
References: <20241209-media-ov9282-fix-v1-1-d06bb7546f18@raspberrypi.com>
Subject: Re: [PATCH] media: i2c: ov9282: Correct the exposure offset
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Martina Krasteva <martinax.krasteva@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul J. Murphy <paul.j.murphy@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 09 Dec 2024 15:05:02 +0000
Message-ID: <173375670273.2486563.10697111608659253570@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Dave Stevenson (2024-12-09 14:55:45)
> The datasheet lists that "Maximum exposure time is frame
> length -25 row periods, where frame length is set by
> registers {0x380E, 0x380F}".
> However this driver had OV9282_EXPOSURE_OFFSET set to 12
> which allowed that restriction to be violated, and would
> result in very under-exposed images.
>=20
> Correct the offset.
>=20
> Fixes: 14ea315bbeb7 ("media: i2c: Add ov9282 camera sensor driver")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> This was picked up by one of our users noting that images were
> going dark for captures through libcamera. libcamera was resetting
> vblank and hblank to minimums for the capture, and that put us in
> the situation where it broke the datasheet requirement for
> exposure being at least 25 lines shorter than the frame length.
> ---
>  drivers/media/i2c/ov9282.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 9f52af6f047f..87e5d7ce5a47 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -40,7 +40,7 @@
>  /* Exposure control */
>  #define OV9282_REG_EXPOSURE    0x3500
>  #define OV9282_EXPOSURE_MIN    1
> -#define OV9282_EXPOSURE_OFFSET 12
> +#define OV9282_EXPOSURE_OFFSET 25

As I've looked this up in the datasheet:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  #define OV9282_EXPOSURE_STEP   1
>  #define OV9282_EXPOSURE_DEFAULT        0x0282
> =20
>=20
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241209-media-ov9282-fix-a1ec012f5272
>=20
> Best regards,
> --=20
> Dave Stevenson <dave.stevenson@raspberrypi.com>
>

