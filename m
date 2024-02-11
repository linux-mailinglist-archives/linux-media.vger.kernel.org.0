Return-Path: <linux-media+bounces-4948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8758509CF
	for <lists+linux-media@lfdr.de>; Sun, 11 Feb 2024 16:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 601891F21344
	for <lists+linux-media@lfdr.de>; Sun, 11 Feb 2024 15:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534485B20C;
	Sun, 11 Feb 2024 15:07:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8738DCC;
	Sun, 11 Feb 2024 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.251.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707664037; cv=none; b=XBFBqI8xbEL3uKsg+pqey7zHk2sfin4RnW9szz7HvgtzHtIyvaT8Cxs08Whozi7YPT/K41T4Lo5YYK9gzM/EPMFNRmLFcfVSbgHanlElqjtL8z5AsTZGElfLovTRn+E9HPV/6lCRCCoiybxtcPFKdMT3TYqbsU67LqxE0MfxEgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707664037; c=relaxed/simple;
	bh=tYjF23hS3kCuiZrPyeo90mjXDnz1Ql+YsvWXtiBdYuI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jTBWRgY0iue9BFb+LUSpbUgRVYvBrPIa9QO9d2wgNFaEUDv4KdJ9GJ8ANxdF0fPyYoMCGJDGZi8fh9CARTAU085MD0xow0XRN6tjya919n1kqTW/UuB1T/EweFL/uDBRm9HXt/bN6vfkspJTlZCW4aOfV1TB3OxK4M16OLFCnmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru; spf=pass smtp.mailfrom=aladdin.ru; arc=none smtp.client-ip=91.199.251.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aladdin.ru
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: go7007: add check of return value of go7007_read_addr()
Date: Sun, 11 Feb 2024 07:07:05 -0800
Message-ID: <20240211150705.3703-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EXCH-2016-02.aladdin.ru (192.168.1.102) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)

If go7007_read_addr() returns error channel is not assigned a value.
In this case go to allocfail.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 866b8695d67e ("Staging: add the go7007 video driver")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/media/usb/go7007/go7007-usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index eeb85981e02b..762c13e49bfa 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1201,7 +1201,9 @@ static int go7007_usb_probe(struct usb_interface *intf,
 				u16 channel;
 
 				/* read channel number from GPIO[1:0] */
-				go7007_read_addr(go, 0x3c81, &channel);
+				if (go7007_read_addr(go, 0x3c81, &channel))
+					goto allocfail;
+
 				channel &= 0x3;
 				go->board_id = GO7007_BOARDID_ADLINK_MPG24;
 				usb->board = board = &board_adlink_mpg24;
-- 
2.25.1


