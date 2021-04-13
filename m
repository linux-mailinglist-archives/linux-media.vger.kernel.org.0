Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4F735DC89
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245752AbhDMKh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:37:56 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39126 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245730AbhDMKh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:37:56 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DAUYQ1191089;
        Tue, 13 Apr 2021 10:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=a49XKfFDi2IaRm8HfCUDmWOG4oiQUmUQiFQeVHD9fXU=;
 b=lK+8gYUHJxCxr3Wt4utJpoZxe4Em4dSi6d+g5OWQ8NJGikUmnJHiLLKsPM9h7UHEejcj
 9yidFKbOetiEm2L4jmQFXpn2L/JPdSafiMA6RcK0jMmMUJQqlhQHlgndmocBIAxPO/bd
 b8/W/RTZ1vZcolulo3LGYPgTU8KEYamMSDAvjxllbPHu7PIRoFGdfynRLNUFtlKtd6Br
 r71Sfyzqzwe4fCbzxi9Rse9zgaJmOc20ZHuBsi4S/I6AMlGiUop0W/LYK0Knsauk+m2o
 yrp5I8xd3N33WUsh2YSUInCGcKgpUXT2X7Yk7MMUVmN6S+90PawHPsWN949iBiztYepH ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 37u3ymejg8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Apr 2021 10:37:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DATee7002897;
        Tue, 13 Apr 2021 10:37:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 37unwykww2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Apr 2021 10:37:27 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13DAbKw7026411;
        Tue, 13 Apr 2021 10:37:20 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 13 Apr 2021 03:37:19 -0700
Date:   Tue, 13 Apr 2021 13:37:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: omap3isp: drop graph mutex on error path
Message-ID: <YHV0WJWNQv5I6yqO@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130072
X-Proofpoint-GUID: rzwGE9aQ28t3hMVgb3rAaUnRnAxJbl89
X-Proofpoint-ORIG-GUID: rzwGE9aQ28t3hMVgb3rAaUnRnAxJbl89
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9952 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130072
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the "&isp->media_dev.graph_mutex" if media_entity_enum_init() fails.

Fixes: ba689d933361 ("media: omap3isp: Acquire graph mutex for graph traversal")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/omap3isp/isp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 53025c8c7531..20f59c59ff8a 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2037,8 +2037,10 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
 	mutex_lock(&isp->media_dev.graph_mutex);
 
 	ret = media_entity_enum_init(&isp->crashed, &isp->media_dev);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&isp->media_dev.graph_mutex);
 		return ret;
+	}
 
 	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
 		if (sd->notifier != &isp->notifier)
-- 
2.30.2

