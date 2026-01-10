Return-Path: <linux-media+bounces-50342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C3D0D88E
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 16:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB73F3016ED8
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 15:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9E2346FB6;
	Sat, 10 Jan 2026 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX8nwCoS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A1343D6E
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768058839; cv=none; b=h80pkL7PZij7hStpz5xj/7nP20YcTIsth1uoASPgOKxQnNtewQ9UfTsid1L+Qf8giRxURbrzOodhwUXWIDwQI3D+RygaxWQHLEUoFWUDnhS29/MF2LtaavjJKMtYC+FF580W6lHsbP2oW36+Z7jXmN2Z+bfc6a5J/snLTK/ycyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768058839; c=relaxed/simple;
	bh=xu8YmLa9g/+vSRsD/1C8fTOol2NBa1KWM6qO1hoOa0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mX5qYUYwfrp0IwNdivCo7Z0qpp5b3HyLbmbTUDLS+gcq+CLC5q+OIUc3Oqul4/uLsFDXwbOlStDi2jnTViHq54m1X0VvW1fStjvHE3FMNlX/wWZRF4WUAx805eFBtGD4Zx16XeVB5tYsBUR9ueSgRKhcxF6kusv3HKZ4ItWHid8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX8nwCoS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so35557485ad.3
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 07:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768058837; x=1768663637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs1NcoSCG83oetkS9nkeOp/DwLHdbXKpQV7fIcvsjA4=;
        b=QX8nwCoSQoP8SmgRFl2wE+K70xsxPkoH7S/UBQ9DkkUcu82NjTCmMJlYQqfXZyWkN9
         b8jPXJgUfyAbT4O3KMFPZC85PToYo06vAIHYhyoo7HwBXwGLP12RA/MAdBchuDNbGZhA
         4gDWoDB5HzV/V+MvZfjf2XINJqM8i/Ixz0j9goTSNMazdofuzxEpVXpC+Bf8Eak89ZB8
         WoTfJRQYE9UilO5XxB13tTEuYoQiOmVhjrzgemhFCRDxDyzHR4HMTF1hFpwSImVGef3E
         QTTBweR+KEPB1GL3UD9z10K+nCaNADXo0wpbdeh6jDQw5djw5Fm5pQCE8Coy2CmI1pv2
         YGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768058837; x=1768663637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs1NcoSCG83oetkS9nkeOp/DwLHdbXKpQV7fIcvsjA4=;
        b=bFQEKU4alMzFNfusHwduX8RREaRl0KTOTv09zWDDr7Z6pQhAPpgbwJX/3xwt74WWHn
         32z0gkdjrYEEDHPn81KH6e70orTQiEDQ7h9uzCxIXw66eqzfzB9y8DxZ+9kfAhBIghZV
         pu250TcgTDVn58XU8QadLldXyELcRhUDuhqcNsewFQAk6S5pOc6PQFKUAq4lUXIp68p/
         JacOy06MPyUUVEPl/CsQ49GorC76Ikyo/NGd9T5tSWQ6lBRrnVzqtRz+N+JUiSOoJ1H5
         LRhTY/B9GII7ysU8zIstBnmu0o1anKDjdJ8dZZagqxkZJhvgfcBnXsNXYFVdSaGKOgWQ
         +0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW7y4bQzy4KL+hLo2GyIiNxE/GQAHkdN1kObWM/OcXns3vEDQ+MQvfgpx64sdRuTp2vqHk+aRUF9fHxNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjXxcWeCZock/fkMgCqmH0ODTGz6TefGr/W6RyYsM/m0PPLD5
	5AfNHDZ1SoXhGc9W2GdkFyu3YEQIdxfXBCDjgRr9bA47nB5iJxu5/gV3
