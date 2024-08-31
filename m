Return-Path: <linux-media+bounces-17271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428B9670D3
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 12:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35B171C21583
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BCB17C200;
	Sat, 31 Aug 2024 10:26:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC416A940
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100012; cv=none; b=kh1gxMXB/84zDHJLClNeVi/ro0DX5S4mp0u+QC83uUGb7flSrVDzBunJkvqogdJWuMfRz3Ng0+Si9T87V8LqE3GaQmwWzK7YJb83m5DFzHKNJ9M9I2Vz+hMjap5JL8amiMaOYVlQ+kPa19bZ3OgfwQLoP8IZvse16irFjYCixrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100012; c=relaxed/simple;
	bh=VfL0rVvkqV7KN/5mT6XRH9xVHWl+tfxDMjV+Cf5ivas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CiBq3Pzt7zqkBr8t8iTAx81mfMOmbMlnYmPOmYEkRz41YDAi846wukgA8eRl5hE0EUoPATur8MySjYKm4WzEH8oAxi5AY4KzNh0+lMZjPvkgkhCsA55644hV0VAs8Ec9CzobPaVDvOJ7ivg4MYXXHs77Nht4Uws1NCZCNoSebRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Wwrlr5Tl7z4f3jcr
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 18:26:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 8757C1A018D
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 18:26:47 +0800 (CST)
Received: from huaweicloud.com (unknown [10.48.32.205])
	by APP4 (Coremail) with SMTP id gCh0CgAHL4Xk79JmcrjoDA--.26679S4;
	Sat, 31 Aug 2024 18:26:47 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Jonathan.Cameron@huawei.com,
	broonie@kernel.org,
	yangyingliang@huawei.com,
	liwei391@huawei.com
Subject: [PATCH -next 1/2] media: usb/msi2500: switch to use spi_alloc_host()
Date: Sat, 31 Aug 2024 18:26:42 +0800
Message-ID: <20240831102643.1229-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHL4Xk79JmcrjoDA--.26679S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtw17Gw17ZFyUJr4UXr1kXwb_yoWfJrXE93
	Z3uw4xW34qkr1F9r1UK34Iv340krWxWF4kWa4Yyw13AF15W3WDJwnFkr18Zr1j9r4akFnx
	tw1kXr429rnrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UK2NtUUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

Switch to use modern name function spi_alloc_host().

No functional changed.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/usb/msi2500/msi2500.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 5138486abfa0..05b0550e840c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1219,8 +1219,8 @@ static int msi2500_probe(struct usb_interface *intf,
 		goto err_free_mem;
 	}
 
-	/* SPI master adapter */
-	ctlr = spi_alloc_master(dev->dev, 0);
+	/* SPI host adapter */
+	ctlr = spi_alloc_host(dev->dev, 0);
 	if (ctlr == NULL) {
 		ret = -ENOMEM;
 		goto err_unregister_v4l2_dev;
-- 
2.33.0


