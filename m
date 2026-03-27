Return-Path: <linux-media+bounces-57365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFMIOSDuxmkIQQUAu9opvQ
	(envelope-from <linux-media+bounces-57365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:52:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFDE34B540
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95EB530F7EBA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6967B39281B;
	Fri, 27 Mar 2026 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyAVrX2b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5013644BB;
	Fri, 27 Mar 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644270; cv=none; b=d3fHJE76P+53mmVsa9XHDjy/x95sxOZcYabw7FrcUgD7T8mFfC/pSZgwPU3GhH1HudhLtfs3X8w9hHLPqZ93+TOVnmYL0ya3NukEllj5AdTU2y7YzUwpEUycW3YvDxM8w4QRuB7vikdZqpxSBPT3fTtGOXD/J/s6FbXgoOql790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644270; c=relaxed/simple;
	bh=kR0L33jdEWvScd5lZZ2m79e8K6o7vwUb1mPuNZDhkGU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=T/fUVatQH04lfvyvZfFgi+jch/gFzExuHVqAWRTATyTUlkNOw9tgLkn/aF47HItLRV/BUaEQHu7upBWJ8ZU+ypO9V3m4bZeGsREIgGOs5h09D9ROG2NE1UYXZQova63+MxgCuqlfwAUkDloHrlwe87wyFLgcjWzD63xWPNHqvNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyAVrX2b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4CFC19423;
	Fri, 27 Mar 2026 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644270;
	bh=kR0L33jdEWvScd5lZZ2m79e8K6o7vwUb1mPuNZDhkGU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SyAVrX2bNenPqTeESGYm8VpRUg1AjjlXWuUmTRw5p34AcewOEm4ZDb1l0djRfFMam
	 cQPXKYaE1taVtpGCmzSgcpDnk88RhUEUdCKzgW9KgraS4kMpPHtmOX5bnB1zeQzHBL
	 bxVmfKKQFDAHejqtCsnO28JMfK28G7Hb1yyH+DOw9fKpuM+WSIMdb9eQsySv64t3Ba
	 W289J73eMx9e2Ja1lF8gpkEni9J5DnS7aP7GLZi8S+vyGrko1BcgsmpCeGgVIsFwXy
	 M0MOG54FG8qxQejW7rqG7OXzLyTvISp23dh3L+4oEqOhbbhg4hEQ6bV2PneNIP8xPp
	 E1+U3hw2ea1SA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:44:26 +0100
Message-Id: <DHDUW10P5BMJ.QNFRFHLHOH6H@kernel.org>
Subject: (subset) Re: [PATCH v5 0/6] Rust GPUVM immediate mode
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-media@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57365-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BFDE34B540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 20, 2026 at 5:08 PM CET, Alice Ryhl wrote:
>       rust: helpers: Add bindings/wrappers for dma_resv_lock

Applied to drm-rust-next, thanks!

