Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F40835FF0B
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhDOAti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:38 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58635 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhDOAtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:36 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2828320009;
        Thu, 15 Apr 2021 00:49:11 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [3/6] Fix sh_css.c brace coding style issues
Date:   Wed, 14 Apr 2021 20:51:00 -0400
Message-Id: <20210415005106.530914-4-vrzh@vrzh.net>
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
 drivers/staging/media/atomisp/pci/sh_css.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 7c93fe911d0d..e631944fb6cd 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1806,7 +1806,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 }
 
 int
-ia_css_enable_isys_event_queue(bool enable) {
+ia_css_enable_isys_event_queue(bool enable)
+{
 	if (sh_css_sp_is_running())
 		return -EBUSY;
 	sh_css_sp_enable_isys_event_queue(enable);
@@ -1827,7 +1828,8 @@ sh_css_flush(struct ia_css_acc_fw *fw)
  * doing it from stream_create since we could run out of sp threads due to
  * allocation on inactive pipelines. */
 static int
-map_sp_threads(struct ia_css_stream *stream, bool map) {
+map_sp_threads(struct ia_css_stream *stream, bool map)
+{
 	struct ia_css_pipe *main_pipe = NULL;
 	struct ia_css_pipe *copy_pipe = NULL;
 	struct ia_css_pipe *capture_pipe = NULL;
@@ -1839,8 +1841,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map) {
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
 			     stream, map ? "true" : "false");
 
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -1850,8 +1851,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map) {
 
 	ia_css_pipeline_map(main_pipe->pipe_num, map);
 
-	switch (pipe_id)
-	{
+	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		copy_pipe    = main_pipe->pipe_settings.preview.copy_pipe;
 		capture_pipe = main_pipe->pipe_settings.preview.capture_pipe;
@@ -1870,23 +1870,17 @@ map_sp_threads(struct ia_css_stream *stream, bool map) {
 	}
 
 	if (acc_pipe)
-	{
 		ia_css_pipeline_map(acc_pipe->pipe_num, map);
-	}
 
 	if (capture_pipe)
-	{
 		ia_css_pipeline_map(capture_pipe->pipe_num, map);
-	}
 
 	/* Firmware expects copy pipe to be the last pipe mapped. (if needed) */
 	if (copy_pipe)
-	{
 		ia_css_pipeline_map(copy_pipe->pipe_num, map);
-	}
+
 	/* DH regular multi pipe - not continuous mode: map the next pipes too */
-	if (!stream->config.continuous)
-	{
+	if (!stream->config.continuous) {
 		int i;
 
 		for (i = 1; i < stream->num_pipes; i++)
-- 
2.31.1

