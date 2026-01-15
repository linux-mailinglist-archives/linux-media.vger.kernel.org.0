Return-Path: <linux-media+bounces-50805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331AD25B2D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 17:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A32FA30B8E17
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 16:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094F53ACF12;
	Thu, 15 Jan 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rnhGALvN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95933557EF;
	Thu, 15 Jan 2026 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493704; cv=none; b=fzcBf5VIdtal2z0nbNreyTuVqXWiV9VZ/uNQQDfJKgp65RDEsP3rX8OxWrCYOSJfjRAjAAmvAy4SGrvZQpQG6rLAnvgBM7O8gelaUyP0NH2K+L7haBimqiFG2rwk90PwRo0Zm4zrkEd1IcwDHCY9nzMjLTOyvr/hABFkEemITzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493704; c=relaxed/simple;
	bh=0e+xANG7tvWWdI4qqitOge5wot2owRxJ+LL9YSdqIwM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HzqmwIfJbD9BUyTyO8yAiO72gp51opoLfd75gWClX/7fu2G7FIVK1rS8LT4tx2rgXPshS+3NTynSXg3FAsl/lYzAiFdJsaAh7IoBojX8TgT9GZ67xB3O8Jdl4jl+PlpPKk9iP98jPLwqx5ZrzEkZnwUU017cuu1EM3dWjQAKHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rnhGALvN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C1FB229;
	Thu, 15 Jan 2026 17:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768493673;
	bh=0e+xANG7tvWWdI4qqitOge5wot2owRxJ+LL9YSdqIwM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rnhGALvNHujbWcu2fqzKjG7AQVOih0W4Oe81tpB88+HXYLJectau0TxYwKsapzovG
	 MtNqRJ5iTYlGtihFKhpLyKcCZlNhl1i89EZ2mn5dyr5kNth63XJ6aMbkUztS5bZWgu
	 7KiDL3S+wJQzxlUgHscz7s0OrCIhXu83W3QibrPk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module unload
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Jan 2026 16:14:58 +0000
Message-ID: <176849369817.1090220.1584761595893232111@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Tomi Valkeinen (2026-01-15 09:22:35)
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> When unloading the module on gen 4, we hit a NULL pointer dereference.
> This is caused by the cleanup code calling vsp1_drm_cleanup() where it
> should be calling vsp1_vspx_cleanup().
>=20
> Fix this by checking the IP version and calling the drm or vspx function
> accordingly, the same way as the init code does.

Looks reasonable to me:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index 6c64657fc4f3..30df9b36642d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device=
 *vsp1)
>                 media_device_unregister(&vsp1->media_dev);
>         media_device_cleanup(&vsp1->media_dev);
> =20
> -       if (!vsp1->info->uapi)
> -               vsp1_drm_cleanup(vsp1);
> +       if (!vsp1->info->uapi) {
> +               if (vsp1->info->version =3D=3D VI6_IP_VERSION_MODEL_VSPX_=
GEN4)
> +                       vsp1_vspx_cleanup(vsp1);
> +               else
> +                       vsp1_drm_cleanup(vsp1);
> +       }
>  }
> =20
>  static int vsp1_create_entities(struct vsp1_device *vsp1)
>=20
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

