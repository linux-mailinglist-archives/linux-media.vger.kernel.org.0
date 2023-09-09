Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B647994D8
	for <lists+linux-media@lfdr.de>; Sat,  9 Sep 2023 02:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346047AbjIIAmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 20:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345991AbjIIAks (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 20:40:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430551FFD;
        Fri,  8 Sep 2023 17:39:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2D4C433C7;
        Sat,  9 Sep 2023 00:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694219978;
        bh=HKx0qFfB6qal0FsOrYF4xhh4j/5DJ61BIogF21Ky2jA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ToF4DQmyBFYqokLMxqtLKS97HbSX9XGWIOfvUME54leQcHXcZQTMzvXhk2s+uQnxA
         EfxPmykBgXCC/oqtpiClzeoq1CCjeK+jO6WmiM9E5zIpP5doV/TCWDkCkXfqPBby2I
         mORcFlpfjEf4E6QQHSiieJ+YOSKASmpvI1pnRglND2auwxhJ05AGGZ56+58+/a5hgl
         gd1TDYazraZ9ed9Mp/qRBmgVWtOroye0/FHBpZDT2Z2ucAubftTgN0+Rwl2ZTzTu9U
         VBKYkLxeglGPQ1yWbZH5YCjIMK5XNm709qJhNWK9RVyd2xP2sv94oC37vmv23mjCEe
         2HZ1WtHixoaog==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sasha Levin <sashal@kernel.org>, yong.zhi@intel.com,
        bingbu.cao@intel.com, djrscally@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/19] media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning
Date:   Fri,  8 Sep 2023 20:39:01 -0400
Message-Id: <20230909003903.3580394-17-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230909003903.3580394-1-sashal@kernel.org>
References: <20230909003903.3580394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.131
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 9d7531be3085a8f013cf173ccc4e72e3cf493538 ]

Initialise timing struct in cio2_hw_init() to zero in order to avoid a
compiler warning. The warning was a false positive.

Reported-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3a8af3936e93a..162ab089124f3 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -345,7 +345,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	void __iomem *const base = cio2->base;
 	u8 lanes, csi2bus = q->csi2.port;
 	u8 sensor_vc = SENSOR_VIR_CH_DFLT;
-	struct cio2_csi2_timing timing;
+	struct cio2_csi2_timing timing = { 0 };
 	int i, r;
 
 	fmt = cio2_find_format(NULL, &q->subdev_fmt.code);
-- 
2.40.1

