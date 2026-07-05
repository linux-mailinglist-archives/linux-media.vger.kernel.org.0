Return-Path: <linux-media+bounces-66630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gawTLphhSmppCAEAu9opvQ
	(envelope-from <linux-media+bounces-66630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 15:52:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3870A2B0
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 15:52:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eXdXF+HT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66630-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66630-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05CF63011137
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 13:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC433793AA;
	Sun,  5 Jul 2026 13:52:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BC3783B4;
	Sun,  5 Jul 2026 13:52:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783259526; cv=none; b=T/VBlijdAuRJdcMXqyrLqlYUj3He8zxeWQ49Y1ha4DDwcVhJIyhVXSGe8Z8SZTBP3dpHy87A5s6z9PQI+qIAIH66dw1ZrHzb7ORoDoM+gw6Kq30xfKmf5vRuQVd0FRHt/JJxLaICh4AFg0IGS8raS49knIihEI9q8lgcZp68cuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783259526; c=relaxed/simple;
	bh=MWz+AiWcMBmm/IVpKupbMG1mTBA7Ba0IjeQ7nosE5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Glfbe99WvcgPhRSOr48YEebRUqDWY/Z3zg0H9GUOW3lUufTtwqbI4WgQ1WKEz+yOjvTcQeDDPQuQFsKz/zNQj/k8ExQFzOhZEZ8//wiF8CDVZ3+A0sTXpOP0ir3Fw3d1WP6Sexh5jynzFUPbBlKx2/D+ovIv0AQQV3z9pCPVmI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXdXF+HT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6B21F00A3D;
	Sun,  5 Jul 2026 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783259524;
	bh=hiXx0kh1llU+tqTb5cQLeELIhtzQB8YMaLGKmHcMmT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eXdXF+HTA76vk6XNS/vpiHTMSk+4FpMeNvRZmKgO8fO2droK6kJamzz2kJ8o2E9mW
	 UXXYCvFJ5fT1e2JQ+P9Tv3IJ76zYmA+czNJ9uy4Xg5XK1a0WoqHA3kDRrX+VbCFdU3
	 rqA9ifY2b9eHSUHyxfpweXEQCaU/cSUQ3At3MiJQt2DcC5sGzpskRjaDvjuNhV3vG5
	 BegQJHRNGJ59ocpzb/UbLmhFvM6KVGIZ1poDnVkzWlij5XbukRWorvucLvVJkqa5HG
	 hGxerQFd58E7/X1XZi9/7xfznMbhiXcZWtc7z0jwPrzdgjdKAdViUYJvlPraIvFsYE
	 2/qLQXFlaM9FQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	jyescas@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v2] dma-buf: remove unused dma-fence-unwrap.c (stable/linux-5.15.y only)
Date: Sun,  5 Jul 2026 09:51:58 -0400
Message-ID: <2026070416-stable-reply-0003@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703-5-15-dma-fence-unwrap-v2-1-43d58ee68c6b@linaro.org>
References: <20260703-5-15-dma-fence-unwrap-v2-1-43d58ee68c6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:Yunxiang.Li@amd.com,m:sashal@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:andre.draszik@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:tudor.ambarus@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66630-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BD3870A2B0

On Thu, 2026-07-03 at 14:28 +0000, Tudor Ambarus wrote:
> The file drivers/dma-buf/dma-fence-unwrap.c was incorrectly added to
> the 5.15.y stable branch in commit 4e82b9c11d3c ("dma-buf: add
> dma_fence_timestamp helper") as a new file, but it was never enabled in
> the Makefile, and its header include/linux/dma-fence-unwrap.h was not
> present, making it uncompilable.

Queued for 5.15.y, thanks.

-- 
Thanks,
Sasha

