Return-Path: <linux-media+bounces-28334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD857A63BCB
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 03:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 200E716D4D1
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 02:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07501531F0;
	Mon, 17 Mar 2025 02:37:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035C8F5C;
	Mon, 17 Mar 2025 02:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742179050; cv=none; b=fkKAkC54T7jYb8+CwpvVT4LinchfacJ0B4uXdttRF9chhrLj1JP8GeEBH55NYFZaLxHT90aFD2gvd17qn23rVGPW+6YugS4oIejs4FjTBdTtb5hktMVjkrbxaeDUGmgFXGw+sYKliwboSmksy3yk2yi8qJRAAE42BBhhOb+4HrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742179050; c=relaxed/simple;
	bh=r/FuFsZTtgK1p1FUPUC75+BFRTPecVZwNbe74eefUdI=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=q/jCy9dSR15gT7N5h0UamiAvU0mZt/DyalJVjMCECaq2/wWdEe/bBj25U+EHnEUrSl4yMm2SO1z6eqMuzMOoDXfxUAZ33FZLqwJtaByOcknvSU993rOZCMw1H1w/2ery9899NF3J3xyg2505g2WNt4uVYGwlY/RsOhACi8yYg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGJzB1Rhyz5B1Jw;
	Mon, 17 Mar 2025 10:37:26 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 52H2b1bH051787;
	Mon, 17 Mar 2025 10:37:01 +0800 (+08)
	(envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 17 Mar 2025 10:37:02 +0800 (CST)
Date: Mon, 17 Mar 2025 10:37:02 +0800 (CST)
X-Zmail-TransId: 2af967d78acefffffffff06-bc4ae
X-Mailer: Zmail v1.0
Message-ID: <20250317103702708UdayAw742BADL4gzNYcle@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIHY0XSBkbWEtYnVmOiBoZWFwOiBSZXBsYWNlIG5lc3RlZCBtYXgoKSB3aXRoIHNpbmdsZSBtYXgzKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52H2b1bH051787
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D78AE6.000/4ZGJzB1Rhyz5B1Jw

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
v3 -> v4
fix the format of this patch.
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

