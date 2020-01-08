Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49BB133B45
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 06:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgAHFhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 00:37:53 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50040 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgAHFhw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 00:37:52 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085TVbP082166;
        Wed, 8 Jan 2020 05:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=0RQ1jnkz+qZNt3Zv5ETt9a0QVdK5TLLTvK/nyqRg/80=;
 b=mt63cT5TtadaedPmIPwK+dz+KgqEwmtLPnkAs61kgGbWMDqW0r+fI7WfJK8pwjijwtsB
 en/Pw2RSUhkvA4SZ9fC666k5T1KFOzEXn+TMJ/5iAdGOTFAqp6lFRhC8R3XZVJo1/Isl
 SAHqiLCurhwWeWvKmBSAONbfFzVZ/CaH/bMgzLZAh0Yi4slwprVCsI3Zgfo816K3Q7HR
 llBXaXBK2fDpnshF/LgG2HuBzKMiG6Y5xlUbaS99hwTZgN2gui3Ka5LTh1csOB8NiIXO
 isRFw1opQ2EUuAr/o7wFy5Q1poFhC72eY+kGj8XRy1uOjj9S4qv6KdE70XlqaE9MY3zl mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xakbqsk29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 05:37:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085YC6u014600;
        Wed, 8 Jan 2020 05:35:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xcjveswuk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 05:35:45 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0085ZhN4023563;
        Wed, 8 Jan 2020 05:35:43 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jan 2020 21:35:42 -0800
Date:   Wed, 8 Jan 2020 08:35:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: hantro: remove a pointless NULL check
Message-ID: <20200108053534.6rwxk2httwoflbgv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001080048
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001080048
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This can't be NULL and we've already dereferenced it so let's remove
the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 85af1b96fd34..0198bcda26b7 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -688,7 +688,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 
 err_codec_exit:
-	if (ctx->codec_ops && ctx->codec_ops->exit)
+	if (ctx->codec_ops->exit)
 		ctx->codec_ops->exit(ctx);
 	return ret;
 }
-- 
2.11.0

