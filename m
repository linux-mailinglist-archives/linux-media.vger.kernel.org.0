Return-Path: <linux-media+bounces-47728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED23C87FA5
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 04:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DB751354236
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 03:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FAA30DED3;
	Wed, 26 Nov 2025 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="O7SJwfV7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08F30E0C3
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 03:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764128479; cv=none; b=qlA7f4D7V6FhqRaL+aFDpGWMQKAdau6EB+XTXe8yfCUZkKc5MiKV1Yu3DYuBIytY05KLYZw7XRGkDrJsR4gFqtepTxvp0tK2XMQ3H+8c0TWnfIzLZMFX3e7PSoKqgr3SmNTW67DIDaJwaOZ6bgtQfHMOyqNCW7ltSpSdWl+28OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764128479; c=relaxed/simple;
	bh=a9NYLup+GHVLFnigeOor2tUWrU5w0BB3Ez/xbw4Q8GI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d5fNmYgIYgFqJ02YtXfGmvLc1FviebeoIsNvWk1UTWBrtrziL7ZaOVgCtD3wxv4uUV+hHBEa+4RQaTfzcHOlRof1sddax6nUO+Y4JGwki15k6GOnvk0W9uFNCyZK7ud58DBBm6sLjyKMCT99JzXh9Eu81GuMoG0nU+L/sfOjY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=O7SJwfV7; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso6920510b3a.0
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 19:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1764128476; x=1764733276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L06KdTNJX/VzLn2Sdswq1zSZJ8ncJFeN/TZrwKb7bDA=;
        b=O7SJwfV7NHffNdX8uhajXcYR4/8DHRrtdwjDckFFEOo6o09HSWUUb5wUl0CnxhVryc
         ZPkwvnE08Ef+70YQBvMs5C7I95muA0yU8HcMmy5oHvF66SdA1rGDeGTs2W+MboBa5L05
         VoXO6zPj7k92UqC6cWcCk/kfA9Zl50Lc/ABXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764128476; x=1764733276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L06KdTNJX/VzLn2Sdswq1zSZJ8ncJFeN/TZrwKb7bDA=;
        b=VRNIwVXGr3JZawbrUDhIBmx4v54UsEeLko3yR2aAZOfMfyGT4Ua/LQs9lXiaFYczGH
         JZ5OSUMx+ouvw8lQ1p9iQF3eK2f2E4pKcKYelh1gqzXvV126kfwaYZyk3k+l05Od1AVJ
         IMg4ubdw8tYgMNzPDjTM5AcCH+c7aZi0DRCqy3gcgKbjB/gTGQutpCmseXhfmODIhgHC
         Wbl0qP7M3FzfZipjbwhF4objN0x3xje74KbgbCAMHEdOpu0epq9ZI72HC9osA2HPFyj1
         Z57esv7cqSREzSq8PyJBo4tmvhhnNQgRqFJaQRrhv7G7YE2t83Ec8CbzcwsDMWNMKGYl
         FbiA==
X-Forwarded-Encrypted: i=1; AJvYcCVXSclYbQbCL8XwZfsH0tK01ueN96noF3Q4SKxzr95seDBsF+2JTVAuR+a4LktxzZ1jo6x7V0Zer1haUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygLVojhmEG8bKIxL2APxJk1zzR3BtvPicct0XuZmudiG0Gy2xe
	YrvydnYKOxOmxoasm3K8wezEzsUycZL02vrfDDXxq5B2ct7JKHbrSwgNCRaGUPkoGRE=
X-Gm-Gg: ASbGncu+NmDQcFJjmVsXwozYvj4Yx2mE0EMlrNRGXTxVGE895yvHmK2j5zxSktHPD/x
	m4l7r0S+yso+oN/A6itLsjRi8f7ddFw2ZBKo1/uEW4I/LE11noGsz9uJuDXwZRG96vtTU7JzSJG
	de85MMN4kHC8MKxH+1HmzwGjZKU2pEUmvKTyP42v1zfAnNAFrgjYEMZmDSSGnzaGWqJPmZazsUb
	FzEoO5OlfdfNxDgsNvwnERl5q6Thj92wEeqt5ib2Ty82VOOcX0gVK12wqJyWvA0/QBth4zVoCcA
	ke8ihWhJ7vHICog1ZAC6PU8t9ePFSTOrVfSWuZtqY0iY0lNvOH7XljFFUbrmWJyjM904N5XSnTU
	z1V6gwNqYg3wA4BkcZ8xsiFFkZoyVFKQUdhD7CT2VB3JOFOoowxjH7rdyCBhIbWUMtbVpmuFbdP
	85OBn4yO6fnZ6QQZNyOZ8IKVQOQlYmoa5dt1DTeTU3/R2O//BNO8Z6g/Pa
X-Google-Smtp-Source: AGHT+IFn0YyK8uoIBkvy3BywAsW6leMDGURDB5DGi/SakuSKZblQSgFbhnhe1dMYdgyoOjGxyQCmAg==
X-Received: by 2002:a05:6a00:1890:b0:7a4:460e:f86a with SMTP id d2e1a72fcca58-7c58e6014e2mr15281081b3a.25.1764128475771;
        Tue, 25 Nov 2025 19:41:15 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d869:f53f:2666:7529:e5cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174ba7dsm19410224b3a.64.2025.11.25.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:41:15 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: hverkuil@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Subject: [PATCH] media: radio-keene: fix memory leak in error path
Date: Wed, 26 Nov 2025 09:11:05 +0530
Message-Id: <20251126034105.236131-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Fix a memory leak in usb_keene_probe() when v4l2_device_register()
fails. The v4l2 control handler was initialized and controls were
added, but if v4l2_device_register() failed, the handler was never
freed, leaking the allocated memory for the handler buckets and
control structures.

Fixes the error handling by adding an err_hdl label that
ensures v4l2_ctrl_handler_free() is called for all error paths
after the handler is initialized.

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
Fixes: 1bf20c3a0c61 ("[media] radio-keene: add a driver for the Keene FM Transmitter")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 drivers/media/radio/radio-keene.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index f3b57f0cb1ec..84916b5ebcb2 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -337,14 +337,12 @@ static int usb_keene_probe(struct usb_interface *intf,
 	radio->stereo = true;
 	if (hdl->error) {
 		retval = hdl->error;
-
-		v4l2_ctrl_handler_free(hdl);
-		goto err_v4l2;
+		goto err_hdl;
 	}
 	retval = v4l2_device_register(&intf->dev, &radio->v4l2_dev);
 	if (retval < 0) {
 		dev_err(&intf->dev, "couldn't register v4l2_device\n");
-		goto err_v4l2;
+		goto err_hdl;
 	}
 
 	mutex_init(&radio->lock);
@@ -383,6 +381,8 @@ static int usb_keene_probe(struct usb_interface *intf,
 
 err_vdev:
 	v4l2_device_unregister(&radio->v4l2_dev);
+err_hdl:
+	v4l2_ctrl_handler_free(&radio->hdl);
 err_v4l2:
 	kfree(radio->buffer);
 	kfree(radio);
-- 
2.34.1


