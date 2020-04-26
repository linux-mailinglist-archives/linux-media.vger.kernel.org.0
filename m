Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0097C1B8E87
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 11:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgDZJoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 05:44:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2912 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726117AbgDZJoA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 05:44:00 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 9893FAB34ACC76005222;
        Sun, 26 Apr 2020 17:43:58 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 17:43:49 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] media: mxl5xx: remove unused including <linux/version.h>
Date:   Sun, 26 Apr 2020 17:43:16 +0800
Message-ID: <20200426094316.24178-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following versioncheck warning:

drivers/media/dvb-frontends/mxl5xx.c:30:1: unused including
<linux/version.h>

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/media/dvb-frontends/mxl5xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
index 290b9eab099f..621d2cbb2bcd 100644
--- a/drivers/media/dvb-frontends/mxl5xx.c
+++ b/drivers/media/dvb-frontends/mxl5xx.c
@@ -27,7 +27,6 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
-#include <linux/version.h>
 #include <linux/mutex.h>
 #include <linux/vmalloc.h>
 #include <asm/div64.h>
-- 
2.21.1

