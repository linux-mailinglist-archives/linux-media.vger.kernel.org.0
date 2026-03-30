Return-Path: <linux-media+bounces-57678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF31MmnIymmL/wUAu9opvQ
	(envelope-from <linux-media+bounces-57678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:00:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6936012A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 21:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D0BB3028022
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B483845B7;
	Mon, 30 Mar 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQRQhlFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CFD2FDC57
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897241; cv=pass; b=sSvhsxR1Nq1QFPVsAmb3CZavmhL1gvgUMVf6ReMm7F41nRFrNsDBLMkOxvDLdHOECVJ88yAZ9oH+f8YSOhyydxSkm/p3a/8r3IwPw3sOJRxwQWhC24teaEgCDVVi8CalHbqdKrBDtosBmm1IiMP5F3ithpW+r9BJiT4cj3vSa7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897241; c=relaxed/simple;
	bh=/1a/Vym2tzO34i8VgAE5TaLD6B98XEwxMTX5gf/jI/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Erfz7IgBIm7NfVMIrf1eQPzRUO+thhYmmjQDYbBTjM2zmZuFQUMdIVS6T/5e06wTNmYwOdMOOWe5YCDuBUQlH3K4Vfcmn1vI3nBh7RVHBRrZgTF7ukwA8nXZ+zVEmk24Z0eqWe4E7tOzp2UgBL5XKW/UHe6WikTX0yNYgtjb84U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQRQhlFS; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43ccda008cdso1647004f8f.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 12:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897239; cv=none;
        d=google.com; s=arc-20240605;
        b=Ix7E28ApO0GfZTv24ISgiCnasfKY/72C3xMQ7WEpqHmdzuc+cqLjUWYwdOe8tDjk3m
         yZbMr7uaVPwS3QyrrqGqsQfUP98lfw2/39/IV2atDLg96WgyW1bJWKSPh0goe3irLN5Q
         HoazeEO3Lec7ZOD9MbEMEH4InZyjsLgYVs1WZQ4xPVmSgTjpOSsDLEBnzgrFakLURyQ9
         z9CCCKTQOgr3w44Ph5V2JbPK5g36jDm9d5zIGPInY2z71mAyh9W0AXtDpxp3eod5nPw9
         FbagYNhYHBFzi/WZpKkV27vhP1u5NM313DCuqCEmHKyUwwkwsqQTshMNqqrp8qneim4n
         afmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DcMtOPAV9FeYIT3myEoFvRsaiivdNMjF8D6jD2I3n4A=;
        fh=+8ewObBpP2teED8QiJyAvHq3ijybvxed2Aarn03lwBI=;
        b=KO2cyQgyTOa/CBy26j3iWCxpTv6zyDWPZMSH79YiOeUG4KT7aStuIsaoEpUJmgkzbY
         Ln+M5/1CJ70UVNfYrFfk+DrxRHSqidUZ/lyL9iiSzH2yF0iqFtFsxebokQqJwclly6tU
         8C0I24p332/qM0Z2H8qWVQWrNZDx+Riqu2zpddPJIs0gjsDvIghKuqJKIVMStNHArPSl
         IWvPi82cSH2ffiqDtxFFZYPc7BrBw4WL8wnTV6636UcpDx9ftT6BkKhvxkw1pfIVUwZO
         7b5Xx3dzVO/IWtMU17aHjmI9dlpcOwF7pTP9Xdt+9GBuVt/0RXXc7o5Vm/kSCU6KRSoQ
         KfJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774897239; x=1775502039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcMtOPAV9FeYIT3myEoFvRsaiivdNMjF8D6jD2I3n4A=;
        b=bQRQhlFSOALo/7egHA8s1PWk3ouCtWO/Ychl0zag4gfY8Pc7Pz4HM7XOiszYjC3bnZ
         JgU1WbB71vEvBv4UAxc6eivTXQf7PQ8S9ZgVWSlPLwzQUGXvU8iSogkNL6AzJ0WDHdzu
         EHLmtfAzHGNpPA4QRAxI7s1AyCYE0IFwvtm8mxYVdcphe0e20ydWUOydUwNzCjvWDxSY
         xLUnwPs9o6nS6P37mWQ7DqHKSEr7r4vNErbEXEYKSPgK0xxlJpY6grfqtH1JzwauX1pV
         kVu/dH5yVkD4iCRzPA+NUfTMhN/b1Nf1hE2Ju5CzS4A/QZUg10hqjvZSDZkgWARW5wEX
         sh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897239; x=1775502039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DcMtOPAV9FeYIT3myEoFvRsaiivdNMjF8D6jD2I3n4A=;
        b=R9CJEwONyDhanA/5dpZsM1p++lBDw86DLpo45nl0ccwD+5s3sgSFdGcSbzae9D+LT5
         G83ZMZnnIx484jxZdd5D//mhp4llJiucVP7KMHGmH+Km1c3Jn/hmU4+ESE661Utbtl4g
         gOpeN1F7oc80kIYh99zSNbG5M9J2yGb+rpD3aR59ti4WfNWaGf/nWcnC9dHj/owXiVSY
         ec2+OthYSJv8QhZJIgQAlkIfXIG5vKfGCKPj+3638UsKdDSNCU+MmM7OlThTfeGKLOyA
         +AwZV0HmRu1VKMD1bYwYHjQ4Q/5bhIJgVRPwQHm0kO3JV+xcmNAMHIJ2bz5VJmCSsvb0
         Udaw==
X-Forwarded-Encrypted: i=1; AJvYcCWwDpi9/8ZxQHrGCQe0xYTSebmwpaYqDIJbQLOv+C3hzaEXXnVv7soCWcGbVbHKs9uMlGSXT/a8ekDvAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKbVkRAfK6nCCxGJ6I9sulCKnkZhFNW+yaNSqCBKvoHl0+Bb1
	AfJOW0isr75zqFXwTiV5702D8v7oFSw0yPYAESv2VcaJOpmdlE4NlbyaSNFEKLNEnsfwzbTcCTd
	QuPO8irSU29+PxVhw3YXM8eu/ciI0wZw=
X-Gm-Gg: ATEYQzyEI/tu8yiU+k2R3x3ooMelU/l/BJuiSXoTlZKbQSxiwbJgf9zuPcVR0kKCDit
	6+2BHHn4CPVLiCMI6XnVWWndWYkzTVy7UKN+0gNeCXVThyPNPYzbV2c614Jdy4+RXRn8MYMnBXD
	kNx5VOOFWYF1cQNx6CAvMlyVWc0U72Szqk0eqLNlIBR/AgaJS6e/cZEMBD77+kt0CGzSRk5R4DU
	Sfx4alYyXn6cY+zktUod2xea/FegsvkErvQOrw1E9f3iOzToYKvrMUHpQxkW2o1dbTswydDoX5F
	Zq8wCT4uZgKzpQ6b87j4NLQqS9ApyX7N3R5NNI4oQXISg9BJH91MIos4/ZDypEGCR/0mZg==
X-Received: by 2002:a05:6000:2d0e:b0:43b:4461:7adc with SMTP id
 ffacd0b85a97d-43d0820bb7emr826363f8f.20.1774897238454; Mon, 30 Mar 2026
 12:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-4-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Mar 2026 20:00:12 +0100
X-Gm-Features: AQROBzAHDaRh4nsyPlc3FMB3H2GoHtOpuw5BWJfgQHeBuZkJMl7B5_uEi8IBO_w
Message-ID: <CA+V-a8vCvRnQda+u=bapou7taXNCEBtkvq2Dq+m2yy51c+=Xag@mail.gmail.com>
Subject: Re: [PATCH 04/14] media: rzg2l-cru: Use proper guard() in irq handler
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
	TAGGED_FROM(0.00)[bounces-57678-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 30E6936012A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 5:19=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> The irq handler uses a scoped_guard() that covers the whole function
> body.
>
> Replace it with a more appropriate guard() and reduce the indentation.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 104 ++++++++++-----=
------
>  1 file changed, 52 insertions(+), 52 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 2d7ac9f37291..b041c72837c6 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -671,70 +671,70 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>         u32 irq_status;
>         int slot;
>
> -       scoped_guard(spinlock, &cru->qlock) {
> -               irq_status =3D rzg2l_cru_read(cru, CRUnINTS2);
> -               if (!irq_status)
> -                       return IRQ_NONE;
> +       guard(spinlock)(&cru->qlock);
>
> -               dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> +       irq_status =3D rzg2l_cru_read(cru, CRUnINTS2);
> +       if (!irq_status)
> +               return IRQ_NONE;
>
> -               rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnI=
NTS2));
> +       dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
>
> -               /* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOP=
PED' */
> -               if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPED) {
> -                       dev_dbg(cru->dev, "IRQ while state stopped\n");
> -                       return IRQ_HANDLED;
> -               }
> +       rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
>
> -               if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPING) {
> -                       if (irq_status & CRUnINTS2_FExS(0) ||
> -                           irq_status & CRUnINTS2_FExS(1) ||
> -                           irq_status & CRUnINTS2_FExS(2) ||
> -                           irq_status & CRUnINTS2_FExS(3))
> -                               dev_dbg(cru->dev, "IRQ while state stoppi=
ng\n");
> -                       return IRQ_HANDLED;
> -               }
> +       /* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> +       if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPED) {
> +               dev_dbg(cru->dev, "IRQ while state stopped\n");
> +               return IRQ_HANDLED;
> +       }
>
> -               slot =3D rzg3e_cru_get_current_slot(cru);
> -               if (slot < 0)
> -                       return IRQ_HANDLED;
> +       if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPING) {
> +               if (irq_status & CRUnINTS2_FExS(0) ||
> +                   irq_status & CRUnINTS2_FExS(1) ||
> +                   irq_status & CRUnINTS2_FExS(2) ||
> +                   irq_status & CRUnINTS2_FExS(3))
> +                       dev_dbg(cru->dev, "IRQ while state stopping\n");
> +               return IRQ_HANDLED;
> +       }
>
> -               dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -               cru->buf_addr[slot] =3D 0;
> -
> -               /*
> -                * To hand buffers back in a known order to userspace sta=
rt
> -                * to capture first from slot 0.
> -                */
> -               if (cru->state =3D=3D RZG2L_CRU_DMA_STARTING) {
> -                       if (slot !=3D 0) {
> -                               dev_dbg(cru->dev, "Starting sync slot: %d=
\n", slot);
> -                               return IRQ_HANDLED;
> -                       }
> -                       dev_dbg(cru->dev, "Capture start synced!\n");
> -                       cru->state =3D RZG2L_CRU_DMA_RUNNING;
> -               }
> +       slot =3D rzg3e_cru_get_current_slot(cru);
> +       if (slot < 0)
> +               return IRQ_HANDLED;
>
> -               /* Capture frame */
> -               if (cru->queue_buf[slot]) {
> -                       struct vb2_v4l2_buffer *buf =3D cru->queue_buf[sl=
ot];
> -
> -                       buf->field =3D cru->format.field;
> -                       buf->sequence =3D cru->sequence;
> -                       buf->vb2_buf.timestamp =3D ktime_get_ns();
> -                       vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE=
);
> -                       cru->queue_buf[slot] =3D NULL;
> -               } else {
> -                       /* Scratch buffer was used, dropping frame. */
> -                       dev_dbg(cru->dev, "Dropping frame %u\n", cru->seq=
uence);
> +       dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> +       cru->buf_addr[slot] =3D 0;
> +
> +       /*
> +        * To hand buffers back in a known order to userspace start
> +        * to capture first from slot 0.
> +        */
> +       if (cru->state =3D=3D RZG2L_CRU_DMA_STARTING) {
> +               if (slot !=3D 0) {
> +                       dev_dbg(cru->dev, "Starting sync slot: %d\n", slo=
t);
> +                       return IRQ_HANDLED;
>                 }
> +               dev_dbg(cru->dev, "Capture start synced!\n");
> +               cru->state =3D RZG2L_CRU_DMA_RUNNING;
> +       }
>
> -               cru->sequence++;
> +       /* Capture frame */
> +       if (cru->queue_buf[slot]) {
> +               struct vb2_v4l2_buffer *buf =3D cru->queue_buf[slot];
>
> -               /* Prepare for next frame */
> -               rzg2l_cru_fill_hw_slot(cru, slot);
> +               buf->field =3D cru->format.field;
> +               buf->sequence =3D cru->sequence;
> +               buf->vb2_buf.timestamp =3D ktime_get_ns();
> +               vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
> +               cru->queue_buf[slot] =3D NULL;
> +       } else {
> +               /* Scratch buffer was used, dropping frame. */
> +               dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
>         }
>
> +       cru->sequence++;
> +
> +       /* Prepare for next frame */
> +       rzg2l_cru_fill_hw_slot(cru, slot);
> +
>         return IRQ_HANDLED;
>  }
>
>
> --
> 2.53.0
>
>

