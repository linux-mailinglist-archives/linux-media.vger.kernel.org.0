Return-Path: <linux-media+bounces-52864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ps1E3AKk2nw1AEAu9opvQ
	(envelope-from <linux-media+bounces-52864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:15:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BB143421
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D65983003722
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2699430CD82;
	Mon, 16 Feb 2026 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvAUXn0a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C80A136E3F;
	Mon, 16 Feb 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244131; cv=none; b=qEuj052JE5LJE4eoigJ0p4qg+Ys1bmNeL7ONz3jUXZLYaVQEQQ3xS6P0qiJ4wMaCORCRkl+vfDjW+qzLKkJiSN677h1Fwya4i7ED5MNDzpoi73JqYsu70g77AoZWiBXdDR9/421qYkgdVy3RcG+hwN2/L+WitPthpYVeQ1+6vlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244131; c=relaxed/simple;
	bh=vRi7Rgl3fBqOMWcNCD68bRzmIbxsuJ55bjNHASdv8G0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NA0C16QWsiuk5zaaUmKILp9UEbx5Y43YsiLxR0mQNdOO5UXOQ1At8wyILhqtubCbOop5yW1UMoIcDWpwWDa1u75xhrfBjsk9DYbBxetctj4OVQwtDnprRenDMXrVhUsSZsCJyMOp/ArrY6ITlsMvtgA0erTyelkTiE1ThILKCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvAUXn0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51DAC116C6;
	Mon, 16 Feb 2026 12:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771244131;
	bh=vRi7Rgl3fBqOMWcNCD68bRzmIbxsuJ55bjNHASdv8G0=;
	h=From:To:Cc:Subject:Date:From;
	b=uvAUXn0ak8KqT79IRgtBFAflrH3L/MNmje+8JrsUq8OvFf/gYN6jhDKeBKBU4tR5Y
	 3+sbRGhvKhDjbml8RFI6rjR0b2C+p+4tctAtBvhWWQU6Nd7fFIXNkt6oFVK7jyZQ/O
	 AgqVFww+lpldsSDj8Aee5om3je2MDBI09Rv1oME4b0QlKePQzJ9sb5HsUSofUAjRVQ
	 UuzF7HDKjOiaFAJ8b1+sKkQvJKICDf9D8mV4Mw0l1yujAeqpIq90ijsXYBDl1q9sV2
	 toMbfwEJKVz42MFqLRYflQp1+YeoOxXgzlt4bH5qh3jsTe8lEKXPaZX1D7TtabKV+E
	 NhwgXU7QlwRMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Robert Foss <rfoss@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: fix QCOM_MDT_LOADER dependency
Date: Mon, 16 Feb 2026 13:15:21 +0100
Message-Id: <20260216121525.2311140-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52864-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 779BB143421
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_VENUS=y,
the kernel fails to link:

x86_64-linux-ld: drivers/media/platform/qcom/venus/firmware.o: in function `venus_boot':
firmware.c:(.text+0x1e3): undefined reference to `qcom_mdt_get_size'
firmware.c:(.text+0x25a): undefined reference to `qcom_mdt_load'
firmware.c:(.text+0x272): undefined reference to `qcom_mdt_load_no_init'

The problem is the conditional 'select' statement. Change this to
make the driver built-in here regardless of CONFIG_ARCH_QCOM,
same as for the similar IRIS driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
See https://patchwork.linuxtv.org/project/linux-media/patch/20260205145623.1360105-1-arnd@kernel.org/
for the corresponding iris patch I sent earlier
---
 drivers/media/platform/qcom/venus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index 164491c5c374..075e08eaceda 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -6,7 +6,7 @@ config VIDEO_QCOM_VENUS
 	depends on ZONE_DMA
 	select DMA_MASK_31 # technically 0xdfffffff
 	select OF_DYNAMIC if ARCH_QCOM
-	select QCOM_MDT_LOADER if ARCH_QCOM
+	select QCOM_MDT_LOADER
 	select QCOM_SCM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
2.39.5


