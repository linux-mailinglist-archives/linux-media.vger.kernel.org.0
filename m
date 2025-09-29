Return-Path: <linux-media+bounces-43335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E859BA8FAB
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 13:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E24367AB039
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 11:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74D22FFDC9;
	Mon, 29 Sep 2025 11:12:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B128725E;
	Mon, 29 Sep 2025 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759144358; cv=none; b=IrBs/W7AKec3qN1Qr4H7ITor5l5nl94+8ISMBw58h+QRbewdPVg38mRDZwnixHukwbRLpu1X/H24Ml20+9tCh8pdrECB6Vu5WOubqNvbUGjIoaTaOtVZVIypmjThHCRufFswyHH8RskXwl742YFO9FjxyxL2wbjh+Y3Qw2lUZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759144358; c=relaxed/simple;
	bh=JAwAbnTQqGxDAej0UBJzM2W9TRrXPEgSOnyGe9kxDrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JedYgkO6lRun+sOi8i7YsELvOPnlko01AOY3C3WkvJp9pW311ncd3oelmC8oCx6ffcnWimaTig8mj6CEjcFvkU3nmAY/EmW93zv6fcJ7oYZ5uB0BelbQyKWYedwu0S5rRBmXrRFchCsle7toGQuy5ajw95AGO+OhEDBjW/jZzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnjRafadpo+v6+CA--.49875S2;
	Mon, 29 Sep 2025 19:12:32 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: linux-media@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v3] media: cec: Fix debugfs leak on bus_register() failure
Date: Mon, 29 Sep 2025 19:12:29 +0800
Message-ID: <20250929111229.1572-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20250929104715.1493-1-vulab@iscas.ac.cn>
References: <20250929104715.1493-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnjRafadpo+v6+CA--.49875S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur18ZFW8XryUGry5ur4Durg_yoWDWFc_K3
	4rZF97urs2g3y3Wa9I9F1fZry0vrs8WF4fCFWftFy7J34SgF1DXrsYvr9xZr1rKrZ2vFW5
	A34jqF43Xw13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUj_M3DUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsAA2jaLkzZAwAAsE

In cec_devnode_init(), the debugfs directory created with
debugfs_create_dir() is not removed if bus_register() fails.
This leaves a stale "cec" entry in debugfs and prevents
proper module reloading.

Fix this by removing the debugfs directory in the error path.

Fixes: a56960e8b406 ("[media] cec: add HDMI CEC framework (core)")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/media/cec/core/cec-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index e10bd588a586..147a31562234 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -421,6 +421,7 @@ static int __init cec_devnode_init(void)
 
 	ret = bus_register(&cec_bus_type);
 	if (ret < 0) {
+		debugfs_remove_recursive(top_cec_dir);
 		unregister_chrdev_region(cec_dev_t, CEC_NUM_DEVICES);
 		pr_warn("cec: bus_register failed\n");
 		return -EIO;
-- 
2.50.1.windows.1


