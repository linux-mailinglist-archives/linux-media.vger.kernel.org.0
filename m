Return-Path: <linux-media+bounces-41749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F34B431BF
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 07:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559D6566460
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 05:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4C02405EB;
	Thu,  4 Sep 2025 05:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpVi0tJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8F5632;
	Thu,  4 Sep 2025 05:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756964805; cv=none; b=OV6BE5/+L1nzBEG76FmGtUtEzzvEe+++m7cZF+pxEY36lGeKLf193L2u9mAoOYcMlLiB60I9almiDwyS9pZNYtM2SDzy+eyOp2rAc+uprB/HrIYrb1QwXUu1luGUcf12p7Z840uQoI7p9HLY2tbHFqW/hr3g1+Yz6bDVF9I8JB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756964805; c=relaxed/simple;
	bh=y9QQemxhNMuU9Cg9hSjpes05Vn3CLhpEomMTRXsM1eM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RfGb+Dsj84UBESERkRbaKTb9fJxLg3lSfoXTFLbZSRl9yhU5EM4SXkih15sYjALLp0nxEftdE7Ptd9MNqYS3dltFfcLu46FgLY/nRUS226h6OcZYQ9aaAmqZK+23wvwKR3gx7llY9O7Z7vGaLzU+Ys6xp3pZzRZDQiVkRr1bKBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpVi0tJ7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-248d5074ff7so12082955ad.0;
        Wed, 03 Sep 2025 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756964803; x=1757569603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4oONS1z7VfzwpCrdNQbfTZz4SLPX1uCJokgWYpKs+dg=;
        b=JpVi0tJ7pyshLm8P0tQ1QeGQKAYPZ8fq0Md0KrrjwIT519iVS0DeUgH8Xzl4sJLiCe
         BbZyEsk2IGSepxZWZA/Qk/61keXtihBEzafK2JiVtmhCbV5V1znqFosZxr3w/9D1UtOe
         g9ROoj8X/4+hfP0DMYsn8evhB6VCtsftqMra2luHp04eaSbRqSgpHaAUXx6F6PNQicOP
         zt5OMO0KErmaDGh8OK1PPdxoCGeX1sEPsAT34MsdOT2RNNXP2t3uIJfxL4u9NL73rBvn
         kx6R3mAaQ+UTsNaOiFxvmcZAG1/hPLMcwgWEj6KQBzl6PeQ8FXQeWonYDUHYw8eMRkmb
         dcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756964803; x=1757569603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oONS1z7VfzwpCrdNQbfTZz4SLPX1uCJokgWYpKs+dg=;
        b=dlH9+/A1QQgPLnZDcn9swTwBynR1ATYjEymfVl7OVu4fsNl+prtl+A0nfVqEJhovUR
         dcDCMm/4brU8tBLjRvXE+71LJkWe07vZYi07GaymFhLXJislorZMr6qEcPY9pyX91P5R
         KrwYqHRA417e2Ai7Hpbuq49uPwSyPLtHax65rK+e7iKS5p0KG/lKeOu0xukFUZC+9ioh
         b09eDCjU+l4rIb1PqIN8BG+2K+uSZsd/jGTKFG62FevtAw6BavoI+MJVT6h8tproiazH
         tkcw/Han9uugEe6wQMX5Z5P3IIC47dLoThzqYY8rZVsISWksu3Z0+iKPoGuhIgZawqS6
         I13g==
X-Forwarded-Encrypted: i=1; AJvYcCUR1mdg7RUvi6AC8JbfhAb64tbSvtnI+zj9lFRJZRi025lklQK14uElzj9Bt+YyFX7EIyaaTwO4PCj82X8=@vger.kernel.org, AJvYcCXmlBwtSCv5BaE2S9efbpPn4gIyKbm9NRXSXw2uOggAh82cF2Kj2B4RFcDe1ZmrDlfjseRRS4rg@vger.kernel.org
X-Gm-Message-State: AOJu0YxjuGmUpWrnHNmWmiMaV+leSQM3rfdhMBxMSMt461ywLSz0bfip
	nhrWIJOfFpT2wljpWTPfzgzOlVZzGJUkRTb7o+IMDcNWR3pT2xktZ7cM
X-Gm-Gg: ASbGnct0+cq4MaJ2mCslFsQaCTvOv4OVNOcDMSliEuU9+6jAW2fJngyuwPUkbwjvuIt
	zC7zqLh5qN2OXxbATHtXifKaj9oDvnHMpK6pSSxZGhsyNO0sOnuOH5lSG/owXYQfMMfFpGwZaqj
	zAogCTLZDAz8XsnhaCO+TEBGqCBF/p9Qal4rjEIpWpMzfDdxRS6elFCEDcSaz9VylBj8eWaq54Z
	7c/y+yucqDplekLI+kzEHOuaDiYbw8YP9oZacbDyW3TyUQJ5mawmxkUGR4B+SZlJ5uPD58tjY+k
	7mKMa+CkFLkOqUhKEq6ZGMrjqMCcIZy+TMWF2zLrSIos0Hzp5pInfBK557LZqbpowDJjtB/DuQO
	b8yuLlCnKa004cvPdLeh0bibJf+ELLv3YHlEz11D6F2wRc3V+3A==
X-Google-Smtp-Source: AGHT+IG5SmqyGRhbJLI1lUfKcgWrIZJ9XRjcslCIfml2F+ys+AyU77PLVUALf1B/hly4EEhGK2XMTQ==
X-Received: by 2002:a17:902:db0b:b0:24c:aa17:e727 with SMTP id d9443c01a7336-24caa17ed1emr52079315ad.0.1756964802908;
        Wed, 03 Sep 2025 22:46:42 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccaeaa74dsm7370135ad.1.2025.09.03.22.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:46:42 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	khoroshilov@ispras.ru
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2 RESEND] media: as102: fix to not free memory after the device is registered in as102_usb_probe()
Date: Thu,  4 Sep 2025 14:46:29 +0900
Message-Id: <20250904054629.3849431-1-aha310510@gmail.com>
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
						open("/path/to/dev"); // open as102 dev
						....
  usb_deregister_dev();
  ....
  kfree(); // free as102_dev_t
  ....
						close(fd);
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
v2: Fix incorrect patch description style and CC stable mailing list
- Link to v1: https://lore.kernel.org/all/20250822143539.1157329-1-aha310510@gmail.com/
---
 drivers/media/usb/as102/as102_usb_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index e0ef66a522e2..abde5666b2ee 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -404,6 +404,7 @@ static int as102_usb_probe(struct usb_interface *intf,
 	as102_free_usb_stream_buffer(as102_dev);
 failed_stream:
 	usb_deregister_dev(intf, &as102_usb_class_driver);
+	return ret;
 failed:
 	usb_put_dev(as102_dev->bus_adap.usb_dev);
 	usb_set_intfdata(intf, NULL);
--

