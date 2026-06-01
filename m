Return-Path: <linux-media+bounces-63253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A3mGCaDHWqcbQkAu9opvQ
	(envelope-from <linux-media+bounces-63253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:03:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D440A61FC3B
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EDC130B32B4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8B837F8D3;
	Mon,  1 Jun 2026 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lt2HIab5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D937D114
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318534; cv=pass; b=dVQtZIdup5N/yRfAt5JSdEXrxKJhnpQBrbGzUX7YGl5lmBlBdtWaET4Yu5UVPphBtfNc/iJPcstb5deHoBZqS/DnSaRZC6c6CLTD+NK156B90rPxwmBVoXuVnUS+SGZFUtH48vKtK/sXKjtch9tL5uwa0DJIsLoF1davC90E3k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318534; c=relaxed/simple;
	bh=Ujk44KgH2bVgDe92f5eRLoMsj9ATbd2139QiPmqQ0u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7ANiULVnJ9Jx4gd1o0kkPEMzhkD1qk30o2YFqO5ohHcdd4ClnAnawBlcmCFvmPCQv11liXnC7qONaCH6y+HAzH2nUj6hh4qx4bHMGhDUbZatFIzB9KGLzw1WA1We39sFl3tgw2Bd+f8OTqN5lirhc/RGf5ZASCvGROzZlgsGyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lt2HIab5; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d8362a58so2600387eec.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 05:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780318532; cv=none;
        d=google.com; s=arc-20240605;
        b=H0gxHz9vUzoXtpNgoGVFXrFEHdlrjENfNcFWzN9tzHtKEHtt360A/vd3Tryi9D0aro
         BdxvD7WkqiBwXCuhYGTVBM+Bne949IHfAjzK5jAR/GIvc70qZyM9zYkkE1Qs/7y1NO3W
         5jG3trXq0BGustWIxZRzKp6LP/kGeAMPvbbAN3YYGE97ouIqYwDHkYxSZuUso42AAX1S
         dxw2DKHZFfHbDeTuz06+tJ7SS8Ah6e3NuczvZlzNQNHGXDMP7WNxpsk6LbUmRIXYOweg
         vhdcV1UdZvcltDJBLa8L/15LjzqD2u3aSow26IFPB2RkTuSYG0Numq5agbA5nR3k9khd
         eZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WNejM85KWAcefPz6v9xEkmaQJmPlaeAZyMFSHUG5YSM=;
        fh=aLeRe5hmQD1bbbV7WkUmx4DKYM0mQfEx/YqGae7WIhA=;
        b=UWR9D3agyrE+tEkU7nANoJQm4KUIKodLzNzWMrYNd21iqWJV5+PktsYOktBsLUh5a1
         sKL2xAbHfkTeNDyTVd1llM+nOtNTnjSy5cbokZ2Vab1lF1NrbuHiM3j3h0uijArlg2tl
         AYtYSCvPFEcaSMDcS7UqqFmzXgGzPlQTiXoFTMZVvbGfndpq/wonn1CKZSt9KCDkSbMT
         1uluVy+4PhR7JX1g54YozUzkEK0XQtfjB5NAHKo9vFcpOztRbCdJLlZqnTunzRqKc8FG
         m+cl5TWKrsBMqSU06McE+Gfx7UzzSj5fobrF0X9uJmXndJDKHzz/4zQU404aT7/+Pq9y
         4HAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780318532; x=1780923332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNejM85KWAcefPz6v9xEkmaQJmPlaeAZyMFSHUG5YSM=;
        b=lt2HIab5Z4HTbpb2EpX62hWMtJmBQTFM0FPgLrupvqWHCjOn8kwtxgctoplwZMt3eS
         T+nKUpl3TMFVvMHOiK8798Ao5Tdoenqup1/W5xDObdms0iEqqTozHGZSmOyUheHZlhx5
         Eb+69DTuhyh4fqgfo2hDqWmYoBM429fKk7n1ry3Cp+QtF1KXOcnzPUL2Wdx9l1TRIRiq
         RIafjIn8uXxezhrdqEpPrf5pojtyo1f45QSVg54GHtcHil03BZfBEm2wqwBTAPH0f/qL
         KlQbMLG5KjG9m/MhQ2ghM3HQwo3t3+P9M6gtQ2St1k+9JhY/XJCt5dQyPwIkv2sT+Ygi
         YGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318532; x=1780923332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNejM85KWAcefPz6v9xEkmaQJmPlaeAZyMFSHUG5YSM=;
        b=CMGPyF9FFVongMarcXcT8wkG41LokD0k2Dk5Mswi9OonBQdLAvz8of7HBaxAHSZtZv
         RJqHg9Te2eTS0olPaNNUZ1gyANDf+TAjdNZwjzUW1S+wUFKf3YkH07OLP6dUEKqCQZxS
         pjs3ivrpxBhw9Th89Y+TFEVMnhRAiHin82SAfUQdGHcOcvu05/AapATKxhIXN61w0u8j
         IZs5Jozqq+xIHhk3w8O3ZsL+ig4s4U8b/oC6eQ49OvnGfvsKKuHUCA1gvtSYnJhAHnN7
         94jyBCQyMUYmcNWbvHaHLAD19w/ezkOLbmUZkokTBOFkOauEMP/RgcxAcRp2YJSSWU4f
         sQgA==
X-Forwarded-Encrypted: i=1; AFNElJ+DDNH7YQy5Ov6AKp9A/lfh7BUvQ1ISEDxmEBLvMlxDJLPmA+FqpCOJqdQoRScw7hw8GfwPgN4xbrSflg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39koVWQlG4YLciDmcGQbt4VMwk/Az6sUeR/qcQmqUPeIOLBFl
	G7lx/PsV/RhhgtVaWtp1drrwL9MuLsAn8P77SKn7uBXjTAVsz8+wmSuEYA82Nl98kIgJ/uxbHUd
	UVtkjhBW1Lv5jO3ZOmyzg+xahcmCxa0cCOdttZ3FKMrj/fR9mUxci2+TM
X-Gm-Gg: Acq92OEgZOiVKPXe6lAaPo1GpKZktyh6Qm+zJiwWRUhNtbobvMir36BrXFpeKtAfw2v
	3uPRn253Uls8p91hK6pu44y0fZLXOHpD0xRAoGd3F3LZGn1yV6yCdC8VxMzi9nxEm3xySzp1H4N
	WXlmMSjHjWt7g/eKVkTyj4R6pi2bwvh6RzFpSNlUnIHtd3SvDyAf9a385kFho+w+f01LKz0cfL9
	DUf/0FpjAbsTeaQfksjX3q7f3KvKW8eMz44ymtS2T8V4PkiqPhSGHBfJtVzC1efjkrh5pK96VvZ
	JbNTCnZUSqfDLRbnjDGY+5m0SquyMsGJTwQj065rmxJwF+TI31gvC3gMtSrVnTeEyaA4KMH6czy
	pask=
X-Received: by 2002:a05:7300:6d05:b0:304:56fc:775 with SMTP id
 5a478bee46e88-304eb22df94mr5484000eec.21.1780318531224; Mon, 01 Jun 2026
 05:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
 <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
In-Reply-To: <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Jun 2026 14:55:13 +0200
X-Gm-Features: AVHnY4J-ueyqGc_G8kHaNFpi7cKxrffiRlZb66bvjWAY4qKfjT8pJ87FnvEaeD4
Message-ID: <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-63253-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D440A61FC3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org wrote:
> > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > > > +        // SAFETY: Valid because `self` is valid.
> > > > +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };
> > >
> > > [Severity: High]
> > > Does this create an exclusive mutable reference to actively shared me=
mory?
> > >
> > > DriverFenceData can be accessed concurrently by other threads holding=
 Fence
