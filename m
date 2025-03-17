Return-Path: <linux-media+bounces-28332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5DA63AC1
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 02:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9F03ABC5C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCA813B7B3;
	Mon, 17 Mar 2025 01:52:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69628E8;
	Mon, 17 Mar 2025 01:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742176366; cv=none; b=NraVdJ9h/ZcNjF10xVdlhOY6Hh/agDgoOh2FMYRjhLWRJBIII/Ik7OAPO/i4lSurF8PLJryHHpeQj28ijAL2Y67W6HA/qQkJxHpONRHsfZgaOpbC3Sa9CXhAnXkstPp88nBUHMiP/FmxHDy+5aYldBHSgFZjuRI+b4+cN80SpOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742176366; c=relaxed/simple;
	bh=mw28www5sYVNRslBToVbZ5XjJQmKnalNib1C4C6Gg7s=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=S1RusLRxEIU6uWKBN8whCUEm5wlf/4u5nr0Q9mK1UOHbpKj5IVCUMoxNN+O7HvEj12fmxqBVzU6Fg2w2zlMXt2yOK13cj/bI50yx8UyZSXOmQ91Vqu7eQsed2axfda9TeAPUXO1axlpdyLvjtvUBnYoGqTPPNnTtJ13zJxD/CvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGHzQ2Rphz5B1J4;
	Mon, 17 Mar 2025 09:52:34 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52H1qFfp073947;
	Mon, 17 Mar 2025 09:52:16 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 09:52:17 +0800 (CST)
Date: Mon, 17 Mar 2025 09:52:17 +0800 (CST)
X-Zmail-TransId: 2afc67d7805153c-f0bae
X-Mailer: Zmail v1.0
Message-ID: <20250317095217146xx5rleJV2hlI8ucSypghO@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIHYyXSBkbWEtYnVmOiBoZWFwczogUmVwbGFjZSBuZXN0ZWQgbWF4KCkgd2l0aCBzaW5nbGUgbWF4Mygp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52H1qFfp073947
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D78062.001/4ZGHzQ2Rphz5B1J4

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
v1 -> v2
perfect the prefix
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
- ksize = max(max(in_size, out_size), drv_size);
+ ksize = max3(in_size, out_size, drv_size);

/* If necessary, allocate buffer for ioctl argument */
if (ksize > sizeof(stack_kdata)) {
--
2.25.1

