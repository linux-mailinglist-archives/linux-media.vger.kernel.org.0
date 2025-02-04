Return-Path: <linux-media+bounces-25655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B9A27F8D
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 00:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55083A1CEA
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 23:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB5F21CA1B;
	Tue,  4 Feb 2025 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OQi6XoMz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1286207DED;
	Tue,  4 Feb 2025 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711479; cv=none; b=VbqGKFhRPEGBaYyV+wXTl/kub4tckqOaTUNnGCT5BhM1TKAEFBSqyv3Y9IXRaAyZBCEZ9HrJAwe/Rtvypui1SYEC7ZcWrM77p78+D/4PFST2fz1v4qIz5PVg0Y6EqunNrvp6lvUT8BuNeO102CLIeY0QjzIijGs3Evmw7iPto+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711479; c=relaxed/simple;
	bh=fjiHAa6SOttoygeoinQOz6mVwY1i00lduDgAuodeAJ4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=N5t/1JO3+zpAT0Gzdq5Ejh+ZcPIc831ykwy9fFeDw3eBiVOZzfa1g4KeS0OIwvUrJubvdLSi8a2IaHFjDh1QKBMo5++CXvcIkKEdGxGqXCF/IPJa7AwwnNB6G3NHo18FBa2e4m2ppSZeolB29r02jUQPjSad4aYJ04ActSy0YqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OQi6XoMz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B9172BA;
	Wed,  5 Feb 2025 00:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738711403;
	bh=fjiHAa6SOttoygeoinQOz6mVwY1i00lduDgAuodeAJ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OQi6XoMzIR1L1tvwfWCmcB72/IZQpRpkoLT8tpuDAWWH9yQtJO7FgXC8BXlQOWydR
	 DhaUIx0jo7CidbdI/RgPJOZrNjLhZ1+OsiEkt5kWiGeTJ9uZEmc0EdBRWsw77Xa/2Q
	 u8Me0EFjcNFOjwc4gj9rc5OcKuBoRt8wa0AcfflM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121204400.4184438-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250121204400.4184438-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: i2c: adv748x: Fix test pattern selection mask
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Tue, 04 Feb 2025 23:24:32 +0000
Message-ID: <173871147295.888457.7732983538296758284@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Niklas S=C3=B6derlund (2025-01-21 20:44:00)
> The mask to select the test-pattern in register ADV748X_SDP_FRP is
> incorrect, it's the lower 3 bits which controls the pattern. The
> GENMASK() macro is used incorrectly and the generated mask is 0x0e
> instead of 0x07.
>=20
> The result is that not all test patterns are selectable, and that in
> some cases the wrong test pattern is activated. Fix this my correcting
> the GENMASK().
>=20
> Fixes: 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Eeep, this was a long time ago - but indeed, pulling up the datasheet I
can see:

"free_run_pat_sel[2:0], SDP Main Map, Address 0x14[2:0]."

No idea how this ended up being put in as 3,1 before but good find!

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv7=
48x/adv748x.h
> index 9bc0121d0eff..2c1db5968af8 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -320,7 +320,7 @@ struct adv748x_state {
> =20
>  /* Free run pattern select */
>  #define ADV748X_SDP_FRP                        0x14
> -#define ADV748X_SDP_FRP_MASK           GENMASK(3, 1)
> +#define ADV748X_SDP_FRP_MASK           GENMASK(2, 0)
> =20
>  /* Saturation */
>  #define ADV748X_SDP_SD_SAT_U           0xe3    /* user_map_rw_reg_e3 */
> --=20
> 2.48.1
>

