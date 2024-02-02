Return-Path: <linux-media+bounces-4593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 580B5846A91
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 09:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38741F22390
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9E418E28;
	Fri,  2 Feb 2024 08:16:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E618EB8
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706861815; cv=none; b=mO01UDfArZ880GMKv37cGCkZZOBAzOJn5POZbDVOXUB4l8B7620pw9kKXI32w3Fw08C7RTpgT8SKz+kG8IjEIPHjNUIElIrJ5RRCmE9qtEL2LqapnH+LuDiHiRGdYXS5g3LPiwK/uNgrihwMauFqxWxutQvd3EpuxhbKKHIZTOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706861815; c=relaxed/simple;
	bh=acTjTrZkkiS4snvzK9apWFC1Scr3rMfw68cXUdKumoU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSI/mjeWvb/2eodOPJtYO0jIKNeNqWp4nThsvBuxYDfVHFt7KAcy2sYTNvRWipv4pVku3PKbsbrZ0fhgsMC1tIO04wDUAenR6dQINzv7oJRXBBPz3NepKTpJ4mnCAsFmr66V/u3Zhfij0eixYfCkn7+x8A3LRgbosEQSsvKP55s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rVojD-0007Mt-01; Fri, 02 Feb 2024 09:16:51 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rVojC-0041fv-B4; Fri, 02 Feb 2024 09:16:50 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rVojC-0004GJ-0t;
	Fri, 02 Feb 2024 09:16:50 +0100
Message-ID: <3833ae6cd2a0b16d4a554c8a8eb3b2c3897c765f.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: csc/scaler: fix v4l2_ctrl_handler memory
 leak
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, Steve Longerbeam
	 <slongerbeam@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
Date: Fri, 02 Feb 2024 09:16:50 +0100
In-Reply-To: <20240131120033.858877-1-l.stach@pengutronix.de>
References: <20240131120033.858877-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mi, 2024-01-31 at 13:00 +0100, Lucas Stach wrote:
> Free the memory allocated in v4l2_ctrl_handler_init on release.
>=20
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/s=
taging/media/imx/imx-media-csc-scaler.c
> index 1fd39a2fca98..95cca281e8a3 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -803,6 +803,7 @@ static int ipu_csc_scaler_release(struct file *file)
> =20
>  	dev_dbg(priv->dev, "Releasing instance %p\n", ctx);
> =20
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdlr);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

