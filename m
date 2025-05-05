Return-Path: <linux-media+bounces-31748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C331FAAA366
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA67D18886E0
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F2B2F2C73;
	Mon,  5 May 2025 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm8LNfUp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3832F2C49;
	Mon,  5 May 2025 22:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483832; cv=none; b=f5+DViYJXxy66tCzRgnKwtLxq3/nu+QzoDOLYgkKuWajfpHszvTdeP0mvRmcB618Zhsyn19W9DaVSkcLz0gJ+Zc/hlFBMMLGLBFtOt5B+7F8USL/7png8h1kUEC/ewUuV+Csz3vURpcUG9LsvZhkaXJRKCu+1dV6ai6eoK3J2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483832; c=relaxed/simple;
	bh=26/odUkey/X+bTC+KqJYPkWtonnW+CCXpcrZT16N65M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NqogE1HnCBp6GeiJipDAolOOcOM0qPIuelEo7SSnnYqAKVIyj95l68Yq7mMdZBo/8oEdRq/jQSszjS9yFfO5yiA/zDHCVv6ARNw8chwd4R14RlBVXp8gAuK1FgrzwtOKN3anr1+X9I6i0qINt56XIjOF5UfDStAjVtLOXoBHRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm8LNfUp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56E3C4CEED;
	Mon,  5 May 2025 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483832;
	bh=26/odUkey/X+bTC+KqJYPkWtonnW+CCXpcrZT16N65M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cm8LNfUpy6l6H2psnQRq9/jjwWToHsmAtJioKUlDYYDiq2KEYYtgS6flMVxQT9Gfn
	 ONxjybJX2UoX6yaIW2luRFVMe09b1+bjaKNZ40PpcHw7DD8dTeNB3P8ig1kHiJsEWs
	 0z2cz2Vb5DrDyw4Bt0TgOYXp8rNBnGxiIrnff+hxFpIp5oJrYmVdiPrQh3fEX1D/JE
	 AU7WrEp4vIxs8cMYothWApz/DZ5H03eNcwe28c7KW4zSF/uKHP3MEjzg3Dei2G5AsZ
	 6QTJIuYvUSMQJDtidZJc9NxbZ6dBavmyqoA/ehggfimN0QLGBV4iHS1mewjQJ0JHxf
	 c4hltJ30857EQ==
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
Subject: [PATCH AUTOSEL 6.14 241/642] drm/gem: Test for imported GEM buffers with helper
Date: Mon,  5 May 2025 18:07:37 -0400
Message-Id: <20250505221419.2672473-241-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index ee811764c3df4..c6240bab3fa55 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -348,7 +348,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 		return -ENOENT;
 
 	/* Don't allow imported objects to be mapped */
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1178,7 +1178,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			  drm_vma_node_start(&obj->vma_node));
 	drm_printf_indent(p, indent, "size=%zu\n", obj->size);
 	drm_printf_indent(p, indent, "imported=%s\n",
-			  str_yes_no(obj->import_attach));
+			  str_yes_no(drm_gem_is_imported(obj)));
 
 	if (obj->funcs->print_info)
 		obj->funcs->print_info(p, indent, obj);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index fdae947682cd0..2bf893eabb4b2 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -35,6 +35,7 @@
  */
 
 #include <linux/kref.h>
+#include <linux/dma-buf.h>
 #include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -575,6 +576,19 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
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


