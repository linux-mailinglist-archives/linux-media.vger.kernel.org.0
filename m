Return-Path: <linux-media+bounces-57737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCu0EIp9y2mLIQYAu9opvQ
	(envelope-from <linux-media+bounces-57737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:53:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A636589D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C4D93013021
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4C0355F57;
	Tue, 31 Mar 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFpNZoBS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA863C3BFF
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943239; cv=pass; b=l1F+e24GIuTR15yihMgs8AyQtO/lF4C8FeUek84kF73/qnPqaFC6kmlWZCev/KZF1OODzeKIL3id0OsJHXAngqSTPbzbxW7pKHUQVBd5J1M6oLwEnvUC524ARlQyuSMsoUQAmla2Z3cZkGrA8i6axprzQsr/iPZ/BPSZECraMvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943239; c=relaxed/simple;
	bh=InV0KghoLgbUA/Wb5uJIxvgkVwa7/KD1D3wR60dCqtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUXFDLrGlhQB8dx3yZHYA/1clEutxAwzwQkJT+W8M1n78giWOgJvmOY8UknVIIUNjDEdruCsp8ygQ9jbTU3PguCcWEQ5EkC6IONNGSBj0J3WJSX97sdpcleUUGIsisKagmg0u9R4NOMBGKzpjU/1wR3kae57y4lVYPv7oV9Ilek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFpNZoBS; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso53632995e9.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774943235; cv=none;
        d=google.com; s=arc-20240605;
        b=MwwUtKu1oEJlV0HZecW+6Nc+SuZIyPWuD0tDIfeukmI/nAr1eAkdmcML+UJXgXwuOw
         2HMae1+oe57CHKXq0hHfLIB9vHX/1tTHYsUPoJTgddtUMsGTQzVF6sNXeQtG+titnQ6k
         qAXJD+vI8KBB/yt/t0dmdkMKfjPDxpqrts6r5w0Yu2dURqFIhr+JRsMAS5U/QmUve5Z6
         bfXVl8Xx0/ank/qUfseJAjvlbmhQJ3F6MryDCSmZyE5w8jJbV2PMQJwPZqRaBqPSoYew
         3qSQtJHIADv1pW8IkSWZZmCLK7FAdC79D3EkzCIqqVn+P6hE6c73jhE1hXRneFDIBAyS
         F+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBgwueRpMtwPAq9T1PUr+MRKug5VIECcdk7Y64NpqDw=;
        fh=xdHG9tm9nRLedGdZ4zcyBCZWq97MnKOwjSPc51671Qs=;
        b=d1wsGtD4kiAOG+eFATcvnoAnsSb9mxKndB5FUItjAgScxi0UVp+CBci5vvib5S27xh
         2M0T0G1C+qFIENK4hKCdn03xe6yG20rm2soDJPPjX8v6B0gK9nzV2ODKKagvjYCvH0/T
         zRTxo4bi9Cu60U4UkD5thtaAUQrJKUpjLdFB4AWAMtQfud4z8ipR/wRecxZDeE/jjjew
         uN8MfylTC+n8RhpMCgbNaqbzGkT79dz8+FyzP+KsqcD1r5FZcv1G7a8aGtaIodlRH8j3
         YyoWBgxNYmDDHThSHJfDchkHbrBaU8jwePYbX5pVP50NS26ix2ZaCvsOz2nXWy1NKAQ4
         WQdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943235; x=1775548035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBgwueRpMtwPAq9T1PUr+MRKug5VIECcdk7Y64NpqDw=;
        b=hFpNZoBS4+tZmpAynUsTN2mP2PV7Ri/owmoFc41UurP8Qwyw5ueFymF792ShlSfYva
         UFIzQVcejb4pIiP8tHa4yo952NAjWm8cfKCzIUcJEtQVN8R5na+25go8PW/fw7kI/Zw3
         Xu0ck8WYDJJJ5IOZfEqicJmaGK7Xek0GBPTb+0k+bFS1T46Xab32hgQQ2SnkwxUdZF7A
         wT2DKzmcJcE9vGEYGNz4SWidVa4nNb9xaPZHHYPp9dSLqGPVoN+77UFnB+pUHYu7KGkx
         L5+2MqNOGKtor7voVDhH++/Hu2vt0Fj/gERfFLJHO0D0VlW/AUlG8IQQ9IEOCBzCKaD6
         Q8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943235; x=1775548035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rBgwueRpMtwPAq9T1PUr+MRKug5VIECcdk7Y64NpqDw=;
        b=E9u2/KS5IEIt74b4UcToikY+73V8qGz3r/VK+e7S55Vl6KnOYE00Gc5afNEIJxOonD
         d/YJVXmTODB8M5r3EpvMSGIC1hxkoptqkxl45s0Tizm8v6dVPM5+g8RG+NRWZEZf8HWM
         tBnVvjJh1TUG/KafMxtDUrGCO7QcDIBKVl3VLaRUZG+bz+D6aRGfZywYVEKy8hduB7zv
         0ADN740SDuh7KAF4kObXcOZck7BTgPCxpi0N3PqpFevS62+ovXtBx0JVsbcBhfcAyUGn
         uJEp3Kcs5vqlgTdmuWrzcfNWnbrgZIa/Dq7tWPx/+RCxAZvBaoJTX9SF3TNXBg5IiZ58
         USqg==
X-Forwarded-Encrypted: i=1; AJvYcCWussb1Y7CEceqq6SVoA2qhNiiHeAUWpU6PuzxPcM722KfyjJJW6GiLEFE1GknIeBa4Sqn+1K/er9KTXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2oqRAC1SX1z7OrBdLIgXaY/ENmYLCCq86mSAvDo5Pud4IOrz
	l4b7RUvSGV4nP5lF2Fje+qbsUboKq6GWrfd5t0Zv8npb4lQHT9c7XMzpsBhmsSYEwaCRukEwbic
	NNGoaAxPkcUXTGmXTU+DdLdUq4PPvCCk=
X-Gm-Gg: ATEYQzySb7UO1fwpLEdhupZbWRxmQCFwMSEIYk37/aH/ucDhJ4kj715mX0wDUv77C+g
	7CMcLQHoxMqCICRhIlcp8nLRr/5KQe7PuuRb6S7ah04la/JK1njWL/fDCJTcuUNg6lZFgxrAqGB
	6t2eF6zsEvdNpCEetrUEleoWutmM8F2qLKnjUsQtxukOwgM25REl0XCH0IKR871QY5CXxdlOFSY
	E8zLNiF3MQxDGlIPEe8nr40Kvxnz25+FC5SfVUxQQ8pXMFV3HeqcKqc+3xc1BGXqzgXxl+U7/TK
	fzQHE6t/Y0W6RYlV6hyzm2fEZ7g1Q3/iC1OawuGVlDUGXpCFzdTnCorLcsNRig+vzQCRVA==
X-Received: by 2002:a05:600c:1f11:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-48727d5a31emr279227475e9.7.1774943235212; Tue, 31 Mar 2026
 00:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Mar 2026 08:46:48 +0100
X-Gm-Features: AQROBzDW0I1gi6no8bfA_fbAOU39j1Za-O8-I5Cg_AwMrKuRsUc4CupvsaSckPE
Message-ID: <CA+V-a8sfitst7+-0Y2jTxGA5vdYbGeRK7zvrBRwE-PdWjXw0tg@mail.gmail.com>
Subject: Re: [PATCH 06/14] media: rzg2l-cru: Do not use irqsave when not needed
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57737-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: AE5A636589D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 5:22=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> The return_unused_buffers() and rzg2l_cru_buffer_queue() functions
> are never called from an interrupt context, hence they do not need to
> use the irqsave version of the spinlock primitives.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 43b1d35fb963..2e94788c3a13 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -113,7 +113,7 @@ static void return_unused_buffers(struct rzg2l_cru_de=
v *cru,
>         struct rzg2l_cru_buffer *buf, *node;
>         unsigned int i;
>
> -       guard(spinlock_irqsave)(&cru->qlock);
> +       guard(spinlock_irq)(&cru->qlock);
>
>         for (i =3D 0; i < cru->num_buf; i++) {
>                 if (cru->queue_buf[i]) {
> @@ -166,7 +166,7 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer =
*vb)
>         struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>         struct rzg2l_cru_dev *cru =3D vb2_get_drv_priv(vb->vb2_queue);
>
> -       guard(spinlock_irqsave)(&cru->qlock);
> +       guard(spinlock_irq)(&cru->qlock);
>         list_add_tail(to_buf_list(vbuf), &cru->buf_list);
>  }
>
>
> --
> 2.53.0
>
>

