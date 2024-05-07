Return-Path: <linux-media+bounces-11036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E59E8BE4D2
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 614FC1C219DE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C2A15F3E1;
	Tue,  7 May 2024 13:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jzavlGvx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD8E15E1E6;
	Tue,  7 May 2024 13:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715089929; cv=none; b=CzsIASrA1Q7TEq/ZEx1PioFyLJgWR7/e77NudfxTKd8zmmH3B0Vr7uH1Xa4sfFirUEc3ldEJkkB/8CYzzVWZnM0efYw2rAH1pHlKBl7H//ZKZnB7vMt95ug66/Da72brwraLqidftR1aQ+vlZdEWV2i0aXPvutkifiIumqDbiXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715089929; c=relaxed/simple;
	bh=1viqNXMtyS8ANOoHlnhSLYHsZNS1uTC/6gJNg0lRhBY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CEs4yW4XwUnCEYZJjSh6YoFWc/G3fyTeHJMTmglnLBInwZcy4ufHpEnk8Zen/IMgyIi7h6/rIyQ4BKeHTzSNWqsvXV0EhWO1wwTM6enQFTa7Rgn5wKF7DtwQSFAgfbuneEFkZHxduY1JYnyuAgm25w3o9Zd64wByyNkuGr2GzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jzavlGvx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C494C1153;
	Tue,  7 May 2024 15:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715089922;
	bh=1viqNXMtyS8ANOoHlnhSLYHsZNS1uTC/6gJNg0lRhBY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jzavlGvx4lh1DiBGck4sP2l6Dl3jQl2f20ewoIx8jtVaNFhhD/qYEl8sSXIGYprqg
	 lN65xlh4Iufamd1eii+xNsHD+jVqGZSy7FA2f7nDarzg8jeY63JU+Cl6EJmZPl2fS7
	 Lo+7JRg3jqvh+D5woQAsh6WWsKOt18JqAL+RYN6E=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240505174544.18359-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240505174544.18359-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix _irqsave and _irq mix
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-renesas-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-media@vger.kernel.org
Date: Tue, 07 May 2024 14:52:02 +0100
Message-ID: <171508992219.1857112.13838063056229211868@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2024-05-05 18:45:44)
> The histogram support mixes _irqsave and _irq, causing the following
> smatch warning:
>=20
>      drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_stre=
aming()
>      warn: mixing irqsave and irq
>=20
> The histo_stop_streaming() calls spin_lock_irqsave() followed by
> wait_event_lock_irq(). The former hints that interrupts may be disabled
> by the caller, while the latter reenables interrupts unconditionally.
> This doesn't cause any real bug, as the function is always called with
> interrupts enabled, but the pattern is still in correct.
>=20
> Fix the problem by using spin_lock_irq() instead of spin_lock_irqsave()
> in histo_stop_streaming(). While at it, switch to spin_lock_irq() and
> spin_lock() as appropriate elsewhere.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Fixes: 99362e32332b ("[media] v4l: vsp1: Add histogram support")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-renesas-soc/164d74ff-312c-468f-be64=
-afa7182cd2f4@moroto.mountain/
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  .../media/platform/renesas/vsp1/vsp1_histo.c  | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/m=
edia/platform/renesas/vsp1/vsp1_histo.c
> index 71155282ca11..cd1c8778662e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> @@ -36,9 +36,8 @@ struct vsp1_histogram_buffer *
>  vsp1_histogram_buffer_get(struct vsp1_histogram *histo)
>  {
>         struct vsp1_histogram_buffer *buf =3D NULL;
> -       unsigned long flags;
> =20
> -       spin_lock_irqsave(&histo->irqlock, flags);
> +       spin_lock(&histo->irqlock);
> =20
>         if (list_empty(&histo->irqqueue))
>                 goto done;
> @@ -49,7 +48,7 @@ vsp1_histogram_buffer_get(struct vsp1_histogram *histo)
>         histo->readout =3D true;
> =20
>  done:
> -       spin_unlock_irqrestore(&histo->irqlock, flags);
> +       spin_unlock(&histo->irqlock);
>         return buf;
>  }
> =20
> @@ -58,7 +57,6 @@ void vsp1_histogram_buffer_complete(struct vsp1_histogr=
am *histo,
>                                     size_t size)
>  {
>         struct vsp1_pipeline *pipe =3D histo->entity.pipe;
> -       unsigned long flags;
> =20
>         /*
>          * The pipeline pointer is guaranteed to be valid as this functio=
n is
> @@ -70,10 +68,10 @@ void vsp1_histogram_buffer_complete(struct vsp1_histo=
gram *histo,
>         vb2_set_plane_payload(&buf->buf.vb2_buf, 0, size);
>         vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
> =20
> -       spin_lock_irqsave(&histo->irqlock, flags);
> +       spin_lock(&histo->irqlock);
>         histo->readout =3D false;
>         wake_up(&histo->wait_queue);
> -       spin_unlock_irqrestore(&histo->irqlock, flags);
> +       spin_unlock(&histo->irqlock);
>  }
> =20
>  /* ---------------------------------------------------------------------=
--------
> @@ -124,11 +122,10 @@ static void histo_buffer_queue(struct vb2_buffer *v=
b)
>         struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>         struct vsp1_histogram *histo =3D vb2_get_drv_priv(vb->vb2_queue);
>         struct vsp1_histogram_buffer *buf =3D to_vsp1_histogram_buffer(vb=
uf);
> -       unsigned long flags;
> =20
> -       spin_lock_irqsave(&histo->irqlock, flags);
> +       spin_lock_irq(&histo->irqlock);
>         list_add_tail(&buf->queue, &histo->irqqueue);
> -       spin_unlock_irqrestore(&histo->irqlock, flags);
> +       spin_unlock_irq(&histo->irqlock);
>  }
> =20
>  static int histo_start_streaming(struct vb2_queue *vq, unsigned int coun=
t)
> @@ -140,9 +137,8 @@ static void histo_stop_streaming(struct vb2_queue *vq)
>  {
>         struct vsp1_histogram *histo =3D vb2_get_drv_priv(vq);
>         struct vsp1_histogram_buffer *buffer;
> -       unsigned long flags;
> =20
> -       spin_lock_irqsave(&histo->irqlock, flags);
> +       spin_lock_irq(&histo->irqlock);
> =20
>         /* Remove all buffers from the IRQ queue. */
>         list_for_each_entry(buffer, &histo->irqqueue, queue)
> @@ -152,7 +148,7 @@ static void histo_stop_streaming(struct vb2_queue *vq)
>         /* Wait for the buffer being read out (if any) to complete. */
>         wait_event_lock_irq(histo->wait_queue, !histo->readout, histo->ir=
qlock);
> =20
> -       spin_unlock_irqrestore(&histo->irqlock, flags);
> +       spin_unlock_irq(&histo->irqlock);
>  }
> =20
>  static const struct vb2_ops histo_video_queue_qops =3D {
>=20
> base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
> --=20
> Regards,
>=20
> Laurent Pinchart
>

