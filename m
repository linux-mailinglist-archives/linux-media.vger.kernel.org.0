Return-Path: <linux-media+bounces-39589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35238B2279F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 15:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E26F4E3B23
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5217822B8D5;
	Tue, 12 Aug 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oSvgX2of"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764261D6AA;
	Tue, 12 Aug 2025 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003623; cv=none; b=hSdA8QNApMuOHUMePdOGAmdo5kxC3fhajsOKHaYKDhLHK8R35WlssbRhSP5bFHHT7PEFvAQl6PmhWz+AErlQjDnZHx8ov9u1Y0ROaSG229S7hl250tvEca0eR/EpFvwTI/tjzJ58kOeoR5oPq+cbNOAvb6CAKpzUPIZ+ijJWAl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003623; c=relaxed/simple;
	bh=BPZhi1cYHWPs10d8aw+eUuAT4jQOgOOanuDWooHD66M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X4rfe18fLP/ThtsJ1wlqFg/1ydYHEsTd722qth5R0nMuuk4W2OmvTUF4DOojrDZYouc/dMeNK7K5sYZrlcO+VyvX0thYg7hK3Jdag3IqxNFp7RKFSiIqK+4VgD17TSLRME76rfdrxV8oXWYFj/V8hvVmeqR+w6o3QPOrcHI72P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oSvgX2of; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755003619;
	bh=BPZhi1cYHWPs10d8aw+eUuAT4jQOgOOanuDWooHD66M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oSvgX2of80L02E0fcdOtjkRdCDV4W2cJtF0VNyeDf7vjjydxLjB5DamTHdsrGAIT2
	 cy6fVuTM6Rh5ao6b3R8HQKvqZAT4t71qjg7sk4xB76Z0Wr5AvXbuutFT4TMO93mva1
	 nW+tgKKfU/5EVJobEPLS18jDbotTUzhEtTOimDI/3bfffrRUVZO72qClzwOZwHSqTf
	 yQ1AbYoT7OQHWwYpHOkh1gEP2Z/CCiSUbjvHfLyyRmrDPzVN6P1OJxrIzYWCOBIdxq
	 isrZ5ygEstVzItRUu8B4KssVP8vJtRjHTLv/1lz5Rqrr/1gFRv6C7AUkOIDG2topIQ
	 hv3ctCcBhWyog==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19A3217E04C0;
	Tue, 12 Aug 2025 15:00:18 +0200 (CEST)
Message-ID: <f2908b2d35671e70e6a8b295de623e3a3ffe2212.camel@collabora.com>
Subject: Re: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on
 RK3328
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Alex Bee
 <knaerzche@gmail.com>, Sebastian Fricke	 <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 09:00:15 -0400
