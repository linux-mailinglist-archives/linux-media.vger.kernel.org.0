Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4E8601180
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 16:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiJQOt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 10:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiJQOtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 10:49:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476C96256
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 07:49:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 628A4B818F9
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 14:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1A2C433D6;
        Mon, 17 Oct 2022 14:49:19 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] vivid: set num_in/outputs to 0 if not supported
Date:   Mon, 17 Oct 2022 16:49:15 +0200
Message-Id: <20221017144916.489388-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221017144916.489388-1-hverkuil-cisco@xs4all.nl>
References: <20221017144916.489388-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If node_types does not have video/vbi/meta inputs or outputs,
then set num_inputs/num_outputs to 0 instead of 1.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 0c90f649d2f5 (media: vivid: add vivid_create_queue() helper)
---
 drivers/media/test-drivers/vivid/vivid-core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 04b75666bad4..ba665d817cbf 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -920,8 +920,12 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 
 	/* how many inputs do we have and of what type? */
 	dev->num_inputs = num_inputs[inst];
-	if (dev->num_inputs < 1)
-		dev->num_inputs = 1;
+	if (node_type & 0x20007) {
+		if (dev->num_inputs < 1)
+			dev->num_inputs = 1;
+	} else {
+		dev->num_inputs = 0;
+	}
 	if (dev->num_inputs >= MAX_INPUTS)
 		dev->num_inputs = MAX_INPUTS;
 	for (i = 0; i < dev->num_inputs; i++) {
@@ -938,8 +942,12 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 
 	/* how many outputs do we have and of what type? */
 	dev->num_outputs = num_outputs[inst];
-	if (dev->num_outputs < 1)
-		dev->num_outputs = 1;
+	if (node_type & 0x40300) {
+		if (dev->num_outputs < 1)
+			dev->num_outputs = 1;
+	} else {
+		dev->num_outputs = 0;
+	}
 	if (dev->num_outputs >= MAX_OUTPUTS)
 		dev->num_outputs = MAX_OUTPUTS;
 	for (i = 0; i < dev->num_outputs; i++) {
-- 
2.35.1

