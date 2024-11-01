Return-Path: <linux-media+bounces-20680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7C9B8E0C
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82B11F2281D
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7E616190B;
	Fri,  1 Nov 2024 09:41:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CF153BF8;
	Fri,  1 Nov 2024 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454097; cv=none; b=RwqizV05oWXtgLWwucOpcPI+cbObTEvBDIzlFzqVJmKsIX2uS9VJrxzFGV+hFmZ4cWZMohOwG/psd9D0oT90vRaX6kUlAhCH1DpvwOcKHX4GOo5Iisjinf//yapMFphYyNTBc4lflaL2QQ9i0EQrzzuIe5bxKB5tkU7gBTxMuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454097; c=relaxed/simple;
	bh=B4sqT1zWc7Cadh52ZfLpGKGgABwSPJW8mkWiaiyf9/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1HamFYChulyBn/Ys6QbwOyo8Ns/tumSLy6CUbVLcoeaJ76+zulp0lhZb38TVYu47vtLcJ/IBlyVP549sTByQWQCwc9Bsyv9erDywVdZkAtHNCJ85uRc0J/pBamQDIHxLYTU68+VzINVH0gjljNE/b+DKR5O67U1a3mwRgKDvXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xfwn45RRlzlXGs;
	Fri,  1 Nov 2024 17:39:36 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id E510618005F;
	Fri,  1 Nov 2024 17:41:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 1 Nov
 2024 17:41:31 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<shijie.qin@nxp.com>, <hverkuil-cisco@xs4all.nl>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>
CC: <chenridong@huawei.com>, <ruanjinjie@huawei.com>
Subject: [PATCH v2 1/3] media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Fri, 1 Nov 2024 17:40:48 +0800
Message-ID: <20241101094050.2421038-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101094050.2421038-1-ruanjinjie@huawei.com>
References: <20241101094050.2421038-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)

It is not valid to call pm_runtime_set_suspended() and
pm_runtime_set_active() for devices with runtime PM enabled because it
returns -EAGAIN if it is enabled already and working. So, adjust the
order to fix it.

Cc: stable@vger.kernel.org
Fixes: 5f9a089b6de3 ("dw9768: Enable low-power probe on ACPI")
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- !pm_runtime_enabled() check -> !IS_ENABLED(CONFIG_PM).
- Add suggested-by.
- Cc stable.
---
 drivers/media/i2c/dw9768.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..87a7c3ceeb11 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -471,10 +471,9 @@ static int dw9768_probe(struct i2c_client *client)
 	 * to be powered on in an ACPI system. Similarly for power off in
 	 * remove.
 	 */
-	pm_runtime_enable(dev);
 	full_power = (is_acpi_node(dev_fwnode(dev)) &&
 		      acpi_dev_state_d0(dev)) ||
-		     (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev));
+		     (is_of_node(dev_fwnode(dev)) && !IS_ENABLED(CONFIG_PM));
 	if (full_power) {
 		ret = dw9768_runtime_resume(dev);
 		if (ret < 0) {
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
-	    (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev))) {
+	    (is_of_node(dev_fwnode(dev)) && !IS_ENABLED(CONFIG_PM))) {
 		dw9768_runtime_suspend(dev);
 		pm_runtime_set_suspended(dev);
 	}
-	pm_runtime_disable(dev);
 }
 
 static const struct of_device_id dw9768_of_table[] = {
-- 
2.34.1


