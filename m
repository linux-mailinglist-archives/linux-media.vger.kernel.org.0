Return-Path: <linux-media+bounces-54352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE1MMLLVpmnHWgAAu9opvQ
	(envelope-from <linux-media+bounces-54352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:36:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C19701EF8AC
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1446F302C6CD
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 12:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725F433C1BD;
	Tue,  3 Mar 2026 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeeOgHgI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A051E487
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541275; cv=none; b=V9T6pS3LSiCf5vRZyjzsBAiD8ZpBMoV66S14Ucc0JxGjc+qZVFas1uRp4yV/r+8DuqUTxOm2OdQ7WknX+NxlBvw7qL0mKFzPcUP5ktLJ2rsgz8DjdH0jebxBXC12IDEuWutv00Ef0MhmZTujF/STPQi61WbHpnSbrExGdvzaRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541275; c=relaxed/simple;
	bh=rT4eCrjoQu7EvTeC9Zi2EQ7EHm1V9wN2D3i4WLgOBL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIdGxazoivKaPviY9p5thBk86+p6PoRcaCQ4NOMa79jdfvmVT3UeUFDbvQcW49p9wNgrwHKZBHoLHM6nYWkgsy17SwwJ3ItoUIlZG6rqfcT24Fj3XJ+Zkys3RjOucVZnQhsZ1x4F2+B1lqW9D0KHjtdtLgyqMsgxsKFrtI+iSp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeeOgHgI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772541271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2WQTNBlzMDcavmEhhF5QEatl1tMG2I69r3hsa4655g=;
	b=VeeOgHgIyJiNpDrfxlyfyNPWFtN3F9hASqVE7EuaJBMzAvozBVp47Id2pdx8Dom09q3nS+
	U3s42A8Dp/zpX8cPAZRRWoWfKgT6ubfRtHmq4hP/gbnhE6pp4l8sj6Jp4kuf8F2Yf5Bqqe
	bGl304eVek3y0cFJM6XrQxb7lwXwAIw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-N7OrLEwtNuGjw09bCTBezQ-1; Tue,
 03 Mar 2026 07:34:26 -0500
X-MC-Unique: N7OrLEwtNuGjw09bCTBezQ-1
X-Mimecast-MFC-AGG-ID: N7OrLEwtNuGjw09bCTBezQ_1772541264
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15B2C1800464;
	Tue,  3 Mar 2026 12:34:24 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.44.32.231])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BBEC730001BF;
	Tue,  3 Mar 2026 12:34:17 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 03 Mar 2026 13:33:45 +0100
Subject: [PATCH v2 2/6] dma-buf: dma-heap: split dma_heap_add
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-b4-dmabuf-heap-coherent-rmem-v2-2-65a4653b3378@redhat.com>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
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
 Albert Esteve <aesteve@redhat.com>, echanude@redhat.com, mripard@redhat.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772541243; l=6736;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=rT4eCrjoQu7EvTeC9Zi2EQ7EHm1V9wN2D3i4WLgOBL8=;
 b=WyYJMMZjafvKEln5EMzK35BIFWIKyBwZjgKRJeKr/K5sa3XEXqCBPwD2HOUyxnOKeDhqy32W0
 LDiUoTUFgtwD0jNccSayx+CrlCFk5prI74Zg2anYbmnK0Ya+AYBc6Ry
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Queue-Id: C19701EF8AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54352-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Split dma_heap_add() into creation and registration
phases while preserving the ordering between
cdev_add() and device_add(), and ensuring all
device fields are initialised.

This will allow to access the heap_dev before
it is registered and becomes available to
userspace, making error handling easier.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/dma-buf/dma-heap.c | 126 +++++++++++++++++++++++++++++++++++----------
 include/linux/dma-heap.h   |   3 ++
 2 files changed, 103 insertions(+), 26 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 1124d63eb1398..88189d4e48561 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -238,15 +238,30 @@ struct device *dma_heap_get_dev(struct dma_heap *heap)
 }
 EXPORT_SYMBOL_NS_GPL(dma_heap_get_dev, "DMA_BUF_HEAP");
 
+static void dma_heap_dev_release(struct device *dev)
+{
+	struct dma_heap *heap;
+
+	pr_debug("heap device: '%s': %s\n", dev_name(dev), __func__);
+	heap = dev_get_drvdata(dev);
+	kfree(heap->name);
+	kfree(heap);
+	kfree(dev);
+}
+
 /**
- * dma_heap_add - adds a heap to dmabuf heaps
- * @exp_info: information needed to register this heap
+ * dma_heap_create() - allocate and initialize a heap object
+ * @exp_info: information needed to create a heap
+ *
+ * Creates a heap instance but does not register it or create device nodes.
+ * Use dma_heap_register() to make it visible to userspace, or
+ * dma_heap_destroy() to release it.
+ *
+ * Returns a heap on success or ERR_PTR(-errno) on failure.
  */
-struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
+struct dma_heap *dma_heap_create(const struct dma_heap_export_info *exp_info)
 {
-	struct dma_heap *heap, *h, *err_ret;
-	unsigned int minor;
-	int ret;
+	struct dma_heap *heap;
 
 	if (!exp_info->name || !strcmp(exp_info->name, "")) {
 		pr_err("dma_heap: Cannot add heap without a name\n");
@@ -265,13 +280,41 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	heap->name = exp_info->name;
 	heap->ops = exp_info->ops;
 	heap->priv = exp_info->priv;
+	heap->heap_dev = kzalloc_obj(*heap->heap_dev);
+	if (!heap->heap_dev) {
+		kfree(heap);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	device_initialize(heap->heap_dev);
+	dev_set_drvdata(heap->heap_dev, heap);
+
+	dev_set_name(heap->heap_dev, heap->name);
+	heap->heap_dev->class = dma_heap_class;
+	heap->heap_dev->release = dma_heap_dev_release;
+
+	return heap;
+}
+EXPORT_SYMBOL_NS_GPL(dma_heap_create, "DMA_BUF_HEAP");
+
+/**
+ * dma_heap_register() - register a heap with the dma-heap framework
+ * @heap: heap instance created with dma_heap_create()
+ *
+ * Registers the heap, creating its device node and adding it to the heap
+ * list. Returns 0 on success or a negative error code on failure.
+ */
+int dma_heap_register(struct dma_heap *heap)
+{
+	struct dma_heap *h;
+	unsigned int minor;
+	int ret;
 
 	/* Find unused minor number */
 	ret = xa_alloc(&dma_heap_minors, &minor, heap,
 		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
 	if (ret < 0) {
 		pr_err("dma_heap: Unable to get minor number for heap\n");
-		err_ret = ERR_PTR(ret);
 		goto err0;
 	}
 
@@ -282,42 +325,34 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
 	if (ret < 0) {
 		pr_err("dma_heap: Unable to add char device\n");
-		err_ret = ERR_PTR(ret);
 		goto err1;
 	}
 
-	heap->heap_dev = device_create(dma_heap_class,
-				       NULL,
-				       heap->heap_devt,
-				       NULL,
-				       heap->name);
-	if (IS_ERR(heap->heap_dev)) {
-		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(heap->heap_dev);
+	heap->heap_dev->devt = heap->heap_devt;
+
+	ret = device_add(heap->heap_dev);
+	if (ret) {
+		pr_err("dma_heap: Unable to add device\n");
 		goto err2;
 	}
 
 	mutex_lock(&heap_list_lock);
 	/* check the name is unique */
 	list_for_each_entry(h, &heap_list, list) {
-		if (!strcmp(h->name, exp_info->name)) {
+		if (!strcmp(h->name, heap->name)) {
 			mutex_unlock(&heap_list_lock);
 			pr_err("dma_heap: Already registered heap named %s\n",
-			       exp_info->name);
-			err_ret = ERR_PTR(-EINVAL);
+			       heap->name);
+			ret = -EINVAL;
 			goto err3;
 		}
 	}
 
-	/* Make sure it doesn't disappear on us */
-	heap->heap_dev = get_device(heap->heap_dev);
-
-
 	/* Add heap to the list */
 	list_add(&heap->list, &heap_list);
 	mutex_unlock(&heap_list_lock);
 
-	return heap;
+	return 0;
 
 err3:
 	device_destroy(dma_heap_class, heap->heap_devt);
@@ -326,8 +361,47 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 err1:
 	xa_erase(&dma_heap_minors, minor);
 err0:
-	kfree(heap);
-	return err_ret;
+	dma_heap_destroy(heap);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(dma_heap_register, "DMA_BUF_HEAP");
+
+/**
+ * dma_heap_destroy() - release a heap created by dma_heap_create()
+ * @heap: heap instance to release
+ *
+ * Drops the heap device reference; the heap and its device are freed in the
+ * device release path when the last reference is gone.
+ */
+void dma_heap_destroy(struct dma_heap *heap)
+{
+	put_device(heap->heap_dev);
+}
+EXPORT_SYMBOL_NS_GPL(dma_heap_destroy, "DMA_BUF_HEAP");
+
+/**
+ * dma_heap_add - adds a heap to dmabuf heaps
+ * @exp_info: information needed to register this heap
+ */
+struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
+{
+	struct dma_heap *heap;
+	int ret;
+
+	heap = dma_heap_create(exp_info);
+	if (IS_ERR(heap)) {
+		pr_err("dma_heap: failed to create heap (%d)\n", PTR_ERR(heap));
+		return PTR_ERR(heap);
+	}
+
+	ret = dma_heap_register(heap);
+	if (ret) {
+		pr_err("dma_heap: failed to register heap (%d)\n", ret);
+		dma_heap_destroy(heap);
+		return ERR_PTR(ret);
+	}
+
+	return heap;
 }
 EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
 
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 493085e69b70e..1b0ea43ba66c3 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -46,6 +46,9 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
 const char *dma_heap_get_name(struct dma_heap *heap);
 struct device *dma_heap_get_dev(struct dma_heap *heap);
 
+struct dma_heap *dma_heap_create(const struct dma_heap_export_info *exp_info);
+int dma_heap_register(struct dma_heap *heap);
+void dma_heap_destroy(struct dma_heap *heap);
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
 extern bool mem_accounting;

-- 
2.52.0


