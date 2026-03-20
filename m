Return-Path: <linux-media+bounces-56555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALzIEXuGvWnQ+gIAu9opvQ
	(envelope-from <linux-media+bounces-56555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:40:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2742DECD5
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04CB43223D38
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683C43D4125;
	Fri, 20 Mar 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ibzEPci8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DB3D410C
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027954; cv=none; b=uSzhLcYDmqS3EkxWasLKjeysUJL0BPG/kXxaSpwsymJTyrD9R164qQ5x3xirWPkuaertr3bXrPc6JObzyDOJcCnzeUQZXwkqIJO9yCfhjCbL1VkULNpGIATQLVDzooc9AlX/l9vh+fypFEdA3e5dV/l7NCl4qaDI23/Bfq16haU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027954; c=relaxed/simple;
	bh=V9NxvdB+VLdoVy2Yzcyr3TgegtuSzfZzX1thdDemarM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkHg67fUjJws/O4TJ2LFj+ht8tMbmOaDOd48YxR7HdI3212TrEGn622+lK1LKlWccIBi5dVJpoUiLjFRq16Fr4XI5yH01YbOn+okRKbemEXvLgvRBiobqGrJYR0Q3K4xWbo5Xgn79sdQix7u3dsS09P+v8/y4j5th3m3dLVMpsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ibzEPci8; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd767d2d70so190566185a.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774027951; x=1774632751; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4mE8NlS736LAnmHsA7HRF+Ujb5voPxn/yIC8kZohqvE=;
        b=ibzEPci8ZYh0ZahmrIendjXWY1vTtTffghX0BvF5JF7VkQLHGhPVWvabREoxTZrBy/
         6BE4rI0PH02kZodiz32MH3Nq2DTsl8FlNdZxuDkQrjEZ9nrYlu+GXXl/GeHTNhX8AD+V
         ClRFe0HKEqNen3bzA8TLmFgkb783TDvDlHj3cDcVoJ6DWN436k9HQWxIxZy+5MwiEjKK
         BwGEmp8P/2qHDyxAta2nq1V/oMN0geKVGtwYXVvwSH+AsmgnedSMGP/1smNXYf7xknv0
         GYzr5N7gJVB1shyuw6I8FA1KU4+8iYU3enPnsj9Pqt9mewiPshyEbxQaQIQrpT1ctgVE
         KFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027951; x=1774632751;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mE8NlS736LAnmHsA7HRF+Ujb5voPxn/yIC8kZohqvE=;
        b=H0i915OquyZ3jg4pLSn0sgeu3ADKxa8g91Tt0je+5Q4mM9KiVRzD9HMI0SANX++Sxm
         6pn8g2JRVm/FQrSOqr6MCRTHh1vs0wS5C4PM2WfdYrp8UfRqIT0tj+Du9wP/mvoilnpk
         RerUXnIK0QkBR4BXOKxKcafjbgVOZRU1hAPRU6h5p0ROapgvTNwlMDvRPJ+DqkEWaJYn
         RTzwLN5BsnoPoSNhmMHu90GyCKfBwVSOOJJzljMvYtznqAYypNGTB616LhM4osEfv86S
         oDtWzg+/x3dHE2AuEiG8IQcydustaMr3RtzF9JZ6TsddLpv51FMDBhFcaufxLTFWWOfb
         eBhQ==
X-Gm-Message-State: AOJu0Ywar0PKRn741yWtdimszHOj/RfN+Y49wM+wVlHkG0M4NY9FNAXl
	Ii0MxNgcqAW6I41FQ70+rpm+eibxvmtk6nIU/acKVKAvh+O8rOBGjkhMlprRtxGtvU0=
X-Gm-Gg: ATEYQzwHcbuZ/ryRK6qBJDOp/09cbM8KiT0l6BciKhV7/lRL01nkGOIEamwgInW+2aX
	q1IYKzsZXtNnRDrjMjZpZYwPk9b8IOaP4rpcsxYo2A+SinRI4R9SaoI7x4o/IZ1W7mE/OFPLnTR
	HiLjtC+j7kgvKkvieR8qHFy+q3gjMEX+l0sPVXG38TF/To4KWCMAAE5RF7jWUGLPHxZJ+5y3cVk
	U6cLCvUM/ZNMT86a9M9bHH7EVGjea2h4uPs9WTo/SZhH+oaqnSRB7ESRFU/+gi7WB2BnN8Xec3d
	Yvdn9FJfu9ChI9dC4k0h5QSB4NS39rf6bUXf8HfXsdGXWsKY2XWfoEYwNedTfT0hb94jiGOFw/g
	2qkYr11kVygIM5IgMio72mFEpkpmbsrjLYNNLoh7LKGmPmI7BB/jk2g1trk/koqBgi8w7GEgWEl
	nw5PzL/H0m92Jj+bvqx4LJpM/70SXw
X-Received: by 2002:a05:620a:410c:b0:8cd:b2e9:7f6f with SMTP id af79cd13be357-8cfc7e9ac06mr548041285a.33.1774027951312;
        Fri, 20 Mar 2026 10:32:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bab92sm197788685a.34.2026.03.20.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:32:30 -0700 (PDT)
Message-ID: <16c4272b4e98834b849a608b42d97376088b1e38.camel@ndufresne.ca>
Subject: Re: [PATCH v3 06/27] media: rockchip: rga: use clk_bulk api
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
Date: Fri, 20 Mar 2026 13:32:27 -0400
In-Reply-To: <20260127-spu-rga3-v3-6-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-6-77b273067beb@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-f4gZIQHtUJQiIuCqlS+k"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56555-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim,ndufresne.ca:mid,collabora.com:email]
X-Rspamd-Queue-Id: 9E2742DECD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-f4gZIQHtUJQiIuCqlS+k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Use the clk_bulk API to avoid code duplication for each of the three
> clocks.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 65 ++++----------------=
-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 6 +--
> =C2=A02 files changed, 11 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43f6a8d993811..338c7796490bc 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -698,48 +698,10 @@ static const struct video_device rga_videodev =3D {
> =C2=A0	.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> =C2=A0};
> =C2=A0
> -static int rga_enable_clocks(struct rockchip_rga *rga)
> -{
> -	int ret;
> -
> -	ret =3D clk_prepare_enable(rga->sclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga sclk: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D clk_prepare_enable(rga->aclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga aclk: %d\n", ret);
> -		goto err_disable_sclk;
> -	}
> -
> -	ret =3D clk_prepare_enable(rga->hclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga hclk: %d\n", ret);
> -		goto err_disable_aclk;
> -	}
> -
> -	return 0;
> -
> -err_disable_aclk:
> -	clk_disable_unprepare(rga->aclk);
> -err_disable_sclk:
> -	clk_disable_unprepare(rga->sclk);
> -
> -	return ret;
> -}
> -
> -static void rga_disable_clocks(struct rockchip_rga *rga)
> -{
> -	clk_disable_unprepare(rga->sclk);
> -	clk_disable_unprepare(rga->hclk);
> -	clk_disable_unprepare(rga->aclk);
> -}
> -
> =C2=A0static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	struct reset_control *core_rst, *axi_rst, *ahb_rst;
> +	int ret;
> =C2=A0
> =C2=A0	core_rst =3D devm_reset_control_get(rga->dev, "core");
> =C2=A0	if (IS_ERR(core_rst)) {
> @@ -771,23 +733,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	udelay(1);
> =C2=A0	reset_control_deassert(ahb_rst);
> =C2=A0
> -	rga->sclk =3D devm_clk_get(rga->dev, "sclk");
> -	if (IS_ERR(rga->sclk)) {
> -		dev_err(rga->dev, "failed to get sclk clock\n");
> -		return PTR_ERR(rga->sclk);
> -	}
> -
> -	rga->aclk =3D devm_clk_get(rga->dev, "aclk");
> -	if (IS_ERR(rga->aclk)) {
> -		dev_err(rga->dev, "failed to get aclk clock\n");
> -		return PTR_ERR(rga->aclk);
> -	}
> -
> -	rga->hclk =3D devm_clk_get(rga->dev, "hclk");
> -	if (IS_ERR(rga->hclk)) {
> -		dev_err(rga->dev, "failed to get hclk clock\n");
> -		return PTR_ERR(rga->hclk);
> +	ret =3D devm_clk_bulk_get_all(rga->dev, &rga->clks);
> +	if (ret < 0) {
> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
> =C2=A0	}
> +	rga->num_clks =3D ret;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -935,7 +886,7 @@ static int __maybe_unused rga_runtime_suspend(struct =
device *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	rga_disable_clocks(rga);
> +	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -944,7 +895,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	return rga_enable_clocks(rga);
> +	return clk_bulk_prepare_enable(rga->num_clks, rga->clks);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct dev_pm_ops rga_pm =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 72a28b120fabf..2db10acecb405 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef __RGA_H__
> =C2=A0#define __RGA_H__
> =C2=A0
> +#include <linux/clk.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/v4l2-ctrls.h>
> @@ -81,9 +82,8 @@ struct rockchip_rga {
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *grf;
> =C2=A0	void __iomem *regs;
> -	struct clk *sclk;
> -	struct clk *aclk;
> -	struct clk *hclk;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> =C2=A0	struct rockchip_rga_version version;
> =C2=A0
> =C2=A0	/* vfd lock */

--=-f4gZIQHtUJQiIuCqlS+k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2ErAAKCRDZQZRRKWBy
9GE9AQCgBUj875ITC+Fh9R3nimzg6ES5s9aFNWES+vnYmz1/SAEAvf9VeCAR7znW
NKKwZUUf9wwcdkI2fRNjY/aPz3jvRQA=
=DP+6
-----END PGP SIGNATURE-----

--=-f4gZIQHtUJQiIuCqlS+k--

