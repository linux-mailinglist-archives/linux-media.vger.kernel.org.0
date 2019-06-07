Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995C238C07
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 15:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbfFGN4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 09:56:46 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:45594 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbfFGN4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 09:56:46 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x57DmTei007580;
        Fri, 7 Jun 2019 13:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=sl3r5jCoha9AwpUHzlc6e/+sE+z9uZcaWIv3yOHjo/U=;
 b=FhH4IGw/pdnGDeWhTainIQBB9WIENv5+snDCsoDhr/gqFmabWxYjNAifT5vZlWzes7u7
 oNsn5HTp/NSQ/SnbuWtm5ZqMXnM7WTmsFL/PvewZzN07ZSO2+BPAZKpMaoAuCPDyN/pe
 zcts1m5Px3dN8sEr/a/JXNynlu7QMDg60HSnUF/kycqFu9ySAcuJjGoKaKdqSsj5XsQo
 wDbIry9tEmQlZYUbKgpp8/W19noRgLkZknWkUT4Es4kjT5ML+VNajzb/jKPb0YfUDryH
 PWbryA0gShX4TgoL4IZRJep7468SgKqtE3Qtcse+v7RAL/t+rlWObFY/C8bcN4mM1Wm+ tA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 2suevdxp6n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 13:56:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x57Du7ss129194;
        Fri, 7 Jun 2019 13:56:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2swngk1d8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 Jun 2019 13:56:29 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x57DuHwg017850;
        Fri, 7 Jun 2019 13:56:19 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 Jun 2019 06:56:17 -0700
Date:   Fri, 7 Jun 2019 16:56:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rockchip/vpu: remove an unnecessary NULL check
Message-ID: <20190607135609.GA16718@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070098
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thus the address of "&ctx->dev->variant->codec_ops[codec_mode]"
can't possibly be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
index 1b80a45df8fe..42f4eb0abc8a 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
@@ -619,7 +619,7 @@ static int rockchip_vpu_start_streaming(struct vb2_queue *q,
 
 		vpu_debug(4, "Codec mode = %d\n", codec_mode);
 		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
-		if (ctx->codec_ops && ctx->codec_ops->init)
+		if (ctx->codec_ops->init)
 			ret = ctx->codec_ops->init(ctx);
 	}
 
-- 
2.20.1

