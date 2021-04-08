Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FB5357C19
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 08:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhDHGEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 02:04:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15171 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhDHGEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 02:04:10 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FG9cQ570czpVf2;
        Thu,  8 Apr 2021 14:01:10 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 14:03:49 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
        "Zhiqi Song" <songzhiqi1@huawei.com>
Subject: [PATCH] media: cx25821: remove unused including <linux/version.h>
Date:   Thu, 8 Apr 2021 14:04:13 +0800
Message-ID: <1617861853-14680-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/media/pci/cx25821/cx25821.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/cx25821/cx25821.h b/drivers/media/pci/cx25821/cx25821.h
index 0173079..3aa7604 100644
--- a/drivers/media/pci/cx25821/cx25821.h
+++ b/drivers/media/pci/cx25821/cx25821.h
@@ -28,7 +28,6 @@
 #include "cx25821-sram.h"
 #include "cx25821-audio.h"
 
-#include <linux/version.h>
 #include <linux/mutex.h>
 
 #define UNSET (-1U)
-- 
2.7.4

