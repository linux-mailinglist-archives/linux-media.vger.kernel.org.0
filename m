Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A15189CF8
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCRN1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:27:46 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:65063 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgCRN1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:27:46 -0400
X-Halon-ID: 2b75de50-691c-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 2b75de50-691c-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 14:27:10 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] v4l2-compliance: add tests for V4L2_CAP_IO_MC
Date:   Wed, 18 Mar 2020 14:27:22 +0100
Message-Id: <20200318132722.3089925-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add tests to check the behavior of VIDIOC_ENUM{INPUT,OUTPUT},
VIDIOC_G_{INPUT,OUTPUT} and VIDIOC_S_{INPUT,OUTPUT} when the
V4L2_CAP_IO_MC  is set.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 utils/v4l2-compliance/v4l2-test-input-output.cpp | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-test-input-output.cpp b/utils/v4l2-compliance/v4l2-test-input-output.cpp
index 2bf338e6f6d7ec5a..bf937abec320f88a 100644
--- a/utils/v4l2-compliance/v4l2-test-input-output.cpp
+++ b/utils/v4l2-compliance/v4l2-test-input-output.cpp
@@ -466,6 +466,13 @@ int testInput(struct node *node)
 	if (!node->inputs && node->has_inputs)
 		return fail("no inputs found, but input capabilities set\n");
 	fail_on_test(node->is_m2m && node->inputs > 1);
+	if (node->g_caps() & V4L2_CAP_IO_MC) {
+		if (!node->is_video && !node->is_meta)
+			return fail("media device controls none video or meta input\n");
+
+		if (!node->is_meta && node->inputs != 1)
+			return fail("media device controlled input have %d inputs\n", node->inputs);
+	}
 	return 0;
 }
 
@@ -836,6 +843,13 @@ int testOutput(struct node *node)
 	if (!node->outputs && node->has_outputs)
 		return fail("no outputs found, but output capabilities set\n");
 	fail_on_test(node->is_m2m && node->outputs > 1);
+	if (node->g_caps() & V4L2_CAP_IO_MC) {
+		if (!node->is_video && !node->is_meta)
+			return fail("media device controls none video or meta output\n");
+
+		if (!node->is_meta && node->outputs != 1)
+			return fail("media device controlled output have %d outputs\n", node->outputs);
+	}
 	return 0;
 }
 
-- 
2.25.0

