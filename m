Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE14E158A7A
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 08:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbgBKHgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 02:36:12 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:34292 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbgBKHgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 02:36:12 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01B7WwfP168528;
        Tue, 11 Feb 2020 07:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=sWcfPF3Kh2ubfozEMoeZnRUtpf2TdZmIYyL6LFnBsWM=;
 b=D7ASVWDQlX3hGWDJ2QA/aP3XibeOSpKpkZTZBujeQ2UEb4SMdS3ve1bbDeobCCZtdPcN
 CnlygkexYeS0aZ8t4156QaEJ5FcaCOPOA1J8zOE7Y2exSiIjJ0NhyYz7oBEoIzSIyWOK
 mUIhcv5/FjWAcldkZLPfvQrIUJPkAtp8JqZe1XoIJNMTPMm2WufrDpwR0rYNTnaVE/87
 yO6Wyw/2AcqbdXgcvxvgCJFrHqKMT+gjW+MC9OloG+6OLChMf22QwqlOu/dfNaAU8j58
 7raEbq6JmERG5A2zNyuMO0m/Fw333R9lq0pc+FXFvjOyOlXCBrWv4H0bocgKcSHmVELt SA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2y2p3s9ar0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Feb 2020 07:35:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01B7WANi138459;
        Tue, 11 Feb 2020 07:35:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2y26huengp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Feb 2020 07:35:58 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01B7ZuaZ009248;
        Tue, 11 Feb 2020 07:35:56 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 Feb 2020 23:35:55 -0800
Date:   Tue, 11 Feb 2020 10:35:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: staging/imx: Missing assignment in
 imx_media_capture_device_register()
Message-ID: <20200211073522.jobdu256d22c3y32@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002110054
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There was supposed to be a "ret = " assignment here, otherwise the
error handling on the next line won't work.

Fixes: 64b5a49df486 ("[media] media: imx: Add Capture Device Interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  Sometimes in these situations the function could be
returning something bogus but no one knew because the assignment wasn't
there.  So it's best to test these.

 drivers/staging/media/imx/imx-media-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 7712e7be8625..df0bf680721b 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -778,7 +778,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	/* setup default format */
 	fmt_src.pad = priv->src_sd_pad;
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
 	if (ret) {
 		v4l2_err(sd, "failed to get src_sd format\n");
 		goto unreg;
-- 
2.11.0

