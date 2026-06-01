Return-Path: <linux-media+bounces-63260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNdCNcSIHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:27:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D9B62005F
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19E883013860
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EFB379C23;
	Mon,  1 Jun 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PIJVNL6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E03A6F11
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320444; cv=pass; b=dA4asXSPQZvnu3qJeeL8h5d+Sde0tqKrteftQOEFPVe6lGTJIn/J32caAMiRTfLFVt027Nh5MW0/lNmYlDniSPV20ypAaNTUcree/ErSnvciD01HFsck0Xp2adMXe2yAUyE4mdwE0ZnRpYTw5Guf9UGBvsJ9HEhK9w99qk9tm/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320444; c=relaxed/simple;
	bh=0DHOe9b8avRmAIwuEFXwH9kNoZgOYx6xrIy5spz3Blk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAtnQR8Dyqr60Tp4zCYiwOgYN2MsFIuioiZ2r4obvSFbOkSkeK5cdurt8FCyoTveqQ3lz09rgD72pmQ8OaFebZ8cpb59Tmsk6FZdzGQccp57o+iUGPlAjGdpFro9eiZ1DhuldDgAV6qBhLLtLYd4kkSpb1p4n8OC0WJl05hil3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PIJVNL6Y; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137d452574cso2984553c88.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 06:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320442; cv=none;
        d=google.com; s=arc-20240605;
        b=Gj1pTN5KEpngq1/NQPARakYZCecy91qV0qKnuQKwrOeN8QyIF8BkBtKzCyshGXnST6
         hI82Z6sAuZqNIT54ccAS3Hamx7TJmvxyEbBLmdHCmOgvKW4F8EpFZ4sQrhA3PT54a87B
         1dX5nTzXsa73Ckt3g7nfSrm79k1kC4AIx30T2fSsqLHtiEWlOzcf9Ofmb2OD2ZPnII/p
         BJh4AfvIulYLF3T3mmgZK5nV/Ur5aWXqOEeQt99mPjqN8zWvK+l8jY3V/8NUUhKxbIpP
         WKM3TMGvUw311r+NhFGnuC9n98PBACk3zpcsmfTFrsZJbKxL1AexjHiLmEhDbrEv7O6u
         6teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ri49UqDlI7T6GkNPLNf+vktr0M6I1uPdwQQUuW9VuW4=;
        fh=qY0qtDOVYCNi9OqtaDYT/1+pYRxFWFZuORRIxnrrtZ8=;
        b=jd+ROW4ofC035q2axFaEZcToi9zhjuDFIA4XONXESOJcWgZS96+eQ9Sw65vt91zuuq
         6WxF7LbDp2MwpaIDeYuO//0mEa/RoLTagTOukhFx51Bq82l5UHZlpOF9Pc56WHGPVR6p
         ES0xkRZagygDJ7ZgMJmMf66o40j3HM/HzsC197N8TFOqAKxs7NDXg+YPLCRyc/Vy5rDE
         tAlFKxbztlbN4SF40hPAT+9A+93spKSf9EHIddxxhDvg6cBCRZvRnNgTxIEEyZ3ftHpP
         FHjEGn+PaASBDceJMd7RfFhH76xhTENjtD0AyCuh4E6kTrTz8DOb7VcsvG6XCY17YHYe
         DWRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780320442; x=1780925242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri49UqDlI7T6GkNPLNf+vktr0M6I1uPdwQQUuW9VuW4=;
        b=PIJVNL6Yg1pM/611/nm5MHUW3g4YZR5NvyRGwqcBG4Rdcz6o4qO+l520CcFX6ajtDq
         f8Nl+jZAOKTn8qxhXgjdMyX0tg00GXUz7AGs0d9hDPDuMzq21czi5gwcT0k/HUXI9f5I
         uHDccF0bzD188UskmOvITNiTjOXIbB0Mhfmy313ZQSiOJJyFsfrPOmKp0cB3EtYHy2Ix
         okMPDPSrdfD/iNZx5xOjVsLKXe98wVs8HouGwP8rtvB/Tfk0d7CdzfzlaLHzCxQx275b
         B84LP/t1aru0U2rw4c3hLcmW0HcTFszNlVX5QDwhbRjYF/JtjZkCwG9sS4Gbouh5X2Nu
         r5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320442; x=1780925242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ri49UqDlI7T6GkNPLNf+vktr0M6I1uPdwQQUuW9VuW4=;
        b=mRw3dz7IwmgQkIHC7yTtfsV26+ANth9LTCX+LdIeOQ+v0Xcx4s8aBCuPdmX0KpE7wK
         vbAoh/mOF0CYBN15ci/qDOpGweBZG38jvs80CrWkiGHB686CDfyxJqTXNczMkpODh5WI
         otqcOt7wDnREg4Vz78O9SwosFUrv7cYoO2VefXjjhZRjivTz/j38EdlfgmgdjwddNYpO
         WXpn8GsiYfW1RwqbHaWXlkfZIm0b0Vw749TcIiH5047Oa3cnA1c9gSUgA6sLqwE6dsLs
         MTpHExUxA4B4n8TT29yhA5YAsxXdYvao1I1X0osdtc9Zn+P1N0NpXCGW3Kmu2o0t7Sg/
         R5Kg==
