Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2672E6F27
	for <lists+linux-media@lfdr.de>; Tue, 29 Dec 2020 09:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgL2I4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Dec 2020 03:56:16 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10371 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgL2I4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Dec 2020 03:56:16 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D4pBs269Fz7Lyj;
        Tue, 29 Dec 2020 16:54:45 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 16:55:29 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <dwlsalmeida@gmail.com>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH] media: vidtv: Use kmemdup instead of kzalloc and memcpy
Date:   Tue, 29 Dec 2020 16:55:30 +0800
Message-ID: <1609232130-34252-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes coccicheck warning:
drivers/media/test-drivers/vidtv/vidtv_psi.c:509:10-17: WARNING
opportunity for kmemdup

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 4511a2a..2739c19 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -506,10 +506,9 @@ struct vidtv_psi_desc *vidtv_psi_desc_clone(struct vidtv_psi_desc *desc)
 
 		case REGISTRATION_DESCRIPTOR:
 		default:
-			curr = kzalloc(sizeof(*desc) + desc->length, GFP_KERNEL);
+			curr = kmemdup(desc, sizeof(*desc) + desc->length, GFP_KERNEL);
 			if (!curr)
 				return NULL;
-			memcpy(curr, desc, sizeof(*desc) + desc->length);
 		}
 
 		if (!curr)
-- 
2.7.4

