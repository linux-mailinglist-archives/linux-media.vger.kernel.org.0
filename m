Return-Path: <linux-media+bounces-42654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 750BFB7D5D5
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1C63AD38E
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7B834F48D;
	Wed, 17 Sep 2025 09:56:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.205.26])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C3830BB95;
	Wed, 17 Sep 2025 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.205.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758102993; cv=none; b=a2BTPR4N91iZnJnATttfyfPOR4HmVViVq+CyDg6Hgg67MyxoaJjSKkm4a3Q1yGNLZabvREw5wn6iEXsOma/Co76e4fij1QB4B07V8/otZEtu/bJRd9FmGLMdYUzTaa2oOfGDvUgp+A3PLuFGjHTVFCo4U7rgjK71ervKesc2duQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758102993; c=relaxed/simple;
	bh=16bpVU88cJUh6YPx5ZktJMysaL5Bti5I4co90FJoiSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n9ldDlrKbvxDoxMNC5XO+7TZYl9/mMHuZIhh96DBP0MAMV35BrdrJNCOdB/DJIPD6MVvdfwjYcUsWXxfJQgEPyXr1Nzd7O7peBnvxwcfTH0YQeulZbEVnwBPGUI4q8TEBoeRG69omI3H3+UAtWhqg8oPcp9Ym9GRmb4d5lE0W50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.229.205.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.100])
	by mtasvr (Coremail) with SMTP id _____wAXHQXBhcpoA+1DAg--.14889S3;
	Wed, 17 Sep 2025 17:56:18 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.100])
	by mail-app1 (Coremail) with SMTP id yy_KCgCHCNG6hcpoaqclAg--.17846S2;
	Wed, 17 Sep 2025 17:56:13 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH RESEND] media: tunner: xc5000: Fix use-after-free in xc5000_release
Date: Wed, 17 Sep 2025 17:56:08 +0800
Message-Id: <20250917095608.14449-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgCHCNG6hcpoaqclAg--.17846S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwQMAWjJvXsG9gBjs+
X-CM-DELIVERINFO: =?B?25/VbwXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR131FE3wBtlILXmPZxD8pDyBTAro6gO3+CKt5DSKOLCbQH3igjFDdofwCMhjTtT6UK8wq
	+tJujV6Fgi6rC5dpJmHiLILLAaagKZ7JI+//+cjTsanuRtMX/zbvqogSIHA8qw==
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr1fAFyDZw13ur4xuFy7XFc_yoW8Aw13pF
	W5ury3JFWkWr45twsrXF1UXFn5uan5JF1UCFn7G3s3Aryrtr43GryrtF1F9FWDXr4xAa1f
	Zrn8XFWaqF4qk3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
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
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8VMKtUUUUU==

The original code uses cancel_delayed_work() in xc5000_release(), which
does not guarantee that the delayed work item timer_sleep has fully
completed if it was already running. This leads to use-after-free scenarios
where xc5000_release() may free the xc5000_priv while timer_sleep is still
active and attempts to dereference the xc5000_priv.

A typical race condition is illustrated below:

CPU 0 (release thread)                 | CPU 1 (delayed work callback)
xc5000_release()                       | xc5000_do_timer_sleep()
  cancel_delayed_work()                |
  hybrid_tuner_release_state(priv)     |
    kfree(priv)                        |
                                       |   priv = container_of() // UAF

Replace cancel_delayed_work() with cancel_delayed_work_sync() to ensure
that the timer_sleep is properly canceled before the xc5000_priv memory
is deallocated.

A deadlock concern was considered: xc5000_release() is called in a process
context and is not holding any locks that the timer_sleep work item might
also need. Therefore, the use of the _sync() variant is safe here.

This bug was initially identified through static analysis.

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


