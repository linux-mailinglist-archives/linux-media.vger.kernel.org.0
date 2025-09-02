Return-Path: <linux-media+bounces-41491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15146B3F206
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14F5E7A2BC1
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 01:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D73D2DECB0;
	Tue,  2 Sep 2025 01:54:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36951E47CA;
	Tue,  2 Sep 2025 01:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756778040; cv=none; b=Ebk/WUXc/FXag8uNFWcjfdIJwBQcEZaNmVi8UMD80M3eSY4PMlv6IvtdULidQ72YTiYY8/jdkAYpT8He2nQkdLyOgqQrxnyo/vMFz4heOH4c2ZQXTsvxJUbkX4/7I+C43LvmmNHOWlVr79sljQjCFyXpj84XeRGBXLS6hPZ/pYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756778040; c=relaxed/simple;
	bh=gGEDpj6HPGF0l1sbEdpfZZM84prvLrTBZm/HP3/S58Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kktqwYcaO3tCP/KX5sd17JhH0I22GzFCgnfllpzEKuIZS1qEGuBvJlEdkbU0xoA5S8eO0qRu93fK8FuQbeTG+X5khsFb3afZR/eUIi4wCjRl9z1qsLdPWZygB7J33OBQvNN0Yn7zxzrTCbzJopyZGVzaKkaMaz9vqVyWD3K/dQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.8])
	by mtasvr (Coremail) with SMTP id _____wAnxUEnTrZor3fHAQ--.12749S3;
	Tue, 02 Sep 2025 09:53:44 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.8])
	by mail-app4 (Coremail) with SMTP id zi_KCgCnX4YjTrZoq5OQAQ--.63161S2;
	Tue, 02 Sep 2025 09:53:42 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe
Date: Tue,  2 Sep 2025 09:53:37 +0800
Message-Id: <20250902015337.9859-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgCnX4YjTrZoq5OQAQ--.63161S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwYRAWi19vkBWgALsX
X-CM-DELIVERINFO: =?B?xMDjrQXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR19Wu3Q25TIbbUMQ/9pZDEnIrPP8aAAJ4kuICFgKPi+roAoasCVCw+AxjFHzeievyJFTu
	wR6DnTMlXT12UQqCyG6iTNmIpu95OLp9IERyT45jDwY56RGLUPGhweUz95T4gg==
X-Coremail-Antispam: 1Uk129KBj93XoW7tF4DXF13JryDtFW7uFyDArc_yoW8XF13pF
	Zxur9Y93yUJ3WUZa9Fq3W2gF95Cwsrt3yUCFZ0qayxXrnYyFy29F1rKFW8tFs7ArWUA3W2
	vr4jqa9rWFZ8CFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
INIT_DELAYED_WORK() in adv76xx_probe(), but it is never scheduled
anywhere in the probe function.

Calling cancel_delayed_work() on a work that has never been
scheduled is redundant and unnecessary, as there is no pending
work to cancel.

Remove the redundant cancel_delayed_work() from error handling
path and adjust the goto label accordingly to simplify the code
and avoid potential confusion.

Fixes: 54450f591c99 ("[media] adv7604: driver for the Analog Devices ADV7604 video decoder")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/media/i2c/adv7604.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index afed38596362..522f8181d23d 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3670,7 +3670,7 @@ static int adv76xx_probe(struct i2c_client *client)
 	err = media_entity_pads_init(&sd->entity, state->source_pad + 1,
 				state->pads);
 	if (err)
-		goto err_work_queues;
+		goto err_i2c;
 
 	/* Configure regmaps */
 	err = configure_regmaps(state);
@@ -3711,8 +3711,6 @@ static int adv76xx_probe(struct i2c_client *client)
 
 err_entity:
 	media_entity_cleanup(&sd->entity);
-err_work_queues:
-	cancel_delayed_work(&state->delayed_work_enable_hotplug);
 err_i2c:
 	adv76xx_unregister_clients(state);
 err_hdl:
-- 
2.34.1


