Return-Path: <linux-media+bounces-58347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAmjHey112lURwgAu9opvQ
	(envelope-from <linux-media+bounces-58347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:21:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D02993CBEA7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BD59300DF4E
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 14:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0AF3CCFA5;
	Thu,  9 Apr 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b/HIGzlK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C437D137;
	Thu,  9 Apr 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744357; cv=none; b=JY/GMIRgumUBQvjB49/ERZgxZfWbjiF5O08tAH7DXm0HjCTYeao3ZmPMeOu2dADfDocPiNMXUKOeYEwNL180aDM+duWv8OddTg1ZbrMTwjwtI0h3ezuPibwjXNW4X60XZL759mUk8lEOl4tQhPezBYPbmsmyCfK/etSs1xDvbOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744357; c=relaxed/simple;
	bh=V3M5/+eiv7Jh1DsCad4yjgGbVosE62VvCDePOQgvn2Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PLnoXdl912lwaYPOlIZTljnSBFASLmpnBFQlaghxy1sKyexD124rWWG37eNahj0odpgNMVR/4DKiTWJaBFW3EH3aSJN3+Hfj+27psBomBeM9+m+Ss93VxZtKRGRwjC+6btwnFn2X5Hr6Zppl2Hp3Uqzp4cJdhgrpbOM/ZcVjnUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b/HIGzlK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775744353;
	bh=V3M5/+eiv7Jh1DsCad4yjgGbVosE62VvCDePOQgvn2Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=b/HIGzlKrcfkgv8rRQQsJZfk38ZZtoJrU+KcIWQHLbTbt6jC3arUGATU6zOYzGmlR
	 wkXMCqAvWB00m3AqjE5YXQtHwSboV2SZwu08mABVbDy+XH6vcNkl4DsJJG+TYCSpGm
	 GP9ISEZlfOFhZQoBjN9AQSUsZ8I3+RnxvBmTjF/8p3aC37lJsuxLJcwD8SGnRbd2GS
	 DAAd2qJb3wym6wgSQ3qRHdJjEgozgmiO3/wzYPesrUA8kBsVO7sCGWWV4yhijzTWw6
	 GWVb95sXDO1tUS03CgyT2K3RxOl92ggg3Fp/6uMT4Dsdxvut6jiVzEuhhuSWnNS2qy
	 Qt+E2TXZxmcNA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD1B117E0C83;
	Thu,  9 Apr 2026 16:19:11 +0200 (CEST)
Message-ID: <517dc6e9de0e284b3dc22952d9479616e6c8ec62.camel@collabora.com>
Subject: Re: [PATCH 7/7] media: rkvdec: Add multicore IOMMU support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 09 Apr 2026 10:19:10 -0400
In-Reply-To: <20260409-rkvdec-multicore-v1-7-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
	 <20260409-rkvdec-multicore-v1-7-62b316abf0f7@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0Hey9sLhjTZTeirzEJYW"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58347-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D02993CBEA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-0Hey9sLhjTZTeirzEJYW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 09:50 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> As each core has its own IOMMU core, buffers must be mapped in each
> core's IOMMU so that any run() call can use any core without having to
> remap everything.
>=20
> To do that, we use rockchip iommu domain's iommu devices list.
> With that, one IOMMU domain can be mapped on multiple devices, meaning
> that each call to iommu_map() will flush the new mapping on all devices
> in the list.
>=20
> The IOMMU domain that will have all devices in its list is the first
> core's default domain.
>=20
> Another domain cannot be used because VB2 allocates buffers through the
> DMA engine, which uses iommu_get_dma_domain() to find the domain to map
> buffers through.
>=20
> The IOMMU restore function can still work as before, but needs to be more
> explicit in what domain to attach the device to.
> That is because detaching the empty domain will reattach the core's defau=
lt
> domain, which is wrong (except for the first "main" core).
>=20
> The RCB temporary buffers are allocated in a dedicated SRAM, each
> core has its own SRAM, so the mapping for each core's SRAM is added in th=
e
> global domain.
>=20
> Everything else is mapped through the first core's default domain, making
> the driver write the mappings on both IOMMU cores.

Just raising an issue with the patch ordering here. I'm worried in a git bi=
sect,
the driver will be broken until we apply this last patch. Can we make sure =
that
the driver bisects ? (or tell me if I'm wrong)

Nicolas

>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-rcb.c=C2=A0=C2=A0=C2=A0 |=
 21 ++++++-------
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-rcb.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++--
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0=C2=A0 |=
 35 +++++++++++++++++-----
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A04 files changed, 44 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> index 190fb7438e8c..977e37cf209b 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> @@ -57,7 +57,7 @@ bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ct=
x)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -void rkvdec_free_rcb(struct rkvdec_core *core)
> +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core=
)
> =C2=A0{
> =C2=A0	struct rkvdec_rcb_config *cfg =3D core->rcb_config;
> =C2=A0	unsigned long virt_addr;
> @@ -76,12 +76,12 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
> =C2=A0		case RKVDEC_ALLOC_SRAM:
> =C2=A0			virt_addr =3D (unsigned long)cfg->rcb_bufs[i].cpu;
> =C2=A0
> -			if (core->iommu_domain)
> -				iommu_unmap(core->iommu_domain, virt_addr, rcb_size);
> +			if (rkvdec->iommu_global_domain)
> +				iommu_unmap(rkvdec->iommu_global_domain, virt_addr, rcb_size);
> =C2=A0			gen_pool_free(core->sram_pool, virt_addr, rcb_size);
> =C2=A0			break;
> =C2=A0		case RKVDEC_ALLOC_DMA:
> -			dma_free_coherent(core->dev,
> +			dma_free_coherent(rkvdec->main_core->dev,
> =C2=A0					=C2=A0 rcb_size,
> =C2=A0					=C2=A0 cfg->rcb_bufs[i].cpu,
> =C2=A0					=C2=A0 cfg->rcb_bufs[i].dma);
> @@ -97,7 +97,8 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
> =C2=A0	core->rcb_config =3D NULL;
> =C2=A0}
> =C2=A0
> -int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
> +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *c=
ore,
> +			u32 width, u32 height,
> =C2=A0			const struct rcb_size_info *size_info,
> =C2=A0			size_t rcb_count)
> =C2=A0{
> @@ -132,7 +133,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32=
 width, u32 height,
> =C2=A0
> =C2=A0		/* Try allocating an SRAM buffer */
> =C2=A0		if (core->sram_pool) {
> -			if (core->iommu_domain)
> +			if (rkvdec->iommu_global_domain)
> =C2=A0				rcb_size =3D ALIGN(rcb_size, SZ_4K);
> =C2=A0
> =C2=A0			cpu =3D gen_pool_dma_zalloc_align(core->sram_pool,
> @@ -142,11 +143,11 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u=
32 width, u32 height,
> =C2=A0		}
> =C2=A0
> =C2=A0		/* If an IOMMU is used, map the SRAM address through it */
> -		if (cpu && core->iommu_domain) {
> +		if (cpu && rkvdec->iommu_global_domain) {
> =C2=A0			unsigned long virt_addr =3D (unsigned long)cpu;
> =C2=A0			phys_addr_t phys_addr =3D dma;
> =C2=A0
> -			ret =3D iommu_map(core->iommu_domain, virt_addr, phys_addr,
> +			ret =3D iommu_map(rkvdec->iommu_global_domain, virt_addr, phys_addr,
> =C2=A0					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
> =C2=A0			if (ret) {
> =C2=A0				gen_pool_free(core->sram_pool,
> @@ -166,7 +167,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32=
 width, u32 height,
> =C2=A0ram_fallback:
> =C2=A0		/* Fallback to RAM */
> =C2=A0		if (!cpu) {
> -			cpu =3D dma_alloc_coherent(core->dev,
> +			cpu =3D dma_alloc_coherent(rkvdec->main_core->dev,
> =C2=A0						 rcb_size,
> =C2=A0						 &dma,
> =C2=A0						 GFP_KERNEL);
> @@ -189,7 +190,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32=
 width, u32 height,
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_alloc:
> -	rkvdec_free_rcb(core);
> +	rkvdec_free_rcb(rkvdec, core);
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> index a12af9b7dc2b..d1149afe7fda 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> @@ -8,6 +8,7 @@
> =C2=A0
> =C2=A0#include <linux/types.h>
> =C2=A0
> +struct rkvdec_dev;
> =C2=A0struct rkvdec_ctx;
> =C2=A0struct rkvdec_core;
> =C2=A0
> @@ -21,11 +22,12 @@ struct rcb_size_info {
> =C2=A0	enum rcb_axis axis;
> =C2=A0};
> =C2=A0
> -int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
> +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *c=
ore,
> +			u32 width, u32 height,
> =C2=A0			const struct rcb_size_info *size_info,
> =C2=A0			size_t rcb_count);
> =C2=A0dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
> =C2=A0size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
> =C2=A0int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
> =C2=A0bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
> -void rkvdec_free_rcb(struct rkvdec_core *core);
> +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core=
);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index c2818f1575ef..2930e9b64906 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1204,9 +1204,9 @@ static void rkvdec_device_run(void *priv)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!rkvdec_rcb_buf_validate_size(ctx)) {
> -		rkvdec_free_rcb(ctx->core);
> +		rkvdec_free_rcb(ctx->dev, ctx->core);
> =C2=A0
> -		ret =3D rkvdec_allocate_rcb(ctx->core,
> +		ret =3D rkvdec_allocate_rcb(ctx->dev, ctx->core,
> =C2=A0					=C2=A0 ctx->decoded_fmt.fmt.pix_mp.width,
> =C2=A0					=C2=A0 ctx->decoded_fmt.fmt.pix_mp.height,
> =C2=A0					=C2=A0 ctx->dev->variant->rcb_sizes,
> @@ -1486,6 +1486,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *=
rkvdec)
> =C2=A0
> =C2=A0static void rkvdec_iommu_restore(struct rkvdec_core *core)
> =C2=A0{
> +	int ret;
> =C2=A0	if (core->empty_domain) {
> =C2=A0		/*
> =C2=A0		 * To rewrite mapping into the attached IOMMU core, attach a new =
empty domain that
> @@ -1494,8 +1495,14 @@ static void rkvdec_iommu_restore(struct rkvdec_cor=
e *core)
> =C2=A0		 * This is safely done in this interrupt handler to make sure no =
memory get mapped
> =C2=A0		 * through the IOMMU while the empty domain is attached.
> =C2=A0		 */
> -		iommu_attach_device(core->empty_domain, core->dev);
> +		iommu_detach_device(core->curr_ctx->dev->iommu_global_domain, core->de=
v);
> +		ret =3D iommu_attach_device(core->empty_domain, core->dev);
> +		if (ret)
> +			dev_warn(core->dev, "Cannot attach empty domain: %d\n", ret);
> =C2=A0		iommu_detach_device(core->empty_domain, core->dev);
> +		ret =3D iommu_attach_device(core->curr_ctx->dev->iommu_global_domain, =
core->dev);
> +		if (ret)
> +			dev_warn(core->dev, "Cannot attach global domain: %d\n", ret);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1858,6 +1865,8 @@ static int rkvdec_probe(struct platform_device *pde=
v)
> =C2=A0
> =C2=A0	core =3D &rkvdec->cores[rkvdec->core_count++];
> =C2=A0
> +	core->id =3D rkvdec->core_count - 1;
> +
> =C2=A0	platform_set_drvdata(pdev, rkvdec);
> =C2=A0	core->dev =3D &pdev->dev;
> =C2=A0	INIT_DELAYED_WORK(&core->watchdog_work, rkvdec_watchdog_func);
> @@ -1883,12 +1892,24 @@ static int rkvdec_probe(struct platform_device *p=
dev)
> =C2=A0			return PTR_ERR(core->link);
> =C2=A0	}
> =C2=A0
> -	core->iommu_domain =3D iommu_get_domain_for_dev(&pdev->dev);
> -	if (core->iommu_domain) {
> +	if (iommu_get_domain_for_dev(&pdev->dev)) {
> =C2=A0		core->empty_domain =3D iommu_paging_domain_alloc(core->dev);
> =C2=A0
> -		if (!core->empty_domain)
> +		if (IS_ERR(core->empty_domain))
> =C2=A0			dev_warn(core->dev, "cannot alloc new empty domain\n");
> +
> +		if (!rkvdec->iommu_global_domain) {
> +			rkvdec->iommu_global_domain =3D iommu_get_domain_for_dev(core->dev);
> +
> +			if (IS_ERR(rkvdec->iommu_global_domain)) {
> +				rkvdec->iommu_global_domain =3D NULL;
> +				dev_warn_once(core->dev, "cannot alloc new global domain\n");
> +			}
> +		}
> +
> +		ret =3D iommu_attach_device(rkvdec->iommu_global_domain, core->dev);
> +		if (ret)
> +			dev_warn(core->dev, "cannot attach global domain to core %d\n", core-=
>id);
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> @@ -1961,7 +1982,7 @@ static void rkvdec_remove(struct platform_device *p=
dev)
> =C2=A0		if (rkvdec->cores[i].empty_domain)
> =C2=A0			iommu_domain_free(rkvdec->cores[i].empty_domain);
> =C2=A0
> -		rkvdec_free_rcb(&rkvdec->cores[i]);
> +		rkvdec_free_rcb(rkvdec, &rkvdec->cores[i]);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 4f042a367dc0..ccd766b220c7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -135,7 +135,6 @@ struct rkvdec_core {
> =C2=A0	void __iomem *link;
> =C2=A0	struct delayed_work watchdog_work;
> =C2=A0	struct gen_pool *sram_pool;
> -	struct iommu_domain *iommu_domain;
> =C2=A0	struct iommu_domain *empty_domain;
> =C2=A0	struct rkvdec_rcb_config *rcb_config;
> =C2=A0	struct rkvdec_ctx *curr_ctx;
> @@ -155,6 +154,7 @@ struct rkvdec_dev {
> =C2=A0	unsigned int available_core_count;
> =C2=A0	spinlock_t cores_lock; /* serializes core list access */
> =C2=A0	struct rkvdec_core *main_core;
> +	struct iommu_domain *iommu_global_domain;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_ctx {

--=-0Hey9sLhjTZTeirzEJYW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCade1XgAKCRDZQZRRKWBy
9DnKAQDJtAASe6SiickkeAzlO+XdvrxlSxhsCWnQxvtuFM97rwD+LI+0vIjaN001
xcPK2Z7PRkSlDfAVJ24WRD4hWKGziwE=
=fi3S
-----END PGP SIGNATURE-----

--=-0Hey9sLhjTZTeirzEJYW--

