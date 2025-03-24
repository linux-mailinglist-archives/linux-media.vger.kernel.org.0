Return-Path: <linux-media+bounces-28619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F65A6D78F
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2392188E8CB
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA37025D915;
	Mon, 24 Mar 2025 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OCwbxnPb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775213C81B;
	Mon, 24 Mar 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808901; cv=none; b=X1vFDhb1GNhR9O21RHkp+CgR1nf2Q4cMye6DrMRCm3RDIzOQt4pomoVY0D8qtlIXCXsQO8kON6CrVcEe/R7qnNCy3dhm4iaJXf8kf4xowyMkjJZFdd68xqt5Mh8Wi6x4/RmcipUTiQPQSAZLlCBeVrdbdtMEUKYtTjsJwLCLevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808901; c=relaxed/simple;
	bh=5faaDxQ++N3YVHDh0h1jietj3gcwvYwVapcPuq18u4I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=c01Nc5eXWH1ZzQb0bMaQOuz9cKgB7Xx8zbR6zpz0Uw01mBCF9iDgv70qxSNzExugi4Kz6RRIhKj9CXD2UzPm6H/Hqmi1fPhbRlqyZI56xZhZmPBuPriL6gRLfpLfkITpIox0NLKsYxt+trTfSPTq/vW+1Z/2pwNX5iRTgJgj2xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OCwbxnPb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3590D455;
	Mon, 24 Mar 2025 10:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742808792;
	bh=5faaDxQ++N3YVHDh0h1jietj3gcwvYwVapcPuq18u4I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OCwbxnPb0UpoU+IjJK/9G1iwcQHV3yi93nK76EbOhZrBKsTIuCh1GQWE/9tdDtWs2
	 ORBvZAZXGgcjwe/k0Uy1v9MMcq3k4viCmETNejb43PIoz6iIgGmeQqq0vekYYNmwB4
	 S7S+LnFiaHwcwsUtvinroQrKm4MJC/k4GT+a79+8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250324-cal-streams-v6-2-28c93fb8f0c9@ideasonboard.com>
References: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com> <20250324-cal-streams-v6-2-28c93fb8f0c9@ideasonboard.com>
Subject: Re: [PATCH v6 2/3] media: ti: cal: Fix wrong goto on error path
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 24 Mar 2025 09:34:55 +0000
Message-ID: <174280889514.3289779.16133476560769261076@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Tomi Valkeinen (2025-03-24 09:29:18)
> If pm_runtime_resume_and_get() fails, we should unprepare the context,
> but currently we skip that as we goto to a later line.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

This looks reasonable and correct to me.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/platform/ti/cal/cal-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/pl=
atform/ti/cal/cal-video.c
> index 4eb77f46f030..29c38bf8d7a1 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -744,7 +744,7 @@ static int cal_start_streaming(struct vb2_queue *vq, =
unsigned int count)
> =20
>         ret =3D pm_runtime_resume_and_get(ctx->cal->dev);
>         if (ret < 0)
> -               goto error_pipeline;
> +               goto error_unprepare;
> =20
>         cal_ctx_set_dma_addr(ctx, addr);
>         cal_ctx_start(ctx);
> @@ -761,8 +761,8 @@ static int cal_start_streaming(struct vb2_queue *vq, =
unsigned int count)
>  error_stop:
>         cal_ctx_stop(ctx);
>         pm_runtime_put_sync(ctx->cal->dev);
> +error_unprepare:
>         cal_ctx_unprepare(ctx);
> -
>  error_pipeline:
>         video_device_pipeline_stop(&ctx->vdev);
>  error_release_buffers:
>=20
> --=20
> 2.43.0
>

