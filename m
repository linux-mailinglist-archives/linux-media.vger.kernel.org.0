Return-Path: <linux-media+bounces-880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD17F5BD6
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 11:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 149CAB21032
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 10:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AA32233E;
	Thu, 23 Nov 2023 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QsA6FLhn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB571A4
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 02:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700733716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5brA6v9GIkPrqicr9iKgBwqMQyKq2uNrSUG9g8TmGic=;
	b=QsA6FLhnYTS/uf98gFpxDHP0/55BJ2tAxJ/PLEsq/RGZpdemCgW93rs72AcznQyq3F/9as
	KVrgoK25zvumR5rruNe1EExxIDyC3X1xfiq0gOV6zmLSI6kCxxC4WL1DuHARWj5A0P+bFt
	qleXqznKXGKD/znf/y5yWXxJoLMngd0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-gALGPHaKN5qNks4sawXDPA-1; Thu, 23 Nov 2023 05:01:54 -0500
X-MC-Unique: gALGPHaKN5qNks4sawXDPA-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42387bd2759so7455601cf.2
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 02:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700733714; x=1701338514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5brA6v9GIkPrqicr9iKgBwqMQyKq2uNrSUG9g8TmGic=;
        b=Ysl914LJ3wOiKkaLBH+eWqVKoqpFQljR1+ufG0ow2qQVO36KD3/MVIMe+z6iLUTp4z
         oIVrWnLcoP2UwiFb7Gvh9jm3hh2e2ug1MkvTJcTR/56/NfX5j3zYuCggI5edmxINjwtP
         oQzkzl5wX8p2qjvZvOdu/CKXp//srV42HtsN67l2pLmnjjejm34H6lzRAbCV85taNW3J
         DQ3KHbE6HrUYPp1d9K1UvQ60GCzFgQv8FakAxy34l9sLQtRYvGg6VosC0LwpBKxmr19Y
         nINoUpTTTHj2oMC+SHhGV+qZpXjiSM0AGKVXJoinTVGqZUcS/7nRkMe8vtGmrDDUFpRd
         1l4w==
X-Gm-Message-State: AOJu0YzeGHg8JSEIGDfIdgrBOwRRmg0GAWtinM2pZI/hNt/OHsl+ZNri
	ruc71p6mdO6dLdZn08zr9qb91Mk93Ob1d8JBuQ+Exc1jUuCr+hQTPgb5Joly0z/GNb4IgnFLoqs
	vBPxYaT4KRomBF++jtS9CWQ==
X-Received: by 2002:a05:622a:3c9:b0:418:111e:790f with SMTP id k9-20020a05622a03c900b00418111e790fmr5654594qtx.65.1700733714104;
        Thu, 23 Nov 2023 02:01:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvHg0tRlgUvVn/+tvqhZmHQowz5r4phoK+xpee1boxL2p91C/N57QtufTGAezTfaYVuBO12g==
X-Received: by 2002:a05:622a:3c9:b0:418:111e:790f with SMTP id k9-20020a05622a03c900b00418111e790fmr5654573qtx.65.1700733713739;
        Thu, 23 Nov 2023 02:01:53 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-24-178.cust.vodafonedsl.it. [2.34.24.178])
        by smtp.gmail.com with ESMTPSA id k10-20020ac8604a000000b00417db2593bdsm355037qtm.72.2023.11.23.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:01:53 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian Koenig <christian.koenig@amd.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4] drm/test: add a test suite for GEM objects backed by shmem
Date: Thu, 23 Nov 2023 11:01:46 +0100
Message-ID: <20231123100147.212645-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces an initial KUnit test suite for GEM objects
backed by shmem buffers.

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marco Pagani <marpagan@redhat.com>

