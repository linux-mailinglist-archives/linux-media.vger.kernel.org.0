Return-Path: <linux-media+bounces-50339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BBD0D7C4
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 15:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA11E3020491
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 14:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFAA345756;
	Sat, 10 Jan 2026 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iyx8sXgF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7701D5AD4
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057123; cv=none; b=s18UVUs6hr0hFnmkSgySUJWuAzyDnjZV4gp1C58IN2W+aRtTIAIv3cVlAgEIVUWUA7DYuO7p6wG2e+wtG5AMAKt9Ue2SyDouWfn5bkPQwztQrPsjo+WYd2pXMBTEfjUDvjkPHMGmM5dPMhKcTerGUZNQ6J1UlRQjN7sX8dmVuI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057123; c=relaxed/simple;
	bh=Rq7taqbcYAudhnjWfE+Iy0uiElntprTwPQhe1JH2x6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZmJ70XL9BFD5rwrWvb9KGVTyZwkigE/FRMKFmR5O86MYDL1G+e8COj2qt+ZOn5u3t8CxF8vhE0JZjX0TRLLkg1oxqA0ywsEDEg1UruCd1+JK9uxf3zuI7hzTpSygTNb8+9m5PCKXryDyb94u9kka2UPlg2vOP5XnSFXY5TyoeXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iyx8sXgF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81db1530173so933320b3a.1
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057121; x=1768661921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSd8AuPpUuiKUe+YAMcslcyKGUwMD/nV4tJRG30j/GI=;
        b=Iyx8sXgFNclmI5Gwr/+LPcZZjAW60bfE+ZE/+n1s/vdQMzO1eiQJ9MALmgrUC5vr8T
         zA9flVpEiHIF1thUIeTp/oo8Eo8A4LJUO5ZFYE5/NFt/L44sstMisQceMMZRgROYPOZp
         KxeutltUWUnQxHdRclD609zsgJPNTTL+uNq2wr0ic5tvFwyaWl6BfyXRY7eHn5X4H9o6
         kPgCSinIj4jq/nv11OrDq8a0WP/2CTIkGl6IgI1YM00PGN4TCOJ1hIA4/8qFOy1y3BHQ
         BfEgTfakpn0ICzD5rEAhQDStuo86oIAFI7gx8qkX+vxC78e+QIZ+QRyQssb5lfqMVxA6
         /3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057121; x=1768661921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSd8AuPpUuiKUe+YAMcslcyKGUwMD/nV4tJRG30j/GI=;
        b=WSpU7cM9Vhe7Tq5DFjdi+49PdJQJcChA//T85kD/sEKB7yd2oCGHcao00JelLvsTwc
         AQihmDZG50gqb+5hgDNgnwEbNadEyGlXtPhyx8SElxt28tndmZKjsAPIQwLXnav8ZEBY
         X+tLyT3/9k3kMDkjiPv8dFVJp7VAuosaTqnDaHgw55GEHS0m1aE+A1ag8cnD5VMj+qCH
         PHQeVYb2NQA/huvZlhWkXK7S/C2gbV6MIsbkkkCiViUYSVcQ2sTM3MLU5uj0QhSRXHHf
         OLnKyi0jtp8ffsU8in9qlbuBTLy01XTiI/WYE2nI1/yPJZDEVCh7zTE4cdyIKqZPNFCB
         ACAw==
X-Forwarded-Encrypted: i=1; AJvYcCW7/lU9egzd0b8d/6YEkEZUkN8W9pwm6JtYsFa9nINXo7AtaLla/SuteLYInsiRqrPzdZPqHLdO5IKpPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJSUvemIMNn8BCF4LB++se9P8AIE6RO3w066vwvywi8p+eIEr
	jExvflob7xkWZ9tkRHgARVHQIZRn8vUTcGlHMd3nvxqlMr4Z0jwMRtoU