X-Forwarded-Encrypted: i=1; AFNElJ+zISo7iiPtT+Ucbs+lOk6q+XYqA2mv3yd+AnYGkCk8O5/djW/jldnzAlSdFg9o4lGzHvPmU4zxlB/A5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZjauXvoub3/VvFVHVtX9joFqw+r/GUWFrn32getoYhlxpu+t
	308tZ4K4daSF3A2+FQCB1Xq1Nec1WE2hxblq+YrblEB18mzGevXT2Z7dDFJYYiQjzaNQrYbP+yV
	4bgAHD5QVijMzU1eDGkwP226GfZQL2eanUMl6EpZB
X-Gm-Gg: Acq92OHpme+60B4orT8cMnpFIdl7K2+RJsHh8Cgj57UII+ax4M//imfnVvaVAef9KQR
	+J8NGN3K0AA6auuizQnUaqoSwdIx2PzwA+ZVSnIloq8pAWoGgQjLsAXZMydIXT5+hK7pSGSGUZb
	yM4D5DiNAJ+BAncGHxiKHHm9ukTsXdUCFhYQ/vk95P6PT/6PK0yLMUDAHbTqVFzsDGxh2Li3vgf
	a+KZIV9b1oYcYhR2xUd4NZm06zgBVudIBtb9jlu8thcNvcLGCiKEw8LX3gLmg2CNiIdKYx862i/
	X5vOY7J/SrwD6P1GWkEJPN8j0VwmQHQXAzjivmqra7/0alE+wzxKUTrUY1JM4P7nC7FhuUZB96v
	ZKGA=
X-Received: by 2002:a05:7300:2201:b0:304:d8cb:8424 with SMTP id
 5a478bee46e88-304fa546886mr4919952eec.9.1780320441610; Mon, 01 Jun 2026
 06:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-5-phasta@kernel.org>
 <ah1glmXDM-OAKa5h@google.com> <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
 <ah19ZVkr7b3m7V_u@google.com> <3b216f24afb406b797b8bbb73b3f5c0eec2fdc6c.camel@mailbox.org>
 <CAH5fLgiZb5fqfXGQMicPp+UbBi3JMN8ZNG_Ldt5KiSk+btVCSA@mail.gmail.com> <3829028571be1886b99018040782ef94369b9523.camel@mailbox.org>
