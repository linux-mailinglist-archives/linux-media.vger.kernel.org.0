Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383502038D3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 16:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgFVOLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 10:11:02 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43240 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgFVOLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 10:11:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ME7hqD023215;
        Mon, 22 Jun 2020 14:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=0EBM5le0xqirs7lj5LfEZx5P/2vKUTcJe4V2QpW/Wss=;
 b=UWXptkMygc9dUKNnct8y38uRou4DJZUscE9eIfHGOBaAggxbs9hVhnfX1N0pxl6+Y6mN
 EHLN7c1Ffr/XAfA4edMZGRJpqfWY5ohGj4P2F4P1UAYQk6KoAeGsS/4MJMM+DhUXbwz6
 VWzqBzy+G03l2vs57tWX1D6VEaHAWQxOl5976utEghYn2jH80a/dRf9qQBWXSEF4NNNY
 8qSdxm1h24ZuUHnCW7P76ORd1yZ4F/kmiR/nEUsTbaVi6FUyoH8P6gB/AKGRMxy+a8Bp
 pxDqc9ro7Xcar6IOov1jMg3Vm4ljASqjGRYKdpLDWnl7q8RLXXSADKQBsQlPl9q+3q9J rA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 31sebbffk0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Jun 2020 14:10:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ME85lf109939;
        Mon, 22 Jun 2020 14:10:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 31sv7q6neb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Jun 2020 14:10:50 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05MEAhkv028405;
        Mon, 22 Jun 2020 14:10:43 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 22 Jun 2020 14:10:43 +0000
Date:   Mon, 22 Jun 2020 17:10:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvc: Fix list_for_each() checking
Message-ID: <20200622141036.GA13774@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9659 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006220107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9659 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 cotscore=-2147483648 mlxscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220107
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the UVC_QUIRK_IGNORE_SELECTOR_UNIT flag is set, then there is a
problem that the code uses "iterm" after the end of the
list_for_each_entry() loop.  It should only be used when the
UVC_ENTITY_IS_ITERM() condition is true and we break from the loop.

Fixes: d5e90b7a6cd1 ("[media] uvcvideo: Move to video_ioctl2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this one extra carefully because it's from static analysis
and I'm not 100% sure it's correct.

 drivers/media/usb/uvc/uvc_v4l2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..945862afa829 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -827,28 +827,32 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
 	u32 index = input->index;
-	int pin = 0;
+	bool found = false;
+	int pin;
 
 	if (selector == NULL ||
 	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
 		if (index != 0)
 			return -EINVAL;
 		list_for_each_entry(iterm, &chain->entities, chain) {
-			if (UVC_ENTITY_IS_ITERM(iterm))
+			if (UVC_ENTITY_IS_ITERM(iterm)) {
+				found = true;
 				break;
+			}
 		}
-		pin = iterm->id;
 	} else if (index < selector->bNrInPins) {
 		pin = selector->baSourceID[index];
 		list_for_each_entry(iterm, &chain->entities, chain) {
 			if (!UVC_ENTITY_IS_ITERM(iterm))
 				continue;
-			if (iterm->id == pin)
+			if (iterm->id == pin) {
+				found = true;
 				break;
+			}
 		}
 	}
 
-	if (iterm == NULL || iterm->id != pin)
+	if (!found)
 		return -EINVAL;
 
 	memset(input, 0, sizeof(*input));
-- 
2.27.0

