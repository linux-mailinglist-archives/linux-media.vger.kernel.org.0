Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E194530AB
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhKPLcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:35168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234927AbhKPLcY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7281761B51;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=gWp7Q5OcUMbSrjA+glZBbTwuIwaxNfe2bcpzG3cOVCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cv7FEYP+1nvzx/kKLe67UukYPs3r3VEOlT2ICQCCgSG/vMIKupsWBZ4TU6+JKMb30
         mFfmXIuCB/eTGYhvfMOX83JOWVrEwRom2PEHT0Qch5q/xyd86x4Pd+62SP80aGG0ph
         6SkqLbSvVvRGRbrtrveiOC2dBVNyOf1idaaxoyaFdq4YYSyqMNvlI1TtVktzMlkm6z
         M/G1jc4dxRNrVJHANto+0ANUv2veacDN+vBQoRenDvWZ2SaUVlIcx9lqU6KDS9+2MJ
         8/howmFBpIA2k85GuwaFeSZaHlMfpMC0z5oNGQcgdNpUNtI+LNSAyAicdbOj3EBrah
         Muc2cFYZzA3Tg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfO-EU; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 06/23] media: atomisp: Avoid some {} just to define new vars
Date:   Tue, 16 Nov 2021 11:28:47 +0000
Message-Id: <36eeb875621908a8304940c79d52f7ece969b24b.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a couple of places where {} are used just to
define a new var. Just move the var to the top of the function
and get rid of that ugly blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 51 +++++++++-------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 5ee777909cce..ac3519d08971 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3884,6 +3884,7 @@ preview_start(struct ia_css_pipe *pipe)
 	enum ia_css_input_mode preview_pipe_input_mode;
 	const struct ia_css_coordinate *coord = NULL;
 	const struct ia_css_isp_parameters *params = NULL;
+	unsigned int thread_id;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW)) {
@@ -3907,17 +3908,13 @@ preview_start(struct ia_css_pipe *pipe)
 	}
 	send_raw_frames(pipe);
 
-	{
-		unsigned int thread_id;
+	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
+	copy_ovrd = 1 << thread_id;
 
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		copy_ovrd = 1 << thread_id;
-
-		if (pipe->stream->cont_capt) {
-			ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
-							 &thread_id);
-			copy_ovrd |= 1 << thread_id;
-		}
+	if (pipe->stream->cont_capt) {
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
+						    &thread_id);
+		copy_ovrd |= 1 << thread_id;
 	}
 
 	if (IS_ISP2401) {
@@ -5653,9 +5650,9 @@ static int video_start(struct ia_css_pipe *pipe)
 	struct ia_css_pipe *copy_pipe, *capture_pipe;
 	enum sh_css_pipe_config_override copy_ovrd;
 	enum ia_css_input_mode video_pipe_input_mode;
-
 	const struct ia_css_coordinate *coord = NULL;
 	const struct ia_css_isp_parameters *params = NULL;
+	unsigned int thread_id;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_VIDEO)) {
@@ -5677,17 +5674,14 @@ static int video_start(struct ia_css_pipe *pipe)
 		return err;
 
 	send_raw_frames(pipe);
-	{
-		unsigned int thread_id;
 
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		copy_ovrd = 1 << thread_id;
+	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
+	copy_ovrd = 1 << thread_id;
 
-		if (pipe->stream->cont_capt) {
-			ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
-							 &thread_id);
-			copy_ovrd |= 1 << thread_id;
-		}
+	if (pipe->stream->cont_capt) {
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
+						    &thread_id);
+		copy_ovrd |= 1 << thread_id;
 	}
 
 	if (IS_ISP2401) {
@@ -7254,6 +7248,7 @@ static int yuvpp_start(struct ia_css_pipe *pipe)
 	int err = 0;
 	enum sh_css_pipe_config_override copy_ovrd;
 	enum ia_css_input_mode yuvpp_pipe_input_mode;
+	unsigned int thread_id;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP)) {
@@ -7273,12 +7268,8 @@ static int yuvpp_start(struct ia_css_pipe *pipe)
 		return err;
 	}
 
-	{
-		unsigned int thread_id;
-
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		copy_ovrd = 1 << thread_id;
-	}
+	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
+	copy_ovrd = 1 << thread_id;
 
 	start_pipe(pipe, copy_ovrd, yuvpp_pipe_input_mode);
 
@@ -8105,6 +8096,7 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe)
 static int capture_start(struct ia_css_pipe *pipe)
 {
 	struct ia_css_pipeline *me;
+	unsigned int thread_id;
 
 	int err = 0;
 	enum sh_css_pipe_config_override copy_ovrd;
@@ -8145,12 +8137,9 @@ static int capture_start(struct ia_css_pipe *pipe)
 
 #endif
 
-	{
-		unsigned int thread_id;
+	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
+	copy_ovrd = 1 << thread_id;
 
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		copy_ovrd = 1 << thread_id;
-	}
 	start_pipe(pipe, copy_ovrd, pipe->stream->config.mode);
 
 #if !defined(ISP2401)
-- 
2.33.1

