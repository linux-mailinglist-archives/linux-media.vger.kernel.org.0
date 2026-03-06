Return-Path: <linux-media+bounces-54775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DLRF2/YqmnmXgEAu9opvQ
	(envelope-from <linux-media+bounces-54775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:36:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B45221CE3
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70ADD30E1B5F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CF63A4519;
	Fri,  6 Mar 2026 13:28:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE23988EE;
	Fri,  6 Mar 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803693; cv=none; b=KgnnPGRdxg/BnxnoXHC8tZXVnqbLDVYbUtNJomkYuOqDEI/gSv20DJaQ6i/bg5iPzq6rGMVwcMH64E6nKT0P/PjB61QJJ9/mVl9a4rAHRZFTo0eju6OzzfEBGawO6kY9D1WvQapaR07FS3Hwl19U4bOkt7gyUU7OtWsf8vQhEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803693; c=relaxed/simple;
	bh=t5jOCwYs4a0qJx+g0j9jr/ql5g59uodTYfBmURX7TLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZYG7Z1skC1T20GAq2+QJGtObso8yLS34KNWsQDYcMqEBlfJAvd8SRCTTx4XuoJKa38D0zJPIzbXXQ2dDC7NQAnn2P2c64v7Co+s+cvkf92bGHqCUBuMSVESqj6GBUYErcCp3FCtCF7jeEpekDPGf7S7ezFca4yZCvJBTjQybSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 01DA11A0116;
	Fri,  6 Mar 2026 14:28:04 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D4FA41A0117;
	Fri,  6 Mar 2026 14:28:03 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6712A20270;
	Fri,  6 Mar 2026 14:28:02 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:18 +0200
Subject: [PATCH v2 1/9] drm/gem-dma: Add flag for bidirectional mapping of
 non-coherent GEM DMA buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-1-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803680; l=2892;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=t5jOCwYs4a0qJx+g0j9jr/ql5g59uodTYfBmURX7TLI=;
 b=vQgTdwiDpL6F1spFiQA3GmfumX6lRP1fSzi7wQIADz/lnvRiRmtcYpuVIW2l+I8j//iohgk08
 bbYob/MGbB1An73BLKydFFyr4LbLgEOah+seA7bcu0lYaLDWdKOz5n5
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: 03B45221CE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54775-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.461];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Introduce a flag that allows a user to request non-coherent buffers
allocated via the GEM DMA helper for bidirectional use.

Keep current behaviour (DMA_TO_DEVICE mapping) as default, with no change
required for existing GEM DMA users.

While it hasn't been the case until now, some devices like NXP's Neutron
Neural Processing Unit (NPU) require contiguous, non-coherent DMA buffers
they can both read from and write to. Unlike traditional DRM devices,
Neutron uses the same DMA buffer both for reading model data and for
writing inference output.

Neutron's usage scenario is a good match for the GEM DMA helpers, except
for the fact that current implementation only considers the DMA_TO_DEVICE
direction.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 6 ++++--
 include/drm/drm_gem_dma_helper.h     | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index ecb9746f4da8..dbf5ad4426d3 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -148,7 +148,8 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	if (dma_obj->map_noncoherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
 						       &dma_obj->dma_addr,
-						       DMA_TO_DEVICE,
+						       dma_obj->map_bidirectional ?
+						       DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
 		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
@@ -238,7 +239,8 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		if (dma_obj->map_noncoherent)
 			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
-					     DMA_TO_DEVICE);
+					     dma_obj->map_bidirectional ?
+					     DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
 		else
 			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
 				    dma_obj->vaddr, dma_obj->dma_addr);
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..e0022f2fdfef 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -17,6 +17,8 @@ struct drm_mode_create_dumb;
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
  * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
+ * @map_bidirectional: valid only if map_noncoherent flag is set. If true, allow
+ *                     bidirectional use of the non-coherent memory buffer
  */
 struct drm_gem_dma_object {
 	struct drm_gem_object base;
@@ -27,6 +29,7 @@ struct drm_gem_dma_object {
 	void *vaddr;
 
 	bool map_noncoherent;
+	bool map_bidirectional;
 };
 
 #define to_drm_gem_dma_obj(gem_obj) \

-- 
2.34.1


