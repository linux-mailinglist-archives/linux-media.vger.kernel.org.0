Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBBE342014
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 15:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhCSOrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 10:47:42 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:51002 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhCSOre (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 10:47:34 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEYUum095537;
        Fri, 19 Mar 2021 14:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6Uv736h/yXzHX0elzBNJ//PmccI1GyWYpJopBIHG8Ms=;
 b=vm5RHXyfU4+vM4IsyfSISMkk4gQPxruN8cdHCdkCpGVYycHORC5gEAQjxK4pguSm+ODD
 euRIH3FzS/DmCTl7WojYk1yB1qe3alEGyxxXMYHOKaUHwH91W4093qi5dPUNIdahXttf
 FGTAasZfyaBgl+mPvEtL0ZzDbuNcYgd52CXFyLEyEfufOQLfrAizOgv8lcoFSNdcDZBd
 lLK858HJClc1/Q1K6F+n/W0aDW/UNjoXo3VL0ry6HIZml1xEXi2K0jGORoAe4GZ8pplt
 fXfksD2uBbUceBaw5+v4iFH+j300L/EXQHPaHis3eSQG8rYXZmkVbD6gW0uhKAtLuUKK 1w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 37a4em05yx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 14:47:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEa7b9137104;
        Fri, 19 Mar 2021 14:47:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 37cf2vj3hy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 14:47:18 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12JElGn5008889;
        Fri, 19 Mar 2021 14:47:16 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Mar 2021 07:47:16 -0700
Date:   Fri, 19 Mar 2021 17:47:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvcvideo: fix GFP_ flags in uvc_submit_urb()
Message-ID: <YFS5axzOQEJN6fHI@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190106
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190106
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc_submit_urb() function is supposed to use the passed in GFP_
flags but this code accidentally uses GFP_KERNEL instead.  Some of
the callers are passing GFP_ATOMIC so presumably this can lead to
sleeping in atomic context.

Fixes: b20f917f84e6 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index cdd8eb500bb7..a777b389a66e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1119,7 +1119,7 @@ static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
 	dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
 				    uvc_urb->sgt,
 				    uvc_stream_dir(uvc_urb->stream));
-	return usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
+	return usb_submit_urb(uvc_urb->urb, mem_flags);
 }
 
 /*
-- 
2.30.2

