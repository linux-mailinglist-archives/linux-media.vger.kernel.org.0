Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0B8BA9E7
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 21:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730926AbfIVTU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Sep 2019 15:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:55112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407951AbfIVSyd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 14:54:33 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE71021D7A;
        Sun, 22 Sep 2019 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569178472;
        bh=9WlLpdEMTjmBcZOqESYZTnBii0ZagJO0QmItdcIX0is=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YAYro0u2O+Telx8EIdBzyHbC972/SYlTayOYj0LnFbxY8xobaJhfR4gN7F78tuZEk
         vCEMBA5igcrf7g7Fn2sWRk4eZRv7pvdDMEAjRisda9qTmidjLsCzok6ZmVFEZNWuAE
         NTxdcRm3H4t4H27OpmADaNk0xtgjWn/sHfgMziAE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wen Yang <wen.yang99@zte.com.cn>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 011/128] media: exynos4-is: fix leaked of_node references
Date:   Sun, 22 Sep 2019 14:52:21 -0400
Message-Id: <20190922185418.2158-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922185418.2158-1-sashal@kernel.org>
References: <20190922185418.2158-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit da79bf41a4d170ca93cc8f3881a70d734a071c37 ]

The call to of_get_child_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/exynos4-is/fimc-is.c:813:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 807, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/fimc-is.c:870:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 807, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/fimc-is.c:885:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 807, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/media-dev.c:545:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 541, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/media-dev.c:528:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 499, but without a corresponding object release within this function.
drivers/media/platform/exynos4-is/media-dev.c:534:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 499, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/exynos4-is/fimc-is.c   | 1 +
 drivers/media/platform/exynos4-is/media-dev.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 5ddb2321e9e48..0fe9be93fabe2 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -819,6 +819,7 @@ static int fimc_is_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	is->pmu_regs = of_iomap(node, 0);
+	of_node_put(node);
 	if (!is->pmu_regs)
 		return -ENOMEM;
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index deb499f76412a..b5993532831da 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -498,6 +498,7 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 			continue;
 
 		ret = fimc_md_parse_port_node(fmd, port, index);
+		of_node_put(port);
 		if (ret < 0) {
 			of_node_put(node);
 			goto rpm_put;
@@ -531,6 +532,7 @@ static int __of_get_csis_id(struct device_node *np)
 	if (!np)
 		return -EINVAL;
 	of_property_read_u32(np, "reg", &reg);
+	of_node_put(np);
 	return reg - FIMC_INPUT_MIPI_CSI2_0;
 }
 
-- 
2.20.1

