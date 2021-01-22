Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA19300311
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 13:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbhAVMcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 07:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbhAVJZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 04:25:39 -0500
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org [IPv6:2a01:4f8:c0c:3a97::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888A2C061788;
        Fri, 22 Jan 2021 01:24:58 -0800 (PST)
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 362C8AD996E; Fri, 22 Jan 2021 10:24:56 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media/radio: Make radio_isa_common_remove() return void
Date:   Fri, 22 Jan 2021 10:24:48 +0100
Message-Id: <20210122092449.426097-3-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122092449.426097-1-uwe@kleine-koenig.org>
References: <20210122092449.426097-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of an unconditional return 0, return no value. One of the two
callers ignored the return value already before.

This simplifies the next patch.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/media/radio/radio-isa.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
index ad2ac16ff12d..527f4c3b0ca4 100644
--- a/drivers/media/radio/radio-isa.c
+++ b/drivers/media/radio/radio-isa.c
@@ -273,8 +273,8 @@ static int radio_isa_common_probe(struct radio_isa_card *isa,
 	return res;
 }
 
-static int radio_isa_common_remove(struct radio_isa_card *isa,
-				   unsigned region_size)
+static void radio_isa_common_remove(struct radio_isa_card *isa,
+				    unsigned region_size)
 {
 	const struct radio_isa_ops *ops = isa->drv->ops;
 
@@ -285,7 +285,6 @@ static int radio_isa_common_remove(struct radio_isa_card *isa,
 	release_region(isa->io, region_size);
 	v4l2_info(&isa->v4l2_dev, "Removed radio card %s\n", isa->drv->card);
 	kfree(isa);
-	return 0;
 }
 
 int radio_isa_probe(struct device *pdev, unsigned int dev)
@@ -342,7 +341,9 @@ int radio_isa_remove(struct device *pdev, unsigned int dev)
 {
 	struct radio_isa_card *isa = dev_get_drvdata(pdev);
 
-	return radio_isa_common_remove(isa, isa->drv->region_size);
+	radio_isa_common_remove(isa, isa->drv->region_size);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(radio_isa_remove);
 
-- 
2.29.2

