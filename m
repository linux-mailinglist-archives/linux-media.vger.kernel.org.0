Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC773FED1C
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245278AbhIBLrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:47:51 -0400
Received: from mx21.baidu.com ([220.181.3.85]:54712 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234165AbhIBLru (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 07:47:50 -0400
Received: from BJHW-Mail-Ex01.internal.baidu.com (unknown [10.127.64.11])
        by Forcepoint Email with ESMTPS id 6C2EFBB550F61E7F595A;
        Thu,  2 Sep 2021 19:46:47 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 19:46:47 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 2 Sep 2021 19:46:46 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <mikhail.ulyanov@cogentembedded.com>, <mchehab@kernel.org>,
        <kieran.bingham+renesas@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] MAINTAINERS: Add  linux-renesas-soc mailing list to renesas JPU
Date:   Thu, 2 Sep 2021 19:46:41 +0800
Message-ID: <20210902114641.32370-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'linux-renesas-soc' is the mailing list for renesas SOC driver,
so add it to renesas JPU driver info.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9de648f49591..3581939fd679 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10042,6 +10042,7 @@ F:	include/linux/jbd2.h
 JPU V4L2 MEM2MEM DRIVER FOR RENESAS
 M:	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
 L:	linux-media@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/media/platform/rcar_jpu.c
 
-- 
2.25.1

