Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E25F1F31F8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 03:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgFIB0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 21:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgFIB0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 21:26:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C61C03E97C
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 18:26:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r18so3290535pgk.11
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JcU5U23cBSwvRc+LtHthzK2bgv5UkiuTgYVD/tH+hs=;
        b=Cclz/uvTZow4B0U1qRKpIfedIS/qqqFD/W97f4FWTTgUSIgv5MGyWTfjOvzKfgeLOS
         XucPlkUB5NvC6iuas7lwY8RoBFAaZwTSekkX5ONXimlVNrv/IdRe4I+ZIXYigrvhnBa1
         4eV20PnF8eKBbiOw07YVzba/YTQJnkyoClYnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JcU5U23cBSwvRc+LtHthzK2bgv5UkiuTgYVD/tH+hs=;
        b=cGO4cfsBZTMxF/5/alCVtO2+KdeSfNFrAmxfvevhASzYE3gjE10T8IIMZ9x/9WKG2E
         a6+0ALDqIiPGcxOAAuKJdriPTZnCdJC9p/pLP0Fy4Fw73CzM2MoKmbN/LTeUS3tExOhp
         RyKZz/Sd8/mCgGuUL+rrRX8RK5havrLAiUZCaL1SLBWl/O/xQhpBOe3sNR2yWEoPXAyj
         Wb13GwJEd3yJ5PU7qFSO4ctdzjeihxFVTSXiqFUMQSGpf34qGhvoD6JOHupQUkF2ufeO
         Spe1CsrhIE36kcUDsXPHRBLkhsRfAfCULDxepyd4ta6Ss5SNRJQK30fqK2xE5z2yaKcn
         Yt3A==
X-Gm-Message-State: AOAM533n+O+8d0INY+2RzG4BYRZe5IjPIUvK1j6pfyGEA14Cqy8AfGZb
        m4y6i/3yosWoTG5he++H0yH5sQ==
X-Google-Smtp-Source: ABdhPJxDYHDpKVwmHopOckTvIsUrO91C7ORl9ZYyWvYZJF7nmNr+1OKYYDjRxDMq6z9pHOquVX5rcw==
X-Received: by 2002:a62:2ccb:: with SMTP id s194mr17897487pfs.127.1591665965055;
        Mon, 08 Jun 2020 18:26:05 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id w65sm8051336pfb.160.2020.06.08.18.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 18:26:04 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v5 2/3] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date:   Tue,  9 Jun 2020 10:25:17 +0900
Message-Id: <20200609012518.198908-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200609012518.198908-1-stevensd@chromium.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
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
2.27.0.278.ge193c7cf3a9-goog

