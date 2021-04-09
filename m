Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD0735999B
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 11:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhDIJnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 05:43:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16119 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhDIJnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 05:43:40 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGtRt5gk5z19L9n;
        Fri,  9 Apr 2021 17:41:14 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:19 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <yebin10@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Nicolas Stuardo Diaz" <nicolasstuardodiaz@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Sean Young <sean@mess.org>,
        Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
CC:     <linux-media@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] [media] siano: use DEFINE_MUTEX() for mutex lock and LIST_HEAD for list head
Date:   Fri, 9 Apr 2021 17:51:44 +0800
Message-ID: <20210409095144.2294145-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().
list head can be initialized automatically with LIST_HEAD()
rather than explicitly calling INIT_LIST_HEAD().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/media/common/siano/smsdvb-main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index cd5bafe9a3ac..b8a163a47d09 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -26,8 +26,8 @@ Copyright (C) 2006-2008, Uri Shkolnik
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
-static struct list_head g_smsdvb_clients;
-static struct mutex g_smsdvb_clientslock;
+static LIST_HEAD(g_smsdvb_clients);
+static DEFINE_MUTEX(g_smsdvb_clientslock);
 
 static u32 sms_to_guard_interval_table[] = {
 	[0] = GUARD_INTERVAL_1_32,
@@ -1236,9 +1236,6 @@ static int __init smsdvb_module_init(void)
 {
 	int rc;
 
-	INIT_LIST_HEAD(&g_smsdvb_clients);
-	mutex_init(&g_smsdvb_clientslock);
-
 	smsdvb_debugfs_register();
 
 	rc = smscore_register_hotplug(smsdvb_hotplug);

