Return-Path: <linux-media+bounces-41488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF3B3F1CB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A681206404
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 01:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D52A2DEA89;
	Tue,  2 Sep 2025 01:11:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D5432F77F;
	Tue,  2 Sep 2025 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756775460; cv=none; b=lDWSrI+hMea5OCIgU3kV7B1gF06lsLmvhweOJtP+T4u+9k5g+LkgIDz5QRksJt4LwSOtIoJIeEXyjI/c5UoDOc9EcpC2x756O1yoHJ9BBDkAfH1mtlyRA7HPuLcq2wqoGO7U3OwpXpMW2f694l/7DcvsOoxBRiRMAAHdZ/EggBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756775460; c=relaxed/simple;
	bh=ZxaZQ26N8uaXZCYrjIxuBweBa32hf1N+DnNpIM7Fxvo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dJrm+p9ukq99HfbdEy2cykNGaULF4a7IzLopgJ1WWdIHQLjGvIMPJk8Mn69sUTHHkdAiIu3x9dczPgprSRLXH6aSEQCIVIjSRCe9Q0Em2PQ0cfrW9SU1WNDDU+cdvtmCVZ949HtOGIA9g0GY67v0folue7eiQmpvk/6poQiFc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.8])
	by mtasvr (Coremail) with SMTP id _____wCnU2kURLZoCSzHAQ--.11342S3;
	Tue, 02 Sep 2025 09:10:45 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.8])
	by mail-app4 (Coremail) with SMTP id zi_KCgAHwIYJRLZo6myQAQ--.56149S2;
	Tue, 02 Sep 2025 09:10:35 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
Date: Tue,  2 Sep 2025 09:10:31 +0800
Message-Id: <20250902011031.8519-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgAHwIYJRLZo6myQAQ--.56149S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwYRAWi19vkBWgADsf
X-CM-DELIVERINFO: =?B?VXFjNwXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19Wu3Q25TIbbUMQ/9pZDEnJ9NM7YbaCWtMazbrM+eT+Aim1LB1IIbhK728V34N9kgfSN
	aVFMYQy6PwxmU3Rwm3xf3lVb3w2q6CvfmTVRCP8SYqwwOSiLqq/d313a0Ftg1g==
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4DXF13JryDtFW7Cw18CrX_yoW8Xr1DpF
	Z09ryakFWUJ3WIv3Z7tF1ava4ruws2q3y7GrZ0g3yxX395JF12gFyrKFyrtF9rCrW8Za4I
	vr4YqFZ7uFs0kFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU26pBDUUUU

The delayed_work delayed_work_enable_hotplug is initialized with
INIT_DELAYED_WORK() in adv7842_probe(), but it is never scheduled
anywhere in the probe function.

Calling cancel_delayed_work() on a work that has never been
scheduled is redundant and unnecessary, as there is no pending
work to cancel.

Remove the redundant cancel_delayed_work() from error handling
path and adjust the goto label accordingly to simplify the code
and avoid potential confusion.

Fixes: a89bcd4c6c20 ("[media] adv7842: add new video decoder driver")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/media/i2c/adv7842.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 5545cd23e113..926840c964f7 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3626,7 +3626,7 @@ static int adv7842_probe(struct i2c_client *client)
 	err = media_entity_pads_init(&sd->entity, ADV7842_PAD_SOURCE + 1,
 				     state->pads);
 	if (err)
-		goto err_work_queues;
+		goto err_i2c;
 
 	err = adv7842_core_init(sd);
 	if (err)
@@ -3647,8 +3647,6 @@ static int adv7842_probe(struct i2c_client *client)
 
 err_entity:
 	media_entity_cleanup(&sd->entity);
-err_work_queues:
-	cancel_delayed_work(&state->delayed_work_enable_hotplug);
 err_i2c:
 	adv7842_unregister_clients(sd);
 err_hdl:
-- 
2.34.1


