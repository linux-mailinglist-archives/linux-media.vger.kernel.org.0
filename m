Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04AC2CA5B9
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 15:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403898AbgLAOb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 09:31:58 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55500 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388915AbgLAOb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 09:31:57 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1ET4f3052841;
        Tue, 1 Dec 2020 14:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=mQts94rHer9WemoS7c8i+DV543vHJuK33cqzIkDxFy4=;
 b=KDcY+lTcIJsjw6y+qWKZToLaZNbkaIovCjCXWKgV1Bq6IvIlbMyO0YHDmD9b1qqrzHPv
 E2RrxWpkT6Y8X2mmhEjkMP8XAfx/5csuY6a05yo+42hs8KMtQI4iIjML3n70KLS1LMS1
 gMRISj7Rh08H+uHVl7OpIdNxGA2sMAW3ACPczU67CUwf68GBFJfV/4014StlF9KYIWDI
 89F/gQbuHJhS7TKQlzkdfOJVFEhjYLE6zIyid7rQn7vP578sjOrqyPEeMi68yqgUUEn5
 vU4UxmhXLCB7f1Oq86rPnCCev/X/a5UzkQyth8NIjaubK9NvKop5rxyV6A4EI31QxO9+ NA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 353c2atxbr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 14:31:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1ELJaw117970;
        Tue, 1 Dec 2020 14:31:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 3540fx12mf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 14:31:06 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1EV5Of030407;
        Tue, 1 Dec 2020 14:31:05 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Dec 2020 06:31:04 -0800
Date:   Tue, 1 Dec 2020 17:30:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: rockchip: rkisp1: remove useless debugfs checks
Message-ID: <20201201143058.GJ2767@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6d9660f-84ec-317d-c3aa-9b3bda595d49@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010093
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The debugfs_create_dir() function never returns NULLs so this code will
never be executed.  It's not intended that callers will check for
debugfs errors in the normal case and it's not necessary in this driver,
so we can just delete this code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix subject

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
