Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD7A2D3BB9
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 07:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgLIGz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 01:55:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37710 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbgLIGz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 01:55:28 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96nbx9109649;
        Wed, 9 Dec 2020 06:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=U36F8FF0wT6ojUdcxJqVdZLe3hBGdSfdmymisod29gs=;
 b=Wv+RNTc8PfpOy9ykOG3KMUWYnIq/b9vXsE+8H+p3ZY0UiezyaeZMqZYFX0BzQV1wYTJj
 HOgDb6Rx3jTOxo0RX4P2VdV+wRt/me7T581khFGi/HFdb/M6AmJT81OQjYiGxA1PvgHX
 eg/UltHLF+Y2fh63L6v4MFBWU/nZY+qd7UOhcsm7hj95CsatUfN51gWIW8ClGjb1YqxN
 FLaB73EYXWUrfznSQQMRN9KhCwDWcIrxVvLKy1aDPuApATyKMAXKQKjfFokALJCCUd2u
 9dcIds4YPYh+rG665rupfq+ydEaYMaXaIFIWphjNMlvbCbUX9GVCyHoKM1AcUaXXiuJj gQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 35825m6j6t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 06:54:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96okn6066609;
        Wed, 9 Dec 2020 06:52:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 358kyu4q47-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 06:52:44 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B96qhbK002664;
        Wed, 9 Dec 2020 06:52:43 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 22:52:42 -0800
Date:   Wed, 9 Dec 2020 09:52:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ccs: Remove uninitialized, unused variable
Message-ID: <X9B0NIm4Iv4uFlkT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "reg" value isn't used any more but it's still printed in the
debug code.  Delete it.

Fixes: fd9065812c7b ("media: smiapp: Obtain frame descriptor from CCS limits")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4447ca367a84..7a461c0a730d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -268,7 +268,6 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 		u32 pixels;
 		char *which;
 		char *what;
-		u32 reg;
 
 		if (fmt_model_type == CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE) {
 			desc = CCS_LIM_AT(sensor, FRAME_FORMAT_DESCRIPTOR, i);
@@ -322,7 +321,7 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 		}
 
 		dev_dbg(&client->dev,
-			"0x%8.8x %s pixels: %d %s (pixelcode %u)\n", reg,
+			"%s pixels: %d %s (pixelcode %u)\n",
 			what, pixels, which, pixelcode);
 
 		if (i < ncol_desc) {
-- 
2.29.2

