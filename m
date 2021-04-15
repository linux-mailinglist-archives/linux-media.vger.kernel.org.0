Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0D635FF0C
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhDOAtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56869 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhDOAtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:39 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1577E20002;
        Thu, 15 Apr 2021 00:49:14 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [4/6] Fix sh_css.c brace coding style issues
Date:   Wed, 14 Apr 2021 20:51:01 -0400
Message-Id: <20210415005106.530914-5-vrzh@vrzh.net>
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
 drivers/staging/media/atomisp/pci/sh_css.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e631944fb6cd..03b3b11671a5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1894,7 +1894,8 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 /* creates a host pipeline skeleton for all pipes in a stream. Called during
  * stream_create. */
 static int
-create_host_pipeline_structure(struct ia_css_stream *stream) {
+create_host_pipeline_structure(struct ia_css_stream *stream)
+{
 	struct ia_css_pipe *copy_pipe = NULL, *capture_pipe = NULL;
 	struct ia_css_pipe *acc_pipe = NULL;
 	enum ia_css_pipe_id pipe_id;
@@ -1906,24 +1907,21 @@ create_host_pipeline_structure(struct ia_css_stream *stream) {
 	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
 
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 
 	main_pipe	= stream->last_pipe;
 	assert(main_pipe);
-	if (!main_pipe)
-	{
+	if (!main_pipe) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 
 	pipe_id	= main_pipe->mode;
 
-	switch (pipe_id)
-	{
+	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		copy_pipe    = main_pipe->pipe_settings.preview.copy_pipe;
 		copy_pipe_delay = main_pipe->dvs_frame_delay;
@@ -1963,30 +1961,23 @@ create_host_pipeline_structure(struct ia_css_stream *stream) {
 	}
 
 	if (!(err) && copy_pipe)
-	{
 		err = ia_css_pipeline_create(&copy_pipe->pipeline,
 					     copy_pipe->mode,
 					     copy_pipe->pipe_num,
 					     copy_pipe_delay);
-	}
 
 	if (!(err) && capture_pipe)
-	{
 		err = ia_css_pipeline_create(&capture_pipe->pipeline,
 					     capture_pipe->mode,
 					     capture_pipe->pipe_num,
 					     capture_pipe_delay);
-	}
 
 	if (!(err) && acc_pipe)
-	{
 		err = ia_css_pipeline_create(&acc_pipe->pipeline, acc_pipe->mode,
 					     acc_pipe->pipe_num, main_pipe->dvs_frame_delay);
-	}
 
 	/* DH regular multi pipe - not continuous mode: create the next pipelines too */
-	if (!stream->config.continuous)
-	{
+	if (!stream->config.continuous) {
 		int i;
 
 		for (i = 1; i < stream->num_pipes && 0 == err; i++) {
-- 
2.31.1

