Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7870435FF11
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhDOAtz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:55 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33939 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhDOAtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:53 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5A27220004;
        Thu, 15 Apr 2021 00:49:29 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [2/2] Remove redundant assertions in sh_css.c
Date:   Wed, 14 Apr 2021 20:51:06 -0400
Message-Id: <20210415005106.530914-10-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
References: <20210415005106.530914-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove assert() in places where the condition is already handled.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index aebecf650967..634e7911d87f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1829,7 +1829,6 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	int err = 0;
 	enum ia_css_pipe_id pipe_id;
 
-	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
 			     stream, map ? "true" : "false");
 
@@ -1896,7 +1895,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 	unsigned int copy_pipe_delay = 0,
 	capture_pipe_delay = 0;
 
-	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
 
 	if (!stream) {
@@ -1905,7 +1903,6 @@ create_host_pipeline_structure(struct ia_css_stream *stream)
 	}
 
 	main_pipe	= stream->last_pipe;
-	assert(main_pipe);
 	if (!main_pipe) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
@@ -2309,7 +2306,6 @@ static void sh_css_pipe_free_acc_binaries(
 	struct ia_css_pipeline *pipeline;
 	struct ia_css_pipeline_stage *stage;
 
-	assert(pipe);
 	if (!pipe) {
 		IA_CSS_ERROR("NULL input pointer");
 		return;
-- 
2.31.1

