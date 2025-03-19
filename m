Return-Path: <linux-media+bounces-28466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1EEA68649
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 09:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2572E19C27B8
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 08:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546822505A3;
	Wed, 19 Mar 2025 08:03:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F7EE552;
	Wed, 19 Mar 2025 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742371396; cv=none; b=WJTi89ogWcSAYAcV7kwZlJ0l0xa+FOXmYD+aA1Oec5BuHwD17j2uCkWvVwt/eMzKRX7+Z6SrMQTQlCwHBQjrgo5VQUk/KjhX+zvK5YBwNqteJz9hweI71bRD0KiH8oA4dfHmwKMSXVAw2yJ/Xvz0ezxAzTKQlv8/OgT3k237Me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742371396; c=relaxed/simple;
	bh=WcYNaSjfXzS/GEKzqJtSGfn4MzzRLOOG5FCgssavhkI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PyuX37o6xHnVs2FfQnuE6UdEqsFXKAjqLmT1EdFQgNTRlN1MqVbERbZXatcu6q00coIZuBomNxD6WHScnxaAxsGGZWoomfr7z5+cVxuFztGIs1pdYzaNb9LUX6VY/ebLfeJjSN3rkU/2U7jwqTEVYMoTJDqMjMkCeof1IrQ3iJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowABnbysqetpnGlpAFg--.36380S2;
	Wed, 19 Mar 2025 16:03:00 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	make24@iscas.ac.cn,
	sebastian.fricke@collabora.com,
	ribalda@chromium.org,
	benjamin.gaignard@collabora.com,
	viro@zeniv.linux.org.uk,
	bartosz.golaszewski@linaro.org,
	hljunggr@cisco.com,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] media: v4l2-dev: fix error handling in __video_register_device()
Date: Wed, 19 Mar 2025 16:02:48 +0800
Message-Id: <20250319080248.1746847-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnbysqetpnGlpAFg--.36380S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryrKw45Jr17XryrKrWDCFg_yoW8KF1kp3
	4S9ay3tFWUKw4IkwsxXa1DXFyruw4Sy3WrArWrAw10k3s3urWfJry8tryUX3yUt392yF4j
	qry2qw4rXF1UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Once device_register() failed, we should call put_device() to
decrement reference count for cleanup. Or it could cause memory leak.
And move callback function v4l2_device_release() and v4l2_device_get()
before put_device().

As comment of device_register() says, 'NOTE: _Never_ directly free
@dev after calling this function, even if it returned an error! Always
use put_device() to give up the reference initialized in this function
instead.'

Found by code review.

Cc: stable@vger.kernel.org
Fixes: dc93a70cc7f9 ("V4L/DVB (9973): v4l2-dev: use the release callback from device instead of cdev")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v3:
- modified the patch to balance the v4l2_device reference count;
- changed the Fix tag as suggestions;
Changes in v2:
- modified the patch as no callback function before put_device().
---
 drivers/media/v4l2-core/v4l2-dev.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5bcaeeba4d09..4c7e1008a152 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1054,25 +1054,25 @@ int __video_register_device(struct video_device *vdev,
 	vdev->dev.class = &video_class;
 	vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
 	vdev->dev.parent = vdev->dev_parent;
+	vdev->dev.release = v4l2_device_release;
 	dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
+
+	/* Increase v4l2_device refcount*/
+	v4l2_device_get(vdev->v4l2_dev);
+
 	mutex_lock(&videodev_lock);
 	ret = device_register(&vdev->dev);
 	if (ret < 0) {
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
-		goto cleanup;
+		put_device(&vdev->dev);
+		return ret;
 	}
-	/* Register the release callback that will be called when the last
-	   reference to the device goes away. */
-	vdev->dev.release = v4l2_device_release;
-
+
 	if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
 		pr_warn("%s: requested %s%d, got %s\n", __func__,
 			name_base, nr, video_device_node_name(vdev));
 
-	/* Increase v4l2_device refcount */
-	v4l2_device_get(vdev->v4l2_dev);
-
 	/* Part 5: Register the entity. */
 	ret = video_register_media_controller(vdev);
 
-- 
2.25.1


