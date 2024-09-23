Return-Path: <linux-media+bounces-18443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97897E512
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 05:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D7928185E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 03:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482863EA64;
	Mon, 23 Sep 2024 03:41:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FB329402;
	Mon, 23 Sep 2024 03:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062886; cv=none; b=k31Ie39hR3FhifmvxbjmRY32HaGnJ7JaD/SvOw2DYtXIwFOMOiGfPYFGftrptqMOZfN+ytiG+IPpbm039P7fit6cxxl7aHIfvBC5czFUM/Lt5+a+z7LasPPUuKM+o5EgKhHummQS1jfByL9dqIolwS+Gx1UsjGu4T0XVYWqgBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062886; c=relaxed/simple;
	bh=MNBkAjus2FhruJcntoM7KbN0mDFzZGh1+GKHjC30GX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGLKx5NyapgK9y5tMdzrJP/BRUweZKMcbVVV4vOKGhytFEQXiqDPCA3A2wDM6dqjlkKdK9MWM2N+PT77/vW+p/jbIzQRizxf1ZBwED2WVOO5j9KACxqVW1mtwN52uJoCUFO27eC7MVziZnvRfShqZua/QkYqBcJjiQGUdC+vyqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XBpf33HWKz1T7my;
	Mon, 23 Sep 2024 11:39:55 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A23A140F82;
	Mon, 23 Sep 2024 11:41:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 11:41:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<hans.verkuil@cisco.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 1/3] media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Mon, 23 Sep 2024 11:51:13 +0800
Message-ID: <20240923035115.3008900-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923035115.3008900-1-ruanjinjie@huawei.com>
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

It is not valid to call pm_runtime_set_suspended() and
pm_runtime_set_active() for devices with runtime PM enabled because it
returns -EAGAIN if it is enabled already and working. So, adjust the
order to fix it.

Fixes: 5f9a089b6de3 ("dw9768: Enable low-power probe on ACPI")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/media/i2c/dw9768.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..61db1e8d2727 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -471,7 +471,6 @@ static int dw9768_probe(struct i2c_client *client)
 	 * to be powered on in an ACPI system. Similarly for power off in
 	 * remove.
 	 */
-	pm_runtime_enable(dev);
 	full_power = (is_acpi_node(dev_fwnode(dev)) &&
 		      acpi_dev_state_d0(dev)) ||
 		     (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev));
@@ -484,6 +483,7 @@ static int dw9768_probe(struct i2c_client *client)
 		pm_runtime_set_active(dev);
 	}
 
+	pm_runtime_enable(dev);
 	ret = v4l2_async_register_subdev(&dw9768->sd);
 	if (ret < 0) {
 		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
@@ -495,12 +495,12 @@ static int dw9768_probe(struct i2c_client *client)
 	return 0;
 
 err_power_off:
+	pm_runtime_disable(dev);
 	if (full_power) {
 		dw9768_runtime_suspend(dev);
 		pm_runtime_set_suspended(dev);
 	}
 err_clean_entity:
-	pm_runtime_disable(dev);
 	media_entity_cleanup(&dw9768->sd.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(&dw9768->ctrls);
@@ -517,12 +517,12 @@ static void dw9768_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(&dw9768->sd);
 	v4l2_ctrl_handler_free(&dw9768->ctrls);
 	media_entity_cleanup(&dw9768->sd.entity);
+	pm_runtime_disable(dev);
 	if ((is_acpi_node(dev_fwnode(dev)) && acpi_dev_state_d0(dev)) ||
 	    (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev))) {
 		dw9768_runtime_suspend(dev);
 		pm_runtime_set_suspended(dev);
 	}
-	pm_runtime_disable(dev);
 }
 
 static const struct of_device_id dw9768_of_table[] = {
-- 
2.34.1


