Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F062A04D4
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgJ3Lyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:54:44 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:35712 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgJ3Lyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:54:44 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UBjKfL151312;
        Fri, 30 Oct 2020 11:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=+Yf2h8kroGa9FFqdyGT38oTbkFb5FaWP6BIQgYe/vpk=;
 b=GHju6cIz4YiEqvk8J9Rjifms3r+YtLhbS/rHupe8MUl7O0i49FTzRdeZH0fMRZZ5THJD
 GYJVB0fQbtWw5vJhQQCU2jwGnSKbxTW/CIZVILbTMTZzg9k3Aq/psityFEMiSjIPMMoR
 6UA8V8Ifpn+LAhe/jJdp9M68E+3q+M0jX54P4SaRGA8CHGn/N53b+MQMJcowqRjanbSw
 3OMhIn+KoUgv4Klahu+mLlJosm2WgGCALk3jiPH3+AdvCv7cRQfvcbVXY7h8UQNve7kk
 fW9P3H/Qp/M/fc4q4afIty/zd6vGu1905CR37m2z/AzSJn7s4FttAAfgIRKSQaiTaz+J sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 34c9sb9fp0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Oct 2020 11:54:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09UBoRCV074625;
        Fri, 30 Oct 2020 11:52:37 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 34cx1ucp61-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Oct 2020 11:52:37 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09UBqabZ024884;
        Fri, 30 Oct 2020 11:52:36 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 30 Oct 2020 04:52:35 -0700
Date:   Fri, 30 Oct 2020 14:52:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rc: validate that "rc_proto" is reasonable
Message-ID: <20201030115230.GF3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300091
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Smatch complains that "rc_proto" comes from the user and it can result
in shift wrapping in ir_raw_encode_scancode()

    drivers/media/rc/rc-ir-raw.c:526 ir_raw_encode_scancode()
    error: undefined (user controlled) shift '1 << protocol'

This is true, but I reviewed the surrounding code and it appears
harmless.  Anyway, let's verify that "rc_proto" is valid as a kernel
hardenning measure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/rc/lirc_dev.c | 3 ++-
 include/uapi/linux/lirc.h   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
index f99d9dcae667..c1eb960adde3 100644
--- a/include/uapi/linux/lirc.h
+++ b/include/uapi/linux/lirc.h
@@ -226,6 +226,7 @@ enum rc_proto {
 	RC_PROTO_RCMM24		= 25,
 	RC_PROTO_RCMM32		= 26,
 	RC_PROTO_XBOX_DVD	= 27,
+	RC_PROTO_MAX		= RC_PROTO_XBOX_DVD,
 };
 
 #endif
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 220363b9a868..116daf90c858 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -263,7 +263,8 @@ static ssize_t lirc_transmit(struct file *file, const char __user *buf,
 			goto out_unlock;
 		}
 
-		if (scan.flags || scan.keycode || scan.timestamp) {
+		if (scan.flags || scan.keycode || scan.timestamp ||
+		    scan.rc_proto > RC_PROTO_MAX) {
 			ret = -EINVAL;
 			goto out_unlock;
 		}
-- 
2.28.0

