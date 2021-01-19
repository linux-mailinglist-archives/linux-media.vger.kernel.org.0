Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AE92FAE8B
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 02:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393485AbhASB67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 20:58:59 -0500
Received: from m12-16.163.com ([220.181.12.16]:49561 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387832AbhASB66 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 20:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=BaI2A+HSw7WHeKSvld
        /ZmSRtcyLfzivsyXFRFsquMtI=; b=Th1eOwq7NmeUZwEVIrNWjuTsiC+NZPiWd7
        SFP9q+6oFJfLfwwNBOz3SwhJOrdzpztqtcTWF90yA++aM7qiQTSX0BWjb2XhPAg0
        De76xe8UJNl1QW4OVcbiiHPCyXwA4mjq02lD+Vd3gNL0S//SPi1O/wyJiP0l0MKU
        eQEEnNppo=
Received: from COOL-20200923LL.ccdomain.com (unknown [218.94.48.178])
        by smtp12 (Coremail) with SMTP id EMCowABXxD9aMQZgwU0gXw--.10053S2;
        Tue, 19 Jan 2021 09:09:48 +0800 (CST)
From:   chiguoqing <chi962464zy@163.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhangwen@yulong.com, chiguoqing <chi962464zy@163.com>
Subject: [PATCH] media: vidtv: remove redundant quote
Date:   Tue, 19 Jan 2021 09:09:47 +0800
Message-Id: <20210119010947.709-1-chi962464zy@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EMCowABXxD9aMQZgwU0gXw--.10053S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWfWw1fGr4DAFy3WF15Arb_yoWxAFcE9w
        n7Zr4xW342yry8tr17JF9rAa4FkayDZF95XFn0qw1YvF9rZa45G3ZFvw1UGanFgF4ava97
        ZFy5JF109r17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRt-eOJUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pfklmlasuwk6r16rljoofrz/1tbiNxwfRFWBjTc6tQAAsR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Repeated references string.h

Signed-off-by: Wen Zhang <zhangwen@yulong.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 4511a2a98405..8ff27d26c343 100644
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
2.17.1


