Return-Path: <linux-media+bounces-28278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB06A62645
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 06:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 723783AB060
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 05:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0F018DB1E;
	Sat, 15 Mar 2025 05:02:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6975228;
	Sat, 15 Mar 2025 05:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742014942; cv=none; b=FJKPdIOHV5wemx8YM00JV4dYZd/WUYQnsFrK/lZji9LbAc6FkVp0XRjQvBDTbeo7F8dz5PT9mlpgbnqP/sjPB/W84rU6JpxinEf85Cvqyn1oQPnJ9KxfTgjzwg0lvRBz9yC5pxEw+5JoxRVeHp2JfqGDr1uLR9UyUbnVB6Z4F2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742014942; c=relaxed/simple;
	bh=8NPJpn3HyFTnwXahbQuUWleGTas6jrHLNib3zzqWO84=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=lTTtE9QS7Ixd0ezHuyHqUPxScKA6tsalSjkZZfAbdy+j38mGyhvJmWinTyTacFgt89WwOj9X4WB82lUD1fZLzx+p/PG3/udpF9+9VKUvRQhKno4BPlqkxxpCiUDEI8uMNHd/yFmJUUnEWalG4vZBgqXZwoh8w9hBgJx2Vd7gA5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZF8H55MX5z5B1KQ;
	Sat, 15 Mar 2025 13:02:09 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52F520VX032049;
	Sat, 15 Mar 2025 13:02:00 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 15 Mar 2025 13:02:01 +0800 (CST)
Date: Sat, 15 Mar 2025 13:02:01 +0800 (CST)
X-Zmail-TransId: 2afb67d509c9ffffffff99c-1b7dd
X-Mailer: Zmail v1.0
Message-ID: <20250315130201758KxKWj6Mb7bgN6SqVrzu94@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <sumit.semwal@linaro.org>
Cc: <benjamin.gaignard@collabora.com>, <brian.starkey@arm.com>,
        <jstultz@google.com>, <tjmercier@google.com>,
        <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkbWEtYnVmOiBSZXBsYWNlIG5lc3RlZCBtYXgoKSB3aXRoIHNpbmdsZSBtYXgzKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52F520VX032049
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D509D1.001/4ZF8H55MX5z5B1KQ

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..96cb9ab5731a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		in_size = 0;
 	if ((ucmd & kcmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);

 	/* If necessary, allocate buffer for ioctl argument */
 	if (ksize > sizeof(stack_kdata)) {
-- 
2.25.1