X-Gm-Gg: AY/fxX6eQv/PctCoAWlsGIWPrbauqYuXZEK9Ycx5UfBTENMST5Mk0hNOFzTshNyFGkg
	7saXU8zptTomsYvZW/sRQxtLlHXo+Ao53UhN4817liukGMLMCStFjGk6LPnAldwgayPPI5eNHaM
	SsUBrhnqjb25Yu/6tXPs2KR0mzKR6WWis/zG3H18ijOHRN2OIjBxh6uQhfWAXcZlYDPPTp+cJ8C
	D0jZsbCd61DdZ2kQLKv2g/VnX4enZSAsKfcrrOWt9seuv1rRgqJD3oqa8Eva9/gsl2dIXRGlZuE
	uA18xSkzF8oBW6cuXr4SCy6jdkQzUbyxZPe0O9315lhAyF68MV5SY4nB8VDBaqAx9Pq+LiiLYj7
	hrvV2gXamEbqOZSSFlnTbbNIN5SKNIZzVLTXXnjgI2tPiwvJvxRqxRymZ0ND6Io375fA5QSLOZK
	5AU7yaPyK5EpTUI+cD9P1b/lcMZ7GF21cGKifyOw==
X-Google-Smtp-Source: AGHT+IFS7Czhg55hKmIHgUDpb396S6tfxneJqb6vjnaIo6fdMRy08wY3beDzB8AqxuS9tTnynMe9Pw==
X-Received: by 2002:a17:903:3c27:b0:2a0:86cd:1e3a with SMTP id d9443c01a7336-2a3ee4b23a9mr131778325ad.44.1768058836907;
        Sat, 10 Jan 2026 07:27:16 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a512sm133838105ad.10.2026.01.10.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:27:16 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v3] media: as102: fix to not free memory after the device is registered in as102_usb_probe()
Date: Sun, 11 Jan 2026 00:17:53 +0900
Message-Id: <20260110151753.1274725-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In as102_usb driver, the following race condition occurs:
```
		CPU0						CPU1
as102_usb_probe()
  kzalloc(); // alloc as102_dev_t
  ....
  usb_register_dev();
						fd = sys_open("/path/to/dev"); // open as102 fd
						....
  usb_deregister_dev();
  ....
  kfree(); // free as102_dev_t
  ....
						sys_close(fd);
						  as102_release() // UAF!!
						    as102_usb_release()
						      kfree(); // DFB!!
```

When a USB character device registered with usb_register_dev() is later
unregistered (via usb_deregister_dev() or disconnect), the device node is
removed so new open() calls fail. However, file descriptors that are
already open do not go away immediately: they remain valid until the last
reference is dropped and the driver's .release() is invoked.

In as102, as102_usb_probe() calls usb_register_dev() and then, on an
error path, does usb_deregister_dev() and frees as102_dev_t right away.
If userspace raced a successful open() before the deregistration, that
open FD will later hit as102_release() --> as102_usb_release() and access
or free as102_dev_t again, occur a race to use-after-free and
double-free vuln.

The fix is to never kfree(as102_dev_t) directly once usb_register_dev()
has succeeded. After deregistration, defer freeing memory to .release().

In other words, let release() perform the last kfree when the final open
FD is closed.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
Fixes: cd19f7d3e39b ("[media] as102: fix leaks at failure paths in as102_usb_probe()")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v3: Add missing initialize intf pointer
- Link to v2: https://lore.kernel.org/all/20250904054629.3849431-1-aha310510@gmail.com/
v2: Fix incorrect patch description style and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822143539.1157329-1-aha310510@gmail.com/
---
 drivers/media/usb/as102/as102_usb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index e0ef66a522e2..44565f0297cd 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -403,7 +403,9 @@ static int as102_usb_probe(struct usb_interface *intf,
 failed_dvb:
 	as102_free_usb_stream_buffer(as102_dev);
 failed_stream:
+	usb_set_intfdata(intf, NULL);
 	usb_deregister_dev(intf, &as102_usb_class_driver);
+	return ret;
 failed:
 	usb_put_dev(as102_dev->bus_adap.usb_dev);
 	usb_set_intfdata(intf, NULL);
--

