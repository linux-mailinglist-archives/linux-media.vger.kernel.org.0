Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AE31E2048
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 12:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388831AbgEZK7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 06:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388680AbgEZK7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 06:59:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DDBC08C5C2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 03:59:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n15so10056049pfd.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sOsoHN4fXQCN9r3EwQQMoPQ7wEu7whxz64gA8BdJVX8=;
        b=k/ptBuQMW9xXNmDD0sqqPt9T74YcQoLy9NQeVObozUsHAsnxawePHofARFqBZADdk2
         uEsaQqECrXudlaY/E9TixC+HAzXMa7N0mSYcldjwYMsr1n/0dQ8Etpf5IAs+YFqSCrbj
         Rv0gqNy5UFodSX7aU/wHCuHdlfOblVxFrqIeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sOsoHN4fXQCN9r3EwQQMoPQ7wEu7whxz64gA8BdJVX8=;
        b=TF97g7kqNNA9B03b9deV3nuXe2uVaENhr4MMVn1cAFSjps9YbsPmTSAZTPMXh9PP3U
         CX7z9z4SY12RCtgrPoNMQ4eIGAGb2zoUBdeekZU8s1WxkncZTbkOfO2PaRLIb2bjiu1h
         EuV3u8TZF6WiFQRpTdphvryT3Kvsec5gkNeUKe+7EBbQr0KWAp+VYq8b9gS+L2YSJvl1
         fVfdCwgfFvnP8gCg69STfG69BO2n9EfCz+exsNvYQY6bjGQ2qhKANWEEzilTYf2MJkgv
         /19Jk++lYisI94HzksJFpQL/7N8c/3SVU555Y4P4wtKoaV9SlE619sH8OVqjfTzlikLJ
         IzQg==
X-Gm-Message-State: AOAM531JlJD37eB4Y5x6JzReM3J4z4/uMY4Oxcl6lC/BRBvSKdLCLrpS
        ku6di3qDmsJ/U3t87LyMOPBBEA==
X-Google-Smtp-Source: ABdhPJySQvEfVD0v45/DoLGrywVkZ5ujfUgIBevN8GVj9NW8LcC3K7i00Bv3teenrgdD5JQMiplMhw==
X-Received: by 2002:a63:4563:: with SMTP id u35mr505559pgk.163.1590490776430;
        Tue, 26 May 2020 03:59:36 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id w192sm15578250pff.126.2020.05.26.03.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 03:59:35 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v4 2/3] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date:   Tue, 26 May 2020 19:58:10 +0900
Message-Id: <20200526105811.30784-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
In-Reply-To: <20200526105811.30784-1-stevensd@chromium.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This feature allows the guest to request a UUID from the host for a
particular virtio_gpu resource. The UUID can then be shared with other
virtio devices, to allow the other host devices to access the
virtio_gpu's corresponding host resource.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 include/uapi/linux/virtio_gpu.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0c85914d9369..9721d58b4d58 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -50,6 +50,10 @@
  * VIRTIO_GPU_CMD_GET_EDID
  */
 #define VIRTIO_GPU_F_EDID                1
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID
+ */
+#define VIRTIO_GPU_F_RESOURCE_UUID       2
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -66,6 +70,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_GET_CAPSET_INFO,
 	VIRTIO_GPU_CMD_GET_CAPSET,
 	VIRTIO_GPU_CMD_GET_EDID,
+	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -87,6 +92,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_CAPSET_INFO,
 	VIRTIO_GPU_RESP_OK_CAPSET,
 	VIRTIO_GPU_RESP_OK_EDID,
+	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -340,4 +346,17 @@ enum virtio_gpu_formats {
 	VIRTIO_GPU_FORMAT_R8G8B8X8_UNORM  = 134,
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID */
+struct virtio_gpu_resource_assign_uuid {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 padding;
+};
+
+/* VIRTIO_GPU_RESP_OK_RESOURCE_UUID */
+struct virtio_gpu_resp_resource_uuid {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__u8 uuid[16];
+};
+
 #endif
-- 
2.27.0.rc0.183.gde8f92d652-goog

