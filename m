Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DA82C8475
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 13:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgK3Myh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 07:54:37 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:47348 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgK3Myg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 07:54:36 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AUCT3mC013966;
        Mon, 30 Nov 2020 12:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=T4e4SA0nsSEz5R/oPuOynUVhSHa8l4YzlQu9nbAV6w0=;
 b=Q37V5W8BrV9ozjYfQYey5wQMtLuLQ4dmuxgiTZBdTxDJp0/FHLpDNWXFDvMVmNBdLR+v
 XssuGqWJVxMTnYzAgT/wMDDY0XqipupHDTedLvuArKTytQ5SWxLNtHRaJ9oSF3+GZCbk
 +S0h2Zf92kCHJH2lKo0ODJT4OV5FablRJU5o7psx3W5ufD4Dqge78TjQ1Cshr/xe2CJA
 +eDi8+n/7dlCQLCCw4KjCMhm+2W4Rn8gSLB0CvFBQOsfdE6OJAj/fkM+DQZK1kr6UU8Y
 /ubilApDr6oJZUlFcgpmIl3DK65hBlIJKn01E8NoVSyfHWhQm0iOx5RWW9orbSgwiFYx cw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 353egkctw6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Nov 2020 12:53:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AUCpG43118219;
        Mon, 30 Nov 2020 12:53:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 3540fv1u59-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Nov 2020 12:53:42 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AUCreQG015374;
        Mon, 30 Nov 2020 12:53:40 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 30 Nov 2020 04:53:39 -0800
Date:   Mon, 30 Nov 2020 15:53:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rockchip: rkisp1: remove some dead code
Message-ID: <X8TrSj3PbqVtN5XQ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9820 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9820 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300081
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The debugfs_create_dir() function never returns NULLs.  It's not supposed
to checked for errors in the normal case and there is no need to check
in this function so let's just delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 9af137e4967f..68da1eed753d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -430,10 +430,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 	struct rkisp1_debug *debug = &rkisp1->debug;
 
 	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
-	if (!debug->debugfs_dir) {
-		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
-		return;
-	}
 	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
 			     &debug->data_loss);
 	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
-- 
2.29.2
