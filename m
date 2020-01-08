Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECDE133FCC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 12:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgAHK77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 05:59:59 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53724 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgAHK76 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 05:59:58 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 008AxHa3165485;
        Wed, 8 Jan 2020 10:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=TBCgm4Vu22i7I5xmbu7En49CxqUX/dPa2wmYwXIMZew=;
 b=rKoC/5nWdIZ0+qvifgli0jvXieLDBJjYwcmIZ97OLyDNx2p3RtSfcoBU+j7lL3+q+icU
 DIzVks/86FwTWI5pYYh4+S1yR7UNpjsv+07H0+O+3Ub0j1795hb/xyM/IIWElRrpBnJQ
 gkTE62YjVmlqBoz+8JZqgd8l1SnbE4YCZkLxx0Hmgt1MS2CTtr2Tl191yIzrjYC8juDB
 KEVbjkHqXEb9Fwg2ZOD0Ubp/q4adUnPR31KuAitVVOeYIE++i1E6GlcE5ePSPhsvKrWp
 ogfRwPlb/EwWDHhAr4uxB1JGhHyLI8mOP7mqppKQ94FAEk/mEBZIF18npHdd2rAdCsU2 HQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2xaj4u39qv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 10:59:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 008As6Rd139851;
        Wed, 8 Jan 2020 10:59:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2xcqbmyek9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 10:59:47 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 008Axc8s009815;
        Wed, 8 Jan 2020 10:59:38 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 Jan 2020 02:59:37 -0800
Date:   Wed, 8 Jan 2020 13:59:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: v4l2-core: Fix Oops in ioctl
Message-ID: <20200108105929.7kxwf5rthxnhwbuh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000119c91059b9d092f@google.com>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001080093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001080094
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported a crash in video_usercopy().  It turns out when we
broke video_get_user() into a separate function then we accidentally
moved it outside the if block so it tries to memset a user pointer.

Reported-by: syzbot+9240c422be249a8422bd@syzkaller.appspotmail.com
Fixes: c8ef1a6076bf ("media: v4l2-core: split out data copy from video_usercopy")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not actually tested.  :(  Sorry.

 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b68ff06009cd..aaf83e254272 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3205,12 +3205,12 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			parg = mbuf;
 		}
 
+		err = video_get_user((void __user *)arg, parg, orig_cmd,
+				     &always_copy);
+		if (err)
+			goto out;
 	}
 
-	err = video_get_user((void __user *)arg, parg, orig_cmd, &always_copy);
-	if (err)
-		goto out;
-
 	err = check_array_args(cmd, parg, &array_size, &user_ptr, &kernel_ptr);
 	if (err < 0)
 		goto out;
-- 
2.11.0

