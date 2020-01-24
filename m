Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEEE14869F
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 15:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390182AbgAXOOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 09:14:38 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56120 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387508AbgAXOOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 09:14:38 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OED2Q1032309;
        Fri, 24 Jan 2020 14:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=nyerGigvEupFjYOhX0kriAFenR1Pe04fnQVjV9A2T/c=;
 b=IgnQooUngQQBGu9zsjFhDE5bAlt+fVjCdNAyaXTemzHu3zyApAlonFFM1gyRlZ0YOqpK
 +Z6dI3WPF8U0iB7l4mHTGqswFgFRKHuEAXOu2HMydncHxmhbkYDSXx3T0VJFkgONO7E9
 RbexRXCKghthruFa3/19vfsW5AHBseh/u9uzy5u1xJQuwnXMBcp5E1FDNHNvDl5lvvFx
 Jf2rOAAWzo251L3ivc/16F6i2VmeeaH6cIJTrDa+ofLQIwtgop5v9HG5RU8dMk6mG6kw
 NYq4BII8RYhrfiOr3KQSOX96L2enND9lBxd+4xQezLTKSFETYME8UgGbjceF/sr5qs2o yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2xksyqs6qs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 14:14:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OE9CB7011673;
        Fri, 24 Jan 2020 14:14:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xqmwfbve8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 14:14:16 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00OEE8s5001970;
        Fri, 24 Jan 2020 14:14:08 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Jan 2020 06:14:07 -0800
Date:   Fri, 24 Jan 2020 17:13:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        Hillf Danton <hdanton@sina.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souptick Joarder <jrdr.linux@gmail.com>, andreyknvl@google.com,
        bnvandana@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: usbvision: Fix a use after free in v4l2_release()
Message-ID: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123102707.2596-1-hdanton@sina.com>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240119
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot triggered a use after free in v5.5-rc6:

BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459

Allocated by task 94:
 usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
 usbvision_probe.cold+0x5c5/0x1f21 drivers/media/usb/usbvision/usbvision-video.c:1469

Freed by task 1913:
 kfree+0xd5/0x300 mm/slub.c:3957
 usbvision_release+0x181/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1364
 usbvision_radio_close.cold+0x2b/0x74 drivers/media/usb/usbvision/usbvision-video.c:1130
 v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455

The problem is that the v4l2_release() calls usbvision_release() which
frees "usbvision" but v4l2_release() still wants to use
"usbvision->vdev".  One solution is to make this devm_ allocated memory
so the memory isn't freed until later.

Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I copied this idea from a different driver, but I haven't tested it.
I wanted to try the #syz fix command to see if it works.

 drivers/media/usb/usbvision/usbvision-video.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index 93d36aab824f..07b4763062c4 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -1312,7 +1312,7 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
 {
 	struct usb_usbvision *usbvision;
 
-	usbvision = kzalloc(sizeof(*usbvision), GFP_KERNEL);
+	usbvision = devm_kzalloc(&dev->dev, sizeof(*usbvision), GFP_KERNEL);
 	if (!usbvision)
 		return NULL;
 
@@ -1336,7 +1336,6 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
 	v4l2_ctrl_handler_free(&usbvision->hdl);
 	v4l2_device_unregister(&usbvision->v4l2_dev);
 err_free:
-	kfree(usbvision);
 	return NULL;
 }
 
@@ -1361,7 +1360,6 @@ static void usbvision_release(struct usb_usbvision *usbvision)
 
 	v4l2_ctrl_handler_free(&usbvision->hdl);
 	v4l2_device_unregister(&usbvision->v4l2_dev);
-	kfree(usbvision);
 
 	PDEBUG(DBG_PROBE, "success");
 }
-- 
2.11.0

