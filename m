Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151BB30D400
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 08:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhBCHXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 02:23:52 -0500
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:34219 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231465AbhBCHXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 02:23:51 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UNkEs0-_1612336976;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UNkEs0-_1612336976)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 03 Feb 2021 15:23:04 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     alexander.deucher@amd.com
Cc:     christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/amdgpu:  convert sysfs sprintf/snprintf family to sysfs_emit
Date:   Wed,  3 Feb 2021 15:22:53 +0800
Message-Id: <1612336973-70151-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coccicheck warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:207:8-16: WARNING: use
scnprintf or sprintf.

 ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:185:8-16: WARNING: use
scnprintf or sprintf.

./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:163:8-16: WARNING: use
scnprintf or sprintf.

./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:139:8-16: WARNING: use
scnprintf or sprintf.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cab1eba..89b5e7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -136,7 +136,7 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint64_t cnt = amdgpu_asic_get_pcie_replay_count(adev);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n", cnt);
+	return sysfs_emit(buf, "%llu\n", cnt);
 }
 
 static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
@@ -160,7 +160,7 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_name);
+	return sysfs_emit(buf, "%s\n", adev->product_name);
 }
 
 static DEVICE_ATTR(product_name, S_IRUGO,
@@ -182,7 +182,7 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_number);
+	return sysfs_emit(buf, "%s\n", adev->product_number);
 }
 
 static DEVICE_ATTR(product_number, S_IRUGO,
@@ -204,7 +204,7 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", adev->serial);
+	return sysfs_emit(buf, "%s\n", adev->serial);
 }
 
 static DEVICE_ATTR(serial_number, S_IRUGO,
-- 
1.8.3.1

