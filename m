Return-Path: <linux-media+bounces-43865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC79BC2634
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1CDA188D5D8
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370782D8783;
	Tue,  7 Oct 2025 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="HghqC0EM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFEC35966
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759861840; cv=none; b=T/faxBA4wnTPYQyKPnphubhzR6ToN11HzdUCmGpH/zhw1FhneiUvyz5WGW0ovUosIbFOBjKdXv/0mM0tGmsl2vrdCktgIJq5Li8IbZYjftYaAqwma2YzzxkIKap54od5G4ZkSo63cefI8jv8oM541CDVbkc7B0QkMy42w7tyFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759861840; c=relaxed/simple;
	bh=rgvjfcmnd+vOPKN4aV9RDXNfnNvBMNsSm36Mtj/m7yA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WmVXe6dkwUQ/dWsuGT32r/k4oCRs9u6a5L8slM/K7w+5gfB1B6AQDtz66zAxrAzz3HZja5jZlsuKpy4Ge17CmPESB19yWh9z5L6d/w4Hn6lxVkbKVY3reSOjNZOFrFI92xvLxahdQDYWChjEUX6xe2x1GJnLtHXOx0U+dXgJ8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=HghqC0EM; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso81132216d6.1
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759861838; x=1760466638; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb3tcA1W3FmGk+8TVe8vqOzjSK1aS/TXDE04iZAy/ws=;
        b=HghqC0EMKm2aR8xyYsMr3IPyHsVaY2M0kz4LaG8QZNuQ6hSugxGzqyEMOOvo1pF849
         yo8PfqPFwGjdsE7f61jMMvZJvNUu1KMGKXpkpkKdvOFftRnO8YSvq6Pl4XSMSQEXc9sy
         zDLEsxUnsf1/fDyFtLXmC+Oo8DSjS12zc/Pkxta+8Yu9kOylkKHKv82G2AiDWIn5mEIr
         vLFsISmuCkfRam+6AiN2sBuenIuHqEtoHd8LDg/L6pIoDuFz39qfzvRxCn5fWmb16oFF
         ZqZQnfleIooMY45/LFatbLZZj6kXLEFUALKFKZxIzEdOue6uwf9+6EJNkRpZri2WMPJC
         eAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861838; x=1760466638;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb3tcA1W3FmGk+8TVe8vqOzjSK1aS/TXDE04iZAy/ws=;
        b=rdky7GLNAfJnQOSWCLO980wU4WaOrcBqADWXK/TsXQS4x5D7bSfcyVWAYNMZKTNanE
         yTzGJEhJTsQQEbeirEZ7oBns+8hzDBPrpyv7fzdD1IRwojCvNUPtnfY4FJHZIUZ5iS16
         cU7xYTEKZRqaUrofd80bgwyNs8XQ83w9a+Kth2yVvaSxpQDgypVWsJlB/2muniz0+ogV
         b4GlHvuJkseoSJi3mU3NXnSMMWTWiFfIoby1FwYj61x5LUuLmeNSlxKz4+oRs/S553n0
         iWKjRfkQahpBMMpD5M33zFja/cYJN1n2YTw6Id/Xvw7n/ERvxfUiBEGOu/NEyS4YKSh0
         zUcg==
X-Gm-Message-State: AOJu0YyOvmVSp+ck3IiDkd41xHmv0/6NCWlIuC/96ZiQq1qnAT9+x1jq
	GOrNRa8hI/2p/3jhAAhr0h/6cwnMGurkwe5KXDZ4VUgdCRJ3fivgm3jmdrf9ifL9A08=
X-Gm-Gg: ASbGncucaz0rXtTPRJXu7syo/fWgXqBxGgidXxktAzUxcqJvzI5UiHHghM3+43gcUKV
	Li33wfgszRKfjZvt1VpPu28zpbu4K+SQi+vVsRUsTDLwKbBR3StDvQox+tSN3hfDBn1+P4QWwJg
	FzgttRrmM92+GbPBhJoEWtEuczcgjjxm9P9az1NNxbbAl4sgPCK1/RVKoucQWNXyDc3MIDYGaap
	I0bJGzb97FAW5JNNoSeZcCznPW5yYcDug40Djgyy5oDkW0WeUgrPSWixlDy1qXtA4YTTuqRekB8
	492labk16XrNfnFqMezwdgaE2cbcbx6WsqAVrTGeQIhjIKZ9zp3TsgKHP+mlhFHyFGVAIM6OSbR
	xvZxYWsGhtuCk38eV2WCbrpDgsfL8zURhDYNsCymWPeJd/dwRSXaZ
X-Google-Smtp-Source: AGHT+IG7oPC1tRwzaeHEd7zVyRiz9owBfrM5atH+5WnqTKGdGFmZwYm2VcF1mt295mM1N+XGahIowQ==
X-Received: by 2002:a05:6214:c65:b0:78d:ae5d:961e with SMTP id 6a1803df08f44-87b2efc2c83mr5392146d6.44.1759861837282;
        Tue, 07 Oct 2025 11:30:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bb53badbsm144330446d6.21.2025.10.07.11.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:30:36 -0700 (PDT)
