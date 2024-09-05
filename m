Return-Path: <linux-media+bounces-17634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBF96CC9C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 04:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09412284B27
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 02:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550781386C6;
	Thu,  5 Sep 2024 02:26:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934DDDA9;
	Thu,  5 Sep 2024 02:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725503163; cv=none; b=K+boK+0IoZUXqkZ4WJ5iR2fscFnk9MhG5WncLUMbfW/C6vJ6vS5pj/U9h3jBVMhZysHlGvNPWcwNbg3EHmO9hSrtkCC9fQzBlJnqRURotJi1aLeoBTgGqmomzRaqzHFsM8dE+aLqXvjwkqliRifjOwkrKud2Wz1rqzl0yZ7zsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725503163; c=relaxed/simple;
	bh=BsK0Kbg9Y5y8QeeL8Cac8ihB86HivJwSCo7SLnVaGl0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=goozyQE/xflF95Txl1Ikwj1sNs3gJIQqc0X01GEXqd9IwfzJPpLMKAZ1AsavQT+7HHtrwvlFJHFmuF1lzUiWDRTklcsT4502i6WCcFH4qkFwR4lWMC7FHpZgxcCXPxeFgbj8RbjIsXI0YzD3JJt9F5a1sEgK3tZSnN1gq/7+RHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADHquq1FtlmCrhZAQ--.14790S2;
	Thu, 05 Sep 2024 10:25:57 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: digetx@gmail.com,
	mchehab@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: vde: Convert comma to semicolon
Date: Thu,  5 Sep 2024 10:25:32 +0800
Message-Id: <20240905022532.1642653-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHquq1FtlmCrhZAQ--.14790S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF17ur4DKrWUZF4ktF1xGrg_yoW8WF4kpr
	WFgayIkFyrJFnFvw47Jw4UXFs8Jwn5taySkFW5Z3929a9xJFW2vr4IyFyUJrWktrn7Ja12
	q345XF4fWa1UZF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kK
	e7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUr2-eDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 0f48ce6f243e..ebf882198eee 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -929,13 +929,13 @@ int tegra_vde_v4l2_init(struct tegra_vde *vde)
 	media_device_init(&vde->mdev);
 	video_set_drvdata(&vde->vdev, vde);
 
-	vde->vdev.lock = &vde->v4l2_lock,
-	vde->vdev.fops = &tegra_v4l2_fops,
-	vde->vdev.vfl_dir = VFL_DIR_M2M,
-	vde->vdev.release = video_device_release_empty,
+	vde->vdev.lock = &vde->v4l2_lock;
+	vde->vdev.fops = &tegra_v4l2_fops;
+	vde->vdev.vfl_dir = VFL_DIR_M2M;
+	vde->vdev.release = video_device_release_empty;
 	vde->vdev.v4l2_dev = &vde->v4l2_dev;
-	vde->vdev.ioctl_ops = &tegra_v4l2_ioctl_ops,
-	vde->vdev.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
+	vde->vdev.ioctl_ops = &tegra_v4l2_ioctl_ops;
+	vde->vdev.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
 	vde->v4l2_dev.mdev = &vde->mdev;
 	vde->mdev.ops = &tegra_media_device_ops;
-- 
2.25.1


