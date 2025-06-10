Return-Path: <linux-media+bounces-34419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33464AD351D
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15D073B4E60
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D30528AB00;
	Tue, 10 Jun 2025 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OVivzmZl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9E2284B45
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555452; cv=none; b=KjDbnyyaj3S9npYte0X3V4PrT+5Zx5cmoOaCupb7MOem7nf2t6hmKX+w+Of+dLSfoRmSDkmBhPyzR/yYT+pa9turVsJi5JdaqOf43C9o2kmtQI8nOHj/S0JXkAM1XjMJVL172Ah4/gVqPkziNz6nVsGxMTzzEaBJnyBQubHDIZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555452; c=relaxed/simple;
	bh=zbKBIpi614axTF8gG3DZNRk85mGzG8B+vodl/vwGUTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=ChFfTNeIj/4n5SF37QWL08jS7gvyADzj14pSPxB5Yxdiub5vNRyPAC6KkEKV6Zu2FUlBXow4oUnxOUilST8hftdQsFmogLHyIxmsl6otBvZSd6p2TWTEM50tqYbjTgrUWVYtQrmty+v1pWOgS3bjJPm7GIc+4ZoGX5cJkF80svU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OVivzmZl; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250610113727epoutp011c5d497c3099b6267e24daf5c5582860~Hq2kHNsxO0774007740epoutp01_
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:37:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250610113727epoutp011c5d497c3099b6267e24daf5c5582860~Hq2kHNsxO0774007740epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749555447;
	bh=eeZmSry5I4+tQJiwtHt5qgVNOFM45MDKRAaXJGLpn+s=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OVivzmZl1CfHfsIGZGiOKcB/jPXb9BfbP83JgfHlBV0YgiXVJlV9RMng3AzcK/QAN
	 +LzyFDDW8ooNvNM4zK86NNBAxDsKnXtQvn1628Ecvp7Ruq9mR2XxlNZyY5wiLS4G0M
	 BIhrLoW4Y3oycDSh24ej/WcZ9vrO444blpU1uGaw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
	20250610113727epcas1p37b794cd64a16f866e9da1c215c77d4a1~Hq2j2JVs70786307863epcas1p3W;
	Tue, 10 Jun 2025 11:37:27 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.36.227]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bGmx31DTFz2SSKf; Tue, 10 Jun
	2025 11:37:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9~Hq2il7NRZ1580715807epcas1p4a;
	Tue, 10 Jun 2025 11:37:26 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250610113726epsmtip2adf1ba6dc5692599365a9365704554dc~Hq2ig7OKZ0485804858epsmtip2B;
	Tue, 10 Jun 2025 11:37:26 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
To: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Youngjun Lee
	<yjjuny.lee@samsung.com>
Subject: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Tue, 10 Jun 2025 20:37:22 +0900
Message-ID: <20250610113722.36820-1-yjjuny.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9
References: <CGME20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9@epcas1p4.samsung.com>

The buffer length check before calling uvc_parse_format() only ensured
that the buffer has at least 3 bytes (buflen > 2), buf the function
accesses buffer[3], requiring at least 4 bytes.

This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.

Fix it by checking that the buffer has at least 4 bytes before passing it
to uvc_parse_format().

Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..60367d9e1c05 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -729,7 +729,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	streaming->nformats = 0;
 
 	/* Parse the format descriptors. */
-	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
+	while (buflen > 3 && buffer[1] == USB_DT_CS_INTERFACE) {
 		switch (buffer[2]) {
 		case UVC_VS_FORMAT_UNCOMPRESSED:
 		case UVC_VS_FORMAT_MJPEG:
-- 
2.43.0


