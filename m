Return-Path: <linux-media+bounces-28277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3CA62610
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 05:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB5F3B7D35
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 04:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E55418E34A;
	Sat, 15 Mar 2025 04:40:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D5D367;
	Sat, 15 Mar 2025 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742013623; cv=none; b=I1H2mw4g29KaWoT5vV9k4hUjuh7zGweyyGgKZfoXcFqbZIkob1di469G2NxFdZFE75buYlNxd+T6tyhLB5tQ+EDL3g9NJubEVwHd1I3dM0r9BcG8tATb0rjHw71yYPayD1HwD6tQL/X6Kov85ci4ed371MhKox53sfUEXuvqms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742013623; c=relaxed/simple;
	bh=8NPJpn3HyFTnwXahbQuUWleGTas6jrHLNib3zzqWO84=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=KEjEHFKJbUFLl9lz1aKTQ6pHToiwxACQ2TYg5OjfKeN3l6T2XvHQLB3YSGUhInKEOGaW+cczWAo5TJ1T6XMoF5EjgbZfAJby47mjJfhXKiP5vhwU8ZxDf+4eIXXpOxYpRIf/OPW3DAEVJZZRVlvdIq/7nLBKlfNR7RPzFuwzObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZF7nn4yXYz8R039;
	Sat, 15 Mar 2025 12:40:13 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 52F4e95m076816;
	Sat, 15 Mar 2025 12:40:09 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 15 Mar 2025 12:40:09 +0800 (CST)
Date: Sat, 15 Mar 2025 12:40:09 +0800 (CST)
X-Zmail-TransId: 2afb67d504a97f3-07648
X-Mailer: Zmail v1.0
Message-ID: <20250315124009404aGYiofkCnWFti1fQoFZ58@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIXSBSZXBsYWNlIG5lc3RlZCBtYXgoKSB3aXRoIHNpbmdsZSBtYXgzKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52F4e95m076816
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D504AD.001/4ZF7nn4yXYz8R039

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

