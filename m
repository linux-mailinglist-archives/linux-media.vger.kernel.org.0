Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5857934A545
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhCZKGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 06:06:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14912 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhCZKGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 06:06:20 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F6HdL6J9fzkcBC;
        Fri, 26 Mar 2021 18:04:38 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 18:06:07 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: vidtv: Remove duplicated header file inclusion
Date:   Fri, 26 Mar 2021 18:05:39 +0800
Message-ID: <20210326100539.1500-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The header file <linux/string.h> is already included above and can be
removed here.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 47ed7907db8df55..c11ac8dca73dffb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -19,7 +19,6 @@
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/string.h>
 #include <linux/time.h>
 #include <linux/types.h>
 
-- 
1.8.3


