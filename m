Return-Path: <linux-media+bounces-44152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB23BCC297
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB31A4F48B7
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094E6264614;
	Fri, 10 Oct 2025 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CbwZaa/V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E05260578
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760085361; cv=none; b=YVfjd7NU8QhbFEk5ALk5KqaqsNsyaHilh5OAvbccHSn4lS5uMlCRbQYwl0aq5Vss3sHnoKBoiLJKyYEPrNxTgPMjRTMPzkV8k0RJ5yBcw7wVTDR8yaxj8AFCc9zqgTmPnKRja23aNSjyLlhbvvS/gRn4PSp7Tmxn678RbX3YF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760085361; c=relaxed/simple;
	bh=knb9T3AmsBqiMhLJ/njN1sPWi2h7F0G8fkCmhhoLBcQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=amVQGUaX3AEhiIsHURvYX9Cy0PYhBxrzC5M0Ep9n4UN8LghZcQ5mVz4PyZZIZHGp9ETORNRH3C5e6Hv2duy9SHQ9wiNrYSnUIl3cE0udIJzqrhedfgw/BrTGWy6CPi3fY3TJiXwHmXR19zQ4AjoPIjtdJRn6Ihrx99HkrPjZSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CbwZaa/V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:22d7:7fc4:7ab4:3e13])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D0E77316;
	Fri, 10 Oct 2025 10:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760085262;
	bh=knb9T3AmsBqiMhLJ/njN1sPWi2h7F0G8fkCmhhoLBcQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CbwZaa/V3+cQp0SJCRoxPK1og4yJo5CLYeHzTCJwt+cDtxk9ZSojW6H3fzJzZcor8
	 uiP6wKnAFryjf8P8yaWcAfDcGsEtQNcygSOcj8vit/j5rATqk2AuVFPujtRkSFc41B
	 gQL9ziL43oS6cDBfO5z+RzemtsQD72GE8xBRNyHs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251008175052.19925-2-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com> <20251008175052.19925-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/25] media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns NULL
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 10 Oct 2025 10:35:55 +0200
Message-ID: <176008535515.3214037.12070041639750618553@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Laurent,

Thank you for the patch.

Quoting Laurent Pinchart (2025-10-08 19:50:28)
> The v4l2_m2m_get_vq() never returns a NULL pointer, as the internal
> get_queue_ctx() helper always returns a non-NULL pointer. Many drivers
> check the return value against NULL, due to a combination of old code
> and cargo-cult programming. Even v4l2-mem2mem.c contains unneeded NULL
> checks.
>=20
> Clarify the API by documenting explicitly that a NULL check is not
> needed, and simplify the code by removing the unneeded NULL checks from
> v4l2-mem2mem.c.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Looks good to me.

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>

Best regards,
Stefan

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 12 +-----------
>  include/media/v4l2-mem2mem.h           |  3 +++
>  2 files changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index eb22d6172462..b5e241629dfb 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -123,13 +123,7 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(stru=
ct v4l2_m2m_ctx *m2m_ctx,
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>                                        enum v4l2_buf_type type)
>  {
> -       struct v4l2_m2m_queue_ctx *q_ctx;
> -
> -       q_ctx =3D get_queue_ctx(m2m_ctx, type);
> -       if (!q_ctx)
> -               return NULL;
> -
> -       return &q_ctx->q;
> +       return &get_queue_ctx(m2m_ctx, type)->q;
>  }
>  EXPORT_SYMBOL(v4l2_m2m_get_vq);
> =20
> @@ -1289,8 +1283,6 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ct=
x,
>         unsigned long flags;
> =20
>         q_ctx =3D get_queue_ctx(m2m_ctx, vbuf->vb2_buf.vb2_queue->type);
> -       if (!q_ctx)
> -               return;
> =20
>         spin_lock_irqsave(&q_ctx->rdy_spinlock, flags);
>         list_add_tail(&b->list, &q_ctx->rdy_queue);
> @@ -1392,8 +1384,6 @@ int v4l2_m2m_ioctl_remove_bufs(struct file *file, v=
oid *priv,
>         struct v4l2_fh *fh =3D file->private_data;
>         struct vb2_queue *q =3D v4l2_m2m_get_vq(fh->m2m_ctx, remove->type=
);
> =20
> -       if (!q)
> -               return -EINVAL;
>         if (q->type !=3D remove->type)
>                 return -EINVAL;
> =20
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 2e55a13ed3bb..670e8ec60450 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -153,6 +153,9 @@ void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m=
_dev);
>   *
>   * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_=
m2m_ctx
>   * @type: type of the V4L2 buffer, as defined by enum &v4l2_buf_type
> + *
> + * This function returns the capture queue when @type is a capture type,=
 and the
> + * output queue otherwise. It never returns a NULL pointer.
>   */
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>                                        enum v4l2_buf_type type);
> --=20
> Regards,
>=20
> Laurent Pinchart
>=20
>

