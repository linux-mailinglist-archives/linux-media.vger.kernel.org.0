Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE4CCF2E
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2019 09:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfJFHnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Oct 2019 03:43:50 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:52432 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726227AbfJFHnt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 6 Oct 2019 03:43:49 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id CC4B08C2D312005FC304;
        Sun,  6 Oct 2019 15:43:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Sun, 6 Oct 2019 15:43:35 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Wenwen Wang <wenwen@cs.uga.edu>
CC:     YueHaibing <yuehaibing@huawei.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] media: cx231xx: remove duplicated include from cx231xx-417.c
Date:   Sun, 6 Oct 2019 07:43:24 +0000
Message-ID: <20191006074324.48283-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 46d0215deee6..1aec4459f50a 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -22,7 +22,6 @@
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/slab.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>