In-Reply-To: <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-6-jonas@kwiboo.se>
	 <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
	 <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
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
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-JAuicq2EIvWHvsvtmtAs"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-JAuicq2EIvWHvsvtmtAs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 ao=C3=BBt 2025 =C3=A0 01:08 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> Missed some comments in my last mail.
>=20
> On 8/11/2025 11:25 PM, Nicolas Dufresne wrote:
> > Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=
=A9crit=C2=A0:
> > > From: Alex Bee <knaerzche@gmail.com>
> > >=20
> > > The RK3328 VDEC has a HW quirk that require QoS to be disabled when H=
EVC
> > > or VP9 is decoded, otherwise the decoded picture may become corrupted=
.
> > >=20
> > > Add a RK3328 variant with a quirk flag to disable QoS when before
> > > decoding is started.
> > >=20
> > > Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > > ---
> > > Changes in v2:
> > > - No change
> > > ---
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |=C2=A0 9 =
+++++++++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |=C2=A0 2 =
++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c=C2=A0 | 10 =
++++++++++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 12 ++++++++++++
> > > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> > > =C2=A05 files changed, 37 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > index 1994ea24f0be..f8bb8c4264f7 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> > > @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ct=
x)
> > > =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> > > =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> > > =C2=A0
> > > +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
> > > +		u32 reg;
> > > +
> > > +		reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> > > +		reg |=3D 0xFFFF;
> > > +		reg &=3D ~BIT(12);
> >=20
> > I wonder if there is a better way to express that, if not, a comment fo=
r
> > future
> > readers would be nice. If read it will, we keep the upper 16bit, and
> > replaced
> > the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not sp=
end
> > time
> > thinking if I walk by this code again.
>=20
> Vendor kernel use following comment to describe the purpose of this [1]:
>=20
> =C2=A0 HW defeat workaround: VP9 and H.265 power save optimization cause
> =C2=A0 decoding corruption, disable optimization here.
>=20
> From the TRM we can see following for rkvdec_swreg99_qos_ctrl:
>=20
> =C2=A0 27:26 sw_axi_wr_hurry_level
> =C2=A0=C2=A0=C2=A0 00: hurry off=20
> =C2=A0=C2=A0=C2=A0 01~11: hurry level=20
> =C2=A0 25:24 sw_axi_rd_hurry_level
> =C2=A0=C2=A0=C2=A0 00: hurry off=20
> =C2=A0=C2=A0=C2=A0 01~11: hurry level=20
> =C2=A0 23:16 sw_bus2mc_buffer_qos_level
> =C2=A0=C2=A0=C2=A0 range is: 0~255
> =C2=A0=C2=A0=C2=A0 the value is means that left space <=3D
> =C2=A0=C2=A0=C2=A0 sw_bus2mc_buffer_qos_level, it will give hurry
> =C2=A0 15:0 swreg_block_gating_e
>=20
> So yes this set swreg_block_gating_e to 0xEFFF. Possible this configure
> hw to not auto gate most internal clocks?
>=20
> Could add a comment and possible use something like following:
>=20
> =C2=A0 reg &=3D GENMASK(31, 16);
> =C2=A0 reg |=3D 0xEFFF;

Thanks for the information, I think this form is somewhat nicer indeed, and=
 a
little comment, its fine to say that the QOS bits are undocumented.

Nicolas

>=20
> [1]
> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drive=
rs/video/rockchip/mpp/mpp_rkvdec.c#L857-L867
>=20
> >=20
> > > +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> > > +	}
> > > +
> > > =C2=A0	/* Start decoding! */
> > > =C2=A0	reg =3D (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
> > > =C2=A0		0 : RKVDEC_WR_DDR_ALIGN_EN;
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > index 540c8bdf24e4..c627b6b6f53a 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> > > @@ -219,6 +219,8 @@
> > > =C2=A0#define RKVDEC_REG_H264_ERR_E				0x134
> > > =C2=A0#define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) &
> > > 0x3fffffff)
> > > =C2=A0
> > > +#define RKVDEC_REG_QOS_CTRL				0x18C
> > > +
> > > =C2=A0#define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
> > > =C2=A0#define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
> > > =C2=A0
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > index 0e7e16f20eeb..cadb9d592308 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> > > @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx=
)
> > > =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> > > =C2=A0
> > > =C2=A0	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> > > +
> > > +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
> > > +		u32 reg;
> > > +
> > > +		reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> > > +		reg |=3D 0xFFFF;
> > > +		reg &=3D ~BIT(12);
> > > +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> >=20
> > Can we deduplicate that ?
>=20
> Guess so, any suggestion on how to best do that?
>=20
> One possible way that comes to mind:
>=20
> =C2=A0 if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS)
> 	rkvdec_quirk_disable_qos(rkvdec);
>=20
> >=20
> > > +	}
> > > +
> > > =C2=A0	/* Start decoding! */
> > > =C2=A0	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> > > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_TIMEOUT_E | RKVDEC=
_BUF_EMPTY_E,
>=20
> [snip]

--=-JAuicq2EIvWHvsvtmtAs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJs63wAKCRBxUwItrAao
HAUsAKC1sBxNA1+yEIFCnD/e1Ljvs4W7zQCgkzXoEfYGmIbzQwoE/GL67jAV2K8=
=/EUA
-----END PGP SIGNATURE-----

--=-JAuicq2EIvWHvsvtmtAs--

