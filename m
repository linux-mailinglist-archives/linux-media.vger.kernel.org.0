Return-Path: <linux-media+bounces-41748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECAB431B1
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 07:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88C3A565923
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 05:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69645242D83;
	Thu,  4 Sep 2025 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmopdLIp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05A23E358;
	Thu,  4 Sep 2025 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756964564; cv=none; b=dmNnftcBvzKa8iQ9IDAC4myWJr4eQ6GIWXNPVciWxUamxbgwoL90WVL+MYNrlAxK6dSHR+74DxNksGWh0rICZ0XIG7ctrF/USP78ilavHkQhwPFEpbWOCbATV5+wtMayUvSgg+Fb4zhgXN85Tp2md2EkrQslveAAMFSp8W+gA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756964564; c=relaxed/simple;
	bh=g+SXvOscJQeh5HJU9Sa9a+M2q24ilt3506SIFNah/B4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Knra3c7qGJsEtZGBF7etSBLyLHT5AcnRriGonakMk/nf0ccEX/ow+4/LjDc6uBXzZQKNl37myJNA5TcVZBm74aq6MnfBATEDyBF4Qd7SfqPFHFNXDy3EpG3U9Mnd99jRR/K2x0YDsisxmPxWDI914jQs+8aeynmnd4T7RGX6l5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmopdLIp; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24456ce0b96so7297295ad.0;
        Wed, 03 Sep 2025 22:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756964563; x=1757569363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbHjJUZmwsNSKsI58Zu00uvyyhHZY/S+yPHhdvFRXMU=;
        b=KmopdLIpGH5QQJdk7PVDu2hV3IslHSwjq6I2hOuK1ZcbsTq7uodXgB2mbXiEqDg5qa
         JLXLoIHHbqV3K3WTBROtcVRv7xLgZFPJAPZSY+XaRtk3y2IHpWfOxMPDARfpKBiC2Foa
         2UhPY0z+eW/17B6RKegAGJkE+8aS8EZLOO8NI3QQo9kRkKVfdD7on7orG+WGqFltiApW
         783C7SnowNLCLGn6UNzVII+tYGg8BDIXr88Qe/NDKn0UMoKG+d8Anf2HIkov98OfZ/e2
         pIknbpjC+oQUq9Mjk6JiDW5yFRdNAR4baiozqXwKfg1NyyedGhSn3xo1BkxAyj54Wx+o
         W9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756964563; x=1757569363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbHjJUZmwsNSKsI58Zu00uvyyhHZY/S+yPHhdvFRXMU=;
        b=pFT3dQXCEYhY8wriYIWhgPWkSG2pjxG2zwj74PSF6HZNo7GzLebwxCDvLg9KOJmwkq
         DYEfCDjTw1Fc6fSBDK6WVA11tPpexgyQh3hmYtGjormlg9n+Fe0uumSH1YzCkn64jSAl
         FB7wu/rxaG/cvYWM3JXC1fhK978w/rbrpgj7wvDKoliv66kPU8Ko3uUH/sajzmCO3Q3T
         yvHgNsdUHurlxMACIyt7mlPU/hf6Gw1Pl/vEk+LOa6+TemYZvtSHZ4v5f0aSluel0J6k
         Nnt4dTPlJh1pBmsCeGSwggRCc7EJnMDlZZnTlSG1R3g7mg7b0hh6ccql/nlnbIiKw6ix
         50XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/nsU8g0RZz81sdlhvJDY9kSx22biYMq7h3j3fi4gnfBKUGuugumunVU3w+kbQqKWeOX0W5GoK@vger.kernel.org, AJvYcCV2qSyzNgz+RcTJ4OR3d703jblgzt0DEAIDY9RWJFZurQ0KdXxZ5Dg59UaoL2aXzLOLpvCSVIN+IrvH3Ns=@vger.kernel.org, AJvYcCVB2CY0oniCCahYIozUOQQ7CpMkcjtvEih7lNnkxhnvXAB5vJWsV6pfdzwevtIyIhiy/vSh4sTnn5dWZus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Jdyb3MsbQy8OjFjOkGxSETaecggaDl4zh5f3KHVfLmbDyIct
	ABWrc1RakvCOdxqJB3bgUaCKLJ7UVh+j6MW4RR0G+vsZiGXV3R6fMRv4
X-Gm-Gg: ASbGnctTZP5Wxu4D9umsscd1j8N1jFp6g5gbdQ+5tPnvvpYyaJQ5DAB9v9h8GnQMNtF
	+aT6rzJ6WL5r+6EufzuJR7TeOoG0IakGPBvXpzZzrILAth/WjoP5Zb4ZQ2S3RMXr0OFz2JpN+7+
	73+kYiMnVbk0+Xz3torNrDDTi0SSttIkfXHemByNcI3vM8FceOLsXVbE0nfaj8Sf1VOgWx44xzC
	9Z+zeGqNAvNiBZfcCzLdm2T1ipeEc7Zd7giWzVrWvFLLthL87l/Wr7DO+GtZfdopf11J6CgRky2
	1J1hfIxNwbxqyizDvaAFVJOsbUG/X6/Xx4x8H3cLuGf3G+M7wRBRzXxKbEYhZMY4bX+bEezmQed
	z0aQD8YD3Wetd3JDsN6DEW9j7GePtqi8nvH9/VpS+0zlXIlsN4Q==
X-Google-Smtp-Source: AGHT+IGR7eTErbfyCZxh8spMVu2TekPQ7+J4ZP6rBfg12RyZ6N3Czo9+NdflESJbPScLb7zZNdl/Kg==
X-Received: by 2002:a17:902:d603:b0:24c:1a94:e601 with SMTP id d9443c01a7336-24c1a94ed33mr72611455ad.20.1756964562540;
        Wed, 03 Sep 2025 22:42:42 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c965558b8sm34028405ad.68.2025.09.03.22.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:42:42 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org
Cc: laurent.pinchart+renesas@ideasonboard.com,
	crope@iki.fi,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com,
	syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2 RESEND] media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
Date: Thu,  4 Sep 2025 14:42:32 +0900
Message-Id: <20250904054232.3848637-1-aha310510@gmail.com>
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
v2: Fix incorrect patch description style and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822142729.1156816-1-aha310510@gmail.com/
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

