Return-Path: <linux-media+bounces-61950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIkvGiruCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:47:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B919F56AEB5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2966830E17E3
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7FE3E8350;
	Mon, 18 May 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8Rozc+f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6163ED5BD
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100447; cv=none; b=Vt9afzesp7Q2Kw7AlqgkmMgzgzVV7YVRayi4x92478t05HedqcUPZVWnvAUJXv9oK+7EbpoTP/KiPtqi8y7AxaA7b9IHygYa25VblEMXWKzReUXK0EVbM/2H+Id/R62Vg5Cve2hHrDBfZm//nPXfqTSrKwz6L1yjpsUK/Ii/9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100447; c=relaxed/simple;
	bh=2LL/FLItPCn44dnp2ycwM3wTq608SyGansKwrSme9pI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Vg+vXrxNDnzXYH9OsZcBa1xn2ZEi+d4XJifB/7mu3I33+r+SpCvaz4HcoaFIDCR2GavzJ0q7kyL3DcKxTSOe3i7WH0kJOcqnW9mh+ksPd21Bm/PLmxsDc96lm0+3ldfBOj/YA5A8SlDDoY5RPyrS01LZM4dZHER6yMrOEj48FZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8Rozc+f; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so791699b3a.2
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100431; x=1779705231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WS9Y2/caebVCglEjYJZNbQVr+9NHlmJ0JSaocEMxTMA=;
        b=a8Rozc+fTjMrcXNNoeQlYGGh9Fag76PCKrr38yQklb4DMEaaS6DxkIC0cwkhN5Kxfz
         7AC68YMTu9d8Do1qBlddtIJRGDgEJ6BSNnKhmUIF6aZs7n9C5jhywnhuwfUAGQrOD6LH
         qVMSSMy1J2ZWIdYuZpuhzDZgPPex0ksrBmZ+dZKW1UIPiQ25WeAJSyhYcTdFhjBkUpYA
         aGU2HEudl04pnlKzmmLLBVoiR6sxBIJGvos+16lPHm21mZ6K2ejueokzFLyep+VBvrgU
         zoCrXL9s5YPXcSATxPHt69iyv8PgEC8BY1EKMOZoyLczM1ol2yf7/InuoDG0RZ2NAE/G
         5JqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100431; x=1779705231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS9Y2/caebVCglEjYJZNbQVr+9NHlmJ0JSaocEMxTMA=;
        b=Y4PLRnMBVuf2nQccpNAj9MUzyplhXyN26AiOUeFVWsU43WODf5dMagk/clvckr/jND
         GIPjjUTCSpx1r6QgwF7a1rUwaVwiMYXu2t0edhRMxr5dw12bQorEKm7/CE3SyL9AH/4v
         c7cTlKyyuRp2vwKEkr7cgj45AAsOzEJQ8ukSMTV4zdXbXECm66DjjfqZC19vzauROBIL
         q+ysLtPSWwGHGN+tm4aO6T6P87IeMEex4ud4IrXXceB9j4OHFcXVLqf3fpMkr7KM4gkC
         9w80aIMNCNVDAynAz39fDnuhW4zJnaY18qbML5564pg+l154FIdCQAObgU4i/b7oD31o
         UiXQ==
X-Forwarded-Encrypted: i=1; AFNElJ814Ph/lqjWzVI2mWBeVqhRwQ+e9CouOFMJ3Fjrb4mB9b7ISU9C4hrMdeaFpmkK6jqelLOsOF2KyzeUFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOnBL5co3tuK6y1C693Qv0hXNWGpYL7lQGEGiPgvyPTPUTnZPY
	ZmeDPJjVbHRZWgAWQ9y/zxosdgneFu42MphzXuGkiNfcH1p4xoxje/cfXOLQ6acCOsg=
X-Gm-Gg: Acq92OGz11S3k7BiwZmS1I+SzdRpYMp7p15qTqxZU0mgIMYwFUdhR5106mz1khzMJ7r
	7AcL2wFN0wZa85gyp/8Ks7HenNhGfD3zNIPpJX3mvZVChMyEtvO+ha82mJxEUeExEcHKL5KJiNZ
	il6b7Zl5hV0kyvYlyPXtUzdCuu+cBweSJLtPDp6ADvZFbTvFU6nVibews0k9dDT+HGmuv0aJGvK
	Jl7oBmyb9hqtMWCJBNW416JHhQePTRSbUtTTx3yQBsVktVpoFsXGnpk8NfR7SSuY3x97SeAbapP
	DID4sE1CAdPwbERxLtWNJyF/Zu786Culv/+qx2RDT3bYmJGZvxIeylw4apyFXWgfNUE2dKRTMfJ
	PjjFdItg3bUhBFEVM6JyZnCHDPzRVap3E2oTPJzvv7gLr7m0Kjc7+gHTAAesn09hgcqKCLIdkBP
	/Rvrao+1zyIKPUqA==
X-Received: by 2002:a05:6a00:4484:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-83f33c99b07mr14532309b3a.15.1779100431117;
        Mon, 18 May 2026 03:33:51 -0700 (PDT)
Received: from lgs.. ([101.36.109.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19794e6esm13161323b3a.25.2026.05.18.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:33:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7134: avoid double free on empress register failure
Date: Mon, 18 May 2026 18:33:24 +0800
Message-ID: <20260518103324.985796-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B919F56AEB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61950-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

empress_init() allocates a video_device with video_device_alloc() and
releases it if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  empress_init()
    -> video_device_release(dev->empress_dev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free dev->empress_dev through
vdev->release(). empress_init() then releases dev->empress_dev exactly
once on failure. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/saa7134/saa7134-empress.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 8c4f70e4177d..884c6418401a 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -250,7 +250,7 @@ static int empress_init(struct saa7134_dev *dev)
 		return -ENOMEM;
 	*(dev->empress_dev) = saa7134_empress_template;
 	dev->empress_dev->v4l2_dev  = &dev->v4l2_dev;
-	dev->empress_dev->release = video_device_release;
+	dev->empress_dev->release = video_device_release_empty;
 	dev->empress_dev->lock = &dev->lock;
 	snprintf(dev->empress_dev->name, sizeof(dev->empress_dev->name),
 		 "%s empress (%s)", dev->name,
@@ -305,6 +305,8 @@ static int empress_init(struct saa7134_dev *dev)
 		dev->empress_dev = NULL;
 		return err;
 	}
+
+	dev->empress_dev->release = video_device_release;
 	pr_info("%s: registered device %s [mpeg]\n",
 	       dev->name, video_device_node_name(dev->empress_dev));
 
-- 
2.43.0


