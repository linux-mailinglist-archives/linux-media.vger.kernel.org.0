Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D692B364A7A
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241682AbhDSTXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:23:44 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45763 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239503AbhDSTXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:23:43 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D6DBD60008;
        Mon, 19 Apr 2021 19:23:11 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/8] staging: media: atomisp: Remove all redundant assertions in sh_css.c
Date:   Mon, 19 Apr 2021 15:25:56 -0400
Message-Id: <20210419192602.498815-3-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192602.498815-1-vrzh@vrzh.net>
References: <20210419192602.498815-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the remainder of assert() in places where the condition is
already handled.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ac748da7a7ef..8484c83ad29f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4119,9 +4119,6 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	/* TODO: change next to correct pool for optimization */
 	ia_css_rmgr_acq_vbuf(hmm_buffer_pool, &h_vbuf);
 
-	assert(h_vbuf);
-	assert(h_vbuf->vptr != 0x0);
-
 	if ((!h_vbuf) || (h_vbuf->vptr == 0x0)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
@@ -4921,7 +4918,6 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 	enum ia_css_pipe_id main_pipe_id;
 	int i;
 
-	assert(stream);
 	if (!stream) {
 		IA_CSS_LOG("stream does NOT exist!");
 		err = -EINVAL;
@@ -4929,7 +4925,6 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 	}
 
 	main_pipe = stream->last_pipe;
-	assert(main_pipe);
 	if (!main_pipe) {
 		IA_CSS_LOG("main_pipe does NOT exist!");
 		err = -EINVAL;
@@ -4987,7 +4982,6 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 			copy_pipe = main_pipe->pipe_settings.video.copy_pipe;
 
 		/* return the error code if "Copy Pipe" does NOT exist */
-		assert(copy_pipe);
 		if (!copy_pipe) {
 			IA_CSS_LOG("Copy Pipe does NOT exist!");
 			err = -EINVAL;
@@ -5022,7 +5016,6 @@ sh_css_pipes_have_stopped(struct ia_css_stream *stream)
 
 	int i;
 
-	assert(stream);
 	if (!stream) {
 		IA_CSS_LOG("stream does NOT exist!");
 		rval = false;
@@ -5030,7 +5023,6 @@ sh_css_pipes_have_stopped(struct ia_css_stream *stream)
 	}
 
 	main_pipe = stream->last_pipe;
-	assert(main_pipe);
 
 	if (!main_pipe) {
 		IA_CSS_LOG("main_pipe does NOT exist!");
@@ -5071,7 +5063,6 @@ sh_css_pipes_have_stopped(struct ia_css_stream *stream)
 			copy_pipe = main_pipe->pipe_settings.video.copy_pipe;
 
 		/* return if "Copy Pipe" does NOT exist */
-		assert(copy_pipe);
 		if (!copy_pipe) {
 			IA_CSS_LOG("Copy Pipe does NOT exist!");
 
@@ -8783,8 +8774,6 @@ ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_pipe_get_info()\n");
-
-	assert(pipe_info);
 	if (!pipe_info) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
 				    "ia_css_pipe_get_info: pipe_info cannot be NULL\n");
@@ -8923,7 +8912,6 @@ ia_css_acc_stream_create(struct ia_css_stream *stream)
 	int i;
 	int err = 0;
 
-	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
 
 	if (!stream) {
@@ -8934,7 +8922,6 @@ ia_css_acc_stream_create(struct ia_css_stream *stream)
 	for (i = 0;  i < stream->num_pipes; i++) {
 		struct ia_css_pipe *pipe = stream->pipes[i];
 
-		assert(pipe);
 		if (!pipe) {
 			IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 			return -EINVAL;
-- 
2.31.1

