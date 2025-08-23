Return-Path: <linux-media+bounces-40815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E27B32873
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 14:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91CC1BC801E
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 12:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C186E25A659;
	Sat, 23 Aug 2025 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdjUpyU4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D40259CAC;
	Sat, 23 Aug 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755950484; cv=none; b=bG45vKIQdYKFfsgHZZLeHXp9QWXBL3wVOyinT6oInH3YNHd+I50fkVTCUesexDpfeSB5HtGxu41u4BOmQD2pLwskv4+agRtf59G1t9DhgZywHcjGVOdvC646FjRe6T7Bjsrr8piF7ldPgNNHRrXK37ZkLWG5jvyBzhIq6F3FiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755950484; c=relaxed/simple;
	bh=g+SXvOscJQeh5HJU9Sa9a+M2q24ilt3506SIFNah/B4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GW1LgZn5uLvmqCJgS4+Dqf5DSTBRsP7JYDTS2DZ9tc8QVTgDzmlKySnGMZFqzzminEiJvzgRoFCzU3RYP35dbd6iScx4DZIMGZX1Wf6Q7kVSf6TiD6CYQD1yz1lmGwnh7WdMFLjuELyDy/8ckZtyh/+irJBuTWCObgo9I1ZWDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdjUpyU4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-245f3784edcso27325895ad.1;
        Sat, 23 Aug 2025 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755950476; x=1756555276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbHjJUZmwsNSKsI58Zu00uvyyhHZY/S+yPHhdvFRXMU=;
        b=AdjUpyU4XSVDhAA1JWTfbZu3oQQIJq7Xso3tIjj/ozsjxwzuEWhaeltqR5bmYSSQg0
         +Gs3/dy94AdbtKauTosG94wW76W+Zh28NW2+t2/DT5+MqDOghMpBMFiURqBTJg/vDtO/
         BcAAVcTSIe2fcT3O0AUxIro/v1kohcguEDMuVH6JBGypnpwNj41Nfa3JYS28xavAhV1O
         I71hF8+hlt4GyVn2nbzgamB1RF0JnlhJuZYDEEdVqFHNj1uCly5r19WOJuKyLk9FD8qW
         FSpTBgsWQ4oZgJOZslsOqfvv1TPEW18GlicIr6hJ6NI8IsEf9NN6upzzm52iOsB2B2gN
         1N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755950476; x=1756555276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbHjJUZmwsNSKsI58Zu00uvyyhHZY/S+yPHhdvFRXMU=;
        b=eVWHaqFTpez3HoUP+MMU/LEOP+7FTQR8svNw7iMrB+17BY2fBDzl1t/2zNIX0MYX9N
         14OHSV6P9eDrxAtKc+Dphj11XWnnkZC66pa9O6qTHCw8syEJPFNNWgru8gPxDzrbajcj
         5Mj2pN3r/N6VmPSGtQEubtmiEXqUcrQlq86zCiR/0EPEdnyC+MBrzx3IEj4/yekRTLck
         iQ2Fzj2XJ1TkHsj8+Sy4X8BMURenVjARIee17/33SngLsjk1IdcWXW2D8ay1uYpGLKQg
         G22sEgWvdMxfbwwE2T7K8Gxrex4YtAuBlew9lva7/8j8OA8gNSn9v4wbUA5GvqP9kvxu
         RcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrJt7kwWCGcO4pquXSb2FNpDgZJ6LL6TozIf6gd9URCijYz3tz3UIgDvnr54XdzPuF/tEZyHJn2QSbe5I=@vger.kernel.org, AJvYcCWJNO3xmbQzEJrVSAvmTJl9V27lWw/7qExykwXklKf3B1I/pLtrR1YFtH5b0yxWScmQ6R+Kj2MExb8skl0=@vger.kernel.org, AJvYcCWmvU9xSB7IOjEZwwQllIwX2QVu/JtKZNN0fg6HsCmWxSc4xEwdtao+z6gsVZcX+DZGi2uyT9PD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6MXa+ds6PENydFoJVXkr+qk/syz2K1sNrZxEXrvZcirAfa4u
	6VDIupGLBMiNWxcIwcjXjImlK/1g4JgtwwxiR0tToFPJfS2oxIwnvN7e
X-Gm-Gg: ASbGncv6CvOA1erjW0uH+c8vH8TUSQY0XrypLROc1T6hE20pCV43cnqBzsS73N8ktod
	/t8HeJgn4nKEnk31gFVvVeDT6ZtLDaOfHmx1Tip8LstsCAMVuOApKh+9LvbE9YS1NXJXQvno59L
	jpYO+r6p7F4T8+uSm6WzyeV7DMBY0iYVtUJPuMXMLOahZj7epMx4oAeVFjNz5W6naNpZN69UlsV
	EvKwDuTV5/SHpwC34wjzg/9dyV2KD2TIWhVN89yx6L5ColQZ5gK4Kk+SiRw4soYGWaotEXK2Okn
	vVS0tN2aTsMkVguuZR/0fmyBg1O/WwnmweGqAbqyibjKlGeMy4nYFdMRLWoRITuDZ/2ALNlemVA
	a5oMi17J8VZxoXgfcpIBx3enFdLApNXtegA8kjidqa0EXFozgrA==
X-Google-Smtp-Source: AGHT+IFWAphMuX8WSw3ONlrGbL6mCCKgU1VRxKqkTPMapm1TUF2d7CsytRLMIt/2ZTpnnANB+GMVBQ==
X-Received: by 2002:a17:902:c402:b0:246:570:2d9a with SMTP id d9443c01a7336-2462efca0femr77817025ad.59.1755950475963;
        Sat, 23 Aug 2025 05:01:15 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889dcd4sm20711635ad.158.2025.08.23.05.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:01:15 -0700 (PDT)
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
Subject: [PATCH v2] media: hackrf: fix to not free memory after the device is registered in hackrf_probe()
Date: Sat, 23 Aug 2025 21:00:46 +0900
Message-Id: <20250823120046.1176789-1-aha310510@gmail.com>
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

