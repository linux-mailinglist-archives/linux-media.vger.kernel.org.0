Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43B8317923B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 15:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgCDOX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 09:23:26 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:36736 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgCDOX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 09:23:26 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 024EN3N6030605;
        Wed, 4 Mar 2020 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=COfM9ENnfhMBCofGtUU1b+Z8aGXtWkYi0F98ZDSGe6E=;
 b=iLJ2NbUCK3GNOIu6rj0ITniWBfq0iGOR6bPzFYyF3l7siftFdfBC0EiiyF1f3t499Asd
 YNp9ihh9kNMSaPB6sV20hRs//yJ80PbT3tx3s7x5+5QOmsqJR8jcepYOIzmriFoFN6fq
 YAQNyaJNmw61IuHTozAQpC1urmpQqBTLiuLapv2YZu2bEIPukEYEcpAp9Wj/BNlSZ5Re
 o9mtoPOaC3ISE53V2z6Ay9GAhk2WMrv95FxfJErq920KWXjbC+XWx8NIqdQOxmcn/teh
 VLCfiXDAho5rVeQUHyN9I3NuaSb+3oBWjQrWuXKtiIE+Gsyw4/6LQ7zaAwZNBso7I57a Vg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2yghn3abk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Mar 2020 14:23:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 024EEpmj049051;
        Wed, 4 Mar 2020 14:23:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2yg1epxf1s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Mar 2020 14:23:22 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 024ENLW9003608;
        Wed, 4 Mar 2020 14:23:21 GMT
Received: from kili.mountain (/41.210.146.162)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Mar 2020 06:23:20 -0800
Date:   Wed, 4 Mar 2020 17:23:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ramesh Shanmugasundaram <rashanmu@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: max2175: fix max2175_set_csm_mode() error code
Message-ID: <20200304142312.uxk7t7w3jbdhk5wy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=960 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003040109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003040109
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is supposed to return negative error codes but the type is bool so
it returns true instead.

Fixes: b47b79d8a231 ("[media] media: i2c: max2175: Add MAX2175 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/max2175.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index 506a30e69ced..ab4bc6c395b2 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -503,7 +503,7 @@ static void max2175_set_bbfilter(struct max2175 *ctx)
 	}
 }
 
-static bool max2175_set_csm_mode(struct max2175 *ctx,
+static int max2175_set_csm_mode(struct max2175 *ctx,
 			  enum max2175_csm_mode new_mode)
 {
 	int ret = max2175_poll_csm_ready(ctx);
-- 
2.11.0

