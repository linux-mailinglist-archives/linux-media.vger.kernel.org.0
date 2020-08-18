Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB63247BE4
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 03:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgHRBiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 21:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgHRBiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 21:38:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E4FC061342
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:38:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 74so9130439pfx.13
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k/dwpDf9Rw0FIDL5Sc/gG8pBkCydPXuy0KjMx4jHUik=;
        b=fdP1kDUBSxES6CBl53KvmYKvwA0Z3vrdvU06fKTzc2faC/ipJowPp//eQgrYU/IjI+
         03e81fdMqVmLCHL8RLLdK90amj9EHOfIMrtMhkBIegA6+6JKv7+TVQy+VikU4L1coH6v
         gnWWxAUWbnsqfpxlyyWaPnWJEi1rr5S3uBpjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k/dwpDf9Rw0FIDL5Sc/gG8pBkCydPXuy0KjMx4jHUik=;
        b=m6w3eL/Ug32aqEw0TeoAbOmpcwqOh/GdEmrQEguqvr7vXGE3alSOUeOG0VrV4LXN36
         hGmMTE9Ns5R8XUCqNtY3/wGstZgB1k1DeT2jhosZjmaP7HpzGjhe9QBvtNKTM3gKXOmb
         fvQ633R1Ydb+7lKXQzeYvf70Hm+2611jUBJuNyWl6yESbYc/Bg8dxZmB5FhzklodaOps
         wbtC09Jfv0SKN22W3fjgl+kme/hNySBsOjFmH38Nih5x30l8LhVPdale3Uc3ysJ9+YSw
         fngYmB65oDfB89C9tc4+/Y5V516xGaUEGvok98c1RJUcGhZ76uX58MWtF5Cmkkcp/3f7
         oPdQ==
X-Gm-Message-State: AOAM5320LZpovCFQaWeLyAbLUqIiulRj7aePVNQLc2xCkPfnoVqRdX3S
        8CVkShHIJsDvn78+P8C4vn+DcQ==
X-Google-Smtp-Source: ABdhPJyE+G18ZED1RsIPBAHfBZVpK9X8xASvkbfseGEvCF+5Hsix7KEbBKj+Ji83FZjKueo2c9L1Sw==
X-Received: by 2002:a63:f24a:: with SMTP id d10mr11680932pgk.4.1597714685036;
        Mon, 17 Aug 2020 18:38:05 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
        by smtp.gmail.com with ESMTPSA id gz7sm18993784pjb.45.2020.08.17.18.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 18:38:04 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Stevens <stevensd@chromium.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: [PATCH v6 2/3] virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
Date:   Tue, 18 Aug 2020 10:37:43 +0900
Message-Id: <20200818013744.3327271-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200818013744.3327271-1-stevensd@chromium.org>
References: <20200818013744.3327271-1-stevensd@chromium.org>
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
2.28.0.220.ged08abb693-goog