In-Reply-To: <3829028571be1886b99018040782ef94369b9523.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 1 Jun 2026 15:27:06 +0200
X-Gm-Features: AVHnY4IJXBoMvh-rw5Yz6dkN_FCzB34R7ldudBtNs3IR1XQFjKtmqNv3cEC-Bt4
Message-ID: <CAH5fLggFHp6bLZ-g8aTQKY_sHRJ0aEmB+-2XWG3RMS1yBXO+8A@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63260-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zulipchat.com:url,mail.gmail.com:mid,mailbox.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 76D9B62005F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 3:24=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Mon, 2026-06-01 at 15:22 +0200, Alice Ryhl wrote:
> > On Mon, Jun 1, 2026 at 2:47=E2=80=AFPM Philipp Stanner <phasta@mailbox.=
org> wrote:
> > >
> > > On Mon, 2026-06-01 at 12:39 +0000, Alice Ryhl wrote:
> > > > On Mon, Jun 01, 2026 at 02:26:17PM +0200, Philipp Stanner wrote:
> > > > > On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> > > > > > On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote=
:
> > > > > > > +/// A trait to enforce that all data in a [`DriverFence`] ei=
ther does not need
> > > > > > > +/// drop, or lives in a [`RcuBox`].
> > > > > > > +pub trait DriverFenceAllowedData: private::Sealed {}
> > > > > > > +
> > > > > > > +mod private {
> > > > > > > +    pub trait Sealed {}
> > > > > > > +}
> > > > > > > +
> > > > > > > +impl<F: Copy> DriverFenceAllowedData for F {}
> > > > > > > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > > > > > > +
> > > > > > > +impl<F: Copy> private::Sealed for F {}
> > > > > > > +impl<F: Send> private::Sealed for RcuBox<F> {}
> > > > > >
> > > > > > Why sealed? Just make the trait unsafe and require the things y=
ou
> > > > > > require from the user.
> > > > >
> > > > > This is far better. We definitely only allow the user to pass A o=
r B,
> > > > > and only then it compiles.
> > > >
> > > > What if I have another type that I want to use here? For example, m=
aybe
> > > > I have a struct containing a copy field and an RcuBox. Or maybe I h=
ave
> > > > an ARef<_> of some C type that uses rcu for cleanup. Then I must ed=
it
> > > > this file to add support for it?
> > > >
> > > > > The unsafe implementation could be messed up.
> > > > >
> > > > > I thought that's what Sealed is for. Or isn't it?
> > > >
> > > > Sealed is for making 100% sure that downstream crates/drivers canno=
t
> > > > provide their own implementations. But I don't see why you need tha=
t.
> > > > All you require is that the value remains valid for one grace perio=
d
> > > > after cleanup begins. As long as the type satisfies that, you are h=
appy.
> > > > An unsafe trait can require that sort of requirement from the user.
> > > >
> > > > I think what you want is expressed well by `RcuFreeSafe` from this
> > > > thread:
> > > > https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/Consolidate.20.60PollCondVarBox.60.20into.20.60Rcu.2ABox.60/near/598=
726724
> > > >
> > >
> > > I guess this is a question of design principles. If you demand an
> > > RcuBox, you have a guarantee that it's safe.
> > >
> > > If you demand an unsafe trait, you open the possibility for people
> > > messing up.
> > >
> > > Due to the unsafe-contract you'd have moved the responsibility for th=
e
> > > soundness to the driver.
> > >
> > > I would not want to block your suggestion, but I am not sure whether
> > > that's really the better design idea.
> >
> > Yes, it's a design principle. You are saying that if someone needs to
> > do X but might get it wrong, we should take away the ability to do X?
> > I fundamentally disagree with that principle. Unsafe traits is the
> > tool Rust created for the exact problem you have; marking places where
> > you should be careful is the entire point of 'unsafe'.
>
> I mean, fine by me if the others don't disagree.
>
> But when then do you ever really want a Sealed trait?

Sealed traits are a very niche feature. The main use-case is
forwards-compatibility. It's not a breaking change to add a new method
to a sealed trait because no downstream crates could implement the
trait.

Alice

