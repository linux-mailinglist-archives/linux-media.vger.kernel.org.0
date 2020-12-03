Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3ADD2CD191
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 09:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388484AbgLCInj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 03:43:39 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:37608 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388476AbgLCIni (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 03:43:38 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38ZVAm091890;
        Thu, 3 Dec 2020 08:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=1XYZQnq0x7TXnbtTBOtpxXgdeW1wf3d70tGkTLJKtA0=;
 b=kUuFqywK4xenf3r+XRJem6Lq1//4d5MX5xGZlDakMwDZEU5f/Vjh7ID2YP5C0c/qGSJm
 +tK+AQnxhWSTVYqXsEWMONcYSaZGsBeZZZNJ8jBMT+W2IGE2j1evztoWMK4+1IYA/DPt
 /VpVCuyHgwvsIT7WD0rwneeSU2mFxBAM+gVtsRhRivxBSgtklZUs+IXlX+LXEPM2ZiR4
 tMzCHTXPcZdsyCJStzrylpdR7szey6yCR6BuQmkHAEwagwbuYCCmJx2dVeamtYG7cyzw
 /WufOUENyAYsDIyTuE1xT/rldcaRxW66yOMviWgFy6h2UlUsi2k9gnkZI9LrrZT3/5/8 Rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 353dyqvkx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Dec 2020 08:42:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38eMR5133079;
        Thu, 3 Dec 2020 08:42:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 3540avpy0q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Dec 2020 08:42:53 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B38gr0e032604;
        Thu, 3 Dec 2020 08:42:53 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Dec 2020 00:42:52 -0800
Date:   Thu, 3 Dec 2020 11:42:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: vidtv: fix use after free in
 vidtv_channel_si_destroy()
Message-ID: <X8ilBh7cBIqSpP6Y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030052
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code frees "m->si.pat" and then dereferences it on the next line.

Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 8ad6c0744d36..7838e6272712 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -504,11 +504,11 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 {
 	u32 i;
 
-	vidtv_psi_pat_table_destroy(m->si.pat);
-
 	for (i = 0; i < m->si.pat->num_pmt; ++i)
 		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
 
+	vidtv_psi_pat_table_destroy(m->si.pat);
+
 	kfree(m->si.pmt_secs);
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
 	vidtv_psi_nit_table_destroy(m->si.nit);
-- 
2.29.2

