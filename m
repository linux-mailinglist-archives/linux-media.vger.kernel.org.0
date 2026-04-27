Return-Path: <linux-media+bounces-59666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OktJYA172kw+AAAu9opvQ
	(envelope-from <linux-media+bounces-59666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:08:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 776ED47095C
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 709B1301FC08
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 10:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BF23B4E9C;
	Mon, 27 Apr 2026 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5Y3aQ6H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E43B47CF;
	Mon, 27 Apr 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284324; cv=none; b=Kr00yEMRK9Qw9x9tdpbOVVqO97H4SMZHnGOJDUnIOcboWjXUjFe8ShClT4ZMU7KNOrAxbxGurUzIq59e6/q3HZlEUso29pwx64Ff8wXGv86qq9Q6xh5ViDtlimq1ySZxipN6ySgWm/baLTCsoPw5jMYHxLaNO55i76QzA+UrHP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284324; c=relaxed/simple;
	bh=SVndXsE+vJSoc4y2vve+10Txah65FmuiC7sQ9fs8HE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e4xqL4zbRq98rjDkLfPmhFplqlPMMcU3qhqfEgZGWsSzSGX+vTD4Kja9jen8ikWIOobHKgCxB/ACeRuaVbtVvQRNR9NfZNxoWojfZRqeRfoArQakfidA0r3JU0VIfdMLO+X62eq+CCYsDc/uU0J2uBk+T6mWNqW4fCQLdV6rKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5Y3aQ6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6142DC2BCB4;
	Mon, 27 Apr 2026 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284323;
	bh=SVndXsE+vJSoc4y2vve+10Txah65FmuiC7sQ9fs8HE8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p5Y3aQ6H388MRcQSXsJOmzF+Zbin0sXYZZt7q8zabS8xAXmcb1ohs9LMpzgKpVp2z
	 4GYNFwHort4UgTH+gH6ZhYr7trtai120IYj6dwt75PRg0KR8NWZbQTf2aJVxJ30ST2
	 DJPELv7KL2MffykRgEABtrzjEJIWQNxwgb0HFNYOyOZh4Ej9a3bCBgJzubQnHA173H
	 wOiEi8h356an+RTQ6pnAohok8pH999HcFEyTGpFDlIJWgqTS7GoYDh4PMsy38fjEFb
	 DIot8Y6VNuUkjwZFs1z6DJM0Jcn3cLYc9g97CS1RNfbYNADVHZrmFBdGei0KyZrw5q
	 bovyz6vkxKlBQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 Apr 2026 12:05:00 +0200
Subject: [PATCH v5 4/4] arm64: defconfig: Enable dma-buf heaps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-dma-buf-heaps-as-modules-v5-4-b6f5678feefc@kernel.org>
References: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
In-Reply-To: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SVndXsE+vJSoc4y2vve+10Txah65FmuiC7sQ9fs8HE8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnvTa7kWk5615wvcTb0/pRpj5dwVL3MeMGr63RFIeF67
 ATGk+XlHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi8f8ZG267Jr6UuCmx/qjX
 4eIlm+R55sVfTElyqVq48FLK2ZM/Dx+p/C647KLZ6ou6j1e+P1r15D5jJePy+fypp/cvt/oQlOZ
 cJVWpkMX9/82/0EX7lz9gsFl/Us58XuXPirkFmRtZzj7u15FhAQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: 776ED47095C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59666-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Now that the system and CMA heaps can be built as modules, enable both
as modules in the arm64 defconfig.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..f33193b50e6b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1409,10 +1409,13 @@ CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_RZ_DMAC=y
 CONFIG_TI_K3_UDMA=y
 CONFIG_TI_K3_UDMA_GLUE_LAYER=y
 CONFIG_STM32_DMA3=m
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SYSTEM=m
+CONFIG_DMABUF_HEAPS_CMA=m
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y

-- 
2.53.0


