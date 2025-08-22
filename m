Return-Path: <linux-media+bounces-40780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCDAB31BC6
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7DDE7B99B6
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E96307AEB;
	Fri, 22 Aug 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ulzq/rLV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C9271464;
	Fri, 22 Aug 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755873357; cv=none; b=GxRoyw3aJKYbmJ36tOtCuyYO/TZmmGRIpdwmhP0OuqD4hkgNNBP6tMy0lxWrdMIMOpib2Th+/LD2+f62PHaMBeZN9KZe7qzFKWz4iH6GiNJwZy0zan2ZidX0KhFHPJAnTEhf7xhmeZifUgMbM96+2BWrK+hBoKQ/cfVKx6YVkbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755873357; c=relaxed/simple;
	bh=96xcxk++8tsezde1KQbToqIZuQwUY2p6+5DevPtZOiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CXowalwCd/kF9BHyYbMqyJJNCf2xGYPiEn2raQtV7ZJTEMGc5AaKUBFGldoAx7LMnuwIgXGlxt9UNZF0ic17Sc3ONriDUv9nUUQ7DCE6C9MwloZkQeP5yoeV7U8sKoz6DXPfTOXsO/90rbDjX2CXBGErcio2foUoCn4PPmJtLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ulzq/rLV; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b474d0f1d5eso1473187a12.2;
        Fri, 22 Aug 2025 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755873355; x=1756478155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rrIMuoEKua+reAZjU5EG7jCiOts2NB6m2+CDx3dJic=;
        b=Ulzq/rLVxHPQJTbf7Sd1kGpzcY6HkJnkhXYAZeRrx9WChm42krvdmMNBh6VHgPWYYx
         X+Cry3qpWrH3v4HRNbH0ffGMAGBvb5yTvSf5Z9T1WJZ8FdEBIgoqyYIgZ2uS/3jJfdEf
         ftBXjNdwjYQ55VjFBfMJVmv1AyaVynKpwramZG156YBBSAW8yHnzsuLq275HJWfosDzs
         soEpITphP1WnCoY+as5YJqjnvTdN95Pf8PsQAKdgHFck7ULQAGhcXVdhaVcL9pyhHaT8
         DipYXFw1+BeQHeoq28g7+zym8dOcrCTZsiK+sAa0MA7F9opCeeYBeWSYtibJPsmkfRA4
         LOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755873355; x=1756478155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rrIMuoEKua+reAZjU5EG7jCiOts2NB6m2+CDx3dJic=;
        b=ftJX7t15+mkT2V62cGNEuxD4sEZgZzr1CdnOQ5gP0Es21UqJsCLinkPFFV5+77S/p4
         QzfS2cGhMn2lqa2LtKcVIaXCryxKNJiR7+pFoIdVsXTbINVgYVidMDj7oGQ3l8342cVY
         PorE7QCGMdbI4+IQ906Ndd9a3GeocFeGqSj/KlTC1vITSO/bu97fQuRCDoNY/P8nxb6o
         bTLBrfwQXNDl6dRPKzZvFQVTbPVMR5ET0zFLvpgF97bUBn0M10f1FO8gR8nCU14htX8V
         QihWFzSZzrWRnyTjq7APvlSTvUFjNQSUJe/vyc8flgZjnqhGPazAtMyjYzXFML2NfzYx
         9qTA==
X-Forwarded-Encrypted: i=1; AJvYcCUSaPXVqVkt8YVSi6XZum42OaVhpaTKW6tVMudmUMA1PUBqa0hiMoOcpeazHJWcjat7AAXmhKl2VFD8cFg=@vger.kernel.org, AJvYcCVYYn0imzdNTF6HgKr4nGHBlf/fYr6aF0aAYeF5Rbtuf0i9Hq3hzVpm7HUvN5iBZfVt0rMe5uXqDKFlnsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+BQZAQReYeHDvMQRalIiTIPeDc2IOgfxqfjbRJja1YJBmDbW
	LalCy/DOxbo1EqIdj53aGreOZXgdceX/KnA+/PVTuDLvMOSnS+nt/MXp7Urn5St9
X-Gm-Gg: ASbGncs9vgrbsXsbRdehPVty6o1fRcP39LV3Rwg3TmwH6xt4ojqnU9bf66TrsJrsm7W
	hRrh86blOdObiwATfIz+SKBRjyU1kn75qqv78cW4nR+iygXvRMEaXqtJMNjLbRlHv/AJGvDLU4f
	JaBc+aTVdVAS3ShecBNUfsgBwYVGnZOU+DtVvZbq17FkK+OO4sWMUEC9duCSOliOmESwCJj08h+
	92liGMGHXy/XLDcunD1kHEfEW/xmb1QgLg0JmfZ7DEKd3sMqHTkjF7hu8+er4Gyk6AnYtEgYKcE
	TsxAua+ffixAqPAbPjiH6U/23z6jfjgj4VCBFu1GTRB8PA11rjK4pKm489hUTx49sNVQuZ+r6qX
	ySe8Lu/EAEjnaK+6mNOINzQD01LjYUxo993QDnKlxl2+cP/CAPg==
X-Google-Smtp-Source: AGHT+IGiQ2Vo+pbwW04/pSc3wd9e0Z4hwikBsHoqMhMGLUxAE5J7EEUQj+CUnMN4lQ4jUuhJ+p1ZOQ==
X-Received: by 2002:a17:903:19ce:b0:235:eb8d:7fff with SMTP id d9443c01a7336-2462ef1f70amr42836645ad.28.1755873355415;
        Fri, 22 Aug 2025 07:35:55 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c6fa6sm85821575ad.92.2025.08.22.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 07:35:55 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org
Cc: khoroshilov@ispras.ru,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] media: as102: fix to not free memory after the device is registered in as102_usb_probe()
Date: Fri, 22 Aug 2025 23:35:39 +0900
Message-Id: <20250822143539.1157329-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In as102_usb driver, the following race condition occurs:
---
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
---

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

Reported-by: syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
Fixes: cd19f7d3e39b ("[media] as102: fix leaks at failure paths in as102_usb_probe()")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
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

