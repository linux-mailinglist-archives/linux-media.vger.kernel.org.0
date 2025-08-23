Return-Path: <linux-media+bounces-40816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF3B32876
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 14:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438B75E256D
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 12:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CB92580F1;
	Sat, 23 Aug 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQjPuS6r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964E214A78;
	Sat, 23 Aug 2025 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755950648; cv=none; b=CgwLkurPGQhG3PUAankBGhqHnrXjQDvDiRSFk8MZq6OGLyt1ug0VaBAe/It036loWnwTqSXnTgtu8jVCms9P/n5kVzotIqc88TiqEEQkbX/geQ137WKmitHJI/4iYmwG3l1fsNM5joc4oKeeIAKHWoIXXn5dV4slZIzH9h66sc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755950648; c=relaxed/simple;
	bh=y9QQemxhNMuU9Cg9hSjpes05Vn3CLhpEomMTRXsM1eM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aTgRmfowTJdy2SUdiVTOK1u0d7w8Mdhed/AQ5GvpJzvgomNZTxm2QDb21j2hBuA+daIreev3I7eOymFtUd4nyncjJ9/rcS67FAXiv7K7YzyjuvavFhOko/31f6LHm2WYj+tVD2Lw1PUhLAO03O8ZF8i0vy8AUVeHQNI1yNhrL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQjPuS6r; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso1762287a12.2;
        Sat, 23 Aug 2025 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755950645; x=1756555445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4oONS1z7VfzwpCrdNQbfTZz4SLPX1uCJokgWYpKs+dg=;
        b=bQjPuS6revT8lsNehEeZfEVdvPslZcM98iw0H921j9ibtiDBhvkDZfd5Y6+pqDj1J7
         ri6Y/MVmbOrsE8eotyA1KRbyZz13DPgM3Yr7bbFoBkp3vHfexnUdTubz/qov+LA6KHe/
         h4DlTjWkPUZ4VXljeR8Crg6gRCMrnEeO2rZBDZ3dHEPLm//Y0VfrHqqVXX4SAfGZQoCD
         2TJBG8rAZqBH7kW/+O7hKV+6zeHliJFFC+WwFuhax+gBo36M7jyuX+iu/8E6Lgn8oMA/
         oixB6Exs59b3w3JDZy4HMvUAeVMomT4gKkxnAL4wWHblwSd5+CYhEIhlzi8nsyhrbMjs
         4oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755950645; x=1756555445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oONS1z7VfzwpCrdNQbfTZz4SLPX1uCJokgWYpKs+dg=;
        b=CZ1PloRgD2Pss1YXR6Tmetukw9Gv/6ty+tffdcjmZ3R3lYsqsakx3BdOA9TuX+4x2g
         CiEFc6v9XNXfonotUqXRp/mPpi66V20/lkYetK1P4YG9AFr+Mkz7HsFKHqMn7DTNwbyf
         XHcC2ZtxAXEENizy9twGie4LAIX+NuB3Czb+vygyHa1GSeppRECjc/vJdWMvl8oHZb10
         0s1hQJ7tSOnVsDi7KrSR9g2NdNCa2K5unoPQv16KLL2JiUdf//ccESFVWQS21l+3LvTC
         p13a1eV9aza+E+KJ/SyW+k7V2VpYTaA7funAA1NujsaaD1eojEXqdq7huNDOotBgZVZt
         bLeA==
X-Forwarded-Encrypted: i=1; AJvYcCUCpZgCKmBvyVgkcFUrk1XonBmsRwQ1LEg/gJMnA9ss4CYof/436rmkEA803r09TSBzmtQy1iGJrOCI3tc=@vger.kernel.org, AJvYcCXe104hM86qEDcqmKEA2FXFUutYNsTLdGttJyJA6CQcaFN4DoxMeffrMzRkTpH8HnlfB2cEZQps@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfr8zGTsSypWmZQx4bIuHVnnnkuoEDkRJCn/kHbMjKY8kxWppE
	YPMYtXwPh4QiLfHH1fTQ/iaEXXjklq3SRMPKE0zZ3EQUeVh8JPlAGgIUcOsICJgc
X-Gm-Gg: ASbGncspAr8s372yNU5xTf60EGN6dzeyzWFIUmDGNF4MUp2MXZUjxirVqBkPDsZFCmy
	9JcxQRjR3XkQW0vGOA1RuGns9cUDC12H5o6ElymUcNsVFnz9EoPHEjNSO+NpnRmA/Bd30Xiy9t3
	/3lmlaaVC1O15z595Qfak5iB8zoyV87FlnK5L15DBNKYWbZYa6BsmkU7bNBOtNgggr0HPcCFDA6
	askhBv+qrFkWtgcfIX3l3KJqwElhTU5sN/Z7I4POwE97LBuTFLWjOsLflbj3CBJZIxiOr3OqCSU
	MYoM5RF8gNJhGykPgaI1qYlTEH1j2zotHQRs1pG9xsOhLG9FxyPoj6YPwP4IiFlFcsOvzxCq+v3
	BSceZmOiAvJlMUoWSld9sUYXAGZBQH9KhxsdrhSyKhUThVz4p8Q==
X-Google-Smtp-Source: AGHT+IHxR6jm5ZmmM2ZSXvNmIZZ/hId0fVzNB7puIttkCZ9Eq7tldSOdS16bnkeJZ24C/1xXW3+LSQ==
X-Received: by 2002:a17:902:ce81:b0:242:e0f1:f4bf with SMTP id d9443c01a7336-2462ee7b494mr81646085ad.18.1755950644926;
        Sat, 23 Aug 2025 05:04:04 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885efd4sm20931775ad.69.2025.08.23.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:04:04 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	khoroshilov@ispras.ru
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2] media: as102: fix to not free memory after the device is registered in as102_usb_probe()
Date: Sat, 23 Aug 2025 21:02:57 +0900
Message-Id: <20250823120257.1176990-1-aha310510@gmail.com>
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

