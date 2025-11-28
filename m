Return-Path: <linux-media+bounces-47859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E65C91B15
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 11:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 153B5343F42
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 10:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6AA30BF78;
	Fri, 28 Nov 2025 10:39:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390C430CD81
	for <linux-media@vger.kernel.org>; Fri, 28 Nov 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326351; cv=none; b=WBsvMwvO6DQ87DPBWHVzx8Dngfxry0IWuNHMGXWgHvOUDFBpTrgNKLegi/XGAmNnC6wkP9/E2IOVWILf6oabT8awaJuQAthnUfzNcIMAarMzN1tyDAaeJ6ndX9jt13cj9W9RIO0e0BdvjfwHCvJs2HdG9PDZJGPP20TRjYR6wj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326351; c=relaxed/simple;
	bh=iWj8WWGLS0E0LMdbrAzqDikWo91/mlcN7knxFbRn0vw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N1LABTBIuMIwsgEHDNaCDENpVrgzIx9tgk1+6u5HCvA1nfkvFTtnqLxEO5Ve5GRqpRulAsZngbbL0/3GOY5tNwzL8TWAKjjRgP1IfpX3OlrER+2IhcRMqlJpBdeRLGcj+j5GPhM4cogDQyReOMR1MQUTqb5JNIOeGUT6M3KSboQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1vOvsS-0007ne-EQ; Fri, 28 Nov 2025 11:39:00 +0100
Message-ID: <f68f4836b1ee1d1d1ca0c9754db1080e4e56425a.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] pmdomain: imx8m-blk-ctrl: Remove separate rst
 and clk mask for 8mq vpu
From: Lucas Stach <l.stach@pengutronix.de>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
 benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
 sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com,  linux-imx@nxp.com, Frank.li@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com,  imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Nov 2025 11:38:57 +0100
In-Reply-To: <20251128025117.535-1-ming.qian@oss.nxp.com>
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Am Freitag, dem 28.11.2025 um 10:51 +0800 schrieb
ming.qian@oss.nxp.com:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For i.MX8MQ platform, the ADB in the VPUMIX domain has no separate reset
> and clock enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>=20
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> v2
> - Update commit message
>=20
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 5c83e5599f1e..1f07ff041295 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -852,16 +852,12 @@ static const struct imx8m_blk_ctrl_domain_data imx8=
mq_vpu_blk_ctl_domain_data[]
>  		.clk_names =3D (const char *[]){ "g1", },
>  		.num_clks =3D 1,
>  		.gpc_name =3D "g1",
> -		.rst_mask =3D BIT(1),
> -		.clk_mask =3D BIT(1),

Change itself looks okay to me. Can you please leave a small comment
here and for the G2 domain to document why the clk and reset bits are
removed, so one doesn't need to dig into the git history when reading
the driver code?

Regards,
Lucas

>  	},
>  	[IMX8MQ_VPUBLK_PD_G2] =3D {
>  		.name =3D "vpublk-g2",
>  		.clk_names =3D (const char *[]){ "g2", },
>  		.num_clks =3D 1,
>  		.gpc_name =3D "g2",
> -		.rst_mask =3D BIT(0),
> -		.clk_mask =3D BIT(0),
>  	},
>  };
> =20


