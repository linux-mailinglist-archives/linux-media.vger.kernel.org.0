Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864A127FE36
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 13:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbgJALRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 07:17:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731243AbgJALRS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 07:17:18 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D2D0208B6;
        Thu,  1 Oct 2020 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601551037;
        bh=o3EbE74hz2T8t1GJ/NdLtSBGVB6g4WdhQQVmKWNfpZY=;
        h=From:To:Cc:Subject:Date:From;
        b=V5xs9xV77aOCb/iYqYip/P17aEWk/SN/EmNWCdAQiLD7aon559p1jIPlWNgA/SNnn
         0nhQzzDe7A0ogPn269L8XSWlu+TrhNV7pjN9TUhhPTpTKpxaI9VYmE1F0wpl41YDqv
         1ZNXk/07+hz86huloLxUApOKjogj6AWbZcYp730A=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNwaI-006Odu-9I; Thu, 01 Oct 2020 13:17:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3] media: atomisp: fixes build breakage for ISP2400 due to a cleanup
Date:   Thu,  1 Oct 2020 13:17:13 +0200
Message-Id: <490e5002c3fea266524c31e1a94853dca9c3286c.1601551027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A temporary var needed for building with ISP2400 was removed
by accident on a cleanup patch.

Fix the breakage.

Fixes: 852a53a02cf0 ("media: atomisp: get rid of unused vars")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e8c5caf3dfe6..ddee04c8248d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1365,7 +1365,6 @@ start_binary(struct ia_css_pipe *pipe,
 {
 	assert(pipe);
 	/* Acceleration uses firmware, the binary thus can be NULL */
-	/* assert(binary != NULL); */
 
 	if (binary)
 		sh_css_metrics_start_binary(&binary->metrics);
@@ -1381,10 +1380,10 @@ start_binary(struct ia_css_pipe *pipe,
 #endif
 
 #if !defined(ISP2401)
-	if (stream->reconfigure_css_rx) {
+	if (pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
 					 pipe->stream->config.mode);
-		stream->reconfigure_css_rx = false;
+		pipe->stream->reconfigure_css_rx = false;
 	}
 #endif
 }
@@ -2820,6 +2819,8 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	bool need_isp_copy_binary = false;
 #ifdef ISP2401
 	bool sensor = false;
+#else
+	bool continuous;
 #endif
 	/* preview only have 1 output pin now */
 	struct ia_css_frame_info *pipe_out_info = &pipe->output_info[0];
@@ -2833,6 +2834,8 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	online = pipe->stream->config.online;
 #ifdef ISP2401
 	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
+#else
+	continuous = pipe->stream->config.continuous;
 #endif
 
 	if (mycs->preview_binary.info)
@@ -5987,6 +5990,8 @@ static int load_primary_binaries(
 	bool need_ldc = false;
 #ifdef ISP2401
 	bool sensor = false;
+#else
+	bool memory, continuous;
 #endif
 	struct ia_css_frame_info prim_in_info,
 		       prim_out_info,
@@ -6009,6 +6014,9 @@ static int load_primary_binaries(
 	online = pipe->stream->config.online;
 #ifdef ISP2401
 	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
+#else
+	memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
+	continuous = pipe->stream->config.continuous;
 #endif
 
 	mycs = &pipe->pipe_settings.capture;
-- 
2.26.2

