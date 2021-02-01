Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1789F30A799
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 13:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhBAM1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 07:27:36 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:40132 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhBAM1b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 07:27:31 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 111CEOoY184450;
        Mon, 1 Feb 2021 12:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=SsPzUh6Wt1YOVgk/HsFNH+iSurpmStehMn4xyz3aHzw=;
 b=v9zl8gdIRcpNs6CUHQJ83O/kNFxpJdi2yFbezVhkV+nLxbWIB4v7bCZBNdqWNGNgKKmJ
 pJhDONwLeuib2OWUk4nUkG03uxTbxndUlg3Dcux78VuVmiJ0V647MaUBaqLn178tJ95u
 LrsQrOXn3KlplpVKApGqrKsLkCCMyWjXFJoR9ITK+p9b28MCgiimmV4H8SGQELpWLt6/
 AqN5Wg3GuLO9S75ulKY/XsKugCL8JI++Pyy6xo8/1Nv4JPFZuWTwNf0UlhfclObk1sEP
 7soOadt0lIuA9lvWNppJTGi3iv8/rTR0955hxsIrWWASkuqj0ZrYt9XxaBXPqjdJ6QuF IQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 36cvyan50p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Feb 2021 12:26:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 111CAtGE097799;
        Mon, 1 Feb 2021 12:26:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 36dhbwht30-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Feb 2021 12:26:41 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 111CQcCD008334;
        Mon, 1 Feb 2021 12:26:39 GMT
Received: from mwanda (/10.175.186.133)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 01 Feb 2021 04:26:38 -0800
Date:   Mon, 1 Feb 2021 15:26:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rahul Gottipati <rahul.blr97@gmail.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: double free in atomisp_alloc_css_stat_bufs()
Message-ID: <YBfzd3XtDl/r9KUC@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102010064
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010064
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "s3a_buf" has already been added to the "&asd->s3a_stats" list
and it gets cleaned up in the error handling code at the end of
the function.  This kfree() leads to a use after free and a double
free.  Delete it.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
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

