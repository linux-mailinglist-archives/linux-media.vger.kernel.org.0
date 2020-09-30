Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756E027E7F0
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 13:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729677AbgI3Lxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 07:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729674AbgI3Lxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 07:53:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0797C0613D6
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s12so1449173wrw.11
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qfj+TClPlVYbpelD2YZsoi79IQBZqKkdlSt5zFsjIAs=;
        b=XsLsT1M+AlmtzTtVzfmpzEdnlyNhgSN9Vm8/VlqSDOFx3bzC+XKoQ6tfO8635GE2tB
         K4vNvrMU0OcJbL5ljhMpoGtOKhgbOkp5FrOVTy+N0F82YWhBZHVCuDVdyGRE1fg1PgGn
         jzTp9PjGVE07lHazWB3jPXMvDMVbJU+/5UQOaU5HwqXr3dI68pK7GE043+co0vkKxtw+
         bpmODmoZ0zaZTG5p5ikahzCupx34VdUhGSItgXN754D+DE0eO5hlStfSH5xPGlO9LqwD
         kKr6RQDtIOXnWwTkySeNkk2hKiAqaWuGQT2si3rGDyPrmvi2QX8DxX5HrBD4MxCEz4hG
         BrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qfj+TClPlVYbpelD2YZsoi79IQBZqKkdlSt5zFsjIAs=;
        b=M0wLs2QMvcPJm0FvQlssQ+Xl7Wyt31XgbyWpNiq2hSHTZCdUyQE5+bU04JeXwyhrOz
         Bydujts6t628lD7Kbv4j+yLi1UpMuErQQlMmb3gXj29uize3KGihCWiZl2gfLwb0S4mC
         OOpx75g9eTFdxEdvY+OojgZRymKRWeLvSRt5GunEgnnZmVEIT/fvHL3DhuUhpvbxebqD
         594ncmdQS5z77O9iv9I0LlpWuK2FUcuMBK3vj8Bekle/1B6J63g4Tu4WSfeiCAD4ZmzT
         JDXSJnE3MFaXKX8d+opu6ghP9wYAiEr+ApgaXcUFiQWBoxAOCkBli+fNVaPxf94zGq0m
         QCtg==
X-Gm-Message-State: AOAM530PcNLVuri3PF+hapvBlNkeyqZjW6MPjws0f9knLL20/Zssx1t1
        dhTQO/5Uy6AGUfRpKH9bw+V6Bt78J4fIF+lh
X-Google-Smtp-Source: ABdhPJxX79nVu9DHdEnVM3doUa5RIopeAThnQgQyTX9yOm+uhr5xThuu8COX5hYqqQapikbSC/0cAQ==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr2696721wrr.283.1601466817417;
        Wed, 30 Sep 2020 04:53:37 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:53:36 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        jstephan@baylibre.com, stephane.leprovost@mediatek.com,
        gpain@baylibre.com, mturquette@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 4/4] rpmsg: apu_rpmsg: Add an IOCTL to request IOMMU mapping
