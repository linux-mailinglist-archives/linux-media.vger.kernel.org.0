Return-Path: <linux-media+bounces-40778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7214B31C2D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6597F1D6476F
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B00340D93;
	Fri, 22 Aug 2025 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/Pbn4Bb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C723074AF;
	Fri, 22 Aug 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872898; cv=none; b=P1COlEyCq3AEWy8wseaVxYfZsGfiUH23DSqGd7dxYdqb8Ih6sqhJaDXHw/rMB+siKC+nbmoEWKOZdm1WkWCITDlcPdSyforKLIMiKf3qBp6MrWyoSTCk0F+Zgr5mCcqnZbVVrBvDSolQ3q6j70Ygw2ZjMlaU4SVDBkqHMBzfVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872898; c=relaxed/simple;
	bh=1tcqg+Dxn0X4uN89MBchrCPxWJCJSaBOk43TU1sZj+U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NaqVfI4bHfqguQq6R8OqyN0MRS+A9AtS2iu5/CFA37opVDP/z/3Vx4KleSnRZ6QzSaWV42SJvBeNQiGH4icTNqpbuV0CLSWkoGThEKuO+X8iWyzMHT/g+09vbdQ3Ic2RhuBm03FdeGjH8abZRVDn3hVageIKOq1KpXH2GpfZ/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/Pbn4Bb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea6ccb7so1774007b3a.2;
        Fri, 22 Aug 2025 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755872897; x=1756477697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=osXammeU3SWsqzx1uJUtNYkdnRdRKa69qPFYoFdS/5M=;
        b=H/Pbn4BbW1H3zxbjKVypmCggN9kfXxKS6zK+DXpB16pNBcO2nzL/dSJwdOTxm0UZZd
         +telOmR1v683DSosqdYiviqcF7R698v7V5YKkn+uH2K2ftwocHqZvcEpUUQBUjhXbGH+
         aK+V6P5/dUIHw0oG/qwT4CagYSBFgV0KSHJoHxEvnQ6UCYpuvL2ByEExOvluIchqoMl7
         K5untoKEmx13cktI5pPYuV1Vzv50HDcu9U889Hn5V216+YTuVJpYCPrY3axR3K2rIeOu
         WdsACVulFHcLsdmurW94NQFAMmTyPj8C7g2ZiT5tzgNKhGniQhfg5YJiFDKC0KLG+mB8
         Eojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755872897; x=1756477697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osXammeU3SWsqzx1uJUtNYkdnRdRKa69qPFYoFdS/5M=;
        b=R8ZfvINPUWNQ/rgzud2FYk4pp3rDF6moCz55KtLfFlVOpsT6cLAMEN0dQoRQ8qDOsP
         5JES+QWqJPdll4Bdkev8qzNXp9VRQoa5bjtOnMuQTl5PsE07s4Aq4F5ILEhwArEMIZzN
         rB7hljIsCOLejPpZMbJrAeRmcGNL5WbtxATITMtom368DCG6cuT6OmVbV7CMriJOxVm4
         vGN+W9WjnlZB7h91azcfFcdc6yF5ZIt0dMRpGl9A+yI23Dh0a2wQj4udfGaLr4thPkkI
         pPRkpC6YmYiB2EamdFd2qzXkIyLZKf49e9lgXhLUqX4kOSrGWLIbCQSfJA1rbyF2awCq
         YMhg==
X-Forwarded-Encrypted: i=1; AJvYcCWhAOaG2zMnpDG0xg/0A5RAoE2rTJ/VZD42zfkkdpbL7Oxg/tJZwKVdqQO1ToYU38uGw2rg5NqKjCoo8yA=@vger.kernel.org, AJvYcCXNGcz+Cy8f9tr6h3k1DAsLfMdkxBiYGCqX9RvzQdcaBEgn6d7IohnqujXelkmbukqc3PILl4d6oHIptPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXBeQ1QClG7WjaW0R6A3Kq8PBQl0CpmYWyA4Ry2K0OwtX15zo
	zgILaX4r1SGSlShIZtgY3I6CABGjixOR/7Qn5Hbphsa3Yk2ba13TSFG3