v4:
- Add missing MMU dependency for DRM_GEM_SHMEM_HELPER (kernel test robot)
v3:
- Explicitly cast pointers in the helpers
- Removed unused pointer to parent dev in struct fake_dev
- Test entries reordering in Kconfig and Makefile sent as a separate patch
v2:
- Improved description of test cases
- Cleaner error handling using KUnit actions
- Alphabetical order in Kconfig and Makefile
---
 drivers/gpu/drm/Kconfig                    |   3 +-
 drivers/gpu/drm/tests/Makefile             |   1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 385 +++++++++++++++++++++
 3 files changed, 388 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index cdbc56e07649..435dca95fac8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -74,12 +74,13 @@ config DRM_KUNIT_TEST_HELPERS
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
-	depends on DRM && KUNIT
+	depends on DRM && KUNIT && MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
 	select DRM_LIB_RANDOM
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 2645af241ff0..d6183b3d7688 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
+	drm_gem_shmem_test.o \
 	drm_managed_test.o \
 	drm_mm_test.o \
 	drm_modes_test.o \
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
new file mode 100644
index 000000000000..a60c2a28a92a
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test suite for GEM objects backed by shmem buffers
+ *
+ * Copyright (C) 2023 Red Hat, Inc.
+ *
+ * Author: Marco Pagani <marpagan@redhat.com>
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/iosys-map.h>
+#include <linux/sizes.h>
+
+#include <kunit/test.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_kunit_helpers.h>
+
+#define TEST_SIZE		SZ_1M
+#define TEST_BYTE		0xae
+
+/*
+ * Wrappers to avoid an explicit type casting when passing action
+ * functions to kunit_add_action().
+ */
+static void kfree_wrapper(void *ptr)
+{
+	const void *obj = ptr;
+
+	kfree(obj);
+}
+
+static void sg_free_table_wrapper(void *ptr)
+{
+	struct sg_table *sgt = ptr;
+
+	sg_free_table(sgt);
+}
+
+static void drm_gem_shmem_free_wrapper(void *ptr)
+{
+	struct drm_gem_shmem_object *shmem = ptr;
+
+	drm_gem_shmem_free(shmem);
+}
+
+/*
+ * Test creating a shmem GEM object backed by shmem buffer. The test
+ * case succeeds if the GEM object is successfully allocated with the
+ * shmem file node and object functions attributes set, and the size
+ * attribute is equal to the correct size.
+ */
+static void drm_gem_shmem_test_obj_create(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_EXPECT_EQ(test, shmem->base.size, TEST_SIZE);
+	KUNIT_EXPECT_NOT_NULL(test, shmem->base.filp);
+	KUNIT_EXPECT_NOT_NULL(test, shmem->base.funcs);
+
+	drm_gem_shmem_free(shmem);
+}
+
+/*
+ * Test creating a shmem GEM object from a scatter/gather table exported
+ * via a DMA-BUF. The test case succeed if the GEM object is successfully
+ * created with the shmem file node attribute equal to NULL and the sgt
+ * attribute pointing to the scatter/gather table that has been imported.
+ */
+static void drm_gem_shmem_test_obj_create_private(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *gem_obj;
+	struct dma_buf buf_mock;
+	struct dma_buf_attachment attach_mock;
+	struct sg_table *sgt;
+	char *buf;
+	int ret;
+
+	/* Create a mock scatter/gather table */
+	buf = kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, sgt);
+
+	ret = kunit_add_action_or_reset(test, kfree_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sg_init_one(sgt->sgl, buf, TEST_SIZE);
+
+	/* Init a mock DMA-BUF */
+	buf_mock.size = TEST_SIZE;
+	attach_mock.dmabuf = &buf_mock;
+
+	gem_obj = drm_gem_shmem_prime_import_sg_table(drm_dev, &attach_mock, sgt);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
+	KUNIT_EXPECT_EQ(test, gem_obj->size, TEST_SIZE);
+	KUNIT_EXPECT_NULL(test, gem_obj->filp);
+	KUNIT_EXPECT_NOT_NULL(test, gem_obj->funcs);
+
+	/* The scatter/gather table will be freed by drm_gem_shmem_free */
+	kunit_remove_action(test, sg_free_table_wrapper, sgt);
+	kunit_remove_action(test, kfree_wrapper, sgt);
+
+	shmem = to_drm_gem_shmem_obj(gem_obj);
+	KUNIT_EXPECT_PTR_EQ(test, shmem->sgt, sgt);
+
+	drm_gem_shmem_free(shmem);
+}
+
+/*
+ * Test pinning backing pages for a shmem GEM object. The test case
+ * succeeds if a suitable number of backing pages are allocated, and
+ * the pages table counter attribute is increased by one.
+ */
+static void drm_gem_shmem_test_pin_pages(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	int i, ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_EXPECT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_pin(shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
+
+	for (i = 0; i < (shmem->base.size >> PAGE_SHIFT); i++)
+		KUNIT_ASSERT_NOT_NULL(test, shmem->pages[i]);
+
+	drm_gem_shmem_unpin(shmem);
+	KUNIT_EXPECT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
+}
+
+/*
+ * Test creating a virtual mapping for a shmem GEM object. The test
+ * case succeeds if the backing memory is mapped and the reference
+ * counter for virtual mapping is increased by one. Moreover, the test
+ * case writes and then reads a test pattern over the mapped memory.
+ */
+static void drm_gem_shmem_test_vmap(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct iosys_map map;
+	int ret, i;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_EXPECT_NULL(test, shmem->vaddr);
+	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_vmap(shmem, &map);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
+	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
+	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 1);
+
+	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
+	for (i = 0; i < TEST_SIZE; i++)
+		KUNIT_EXPECT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
+
+	drm_gem_shmem_vunmap(shmem, &map);
+	KUNIT_EXPECT_NULL(test, shmem->vaddr);
+	KUNIT_EXPECT_EQ(test, shmem->vmap_use_count, 0);
+}
+
+/*
+ * Test exporting a scatter/gather table of pinned pages suitable for
+ * PRIME usage from a shmem GEM object. The test case succeeds if a
+ * scatter/gather table large enough to accommodate the backing memory
+ * is successfully exported.
+ */
+static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, len = 0;
+	int ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_pin(shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sgt = drm_gem_shmem_get_sg_table(shmem);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+	KUNIT_EXPECT_NULL(test, shmem->sgt);
+
+	ret = kunit_add_action_or_reset(test, sg_free_table_wrapper, sgt);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		KUNIT_EXPECT_NOT_NULL(test, sg);
+		len += sg->length;
+	}
+
+	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
+}
+
+/*
+ * Test pinning pages and exporting a scatter/gather table suitable for
+ * driver usage from a shmem GEM object. The test case succeeds if the
+ * backing pages are pinned and a scatter/gather table large enough to
+ * accommodate the backing memory is successfully exported.
+ */
+static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	unsigned int si, ret, len = 0;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* The scatter/gather table will be freed by drm_gem_shmem_free */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
+	KUNIT_EXPECT_PTR_EQ(test, sgt, shmem->sgt);
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		KUNIT_EXPECT_NOT_NULL(test, sg);
+		len += sg->length;
+	}
+
+	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
+}
+
+/*
+ * Test updating the madvise state of a shmem GEM object. The test
+ * case checks that the function for setting madv updates it only if
+ * its current value is greater or equal than zero and returns false
+ * if it has a negative value.
+ */
+static void drm_gem_shmem_test_madvise(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	int ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+	KUNIT_ASSERT_EQ(test, shmem->madv, 0);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_madvise(shmem, 1);
+	KUNIT_EXPECT_TRUE(test, ret);
+	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
+
+	/* Set madv to a negative value */
+	ret = drm_gem_shmem_madvise(shmem, -1);
+	KUNIT_EXPECT_FALSE(test, ret);
+	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
+
+	/* Check that madv cannot be set back to a positive value */
+	ret = drm_gem_shmem_madvise(shmem, 0);
+	KUNIT_EXPECT_FALSE(test, ret);
+	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
+}
+
+/*
+ * Test purging a shmem GEM object. First, assert that a newly created
+ * shmem GEM object is not purgeable. Then, set madvise to a positive
+ * value and call drm_gem_shmem_get_pages_sgt() to pin and dma-map the
+ * backing pages. Finally, assert that the shmem GEM object is now
+ * purgeable and purge it.
+ */
+static void drm_gem_shmem_test_purge(struct kunit *test)
+{
+	struct drm_device *drm_dev = test->priv;
+	struct drm_gem_shmem_object *shmem;
+	struct sg_table *sgt;
+	int ret;
+
+	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
+
+	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_gem_shmem_is_purgeable(shmem);
+	KUNIT_EXPECT_FALSE(test, ret);
+
+	ret = drm_gem_shmem_madvise(shmem, 1);
+	KUNIT_EXPECT_TRUE(test, ret);
+
+	/* The scatter/gather table will be freed by drm_gem_shmem_free */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
+
+	ret = drm_gem_shmem_is_purgeable(shmem);
+	KUNIT_EXPECT_TRUE(test, ret);
+
+	drm_gem_shmem_purge(shmem);
+	KUNIT_EXPECT_NULL(test, shmem->pages);
+	KUNIT_EXPECT_NULL(test, shmem->sgt);
+	KUNIT_EXPECT_EQ(test, shmem->madv, -1);
+}
+
+static int drm_gem_shmem_test_init(struct kunit *test)
+{
+	struct device *dev;
+	struct fake_dev {
+		struct drm_device drm_dev;
+	} *fdev;
+
+	/* Allocate a parent device */
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	/*
+	 * The DRM core will automatically initialize the GEM core and create
+	 * a DRM Memory Manager object which provides an address space pool
+	 * for GEM objects allocation.
+	 */
+	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
+						 drm_dev, DRIVER_GEM);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
+
+	test->priv = &fdev->drm_dev;
+
+	return 0;
+}
+
+static struct kunit_case drm_gem_shmem_test_cases[] = {
+	KUNIT_CASE(drm_gem_shmem_test_obj_create),
+	KUNIT_CASE(drm_gem_shmem_test_obj_create_private),
+	KUNIT_CASE(drm_gem_shmem_test_pin_pages),
+	KUNIT_CASE(drm_gem_shmem_test_vmap),
+	KUNIT_CASE(drm_gem_shmem_test_get_pages_sgt),
+	KUNIT_CASE(drm_gem_shmem_test_get_sg_table),
+	KUNIT_CASE(drm_gem_shmem_test_madvise),
+	KUNIT_CASE(drm_gem_shmem_test_purge),
+	{}
+};
+
+static struct kunit_suite drm_gem_shmem_suite = {
+	.name = "drm_gem_shmem",
+	.init = drm_gem_shmem_test_init,
+	.test_cases = drm_gem_shmem_test_cases
+};
+
+kunit_test_suite(drm_gem_shmem_suite);
+
+MODULE_LICENSE("GPL");

base-commit: c79b972eb88b077d2765e7790d0902b3dc94d55c
-- 
2.42.0


