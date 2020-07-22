Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDD822985B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 14:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgGVMlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 08:41:07 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:58368 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgGVMlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 08:41:06 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MCW5va156519;
        Wed, 22 Jul 2020 12:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=v0VBTLpU3Gr1xDp+feq/2Qog62oTxx4NqFlRzE/7/Js=;
 b=fEf52UGnoNgJBhZsL8StwqDRJDBtSmSGB03wgynx1E3XpcFTQ4+VD4p25sh4hr6++GM7
 B+9hFErDVmlqoRR1bLeXX+az4t7ZZzSxiyAozu3UoUp3jvaRMHb5G0w36Xun5WsZKIHQ
 JP+CAhxyh5xuuhXlD9+4QRt1TzpgvxSRTWRfCLe+D68KtCOAooQDib2Mx5t7abpQXrnu
 hMxpTWdZHuAyw4j6H/eZBCZ6Y246TmHIeG22gMheZYPXZ3mMCiQPx/w+SSTDqlNggvz5
 5Afyg2uQroWbxiTGrrgfPfq4c7hljRxlJvCaH9ep3CQMwUsYajX6tAXomRI2JBDFkWxY Lg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 32bs1mjyc9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 12:40:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MCYAHo113173;
        Wed, 22 Jul 2020 12:38:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 32eej5ujgr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jul 2020 12:38:56 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06MCctB3029969;
        Wed, 22 Jul 2020 12:38:56 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 Jul 2020 12:38:55 +0000
Date:   Wed, 22 Jul 2020 15:38:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: allegro: fix an error pointer vs NULL check
Message-ID: <20200722123848.GA220681@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220094
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The allegro_mbox_init() function returns error pointers, it never
returns NULL.

Fixes: 94dc76560261 ("media: allegro: rework mbox handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 61beae1fca36..9f718f43282b 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2952,7 +2952,7 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
 					      info->mailbox_size);
 	dev->mbox_status = allegro_mbox_init(dev, info->mailbox_status,
 					     info->mailbox_size);
-	if (!dev->mbox_command || !dev->mbox_status) {
+	if (IS_ERR(dev->mbox_command) || IS_ERR(dev->mbox_status)) {
 		v4l2_err(&dev->v4l2_dev,
 			 "failed to initialize mailboxes\n");
 		return -EIO;
-- 
2.27.0

