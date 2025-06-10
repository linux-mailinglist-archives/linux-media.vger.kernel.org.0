Return-Path: <linux-media+bounces-34433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC541AD3747
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618B7188CAE5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56155296162;
	Tue, 10 Jun 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fs6738ML"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4429614C
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559278; cv=none; b=DWWRAX5ws8OmSDcSF/IdMhOVDAT9UoRiwdZxxtyLPz09DH/dYEZIJBrWQCYDo5harJhcuteWsDmw4ocZzNuWwrc+UmRAl7oBNKCAxiqPndfCFLfSm5xMMJUeBBE/USbFv0Z2LeagU9N+EAyyY3IFRAn6SPSX+9EtYaq4OnSbau4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559278; c=relaxed/simple;
	bh=PYVfr4MzdRcAc8GZZqfTO+4NnznKF5DM0Ha6GQ9ktrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=PnrbLot6WDTjOUtRe7lntebNKsjqVnbhIuL8IVdWuYmLCMZD8bwuKxAnXRhiWwED6HVZ8dUz8S4eU77+qT6oScJv+aWT7uiTlSODNi3ax2sKkgxkP4aJq9aNzCp/kxAz2fV2WT9d2zCM4GibFchdhSrlgb8Ni2YJeOLctmZDQv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fs6738ML; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250610124113epoutp03d83d3aaf74b48e28114418b529bbefcb~HruO2INwl1993319933epoutp03Q
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:41:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250610124113epoutp03d83d3aaf74b48e28114418b529bbefcb~HruO2INwl1993319933epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749559273;
	bh=XzsliogzO86/Q79QWe6n/Aszt7NA4JFz1tCGiPbDBOk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=fs6738ML+jnhn2LfL3TKt5YcgEUHNnaJwEcrbUl0+GdfrW2UHMpT72UQ1txXCKbfQ
	 DBA1OGL+LjkdyLw28Csh3zZRpv6IV1iZTH1zLw4h0fzh3HZuhpxd3D8RyxYwyksvDI
	 YCPyB4ctTdmwJapEHq6qg0ccv9UhjT7uBFF8XhDE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250610124112epcas1p4422da5fdf6b42ce37823fb943165b9e0~HruOanzKQ1127311273epcas1p4j;
	Tue, 10 Jun 2025 12:41:12 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.36.225]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bGpLc3MWyz6B9m5; Tue, 10 Jun
	2025 12:41:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179~HruNnfD5e1086510865epcas1p1j;
	Tue, 10 Jun 2025 12:41:11 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250610124111epsmtip2034aa8240d6ff98f4180a63af5a47327~HruNisgcU1062110621epsmtip23;
	Tue, 10 Jun 2025 12:41:11 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
To: ribalda@chromium.org
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngjun Lee <yjjuny.lee@samsung.com>
Subject: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Tue, 10 Jun 2025 21:41:07 +0900
Message-ID: <20250610124107.37360-1-yjjuny.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179
References: <CGME20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179@epcas1p1.samsung.com>

The buffer length check before calling uvc_parse_format() only ensured
that the buffer has at least 3 bytes (buflen > 2), buf the function
accesses buffer[3], requiring at least 4 bytes.

This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.

Fix it by checking that the buffer has at least 4 bytes in
uvc_parse_format().

Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
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


