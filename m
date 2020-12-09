Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09D32D3BB0
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 07:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgLIGvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 01:51:44 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:34756 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbgLIGvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 01:51:36 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96oRUC110277;
        Wed, 9 Dec 2020 06:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=bO9vq2BabX1qbgsUehlStd1AchTSLN9TIq3pAbaa1CI=;
 b=VHJVzV7ZHgn54PYg8C/ghw9zAnPbtK6MKQR4JttSLZU2TBPDJze4U+74DW5w2AdnXCx2
 UI4s9pthoQReQ6kcp5BDDFPIVRMjjEEAcjQlau1eXYb/X5ex25BsSoDUqcx5D7lEOM18
 /NSrx2KtXsteXsDWfKOzP/t6Nc4SD1tHhg6LiiRFVMITwc9Y0elca8vpkt8HZuW/uWLx
 5ut5jtlr6MfSRKC8+kyyN3XZ9/8C+xvu9P0xhB5CYhjJrilaRxZX7+sR5ZLhWOrsdJGl
 rVnuyY5PtG6NVt0/VR2CIduHVd/4W3Ii8VPO2CxV0HLOMWNSdoLocuBbzdBPH8GiJQdy dA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 35825m6hxd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 06:50:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96obL4138894;
        Wed, 9 Dec 2020 06:50:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 358m3ytkb9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 06:50:49 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B96ojNJ011197;
        Wed, 9 Dec 2020 06:50:45 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 22:50:44 -0800
Date:   Wed, 9 Dec 2020 09:50:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Robert Foss <robert.foss@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] media: camss: Fix signedness bug in video_enum_fmt()
Message-ID: <X9BzujGgPAM/s+rG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This test has a problem because we want to know if "k" is -1 or a
positive value less than "f->index".  But the "f->index" variable is a
u32 so if "k == -1" then -1 gets type promoted to UINT_MAX which is
larger than "f->index".  I've added an explicit test to check for -1.

Fixes: a3d412d4b9f3 ("media: Revert "media: camss: Make use of V4L2_CAP_IO_MC"")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I could equally well have casted "k < (int)f->index" but I feel like
this is more explicit and readable.

 drivers/media/platform/qcom/camss/camss-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index bd9334af1c73..2fa3214775d5 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -579,7 +579,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 			break;
 	}
 
-	if (k < f->index)
+	if (k == -1 || k < f->index)
 		/*
 		 * All the unique pixel formats matching the arguments
 		 * have been enumerated (k >= 0 and f->index > 0), or
-- 
2.29.2

