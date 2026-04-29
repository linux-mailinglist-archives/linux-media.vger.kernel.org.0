Return-Path: <linux-media+bounces-60020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHObJzli8mlNqgEAu9opvQ
	(envelope-from <linux-media+bounces-60020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:55:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47572499ED2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 21:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5029300ACA2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D0238C2C3;
	Wed, 29 Apr 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syvJohsu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918D37E2FD;
	Wed, 29 Apr 2026 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492530; cv=none; b=pMT0WnivhF6oCxoVl+oblhjLZZaB8yNquDZoRA6IKKOeEVS/OZHXpZYRFy0+VslcjGD8BArIpT21qL8oEs2raaDI9CKMtyZrJuzY4uowt3RNWOlhYccY2iiuJoxZz5i5ynD+D011eiF41IkxB7uF7eEgHYvNq0KVfAxWEaNmGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492530; c=relaxed/simple;
	bh=py3ZugpVGOSerR4b9aWRzpta2tWjJhkdkiUmYWanWSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZtan9n8zjQWUTCYgIkEEEXkTMxxeigC97AjBI8Fg4zMFalup14K3inNFpSfBFyM8Tgf5x9IKHp+KzT1CDcxIVvYnQiEcvmcdlafjFsmA4UegJ5V1k8J7KDUn2h41GFFUNzPdVCzftTbu6OaI45qte0U45Xy7zwS8mdrpw0RE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syvJohsu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D63BC19425;
	Wed, 29 Apr 2026 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777492530;
	bh=py3ZugpVGOSerR4b9aWRzpta2tWjJhkdkiUmYWanWSs=;
	h=Date:From:To:Cc:Subject:From;
	b=syvJohsudSrYN3C1ecR5siFFpEGtIeIbdtsafi881gUolpzc0EmA3sn2uWpzB+I0E
	 ZkmGnBHUdKE2n1Mw8VBUkv35Si/6WOgzQMZGp/A4OPndlPTgRglYzB5s2pV+H17h3Z
	 4l5L+vIrZr1UcEu4mlirV5lFUN67UmkGz5CQVREqY8ssseiWnGE1qcc/mA9rsnjLNN
	 1nssc9HWWqTxaxDBi74EnS0T23lvHaqD370sjUXy5CL6MIQUR+53yM/sfQns328ty3
	 Iw6RJniD1o7yt+YNNnYRfHcesisVVnTek97OJ5SINW4Ej7NX9PVeAE9GNz6C/0T3xH
	 vBMBbhaj+CiVw==
Date: Wed, 29 Apr 2026 13:55:27 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] media: xilinx: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <afJiL-iZ4QbJ5v12@kspp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 47572499ED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60020-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gustavoars@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the TRAILING_OVERLAP() helper to fix the following warning:

drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

This helper creates a union between a flexible-array member (FAM)
and a set of members that would otherwise follow it. This overlays
the trailing members onto the FAM while preserving the original
memory layout.

Lastly, the static_assert() ensures the alignment between the FAM
and struct data_chunk sgl; is not inadvertently changed, and it's
intentionally placed inmediately after the related structure (that
is, no blank line in between).

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
index 18f77e1a7b39..65f6147ff6c6 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.h
+++ b/drivers/media/platform/xilinx/xilinx-dma.h
@@ -96,9 +96,14 @@ struct xvip_dma {
 
 	struct dma_chan *dma;
 	unsigned int align;
-	struct dma_interleaved_template xt;
-	struct data_chunk sgl;
+
+	/* Must be last as it ends in a flexible-array member. */
+	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
+		struct data_chunk sgl;
+	);
 };
+static_assert(offsetof(struct xvip_dma, xt.sgl) ==
+	      offsetof(struct xvip_dma, sgl));
 
 #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
 
-- 
2.51.0


