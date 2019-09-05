Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15685AA391
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 14:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389564AbfIEMzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 08:55:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:52388 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387935AbfIEMzA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 08:55:00 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3319FE358CB6CF2A43B4;
        Thu,  5 Sep 2019 20:54:43 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Sep 2019 20:54:37 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <davem@davemloft.net>, <mareklindner@neomailbox.ch>,
        <mchehab@kernel.org>, <leon@kernel.org>
CC:     <dledford@redhat.com>, <sakari.ailus@linux.intel.com>,
        <a@unstable.cc>, <sw@simonwunderlich.de>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <zhongjiang@huawei.com>
Subject: [PATCH 3/3] IB/mlx5: Use FIELD_SIZEOF directly
Date:   Thu, 5 Sep 2019 20:51:36 +0800
Message-ID: <1567687896-19996-4-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1567687896-19996-1-git-send-email-zhongjiang@huawei.com>
References: <1567687896-19996-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's more clear to use FIELD_SIZEOF instead of its implementation.

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/infiniband/hw/mlx5/mlx5_ib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index c3ea299..e5681f7 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -65,7 +65,7 @@
 		 __LINE__, current->pid, ##arg)
 
 #define field_avail(type, fld, sz) (offsetof(type, fld) +		\
-				    sizeof(((type *)0)->fld) <= (sz))
+				    FIELD_SIZEOF(type, fld) <= (sz))
 #define MLX5_IB_DEFAULT_UIDX 0xffffff
 #define MLX5_USER_ASSIGNED_UIDX_MASK __mlx5_mask(qpc, user_index)
 
-- 
1.7.12.4

