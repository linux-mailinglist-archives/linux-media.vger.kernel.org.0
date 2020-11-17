Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCCC2B5A45
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 08:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgKQHZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 02:25:51 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:57482 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgKQHZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 02:25:50 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7O9wY125593;
        Tue, 17 Nov 2020 07:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=DsqENJiA0F3wCc6Zls8xWx7X4aEixuKScXLZrU4+1B4=;
 b=tjrIrFM+bo2iDtoD+azRD8l8uCvMD0kccLT+NsMXOSUc/FAMWJfkgOZHYJZmNxHSGK/U
 zfGapvT3Dd5OT77eB8FDbiySvU9LNE46OwBesbCvjwBjKBW7C4m+tVJv17teNXeCcDTC
 JE0b9j6UQh3kIFWvq6QqUykUJJYzYgueI5DiwQ20cx2M/3otN3L+in5ci8AgkJXwN8+s
 zzXhRk7/4E3/IbHPAzH9xi6f+O4/+YvzPyDdRPpkrIOevo2qtaR/ZvZZ/h3RPVKbqWT7
 3vhuYsHD6UyaZix/j5bw5BiUA3tSljjVHWfN6dnmZEUJNXQwGsz0zKA8OGM5MEiKWrNG dA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 34t7vn0x8j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 07:25:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7FZfb093614;
        Tue, 17 Nov 2020 07:23:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 34uspt0fx4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Nov 2020 07:23:47 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AH7Nkc1031601;
        Tue, 17 Nov 2020 07:23:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 23:23:46 -0800
Date:   Tue, 17 Nov 2020 10:23:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: saa7146: fix array overflow in vidioc_s_audio()
Message-ID: <20201117072340.GD1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170052
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "a->index" value comes from the user via the ioctl.  The problem is
that the shift can wrap resulting in setting "mxb->cur_audinput" to an
invalid value, which later results in an array overflow.

Fixes: 6680427791c9 ("[media] mxb: fix audio handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/pci/saa7146/mxb.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 129a1f8ebe1a..73fc901ecf3d 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -641,16 +641,17 @@ static int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *
 	struct mxb *mxb = (struct mxb *)dev->ext_priv;
 
 	DEB_D("VIDIOC_S_AUDIO %d\n", a->index);
-	if (mxb_inputs[mxb->cur_input].audioset & (1 << a->index)) {
-		if (mxb->cur_audinput != a->index) {
-			mxb->cur_audinput = a->index;
-			tea6420_route(mxb, a->index);
-			if (mxb->cur_audinput == 0)
-				mxb_update_audmode(mxb);
-		}
-		return 0;
+	if (a->index >= 32 ||
+	    !(mxb_inputs[mxb->cur_input].audioset & (1 << a->index)))
+		return -EINVAL;
+
+	if (mxb->cur_audinput != a->index) {
+		mxb->cur_audinput = a->index;
+		tea6420_route(mxb, a->index);
+		if (mxb->cur_audinput == 0)
+			mxb_update_audmode(mxb);
 	}
-	return -EINVAL;
+	return 0;
 }
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-- 
2.29.2

