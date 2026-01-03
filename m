Return-Path: <linux-media+bounces-49857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D7CEFC7D
	for <lists+linux-media@lfdr.de>; Sat, 03 Jan 2026 08:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B6B301618F
	for <lists+linux-media@lfdr.de>; Sat,  3 Jan 2026 07:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2662D23B8;
	Sat,  3 Jan 2026 07:46:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB12C11E7;
	Sat,  3 Jan 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767426418; cv=none; b=vCePBtfNMrv7YwsaPuEkfhwUD+JrOnLIDUNi++83seQ+Wzz6nyrvrnpK0oSJ31K5LWQdUzFwTg6+Ob9KxSAuIxFiXXnY654ouJSAsBe3odQeVqjPRNpyrzT+X2uwrvmbbpoCWW8wUt89eEvdUgAhPEPiJxbu4BLMD7vUz0jKqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767426418; c=relaxed/simple;
	bh=mPXMBk7/bn+d0qFNKVBd6RJ70lj2OHq587ZEwdNDgbw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K0o4UhdmPTaDM8MF83dT8m0wgFwDnxQFH+lG+TmD9sIWElX6e+eX9YeOUJw1sUJTioNKopZqK8tgxWa5n3uBMPKheuTA+awd01+B70+vJzIf4vkxP0y+wtuwzPwMB4U1GwWUyICCMH464A5xLU4uJWbykkucJeZieYeFal8S+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowADH4dhpyVhpAe0rAw--.57933S2;
	Sat, 03 Jan 2026 15:46:50 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] media: cx25821: Fix a resource leak in cx25821_dev_setup()
Date: Sat,  3 Jan 2026 15:46:47 +0800
Message-Id: <20260103074647.1941895-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADH4dhpyVhpAe0rAw--.57933S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw15Gw45Ar4kJr4DXw4ruFg_yoWfJFXEga
	n8u3y7WrW5Gr1DKw4xtF1F93yUta98Xr4fX3WfKFy5Ary0qFWDJr90vwn8J3yDZFsrZryr
	Cr1xWFy7Cr4kAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbw8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwoQE2lYs80cZgAAs7

Add release_mem_region() if ioremap() fails to release the memory
region obtained by cx25821_get_resources().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/media/pci/cx25821/cx25821-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 6627fa9166d3..a7336be44474 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -908,6 +908,7 @@ static int cx25821_dev_setup(struct cx25821_dev *dev)
 
 	if (!dev->lmmio) {
 		CX25821_ERR("ioremap failed, maybe increasing __VMALLOC_RESERVE in page.h\n");
+		release_mem_region(dev->base_io_addr, pci_resource_len(dev->pci, 0));
 		cx25821_iounmap(dev);
 		return -ENOMEM;
 	}
-- 
2.25.1


