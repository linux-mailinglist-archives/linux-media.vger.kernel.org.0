Return-Path: <linux-media+bounces-54730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PeRMt6uqmluVQEAu9opvQ
	(envelope-from <linux-media+bounces-54730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:39:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4E21EF5E
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 384CE302D681
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D5437F735;
	Fri,  6 Mar 2026 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cj+IhK2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5BC37DE82
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793471; cv=none; b=LGxr4ne25RLG0yNwpohJD+njC8R4cTZ5H2VEnmF1VewAqY6S2uISVzCadfhwX9Wo8NdPx2YvlmoiADRJlCzd4Gh89RDKVSJev1pNU5AYM0m5r6NFvddGMgYRChmczEmSxfFPeo/NVWFeiiETfguPM0Z5EjC5c5tBhY6bNMZ0JPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793471; c=relaxed/simple;
	bh=8dYJXakMo93Mc3lLZ5xLZ8QfYkIluXNTvVn7oLOYyd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMebQ4b3nmlf5Rv+ZO7VZ4Fv38hED+RLDYBuw6hN53IqSHyORtxYLIjEnuwKVMACK/vU7gtI1QYRRUoGYPQFsc1ynJdRpbDck/1992c3pDytHkbLeBtFpQykNRd22jOxvUfKKbV0rbenzop7K8ER8xtKMVPLsA0fKesoq2zmcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cj+IhK2Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772793469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlzQWM0pQarIoPqm3Nl91hQ8QPCgoigzmRIhUlpi9M8=;
	b=Cj+IhK2YbS930ntlciKQAqT3UO62W3Xak6GqclH8z86PLz1xl8lxqfX9NX1UmDX7lwne4g
	/7DcKb/7h+CiEs9WCRDtAMgwrp3Da4KID0QFhaeTQ3lulugk1ZCJ0szeecaIqjieCcPkkD
	BtGzMYjSdx1+DSTAQ6nn7GcETcXLtxU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-UUtSeqiXMbu1DAjH5sRbQg-1; Fri,
 06 Mar 2026 05:37:47 -0500
X-MC-Unique: UUtSeqiXMbu1DAjH5sRbQg-1
X-Mimecast-MFC-AGG-ID: UUtSeqiXMbu1DAjH5sRbQg_1772793465
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBFDE1956088;
	Fri,  6 Mar 2026 10:37:45 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.45.226.103])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4D89180035F;
	Fri,  6 Mar 2026 10:37:39 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 06 Mar 2026 11:36:37 +0100
Subject: [PATCH v3 6/6] dma-buf: heaps: coherent: Turn heap into a module
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-b4-dmabuf-heap-coherent-rmem-v3-6-3d00d36c9bc4@redhat.com>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
In-Reply-To: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, mripard@redhat.com, echanude@redhat.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772793417; l=1661;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=8dYJXakMo93Mc3lLZ5xLZ8QfYkIluXNTvVn7oLOYyd0=;
 b=Qm2/NTv+NibwQ4NUgIiBv1ELR84Zemc1608Ij5MBU+ZNmcVHDkvPQnkB17rRPklxBL/kLazKf
 4Fi3uUXQDF+CAD44A2H9aDZK/GjsuL7JYH0er/9W85JKFYPQp+70MJH
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Queue-Id: 0CF4E21EF5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54730-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Following the current efforts to make CMA heap as module,
we can do the same and turn the Coherent heap into
a module as well, by changing the Kconfig into a tristate
and importing the proper dma-buf namespaces.

This heap won't be able to unload (same as happens with
the CMA heap), since we're missing a big part of the
infrastructure that would allow to make it safe.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/dma-buf/heaps/Kconfig         | 2 +-
 drivers/dma-buf/heaps/coherent_heap.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index aeb475e585048..2f84a1018b900 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -14,7 +14,7 @@ config DMABUF_HEAPS_CMA
 	  regions, you should say Y here.
 
 config DMABUF_HEAPS_COHERENT
-	bool "DMA-BUF Coherent Reserved-Memory Heap"
+	tristate "DMA-BUF Coherent Reserved-Memory Heap"
 	depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHERENT
 	help
 	  Choose this option to enable coherent reserved-memory dma-buf heaps.
diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/heaps/coherent_heap.c
index 55f53f87c4c15..fdb3f5d907e88 100644
--- a/drivers/dma-buf/heaps/coherent_heap.c
+++ b/drivers/dma-buf/heaps/coherent_heap.c
@@ -412,3 +412,6 @@ static int __init coherent_heap_register(void)
 }
 module_init(coherent_heap_register);
 MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory regions");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_IMPORT_NS("DMA_BUF_HEAP");

-- 
2.52.0


