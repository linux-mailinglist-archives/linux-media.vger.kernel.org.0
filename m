Return-Path: <linux-media+bounces-57879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJOuE0IdzWnOaAYAu9opvQ
	(envelope-from <linux-media+bounces-57879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:27:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4037B36B
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A063B3087452
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 13:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4EE408238;
	Wed,  1 Apr 2026 13:14:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D43B895E;
	Wed,  1 Apr 2026 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049299; cv=none; b=DZaqVI+4kFFm2s5V0SI8yX7d4/MZKdsLjMf52YCxeBeniJOLLSqoB6ppv4NWjA2utnQm8DBPzeDkBl+lNdHyGJx+YjucGX1IqDnPXSkQPbZZ+K0CorQEixOKbheKN54gP56CIfnOAKxO3W+ssx5l/KYEuzGD3Qosri+P2fcILWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049299; c=relaxed/simple;
	bh=y3Q4UEIkiQsD31eoEhRFbzyfP01/ffPoZ8nGmowwaw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PwW/oJaIsxjm8XFLUpPFOIWw2NMfEyYcEq3fPFfXFM2codVbVhg0fn5BHDdC/n2zYNWO/sJbE3RghAPiEzOpe3+9D1uAy3LhMCtFR3yGP72zCmli+8Mxmq2xX/yre2ohbmxF4rBIO8/nkpdIDq/kxT5xt4WuOlUPrWWtcSZ0y8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from ubuntu.. (unknown [202.112.113.208])
	by APP-01 (Coremail) with SMTP id qwCowABH8Gs7Gs1p_+PdCw--.31536S2;
	Wed, 01 Apr 2026 21:14:46 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: mchehab@kernel.org,
	make24@iscas.ac.cn,
	tglx@kernel.org,
	mingo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	jai.luthra@linux.dev,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: [PATCH] [media] saa7134: Fix a possible memory leak in saa7134_video_init1
Date: Wed,  1 Apr 2026 21:14:33 +0800
Message-ID: <20260401131433.137365-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH8Gs7Gs1p_+PdCw--.31536S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr47JrW7Wr1kAr1xWw43Awb_yoW5Gw1fpa
	97tF9ayw15Jw4kGa1xXa18CF1fC3y8Wr43WFZFg348Kw15Cw18AF15X34j9FZ8ArsrAF1j
	9r40vr1kCr15WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57879-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[make24@iscas.ac.cn,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55D4037B36B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In saa7134_video_init1(), the return value of the first
saa7134_pgtable_alloc() is not checked. If it fails, the function
continues as if successful, leaving the driver with an invalid page
table. Additionally, if vb2_queue_init() for the VBI queue fails after
the video queue page table has been allocated, the allocated memory is
not freed before returning. The second saa7134_pgtable_alloc() also
lacks a return value check. Errors occur during device probing before
the device is fully registered, the normal cleanup path in
saa7134_finidev() is not executed, leading to memory leaks and
potential use of uninitialized DMA resources.

Check the return value of both saa7134_pgtable_alloc() calls and
propagate errors. On failure of any later step, free allocated page
tables to avoid memory leaks. Ensure control handlers are also
released on error to prevent further resource leakage.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
Cc: stable@vger.kernel.org
Fixes: a00e68888d5d ("[media] saa7134: move saa7134_pgtable to saa7134_dmaqueue")
---
 drivers/media/pci/saa7134/saa7134-video.c | 25 ++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 4a51b873e47a..2b1672737d84 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1714,8 +1714,10 @@ int saa7134_video_init1(struct saa7134_dev *dev)
 	q->dev = &dev->pci->dev;
 	ret = vb2_queue_init(q);
 	if (ret)
-		return ret;
-	saa7134_pgtable_alloc(dev->pci, &dev->video_q.pt);
+		goto err_free_ctrl;
+	ret = saa7134_pgtable_alloc(dev->pci, &dev->video_q.pt);
+	if (ret)
+		goto err_free_ctrl;
 
 	q = &dev->vbi_vbq;
 	q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
@@ -1732,11 +1734,24 @@ int saa7134_video_init1(struct saa7134_dev *dev)
 	q->lock = &dev->lock;
 	q->dev = &dev->pci->dev;
 	ret = vb2_queue_init(q);
-	if (ret)
-		return ret;
-	saa7134_pgtable_alloc(dev->pci, &dev->vbi_q.pt);
+	if (ret) {
+		saa7134_pgtable_free(dev->pci, &dev->video_q.pt);
+		goto err_free_ctrl;
+	}
+
+	ret = saa7134_pgtable_alloc(dev->pci, &dev->vbi_q.pt);
+	if (ret) {
+		saa7134_pgtable_free(dev->pci, &dev->video_q.pt);
+		goto err_free_ctrl;
+	}
 
 	return 0;
+
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	if (card_has_radio(dev))
+		v4l2_ctrl_handler_free(&dev->radio_ctrl_handler);
+	return ret;
 }
 
 void saa7134_video_fini(struct saa7134_dev *dev)
-- 
2.43.0


