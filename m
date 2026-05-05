Return-Path: <linux-media+bounces-60329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFR0GMmK+Wnh9gIAu9opvQ
	(envelope-from <linux-media+bounces-60329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:14:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16F4C7206
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B61E5300EF4D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 06:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5F33C6A2B;
	Tue,  5 May 2026 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ULcAXbj0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841D39020C;
	Tue,  5 May 2026 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777961613; cv=none; b=Z6JBErE8j94sKfwNhvl7w5fLDpOEZVXMesFCUwEzJAperoJJaEHwT8ggLhEIgqDr8+imXELbKZL47AOrOGLl9oueNdgc4yPPjFj7dEDqQ3lk6H7VIGCymZgxcpW/oAPPZRa+Rt7hX/V22s/4jhs7Eoi/mZUFPEIK+5TZjvHcdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777961613; c=relaxed/simple;
	bh=CCDPDgwNYByKhDsCXxIc8HiqleMA9iipcFsHoNbNpuo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Kj5spyO21RU57o8sxNGOSd2oKmUM1sfwOcvz79fXMqhdJUaIjd23p+dhUzCD3zJ/UlOtN/00EfDOQNBRKENiMkideB9r7Hbx6zEQPUULbYuxM96Yppvlprw9Zzbn7S3JCXQsUusQ0Am7Uniom9N99McnqPfK5i+xqSPURCsmrSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ULcAXbj0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:62c1:6946:a08e:ca6c:9f75])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D8BFC71;
	Tue,  5 May 2026 08:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777961607;
	bh=CCDPDgwNYByKhDsCXxIc8HiqleMA9iipcFsHoNbNpuo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ULcAXbj0SbLu2s+QcIlLnSgENAa1DvdONoHu3+UWlZ/CCZJ6TbW04HBzoKfwTbqF2
	 mhErOHt12qeWmgB0vq1JxrWdx2u97RrzcCZrPxDaObMx+h1pQBSX1w1/LTbxaAkiH/
	 7BvFrsU5E/bMuJ3iGWUpQTKtUKGyFgBN37tz34zM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
References: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
Subject: Re: [PATCH] media: rcar-vin: Drop min_queued_buffers
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Date: Tue, 05 May 2026 11:43:24 +0530
Message-ID: <177796160466.34645.14043524548984371832@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Queue-Id: EE16F4C7206
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60329-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,ideasonboard.com,gmail.com,kernel.org,ragnatech.se];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Jacopo,

Quoting Jacopo Mondi (2026-05-04 18:13:14)
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>=20
> The R-Car VIN driver already uses a scratch buffer to sustain capture
> operations in absence of a frame buffer provided by userspace.
>=20
> There is no reason to require 4 buffers queued at all times for the
> driver to operate. Drop min_queued_buffers from the VIN driver to allow
> single-frame capture operations.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Thanks for the patch,

Reviewed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>

--
Jai

> ---
> This allows to capture a single frame when the R-Car VIN is used
> to feed the R-Car ISP on R-Car V4H.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers=
/media/platform/renesas/rcar-vin/rcar-dma.c
> index f9af9177e02f..73cda0e2d45a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1494,7 +1494,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
>         q->ops =3D &rvin_qops;
>         q->mem_ops =3D &vb2_dma_contig_memops;
>         q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -       q->min_queued_buffers =3D 4;
>         q->dev =3D vin->dev;
> =20
>         ret =3D vb2_queue_init(q);
>=20
> ---
> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
> change-id: 20260504-rcar-vin-min-queued-buffs-31891f226fe6
>=20
> Best regards,
> --=20
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>

