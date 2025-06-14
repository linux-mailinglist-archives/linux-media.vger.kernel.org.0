Return-Path: <linux-media+bounces-34792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5EAD9A86
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 08:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 204B5189FAD8
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 06:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B105A1DE8B0;
	Sat, 14 Jun 2025 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="G10IWuIQ"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AD2AE99
	for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749883634; cv=none; b=LkEUDrWZLoBPvZKFqvfXlUNHyuK+JSS2HlLQgCFx6Z68GLlvQk5C0tYqsAZPFVbtB1k8rRHewuuUUPZUabr6h7Y1prYQFZYa4PgatKawsRDGVe5xDOBY/FeqCGMAvJpG3j3JmHE/J0q7wn5ft7sRuz8L0Rdoxh2pEzubCbOVDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749883634; c=relaxed/simple;
	bh=tkv25jCazK/RYcTFhPzg5S7Q+sTHKhwEjODU/L9rGDY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=thVU9lgFHrQJhq+tnGNoaVVDueF1g4V4ds8340vedVceFD332Mqk+67BZKTFZFLzu3bWe0wKT1xNK7YZDDEQUzMy0tt4PxjcQDReLd+mmyptYw9hokRm+Sl4DE+lFNMa5GPyUzB+VsgViXFC6dcW9RiRK1QTGLJotv7d4sRP7qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=G10IWuIQ; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1749883324;
	bh=nJVF0o25Td2Ku6Oeu6Dz9cLbO1r0f15cqJBSZSGHyoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G10IWuIQAxFhRp4mpZzNyJz74WLvj2JXyAeprIhiNal5kHUQKvxPq7KFvJABM99v/
	 aSTeIU5illSAmLio7pKQ6vwbdsLiVms884n8xzvy3amYIfmDRwL/jru7/8gALuTm3E
	 eJqS9ty9GzyixHZ+Rt50OqYiuG8j/ykqvQM6rsLI=
Received: from localhost.localdomain ([116.30.140.36])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 8E2AF2EF; Sat, 14 Jun 2025 14:35:34 +0800
X-QQ-mid: xmsmtpt1749882934trwr82nsp
Message-ID: <tencent_F17FCCD7216F8C3E86E3BF032289559E9409@qq.com>
X-QQ-XMAILINFO: NHgT31LhP5vDwWcrDIdsq3Uw1S5lk/Q9d8Dj2NOEZZCTERuFMoeeE83A7UntcB
	 5K5i7F7jICUOjurh32uhjrzUI/y7cTrnXq948FDY5zKrZLmCtSkn6R8F7+/X9kSGSLiiJxIh5N+q
	 vdmHa6QChPO+Jd8FNDOhtDrTmNtPCDv7J01zNH20ANMcCLjIjIzrwSOUIqTJW8ubE42d959DC46v
	 YTsSwlfoDA7AbpyfaaQSUyrpuh8o+T/9g/4ulQUlFWndWXW0Jq21RDzJ2B/eyZhA3gst9Cqau/EQ
	 agHYbgODG7acsiVT801zv+cpyoh6bInXWfIgqsmsKlSmAT7BqKe3N6VTSkAbenig8Vuow6q1LWo2
	 KnLxFdwoqqCkF15xxPgs5pH8f6pNt2Lz33384LXi0C9+z2gdBoM1stJhwfFd873qVs4BGm2dHZ15
	 //r2gx+x+3ju2bK5FzQlzd2Emnoki0E5ITAiGzDAynqjicxKqsDypqIqfKkyFrHFDqs5ZM9uhliM
	 xN14og96yMtfCtZUh5nspo5YfAUMbnDAm8dgaygKQARnjEI3dPdj5uKgEBctgVUUJKI+GJlbfhyq
	 TNVOVmfTu6DHqC+2ipH8xxI1LHVvB1vnurA+2FTriU8WwlcuW8nKDLmNp9VIqFJbQTeBh951EoxO
	 HnP6RB6qmA+gIczG117yAjEiyVjqLEIXIvLfgbHXgR7jHJHCSMCjwCRCwSeFLEbmhyxzrVMuO2Xb
	 yGC+q6u+o1SAq/qc7uqPOeKuxvtPYiSvfUw9AT7P4maKWSmygMNX37ss13QGnNC4PruakUVqX32B
	 CD9uBF+Zqho0cZHtxKUZMxSRmYaMOraT+ZfszLD02YL+ajYP5uASHQDfoTdgRvgHAG6iyfpdcrat
	 CF7H4aSqivo2Ms/SVcPbBZohECEkQLmadXuYaDC1sg7SJIY7ZTMih110vZZphDE/aVMXV4PYJn5i
	 FjlOh5KgbUGsNNgBPv6xiDJUKSXNi3yH4bLEqPC1+EAxoxa7IY4VTdC9NxlaesGjkwCwNOMhkWnk
	 AG4wl84eNYc48wWJ2YmQm+wRV8CPMxVkvg5MDTDSJZVPBgjK9YITxkTsZPeqVB4nSVndWHkEQe3Y
	 ifNnpW0O6Cocz9jBvbjFwjISAnXFtYsk7X3DUA
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Haipeng Jiang <haipengjiang@foxmail.com>
To: ribalda@chromium.org
Cc: bartosz.golaszewski@linaro.org,
	haipengjiang@foxmail.com,
	hljunggr@cisco.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	make24@iscas.ac.cn,
	mchehab@kernel.org,
	sebastian.fricke@collabora.com,
	viro@zeniv.linux.org.uk
Subject: [PATCH v2] media: v4l2-dev: implement wrap-around search in devnode_find
Date: Sat, 14 Jun 2025 14:34:55 +0800
X-OQ-MSGID: <20250614063455.1304-1-haipengjiang@foxmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
In-Reply-To: <CANiDSCvB+qeBW7aPvBo_--J8gw3s3auhmy78VtkmMRReyg0-wQ@mail.gmail.com>
References: <CANiDSCvB+qeBW7aPvBo_--J8gw3s3auhmy78VtkmMRReyg0-wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved wrap-around search logic into devnode_find() to avoid redundant
lookups when nr=0. Returns -ENOSPC when device node numbers are
exhausted.

Signed-off-by: Haipeng Jiang <haipengjiang@foxmail.com>
---
Changes in v2:
- Implemented wrap-around search logic directly in devnode_find()

 drivers/media/v4l2-core/v4l2-dev.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d9..39e175d529a4 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -138,10 +138,22 @@ static inline void devnode_clear(struct video_device *vdev)
 	clear_bit(vdev->num, devnode_bits(vdev->vfl_type));
 }
 
-/* Try to find a free device node number in the range [from, to> */
+/* Try to find a free device node number in the range [from, to>, wrapping */
 static inline int devnode_find(struct video_device *vdev, int from, int to)
 {
-	return find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
+	int ret;
+
+	ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
+
+	if (ret == to) {
+		if (from == 0)
+			return -ENOSPC;
+		ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), from, 0);
+		if (ret == from)
+			return -ENOSPC;
+	}
+
+	return ret;
 }
 
 struct video_device *video_device_alloc(void)
@@ -995,9 +1007,7 @@ int __video_register_device(struct video_device *vdev,
 	/* Pick a device node number */
 	mutex_lock(&videodev_lock);
 	nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
-	if (nr == minor_cnt)
-		nr = devnode_find(vdev, 0, minor_cnt);
-	if (nr == minor_cnt) {
+	if (nr == -ENOSPC) {
 		pr_err("could not get a free device node number\n");
 		mutex_unlock(&videodev_lock);
 		return -ENFILE;
-- 
2.46.2.windows.1


