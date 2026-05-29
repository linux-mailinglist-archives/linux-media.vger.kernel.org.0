Return-Path: <linux-media+bounces-63062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGQMGngGWpmzggAu9opvQ
	(envelope-from <linux-media+bounces-63062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 20:52:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F4607887
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 20:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E69C31248AB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C3A47DD45;
	Fri, 29 May 2026 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QsDY48WE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF947D95E
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 18:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079860; cv=none; b=P+2NsS/b4Xlyx4QH4G3XY9GWV8IfPPQMiMJU6jGjEIqVzGvha1Wl0N9ILMw9LRqrk4OJ1S19yrVXOCJDtxemeO8xPyKYThwG4PwGdxyAFy14YiYgFVvgRnd+Gy1ePvVHXjMN993F0cuMt9orZcS+MjSDnFJoEuHhre3aEWl9HY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079860; c=relaxed/simple;
	bh=m/ZuTvDTd2RiJVeIWiH9JqSGrSiIRaTy3fvE3xM5Oqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnUrZKqLebxB0CIP/XnQdI0KxUJpzDjctT0vJH76r58sdoLV/SzzbQjAKuCAWIbe00VQOoUNAEuguA5hARPpFbJ6CLcBaWrYOuIU21UlFRB0S8zIaAF4xMnm1EL27ntBtSjWzvJimVuWZYWTTMWwWCzfzwWnURYR2WJ+RtdP4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QsDY48WE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780079856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9iRHxmN/dnU79hS18x4XdzAf0Ghs0AIzOreSmFvd9Ao=;
	b=QsDY48WE10GYoZAjSTNZQG6N89aOb+q9ErxxPvARrM3CjyjEjc+jt9PrFci6l1PZt1Bt6R
	WgddtbRDscVZ6OwFnGb5Lvplo1NSElL2RE9EK/wruLv5T5moNkZXyw+9ILXcdYYC/bpDUO
	jWiXQ3RqpVQkvYo+s8GtaCqvJFLLR+8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-knbq1hdOPo-qIGV8Qr4TAw-1; Fri,
 29 May 2026 14:37:31 -0400
X-MC-Unique: knbq1hdOPo-qIGV8Qr4TAw-1
X-Mimecast-MFC-AGG-ID: knbq1hdOPo-qIGV8Qr4TAw_1780079848
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D10D719560AA;
	Fri, 29 May 2026 18:37:27 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.101])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 979E91773;
	Fri, 29 May 2026 18:37:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v15 5/6] drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
Date: Fri, 29 May 2026 14:34:03 -0400
Message-ID: <20260529183702.677677-6-lyude@redhat.com>
In-Reply-To: <20260529183702.677677-1-lyude@redhat.com>
References: <20260529183702.677677-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,redhat.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63062-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 530F4607887
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

One of the complications of trying to use the shmem helpers to create a
scatterlist for shmem objects is that we need to be able to provide a
guarantee that the driver cannot be unbound for the lifetime of the
scatterlist.

The easiest way of handling this seems to be just hooking up an unmap
operation to devres the first time we create a scatterlist, which allows us
to still take advantage of gem shmem facilities without breaking that
guarantee. To allow for this, we extract __drm_gem_shmem_free_sgt_locked()
- which allows a caller (e.g. the rust bindings) to manually unmap the sgt
for a gem object as needed.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

---
V10:
* Fix incorrect function name in documentation for
  __drm_gem_shmem_release_sgt_locked()

 drivers/gpu/drm/drm_gem_shmem_helper.c | 32 +++++++++++++++++++++-----
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 545933c7f7121..c989459eb2159 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -158,6 +158,30 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+/**
+ * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and release the
+ * cached scatter/gather table for an shmem GEM object.
+ * @shmem: shmem GEM object
+ *
+ * If the passed shmem object has an active scatter/gather table for driver
+ * usage, this function will unmap it and release the memory associated with it.
+ * It is the responsibility of the caller to ensure it holds the dma_resv_lock
+ * for this object.
+ *
+ * Drivers should not need to call this function themselves, it is mainly
+ * intended for usage in the Rust shmem bindings.
+ */
+void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	sg_free_table(shmem->sgt);
+	kfree(shmem->sgt);
+	shmem->sgt = NULL;
+}
+EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);
+
 /**
  * drm_gem_shmem_release - Release resources associated with a shmem GEM object.
  * @shmem: shmem GEM object
@@ -176,12 +200,8 @@ void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem)
 
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
 
-		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(shmem->sgt);
-			kfree(shmem->sgt);
-		}
+		if (shmem->sgt)
+			__drm_gem_shmem_free_sgt_locked(shmem);
 		if (shmem->pages)
 			drm_gem_shmem_put_pages_locked(shmem);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5ccdae21b94a9..b2c23af628e1a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -111,6 +111,7 @@ int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shme
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
+void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
-- 
2.54.0


