Return-Path: <linux-media+bounces-44053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC4BC7F0E
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 10:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2168A352923
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 08:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5DC2AD16;
	Thu,  9 Oct 2025 08:11:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A3242D9B
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997488; cv=none; b=jtkOmFKxiOHcJ2emM6Zp62/uqzkUDQF/3bdJi/e/4uk7RfS+QJgUEkAEj6lyS46NjAgbGEtgQuco7XgqHSS9k2MouwDN4s0i0Qvo3lJSOAGCWmUqSTmu22T5c+nDfitjCpW3hxmuy6jkUfvBJbso7v257asLFmi9W2okAAjrHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997488; c=relaxed/simple;
	bh=SN/9O+a3x+7qKZbHlEGNTnU6KNclfgGJa9fQ2BO39qI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BEidZFqgmjzsmLq1HFIsSeWaZQt7fbWqx6KTyfJp+eaykP9e1Orw578yx/3IjXneHFtt3aCdT2a9iiLiFkqcYxvSyTvFzLEwB2SVoPSPYT42g9zqoD4xJdIV9E2HUCcbn6S62xtA0t4WBg63Z2kArYpH5jWGgkDpqVGILHnNIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lk9-0000Rr-Ij; Thu, 09 Oct 2025 10:11:21 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lk9-002hZa-1E;
	Thu, 09 Oct 2025 10:11:21 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lk9-000000001QW-1KBD;
	Thu, 09 Oct 2025 10:11:21 +0200
Message-ID: <2cd8dedfdf6fa0d520034f31dd1b1bff2ae9bad4.camel@pengutronix.de>
Subject: Re: [PATCH 05/25] media: coda: Drop unneeded v4l2_m2m_get_vq() NULL
 check
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 09 Oct 2025 10:11:21 +0200
In-Reply-To: <20251008175052.19925-6-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
	 <20251008175052.19925-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Mi, 2025-10-08 at 20:50 +0300, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/chips-media/coda/coda-common.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-common.c
> index e6e3f5ec24f6..5451b01e0815 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -785,8 +785,6 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4=
l2_format *f,
>  	struct vb2_queue *vq;
> =20
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> =20
>  	q_data =3D get_q_data(ctx, f->type);
>  	if (!q_data)
> @@ -937,8 +935,6 @@ static int coda_s_fmt_vid_out(struct file *file, void=
 *priv,
>  	ctx->codec =3D codec;
> =20
>  	dst_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE=
);
> -	if (!dst_vq)
> -		return -EINVAL;
> =20
>  	/*
>  	 * Setting the capture queue format is not possible while the capture

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

