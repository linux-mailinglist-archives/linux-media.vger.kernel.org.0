Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6561BB514
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 06:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgD1EVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 00:21:51 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3113 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgD1EVu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 00:21:50 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea7af1c0001>; Mon, 27 Apr 2020 21:20:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 27 Apr 2020 21:21:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 27 Apr 2020 21:21:50 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 04:21:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Apr 2020 04:21:49 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea7af5d0000>; Mon, 27 Apr 2020 21:21:49 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <digetx@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 5/5] media: tegra-video: Remove module macros for vi and csi driver
Date:   Mon, 27 Apr 2020 21:20:50 -0700
Message-ID: <1588047650-29402-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588047644; bh=OlA/gRwqGqlJue2NSJ8mEveixy7HVEtrnvI4iKt/JNQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=WETZNR5Y89Pb68yT/jWCyKA0YPy1/48z16hIp3DOSSnw+tfzpeiHmgY3cnpoSFtkU
         NShxkJuIYNTeA7m75gwYLrA5NmewsrWv49vD3Rc0vVRARiFbkT3wssOENmOrmjRM/+
         ozDEL31510Bg1aoTo4p4zEpMI6nIAb76QMBaRfTM0oelUTewXFfEd0aCDLFUENBPtb
         nncdf/3dseIVaq2bV98tMX9+e00QWX9Xu8WyD8LsgUvhZwxd1G6RpjdbXjkkpGPY12
         bgaXTZP+lBeqfth6qjUjExAcdlvK/KvlYaWYnViCLObjgDxB7WpeyMMj5q9IfNwlMX
         B7GuYPz6VScMQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tegra-video driver is a single module and module license macros
are in tegra-video driver and are not required in vi and csi driver.

So, this patch removes them.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 5 -----
 drivers/staging/media/tegra-video/vi.c  | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index eda6a42..2536ff5 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -7,7 +7,6 @@
 #include <linux/clk/tegra.h>
 #include <linux/device.h>
 #include <linux/host1x.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -535,7 +534,3 @@ struct platform_driver tegra_csi_driver = {
 	.probe			= tegra_csi_probe,
 	.remove			= tegra_csi_remove,
 };
-
-MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index bdf2560..397b6bc 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -9,7 +9,6 @@
 #include <linux/host1x.h>
 #include <linux/lcm.h>
 #include <linux/list.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -1081,7 +1080,3 @@ struct platform_driver tegra_vi_driver = {
 	.probe = tegra_vi_probe,
 	.remove = tegra_vi_remove,
 };
-
-MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
-MODULE_LICENSE("GPL v2");
-- 
2.7.4

