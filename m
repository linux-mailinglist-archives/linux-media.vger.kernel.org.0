Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C898620B005
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 12:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgFZKro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 06:47:44 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:34938 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbgFZKrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 06:47:43 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAfvCa046430;
        Fri, 26 Jun 2020 10:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6IdPgCBXv4Mszmx0NqcYfgj/l/bT9oYKZ/jF7jrU2OA=;
 b=gLSW7OCD1kDT6h2cD9P0rdG8WnAbo++PX/Xo4Ln9Yi5UFdhgQFjVbm/RNOojHWPKX2Qy
 jDBxmDHySBG/Mja51Tm44Ifzf6ka/xz523JPobQbUmyhkhJnIles8MJLH1oZREiwvG10
 EXp9C6vOzCWb/ZtjSXeQgYccyiF6eNuDSBlEIz4SLXcaxwcS5ol02z9Ek07OpDAeiATn
 L7mC54eL55MvHNItMvjXlbUVqW+0R3rKT2YEGw6+nuNzSlaFxQAf2sGJvMMe9AFNMdeC
 EQv+9RyvQ3ZresH5DN+ldLooOJeAGY23HJo3AkGOpzMES8j2Sf8nn7i+N68TKEmQCaX6 xQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 31uustwdje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 10:47:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAiJSd159464;
        Fri, 26 Jun 2020 10:45:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 31uurag44h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 10:45:36 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05QAjWhg003583;
        Fri, 26 Jun 2020 10:45:32 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 26 Jun 2020 10:45:32 +0000
Date:   Fri, 26 Jun 2020 13:45:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Fix loop exit condition in
 uvc_xu_ctrl_query()
Message-ID: <20200626104526.GE314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260078
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The list_for_each_entry() loop exits when "entity" is a offset off the
list head.  In that situation the "entity" pointer doesn't point to a
valid uvc_entity struct, so it doesn't make sense to check "entity->id".
Since the "entity->id" is a u8 it's plausible that it could be equal to
"xqry->unit" by chance.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e399b9fad757..47ab6c315db6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1857,7 +1857,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 			break;
 	}
 
-	if (entity->id != xqry->unit) {
+	if (&entity->chain == &chain->entities) {
 		uvc_trace(UVC_TRACE_CONTROL, "Extension unit %u not found.\n",
 			xqry->unit);
 		return -ENOENT;
-- 
2.27.0

