Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021E41C503A
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgEEI0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 04:26:11 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35792 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgEEI0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 04:26:11 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0458N6ZD135107;
        Tue, 5 May 2020 08:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=vfafqK+gClVsvD0wGa8+iFWiZuHNuS1IxnHzPnTCGTA=;
 b=zAucqM8ZjJy1x3vZA+k83i6bRxzTkfEJ19ggLKPhVgYhmAoEk4YqtZFWfcAnajXXiRtp
 RPD0TnvXpy0Ym9pMxZR6LYU58GNzfSW1JyzDW70j9xG3PuhZUlYbVbsueqeQACfgu/fd
 TuuUG0v1awhPeVaIoRD6Do313dW7ymFy1CHpVJ1YgEltf5BDuMvkuuO1DCNhJZISvFUZ
 ik+P6S49SoyYsZkPZUq7jIi8XNX4evtBM6jKtBMLQukYTzBvxlehii4twyvxah7qV/fe
 GovyL9959VQ/Bht9G+fzVSPAiA7xR2b1RvIpwgrxNSV7DBKvvOTH2VNKA4D+cE+ch2+u iQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 30s0tmb86p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 May 2020 08:26:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0458NNYO132559;
        Tue, 5 May 2020 08:26:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30sjndqsdk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 May 2020 08:26:05 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0458Q3SN014522;
        Tue, 5 May 2020 08:26:03 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 05 May 2020 01:26:03 -0700
Date:   Tue, 5 May 2020 11:25:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Kamil Debski <kamil@wypas.org>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: cec: silence shift wrapping warning in
 __cec_s_log_addrs()
Message-ID: <20200505082556.GA113134@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005050067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9611 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050067
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The log_addrs->log_addr_type[i] value is a u8 which is controlled by
the user and comes from the ioctl.  If it's over 31 then that results in
undefined behavior (shift wrapping) and that leads to a Smatch static
checker warning.  We already cap the value later so we can silence the
warning just by re-ordering the existing checks.

I think the UBSan checker will also catch this bug at runtime and
generate a warning.  But otherwise the bug is harmless.

Fixes: 9881fe0ca187 ("[media] cec: add HDMI CEC framework (adapter)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I haven't pushed the Smatch check for this but I've been re-working how
user data is tracked and hopefully it should reach acceptable false
positive ratio soon so I can do that.

 drivers/media/cec/core/cec-adap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 6c95dc471d4c6..6a04d19a96b2e 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1734,6 +1734,10 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 		unsigned j;
 
 		log_addrs->log_addr[i] = CEC_LOG_ADDR_INVALID;
+		if (log_addrs->log_addr_type[i] > CEC_LOG_ADDR_TYPE_UNREGISTERED) {
+			dprintk(1, "unknown logical address type\n");
+			return -EINVAL;
+		}
 		if (type_mask & (1 << log_addrs->log_addr_type[i])) {
 			dprintk(1, "duplicate logical address type\n");
 			return -EINVAL;
@@ -1754,10 +1758,6 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 			dprintk(1, "invalid primary device type\n");
 			return -EINVAL;
 		}
-		if (log_addrs->log_addr_type[i] > CEC_LOG_ADDR_TYPE_UNREGISTERED) {
-			dprintk(1, "unknown logical address type\n");
-			return -EINVAL;
-		}
 		for (j = 0; j < feature_sz; j++) {
 			if ((features[j] & 0x80) == 0) {
 				if (op_is_dev_features)
-- 
2.26.2

