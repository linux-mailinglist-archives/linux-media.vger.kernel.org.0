Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABCA38B402
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 18:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhETQFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 12:05:05 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:45638 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbhETQFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 12:05:02 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KFmwCu187187;
        Thu, 20 May 2021 16:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=UplTL1m87USsO5prWyFgDKTaFzDCcXPanOavFdSjeOo=;
 b=ys1hWrWBFEgWJbmdvVz1+x6+ha5Nupsy2M7GZBlM9ARY7LfwzIhm1lTWnq4ffdsbKNGB
 H0RknTU0Y+hV1DWMc++evMXP+aK2C2+yTqZ7XD4ueMYX8qOPlZS40daqtUMiaRcUFI0p
 aikII/O7OMD/vSmYnaXXDiuaWJ0kqJLUOEVxNxoMlG0JLaLynQdbMTqMiY+RfIRH3Jk1
 HAjjnC5rOiUJUXjnwFpXYmcK999YonBLDMdy5YkvINyz5m7kj4uVzuUU4ZXOTvZmBoDo
 udUsht10t+rMud9GQICL+/8Ky5w1JdOAQGHvV9OQuWuR6JhT0IZXU3+6a9KoBLzHuTXU pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 38j68mn6cx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 16:03:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14KFo7af009918;
        Thu, 20 May 2021 16:03:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38nry04hqg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 16:03:06 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14KG36R7144532;
        Thu, 20 May 2021 16:03:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 38nry04hnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 16:03:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14KG2w4O023698;
        Thu, 20 May 2021 16:02:59 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 20 May 2021 09:02:58 -0700
Date:   Thu, 20 May 2021 19:02:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Emil Velikov <emil.velikov@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: hantro: test the correct variable in probe()
Message-ID: <YKaIKXOcDb0nXguP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: hGha3Rc6qYMPnQcAHEPQDkS1hl0hUjeH
X-Proofpoint-GUID: hGha3Rc6qYMPnQcAHEPQDkS1hl0hUjeH
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200105
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This should be testing "vpu->clocks[0].clk" instead of "vpu->clocks".

Fixes: eb4cacdfb998 ("media: hantro: add fallback handling for single irq/clk")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 85dcb0882afc..8ac476be1682 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -780,8 +780,8 @@ static int hantro_probe(struct platform_device *pdev)
 		 * actual name in the DT bindings.
 		 */
 		vpu->clocks[0].clk = devm_clk_get(&pdev->dev, NULL);
-		if (IS_ERR(vpu->clocks))
-			return PTR_ERR(vpu->clocks);
+		if (IS_ERR(vpu->clocks[0].clk))
+			return PTR_ERR(vpu->clocks[0].clk);
 	}
 
 	num_bases = vpu->variant->num_regs ?: 1;
-- 
2.30.2

