Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6BC1A0A2C
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 11:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgDGJcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 05:32:50 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52736 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgDGJcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 05:32:50 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RjTk036982;
        Tue, 7 Apr 2020 09:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=u5binPzmwq1wia3hP0nf4A7It1ZkmNDlq4FQDS+ffpA=;
 b=Bvu03OM0O8SF1Sc9aYj0P+znrjsUEBZs/vCrf2E21bWpUsXLSflu/gYE7mrn3q64nYPX
 KRw3a5ss62kiGRcW3qFpz4l1M8IFcODhDIALAEFGMlcqqLIe2uJ8pfsxA2oiutyt1ybc
 v39mP2h+vJOeHAtX5hPU6ogop1UCp/3fLMmXuGRIG9W0kTjJrLnOM2Ya1dVrEzHt8zDP
 DUVvWRBKyT3uEj5OwIJ10rjRJHt1CdkfczfvqnXwsAUcuWky9FI/BOH2wKQQXZYmdhJK
 4w/766+DoZH/USTXeelkk9QRP6VSVFLQFCYDEk+AAMUCwr2H4YNGivVamuX5Tsd5JGCe Og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 306j6mbrd1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:32:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379VRR4116510;
        Tue, 7 Apr 2020 09:32:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 30741dmtdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:32:46 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0379WjnD029040;
        Tue, 7 Apr 2020 09:32:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 02:32:45 -0700
Date:   Tue, 7 Apr 2020 12:32:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna3@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: vicodec: Fix error codes in probe function
Message-ID: <20200407093237.GN68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If these functions fail then we return success, but we should instead
preserve negative error code and return that.

Fixes: fde649b418d1 ("media: vicodec: Register another node for stateless decoder")
Fixes: c022a4a95722 ("media: vicodec: add struct for encoder/decoder instance")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/vicodec/vicodec-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 30ced1c21387..e879290727ef 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -2114,16 +2114,19 @@ static int vicodec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 
-	if (register_instance(dev, &dev->stateful_enc,
-			      "stateful-encoder", true))
+	ret = register_instance(dev, &dev->stateful_enc, "stateful-encoder",
+				true);
+	if (ret)
 		goto unreg_dev;
 
-	if (register_instance(dev, &dev->stateful_dec,
-			      "stateful-decoder", false))
+	ret = register_instance(dev, &dev->stateful_dec, "stateful-decoder",
+				false);
+	if (ret)
 		goto unreg_sf_enc;
 
-	if (register_instance(dev, &dev->stateless_dec,
-			      "stateless-decoder", false))
+	ret = register_instance(dev, &dev->stateless_dec, "stateless-decoder",
+				false);
+	if (ret)
 		goto unreg_sf_dec;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-- 
2.25.1

