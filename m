Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A079D2BB082
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 17:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgKTQ1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 11:27:36 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41128 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728674AbgKTQ1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 11:27:36 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKGONgw044473;
        Fri, 20 Nov 2020 16:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7cUvMP+zau22+fG8ckgh05C1KqV7v5V8dGnggmf5W90=;
 b=KuYJPQYB+aUOkwTcT+MWZ3WZyp4aUNoi+0pfhcvHC+FlLNu4eUVHXMTiErWJeWI50rU6
 10s8uWv55JNq7bhVjOeZGHe88GEUY6BrKop+UKanStd3gUfpIbUcet4PhEdCLSapVOEr
 QZHgodADKiJoSlkky+B6Klt7eYAjgcCPXSX/cCPlrZJqVbl4XCuAoCBak4v4kB3i36Wo
 DIjqUwo2W3YZ6sXarHpfrpwLqyxbXDyRMBm5BQLFYP50jCatuXfWVjjcjh+/ggcW5tuv
 wdATvFSNTXs+slba5KjEs/KrRyPuV1bYXiQOdg5O44SbMQ1srXSLEZDtRkqnv3Pkzb0+ UA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 34t4rbbk24-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 16:27:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AKGQk1Z148375;
        Fri, 20 Nov 2020 16:27:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 34ts61rwet-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Nov 2020 16:27:28 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AKGRP7F005788;
        Fri, 20 Nov 2020 16:27:26 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 20 Nov 2020 08:27:25 -0800
Date:   Fri, 20 Nov 2020 19:27:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix a buffer overflow in debug code
Message-ID: <20201120162718.GA3506662@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200112
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "pad" variable is a user controlled string and we haven't properly
clamped it at this point so the debug code could print from beyond the
of the array.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

 .../media/atomisp/pci/atomisp_subdev.c        | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 52b9fb18c87f..dcc2dd981ca6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -349,12 +349,20 @@ static int isp_subdev_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static char *atomisp_pad_str[] = { "ATOMISP_SUBDEV_PAD_SINK",
-				   "ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE",
-				   "ATOMISP_SUBDEV_PAD_SOURCE_VF",
-				   "ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW",
-				   "ATOMISP_SUBDEV_PAD_SOURCE_VIDEO"
-				 };
+static const char *atomisp_pad_str(unsigned int pad)
+{
+	static const char *const pad_str[] = {
+		"ATOMISP_SUBDEV_PAD_SINK",
+		"ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE",
+		"ATOMISP_SUBDEV_PAD_SOURCE_VF",
+		"ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW",
+		"ATOMISP_SUBDEV_PAD_SOURCE_VIDEO",
+	};
+
+	if (pad >= ARRAY_SIZE(pad_str))
+		return "ATOMISP_INVALID_PAD";
+	return pad_str[pad];
+}
 
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
@@ -378,7 +386,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 	dev_dbg(isp->dev,
 		"sel: pad %s tgt %s l %d t %d w %d h %d which %s f 0x%8.8x\n",
-		atomisp_pad_str[pad], target == V4L2_SEL_TGT_CROP
+		atomisp_pad_str(pad), target == V4L2_SEL_TGT_CROP
 		? "V4L2_SEL_TGT_CROP" : "V4L2_SEL_TGT_COMPOSE",
 		r->left, r->top, r->width, r->height,
 		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY"
@@ -612,7 +620,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 	enum atomisp_input_stream_id stream_id;
 
 	dev_dbg(isp->dev, "ffmt: pad %s w %d h %d code 0x%8.8x which %s\n",
-		atomisp_pad_str[pad], ffmt->width, ffmt->height, ffmt->code,
+		atomisp_pad_str(pad), ffmt->width, ffmt->height, ffmt->code,
 		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY"
 		: "V4L2_SUBDEV_FORMAT_ACTIVE");
 
-- 
2.29.2

