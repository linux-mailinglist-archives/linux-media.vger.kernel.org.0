Return-Path: <linux-media+bounces-63643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JtMVJpxmIGoD2wAAu9opvQ
	(envelope-from <linux-media+bounces-63643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:38:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F8963A358
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:38:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XZ067zuT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63643-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63643-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9C5B3019105
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 17:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA49943E4B1;
	Wed,  3 Jun 2026 17:36:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABD3783C1;
	Wed,  3 Jun 2026 17:36:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508183; cv=none; b=cObdSbl9VtUuNaJ49etSpqlz5ED+Zl+2guWVcCPziGA33Jh39eEDaIGMtHOcda7rKweRxt0NCjeVwvcxouLnH+xIF7iveI7XUbh7Z6OGVZWeG1bQOYBFoVJYb/B4g32y9W35+MIKB3YvAx46HKTxBHKpy4pqcWSEwA0HNIRifHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508183; c=relaxed/simple;
	bh=5kE1Z86aEccF8JZhurwzjiMhwyWBy34jLUiIDgWMOtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXnjjSVweAuMmXej1tNFJG2B0f4vUeGW4P22GndG6xpDzuoQ45dUpk3WxLoB+SEz4S48xoIXxqedv2JiaYcX89jxuGrurKi9mgsSpPaJP734XcZy2Pokfvg0V/RI6+2cN96lKIkloBzWYXD8Pbq9r+ripQBUGk50hJ+OkKecnao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZ067zuT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9C61F00893;
	Wed,  3 Jun 2026 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780508180;
	bh=W0atkC16En4IZdbZdsjQCqRJTQ/DFbwkWu7nB7JU7rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZ067zuT+zSmlyt0tNWWWAEVuaJn7eTw7avNuL3/EmI7L9S1qYOEJMmbxyRWKf4/+
	 72RW1kYzkbFCwPm8Qv2V2g3ZWizE9yxMLJdT7eQYc06e3zURBiPjwkQFnUnngfBncS
	 fL0jjihTX/tcRtfA5oCT/ucF3Xx/a/hJutUrCB9oySrWa4fMW2//yzHkFf0kKs3RWS
	 vv+M/tJ/RMHF3uDbTVttVpEaQ/6pTZgLVg33mnGLYAqrSqFObJsGSSSlgnDDi49QAo
	 5Afv3HdavgVTi+IYD7GzlGAINWmb35tZthHr7ZFE70As1Mz+GZldi3k8WJrrsk9USK
	 r19J54EdelY2g==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 00F26F40076;
	Wed,  3 Jun 2026 13:36:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 03 Jun 2026 13:36:19 -0400
X-ME-Sender: <xms:EmYgakmDEdhpTVl_WevR5FD2XgK8yHnavi6_-lejRvlqtVxcyrD34A>
    <xme:EmYgagmmGa__kdlLlByW8q9iaLSrjoYHsMhpnRzkuG7P0k6XN_CFBBvKbU1s0TSeL
    CaIc_OYk7q_w-GpKeUVhe6xLQf25U34QEpZpAOdZ5bBhtaadDL-7A>
X-ME-Received: <xmr:EmYgaiOShT93iIwSlKdA5xiXK4_XcvBxd28PYRZ8vs5RYoKsNuacHoO-Fvo>
X-ME-Proxy-Cause: dmFkZTExiAM4S4b6rbDBhYcsipt+WIcQ6U92Lpa8QXEozbKBUuNKniuqF8nLee6VGz/1IM
    wH6MVeq3StWv5bWz4ExZ/72JO0pdsE/ERKzl1Iak6MH3IHVKCisb2zKFOiWyK1VU3RoKDM
    9OnABto/ClwFrxe0LbbCc/Urw/R6p8Xjq28WIPem4wxbpq1/FJ3pE+iZS5/fH9BBNpEK0k
    Py0InZHQ+GCPlEffJv06Lhqaxtlhb82z+KTZACF67znSkQXHpsH9PhF/f5iO6JCaXaJL9C
    mfpvi8h/iV12rJIfTbMWXQgJ8TrK2rnhiX7vmT/FZMuXUIsxVNaxup2eCLx9K5GzlGY9bq
    7W0aE11bk31uSLtt0kamnoXI/FseX6YWbA0HCpgFi/yp2k1iT5hz5rZQVW/vNPaHZsa+Gk
    Gi2rQ1Pjw/iWKAb0VSccByuRxHo58Y0r4u6Ra9htuCzrz7kflCTBMjnwhg88aPL4AHDFSM
    UxNFI3WeQPpPzCEzDf2pOCWqB475UqLzKUu7a9dVnSOX2v/yF87QF3iLuhU45iwjLslLkY
    EdkAKhG5/QK/aWZjzR0NQ+M6lBaaPVpzjcr+q+RfYtHue87beXg7Q2cOJeZYMpL+Sdc5EX
    pFXxEXoo5A6YDWE1fAsvBcpZQigub9OcACkAIUgZPkJJnKUqWpchmmlv5KuQ
X-ME-Proxy: <xmx:EmYgapMF0_L7rcF8njCmaB8Np2WhsRwIUyPwh8tsG9nkbplnj7HguQ>
    <xmx:EmYganHUyR9F7eLuQ6I1T3DUUgWD3flki5o_JNttRj4Jaqqc0WelqQ>
    <xmx:EmYgano-0gjNnHZcUEHJRktEzt6deD11ds10nYaz0fK8UP8h29_wNQ>
    <xmx:EmYgak8ksADbxYFMj44ImNygib9jFYCpnzUlT_eoPSlHJWElAY9pEg>
    <xmx:EmYgaoQZqpT6gnp3USQITMG_I8BoTGRAa-cNGbBns6qS8R3RaX6VCDT7>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 13:36:18 -0400 (EDT)
Date: Wed, 3 Jun 2026 10:36:16 -0700
From: Boqun Feng <boqun@kernel.org>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
Message-ID: <aiBmELaetTWXcmhu@tardis-2.local>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-4-phasta@kernel.org>
 <ahr9gtzQLSbPeBx_@tardis.local>
 <e8b16f3b40d42f3b0a8814180fa9b06f82c9d901.camel@mailbox.org>
 <ah2L-TMT5UHSd_Hs@tardis-2.local>
 <441fccce521857ab82b84bb8e5ab539ee3810a36.camel@mailbox.org>
 <aiBH95n4HqrNtgtz@tardis-2.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiBH95n4HqrNtgtz@tardis-2.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63643-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@
 gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tardis-2.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09F8963A358

On Wed, Jun 03, 2026 at 08:27:51AM -0700, Boqun Feng wrote:
> On Wed, Jun 03, 2026 at 11:33:27AM +0200, Philipp Stanner wrote:
> > > > > and Philipp can use the `RcuKBox` in this patchset. We also need to impl
> > > > > InPlaceInit for RcuBox, but that can be added later.
> > > > 
> > > > So shall we merge my series with Alice's patch, and later we add your
> > > > patch and other features, or would you prefer to have the additional
> > > > boxes from your patch from the get-go?
> > > > 
> > > 
> > > I would like to have it from the get-go mainly because of RcuBox vs
> > > RcuKBox naming. Thank you!
> > 
> > Fine by me. Just process-wise: how should we do it?
> > 
> > I could include your patch on top of Alice's. Would be a bit more
> > consistent regarding the git-workflow if we'd squash the two patches,
> > but then you two would have to agree on authorship.
> > 
> 
> Keeping it as a separate patch is fine by me.
> 

So is squashing ;-) Whichever is easy for you.

Regards,
Boqun

> Regards,
> Boqun
> 
> > All is fine by me, but I wanted to ask instead of just do A or B.
> > 
> > 
> [...]

