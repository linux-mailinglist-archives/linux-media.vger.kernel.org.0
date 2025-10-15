Return-Path: <linux-media+bounces-44588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E9BDEB96
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4667F19C4C3A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE331F0E56;
	Wed, 15 Oct 2025 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CyPIyU8n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C611DE2C9;
	Wed, 15 Oct 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534393; cv=none; b=NLlSh64QTBK6nFCBP82VUsCgwFiAz9226E+bayoIdRl1e2TAbS+xe54JsPBZWM4mYjDHVSqyLOVtUxy8tWfxFKgar5vftanUB1sYq7KiTH99RqNfq814qft9pMhV8OJiP4zdkzTb8G2VLaUCu+IEQ087OY7uhVy7nGYss0Qxxo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534393; c=relaxed/simple;
	bh=l2nwmGl7BBebMnfQO55Dp8CWbUh3ixJkZIiDyPJUHn0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Eqp1KyZZJ7g93EEw43ovrRtVtnzcg/ptfqHJ6+dngqZ0ms2H5TnQbaLExN4aKKljbQYCBtW936K5IUOlK8upe1MdTaTUOy2XnayPe/UmTZQc0hL/FOSrqy+3JWgFCLfcUaXz2B21d1GrCtvdRn9vsSU8+dO7lV5kNzILw0ZCHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CyPIyU8n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE0C7C72;
	Wed, 15 Oct 2025 15:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760534284;
	bh=l2nwmGl7BBebMnfQO55Dp8CWbUh3ixJkZIiDyPJUHn0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CyPIyU8nMmkq/jUo9T7OtEgrNSNldVrEpY1dUEGG1h2dmAcqeCZBbHHh5iagoKC73
	 GT5tklMld8PEzMgauhJ607sYctkX/tUhwyqkUfTaZCBxAt1vhcoSAT8TVPKMp06NYz
	 OIvDLeNpoVh9+ugxknUnWHGpib+yuulNn0yc83Go=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015075353.22625-18-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com> <20251015075353.22625-18-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 17/25] media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Wed, 15 Oct 2025 14:19:41 +0100
Message-ID: <176053438100.1246375.4312235042638260608@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Laurent Pinchart (2025-10-15 08:53:40)
> The v4l2_m2m_get_vq() function never returns NULL. The check was
> probably intended to catch invalid format types, but that's not needed
> as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
> on the format type, so the type can't be incorrect. Drop the unneeded
> return value check and, as the function has no side effect, the function
> call as well.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index e615c56083f1..3515601030ec 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -1409,9 +1409,6 @@ static int fdp1_g_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
>         struct fdp1_ctx *ctx =3D file_to_ctx(file);
>         struct fdp1_q_data *q_data;
> =20
> -       if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
> -               return -EINVAL;
> -
>         q_data =3D get_q_data(ctx, f->type);
>         f->fmt.pix_mp =3D q_data->format;
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>

