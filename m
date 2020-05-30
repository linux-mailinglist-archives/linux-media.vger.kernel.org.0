Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443A41E8EB1
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgE3G6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:44994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728844AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A595A217D9;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=993dPgX4SG4DIHnZBSG0XtUGYOKUCrL34k92JltSwRQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ez+SALLfIKCxO2ABBSwEaqIW5C29r8PvJULP46huvziCGyMcWGhVJelxfwHLrMU0P
         9pleZqlsm/yWHklpbaC56jhpjeTxEe52flWJ8Ecvr9/J2bTf5F/3WPeIMa/P37sj3X
         +8f7y/0MFaONdXQnl3MvphaqJTWVXajHcaNSaDbs=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hqB-Ki; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/41] media: atomisp: avoid an extra memset() when alloc memory
Date:   Sat, 30 May 2020 08:55:44 +0200
Message-Id: <ff61a66ac404db40263220f4f96eedc16157dbc8.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the variant which zeroes the memory when allocating,
instead of having an explicit memset.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c  | 3 +--
 drivers/staging/media/atomisp/pci/sh_css.c                     | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index ebf36f7a514f..feacd8f12b14 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -593,12 +593,11 @@ static enum ia_css_err pipeline_stage_create(
 		out_frame[i] = stage_desc->out_frame[i];
 	}
 
-	stage = kvmalloc(sizeof(*stage), GFP_KERNEL);
+	stage = kvzalloc(sizeof(*stage), GFP_KERNEL);
 	if (!stage) {
 		err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
 		goto ERR;
 	}
-	memset(stage, 0, sizeof(*stage));
 
 	if (firmware) {
 		stage->binary = NULL;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4269c16ad4f1..90d73fd8aa1b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -9398,7 +9398,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 
 	/* allocate the stream instance */
-	curr_stream = kmalloc(sizeof(struct ia_css_stream), GFP_KERNEL);
+	curr_stream = kzalloc(sizeof(struct ia_css_stream), GFP_KERNEL);
 	if (!curr_stream)
 	{
 		err = IA_CSS_ERR_CANNOT_ALLOCATE_MEMORY;
@@ -9406,7 +9406,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		return err;
 	}
 	/* default all to 0 */
-	memset(curr_stream, 0, sizeof(struct ia_css_stream));
 	curr_stream->info.metadata_info = md_info;
 
 	/* allocate pipes */
-- 
2.26.2

