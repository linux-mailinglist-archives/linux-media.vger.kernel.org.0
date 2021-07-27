Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ADF3D7203
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 11:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236079AbhG0Jah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 05:30:37 -0400
Received: from mx20.baidu.com ([111.202.115.85]:41152 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235970AbhG0Jac (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 05:30:32 -0400
Received: from BC-Mail-Ex14.internal.baidu.com (unknown [172.31.51.54])
        by Forcepoint Email with ESMTPS id D4322D6B4D5360FC721C;
        Tue, 27 Jul 2021 17:30:25 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex14.internal.baidu.com (172.31.51.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 27 Jul 2021 17:30:25 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 27 Jul 2021 17:30:25 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH V2] soc/tegra: bpmp: Remove unused including <linux/version.h>
Date:   Tue, 27 Jul 2021 17:28:54 +0800
Message-ID: <20210727092854.1006-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727092854.1006-1-caihuoqing@baidu.com>
References: <20210727092854.1006-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex23.internal.baidu.com (172.31.51.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove including <linux/version.h> that don't need it.

V1->V2: Split the patch in two

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/soc/tegra/powergate-bpmp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/tegra/powergate-bpmp.c b/drivers/soc/tegra/powergate-bpmp.c
index 06c792bafca5..8eaf50d0b6af 100644
--- a/drivers/soc/tegra/powergate-bpmp.c
+++ b/drivers/soc/tegra/powergate-bpmp.c
@@ -7,7 +7,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
-#include <linux/version.h>
 
 #include <soc/tegra/bpmp.h>
 #include <soc/tegra/bpmp-abi.h>
-- 
2.25.1

