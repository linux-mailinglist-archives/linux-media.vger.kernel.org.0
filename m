Return-Path: <linux-media+bounces-54354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGm5DazXpmnHWgAAu9opvQ
	(envelope-from <linux-media+bounces-54354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:44:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 811151EFA5D
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 13:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CE2F316AA07
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CEA347BDC;
	Tue,  3 Mar 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZalmtWO7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8B347504
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541280; cv=none; b=mWhLWHaKuzyzMbimOqDPhgwDw6xV/Lcy3YdmQl1k+V44fHGKaQeSvRbB06rHBb40kxM2OfimfnaET61bkJBoaZGJwCRSpTdfemfhG7C3cq1wSQtFDKg/SuyWDqB4l0Se+ox8N+IQ2NrjgHhvTr8eJO7DWwrmlTw9o9ghC2pJQI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541280; c=relaxed/simple;
	bh=Oiyav+nKn59PGwnJ/kuaw2S3AHX/9+uyerzkejMZoD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyvElhoIIah097qIgQupwdZMzbgaZA16IDJiX/W6SGAKi3Tj7EY3R2IXMWtArKtmU78l13l3wx8OxAFGzdvsFVIfsnczJvt2s4ZM1lEZLvKF7pBwU2uc1Bjj6b40bCA7tTob3W4vmQKEQ9X1S3ycodrPZxpQ4ELqucOGv9h7K3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZalmtWO7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772541277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Eja0IKLWM7TXMINx19h4PVbisMkWsGrNkIdZK4d0xk=;
	b=ZalmtWO70PhE/tok8fIcWjTJyVCw48Z7ckbH3u0XzmaxmGkwYZir6+YNr/Bn0pNyWqyMER
	ieUJ+cSQBgQd5hETQI15Q2hzU7Xyw5iJzaLDKhKFfUo37b35gyXZxqcieNCvluT6NfPsBB
	oPkUcl7GyMczl7UiBYN/t1HGgBZW5ps=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-P4LtvZmcMl2bsCgGydgWWQ-1; Tue,
 03 Mar 2026 07:34:32 -0500
X-MC-Unique: P4LtvZmcMl2bsCgGydgWWQ-1
X-Mimecast-MFC-AGG-ID: P4LtvZmcMl2bsCgGydgWWQ_1772541270
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 847961800365;
	Tue,  3 Mar 2026 12:34:30 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.44.32.231])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0A7330001B9;
	Tue,  3 Mar 2026 12:34:24 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 03 Mar 2026 13:33:46 +0100
Subject: [PATCH v2 3/6] of_reserved_mem: add a helper for rmem device_init
 op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-b4-dmabuf-heap-coherent-rmem-v2-3-65a4653b3378@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772541243; l=3269;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=Oiyav+nKn59PGwnJ/kuaw2S3AHX/9+uyerzkejMZoD4=;
 b=i3wbq5E4k9VfhS9W3iaMgYMRMa0WY56H+E6aqqEhiNhouFoq+Q7bGPoRNT8RSld0ItGC3n+Mo
 VBn/S9AJdEHB91d8iZ3E61e216OnDtU3RjkvsWWVtnZ0J+Hin44U7YH
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Queue-Id: 811151EFA5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54354-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add a helper function wrapping internal reserved memory
device_init call and expose it externally.

Use the new helper function within of_reserved_mem_device_init_by_idx().

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/of/of_reserved_mem.c    | 27 +++++++++++++++++++++++----
 include/linux/of_reserved_mem.h |  8 ++++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1fd28f8056108..3a350bef8f11e 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -605,6 +605,28 @@ struct rmem_assigned_device {
 static LIST_HEAD(of_rmem_assigned_device_list);
 static DEFINE_MUTEX(of_rmem_assigned_device_mutex);
 
+/**
+ * of_reserved_mem_device_init_with_mem() - assign reserved memory region to
+ *					    given device
+ * @dev:	Pointer to the device to configure
+ * @rmem:	Reserved memory region to assign
+ *
+ * This function assigns respective DMA-mapping operations based on the
+ * reserved memory region already provided in @rmem to the @dev device,
+ * without walking DT nodes.
+ *
+ * Returns error code or zero on success.
+ */
+int of_reserved_mem_device_init_with_mem(struct device *dev,
+					 struct reserved_mem *rmem)
+{
+	if (!dev || !rmem || !rmem->ops || !rmem->ops->device_init)
+		return -EINVAL;
+
+	return rmem->ops->device_init(rmem, dev);
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_with_mem);
+
 /**
  * of_reserved_mem_device_init_by_idx() - assign reserved memory region to
  *					  given device
@@ -643,14 +665,11 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 	rmem = of_reserved_mem_lookup(target);
 	of_node_put(target);
 
-	if (!rmem || !rmem->ops || !rmem->ops->device_init)
-		return -EINVAL;
-
 	rd = kmalloc_obj(struct rmem_assigned_device);
 	if (!rd)
 		return -ENOMEM;
 
-	ret = rmem->ops->device_init(rmem, dev);
+	ret = of_reserved_mem_device_init_with_mem(dev, rmem);
 	if (ret == 0) {
 		rd->dev = dev;
 		rd->rmem = rmem;
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index f573423359f48..12f7ddb7ee61f 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -32,6 +32,8 @@ typedef int (*reservedmem_of_init_fn)(struct reserved_mem *rmem);
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
 	_OF_DECLARE(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
+int of_reserved_mem_device_init_with_mem(struct device *dev,
+					 struct reserved_mem *rmem);
 int of_reserved_mem_device_init_by_idx(struct device *dev,
 				       struct device_node *np, int idx);
 int of_reserved_mem_device_init_by_name(struct device *dev,
@@ -51,6 +53,12 @@ int of_reserved_mem_region_count(const struct device_node *np);
 #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
 	_OF_DECLARE_STUB(reservedmem, name, compat, init, reservedmem_of_init_fn)
 
+static inline int of_reserved_mem_device_init_with_mem(struct device *dev,
+						       struct reserved_mem *rmem)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
 					struct device_node *np, int idx)
 {

-- 
2.52.0


