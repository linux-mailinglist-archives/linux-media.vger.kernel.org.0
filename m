Return-Path: <linux-media+bounces-29031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358DA76142
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72DF27A2C31
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AA81D5AB7;
	Mon, 31 Mar 2025 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d7bTnKVH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B478E1537C8;
	Mon, 31 Mar 2025 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409164; cv=none; b=PH9W7BKIhJAjLl/JOxolSFf68tYmq/rSopXFVUKtuCVvISr7PY0vVs3hcOZCYOXt1wmKrXkIeeyQybwU0Do0L08tVd7zFCyj+lWYj0d1hxUIheBQk63N9BVFLJDkmhlMgDhF5QpCR9bjzD6FGnUFUMQjEadinsNx7mRJw7YNJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409164; c=relaxed/simple;
	bh=XU30lMr3ssAcpXWBaadoA5uwPz6VxDeYxIxMiAh8lyE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=K+23rO7I2qjGd417YGQKR4TWuIXEr7rdn7T3XQ6cQv5XSl6x8yS8nZ5TwN4Pb/lSJX8nyhGv74gJOQLHt2NR7nSTbV3luZajWe2ObaRx0ozFYCc/mNwUrLc5MJ25blKZAIhnCWUJ+2sszlEgixmSsHHXOgM9qmtMJdudnfsEsME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d7bTnKVH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0569250;
	Mon, 31 Mar 2025 10:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743409049;
	bh=XU30lMr3ssAcpXWBaadoA5uwPz6VxDeYxIxMiAh8lyE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d7bTnKVHpfzDuvhoizpgky8ehTjnz4fvl6WOky4g+Znq6xNImJDtoPxu65+IWO5Cy
	 ZwuDY8ZfcDmnSsLEV0vGQsjw6xFquLQ5WOzNckxjXDh4qBjrjXRpWmlq8zozvRi6yB
	 znLrwn2O7KI3zQLif8Ymypu7WNPjDkuH/oNhUOAQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250330091738.27052-1-biju.das.jz@bp.renesas.com>
References: <20250330091738.27052-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] media: renesas: vsp1: Use %p4cc printk modifier to print FourCC codes
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 31 Mar 2025 09:19:18 +0100
Message-ID: <174340915804.3687388.14905844552644308132@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Biju Das (2025-03-30 10:17:35)
> Replace '%08x->%p4cc' printk modifier to print FourCC codes for pixel
> formats.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drm.c
> index b5d1f238f7be..f8a575f6188a 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -593,8 +593,8 @@ static int vsp1_du_pipeline_set_rwpf_format(struct vs=
p1_device *vsp1,
> =20
>         fmtinfo =3D vsp1_get_format_info(vsp1, pixelformat);
>         if (!fmtinfo) {
> -               dev_dbg(vsp1->dev, "Unsupported pixel format %08x\n",
> -                       pixelformat);
> +               dev_dbg(vsp1->dev, "Unsupported pixel format %p4cc\n",
> +                       &pixelformat);
>                 return -EINVAL;
>         }
> =20
> @@ -849,11 +849,11 @@ int vsp1_du_atomic_update(struct device *dev, unsig=
ned int pipe_index,
>         }
> =20
>         dev_dbg(vsp1->dev,
> -               "%s: RPF%u: (%u,%u)/%ux%u -> (%u,%u)/%ux%u (%08x), pitch =
%u dma { %pad, %pad, %pad } zpos %u\n",
> +               "%s: RPF%u: (%u,%u)/%ux%u -> (%u,%u)/%ux%u (%p4cc), pitch=
 %u dma { %pad, %pad, %pad } zpos %u\n",
>                 __func__, rpf_index,
>                 cfg->src.left, cfg->src.top, cfg->src.width, cfg->src.hei=
ght,
>                 cfg->dst.left, cfg->dst.top, cfg->dst.width, cfg->dst.hei=
ght,
> -               cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],
> +               &cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],
>                 &cfg->mem[2], cfg->zpos);
> =20
>         /*
> --=20
> 2.43.0
>

