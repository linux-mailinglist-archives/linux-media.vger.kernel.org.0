Return-Path: <linux-media+bounces-63258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL86M2eIHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:25:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135762001C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61694306E53D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7496C3A719C;
	Mon,  1 Jun 2026 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RpZTmavo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7533A48ED
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320140; cv=pass; b=BRkKKbz/u5gaA/27a3t+PZlKJ2h6DSvBRTSNw3vlJ9IBrhM+oOK4FZXsCDft6jgPkU+zm8GLJXui+gjwNSQMI32AnxdHY9QCT7EdZbMuzl23Tn6YMbSg8z98ljyElINMRAxClpZKhbznrEmXKOENfnQXxeh5Q/bDwIEjI4ZRBzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320140; c=relaxed/simple;
	bh=hooQptWzIagr10ERwCvMM3wIaAqGBRqHrg5Oq8PcGtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nweP5ZOpElsWWmyqlLL0D++jURD2/bn/WyR2oeROYpuy+pgjHQWPb95UNSn86Jtfvyd2FtXJD871nuKT9W7fNRlyFtUm+ENjVFgV2KXUN63IWKMs8eB75XDG9NuigSb3+Xystd7znbR9FreU9eUrIN+lyr9CHsNmyEjPzsizeY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RpZTmavo; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-137bd9ed2b1so984784c88.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320139; cv=none;
        d=google.com; s=arc-20240605;
        b=hUBeU67dzELGRrno3cI7monQaO/Hj8jsAxQpCSA8RUfOW9EKDbaDtTa/M1L3bjKmKm
         7H7CVsOODEI8R6Y0RmtXJZwUTX3+/IOZD6NLHrz3B0aVZPTjWl/VONER2idx389aMi7g
         37+8lPRlBoa4j9seHqD22UhBM8UJ7AGRNXzp+aHIbShMakkDr4IP9PDnzVJuREZG5N0I
         OQ/vCoNJndnScuNC5LgsnnjVmx7a29ubmHgryLhvq1YO0USebLgrm2zvRzurL3+7bDl3
         gCD56Bp1PuvPhIR9wZM7SJg+/wbKsJx7WkhH7x8nL4gVVCmkdy+TApai1Rwss/djTQnS
         LUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GdkOBdEWo+k8nIccYq3ePCwKTGzhNT9vQ5Dk5zhGNHg=;
        fh=VDsr/UZaFMh1ipMOr758YTT8cmd0dEZEYK2NvOP/NLw=;
        b=CUhIsevuXQP04aDs3y+E31tM5vQS60Y/cUkCGQHssfxOxWBfrXeVrPB2nwVHd0Sf+5
         lebnfzYBBXDBp1Bn0u/c7dVoSnQsHjCgFSNsoePXIW3XZ4ZfepB90/puV5AXDrdoPK7S
         UyYpMZHccoWtnsW3SO0tMUyKZHWiFgA5gEuDRj/eIt4qfITnnRhCce6AIOKVFGx2SP75
         KpW0btUpDEKWnCQPotClGLsm+jfT2ic2Dh/b7a1kFv2ppR42bei77FlZ9kY70f9QlY/U
         wyjS9hszcFShTqsKe+h4qZ9mdGas4ALMiyKWXJiT8YQOp4bdmKfU1nyU5Q1oy+5Kxfnv
         gyXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780320139; x=1780924939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdkOBdEWo+k8nIccYq3ePCwKTGzhNT9vQ5Dk5zhGNHg=;
        b=RpZTmavo956ZtrGLBURxCdltm1uxys/CS5K1PB0r4jhT7F96+mUxnJ3+lMLnZYb5Av
         Irh2F5CUNfBgfqsiCT1AEjX4AW2bzdK74kDWDBwlAAkKQci1k68eGNxHUsqlM3jcluJm
         pR46bhe7O0aDXbw9PDH9sRuNj0FswOj8FTSOoF9VgBfoivGejXTuUT0Sxj7Cq34MUB2k
         Ork7aJk1CzHfJpqpcmImi8tmWTcDDRXAD0CUU6wbniiMDUbuppc9bu7vLe5seDIJYv8E
         HlVPkcuAPfaD71oPjEMkDqhq9yZzCZK7mPFIECZnDToFl4XBNg4BD2091SA35pV+X+MJ
         DHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320139; x=1780924939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdkOBdEWo+k8nIccYq3ePCwKTGzhNT9vQ5Dk5zhGNHg=;
        b=INdj80k1yWFof0WWMOaeU2739PapGl24hlf/8krcM52nTAmq7SZxq8sG5vPnNYveVk
         exqIcgA9AMLIo81GojDVLs+4kCd781qwiBBeeDonmbWPaRAskRDUbZiCJ0DcYDonZ+jY
         oIa+9zLpgwXW9gr8i/QW2wkLQ8ft8d65+0kOW8Yja+8OlsnF9GGtaSr2Ud65tZ17y1XY
         cJXi/MTARCvDrOMJ6We2k9RMcRmqRkS+exINh29P4vPXwhNrb6B/BF0rS+ypBYEuc+bo
         psSr4dxNnaD+duEvz5lESPi5x+V8LsewF6HD8qZFmYMjh98Ppm3Eo6qhtvv8O/uXc5uA
         PbOA==
