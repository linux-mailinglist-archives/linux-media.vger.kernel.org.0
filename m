Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EF0665A0A
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 12:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbjAKLZw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 06:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbjAKLYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 06:24:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5641412A9C
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 03:24:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05EF7B819EF
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 11:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAA9C433D2;
        Wed, 11 Jan 2023 11:24:29 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 08/16] av7110: stop building this deprecated driver
Date:   Wed, 11 Jan 2023 12:24:10 +0100
Message-Id: <20230111112418.687882-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
References: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
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

The av7110 driver does not use the vb2 framework for streaming
video, instead it uses the old vb1 framework and nobody stepped in to
convert this driver to vb2.

The hardware is very old, so the decision was made to remove it
altogether since we want to get rid of the old vb1 framework.

This patch drops av7110 from Kconfig and Makefile, the next three patches
will remove the actual driver code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/deprecated/saa7146/Kconfig  | 1 -
 drivers/staging/media/deprecated/saa7146/Makefile | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/deprecated/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/Kconfig
index 54154da79f59..d0cb52164ff8 100644
--- a/drivers/staging/media/deprecated/saa7146/Kconfig
+++ b/drivers/staging/media/deprecated/saa7146/Kconfig
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 source "drivers/staging/media/deprecated/saa7146/common/Kconfig"
-source "drivers/staging/media/deprecated/saa7146/av7110/Kconfig"
 source "drivers/staging/media/deprecated/saa7146/saa7146/Kconfig"
 source "drivers/staging/media/deprecated/saa7146/ttpci/Kconfig"
diff --git a/drivers/staging/media/deprecated/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/Makefile
index 68e7aa10c639..9d99fdedf813 100644
--- a/drivers/staging/media/deprecated/saa7146/Makefile
+++ b/drivers/staging/media/deprecated/saa7146/Makefile
@@ -1,2 +1,2 @@
  # SPDX-License-Identifier: GPL-2.0-only
-obj-y += common/ av7110/ saa7146/ ttpci/
+obj-y += common/ saa7146/ ttpci/
-- 
2.39.0