Date:   Wed, 30 Sep 2020 13:53:50 +0200
Message-Id: <20200930115350.5272-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930115350.5272-1-abailon@baylibre.com>
References: <20200930115350.5272-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the kernel is automatically doing an IOMMU memory mapping.
But we want to do it automatically for two reasons:
- to reduce the overhead of each APU operation
- to get the device address and use it as input for an operation
This adds 2 IOCTL to manually IOMMU map and unmap memory.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/apu_rpmsg.c      | 52 ++++++++++++++++++++++++++++++----
 include/uapi/linux/apu_rpmsg.h |  7 +++++
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
index 343bd08a859a..4c064feddf5a 100644
--- a/drivers/rpmsg/apu_rpmsg.c
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -114,7 +114,7 @@ static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
 }
 
 static struct apu_buffer *apu_device_memory_map(struct rpmsg_apu *apu,
-		uint32_t fd, struct rpmsg_request *rpmsg_req)
+						uint32_t fd)
 {
 	struct rpmsg_device *rpdev = apu->rpdev;
 	struct apu_buffer *buffer;
@@ -129,10 +129,6 @@ static struct apu_buffer *apu_device_memory_map(struct rpmsg_apu *apu,
 	list_for_each_entry(buffer, &apu->buffers, node) {
 		if (buffer->fd == fd) {
 			kref_get(&buffer->refcount);
-			if (rpmsg_req)
-				list_add(&buffer->req_node,
-					 &rpmsg_req->buffers);
-
 			return buffer;
 		}
 	}
@@ -230,6 +226,44 @@ static void apu_device_memory_unmap(struct kref *ref)
 	kfree(buffer);
 }
 
+static int apu_iommu_mmap_ioctl(struct rpmsg_apu *apu, void __user *argp)
+{
+	struct apu_iommu_mmap apu_iommu_mmap;
+	struct apu_buffer *buffer;
+	int ret;
+
+	if (copy_from_user(&apu_iommu_mmap, argp, sizeof(apu_iommu_mmap)))
+		return -EFAULT;
+
+	buffer = apu_device_memory_map(apu, apu_iommu_mmap.fd);
+	if (!buffer)
+		return -ENOMEM;
+
+	apu_iommu_mmap.da = buffer->iova;
+	if (copy_to_user(argp, &apu_iommu_mmap, sizeof(apu_iommu_mmap)))
+		ret = -EFAULT;
+
+	return 0;
+}
+
+static int apu_iommu_munmap_ioctl(struct rpmsg_apu *apu, void __user *argp)
+{
+	u32 fd;
+	struct apu_buffer *buffer, *tmp;
+
+	if (copy_from_user(&fd, argp, sizeof(fd)))
+		return -EFAULT;
+
+	list_for_each_entry_safe(buffer, tmp, &apu->buffers, node) {
+		if (buffer->fd == fd) {
+			kref_put(&buffer->refcount, apu_device_memory_unmap);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int apu_send_request(struct rpmsg_apu *apu,
 			    struct apu_request *req)
 {
@@ -266,7 +300,7 @@ static int apu_send_request(struct rpmsg_apu *apu,
 
 	INIT_LIST_HEAD(&rpmsg_req->buffers);
 	for (i = 0; i < req->count; i++) {
-		buffer = apu_device_memory_map(apu, fd[i], rpmsg_req);
+		buffer = apu_device_memory_map(apu, fd[i]);
 		if (IS_ERR(buffer)) {
 			ret = PTR_ERR(buffer);
 			goto err_free_memory;
@@ -417,6 +451,12 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 		}
 		spin_unlock_irqrestore(&apu->ctx_lock, flags);
 
+		break;
+	case APU_IOMMU_MMAP:
+		ret = apu_iommu_mmap_ioctl(apu, argp);
+		break;
+	case APU_IOMMU_MUNMAP:
+		ret = apu_iommu_munmap_ioctl(apu, argp);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/include/uapi/linux/apu_rpmsg.h b/include/uapi/linux/apu_rpmsg.h
index f61207520254..e9b841dcbcb4 100644
--- a/include/uapi/linux/apu_rpmsg.h
+++ b/include/uapi/linux/apu_rpmsg.h
@@ -31,10 +31,17 @@ struct apu_request {
 	__u8 data[0];
 };
 
+struct apu_iommu_mmap {
+	__u32 fd;
+	__u32 da;
+};
+
 /* Send synchronous request to an APU */
 
 #define APU_SEND_REQ_IOCTL		_IOW(0xb7, 0x2, struct apu_request)
 #define APU_GET_NEXT_AVAILABLE_IOCTL	_IOR(0xb7, 0x3, __u16)
 #define APU_GET_RESP			_IOWR(0xb7, 0x4, struct apu_request)
+#define APU_IOMMU_MMAP			_IOWR(0xb7, 0x5, struct apu_iommu_mmap)
+#define APU_IOMMU_MUNMAP		_IOWR(0xb7, 0x6, __u32)
 
 #endif
-- 
2.26.2