X-Forwarded-Encrypted: i=1; AFNElJ9DqY1mc57eDXOAgOH5theqT73yIvuRWRvIvaRDq5lytA6Dy1IFbSqTqVwRLsppn8MkYanq3OR8SAn3gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+hrQ5qhPrDrItdK2DRa7IJutFCvsyHpvxXBszJXc+feC/xc/
	1i1XSQWlCyt0jkb3aJsPeM/fXawAp+5C2dl0pByu5AuFBlrut+lUpfK7GvuKARI49w05sA0AY6H
	U7q9aHrRFjSyVzOexjtQDopW7vwrT6mvFg1F3D7xx
X-Gm-Gg: Acq92OGqvl6HCnRw9DPluxPG80oTsKRKuuG7Tplc7Bft3c5NPXACKchvSvK2ijGP8uV
	ii9vyPgabW4BaHfP6BD9Nke+DZf1AGJ0ZZPH1dfcR2GTfs8uMz/sGuFPa8sny2x2b/sT9bD/G1T
	TcrA17VJ007hyKPenEHe8jw1gyhThmQZWpl3g0Mgc92saf/kqx9BNHM2goZBOOv3ESVaPKK+Glp
	OGVrlBy6+qsM5/wL9YxqRjVkcjOFqcKQ3UCZWFCq7SdxgApzOD14F6cLWiw1yv6w7EsUy1sEomC
	gi5PN6Z3ZNozfNWmRU08badV35xOBshHWzwPZ8Di5yMp3XhERMP8l7L1yc52IojxDox7AnaIKW2
	dBWY=
X-Received: by 2002:a05:693c:2c86:b0:2de:cc07:e99 with SMTP id
 5a478bee46e88-304fa49ce00mr5489017eec.7.1780320137881; Mon, 01 Jun 2026
 06:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-5-phasta@kernel.org>
 <ah1glmXDM-OAKa5h@google.com> <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
 <ah19ZVkr7b3m7V_u@google.com> <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
In-Reply-To: <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Jun 2026 15:22:02 +0200
X-Gm-Features: AVHnY4LWfDXXY2MTx1DqLyh8Hxwl3ZS8C8Evk9p1Nisz1mt4W-Tdk9DBxhQXUfk
Message-ID: <CAH5fLgiZb5fqfXGQMicPp+UbBi3JMN8ZNG_Ldt5KiSk+btVCSA@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63258-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,zulipchat.com:url]
X-Rspamd-Queue-Id: 1135762001C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 2:47=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Mon, 2026-06-01 at 12:39 +0000, Alice Ryhl wrote:
> > On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> > > On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > > > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote:
> > > > > +/// A trait to enforce that all data in a [`DriverFence`] either=
 does not need
> > > > > +/// drop, or lives in a [`RcuBox`].
> > > > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > > > +
> > > > > +mod private {
> > > > > +    pub trait Sealed {}
> > > > > +}
> > > > > +
> > > > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > > > +
> > > > > +impl<F: Copy> private::Sealed for F {}
> > > > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> > > >
> > > > Why sealed? Just make the trait unsafe and require the things you
> > > > require from the user.
> > >
> > > This is far better. We definitely only allow the user to pass A or B,
> > > and only then it compiles.
> >
> > What if I have another type that I want to use here? For example, maybe
> > I have a struct containing a copy field and an RcuBox. Or maybe I have
> > an ARef<_> of some C type that uses rcu for cleanup. Then I must edit
> > this file to add support for it?
> >
> > > The unsafe implementation could be messed up.
> > >
> > > I thought that's what Sealed is for. Or isn't it?
> >
> > Sealed is for making 100% sure that downstream crates/drivers cannot
> > provide their own implementations. But I don't see why you need that.
> > All you require is that the value remains valid for one grace period
> > after cleanup begins. As long as the type satisfies that, you are happy=
.
> > An unsafe trait can require that sort of requirement from the user.
> >
> > I think what you want is expressed well by `RcuFreeSafe` from this
> > thread:
> > https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/top=
ic/Consolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/5987267=
24
> >
>
> I guess this is a question of design principles. If you demand an
> RcuBox, you have a guarantee that it's safe.
>
> If you demand an unsafe trait, you open the possibility for people
> messing up.
>
> Due to the unsafe-contract you'd have moved the responsibility for the
> soundness to the driver.
>
> I would not want to block your suggestion, but I am not sure whether
> that's really the better design idea.

Yes, it's a design principle. You are saying that if someone needs to
do X but might get it wrong, we should take away the ability to do X?
I fundamentally disagree with that principle. Unsafe traits is the
tool Rust created for the exact problem you have; marking places where
you should be careful is the entire point of 'unsafe'.

Alice

