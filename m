Return-Path: <linux-media+bounces-63932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6PdRLdPmImrqewEAu9opvQ
	(envelope-from <linux-media+bounces-63932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:10:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9264923E
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:10:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=iwF3mAZ5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63932-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63932-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A47EA30E29C2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCBC3E0095;
	Fri,  5 Jun 2026 14:55:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CC3E00A2
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 14:55:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671311; cv=pass; b=SdAPxNB70Oys35yOyHMMRfNynFvbgZfdbKeArL15hBW0ssYmOt9NJsfSDWL+MEeAXd5/ZNyo3zbjMLv38axcPSlx+AQnu2H8HAPKDq4hkkK4NyZV8zRd//l1kDe1dPQ7rVicEfNo1ESyTUxK4sDj/WuUr260kcJEi31/7UM8VSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671311; c=relaxed/simple;
	bh=uAyomS5JQN29ENBomMwzxMcVDyQgqPKS6joeV5zeK/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiqZa3wsBvcj/m9SS+Jisor0313Oyt5zDo1e5Bxl2JnYzfASbxb8Reb0txS7JVc+mQOf6NR/V8I6YUyzhHDeuk/7a+yv63B7IldUIZplZcK5rxUWMl9DSm3DEIlMObAvYZW9diA3ACKiYnPET+XwVQPWtKTNoz2/P359YVYRQto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iwF3mAZ5; arc=pass smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1940062f8f.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 07:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780671308; cv=none;
        d=google.com; s=arc-20240605;
        b=YPGT59G+/avRTNuGuNztFNi/2cUhe6sek5tV5U0MDaAmeEpT59OmsmMomo9mP+qcE/
         nSby2SyZVta3HK2wc50gEDsi/XiwgerBeY6PM0b0BZ8xfqz75A2abf+RSufoQ2/B1AiA
         AM3gHdzPWEf8S7RvT5WyHE1WuLcnnTb5ndiPsZiPdhIiFnOmJ6nMo+UDHFni0+sJM1Nv
         Akkj3DTgLx84sKTqA9V2pBPu54hXFk6zvd++hyIzrVsbTKzJKozYQHBH6No+0vGUoAYt
         Kr3IbAX5FNeiXLDLrz9HSocBsbcbRUwwZrcFyKYUR/+1iIjKvnQpXIY38De3XjzQVmAS
         eoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ga5I8YlfP9EVgN78rA8flUbrTYvBmVk8NvjmWyk37Eo=;
        fh=UEfdiDgfqbn/9+5JxyaculC7HX45hwR0+rbaN7MaBac=;
        b=VssSinE5nabZUgmv9e/r7AhPXFiA6V7c/2AOBWG3ys7pZUGtZGtACEsc90pCrVmBzT
         gzICJbaUANK/V9KVGMsTCe4bueAuFRlto97mSO5aZjcEt5CPZ0hnZLR3wGGrwyhuXpF4
         WliYcY53qA/IjizwvGcp+2QPxjCJTj4aJHDgW3rI3WfQafwPllgsD9bXzQQl+jGw2Twi
         5WM0dpzQy7nYAqOdhecvfuv/Uuo0RhdXdrQgHTt6VslzKG/AXHbCSeoxSkO38831PA4R
         o61HT9xgbYNIzLBDIg12wd42oeBpw1jg4tlZSvinIWhkdZQD5uu4ptNp8cP6p8wMZlpY
         26aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780671308; x=1781276108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ga5I8YlfP9EVgN78rA8flUbrTYvBmVk8NvjmWyk37Eo=;
        b=iwF3mAZ5s+js/HQc7b9Ui/DD7kYn+5ZgVtMg2qd+PbaBVxz0iifFCgecjafSjYX7+f
         23bv8ocovX8b4x9ymVElNNTzO45tuoUSdseQXGmR4IfYgcyitxaSwn8cCHEC9aUaj1CQ
         Kf9gtLyw6SpdYAULVUqwESzIQFQ4rNcXvUIf6/9Gnk7FsyVnYshwROidgeQK4OwGz9+L
         12VJS9RfwgBMn3QP90KHnL/j3p8AqdFl/JFnDlcPb+zI9QHO9RVceo5ETHTs3mnM2hPq
         a0E69f1tdoqKcyRiEOWYC/Y8SanuFYIyU4BhYTNhMWHV8R8osKV2t8XKEITzBHRhrfq8
         XR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671308; x=1781276108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ga5I8YlfP9EVgN78rA8flUbrTYvBmVk8NvjmWyk37Eo=;
        b=PLsl6RFdwfyzdL9zeW6BCKoRnMlOGNnSc+d1BGKRy/50/b1BkmIJHQMhTisTIZh/gU
         I3c+tXC3r0IEQYx4D1fF8Qih+ASMe5QJ5u6ZT+MgDGaic0rh6tvby7ANGlHh1voHPSlj
         22pEJnO3NZaZ+BI7qYpUVN3YMN3YE+LqSHgTz5R6eWYVnDt5Xma1MUpkXNfg+q5bNwg/
         l1NYQoTBTFrcwz1OIGJpUyqZjkHkSESCFjHH53Jh86R8tVg6YYkJU8vcMYmJxN9uV9Be
         2CNOkYRZzjecFANc+i2EnRom4Ih9Wt3ZOBhZkQMFh9/6MrgOQynPugPkLPtYyVzkHwaC
         f32w==
X-Forwarded-Encrypted: i=1; AFNElJ9cyAv6n7q6e9qNf014QYZjylMlxfFH/p5elfJ9D3gOeRNlocSutbC7QCeBl18Ip1dtW9RnSePgf8I3HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEM/+7RbMaHFqS9s4kDO78ifukhGUV7VfHGjNRvNrQy30TG3GM
	RYX6YCA7Vd6h6sSEZowfi3ODXZgJ1Aq18jJA/jYh2jSwJiu4wtVfenry3jUEe3fbdldT+/67omb
	Mbk2j8+2zDcgs4bzb6H9gwBkJ+1zf8372qfGTr1cG
X-Gm-Gg: Acq92OGD8k0n8pNdl13g2oMb7lpmJINtE0qy2HivRe/Oaaq9LJiDYv6B8EdLVB26DWF
	98nGZ+ScM9zo69gWlXXHnv9tfY0M5BZ14p1lh6iCBYfFYLikTPyb6uZ+xDW5uUzhjsAP5WcXLle
	AxJjtfhMJtEf8vO4o+Tmsxh7E/ur92W4QnsZkmNX6x/l7T3O9oI3Beh54qKsDkkrTllLJPWSgAb
	gTGTTdVzfRqEPrCbZrBEXOxAnagKvK1p+gvCCAH6bEnRbMeHcO2WS8MZUlBx6SfnTSqk7Lc+/Xf
	NLKkUWVCd617AQQX2ynJV+ZmURWGNR+aqU5z5KSoN36fukzl
X-Received: by 2002:a05:6000:4312:b0:460:395c:7404 with SMTP id
 ffacd0b85a97d-460395c7421mr2318434f8f.20.1780671307856; Fri, 05 Jun 2026
 07:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605133541.22569-2-boqun@kernel.org> <20260605134935.B6C0E1F00893@smtp.kernel.org>
 <aiLgJkKzwEDGWNtY@tardis-2.local>
In-Reply-To: <aiLgJkKzwEDGWNtY@tardis-2.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Jun 2026 16:54:55 +0200
X-Gm-Features: AVVi8CcIvUHIO2p_9VW6ZHI2m65-lN84pQk89kmG3nnyyy__psHz_pZWj_Nq3k4
Message-ID: <CAH5fLgimUgbK_dVwq7RQimOugqJka2bM_u2r5S=3aze_8uCnbA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
To: Boqun Feng <boqun@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, ojeda@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:sashiko-reviews@lists.linux.dev,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63932-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16B9264923E

On Fri, Jun 5, 2026 at 4:41=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote:
>
> On Fri, Jun 05, 2026 at 01:49:35PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Critical] RcuBox::into_foreign drops `self` instead of forgetting it=
, causing a guaranteed Use-After-Free.
> > - [High] RcuBox::drop bypasses the custom Allocator A and hardcodes kvf=
ree_call_rcu() for types that do not require dropping, causing undefined be=
havior for non-kvfree compatible allocators.
> > --
> >
> > commit f69c06884595bb68a76f4f1dd4014ee9e2c9e31c
> > Author: Alice Ryhl <aliceryhl@google.com>
> >
> > rust: rcu: add RcuBox type
> >
> > This adds an RcuBox container, which is like Box except that the value
> > is freed after waiting for one grace period (via {kvfree_,}call_rcu()).
> > To allow containers to rely on the RCU properties of RcuBox, an
> > extension of ForeignOwnable is added.
> >
> > > diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/r=
cu_box.rs
> > > new file mode 100644
> > > index 0000000000000..943fe3e8974e0
> > > --- /dev/null
> > > +++ b/rust/kernel/sync/rcu/rcu_box.rs
> >
> > [ ... ]
> >
> > > +// SAFETY:
> > > +// * The `RcuBoxInner<T>` was allocated with `A`.
> > > +// * `NonNull::as_ptr` returns a non-null pointer.
> > > +unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuB=
ox<T, A> {
> > > +    const FOREIGN_ALIGN: usize =3D <Box<RcuBoxInner<T>, A> as Foreig=
nOwnable>::FOREIGN_ALIGN;
> > > +
> > > +    type Borrowed<'a> =3D &'a T;
> > > +    type BorrowedMut<'a> =3D &'a T;
> > > +
> > > +    fn into_foreign(self) -> *mut c_void {
> > > +        self.0.as_ptr().cast()
> > > +    }
> >
> > [Severity: Critical]
> > Since `self` is consumed by value here without being wrapped in `Manual=
lyDrop`
> > or passed to `core::mem::forget()`, won't it be dropped at the end of t=
his
> > method?
> >
> > This seems like it would immediately schedule the memory for RCU free, =
causing
> > a use-after-free for the foreign code when it later accesses the pointe=
r.
> >
>
> [Cc Alice]
>
> I fixed this locally by:
>
>     fn into_foreign(self) -> *mut c_void {
>         let ptr =3D self.0.as_ptr().cast();
>
>         // FORGET: Leaking it as a pointer, the caller is responsible to =
free it or unleak it by
>         // from_foreign().
>         core::mem::forget(self);
>
>         ptr
>     }

I prefer to avoid use core::mem::forget.

    ManuallyDrop(self).0.as_ptr().cast()

Alice

