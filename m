Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE274530B1
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbhKPLcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:35214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235046AbhKPLca (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A93A463214;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=w1Oh57VTXacjdF95neV/28695ca59OqlfX1MdvU6ZwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DT7hfPOrvgV/CHu/82PDkIwUY+9NUdhjFUMBkZBN1B0DeOpmPyB191YNV7VDknnhu
         n4VYXFTKVF1EY067JSgRjIFWCtt5HGphxzP1gUQHcB9n/jbQyfaMbt5H2DQ6LhzGjQ
         K4e+yZpk9ci13JtgS4GZkOM+0Y7Y8JzE7XZCnqvDIhKB5lsOujkipiLMMrluoJC/OY
         CX69I9aZoDURzxPadbxpxE+efOnMEWA/L3avtzJHRYYJZ39co6O+wrqUfcfsoH83Dt
         OvQFdHw+R84+bANhv8frU1XLvV7KgpSomqvbiPuKv0J1W5sdXvh9iT6DJuQx2JqMBi
         QjDCG6okN0mgg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qg4-Md; Tue, 16 Nov 2021 11:29:05 +0000
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
Subject: [PATCH 20/23] media: atomisp: drop check_pipe_resolutions() logic
Date:   Tue, 16 Nov 2021 11:29:01 +0000
Message-Id: <e5b368d3a565fb3abcf12ebf834bf2c9944eab90.1637061474.git.mchehab+huawei@kernel.org>
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

Such function doesn't exist on Intel Aero driver. As we're using
its firmware, it may mean that this is not compatible with the
current file. So, drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6970cf8a5dfe..12dfecbb6145 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -208,8 +208,6 @@ ia_css_pipe_check_format(struct ia_css_pipe *pipe,
 
 /* ISP 2401 */
 static int
-check_pipe_resolutions(const struct ia_css_pipe *pipe);
-
 static int
 ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
 			   struct ia_css_fw_info *firmware);
@@ -8689,49 +8687,6 @@ metadata_info_init(const struct ia_css_metadata_config *mdc,
 	return 0;
 }
 
-/* ISP2401 */
-static int check_pipe_resolutions(const struct ia_css_pipe *pipe)
-{
-	int err = 0;
-
-	IA_CSS_ENTER_PRIVATE("");
-
-	if (!pipe || !pipe->stream) {
-		IA_CSS_ERROR("null arguments");
-		err = -EINVAL;
-		goto EXIT;
-	}
-
-	if (ia_css_util_check_res(pipe->config.input_effective_res.width,
-				  pipe->config.input_effective_res.height) != 0) {
-		IA_CSS_ERROR("effective resolution not supported");
-		err = -EINVAL;
-		goto EXIT;
-	}
-	if (!ia_css_util_resolution_is_zero(
-		pipe->stream->config.input_config.input_res)) {
-		if (!ia_css_util_res_leq(pipe->config.input_effective_res,
-					 pipe->stream->config.input_config.input_res)) {
-			IA_CSS_ERROR("effective resolution is larger than input resolution");
-			err = -EINVAL;
-			goto EXIT;
-		}
-	}
-	if (!ia_css_util_resolution_is_even(pipe->config.output_info[0].res)) {
-		IA_CSS_ERROR("output resolution must be even");
-		err = -EINVAL;
-		goto EXIT;
-	}
-	if (!ia_css_util_resolution_is_even(pipe->config.vf_output_info[0].res)) {
-		IA_CSS_ERROR("VF resolution must be even");
-		err = -EINVAL;
-		goto EXIT;
-	}
-EXIT:
-	IA_CSS_LEAVE_ERR_PRIVATE(err);
-	return err;
-}
-
 int
 ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		     int num_pipes,
@@ -8941,17 +8896,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			   effective_res.height);
 	}
 
-	if (IS_ISP2401) {
-		for (i = 0; i < num_pipes; i++) {
-			if (pipes[i]->config.mode != IA_CSS_PIPE_MODE_ACC &&
-			    pipes[i]->config.mode != IA_CSS_PIPE_MODE_COPY) {
-				err = check_pipe_resolutions(pipes[i]);
-				if (err)
-					goto ERR;
-			}
-		}
-	}
-
 	err = ia_css_stream_isp_parameters_init(curr_stream);
 	if (err)
 		goto ERR;
-- 
2.33.1

