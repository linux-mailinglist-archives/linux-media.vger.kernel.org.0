Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210D12D97BC
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407762AbgLNLyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:54:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50620 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407561AbgLNLym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:54:42 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBosWM179808;
        Mon, 14 Dec 2020 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=LKQ8MhTytUrTxFSbP7LgCnDLlzf6uHCPgXCUj2TjFGU=;
 b=KtfyOjUdWsmddBNVSWjhdBD6mOgBsjICnxL15WOxlxeqmp7vgqPIdXcf+Tq+goVLuEtc
 IiNBvDQyAykb7/FReELat7JyGsAjvggN2I41otKyf6MhTyYYClCaXxL+QkOIeqtez/nc
 dIwvqGnVZCu8F032TeTyfC3iGV1IiWEfZrYU36YOnd54Ec2NmDKqd8DCGo1YK3dxFcDP
 1HVYlCxVXyDP6m9p+MSL4CIwAw51vGYXkKi4EvapkxJcklaPA0PCfsPa+WJpSTPEU64A
 Az1Z5c4cS+iqVBDDQL/ou2nRjSmejKVtU8LaR4W2y4d2PICm6McIy0GFZ/DF7Sbjb1pi 3w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 35cn9r4s8c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Dec 2020 11:53:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBp4rZ183530;
        Mon, 14 Dec 2020 11:53:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 35e6jpa8pe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Dec 2020 11:53:41 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BEBreXY030664;
        Mon, 14 Dec 2020 11:53:40 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 14 Dec 2020 03:53:39 -0800
Date:   Mon, 14 Dec 2020 14:53:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rahul Gottipati <rahul.blr97@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix use after free in
 atomisp_alloc_css_stat_bufs()
Message-ID: <X9dSO3RGf7r0pq2k@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=996 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140084
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "s3a_buf" is freed along with all the other items on the
"asd->s3a_stats" list.  It leads to a double free and a use after free.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 2ae50decfc8b..9da82855552d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -948,10 +948,8 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
 		while (count--) {
 			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
-			if (!dis_buf) {
-				kfree(s3a_buf);
+			if (!dis_buf)
 				goto error;
-			}
 			if (atomisp_css_allocate_stat_buffers(
 				asd, stream_id, NULL, dis_buf, NULL)) {
 				kfree(dis_buf);
-- 
2.29.2

