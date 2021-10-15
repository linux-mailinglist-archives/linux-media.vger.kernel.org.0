Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E2F42EE7A
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 12:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbhJOKM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 06:12:28 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:38828 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237769AbhJOKMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 06:12:22 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0Us8X9Kw_1634292611;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Us8X9Kw_1634292611)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 15 Oct 2021 18:10:14 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     yong.zhi@intel.com
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        djrscally@gmail.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: ipu3-cio2: Fix missing error code in cio2_bridge_connect_sensor()
Date:   Fri, 15 Oct 2021 18:09:15 +0800
Message-Id: <1634292555-66006-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'ret'.

Eliminate the follow smatch warning:

drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor()
warn: missing error code 'ret'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 67c467d3..9e364ba 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -238,8 +238,10 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 			goto err_put_adev;
 
 		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
-		if (ACPI_FAILURE(status))
+		if (ACPI_FAILURE(status)) {
+			ret = -EINVAL;
 			goto err_put_adev;
+		}
 
 		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
 			dev_err(&adev->dev,
-- 
1.8.3.1

