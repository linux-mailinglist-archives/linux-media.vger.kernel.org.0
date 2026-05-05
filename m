Return-Path: <linux-media+bounces-60399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGTvLyHS+WlHEQMAu9opvQ
	(envelope-from <linux-media+bounces-60399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:18:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3700B4CC6D2
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F200631898F9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 11:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C651DF256;
	Tue,  5 May 2026 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZyuQTWA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF238237F;
	Tue,  5 May 2026 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979236; cv=none; b=MFm/XGIXC29X0cm5SAdiTAxhfrvzEK1M8VPvQKOi5p++uHs0oMlUY8fjWQ+LF6Y365VAkD/oN00/BE2grU4KO7jM0m26rpyxn20IQhLSIvO+KeJwSOsPcbkwe+PGY6t+UgSehqIlzup2DKj+spHyQXxKMD+Bdqxhn3/alXJ07xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979236; c=relaxed/simple;
	bh=wW+Y7jhvehp4RpHP43OlmUCCpw/Ci9kVuViYSSsX8zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dts02xwDzRKGJLYrtJOIF0LKtDiwN+btUEv2k84Hvw4Twfdco6riufKZZgyjzQS3xn2Zz2lj4Yq048rJLEUB3PCdXxZbc7Tt2+n0rBR83QAzuLr2xBjJScZ7WcfLNYcOvZayAW/ZzDBFVTzRc8RwG0EQGSVeiRaDFl2W2bclUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZyuQTWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1D1C2BCB9;
	Tue,  5 May 2026 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777979235;
	bh=wW+Y7jhvehp4RpHP43OlmUCCpw/Ci9kVuViYSSsX8zE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZyuQTWAj9LvurqQhPNVGSCSelmuixLByfHQE98AZXVKgBjeCOE+xf5RBBlfVDRiP
	 yzxwB5gyRLVDW4MA6+PZXEW8OUAlSuKc0ppq7VXAjJEnQr9Jsuvm2KJCEGKSpfsdhU
	 Ja/oLvLwOOCLJsJ9aMslIBYn8jtJV5gQzJL0CbDg3p7Pdd0WenkPmAG9vW9FdY9Tkl
	 S2Rn6LT8r6bNrx23jkmH72vRPOL5FFlC7ZKk30pAvnx96YPISmp9wuXkwx4CZ3CDPs
	 Ed4RDp9qZTOUo2PpEB3hoWZVIgZgPxwuqp01rXxbsY0cRjSULgh5uIesm4YPYqdMsI
	 yj0tR9/WdwpRQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Janne Grunau <j@jannau.net>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 0/5] Rust GPUVM immediate mode
Date: Tue,  5 May 2026 13:07:09 +0200
Message-ID: <20260505110709.3690737-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
References: <20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3700B4CC6D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60399-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]

On Thu, 09 Apr 2026 15:26:05 +0000, Alice Ryhl wrote:
> [PATCH v6 0/5] Rust GPUVM immediate mode

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/5] rust: drm: add base GPUVM immediate mode abstraction
      commit: 82b78182eacf
[2/5] rust: gpuvm: add GpuVm::obtain()
      commit: 71a3921111bd
[3/5] rust: gpuvm: add GpuVa struct
      commit: 5540a9c747b3
[4/5] rust: gpuvm: add GpuVmCore::sm_unmap()
      commit: dc3846045f69
[5/5] rust: gpuvm: add GpuVmCore::sm_map()
      commit: 0b715b1e382b

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.

