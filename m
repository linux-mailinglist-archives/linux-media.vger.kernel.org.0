Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34541E8854
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgE2UBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:01:00 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:58941 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgE2UAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:53 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M3DBb-1jhmNw1fMT-003eXf; Fri, 29 May 2020 22:00:41 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/9] staging: media: atomisp: fix stack overflow in init_pipe_defaults()
Date:   Fri, 29 May 2020 22:00:27 +0200
Message-Id: <20200529200031.4117841-5-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wk4aB6MB00HUMVI+PYXcoWnTJNhnYs2ponKtL4wBtBdX22cXjgZ
 cvDEYQEE0jdp0PzAw1NnhAANObZJYZx66+ho+dnWHC/ntmEbSOUmZkVOSlDcuxxfyyL4EnW
 h+EsvNNql1wk/wHzjkKnkLA49hsQHOP2G+78bJqKVpWeK1kNTboHWRnAWXT0xaTFepXoz1p
 /68vvxlr9qXaVqtW/W8Ng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cEIkal2MfGw=:iht7TijDHt9uBvmEBeBzzO
 NRoZ2I+UaILlON0VhkyILDdZdVAeYsdOBmdkbUu6J8KMdPxs1SrVxaxFMhM65np7X2WFbw2fE
 KXWnQgafjvwVc9svljOjljkBrzSkfb7YCoeA/y7Wjypp5OkVH2yPA0Ocwi7fi2rBx8P9GSgjr
 bwaLz+WZ+ihLTKqqX+j6JILpT7BjXsITBM7x9XlNWRuy/mYOeaYuU9e77PrxHQd5y6EPq+Hog
 fkGRvl9/F7LOeM8Q+Fs9X4N6oi6qfWhi//XBJaMROVwOADJ6Y9ySYSGqpTqAbDOcSXLjUN6jF
 PnFYr7uDe7v7V5xR+XovMifYqcZltJPXnZAv5atK5c+jblTNrFkHhZK7FacrSgHnYzkA+mgAc
 ozkXfgvWzMjZ0euQUF195orFRGf+Gfsjtzc+CXR5d/tuwifue+9o5duiQTiU01y9sr08m69cK
 Q98y74OE6HZgl5pCQIA9DhdIdRp5tnbI8Tv5zmxxhO2LyQdUUsHpU6ylOC6eRvAUP3r2zvSoA
 7SCLpkntCSsMsC6UfRc7KJ2uao2y6R6pOTp6OwDvwGjMuZIIICO2uTmZaMnvN1SZHI9e63tpS
 Ebxh183FdfB/2dAMxfqMuywes1oiyfhoi9xZs8mkulu1/hp5bs8dYPSRlkjZ4IK8/8ZEr+JzL
 R2n4lJK0Eeq0c4jSWLpGjdOf8Fzzp6bK69E6H3gFZkB42zNx+fVMxKbZ9KF8nleyThKuA6egp
 juWxF9Jqs//MoOZsM0WutmlplLpnH5J5rxPr6f3mbDK6jlpy7vSNR/hNzz+vBUwonY2TcSeAS
 wtA575qzX3sJer6IJc7mN7JxseFnNs1YrZmXbA6bHfBgceXtjg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When building with clang, multiple copies of the structures to be
initialized are passed around on the stack and copied locally, using an
insane amount of stack space:

drivers/staging/media/atomisp/pci/sh_css.c:2371:1: error: stack frame size of 26864 bytes in function 'create_pipe' [-Werror,-Wframe-larger-than=]

Use constantly-allocated variables plus an explicit memcpy()
to avoid that.

Fixes: 6dc9a2568f84 ("media: atomisp: convert default struct values to use compound-literals with designated initializers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index e91c6029c651..1e8b9d637116 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2264,6 +2264,12 @@ static enum ia_css_err
 init_pipe_defaults(enum ia_css_pipe_mode mode,
 		   struct ia_css_pipe *pipe,
 		   bool copy_pipe) {
+	static const struct ia_css_pipe default_pipe = IA_CSS_DEFAULT_PIPE;
+	static const struct ia_css_preview_settings preview = IA_CSS_DEFAULT_PREVIEW_SETTINGS;
+	static const struct ia_css_capture_settings capture = IA_CSS_DEFAULT_CAPTURE_SETTINGS;
+	static const struct ia_css_video_settings video = IA_CSS_DEFAULT_VIDEO_SETTINGS;
+	static const struct ia_css_yuvpp_settings yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
+
 	if (!pipe)
 	{
 		IA_CSS_ERROR("NULL pipe parameter");
@@ -2271,14 +2277,14 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 	}
 
 	/* Initialize pipe to pre-defined defaults */
-	*pipe = IA_CSS_DEFAULT_PIPE;
+	memcpy(pipe, &default_pipe, sizeof(default_pipe));
 
 	/* TODO: JB should not be needed, but temporary backward reference */
 	switch (mode)
 	{
 	case IA_CSS_PIPE_MODE_PREVIEW:
 		pipe->mode = IA_CSS_PIPE_ID_PREVIEW;
-		pipe->pipe_settings.preview = IA_CSS_DEFAULT_PREVIEW_SETTINGS;
+		memcpy(&pipe->pipe_settings.preview, &preview, sizeof(preview));
 		break;
 	case IA_CSS_PIPE_MODE_CAPTURE:
 		if (copy_pipe) {
@@ -2286,11 +2292,11 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 		} else {
 			pipe->mode = IA_CSS_PIPE_ID_CAPTURE;
 		}
-		pipe->pipe_settings.capture = IA_CSS_DEFAULT_CAPTURE_SETTINGS;
+		memcpy(&pipe->pipe_settings.capture, &capture, sizeof(capture));
 		break;
 	case IA_CSS_PIPE_MODE_VIDEO:
 		pipe->mode = IA_CSS_PIPE_ID_VIDEO;
-		pipe->pipe_settings.video = IA_CSS_DEFAULT_VIDEO_SETTINGS;
+		memcpy(&pipe->pipe_settings.video, &video, sizeof(video));
 		break;
 	case IA_CSS_PIPE_MODE_ACC:
 		pipe->mode = IA_CSS_PIPE_ID_ACC;
@@ -2300,7 +2306,7 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 		break;
 	case IA_CSS_PIPE_MODE_YUVPP:
 		pipe->mode = IA_CSS_PIPE_ID_YUVPP;
-		pipe->pipe_settings.yuvpp = IA_CSS_DEFAULT_YUVPP_SETTINGS;
+		memcpy(&pipe->pipe_settings.yuvpp, &yuvpp, sizeof(yuvpp));
 		break;
 	default:
 		return IA_CSS_ERR_INVALID_ARGUMENTS;
-- 
2.26.2