Message-ID: <97879b9b078055fb130edfd126d253320ce616a1.camel@ndufresne.ca>
Subject: Re: [PATCH 11/16] media: rockchip: rga: add iommu restore function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:30:34 -0400
In-Reply-To: <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XMJL5X6bcbRTnPR2VvM0"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XMJL5X6bcbRTnPR2VvM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add an iommu restore function in preparation for the rga3 addition.
> This is necessary for a soft reset, as the rga3 will also reset
> it's iommu paging table to 0 and disable paging.
>=20
> The empty domain attach/detach to restore the iommu is copied
> from the rkvdec driver.

We did receive negative feedback after the fact on this one. We will likely
upset further the iommu subsystem maintainers with that. Have you considere=
d
adding a restore function in the rkiommu driver, similar to TI mmu and Benj=
amin
VSI MMU proposal ?

I have no precise objection, I know it works, but adding a restore function
seems also pretty straight forward.

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 24 ++++++++++++++++++++=
++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 7 +++++++
> =C2=A02 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index
> cd4da01645611e5fb51ed94e09b5f1463dad72c5..0a725841b0cfa41bbc5b861b8f5ceac=
2452f
> c2b5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/pm_runtime.h>
> @@ -560,6 +561,19 @@ static const struct video_device rga_videodev =3D {
> =C2=A0	.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> =C2=A0};
> =C2=A0
> +void rga_iommu_restore(struct rockchip_rga *rga)
> +{
> +	if (rga->empty_domain) {
> +		/*
> +		 * To rewrite mapping into the attached IOMMU core, attach a
> new empty domain that
> +		 * will program an empty table, then detach it to restore the
> default domain and
> +		 * all cached mappings.
> +		 */
> +		iommu_attach_device(rga->empty_domain, rga->dev);
> +		iommu_detach_device(rga->empty_domain, rga->dev);
> +	}
> +}
> +
> =C2=A0static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	struct reset_control *core_rst, *axi_rst, *ahb_rst;
> @@ -657,6 +671,13 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto err_put_clk;
> =C2=A0	}
> =C2=A0
> +	if (iommu_get_domain_for_dev(rga->dev)) {
> +		rga->empty_domain =3D iommu_paging_domain_alloc(rga->dev);
> +
> +		if (!rga->empty_domain)

Its an error pointer, see:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/6347dc=
7fb967521a77f9ff0774d25ef0cca4c6cd

> +			dev_warn(rga->dev, "cannot alloc new empty
> domain\n");
> +	}
> +
> =C2=A0	ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
> =C2=A0	if (ret)
> =C2=A0		goto err_put_clk;
> @@ -741,6 +762,9 @@ static void rga_remove(struct platform_device *pdev)
> =C2=A0	v4l2_device_unregister(&rga->v4l2_dev);
> =C2=A0
> =C2=A0	pm_runtime_disable(rga->dev);
> +
> +	if (rga->empty_domain)
> +		iommu_domain_free(rga->empty_domain);
> =C2=A0}
> =C2=A0
> =C2=A0static int __maybe_unused rga_runtime_suspend(struct device *dev)
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index
> fc4805ba4e8ef7fb311f780a198ba6ba4d3aff17..e19c4c82aca5ae2056f52d525138093=
fbbb8
> 1af8 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -75,6 +75,7 @@ struct rockchip_rga {
> =C2=A0	void __iomem *regs;
> =C2=A0	struct clk_bulk_data clks[3];
> =C2=A0	struct rockchip_rga_version version;
> +	struct iommu_domain *empty_domain;
> =C2=A0
> =C2=A0	/* vfd lock */
> =C2=A0	struct mutex mutex;
> @@ -114,6 +115,12 @@ static inline struct rga_vb_buffer *vb_to_rga(struct
> vb2_v4l2_buffer *vb)
> =C2=A0
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type
> type);
> =C2=A0
> +/*
> + * This should be called in an interrupt handler to make sure no memory
> + * is mapped through the IOMMU while the empty domain is attached.
> + */
> +void rga_iommu_restore(struct rockchip_rga *rga);
> +
> =C2=A0/* RGA Buffers Manage */
> =C2=A0extern const struct vb2_ops rga_qops;
> =C2=A0

--=-XMJL5X6bcbRTnPR2VvM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVcSgAKCRDZQZRRKWBy
9OYnAP9DZqU3/sor4ifbznDD8fkkIm921ew6ADeaBvy0V9AxfgEAwHVV4+jp7xPf
P3ZUAog4C977zT1IhEvYYMKGr4Gjpwg=
=aUgZ
-----END PGP SIGNATURE-----

--=-XMJL5X6bcbRTnPR2VvM0--

