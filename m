Return-Path: <linux-media+bounces-31767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD0AAAE33
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8163A05F6
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47612D2690;
	Mon,  5 May 2025 22:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSduMmtc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534B735AD7B;
	Mon,  5 May 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485161; cv=none; b=Y2/GOSE+MtCe8cvLMFCGTek1+aEXWQkk57h5Q4S4s4VatRG53HzYDVdhupqNGyhAr8t5BUYNpvwX4XjGw6qXrYPLKxqRALPHYGPePl7VF++Po56QWVRshHKk4f99UiOK4XuSaRDohSCOq6y1hp7ILoVStKTCUzlhEzJU35Xf/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485161; c=relaxed/simple;
	bh=HFyMkUdmp2i1AmcNJKN5YO27sA9goBlPK62HQOiBW00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jp4JQm4YnZAmi0PN4M1qIvPOj9D0s8lgL/AOwzid2k6wDluBER/m5gvtyJBtp/BH+lmIdQz9Ao5isb7Bh3oF3uS7+7W00wjdvNqZXlUn82kT7iVVWgRFeJSM2Oy9F1OQZZwo5SIu9MY54c3g2fqTM0ecIOASK38Uf5z2UpPjqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSduMmtc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE82C4CEEF;
	Mon,  5 May 2025 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485159;
	bh=HFyMkUdmp2i1AmcNJKN5YO27sA9goBlPK62HQOiBW00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSduMmtcpMferoCCI3uRF++TuHEq6/GBMqYsiYopuvpCYnc8FekLsSPA4WLkduIHW
	 VDPheD1LDV57k14SZaHK8C6byHkQkmdVAbpt0nBAl+qC7O8jn3cZWtTM8y47ht6rt7
	 ESsYg560cateYOrsVS/3uBUj2IvjxzpjfTsf5ww5eIXOSV4e1hJRp2suKfK/2JduZ3
	 hU1ANlqBH3IGQYLlja6Z1utXv7IIsNEJnsjaUVgO7pT3TSI7YIiLLrH2NeFvgUBAP2
	 CSajfN0vytK5AneDgNaxXf0jBN4UGt2ipqejHBT/2xFPHmQtPRnk+AQBDZQ5lUvbBA
	 21ES6uu69H5ZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Anusha Srivatsa <asrivats@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.12 192/486] drm/gem: Test for imported GEM buffers with helper
Date: Mon,  5 May 2025 18:34:28 -0400
Message-Id: <20250505223922.2682012-192-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit b57aa47d39e94dc47403a745e2024664e544078c ]

Add drm_gem_is_imported() that tests if a GEM object's buffer has
been imported. Update the GEM code accordingly.

GEM code usually tests for imports if import_attach has been set
in struct drm_gem_object. But attaching a dma-buf on import requires
a DMA-capable importer device, which is not the case for many serial
busses like USB or I2C. The new helper tests if a GEM object's dma-buf
has been created from the GEM object.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250226172457.217725-2-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_gem.c |  4 ++--
 include/drm/drm_gem.h     | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 149b8e25da5bb..426d0867882df 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -322,7 +322,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 		return -ENOENT;
 
 	/* Don't allow imported objects to be mapped */
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1152,7 +1152,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			  drm_vma_node_start(&obj->vma_node));
 	drm_printf_indent(p, indent, "size=%zu\n", obj->size);
 	drm_printf_indent(p, indent, "imported=%s\n",
-			  str_yes_no(obj->import_attach));
+			  str_yes_no(drm_gem_is_imported(obj)));
 
 	if (obj->funcs->print_info)
 		obj->funcs->print_info(p, indent, obj);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d8b86df2ec0da..70c0f8c83629d 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -35,6 +35,7 @@
  */
 
 #include <linux/kref.h>
+#include <linux/dma-buf.h>
 #include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -570,6 +571,19 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
 	return (obj->handle_count > 1) || obj->dma_buf;
 }
 
+/**
+ * drm_gem_is_imported() - Tests if GEM object's buffer has been imported
+ * @obj: the GEM object
+ *
+ * Returns:
+ * True if the GEM object's buffer has been imported, false otherwise
+ */
+static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
+{
+	/* The dma-buf's priv field points to the original GEM object. */
+	return obj->dma_buf && (obj->dma_buf->priv != obj);
+}
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
-- 
2.39.5


