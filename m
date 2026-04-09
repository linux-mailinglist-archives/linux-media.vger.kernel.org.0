Return-Path: <linux-media+bounces-58294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBxdDfXv1mmNJwgAu9opvQ
	(envelope-from <linux-media+bounces-58294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 02:16:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 814273C4F40
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 02:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 474BB302DA2D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 00:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3049224728F;
	Thu,  9 Apr 2026 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHJWcoWB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64176194C98
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 00:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693791; cv=none; b=TF4ddrw9z3ATUwzbKayigvXGu0V9qDhEHJKiomAf1gA2wDd6Kr1urnZGqaFFooEilyANKmBntYPEsyOxFge2jYgbsGjbjw2B3MoOHUihElVwOjaza6aAntTS1JlMP95aWOOz6fiOuP86EhSoqP8JN7PlkT9USsjG8BPTM8ILBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693791; c=relaxed/simple;
	bh=oGvJoS7paCHpuGja+oml8uJIrV99rHOu13DXbLGc7x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aN0SndWQ4shxYJu6OO9uFmU8WEN3cD0EY+ui+i+Rmk66ovBi4gZ2ZrbbwBtzWam071ZShDZ3BBEY4s4UMsZBzakRZUgfMByGS+tR5M1XmHT6T/Eyfczp2Sf4BcIwgcDoXBrtySkdLwPxbR37chpsrWexmWtPTmiBl8fPDzVCZjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHJWcoWB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775693789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IRHIFNm2rjUvENm+hY1OchiJVsinFnXuSdTKyUKucEM=;
	b=iHJWcoWBfwhmpWjaBf7ubNwo5HUaAbNbOEjJRC33lIWdAbXlLsjz8fzJ+3SMMhooDsES/G
	DP88cL8VK6RYe0/BLi2bP5lbJ/+vjScy/ywRhxFSA7kE9Z2avCBGwhoijcU6gst0KkeAS5
	xhxgvG1MeggjXWYfZV1s8QHlTdi3yuA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-I_p55fOhPruoKIjP00dvZw-1; Wed,
 08 Apr 2026 20:16:24 -0400
X-MC-Unique: I_p55fOhPruoKIjP00dvZw-1
X-Mimecast-MFC-AGG-ID: I_p55fOhPruoKIjP00dvZw_1775693781
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D04EF18005B0;
	Thu,  9 Apr 2026 00:16:20 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.49])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A4C2300019F;
	Thu,  9 Apr 2026 00:16:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Cc: Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com,
	Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: [PATCH v10 3/5] drm/gem/shmem: Export drm_gem_shmem_get_pages_sgt_locked()
Date: Wed,  8 Apr 2026 20:12:49 -0400
Message-ID: <20260409001559.622026-4-lyude@redhat.com>
In-Reply-To: <20260409001559.622026-1-lyude@redhat.com>
References: <20260409001559.622026-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[google.com,gmail.com,oracle.com,amd.com,asahilina.net,kernel.org,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58294-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 814273C4F40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We will need this for implementing a set of SGTable bindings in Rust for
gem shmem objects, so that we can use the dma_resv lock to protect
additional resources in the shmem object.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++++++++++++-
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index addf8c1e5341e..15de7f6cc4981 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -786,12 +786,25 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
 
-static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
+/**
+ * drm_gem_shmem_get_sg_table - Under dma_resv lock, provide a scatter/gather table of
+ *				pinned pages for an shmem GEM object.
+ * @shmem: shmem GEM object
+ *
+ * This function is the same as drm_gem_shmem_get_pages_sgt, except that the caller is expected to
+ * already hold the dma_resv lock for @shmem.
+ *
+ * Returns:
+ * A poitner to the scatter/gather table of pinned pages, or error pointer on failure.
+ */
+struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 	struct sg_table *sgt;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	if (shmem->sgt)
 		return shmem->sgt;
 
@@ -822,6 +835,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	drm_gem_shmem_put_pages_locked(shmem);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt_locked);
 
 /**
  * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index b2c23af628e1a..682207ce9d1b5 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -138,6 +138,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
+struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent);
-- 
2.53.0


