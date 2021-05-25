Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE40C38FA77
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 08:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhEYGEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 02:04:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3994 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhEYGEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 02:04:20 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fq3Mx6HVFzmb6f;
        Tue, 25 May 2021 14:00:29 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:02:49 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:02:49 +0800
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
To:     <linux-media@vger.kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: atomisp: remove the repeated declaration
Date:   Tue, 25 May 2021 14:02:39 +0800
Message-ID: <1621922559-1859-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function 'ia_css_mmu_invalidate_cache' is declared twice, remove the
repeated declaration.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index a60551450c45..c16eaf3d126f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -83,8 +83,6 @@ int atomisp_q_dis_buffer_to_css(struct atomisp_sub_device *asd,
 
 void ia_css_mmu_invalidate_cache(void);
 
-void ia_css_mmu_invalidate_cache(void);
-
 int atomisp_css_start(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset);
 
-- 
2.7.4

