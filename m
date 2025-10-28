Return-Path: <linux-media+bounces-45735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE22C1332D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69116586D0D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 06:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E460628D850;
	Tue, 28 Oct 2025 06:45:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C4253340;
	Tue, 28 Oct 2025 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761633917; cv=none; b=J+1LMJcZWem5QG7rXxXc7ZXMkluL2nY0PRyzYpNWN2Bv6Rfuok9jMtyiMJ/WGCHQcxovxd6P+4puck3EmNeF8Ti2cRtgZo05Lx5nk/dAMpVvVH6WBIMx5Mq/aREZ+H6TrdJUpd1158qWicKAFqS/L5sz/SDg3GeSFsYvnGC8ZZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761633917; c=relaxed/simple;
	bh=TBFcf1KgUZsTk66eSNoh9gIn/vxnMX10dY9cSlL+cEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBjHbUl9rAYG7hQFGjuYekgdzcKxgCaKDBltZqaQbUcMkxGDVYu8sCrtNvhN84JfQIyAZ/HDCsEpsgCyzzZKmHUODZp/tSN8lAgWlo4BQdsuEYtrSBxPMNBPNyez4Rmdr3KtFdld+Ndus3mEdLhHviCapDevDFBp7O7ucSHt3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABniVhtZgBp5BwgBA--.24294S2;
	Tue, 28 Oct 2025 14:45:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] media: videobuf2: Fix device reference leak in vb2_dc_alloc error path
Date: Tue, 28 Oct 2025 14:44:43 +0800
Message-ID: <20251028064443.655-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABniVhtZgBp5BwgBA--.24294S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wr13Xr1UAry7Gr4UXF47Jwb_yoW8Jr13pF
	W3tF90kFW5Xa48Ww1DJw18uFy5Ca95tFWYkrW7uw1furn8AFyfZr1Dt34qgryUCa97XFn0
	yryFgrWxGF45ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8JA2kATBtckgAAs8

In vb2_dc_alloc(), get_device() is called to increment the device
reference count. However, if subsequent DMA allocation fails
(vb2_dc_alloc_coherent or vb2_dc_alloc_non_coherent returns error),
the function returns without calling put_device(), causing a device
reference leak.

Add put_device() call in the error path before kfree() to properly
release the device reference acquired earlier.

Fixes: de27891f675e ("media: videobuf2: handle non-contiguous DMA allocations")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a13ec569c82f..7123c5fae92c 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -258,6 +258,7 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 
 	if (ret) {
 		dev_err(dev, "dma alloc of size %lu failed\n", size);
+		put_device(buf->dev);
 		kfree(buf);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.50.1.windows.1


