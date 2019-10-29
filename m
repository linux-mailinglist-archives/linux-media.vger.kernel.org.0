Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A23E8F30
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 19:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfJ2SYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 14:24:12 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60752 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfJ2SYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 14:24:12 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TI5UUe155040;
        Tue, 29 Oct 2019 18:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=CBucKVszmtDkvTv5jp3bH4K3Bhl/s5iJ0btzBQYUPTw=;
 b=Ba68fn1ARkOxtVaBzMD7fr/JplX/xSOKPF/C8n19nSMHdoAJBri7TREZRrhMlXdyjMSj
 ibEuYrI9UHQ+WevL07YZNrk7ypp1QYw9AhWP6pPUNxaaOoEvmHKVuNhwG291qG31SO91
 wViQ2OqL5UEZi533lG9U4TXW/kuj2/yYhYZObZYy0B7V+TyGwldlGYTVOcC51peRSpJ5
 qJMQ4u0Num+8VmIXSU3oKsbkl1cYQZc1cXoS1CZj9kYD1D4fQV4OJ/UVLcJU8dVioWjk
 Ha2pk3q2pjOegvuPhbO0+LDQ+Lbr9eg8t/NsdM03dvIB6KNog49EtKdLFlANjoHBUU71 Fw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2vve3qb2wc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 18:24:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TI8RBT052331;
        Tue, 29 Oct 2019 18:24:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2vxj8gqc81-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Oct 2019 18:24:07 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9TIO64U007303;
        Tue, 29 Oct 2019 18:24:06 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Oct 2019 11:24:06 -0700
Date:   Tue, 29 Oct 2019 21:24:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: smiapp: unlock on error in smiapp_start_streaming()
Message-ID: <20191029182401.GB17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290160
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290160
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We added two new error paths to smiapp_start_streaming(), but we can't
return directly without dropping the "sensor->mutex" lock.

Fixes: f8c4352c1bef ("media: smiapp: Move binning configuration to streaming start")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 77dfce7c3be9..84f9771b5fed 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1362,13 +1362,13 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U8_BINNING_TYPE, binning_type);
 		if (rval < 0)
-			return rval;
+			goto out;
 
 		binning_mode = 1;
 	}
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_BINNING_MODE, binning_mode);
 	if (rval < 0)
-		return rval;
+		goto out;
 
 	/* Set up PLL */
 	rval = smiapp_pll_configure(sensor);
-- 
2.20.1

