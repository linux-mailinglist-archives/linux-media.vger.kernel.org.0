Return-Path: <linux-media+bounces-37616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B5FB03FC8
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AAF57ACBD7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724BC24EA90;
	Mon, 14 Jul 2025 13:26:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9E42065;
	Mon, 14 Jul 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499568; cv=none; b=UHJuIWiv+KStkZYVPnQBMz5fm7MRxKeyDma7hxMZOe2pLrcqXfi5qjmPr/HAFHT0lC7uZz2A8CHWrwmdk7iDrIwpTaI6izZB8gD/THgm4gDgNBXysmXoLMCmkIixVRrlRR01RhLAEo28q1OUMKXDjcspt6j5fbdXxTsRBohUT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499568; c=relaxed/simple;
	bh=Bp0ivLgBZtp4hrFPANE5xtiIY5wC9HeHAM404poOIEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FVycTPu9GKciL+h6dmFsozNQhRyqrH50Ix5u0Ofnd5rKB9/bxmgDO7VJUoLBsvdKc1PHapIQLvZdtognzS2QZq6Rm9WBkhgbH5OPnC0Aw+x3GZhRQvgwZhGCGIQ6OFxjQOsA0jMKWMpFniLT5rUJx2jruOVT6Ew0K8mI87DHC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [211.71.28.34])
	by APP-03 (Coremail) with SMTP id rQCowAAHmHlHBXVoRzv2Aw--.4170S2;
	Mon, 14 Jul 2025 21:25:41 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	rafael.j.wysocki@intel.com,
	dongcheng.yan@intel.com,
	gregkh@linuxfoundation.org,
	make24@iscas.ac.cn,
	peterz@infradead.org,
	wentong.wu@intel.com,
	sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: pci: intel: Balance device refcount when destroying devices
Date: Mon, 14 Jul 2025 21:25:26 +0800
Message-Id: <20250714132526.3216569-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHmHlHBXVoRzv2Aw--.4170S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1xZF1xZFWDuF4fXFWDurg_yoW8GF48pr
	Wj9FyrArWrXr48W3yfZ3WUXFya9ws5uay3Gr4Sk3ZY9a1fXasayFWjva4qqrn2yF97Ar15
	Z3W7tFW8AFWDAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwV
	W5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3uc_UUUUU
	=
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Using ipu_bridge_get_ivsc_csi_dev() to locate the device could cause
an imbalance in the device's reference count.
ipu_bridge_get_ivsc_csi_dev() calls device_find_child_by_name() to
implement the localization, and device_find_child_by_name() calls an
implicit get_device() to increment the device's reference count before
returning the pointer. Throughout the entire implementation process,
no mechanism releases resources properly. This leads to a memory leak
because the reference count of the device is never decremented.

As the comment of device_find_child_by_name() says, 'NOTE: you will
need to drop the reference with put_device() after use'.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: c66821f381ae ("media: pci: intel: Add IVSC support for IPU bridge driver")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/media/pci/intel/ipu-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 83e682e1a4b7..f8b4672accab 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -192,6 +192,7 @@ static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
 
 		sensor->csi_dev = csi_dev;
 		sensor->ivsc_adev = adev;
+		put_device(csi_dev);
 	}
 
 	return 0;
-- 
2.25.1


