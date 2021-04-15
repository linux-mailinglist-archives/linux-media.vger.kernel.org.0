Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C9635FF0D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhDOAtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47853 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhDOAtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:41 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5B9D220007;
        Thu, 15 Apr 2021 00:49:17 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [5/6] Fix sh_css.c brace coding style issues
Date:   Wed, 14 Apr 2021 20:51:02 -0400
Message-Id: <20210415005106.530914-6-vrzh@vrzh.net>
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
 drivers/staging/media/atomisp/pci/sh_css.c | 30 ++++++++--------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 03b3b11671a5..0c9324684076 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1996,7 +1996,8 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 /* creates a host pipeline for all pipes in a stream. Called during
  * stream_start. */
 static int
-create_host_pipeline(struct ia_css_stream *stream) {
+create_host_pipeline(struct ia_css_stream *stream)
+{
 	struct ia_css_pipe *copy_pipe = NULL, *capture_pipe = NULL;
 	struct ia_css_pipe *acc_pipe = NULL;
 	enum ia_css_pipe_id pipe_id;
@@ -2005,8 +2006,7 @@ create_host_pipeline(struct ia_css_stream *stream) {
 	unsigned int max_input_width = 0;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -2017,8 +2017,7 @@ create_host_pipeline(struct ia_css_stream *stream) {
 	/* No continuous frame allocation for capture pipe. It uses the
 	 * "main" pipe's frames. */
 	if ((pipe_id == IA_CSS_PIPE_ID_PREVIEW) ||
-	    (pipe_id == IA_CSS_PIPE_ID_VIDEO))
-	{
+	    (pipe_id == IA_CSS_PIPE_ID_VIDEO)) {
 		/* About pipe_id == IA_CSS_PIPE_ID_PREVIEW && stream->config.mode != IA_CSS_INPUT_MODE_MEMORY:
 		 * The original condition pipe_id == IA_CSS_PIPE_ID_PREVIEW is too strong. E.g. in SkyCam (with memory
 		 * based input frames) there is no continuous mode and thus no need for allocated continuous frames
@@ -2036,24 +2035,21 @@ create_host_pipeline(struct ia_css_stream *stream) {
 
 #if !defined(ISP2401)
 	/* old isys: need to allocate_mipi_frames() even in IA_CSS_PIPE_MODE_COPY */
-	if (pipe_id != IA_CSS_PIPE_ID_ACC)
-	{
+	if (pipe_id != IA_CSS_PIPE_ID_ACC) {
 		err = allocate_mipi_frames(main_pipe, &stream->info);
 		if (err)
 			goto ERR;
 	}
 #elif defined(ISP2401)
 	if ((pipe_id != IA_CSS_PIPE_ID_ACC) &&
-	    (main_pipe->config.mode != IA_CSS_PIPE_MODE_COPY))
-	{
+	    (main_pipe->config.mode != IA_CSS_PIPE_MODE_COPY)) {
 		err = allocate_mipi_frames(main_pipe, &stream->info);
 		if (err)
 			goto ERR;
 	}
 #endif
 
-	switch (pipe_id)
-	{
+	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		copy_pipe    = main_pipe->pipe_settings.preview.copy_pipe;
 		capture_pipe = main_pipe->pipe_settings.preview.capture_pipe;
@@ -2103,31 +2099,27 @@ create_host_pipeline(struct ia_css_stream *stream) {
 	if (err)
 		goto ERR;
 
-	if (copy_pipe)
-	{
+	if (copy_pipe) {
 		err = create_host_copy_pipeline(copy_pipe, max_input_width,
 						main_pipe->continuous_frames[0]);
 		if (err)
 			goto ERR;
 	}
 
-	if (capture_pipe)
-	{
+	if (capture_pipe) {
 		err = create_host_capture_pipeline(capture_pipe);
 		if (err)
 			goto ERR;
 	}
 
-	if (acc_pipe)
-	{
+	if (acc_pipe) {
 		err = create_host_acc_pipeline(acc_pipe);
 		if (err)
 			goto ERR;
 	}
 
 	/* DH regular multi pipe - not continuous mode: create the next pipelines too */
-	if (!stream->config.continuous)
-	{
+	if (!stream->config.continuous) {
 		int i;
 
 		for (i = 1; i < stream->num_pipes && 0 == err; i++) {
-- 
2.31.1

