Return-Path: <linux-media+bounces-57675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHdIBM3EymmL/wUAu9opvQ
	(envelope-from <linux-media+bounces-57675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:45:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5AB35FE6E
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 20:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3ECA3027947
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80133DEAE6;
	Mon, 30 Mar 2026 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOoRsaKz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4D93DDDB0
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896250; cv=pass; b=MGQB5cvAE763q04p4WmNn+X8Q7Pr4BPHA50/eEcOS0D9QzDl2NJnIQX6WHbL1+05ahkcT1rRGIub5O3BBl66OvNnzacGuzY7zN6LtcGQ+rzaR+4TQEGZAoV6uSuho336Tr6rK2qXYpRtilA3QAsjV4+VeCX+5XsoDjczA4JztVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896250; c=relaxed/simple;
	bh=h3TWTALDycifRa/KO3mQCFnBSlIZ3D7ktMUDEWYcowY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoxHovDSM4Q5/5L2sEZ5O80T2+51VzbBBPXGadnZOWlFVIc47thBH/iyii9qy6k4e9kCyaq2CMd7BA8h91EXAfLSOngV1pJHTSomX27rnazlf99lyjBQuo4LuFruYBmdpRlG13Xx5T4BVVhSNwIVqZjp+7eBES7mjCaryVdX5ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOoRsaKz; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso2840472f8f.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 11:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774896247; cv=none;
        d=google.com; s=arc-20240605;
        b=ULnQykyc1BJ78ww+ybND1mcyVRM5NAAUU6NbA9l3QKZHjHuD4VRsuaCyim9U4XLW21
         tfwXam7Iv+eufwXRA83mbZStzjeKqvBa0Fn1BmPORHMyaDL+NcEQIFp3DhYiaGBr0Arq
         TM38AYikvg/e9wAauJO3IWuhwMzV+/bayjYusGDwHlSKziiQQhLsJvQLJM+fdDfMryBo
         qxlql4FqkUFtXW2bQZSAC9DFy24pwX8RQnCI9eCznTkmtKdoRqKVz4yGC2Y/Tq/r1xor
         aMjGIJr6fDU07qZUdmun7vxLKVM1JP8zGcgA9ofDrziPhouYSaMlnoyMN84g4yNbdMAL
         cZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7bk5HT2qB+B1M+UpbfrAUTf7GCZJ4mgu/OUvHbASe8M=;
        fh=bMRO7E+I5+FrYJjgGRKHpJ57SvMKBZymcwPFIoRw8YQ=;
        b=f1ZOlC2MsvK0YnKX9lEs9mFRJjUkaAf9KdAg6zy8RuLdJ9JQgZ0XZ+OJJMk/KqV2+W
         WIP4QQTsA4GxnsIhq03VON15u/gGI7HP1KIUKq8xHKvW/6UpV2JMuQOGIsgQWv2vUB8v
         MG2JT9IXVgnhE+Ao8a5AxKbh0qDa9Nc963uskeK/gxbl7IYm/153/SkuERgXTNW1rCLj
         f1gwc3riiY9uIo2rsMgVZrLFjBElrwk0U7hqgUx2ygTv94noYcqp15QkzPgL+T9OSITg
         C6PVrKc7DVytuzFE2sPO94Fo6QLn43eqlInYtN7u5TGJbRCRLH+KQbISmmyaMDdoAr15
         T60A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774896247; x=1775501047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bk5HT2qB+B1M+UpbfrAUTf7GCZJ4mgu/OUvHbASe8M=;
        b=BOoRsaKzqVCDuqWFGD3UUQP3wh3R4WKm3Jz2fHvsYTg75R2gcehl0BAI9u5JLYIK1p
         /Asf6tu4GQt/zKlV2+qVyLrxAMZn5zTQ0+qmPOCdPDS/vib12EkuYBB3DXyEMg82ElN8
         va3n/i0caXOtCMsb94h8MbqpP1xwiLwX0gFCsH6+TEGQP+NRVGyvPYEmQ/LYbOB3n99d
         P76kv/ZxwkIFaMbySHvJK4udOjQqH0zHW2RDwfRtMPhgZM977k0gUXUPcd9SBHPlw6gU
         R7UOco3dpECuIRLRxfH+hylQmeqKLIdpHF/U9WUAz4b15AEIAJOLiyKvYXoxhzzPKAZY
         s2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896247; x=1775501047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bk5HT2qB+B1M+UpbfrAUTf7GCZJ4mgu/OUvHbASe8M=;
        b=ksVOEW3SqxD0oghEAopORKUuuRLTb82wXutncDC4LTK7WAnwkGM4hvNOW1QXNhQjD0
         RD63GCuurbeTIntFrdYAJ4xNKajcGlqDWqdAE2w6kcyMr2/68wt0ikt8IXpxnx4c4w1g
         AsJ/JFz+sqyo+CmX6FKDlS9wEdoYDEkvGMqTR7bsT6Rsikjefi1mpgxkjWC3TN8YwsyV
         HHwT2HLBgWUgPtaa0fmpb2KKsxSluBPylS+V6q1UrDrK/vrHEpLGaqTAcQvJsFStihCr
         OGtbWPZ9R+XIZUYcegvRqCmSS4MOk6ouATt71quNeYcI9w8QaM5+yuydZ0hBHrmW7Acg
         LH8g==
X-Forwarded-Encrypted: i=1; AJvYcCWHPKWf5Hm+YueQBT7KjJURncTI1xCc9gdXACI5HRiDSAIrCIG4h23mxVbbNReI38AcK85OXcoa1etXsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMN+/RUppR3ItVQXZAqZQe3MqT13MSBHuLJrlBFC9eIfsNdlfZ
	RMtjnd++WuHPG0pOmAuI8HjWxmRt0CMTsNeQw0mhG6ht2vtAlBQ2ZBOukQ9L4kr3LNA5wbVqulh
	1sP2XWjH9U6Z1o7HWzfH0/7kc9bVgFY4=
X-Gm-Gg: ATEYQzyQ+4ZoGKc4rmGZYTaySYmGCdG3b++xCRBCyz4p6nzBOTMK5ghkQp7mQ5vx8JZ
	ByhSKR+LMrpGakDa6tff4zYAoYBVtXhkSlgwM2GLlSn7Otkj/yNs6+USTCK5kgcc62H1hOM/dg0
	Xb6Sc900vokQjA7oDphNWwDV9AL9MvJT0apbQe7gxpXUm3vnyYUjX4R04hlP2sz7FLkVV1GxN9e
	fJpbmuXNwVsH9rb029mTX0i36APh/969fij/wOWtG0J1cXYL/Cqe4kVEOYWanROWPZefzuWJcki
	SedsGKC3GkPf/GYXMSuvfsGYaVh7Ys02nf3A8jIsej9f7jWeHslt6pyhIbN5Idja7uXWTw==
X-Received: by 2002:a05:6000:2409:b0:43b:447a:11b8 with SMTP id
 ffacd0b85a97d-43b9e9d6050mr23300750f8f.6.1774896246925; Mon, 30 Mar 2026
 11:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Mar 2026 19:43:40 +0100
X-Gm-Features: AQROBzDFouAkBhGSwooc6BuTR2qRGJmZGah0r5_XtaQXldYSe6YfIgg0C2_ZubU
Message-ID: <CA+V-a8vwUcmAFJ9XJCbE113JFV7yqQkCGgHcEhy7AYV1OtxhPw@mail.gmail.com>
Subject: Re: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with cleanup.h
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57675-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 5F5AB35FE6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 27, 2026 at 5:20=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> Use more modern constructs from cleanup.h to express the locking
> sequences in the rzg2l driver.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++---------=
------
>  1 file changed, 10 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 98b6afbc708d..2d7ac9f37291 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2008 Magnus Damm
>   */
>
> +#include <linux/cleanup.h>
As pointed out by Biju this needs to be spinlock.h.

Rest LGTM, with the above fixed,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
> @@ -110,10 +111,10 @@ static void return_unused_buffers(struct rzg2l_cru_=
dev *cru,
>                                   enum vb2_buffer_state state)
>  {
>         struct rzg2l_cru_buffer *buf, *node;
> -       unsigned long flags;
>         unsigned int i;
>
> -       spin_lock_irqsave(&cru->qlock, flags);
> +       guard(spinlock_irqsave)(&cru->qlock);
> +
>         for (i =3D 0; i < cru->num_buf; i++) {
>                 if (cru->queue_buf[i]) {
>                         vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> @@ -126,7 +127,6 @@ static void return_unused_buffers(struct rzg2l_cru_de=
v *cru,
>                 vb2_buffer_done(&buf->vb.vb2_buf, state);
>                 list_del(&buf->list);
>         }
> -       spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>
>  static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbu=
ffers,
> @@ -165,13 +165,9 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer=
 *vb)
>  {
>         struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>         struct rzg2l_cru_dev *cru =3D vb2_get_drv_priv(vb->vb2_queue);
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&cru->qlock, flags);
>
> +       guard(spinlock_irqsave)(&cru->qlock);
>         list_add_tail(to_buf_list(vbuf), &cru->buf_list);
> -
> -       spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>
>  static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> @@ -465,7 +461,6 @@ void rzg2l_cru_disable_interrupts(struct rzg2l_cru_de=
v *cru)
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  {
>         struct v4l2_mbus_framefmt *fmt =3D rzg2l_cru_ip_get_src_fmt(cru);
> -       unsigned long flags;
>         u8 csi_vc;
>         int ret;
>
> @@ -475,7 +470,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru=
_dev *cru)
>         csi_vc =3D ret;
>         cru->svc_channel =3D csi_vc;
>
> -       spin_lock_irqsave(&cru->qlock, flags);
> +       guard(spinlock_irqsave)(&cru->qlock);
>
>         /* Select a video input */
>         rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
> @@ -492,7 +487,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru=
_dev *cru)
>         /* Initialize image convert */
>         ret =3D rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
>         if (ret) {
> -               spin_unlock_irqrestore(&cru->qlock, flags);
>                 return ret;
>         }
>
> @@ -502,8 +496,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru=
_dev *cru)
>         /* Enable image processing reception */
>         rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
>
> -       spin_unlock_irqrestore(&cru->qlock, flags);
> -
>         return 0;
>  }
>
> @@ -573,16 +565,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  {
>         struct rzg2l_cru_dev *cru =3D data;
>         unsigned int handled =3D 0;
> -       unsigned long flags;
>         u32 irq_status;
>         u32 amnmbs;
>         int slot;
>
> -       spin_lock_irqsave(&cru->qlock, flags);
> +       guard(spinlock_irqsave)(&cru->qlock);
>
>         irq_status =3D rzg2l_cru_read(cru, CRUnINTS);
>         if (!irq_status)
> -               goto done;
> +               return IRQ_RETVAL(handled);
>
>         handled =3D 1;
>
> @@ -591,14 +582,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>         /* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
>         if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPED) {
>                 dev_dbg(cru->dev, "IRQ while state stopped\n");
> -               goto done;
> +               return IRQ_RETVAL(handled);
>         }
>
>         /* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOP=
PING' */
>         if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPING) {
>                 if (irq_status & CRUnINTS_SFS)
>                         dev_dbg(cru->dev, "IRQ while state stopping\n");
> -               goto done;
> +               return IRQ_RETVAL(handled);
>         }
>
>         /* Prepare for capture and update state */
> @@ -621,7 +612,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>         if (cru->state =3D=3D RZG2L_CRU_DMA_STARTING) {
>                 if (slot !=3D 0) {
>                         dev_dbg(cru->dev, "Starting sync slot: %d\n", slo=
t);
> -                       goto done;
> +                       return IRQ_RETVAL(handled);
>                 }
>
>                 dev_dbg(cru->dev, "Capture start synced!\n");
> @@ -646,9 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>         /* Prepare for next frame */
>         rzg2l_cru_fill_hw_slot(cru, slot);
>
> -done:
> -       spin_unlock_irqrestore(&cru->qlock, flags);
> -
>         return IRQ_RETVAL(handled);
>  }
>
>
> --
> 2.53.0
>
>

