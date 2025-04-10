Return-Path: <linux-media+bounces-29919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A146A8435E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAF64C2EBD
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ECD2853ED;
	Thu, 10 Apr 2025 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pBYxLsAX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB5283691;
	Thu, 10 Apr 2025 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288593; cv=none; b=pTm7nMadPoDcZERMDdD384tdYM2JP9mHrNxKhloFBXOa90ENSCWVvZavyP4KtYFbKqmB1PBRQrgCeVlV40hlJFHCioWOCrqxMxktPkX4cYzlpmdKTmMw5hIjphKM+CaUpJ/H9Gv7qjlZGm16SXeSaqvEeV+w/4HyIFfDhpiNfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288593; c=relaxed/simple;
	bh=iOvQI6EwbSdrSHz2v4SF2Sz7AgGUQWBFbOMGYLPwJD4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GxOcDgKg9ve8m1/4urngROvRlL8lWHD99DPi06atPcdDiLCWRiAzzXBJ0LgGU5P/SbfpGkd7xJtaFscpj8+OudwZa1syKhdKWpBaaxbgj0sggMP2ZBOJHGTJD9Pvdfay0cJ3bVdky9QUrcrfnBl+WtDd9d02v15qkAS+o+PX8Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pBYxLsAX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744288588;
	bh=iOvQI6EwbSdrSHz2v4SF2Sz7AgGUQWBFbOMGYLPwJD4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pBYxLsAXqIXGPUL8Tu5XYtlI0ztS9+E+rorYyx6kk2oBGd2pfY7TX18Zm+P6bFY0O
	 5SupPcr8QzIChkXO0HAnJ6bBvwVCwa9CTcAO2cQjm6fAH/qRtQflPMxBy/RWy3JurX
	 Pzk00jGBvplmTR1yR9xAkw439iAQynvMwWhi48j0Vq/eYTdpeUQ3NTGtJOIppBMeHL
	 yBYvgLSprVDhTyUekJEQt5D1LAYsaZ0Igu2KW4kVLq5XriN0h16kLbjUwg22nDNWEO
	 gx9zBegrB4Oq7EvqWtB5lyJAkTlaCMhh2Mlxqp1LjBYYdW5Brax18kodCSpnb+dyYG
	 n7D0T12Xk/DYA==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A13B617E0C8D;
	Thu, 10 Apr 2025 14:36:27 +0200 (CEST)
Message-ID: <bf9a744df3aa34ea02237b10900431c18f87d7cc.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicono: Enable NV15 support for Rockchip
 VDPU981
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	kernel@collabora.com
Date: Thu, 10 Apr 2025 08:36:26 -0400
In-Reply-To: <7b70a71a.448.1961d1808e5.Coremail.andyshrk@163.com>
References: 
	<20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
	 <7b70a71a.448.1961d1808e5.Coremail.andyshrk@163.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey,

Le jeudi 10 avril 2025 à 08:27 +0800, Andy Yan a écrit :
> 
> Hi Nicolas，
>       Typo in subject？ s/verisilicono/verisilicon/      

I noticed few seconds after that email went, fixed locally.

thanks,
Nicolas

> 
> At 2025-04-10 03:30:09, "Nicolas Dufresne"
> <nicolas.dufresne@collabora.com> wrote:
> > This is a "customer" format, though on Rockchip RK3588 it has been
> > verified to be NV15 format, which matches what the GPU and display
> > handles has 10bit pixel formats.
> > 
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> > drivers/media/platform/verisilicon/hantro_v4l2.c           |  1 +
> > .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c      |  4
> > ++++
> > drivers/media/platform/verisilicon/rockchip_vpu_hw.c       | 14
> > ++++++++++++++
> > 3 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > index
> > 2bce940a58227c2bfef2bc3343992e4588ab36a4..7c3515cf7d64a090adfb8d8af
> > f368f9a617f8c8a 100644
> > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > @@ -77,6 +77,7 @@ int hantro_get_format_depth(u32 fourcc)
> > 	switch (fourcc) {
> > 	case V4L2_PIX_FMT_P010:
> > 	case V4L2_PIX_FMT_P010_4L4:
> > +	case V4L2_PIX_FMT_NV15:
> > 	case V4L2_PIX_FMT_NV15_4L4:
> > 		return 10;
> > 	default:
> > diff --git
> > a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > index
> > 69b5d9e12926fb408c08f8ba2139d05ba44389b7..e4703bb6be7c175a89c0b8868
> > cf2eafb84a872ed 100644
> > ---
> > a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > +++
> > b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > @@ -2202,6 +2202,10 @@ static void
> > rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
> > 	case V4L2_PIX_FMT_NV12:
> > 		hantro_reg_write(vpu, &av1_pp_out_format, 3);
> > 		break;
> > +	case V4L2_PIX_FMT_NV15:
> > +		/* this mapping is RK specific */
> > +		hantro_reg_write(vpu, &av1_pp_out_format, 10);
> > +		break;
> > 	default:
> > 		hantro_reg_write(vpu, &av1_pp_out_format, 0);
> > 	}
> > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> > b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> > index
> > 964122e7c355934cd80eb442219f6ba51bba8b71..f7c4a176167b40fe79ec5a675
> > 9dff8a77e849ae3 100644
> > --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> > +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> > @@ -92,6 +92,20 @@ static const struct hantro_fmt
> > rockchip_vpu981_postproc_fmts[] = {
> > 			.step_height = MB_DIM,
> > 		},
> > 	},
> > +	{
> > +		.fourcc = V4L2_PIX_FMT_NV15,
> > +		.codec_mode = HANTRO_MODE_NONE,
> > +		.match_depth = true,
> > +		.postprocessed = true,
> > +		.frmsize = {
> > +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> > +			.max_width = FMT_4K_WIDTH,
> > +			.step_width = MB_DIM,
> > +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> > +			.max_height = FMT_4K_HEIGHT,
> > +			.step_height = MB_DIM,
> > +		},
> > +	},
> > 	{
> > 		.fourcc = V4L2_PIX_FMT_P010,
> > 		.codec_mode = HANTRO_MODE_NONE,
> > 
> > ---
> > base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
> > change-id: 20250403-b4-hantro-nv15-support-07def4e7a537
> > 
> > Best regards,
> > -- 
> > Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 

-- 
Nicolas Dufresne
Principal Engineer at Collabora