> > > references (for instance, when checking if the fence is signaled). Cr=
eating
> > > a mutable reference (&mut) in Rust asserts exclusive access and viola=
tes
> > > aliasing rules, which allows the compiler to make invalid optimizatio=
n
> > > assumptions.
> > >
> > > Could this use an immutable reference &*self.data.as_ptr() instead?
> >
> > Yes, please use an immutable reference here.
> >
> > > > +
> > > > +        fence_data.inner.inner.get()
> > > > +    }
> > >
> > > [ ... ]
> > >
> > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > > > +    fn as_raw(&self) -> *mut bindings::dma_fence {
> > > > +        // SAFETY: Valid because `self` is valid.
> > > > +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };
> > >
> > > [Severity: High]
> > > Similar to DriverFence::as_raw(), does this also incorrectly create a
> > > mutable reference to shared data?
> >
> > Here as well.
>
> `data` is not shared. By design there is only ever one DriverFence, and
> the driver's data (`data.data`) is `Sync`.
>
> But I guess an immutable one should do the trick, too.

There's only one DriverFence, but I can perform shared access to that
one DriverFence from two threads in parallel. You made the type Sync,
and this is what you are allowing when you do so.

> > > > +                bindings::dma_fence_signal_locked(fence);
> > > > +            }
> > > > +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr)=
;
> > > > +        }
> > > > +
> > > > +        // SAFETY: `self.data` is owned by the DriverFence, but co=
uld be accessed
> > > > +        // through some dma_fence callbacks right now. Access is b=
eing revoked
> > > > +        // above by signalling the fence. The DriverFenceAllowedDa=
ta trait
> > > > +        // ensures that the data either does not need drop, or if =
it does it
> > > > +        // lives in a RcuBox which will delay dropping by one grac=
e period, hence
> > > > +        // ensuring that all readers have disappeared.
> > > > +        unsafe { drop_in_place(self.data.as_ptr()) };
> > >
> > > [Severity: Critical]
> > > Could this eagerly drop FenceCtx and user data before the C dma_fence
> > > refcount reaches 0?
> > >
> > > The C dma_fence object can remain alive as long as consumers (like sy=
nc_file
> > > or the GPU scheduler) hold references to it. If the backend later inv=
okes
> > > callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() wo=
uld
> > > attempt to read fctx.driver_name from the already-dropped FenceCtx:
> > >
> > > FenceCtx::get_driver_name() {
> > >     ...
> > >     fctx.driver_name.as_char_ptr()
> > > }
> > >
> > > Can this result in a use-after-free?
> >
> > Hmm, I don't know about what sahisko said, but I don't think this is th=
e
> > right way to do rcu freeing. I think the type's destructor should be
> > reserved for cases where the value becomes immediately unusable.
>
> We could guard the strings with RcuBox, but we could not then guard the
> FenceCtx code against code UAF if we don't have the rcu_barrier().
>
> Or could we?
>
> If a rust module unloads, module::remove() should contain an
> rcu_barrier() (right??). Would that be enough to guard against the
> FenceCtx code being unloaded?
>
> >
> > For example, let's say I'm using RcuBox<_> here. Yes, the data you get
> > from dereferencing the RcuBox will stay alive for a grace period, but
> > IMO once you run the destructor of the box itself, the *pointer* become=
s
> > immediately unusable.
>
> I don't know why you're stressing the pointer?
>
> The trick above is simply that drop / dealloc *and* code unloading is
> delayed by a grace period.

Sorry let me try to rephrase. I'm not worried about the stuff behind
the pointer. After all, you're using RcuBox to protect that stuff.
What I'm worried about is the pointer itself. You invoked
drop_in_place() on the pointer to the fence context, so even though
the fence context may be valid for another grace period, the *pointer*
to the fence context is not. The pointer could have been zeroed by the
destructor.

Actually maybe I am worried about the strings too. Let's say that one
thread does:

rcu_read_lock()
get_driver_name()
// .. read the driver name
rcu_read_unlock()

and another thread signals the fence. If there are no queued
call_rcu() callbacks right now, then the rcu_barrier() could be a
no-op and the rcu reader will UAF on the driver name. It looks like
you need synchronize_rcu() rather than rcu_barrier() here?

Alice

