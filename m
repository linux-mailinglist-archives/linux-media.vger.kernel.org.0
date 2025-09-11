Return-Path: <linux-media+bounces-42242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4350B525B8
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 03:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E4366860E8
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 01:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44ECE1A0BE0;
	Thu, 11 Sep 2025 01:25:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D15F8634A;
	Thu, 11 Sep 2025 01:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553939; cv=none; b=pcJ3dP4Shrk2eH8Bfbz9SGEwFXZRQ2kmSN1E0NdZ8XbIRCnpqx1WccpPphrw2ensSBUkN0GI30JIeDtjSWqW2QGwqppRxaX71yGG38/fdTGSNfixE6wd11yuCub3AbtDU/ITJOBfip7hkDYS67MTO0wMKLcqxR2ZGd6oNqA0P4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553939; c=relaxed/simple;
	bh=ARC4W9yImfukN3E/QkzlSXFulDUOGFFRaNimHYAShCg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LdvcfFd1z1AdFJxmmlOPcZ9S9M7wyHb7c618ZC2iDr+qVN++M6HADP4NvTes07KEI4sTo72PlCO/+BmoDAq1EgAWYvq+4Jmxicb2dZzgvCRyNH7EAD0mxFLy6C0kaUoBd5h9Gftj0z20Qp0u7QXJnaI30XeboxLFwssgBJlkRHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.96.180])
	by mtasvr (Coremail) with SMTP id _____wCH17D8JMJoBvQWAg--.21736S3;
	Thu, 11 Sep 2025 09:25:17 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.96.180])
	by mail-app2 (Coremail) with SMTP id zC_KCgB3RDb5JMJoaE3iAQ--.36120S2;
	Thu, 11 Sep 2025 09:25:16 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] media: tunner: xc5000: Fix use-after-free in xc5000_release
Date: Thu, 11 Sep 2025 09:25:12 +0800
Message-Id: <20250911012512.13182-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgB3RDb5JMJoaE3iAQ--.36120S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwMGAWjB1HoA6AATs7
X-CM-DELIVERINFO: =?B?NlOx1gXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR1y0PRXPmPBWiFCKbdzE/J5zrtLIl4Q81qol5gaDs0rnZb8kKWLRtHbd2oIdehL4r1GFG
	GVC4lAYirsvrmktc4zoKxumkKM3ypSbbZFsSziedKTNq0uo2dDAg0/rYJxcpSQ==
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr1fAFyDZw13ur4xXw4UZFc_yoW8Ar4DpF
	W3ury3JFWkWrs8tws7ZF1UXFn5Zan5JF1UCFn7K3s3Aryrtr43Gr1rtF1F9FWDXr4xAw43
	Zrn8XFWaqF4qk3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

The original code uses cancel_delayed_work() in xc5000_release(), which
does not guarantee that the delayed work item timer_sleep has fully
completed if it was already running. This leads to use-after-free scenarios
where xc5000_release() may free the xc5000_priv while timer_sleep is still
active and attempts to dereference the device.

A typical race condition is illustrated below:

CPU 0 (release thread)                 | CPU 1 (delayed work callback)
xc5000_release()                       | xc5000_do_timer_sleep()
  cancel_delayed_work()                |
  hybrid_tuner_release_state(priv)     |
                                       |   priv = container_of() // UAF

Replace cancel_delayed_work() with cancel_delayed_work_sync() to ensure
that the timer_sleep is properly canceled before the xc5000_priv memory
is deallocated.

A deadlock concern was considered: xc5000_release() is called in a process
context and is not holding any locks that the timer_sleep work item might
also need. Therefore, the use of the _sync() variant is safe here.

Fixes: f7a27ff1fb77 ("[media] xc5000: delay tuner sleep to 5 seconds")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/media/tuners/xc5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index 30aa4ee958bd..ec9a3cd4784e 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -1304,7 +1304,7 @@ static void xc5000_release(struct dvb_frontend *fe)
 	mutex_lock(&xc5000_list_mutex);
 
 	if (priv) {
-		cancel_delayed_work(&priv->timer_sleep);
+		cancel_delayed_work_sync(&priv->timer_sleep);
 		hybrid_tuner_release_state(priv);
 	}
 
-- 
2.34.1


