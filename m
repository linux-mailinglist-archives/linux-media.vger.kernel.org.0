Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0518C35FF0E
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhDOAtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42713 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhDOAtn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:43 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 03F6F20002;
        Thu, 15 Apr 2021 00:49:19 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [6/6] Fix sh_css.c brace coding style issues
Date:   Wed, 14 Apr 2021 20:51:03 -0400
Message-Id: <20210415005106.530914-7-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
References: <20210415005106.530914-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix brace coding style issues.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 30 ++++++++++------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 0c9324684076..bb752d47457c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2161,10 +2161,10 @@ static const struct ia_css_yuvpp_settings yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
 static int
 init_pipe_defaults(enum ia_css_pipe_mode mode,
 		   struct ia_css_pipe *pipe,
-		   bool copy_pipe) {
+		   bool copy_pipe)
+{
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_ERROR("NULL pipe parameter");
 		return -EINVAL;
 	}
@@ -2173,18 +2173,17 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 	memcpy(pipe, &default_pipe, sizeof(default_pipe));
 
 	/* TODO: JB should not be needed, but temporary backward reference */
-	switch (mode)
-	{
+	switch (mode) {
 	case IA_CSS_PIPE_MODE_PREVIEW:
 		pipe->mode = IA_CSS_PIPE_ID_PREVIEW;
 		memcpy(&pipe->pipe_settings.preview, &preview, sizeof(preview));
 		break;
 	case IA_CSS_PIPE_MODE_CAPTURE:
-		if (copy_pipe) {
+		if (copy_pipe)
 			pipe->mode = IA_CSS_PIPE_ID_COPY;
-		} else {
+		else
 			pipe->mode = IA_CSS_PIPE_ID_CAPTURE;
-		}
+
 		memcpy(&pipe->pipe_settings.capture, &capture, sizeof(capture));
 		break;
 	case IA_CSS_PIPE_MODE_VIDEO:
@@ -2214,27 +2213,25 @@ pipe_global_init(void)
 	u8 i;
 
 	my_css.pipe_counter = 0;
-	for (i = 0; i < IA_CSS_PIPELINE_NUM_MAX; i++) {
+	for (i = 0; i < IA_CSS_PIPELINE_NUM_MAX; i++)
 		my_css.all_pipes[i] = NULL;
-	}
 }
 
 static int
 pipe_generate_pipe_num(const struct ia_css_pipe *pipe,
-		       unsigned int *pipe_number) {
+		       unsigned int *pipe_number)
+{
 	const u8 INVALID_PIPE_NUM = (uint8_t)~(0);
 	u8 pipe_num = INVALID_PIPE_NUM;
 	u8 i;
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_ERROR("NULL pipe parameter");
 		return -EINVAL;
 	}
 
 	/* Assign a new pipe_num .... search for empty place */
-	for (i = 0; i < IA_CSS_PIPELINE_NUM_MAX; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPELINE_NUM_MAX; i++) {
 		if (!my_css.all_pipes[i]) {
 			/*position is reserved */
 			my_css.all_pipes[i] = (struct ia_css_pipe *)pipe;
@@ -2242,8 +2239,7 @@ pipe_generate_pipe_num(const struct ia_css_pipe *pipe,
 			break;
 		}
 	}
-	if (pipe_num == INVALID_PIPE_NUM)
-	{
+	if (pipe_num == INVALID_PIPE_NUM) {
 		/* Max number of pipes already allocated */
 		IA_CSS_ERROR("Max number of pipes already created");
 		return -ENOSPC;
-- 
2.31.1

