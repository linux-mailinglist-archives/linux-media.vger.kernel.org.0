Return-Path: <linux-media+bounces-17270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2359670D4
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 12:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A332843B7
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E3617C216;
	Sat, 31 Aug 2024 10:26:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA9170A10
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100012; cv=none; b=XAdOZkxT0DnzmVl2c3F1pploTXRrnpCHjxIDzFYq/ypZf5gHBAAY+d82LO0mCDZzO0LluZEuGA14X3cvpecX5mntdvQwB3YDegLMCnpajBRqxLjddzrWhvqeAVO4MdPx5IBDlMTcOpD0BXkE4EKY3nJiFW6eND7ORi6GfnNt1tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100012; c=relaxed/simple;
	bh=vBTTg1R8re9W3zthz6KQsf5NFvtaShxQgMaDNxviz/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7y3V5bL0MfdTCrJRKqrQl5291YLVH1DiThVUBQfQVTopMQUCU/wTH1Yx3laXqA4tAi+rt8SP8hTqAxMmOltO7aIQ30Yqt2otBcdP/vAxY4LoZiApjxUAcLyiEBd9VHRSVCvVEr6kK9dMk6cg8u+q6hcH1oORO7/arXIbV6tBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wwrlr4d3nz4f3lCf
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 18:26:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4958C1A0E9B
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 18:26:48 +0800 (CST)
Received: from huaweicloud.com (unknown [10.48.32.205])
	by APP4 (Coremail) with SMTP id gCh0CgAHL4Xk79JmcrjoDA--.26679S5;
	Sat, 31 Aug 2024 18:26:48 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Jonathan.Cameron@huawei.com,
	broonie@kernel.org,
	yangyingliang@huawei.com,
	liwei391@huawei.com
Subject: [PATCH -next 2/2] media: netup_unidvb: switch to use devm_spi_alloc_host()
Date: Sat, 31 Aug 2024 18:26:43 +0800
Message-ID: <20240831102643.1229-2-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.46.0.windows.1
In-Reply-To: <20240831102643.1229-1-yangyingliang@huaweicloud.com>
References: <20240831102643.1229-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHL4Xk79JmcrjoDA--.26679S5
X-Coremail-Antispam: 1UD129KBjvdXoW7XFy7GFWxtFWDZF4fJr1DZFb_yoWkZFc_uF
	yavw17ZayjgF17trnrKr18Za9Y9FWYqr40gr1S9w13Gryrur48KFn7tF13Jrs29w17Cw1x
	Xr90vFWvyr12gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M2
	8IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F
	4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
	C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU88nY5UUUUU==
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

Switch to use modern name function devm_spi_alloc_host().

No functional changed.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_spi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c b/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
index e90aa1c1584c..34d6d52f1e4e 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
@@ -175,11 +175,11 @@ int netup_spi_init(struct netup_unidvb_dev *ndev)
 	struct spi_controller *ctlr;
 	struct netup_spi *nspi;
 
-	ctlr = devm_spi_alloc_master(&ndev->pci_dev->dev,
-					 sizeof(struct netup_spi));
+	ctlr = devm_spi_alloc_host(&ndev->pci_dev->dev,
+				   sizeof(struct netup_spi));
 	if (!ctlr) {
 		dev_err(&ndev->pci_dev->dev,
-			"%s(): unable to alloc SPI master\n", __func__);
+			"%s(): unable to alloc SPI host\n", __func__);
 		return -EINVAL;
 	}
 	nspi = spi_controller_get_devdata(ctlr);
-- 
2.33.0


