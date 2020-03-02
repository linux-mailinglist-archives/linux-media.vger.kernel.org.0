Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD49F175A36
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 13:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgCBMPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 07:15:50 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44649 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbgCBMPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 07:15:50 -0500
Received: by mail-pg1-f195.google.com with SMTP id a14so5334005pgb.11
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 04:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0PjKVZqL/5Sq/Vlrjx4wKontU7cZeb+ck8gZ9rnWcpM=;
        b=kr+5lA7AGDXNd+BvQnHGEUM/YIVpMyxfacyW7nSyKmfmJ396uP5V0PPdFEhY/J/GrT
         XnFMiPJIw/H18rdDZmI1srW8uWy9sb6BAkU12ExSK5qOTQUGo48VcuLz0dlmky47ozdw
         H2wdzbTsXbAseGijc2gPEB2RiJ3eoe/IqoUd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0PjKVZqL/5Sq/Vlrjx4wKontU7cZeb+ck8gZ9rnWcpM=;
        b=gTKLjJOzG9s+vUipfD91LJ7l7Ddfa9t/6HjB7Y0crhRZFGhXEj9l5bILFAE31s0y9U
         dFZj7CwC9gzCLE2ESBgLyQv8eoj8dYRua9SCeIc99usXpl2yOR2XGsmzH9bPB8l1lS9A
         aaUjjU7hEtqjt0MPbV4ar6MfZbkiLFrmn0RCTuOB6ajlBbHYk9P14iFtpEvT+4n52phJ
         d+UV/Eyw0xL05mSk9ip4uu2v3ixb24CqCyR7vSEYYmJF29igNeqfT4LAcdFy9fs8HMJc
         X8IQK9vFLcgkVy7JiXDb7GD4NSZJY+Lm/iaR+8bLyFOQvMF6m//aL2Vyhwadj0VO2CnT
         C6WQ==
X-Gm-Message-State: ANhLgQ2hBVJR8JFukdojrYF4iVt31tw3kCOjfV999Sn9n1qGp/UbQVEO
        RkLm0/S8Mz559EJi/dpz/Ag0zA==
X-Google-Smtp-Source: ADFU+vv5mcufWUUox/xVUeGl7qutZsD4Ml5QQnKXpnnlbs5XGUy1cyC9WyVCUBNHXvEEfnGjQw1kXQ==
X-Received: by 2002:a62:5c2:: with SMTP id 185mr7620057pff.175.1583151349151;
        Mon, 02 Mar 2020 04:15:49 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id y5sm20788008pfr.169.2020.03.02.04.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 04:15:48 -0800 (PST)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 3/4] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date:   Mon,  2 Mar 2020 21:15:23 +0900
Message-Id: <20200302121524.7543-4-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302121524.7543-1-stevensd@chromium.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
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
2.25.0.265.gbab2e86ba0-goog

