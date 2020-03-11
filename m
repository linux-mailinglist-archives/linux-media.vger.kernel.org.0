Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118D91816B1
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgCKLUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:20:35 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54241 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729139AbgCKLUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:20:34 -0400
Received: by mail-pj1-f68.google.com with SMTP id l36so840072pjb.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cT15TBA5LKwky6I17XpqvlB2rM0RmRf5dwoE+N9j/F0=;
        b=jLb9PaCcu1Yxgxj9XSJmbg2aw64Qc918LMv7DvaqgljRMLMgaFOZnRXCycakjzpX+7
         2ZrtfD25aaonB0z+oS3FYYCNc9tAbjA2vCjk+aqaK60tN2/nPrwXvhMZ3Q8XD4DL+ztA
         B+JzSmThANUXzWtraBvKk2c/KmSGv9SHjwBKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cT15TBA5LKwky6I17XpqvlB2rM0RmRf5dwoE+N9j/F0=;
        b=KwVhZ/PttSDtUO5B3PoDHMNFpSYdKhZMvYds5BdcN6rJtpKRIvoqUbo/OMmv2FN0+N
         JAWpKRIGRV2CDmxtJl5z2FcHfC7Ek9zbjBH1tBRCEkJPZLIHBKoZO3ZLBUIaXoZsalVO
         9cSxgisGPz6dZJdSQ4iFl1fXFSTikDkLd+kSlCvuUk91hIUcLONVEP3KMs/RUqAdPTi4
         XD4sLueaiD5QZ1hUuxSEPljN0YY4EPdH+xjN3yQYg80iUd8ARONYXqpDtpGtiekUUWb3
         LKEL5MZI/3jJb0LWBc4heNJUZdKScMbr/6lvjDzEUf4Et0cPpPjXoY6ewXNXuIXoxEam
         Gyrw==
X-Gm-Message-State: ANhLgQ3CgPQU8/nxIQ+YEVbpQ+fv7Cax0lnTK+PjyDJSIp0r14YtewW1
        eJzatJbjKF6xnl3N6y3+2o0YzQ==
X-Google-Smtp-Source: ADFU+vv5rHVCdF8ZEfvsDVzm/g+tdVwxntbYgjn30SLora9HrrMJHajMyu3Aca+6pJvl+7ijrruF7w==
X-Received: by 2002:a17:902:8682:: with SMTP id g2mr2578390plo.336.1583925633439;
        Wed, 11 Mar 2020 04:20:33 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id s18sm5235891pjp.24.2020.03.11.04.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 04:20:32 -0700 (PDT)
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
Subject: [PATCH v3 3/4] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date:   Wed, 11 Mar 2020 20:20:03 +0900
Message-Id: <20200311112004.47138-4-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
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
2.25.1.481.gfbce0eb801-goog

