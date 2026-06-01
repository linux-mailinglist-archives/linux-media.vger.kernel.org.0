Return-Path: <linux-media+bounces-63230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBHxFD9XHWpLZQkAu9opvQ
	(envelope-from <linux-media+bounces-63230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:56:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E390361CE2B
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65513303E23D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 09:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC09391833;
	Mon,  1 Jun 2026 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Df+gsVdw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CB395ADC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307171; cv=none; b=VyVWSNUbMundYkOyI9NbMPlqvR+luKCt5qVZdLYQG9n+GJNenz+92v2yhtoRPx/IO0gSBMWhVz1rMYXbCoOw+VFlx85vT/gJo5hnPjxH8mk9RrjKzDlShtcPyylfciDVX0ACGtN+juJhV4KOj0325cnnR8nplDkxPL7Yu9jMmBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307171; c=relaxed/simple;
	bh=cV18jvtNXIodO6tysPsBXW0X3xVvWrtNzux1ufx6488=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FmiTAHIuAUrC1U7DC1Red8e4uv9W5ipvViK+uEJnBlSTDw+xOnu1A7YgeaFLfsh1ms3P6q3YOnVqCG4msAma3RAy3BV8k0AB32pYNs0vae3EqPgR1DS3wSh1jYVdNevTFxD+KtU3q/dgj4QcFyL2PMO5zKdWahWweOfAz4tbuKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Df+gsVdw; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bec405b1c6fso92982466b.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780307162; x=1780911962; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2mLiP05KImuXhLYRlm3itUuIPBG7j9sX+uByjRaID4=;
        b=Df+gsVdwnaFnn3ZIHTyclLRbocaC0Vij9gUEXBbEsqwia8hx88vkEF6PrH925lg2F4
         TNkNWB+rjEQ85OPUwZMIbeilLRRRm14mpIG9XQimhC4/GyBjiJxX1Aq6e0IjJGdhoaXQ
         9RuaIevv3hHB2IozWJsYLF11si7iA7x1zS18ujoIoDAfzCEcwxt9UKFWEJEq36f/xzuH
         Unqlf+CvnkFLsRaKk4qu5Lw1T7bUOU/kOBwZ4Po9HiGaTEte9T1rFXm4IUUrcTFF0/NX
         r1QWy5Y/KUoYfUZcBqBlklb8mSemf/5OM6lWVqyNBvGgO0aFoiVE8tLrjCFBVdF1Ijei
         PGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307162; x=1780911962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2mLiP05KImuXhLYRlm3itUuIPBG7j9sX+uByjRaID4=;
        b=l/046CRAHQQ5WjUANcf33dUb89lQ4dzw0928Wq9OSYvkV3rMN6V8KSm+W6Bm5muZUs
         0aS64bMM5QnesLb6qx72Ix52vVhqO95fSvZ2uAqcA8vy+rl2rGzN8pFdjz1u9PTSNbQc
         qjSs+w3xMvod7TNhnh2qM0/3x0NDKFumoTedFNNtJV2SeH1g4J57kGL+6OTbf3ldGgQ6
         uy1P5K4JkPXhGxh8C+KBqPqMHgwctoPiYPsU6zgcq5fbJcVaz8ntiNpW7BJi+sQRhy0W
         D3FrXogLeaCyyMwi9v7/w8mpQ3tp4BNgJPl6YbBArNPM7hJfJRkgLbBJaU+YeDQIofR4
         lm6g==
X-Forwarded-Encrypted: i=1; AFNElJ9UYAe4HNZ4JvSNE0bpX4XlHWhXkSDQ7iwiDBOB/p37vsK8s6nRO9noWoE9e1XupznNdgdI6eQUt6F9AA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7SFB0Fa7bn3bLD/Tmqggccn3kYsXuHGpz8HbHppDLHeiydfI
	iiVCoNOM0hf9CrvI5L7VC8AOoO2a0zwJ0bMRgbad2h61XNf+tNztNjsf6/V1tUdrIcENAb/X3Tz
	h5wYGvlRqTik20E+XeA==
X-Received: from ejcmy11.prod.google.com ([2002:a17:906:5a4b:b0:beb:3773:86c7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:e158:b0:beb:7979:47dd with SMTP id a640c23a62f3a-beb797959f7mr242224566b.27.1780307161830;
 Mon, 01 Jun 2026 02:46:01 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:46:00 +0000
In-Reply-To: <20260530143541.229628-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-3-phasta@kernel.org>
Message-ID: <ah1U2P8ppTjprYwR@google.com>
Subject: Re: [PATCH 1/4] rust: types: implement ForeignOwnable for ARef<T>
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63230-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[37];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E390361CE2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 04:35:09PM +0200, Philipp Stanner wrote:
> From: Danilo Krummrich <dakr@kernel.org>
> 
> Implement ForeignOwnable for ARef<T>, making it possible for C code to
> own an ARef<T>.
> 
> Since ARef represents shared ownership, BorrowedMut is &T rather than
> &mut T, matching the semantics of the underlying reference-counted type.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

