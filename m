Return-Path: <linux-media+bounces-34487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E4AD47D9
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 03:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F10189E902
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 01:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2A9127E18;
	Wed, 11 Jun 2025 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RgDgoElY"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C264A8F
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605162; cv=none; b=IYIOoyS1RP2eWohjT1XoeARCmn0eui/WRyxmsIg0jxceRyCVrva1/ZzlVyci3puDhs5hkcDbfNnl+RbK2Npy1V6WpZ+Z/AHPzk6Jr3+ZPMiOk51Y2YqPSgkYe03p9rB6f1D8diLpUKuvELZJ3y65mugJGockhOiFjS+t9jSchO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605162; c=relaxed/simple;
	bh=VKWE54UMcR041r5jQB05zWFSUtRwIxUfFhYz4GaHrBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Nxc9a16ZVaYCUus3cRo6CvPHXDAodyVd3G0Kgtf8+gexvGLfDl/lfL2wprsQQM7ukXwjvVgRU8PecfNatdqBEz1RCBA7WoeznjTwjUnsc91v/hY1OkzNdswmyfnkmx8i9WW5dQ8NaAV1oEnSfeA+qibHSGo2KWg/BlN+zIerrJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RgDgoElY; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250611012558epoutp038648591323e6da792bc03464fd4b1158~H2J8cncpf0825308253epoutp030
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 01:25:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250611012558epoutp038648591323e6da792bc03464fd4b1158~H2J8cncpf0825308253epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749605158;
	bh=HdkJ86X8mFGVShQeGlIsAFxkRbgmE4Xo8V1mtGu+fo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RgDgoElYQT9NK067BsP7kUJ6MLVFUitZzbhXd2rLtaxqXFTZx+bFqIm0Np/rGeJBp
	 m4S8GGhCjLzfhr7eI7DoqX+jJ0NEuBm7a2zQSQDcbHWyRNUrH2e0M0XV2TlCiYAXZ8
	 dwz42tPYmrlFP4mCAzk+LFycpEKANllUKK3d0QTg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250611012557epcas1p45cdcede2ad82d3ea24782798094ed530~H2J766VQx2750227502epcas1p4x;
	Wed, 11 Jun 2025 01:25:57 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.36.227]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bH7K10vHQz6B9mC; Wed, 11 Jun
	2025 01:25:57 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250611012556epcas1p2c22e7ceaed2677bcea2d0ac6c794ed1d~H2J7B7J9j1398113981epcas1p2D;
	Wed, 11 Jun 2025 01:25:56 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250611012556epsmtip26ff35c8eb67a6983c6bcf11bf25d82ae~H2J682GQr1741517415epsmtip2Z;
	Wed, 11 Jun 2025 01:25:56 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
To: ribalda@chromium.org, laurent.pinchart@ideasonboard.com
Cc: hdegoede@redhat.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngjun Lee <yjjuny.lee@samsung.com>
Subject: [PATCH v3] media: uvcvideo: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Wed, 11 Jun 2025 10:25:44 +0900
Message-ID: <20250611012544.40281-1-yjjuny.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610213058.GG24465@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250611012556epcas1p2c22e7ceaed2677bcea2d0ac6c794ed1d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250611012556epcas1p2c22e7ceaed2677bcea2d0ac6c794ed1d
References: <20250610213058.GG24465@pendragon.ideasonboard.com>
	<CGME20250611012556epcas1p2c22e7ceaed2677bcea2d0ac6c794ed1d@epcas1p2.samsung.com>

The buffer length check before calling uvc_parse_format() only ensured
that the buffer has at least 3 bytes (buflen > 2), buf the function
accesses buffer[3], requiring at least 4 bytes.

This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.

Fix it by checking that the buffer has at least 4 bytes in
uvc_parse_format().

Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..1100469a83a2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
 	u8 ftype;
 	int ret;
 
+	if (buflen < 4)
+		return -EINVAL;
+
 	format->type = buffer[2];
 	format->index = buffer[3];
 	format->frames = frames;
-- 
2.43.0


