Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A99454DF7
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240498AbhKQThU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:45524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240505AbhKQThL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBE7C619EA;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=i6aP5rHRDCCIn0Srp0166OAoh5DYEbg9Es0lWfq+sFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pSYuJpUo6MG8GAVVHwGg4P27QJn2xq/Qf0nkz/wh0Rqe4/yi2UT62TgpBx850BS6G
         xSEERGp1b22b5wEbHmMixldLMUl7tGv3zYXRWuweXCNoF3WklkIbE+HVrk5JWjZIM7
         rSaZM3X0g5Ydtzmz1zJheSg1rAX/LQYtNxY549C/MfEBrqCldL9pjeh1/h+bGmnVQK
         YsULrfPnNS+fbV1E4j+I5KpjLgzYOgVMJQc3AjmYm7wFPskmSdEmZHPHMyGtEdHbTh
         R/khvlQ2lwny+bLXCnrUJfrF64tvNYv8DLxaZDAGPlZMEFX+OhDx5P/Lww3w0j8ZQe
         H9ynSOrkezNMQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHo-3l; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 5/8] media: atomisp: pipe_binarydesc: drop logic incompatible with firmware
Date:   Wed, 17 Nov 2021 19:34:03 +0000
Message-Id: <d50d43616f100f42637a1c7ee9f710c0402643d6.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we're using this firmware for ISP2401:
	https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

Revert some changes that are not compatible with it, making
the code close to the Intel Aero one.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 .../pci/camera/pipe/src/pipe_binarydesc.c      | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
index d09cc486e33e..7dd0e4a53c8b 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
@@ -601,16 +601,9 @@ void ia_css_pipe_get_primary_binarydesc(
 		 * since it has better performance. */
 		if (pipe_version == IA_CSS_PIPE_VERSION_2_6_1)
 			prim_descr->striped = false;
-		else if (!IS_ISP2401) {
+		else
 			prim_descr->striped = prim_descr->continuous &&
 					      (!pipe->stream->stop_copy_preview || !pipe->stream->disable_cont_vf);
-		} else {
-			prim_descr->striped = prim_descr->continuous && !pipe->stream->disable_cont_vf;
-
-			if ((pipe->config.default_capture_config.enable_xnr != 0) &&
-			    (pipe->extra_config.enable_dvs_6axis == true))
-				prim_descr->enable_xnr = true;
-		}
 	}
 	IA_CSS_LEAVE_PRIVATE("");
 }
@@ -842,14 +835,7 @@ void ia_css_pipe_get_ldc_binarydesc(
 	assert(out_info);
 	IA_CSS_ENTER_PRIVATE("");
 
-	if (!IS_ISP2401) {
-		*in_info = *out_info;
-	} else {
-		if (pipe->out_yuv_ds_input_info.res.width)
-			*in_info = pipe->out_yuv_ds_input_info;
-		else
-			*in_info = *out_info;
-	}
+	*in_info = *out_info;
 
 	in_info->format = IA_CSS_FRAME_FORMAT_YUV420;
 	in_info->raw_bit_depth = 0;
-- 
2.33.1

