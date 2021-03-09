Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32F633222E
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 10:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCIJie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 04:38:34 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:50979 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230047AbhCIJiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 04:38:01 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0UR53sNl_1615282671;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UR53sNl_1615282671)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 09 Mar 2021 17:37:57 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     jejb@linux.ibm.com
Cc:     martin.petersen@oracle.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] scsi: csiostor: Assign boolean values to a bool variable
Date:   Tue,  9 Mar 2021 17:37:48 +0800
Message-Id: <1615282668-36935-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/scsi/csiostor/csio_scsi.c:150:9-10: WARNING: return of 0/1 in
function 'csio_scsi_itnexus_loss_error' with return type bool.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/scsi/csiostor/csio_scsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/csiostor/csio_scsi.c b/drivers/scsi/csiostor/csio_scsi.c
index 55e74da..56b9ad0 100644
--- a/drivers/scsi/csiostor/csio_scsi.c
+++ b/drivers/scsi/csiostor/csio_scsi.c
@@ -147,9 +147,9 @@ static int csio_do_abrt_cls(struct csio_hw *,
 	case FW_ERR_RDEV_LOST:
 	case FW_ERR_RDEV_LOGO:
 	case FW_ERR_RDEV_IMPL_LOGO:
-		return 1;
+		return true;
 	}
-	return 0;
+	return false;
 }
 
 /*
-- 
1.8.3.1

