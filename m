Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B66D380BAE
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 16:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhENOWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 10:22:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39058 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhENOV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 10:21:59 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEKlNS076972;
        Fri, 14 May 2021 14:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=hKbVDKRnMKch/6rCPFa+HL1VQf6RGS46pwKxQDUDSF4=;
 b=ExHX4sGS9Eqcga+ZUOm8nKtlw20dnN5lwfx61ob2ffif6W20xCQBClfls9uoButD7JSC
 jCDA5nuwvdMz6gpWsWrxK2Kq1txbmXpG3ZLOQSq0De3b++eODafdqWD8nnElYGzGWAKo
 qbG1f320i2qV/7E9bNA/Bj1ToX8hZcuFWYQshlnW2zPOKsl3+/904hc0cqBmJzU6g3Oa
 dVpJIBR4Lneo9X89qw/izxZ7zr8OiCJ8GkveXFLLoqZOmx9QtocJTuwUvdXQ5+WcjDDl
 lSa5x11+7EjaDHYbDjNjyFBOGL/nHQ3OqwL6l3oJSFhEj6lolkkWqg3tOgTBXZVaCJ2c Mg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 38gpnxvf8p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:20:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEKBKj034842;
        Fri, 14 May 2021 14:20:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38gpph8xu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:20:46 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14EEKkMG035665;
        Fri, 14 May 2021 14:20:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 38gpph8xtv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 May 2021 14:20:46 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14EEKjEP028916;
        Fri, 14 May 2021 14:20:45 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 14 May 2021 07:20:44 -0700
Date:   Fri, 14 May 2021 17:20:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: au0828: fix a NULL vs IS_ERR() check
Message-ID: <YJ6HNj0g3UlJ6js0@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: aEg5wX7qMMJmfYT80w1-BDCRPvLxdXWD
X-Proofpoint-ORIG-GUID: aEg5wX7qMMJmfYT80w1-BDCRPvLxdXWD
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105140116
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media_device_usb_allocate() function returns error pointers when
it's enabled and something goes wrong.  It can return NULL as well, but
only if CONFIG_MEDIA_CONTROLLER is disabled so that doesn't apply here.

Fixes: 812658d88d26 ("media: change au0828 to use Media Device Allocator API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/usb/au0828/au0828-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index a8a72d5fbd12..caefac07af92 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -199,8 +199,8 @@ static int au0828_media_device_init(struct au0828_dev *dev,
 	struct media_device *mdev;
 
 	mdev = media_device_usb_allocate(udev, KBUILD_MODNAME, THIS_MODULE);
-	if (!mdev)
-		return -ENOMEM;
+	if (IS_ERR(mdev))
+		return PTR_ERR(mdev);
 
 	dev->media_dev = mdev;
 #endif
-- 
2.30.2