X-Gm-Gg: AY/fxX7xeVGu6IRFVkH/LKyI5cLC+79Wt6k+f3tulP1mpAm36gngra0ZkZBP4d22Hey
	MiaGwQeugHI0C6MvizHpmqRCyXiFSGDqmJue9efgIMcLWfgftopO68N3vyBxNmbkVZPxmR3qUws
	dAnXXvMlA/5+c+DRyIJh3yPAAlfgUzjLvnb2owRDeyeq73VbtP6c7AnyU7GjSeGsxJ5akusAxMG
	Hs/fo4sMR91hfUrSHG4bz/QK/tT+TmEhl027zLhXF7+BfQumQy/agScOchi7EwTG0kf47c+I54N
	KUi/8mZ0wrC7X52uOpy3yhSJnq766wWsFt+g9/dgAX8WrALHD9Rd0quHDqkrmjpcJ/g28SapO9r
	M7b6GEGlwk3jGRSmCj74ffioUYjAXC0OcYSQNj73sxlQTQX4YyyqyQ2MmLpxMRQYzPF4W/B71/C
	2UadT1rk1A0AYZbvfWRfmPQq0rHvQw2Zj3G2LN9Q==
X-Google-Smtp-Source: AGHT+IEN0gmkw3iX4YOGGXw6fws4EadygKI1RaDNV5HQdJC6wXkGTXhvL337jPo9VnmAKfL7O6sxuQ==
X-Received: by 2002:a05:6a00:1c8a:b0:81f:477d:58da with SMTP id d2e1a72fcca58-81f477d5ab9mr567254b3a.60.1768057121194;
        Sat, 10 Jan 2026 06:58:41 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm13086157b3a.16.2026.01.10.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 06:58:40 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Cc: crope@iki.fi,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com,
	syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v3] media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
Date: Sat, 10 Jan 2026 23:58:29 +0900
Message-Id: <20260110145829.1274298-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hackrf driver, the following race condition occurs:
```
		CPU0						CPU1
hackrf_probe()
  kzalloc(); // alloc hackrf_dev
  ....
  v4l2_device_register();
  ....
						fd = sys_open("/path/to/dev"); // open hackrf fd
						....
  v4l2_device_unregister();
  ....
  kfree(); // free hackrf_dev
  ....
						sys_ioctl(fd, ...);
						  v4l2_ioctl();
						    video_is_registered() // UAF!!
						....
						sys_close(fd);
						  v4l2_release() // UAF!!
						    hackrf_video_release()
						      kfree(); // DFB!!
```

When a V4L2 or video device is unregistered, the device node is removed so
new open() calls are blocked.

However, file descriptors that are already open-and any in-flight I/O-do
not terminate immediately; they remain valid until the last reference is
dropped and the driver's release() is invoked.

Therefore, freeing device memory on the error path after hackrf_probe()
has registered dev it will lead to a race to use-after-free vuln, since
those already-open handles haven't been released yet.

And since release() free memory too, race to use-after-free and 
double-free vuln occur.

To prevent this, if device is registered from probe(), it should be
modified to free memory only through release() rather than calling
kfree() directly.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6ffd76b5405c006a46b7
Reported-by: syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f1b20958f93d2d250727
Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v3: Fix potential memory leak bug
- Link to v2: https://lore.kernel.org/all/20250904054232.3848637-1-aha310510@gmail.com/
v2: Fix incorrect patch description style and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822142729.1156816-1-aha310510@gmail.com/
---
 drivers/media/usb/hackrf/hackrf.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 0b50de8775a3..c3c4247194d1 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1485,7 +1485,7 @@ static int hackrf_probe(struct usb_interface *intf,
 	if (ret) {
 		dev_err(dev->dev,
 			"Failed to register as video device (%d)\n", ret);
-		goto err_v4l2_device_unregister;
+		goto err_v4l2_device_put;
 	}
 	dev_info(dev->dev, "Registered as %s\n",
 		 video_device_node_name(&dev->rx_vdev));
@@ -1513,8 +1513,9 @@ static int hackrf_probe(struct usb_interface *intf,
 	return 0;
 err_video_unregister_device_rx:
 	video_unregister_device(&dev->rx_vdev);
-err_v4l2_device_unregister:
-	v4l2_device_unregister(&dev->v4l2_dev);
+err_v4l2_device_put:
+	v4l2_device_put(&dev->v4l2_dev);
+	return ret;
 err_v4l2_ctrl_handler_free_tx:
 	v4l2_ctrl_handler_free(&dev->tx_ctrl_handler);
 err_v4l2_ctrl_handler_free_rx:
--

