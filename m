Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E3C229865
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 14:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgGVMnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 08:43:10 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58204 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgGVMnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 08:43:09 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MCVINm015061;
        Wed, 22 Jul 2020 12:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ARG1RVN/4F6TCixySUe9XAtp/OnPCTzgVMh4TORIM7U=;
 b=gBXojG/JTaneWtO9vyz6ktJc0zIKmUUKGU5OgP+Q06B0u3Nn70f8Vcm372F7SCdjOKyS
 fVokWo4EFHYOkK5OuDIj9FDQid+SA2F34SqfH7ifPTZGpx42VH2LrSEtSGwY+9Ru6I5S
 y1q9smgTPT5JLB+JCA9odVt1wnHnitkzThkfDRZvPbttDm6Dy4EpGfm2tCiZmftkomNB
 Y5fdnwnKTSd/pZjV9Jhp/j840c6xr8kSlD6cSae9e0m5llKBjPWhbCFVN13SniQ5efvd
 1w0ADOkTebWSyvKdchT/SMPAkBl3JomT3+l5XeGB23Im1OcOZLFBtju90ysQqMKrozI5 WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 32d6ksq77c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jul 2020 12:42:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06MCY2T4152577;
        Wed, 22 Jul 2020 12:42:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 32enj60dkf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jul 2020 12:42:58 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06MCdO4a030269;
        Wed, 22 Jul 2020 12:39:24 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 Jul 2020 12:39:23 +0000
Date:   Wed, 22 Jul 2020 15:39:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Cc:     Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: mtk-mdp: Fix a refcounting bug on error in init
Message-ID: <20200722123914.GB220681@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220094
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to call of_node_put(comp->dev_node); on the error paths in this
function.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 362fff924aef..478ad034ef2a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -57,6 +57,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 {
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
+	int ret;
 	int i;
 
 	comp->dev_node = of_node_get(node);
@@ -67,8 +68,8 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		if (IS_ERR(comp->clk[i])) {
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
-
-			return PTR_ERR(comp->clk[i]);
+			ret = PTR_ERR(comp->clk[i]);
+			goto put_dev;
 		}
 
 		/* Only RDMA needs two clocks */
@@ -87,20 +88,27 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 	if (!larb_node) {
 		dev_err(dev,
 			"Missing mediadek,larb phandle in %pOF node\n", node);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_dev;
 	}
 
 	larb_pdev = of_find_device_by_node(larb_node);
 	if (!larb_pdev) {
 		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
 		of_node_put(larb_node);
-		return -EPROBE_DEFER;
+		ret = -EPROBE_DEFER;
+		goto put_dev;
 	}
 	of_node_put(larb_node);
 
 	comp->larb_dev = &larb_pdev->dev;
 
 	return 0;
+
+put_dev:
+	of_node_put(comp->dev_node);
+
+	return ret;
 }
 
 void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp)
-- 
2.27.0

