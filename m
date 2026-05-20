Return-Path: <linux-media+bounces-62307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFk5KPzGDWr93AUAu9opvQ
	(envelope-from <linux-media+bounces-62307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:36:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8558FB8B
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5392F3061FB0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C653EA963;
	Wed, 20 May 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aMqW3Aih"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20922571A9;
	Wed, 20 May 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287251; cv=none; b=JouRXdLyJSWWVY6nFLRgYhCp+/PxH7odqd5YOdEGYU/VS8IfxWg3rTcbN/Q8uJC8OMS/Hq2MlLPw0zw46ZdAmYQxuD2lXzBaI8Dd+CgPJIF8T21kgJlimoq19tX6dzHlqS2cobehCm0GF6ATpCnGhhOvBF37zcw4dKTOwo/hKCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287251; c=relaxed/simple;
	bh=5Ktw/QuPIJpK/6LN0MjLVeJWXpwOLdSZrPZfU6vpkfA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Zys482dkM58uBSQHwuXypigjk/ZS2jMJNuPFH8HOLTvAnXchSUyrW9BRxzScvv0pk45HQWu4dN/Oaz246Ory//7trqgTMygI153euC7HvXtBnscATvicTIh01qFaMWvKF0ezTDJ7Aun8+sCqxboiFFunC/nQ/iFAtISHhyBL58I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aMqW3Aih; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1DDD52;
	Wed, 20 May 2026 16:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779287232;
	bh=5Ktw/QuPIJpK/6LN0MjLVeJWXpwOLdSZrPZfU6vpkfA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aMqW3Aihv7RD1XKAdFrI0N4ZlYn7HIeZoVhhptDWKvgt/fvBOoHZ+esrLlzmweS9j
	 BTAGKjM0b+tJoCGM+/nUCxbUirFhm6h4UJ2eHg1FWM0XMH8E6p/19Q1IQNDuoQaLzc
	 CqDFBwjAZ/NFfZfpPpQ+KvZyqT1+R81HKw73/EtE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260520135705.661455-1-r-donadkar@ti.com>
References: <20260520135705.661455-1-r-donadkar@ti.com>
Subject: Re: [PATCH] media: ti: j721e-csi2rx: Minor cleanup of loop variables
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Wed, 20 May 2026 16:27:22 +0200
Message-ID: <177928724200.2341049.12855506486302800774@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62307-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ti.com:email]
X-Rspamd-Queue-Id: CDA8558FB8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Rishikesh Donadkar (2026-05-20 15:57:05)
> Replace open-coded `i--; for (; i >=3D 0; i--)` patterns with the
> idiomatic `while (i--)` in the error unwind paths of
> csi_async_notifier_complete() and ti_csi2rx_probe().
>=20
> Also scope loop variables directly in the for statement instead of
> declaring them at the top of the function in ti_csi2rx_suspend(),
> ti_csi2rx_resume() and ti_csi2rx_remove(). Change the type to
> unsigned int in the first two to match csi->num_ctx.
>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
> This patch depends on [1]
>=20
> [1]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.co=
m/
>=20
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c     | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 21388284cbaa..ef74e2da19b6 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -485,8 +485,7 @@ static int csi_async_notifier_complete(struct v4l2_as=
ync_notifier *notifier)
>         return 0;
> =20
>  unregister_dev:
> -       i--;
> -       for (; i >=3D 0; i--) {
> +       while (i--) {
>                 media_entity_remove_links(&csi->ctx[i].vdev.entity);
>                 video_unregister_device(&csi->ctx[i].vdev);
>         }
> @@ -1552,7 +1551,7 @@ static int ti_csi2rx_suspend(struct device *dev)
>         struct ti_csi2rx_ctx *ctx;
>         struct ti_csi2rx_dma *dma;
>         unsigned long flags =3D 0;
> -       int i, ret =3D 0;
> +       int ret =3D 0;
> =20
>         /* If device was not in use we can simply suspend */
>         if (pm_runtime_status_suspended(dev))
> @@ -1564,7 +1563,7 @@ static int ti_csi2rx_suspend(struct device *dev)
>          */
>         writel(0, csi->shim + SHIM_CNTL);
> =20
> -       for (i =3D 0; i < csi->num_ctx; i++) {
> +       for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
>                 ctx =3D &csi->ctx[i];
>                 dma =3D &ctx->dma;
> =20
> @@ -1604,7 +1603,7 @@ static int ti_csi2rx_resume(struct device *dev)
>         struct ti_csi2rx_buffer *buf;
>         unsigned long flags =3D 0;
>         unsigned int reg;
> -       int i, ret =3D 0;
> +       int ret =3D 0;
> =20
>         /* If device was not in use, we can simply wakeup */
>         if (pm_runtime_status_suspended(dev))
> @@ -1614,7 +1613,7 @@ static int ti_csi2rx_resume(struct device *dev)
>         reg =3D SHIM_CNTL_PIX_RST;
>         writel(reg, csi->shim + SHIM_CNTL);
> =20
> -       for (i =3D 0; i < csi->num_ctx; i++) {
> +       for (unsigned int i =3D 0; i < csi->num_ctx; i++) {
>                 ctx =3D &csi->ctx[i];
>                 dma =3D &ctx->dma;
>                 spin_lock_irqsave(&dma->lock, flags);
> @@ -1755,8 +1754,7 @@ static int ti_csi2rx_probe(struct platform_device *=
pdev)
>  err_notifier:
>         ti_csi2rx_cleanup_notifier(csi);
>  err_ctx:
> -       i--;
> -       for (; i >=3D 0; i--)
> +       while (i--)
>                 ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>         ti_csi2rx_cleanup_v4l2(csi);
>  err_dma_chan:
> @@ -1768,12 +1766,11 @@ static int ti_csi2rx_probe(struct platform_device=
 *pdev)
>  static void ti_csi2rx_remove(struct platform_device *pdev)
>  {
>         struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
> -       unsigned int i;
> =20
>         if (!pm_runtime_status_suspended(&pdev->dev))
>                 pm_runtime_set_suspended(&pdev->dev);
> =20
> -       for (i =3D 0; i < csi->num_ctx; i++)
> +       for (unsigned int i =3D 0; i < csi->num_ctx; i++)
>                 ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> =20
>         ti_csi2rx_cleanup_notifier(csi);
> --=20
> 2.34.1
>

