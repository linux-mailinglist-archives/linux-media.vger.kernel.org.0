Return-Path: <linux-media+bounces-63246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFyWKYB9HWrEbAkAu9opvQ
	(envelope-from <linux-media+bounces-63246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:39:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C9061F67D
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 609EB300FCA0
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5874A37C918;
	Mon,  1 Jun 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XnyElmHF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D636F917;
	Mon,  1 Jun 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317458; cv=none; b=Zdj3PgxDQZ7Z478gd6FJem8p3d3KtHMD8zA3Jwqx2sIfrIG/lPryL/++xe5JyU9IiPkqwgs0XxwGH6p0CpEItzDHiW9ipFHKKwei4kPC5k3V9EwVKy2ArySOg4y1xC4ykRRi/uyl5xpBOpYdlRGhXx+yQ/+ivWUL37OzdEl+Ot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317458; c=relaxed/simple;
	bh=lCMKu+lhX2bTzCipYgh6dta6DZyvx/qQ1u6dRlK1K4E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdUYsbgV5m7/TFTMLUPE5VOOmDO+0CjQpPER1wSxz5YhQ+yZWrfwDs1rl+h/H6U9uV31aBbEF5qTyyhFxO/7gQd+UfuunXMbw1942u3bCkXGq5tPnyTECzgBlK7DZxkfWZ7JrlL8QP2zFuhrRDgJh89a05jeZTUWajsET+FLVoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XnyElmHF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780317455;
	bh=lCMKu+lhX2bTzCipYgh6dta6DZyvx/qQ1u6dRlK1K4E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XnyElmHFMDTdTGNIVEtlzzXcVa96Pc6E3TFbveZ7Xy43MHe7mvlNCENHMeWAYhcfM
	 T/xO8js/ls/ibuWbSAxw0j5LwLDsB8sD+olEem9Oa9FnP3B+3BmMyZHg05XOhtyttW
	 rp0OSxHpnjLCmsKLvb7P3Q86FISKXeTbffBMnPNOSb2hQtfljRVKANWsWr+tXqLd2A
	 01sPSCmyV1rKnQphZ3/iDNM01dy5gxcjhPqZC+WbVRRIpG6pfCaRyh8Cha3clR4S5b
	 6eThizeXVvNphYm5A6lDyKdbZTmn5ZVBvYz2JPBtTcfiGX3fUmGBgQTY/NkWAoGdY9
	 Ao+OIZFyMS/aw==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99BE917E052F;
	Mon,  1 Jun 2026 14:37:34 +0200 (CEST)
Date: Mon, 1 Jun 2026 14:37:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, "
 =?UTF-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>, Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 rcu@vger.kernel.org
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260601143731.71c0f883@fedora-2.home>
In-Reply-To: <ah1glmXDM-OAKa5h@google.com>
References: <20260530143541.229628-2-phasta@kernel.org>
	<20260530143541.229628-5-phasta@kernel.org>
	<ah1glmXDM-OAKa5h@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63246-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fedora-2.home:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:dkim]
X-Rspamd-Queue-Id: A6C9061F67D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 10:36:06 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> > +pub trait FenceCtxOps {}  
> 
> This empty trait is unused.
> 
> > +/// A dma-fence context. A fence context takes care of associating related fences with each other,
> > +/// providing each with raising sequence numbers and a common identifier.
> > +#[pin_data(PinnedDrop)]
> > +pub struct FenceCtx<F: Send + Sync, C: Send + Sync> {  


BTW, if you define a FenceCtxOps trait, this should be:

pub struct FenceCtx<F: Send + Sync, C: FenceCtxOps + Send + Sync> {

