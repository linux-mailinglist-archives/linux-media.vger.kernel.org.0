Return-Path: <linux-media+bounces-65701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3tiYMWxkPmrKFAkAu9opvQ
	(envelope-from <linux-media+bounces-65701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 13:37:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A166CC8AE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 13:37:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MfGJz0qX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65701-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65701-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62D3B306AAC8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206F53E958C;
	Fri, 26 Jun 2026 11:31:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437909460
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 11:31:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473504; cv=none; b=Rbn/iIkVp/9iUdek1JsR/paCAvMiCepCBd1O7Tp9wTYKA9p31biUo7wbtZ7NmTpueYRBPjscdosk9xvIxOm8LmOQetAWAV/LsB4U3U0jx9W5vdpCMeVcDRtGsaTr4B6tmfQqSGVBNADn7txe0/CH7wIGZwtYiYoeaG4hojS/TTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473504; c=relaxed/simple;
	bh=VItD2gNyOUhbKJqu9AHj/bFXqQPm9HEAhWle2t5UPHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L941wCFGFhNYLPDchU+EGY6MDXspdqv9fXFaWkQiVCNhSBflYAgokOjdd+oUYTGA8MzzF5Vhy3C/UnUf0Gf+4J3FomEiMX49FZv61ad3N/lUpcNbbPpWjfvZ81uYBBUf5Xtin26ugRphA41DodwM16DUCPQxZcVhUBMSX4536Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfGJz0qX; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso673325e9.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782473502; x=1783078302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V7IAVFZWmnU0nMqKkIZzyiPJmKtXEMD/AnbFuh2C68=;
        b=MfGJz0qXw5DLfhiVUxaXTwRKutkPmvDnIug5e6IXhyVkqrgwVnqwKxQXaoxxWN/KOm
         kM+WfWV2CqbV4Q5PQN1rp/wXIaNs1Tr882pPTrSTwNrIA53LsuiQG0jJtlA0ohi0etk/
         jBaMe61fGuoleNdxuyCx3+ngwMOKF3kSmkHg9tG5s5bBE3KiYCGsNRhIGa3MHnFCIzz6
         3c1yQUbs9fjM/PLIfliFzUliH7ckrJWpmPxL9XxOomLD/vkjIQfxExtT7wEoqxQN46uI
         syKjApeveRSRghBJFHlAF4MIDAh4do+39BAI9L3+EJD5s3kfGnXxRFdaB415zi/g2Jw9
         yQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473502; x=1783078302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3V7IAVFZWmnU0nMqKkIZzyiPJmKtXEMD/AnbFuh2C68=;
        b=lHdfTUBqI1txxz30FVtqC6d2yzNTFybe/LkAwMmOJh3pDNFCJwwdAzDDM3+qSft/Ed
         z8N0CFpHVwMcAkJwb7dGNtYrNqOTJf60Zx4JqdVy2GNStWtq09W/lXJ0gQPclixF5xBS
         MqgVC4ZxhTTwf02Uh1VRRTOfsvim6nD34xVH74hT/wM5UNjvQYi6IGKQf0AEdPQ9cmiK
         MkiDesSESf4a2vayedWxgk8iMjlcmkEKoLropeAIDROzwKp0a4fLZbEQocMYeXr4xfBI
         SpB5mEMB8SESWQ/cDaZFjRC9Mwx6RcNcN9BKe0OmpkW3B/Y3LxWKZ3BXWiqhD1o2S7uw
         BlDA==
X-Forwarded-Encrypted: i=1; AFNElJ8dIft2ZetOgMVhO9BxbjIgMDiXaQub8hOYrPGzJBxa+bUqjW6t5M/u7WvhyfOa3SElV3vPcyIocouMJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14sPixOTGyV0NAZMMcYvROZCCzJU5gCvw8A5+PtLHwVLr7X6g
	KxWo5sWo8ZwCXVjyhSOn17nwsqL44nivwLTCQd747E2U9A7sy2heH8Lv57rk1wil
X-Gm-Gg: AfdE7clzi15C2U2lGG2lKQc4+8RXTvfkkatYJuo+GRWjk1cjaA8JOLGSQknuT7UPoGi
	dDAtpc88CljZzw9/eCQp4wLyOiJ5VzTF0TpT57gS7Y/pDJWZgjBzhvhGSDgtIxhwfXQa4xnxbXb
	rcAC/+NeqozuILsX1qrKYdhdbeQ2doAH7Fsi+PJ4nvPkacgyo9UB+XTWYPjOSa/PwdHcRlUa9uw
	ZLk7ICpbNEqknPELNNMBZN7jaaaWdVsiF6G2s4xyPDs2pEmhY7wtZ9LBsZbtdyG1LrH9SbGVB7N
	7arBD/v7hab5dlag5xhhlEPEWq8X/j/asQIyzSsvOP5Nybt9qZnlmBbDjM3TfKA27o8dWGyYwjo
	n8Rem+F0OP0yfNpbE0Cp0H/EQr9Ft6g0za0L3lrTN9qJakDV5ZzbV3XndtRgiallI0fFyRCjewu
	UqInWvkjnsUaYxXD8BU3HwOu66vP0zNL73dMD7dkCiR3xxo4ei0A==
X-Received: by 2002:a05:600c:3b29:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-4926fac56a2mr6382035e9.0.1782473501473;
        Fri, 26 Jun 2026 04:31:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm25128520f8f.9.2026.06.26.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:31:41 -0700 (PDT)
Date: Fri, 26 Jun 2026 12:31:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Yousef Alhouseen <alhouseenyousef@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: udmabuf: avoid list copy size overflow
Message-ID: <20260626123139.7d6ec6ec@pumpkin>
In-Reply-To: <06bddfca-d868-4043-ac6f-28ca103fff02@amd.com>
References: <20260624125242.11232-1-alhouseenyousef@gmail.com>
	<06bddfca-d868-4043-ac6f-28ca103fff02@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65701-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alhouseenyousef@gmail.com,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,intel.com,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,amd.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67A166CC8AE

On Wed, 24 Jun 2026 14:58:58 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 6/24/26 14:52, Yousef Alhouseen wrote:
> > UDMABUF_CREATE_LIST copies an array whose element count comes from
> > userspace. The count is compared against list_limit, but list_limit is a
> > signed module parameter while the count is u32. =20
>=20
> We should probably just drop the sign from the module parameter instead.

Does anything sanity-check the module parameter?

	David

>=20
> I don't see an use case for negative values here.
>=20
> Regards,
> Christian.
>=20
> >=20
> > If the limit is raised too far or made negative, that comparison no
> > longer bounds the count to a range where sizeof(*list) * count fits in
> > the u32 temporary used for the copy length. A wrapped copy length lets
> > memdup_user() copy fewer entries than udmabuf_create() subsequently
> > walks, leading to out-of-bounds reads from the copied list.
> >=20
> > Take a positive snapshot of the module limit and use memdup_array_user()
> > so the multiplication is checked before copying.
> >=20
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index bced421c0..b4078ec84 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -469,14 +469,15 @@ static long udmabuf_ioctl_create_list(struct file=
 *filp, unsigned long arg)
> >         struct udmabuf_create_list head;
> >         struct udmabuf_create_item *list;
> >         int ret =3D -EINVAL;
> > -       u32 lsize;
> > +       int limit;
> >=20
> >         if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
> >                 return -EFAULT;
> > -       if (head.count > list_limit)
> > +       limit =3D READ_ONCE(list_limit);
> > +       if (!head.count || limit <=3D 0 || head.count > limit)
> >                 return -EINVAL;
> > -       lsize =3D sizeof(struct udmabuf_create_item) * head.count;
> > -       list =3D memdup_user((void __user *)(arg + sizeof(head)), lsize=
);
> > +       list =3D memdup_array_user((void __user *)(arg + sizeof(head)),
> > +                                head.count, sizeof(*list));
> >         if (IS_ERR(list))
> >                 return PTR_ERR(list);
> >=20
> > --
> > 2.54.0
> >  =20
>=20
>=20


