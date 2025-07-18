Return-Path: <linux-media+bounces-38051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B7B0A01B
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 11:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235585A3D0A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 09:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF6229C34E;
	Fri, 18 Jul 2025 09:51:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0339229B782;
	Fri, 18 Jul 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752832275; cv=none; b=kyt6txfc8bI6KEc5Ns1pIex1aoQ8NFHVsXeiMBssgxF8sHOEeT8wSSljf40mWNC5dfh3Gf/guHYeNquzp5NuVCGXm2wqiOB5WlXq6f8G00s/v1yHN6tvSvQxDyWTPzEMP/L6Jc+019DWkTVe8K6nU7502r90jUvu+sjsu6oohxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752832275; c=relaxed/simple;
	bh=UfV5zCSpKR36re8etBdjF3a3hCYe9pF4pHNVgg4nTZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=utdswzRaMlyRF0zBJ7/AcG13EDa6lqHs/C+DvPtpC0VEfe5ApaOe7e2fpLwMVRnwl28fMbwDL38A67kSxBXy/fRUdCl1xUzW6/wpl7UBaQZR8t4VBGTa/wS2ok30dW2w96HH4467kgRc+VCaLzly/ifx8yu7M+T4mazo3nD4VWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [211.71.28.34])
	by APP-03 (Coremail) with SMTP id rQCowADHIYP_GHpoX9kvBQ--.12335S2;
	Fri, 18 Jul 2025 17:51:05 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: sean@mess.org,
	mchehab@kernel.org
Cc: akpm@linux-foundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: lirc: Fix error handling in lirc_register()
Date: Fri, 18 Jul 2025 17:50:54 +0800
Message-Id: <20250718095054.3403732-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHIYP_GHpoX9kvBQ--.12335S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JFWkXr18uFy5XF43JFy7Jrb_yoW8JF45pa
	4UGas0yFyDKr4qgr4DXw1UuFy5Ga1fta1SkFyfWw1xWr95X3yktFWYqr1xJ34rJFZrAF4U
	Xrn3Aa4kuF1UuF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0_-BDUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

When cdev_device_add() failed, calling put_device() to explicitly
release dev->lirc_dev. Otherwise, it could cause the fault of the
reference count.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: a6ddd4fecbb0 ("media: lirc: remove last remnants of lirc kapi")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- move get_device() before cdev_device_add() to adjust the timing of parent device reference.
---
 drivers/media/rc/lirc_dev.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index a2257dc2f25d..7d4942925993 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -736,11 +736,11 @@ int lirc_register(struct rc_dev *dev)
 
 	cdev_init(&dev->lirc_cdev, &lirc_fops);
 
+	get_device(&dev->dev);
+
 	err = cdev_device_add(&dev->lirc_cdev, &dev->lirc_dev);
 	if (err)
-		goto out_ida;
-
-	get_device(&dev->dev);
+		goto out_put_device;
 
 	switch (dev->driver_type) {
 	case RC_DRIVER_SCANCODE:
@@ -764,7 +764,8 @@ int lirc_register(struct rc_dev *dev)
 
 	return 0;
 
-out_ida:
+out_put_device:
+	put_device(&dev->lirc_dev);
 	ida_free(&lirc_ida, minor);
 	return err;
 }
-- 
2.25.1


