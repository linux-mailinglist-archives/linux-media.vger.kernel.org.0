Return-Path: <linux-media+bounces-35206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB815ADF7A3
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 22:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B6B3ACA17
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 20:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDAB21C195;
	Wed, 18 Jun 2025 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lFY/89z1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751761E49F;
	Wed, 18 Jun 2025 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278227; cv=none; b=bfFRbyWeNC6Vp9xrqyx74xPYbUVsw9R5v389SisjkBlo/+xNvPdIrjyykrzlcRjnocTsB4JD5uxC3GwGqbjapzRxnv8DxUvVcIkSsbZjH5Tn2ZN6zrAHJYy5RxDe1u3DkTgOZq6mr/OIkgfH81+JJTjAE4ItitTqv8QLczA7aqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278227; c=relaxed/simple;
	bh=vIiq2oy7T4NhYtmY/Jz8Ui/8x6uXTYCdEGqAp/fIoCo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QetBXSkx18IXozyc1X88LkLmP416dpZK544UfZh0Xy9I3N+AC0Aixg/jmOXhWDJ0shb0/47BJgbkfjrcEtCvMEH2tx95BsZvOYzmCzZIyPOcq+RySK6vhshCxhJGx6vf5BC5F0xzba8MQYQwyaieecNpEPt3Z/V+nL9Feqvsg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lFY/89z1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DF70F06;
	Wed, 18 Jun 2025 22:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750278210;
	bh=vIiq2oy7T4NhYtmY/Jz8Ui/8x6uXTYCdEGqAp/fIoCo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lFY/89z1bXy9EygV53sgFrFncdd1OudfyknOLTJtHRVGons6OzspA+Z9Q0f9Boe1M
	 9BsykcYg7v8frboQjQqdZZgqbwTRkI92z2Ofb8DVEtWCsZKaZFr1OTNzSzIJzw0xjx
	 kt7NUMBLQy6J9sMh06P7J1DbM3wDBnkduYuHSBW8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618020150.9863-1-laurent.pinchart@ideasonboard.com>
References: <20250618020150.9863-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: vsp1: Use lockdep assertions to enforce documented conventions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Wed, 18 Jun 2025 21:23:40 +0100
Message-ID: <175027822087.3871677.11336672699195641043@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Laurent Pinchart (2025-06-18 03:01:49)
> A few functions have documented locking conventions. Documentation is
> nice, but runtime checks are better. Enforce the conventions with
> lockdep assertions.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I always like extra checks, so this sounds good.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_dl.c   | 5 +++++
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 3 +++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/medi=
a/platform/renesas/vsp1/vsp1_dl.c
> index c660f8539ff5..d732b4ed1180 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
> @@ -10,6 +10,7 @@
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/gfp.h>
> +#include <linux/lockdep.h>
>  #include <linux/refcount.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> @@ -612,6 +613,8 @@ struct vsp1_dl_list *vsp1_dl_list_get(struct vsp1_dl_=
manager *dlm)
>         struct vsp1_dl_list *dl =3D NULL;
>         unsigned long flags;
> =20
> +       lockdep_assert_not_held(&dlm->lock);
> +
>         spin_lock_irqsave(&dlm->lock, flags);
> =20
>         if (!list_empty(&dlm->free)) {
> @@ -639,6 +642,8 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *d=
l)
>         if (!dl)
>                 return;
> =20
> +       lockdep_assert_held(&dl->dlm->lock);
> +
>         /*
>          * Release any linked display-lists which were chained for a sing=
le
>          * hardware operation.
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/me=
dia/platform/renesas/vsp1/vsp1_pipe.c
> index 3cbb768cf6ad..5d769cc42fe1 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -9,6 +9,7 @@
> =20
>  #include <linux/delay.h>
>  #include <linux/list.h>
> +#include <linux/lockdep.h>
>  #include <linux/sched.h>
>  #include <linux/wait.h>
> =20
> @@ -473,6 +474,8 @@ void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
>  {
>         struct vsp1_device *vsp1 =3D pipe->output->entity.vsp1;
> =20
> +       lockdep_assert_held(&pipe->irqlock);
> +
>         if (pipe->state =3D=3D VSP1_PIPELINE_STOPPED) {
>                 vsp1_write(vsp1, VI6_CMD(pipe->output->entity.index),
>                            VI6_CMD_STRCMD);
>=20
> base-commit: d20469375306163719ee458dd83b7d6c1c93d4d1
> --=20
> Regards,
>=20
> Laurent Pinchart
>

