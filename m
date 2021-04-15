Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4B6361441
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 23:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236136AbhDOVk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 17:40:26 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:37041 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhDOVk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 17:40:26 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8FE221C0009;
        Thu, 15 Apr 2021 21:40:00 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCHv2 2/2] staging: media: atomisp: Remove redundant assertions in sh_css.c
Date:   Thu, 15 Apr 2021 17:41:42 -0400
Message-Id: <20210415214142.38974-3-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415214142.38974-1-vrzh@vrzh.net>
References: <20210415214142.38974-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove assert() in places where the condition is already handled.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index bb752d47457c..01ce6005ead4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -413,7 +413,6 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 static void
 sh_css_pipe_free_shading_table(struct ia_css_pipe *pipe)
 {
-	assert(pipe);
 	if (!pipe) {
 		IA_CSS_ERROR("NULL input parameter");
 		return;
@@ -1080,7 +1079,6 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 		}
 	}
 
-	assert(pipe);
 	if (!pipe)
 		return -EINVAL;
 
@@ -1382,8 +1380,6 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 		 struct ia_css_frame *out_frame)
 {
 	(void)out_frame;
-	assert(pipe);
-	assert(pipe->stream);
 
 	if ((!pipe) || (!pipe->stream))
 		return -EINVAL;
@@ -1837,7 +1833,6 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	int err = 0;
 	enum ia_css_pipe_id pipe_id;
 
-	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
 			     stream, map ? "true" : "false");
 
@@ -1904,7 +1899,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 	unsigned int copy_pipe_delay = 0,
 	capture_pipe_delay = 0;
 
-	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
 
 	if (!stream) {
@@ -1913,7 +1907,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 	}
 
 	main_pipe	= stream->last_pipe;
-	assert(main_pipe);
 	if (!main_pipe) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
@@ -2317,7 +2310,6 @@ static void sh_css_pipe_free_acc_binaries(
 	struct ia_css_pipeline *pipeline;
 	struct ia_css_pipeline_stage *stage;
 
-	assert(pipe);
 	if (!pipe) {
 		IA_CSS_ERROR("NULL input pointer");
 		return;
-- 
2.31.1