X-Gm-Gg: ASbGncs89KQjLBTHhxyek30zrvTgK9shX91LNmLoIeWL+sCud86bT8JqPo2nW+GMlOr
	3XX5aNauK+NtDJdQaxJetRi/TvXKIPeyzsGoEpJFmM87G0eTsJ7LlhCbgS5WtZkkJCBZgLYi4jP
	JMyjv/rX6w3XqtlYY1fqczyeIUZa6ZlPJ+EObxUdwSCFwm1ShT6yd1vHPnMOlPUqhqg/0IHONNL
	sFiI0ac0xj71ZgXyfzFAKv9nbbk3bwF+dlDEEjXfqYHGuAuPE6jxGApTMVZOdQ9EpshInw/9uV4
	hft85W4YpkyuzzFgaC0OfljLzk2HllD8lXmdYfwOCCXSuqt5/y5GvK1Ecv4M0KrUVY7QWJ0KFAO
	MHjXIkrDznDtn0H+VeZ918L0AYBFh3F7gKrfB+zIVupq0MZcwACTUcu6s9Apt
X-Google-Smtp-Source: AGHT+IGbI5kL0fhTgThMFQEpXgLOnVtvgW5yd4KTARcoyBOTJgFA/GfqBuCafG0fze5LZNXlqX0m6w==
X-Received: by 2002:a05:6a20:3942:b0:243:78a:82a6 with SMTP id adf61e73a8af0-24340d93eaemr4548669637.60.1755872896610;
        Fri, 22 Aug 2025 07:28:16 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffae973sm117987b3a.12.2025.08.22.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 07:28:16 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	crope@iki.fi,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com,
	syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
Date: Fri, 22 Aug 2025 23:27:29 +0900
Message-Id: <20250822142729.1156816-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

In hackrf driver, the following race condition occurs:
---
		CPU0						CPU1
hackrf_probe()
  kzalloc(); // alloc hackrf_dev
  ....
  v4l2_device_register();
  ....
						open("/path/to/dev"); // open hackrf dev
						....
  v4l2_device_unregister();
  ....
  kfree(); // free hackrf_dev
  ....
						ioctl(fd, ...);
						  v4l2_ioctl();
							video_is_registered() // UAF!!
						....
						close(fd);
						  v4l2_release() // UAF!!
							hackrf_video_release()
							  kfree(); // DFB!!
---

When a V4L2 or video device is unregistered, the device node is removed so
new open() calls are blocked.

However, file descriptors that are already open—and any in-flight I/O—do
not terminate immediately; they remain valid until the last reference is
dropped and the driver’s release() is invoked.

Therefore, freeing device memory on the error path after hackrf_probe()
has registered dev it will lead to a race to use-after-free vuln, since
those already-open handles haven’t been released yet.

And since release() free memory too, race to use-after-free and 
double-free vuln occur.

To prevent this, if device is registered from probe(), it should be
modified to free memory only through release() rather than calling
kfree() directly.

Reported-by: syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6ffd76b5405c006a46b7
Reported-by: syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f1b20958f93d2d250727
Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/media/usb/hackrf/hackrf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 0b50de8775a3..d7a84422193d 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1515,6 +1515,8 @@ static int hackrf_probe(struct usb_interface *intf,
 	video_unregister_device(&dev->rx_vdev);
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&dev->v4l2_dev);
+	dev_dbg(&intf->dev, "failed=%d\n", ret);
+	return ret;
 err_v4l2_ctrl_handler_free_tx:
 	v4l2_ctrl_handler_free(&dev->tx_ctrl_handler);
 err_v4l2_ctrl_handler_free_rx:
--

