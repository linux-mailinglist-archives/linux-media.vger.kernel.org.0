Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E278314DDF
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 12:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhBILIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 06:08:05 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:47678 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbhBILFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 06:05:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119AxO3U067482;
        Tue, 9 Feb 2021 11:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=tEspa8XmO0tZoYE7LGX0k3IPGylPqpy6j7/xnL9v1DI=;
 b=MwSgByMGHvGerBWImQC17OhwxscGsq+IkgYpaAqEuFJZ1N9rEfyGNmRcxO2aKmPnMYb8
 zDNoPIbT7KqabE22+sdJeL0I019dso5OPHnA5+aRkVeVvRUuY/TvgYTNp5pxNfYbC2TK
 JgY2BNbpvChy36dzeNvi1qtoZpDvekzCsqiYzjPU29u7BB+OsGvXdCyRpMraz09+tAyV
 L+CjQ64wm+psFPEJwLliFKyqlSngiYHrK5a8xoovlinjIrKnFh+hz9aREkrzAyeElQ8t
 Dz28rI3fBzZR+MDK314bD5In+yw9cuIoY3X8oJEsfA0hQ07xznbt6g1m29sZZfCAsvpV gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 36hk2kf3er-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Feb 2021 11:05:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119Atv8o026988;
        Tue, 9 Feb 2021 11:04:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 36j4pnj9jf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Feb 2021 11:04:59 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 119B4vsn010865;
        Tue, 9 Feb 2021 11:04:57 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 09 Feb 2021 03:04:56 -0800
Date:   Tue, 9 Feb 2021 14:04:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>
Cc:     Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: i2c: imx334: Fix an error message
Message-ID: <YCJsUCngklBkJMgw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090057
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090057
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "ret" variable is uninitialized in this error message.

Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
When new drivers are merged into the kernel, then could we use the
driver prefix?  In other words something like this:

media: i2c/imx334: Add imx334 camera sensor driver

 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 07e31bc2ef18..7fbea7caef42 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -790,8 +790,9 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx334->reset_gpio)) {
+		ret = PTR_ERR(imx334->reset_gpio);
 		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
-		return PTR_ERR(imx334->reset_gpio);
+		return ret;
 	}
 
 	/* Get sensor input clock */
-- 
2.30.0

