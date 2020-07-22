Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC35229AD2
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 16:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732685AbgGVO6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 10:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbgGVO6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 10:58:24 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8987FC0619DC;
        Wed, 22 Jul 2020 07:58:24 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n5so1396900pgf.7;
        Wed, 22 Jul 2020 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rgu9zeGviejGy94qeYWhRJ1bbRjnbZasOXc4G8oQ1bI=;
        b=tyQPpi/zMyDRImS8JXG4zlQJED6yn6PwaRxs8995TCC6A+iil5qrCnXX4Fj+t3+yD9
         tVSXtpTQWkDz2Zs6efB0LcsXvVty8E+TsZIfHIRqMs2tzGiWYNYyIc07GYRqlpZouc/a
         +ZtxF4VaWQ8anTj2KdsKEB6IPj+GiOo6GDCoVEWCSCZIKNoZw0h9X+f4zL6QoqH4dXuS
         B44wX/XCODUThAUuAaYBLADtPsPLpdVxrLJQcZfwIi8GbK6acU/3gj58sCJgTcWhQG7X
         IxXbM5BjZ3iMHTZS6++VWR+9XPIEIWhXz2ooyarBX3xzF8qJG4tERlHYZ0tkt+N1DOhm
         q5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rgu9zeGviejGy94qeYWhRJ1bbRjnbZasOXc4G8oQ1bI=;
        b=cWyvBia9gM/EB44a0n5EWaT86Y9Gzi4hxuL683ctLqJzpRPzQRAvUkmwbXQk2v8k1m
         /BRD2tUL+N9luBlwKxLltkhzEfrWgnJ42yQM3g/aloidCrTBndMUot5Y2842Z20qMRTK
         dLoe3xrIoKXlveHG5u2Q2Fq0PzHFFUdztac2m5gz7AFpa2t0EahNE+sLhuBYOD4s/w7+
         UiZ05K6WJLa1QBtDGLLxGFi4DCQUY9PWLlbmAuZosPqDSWJi9F7Y1mzAocr1T57IEn0G
         fVgOwbAhV2UYVgh9cUgAmkfs1VdmYGPI5A7Ex460u2fxrhoVQ95sOJ26malXi05UFWeq
         pExA==
X-Gm-Message-State: AOAM5317lc+d/ZBj0OFV7GmUOsb6dt5uDuS7HLhnkdrKZP619JBOLHC8
        yLDQ3fEce39qU3xaqgn/6FnrcFPgtW09+w==
X-Google-Smtp-Source: ABdhPJzjePhzyy8eV1LUj5gRxYGGMT6XU0BUo1Div4o1tRdGISWYu2QSSURGA9LTku1A89w5S74AFQ==
X-Received: by 2002:a63:be4e:: with SMTP id g14mr215565pgo.193.1595429903995;
        Wed, 22 Jul 2020 07:58:23 -0700 (PDT)
Received: from rahulg-ThinkPad-T450 ([122.175.125.202])
        by smtp.gmail.com with ESMTPSA id j5sm216214pgi.42.2020.07.22.07.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:58:23 -0700 (PDT)
Date:   Wed, 22 Jul 2020 20:28:19 +0530
From:   Rahul Gottipati <rahul.blr97@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: atomisp: Fix coding style issue - correct
 multiline comments
Message-ID: <f7973bfc099576423553660313cb5a3f7f28529f.1595429109.git.rahul.blr97@gmail.com>
References: <cover.1595429109.git.rahul.blr97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1595429109.git.rahul.blr97@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes some coding style issues of multiline comments to
correct a few checkpatch.pl warnings.

Signed-off-by: Rahul Gottipati <rahul.blr97@gmail.com>
---

Changes in v3:
	Made changes to keep first line blank in multiline comments.
Changes in v2:
	Distributed changes across 2 patches instead of the previous 1.

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 4fc4bdd85ce0..3d609753e0af 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1275,13 +1275,15 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 		}
 	}
 
-	/* Workaround: Due to the design of HALv3,
+	/*
+	 * Workaround: Due to the design of HALv3,
 	 * sometimes in ZSL or SDV mode HAL needs to
 	 * capture multiple images within one streaming cycle.
 	 * But the capture number cannot be determined by HAL.
 	 * So HAL only sets the capture number to be 1 and queue multiple
 	 * buffers. Atomisp driver needs to check this case and re-trigger
-	 * CSS to do capture when new buffer is queued. */
+	 * CSS to do capture when new buffer is queued.
+	 */
 	if (asd->continuous_mode->val &&
 	    atomisp_subdev_source_pad(vdev)
 	    == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE &&
@@ -1806,7 +1808,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		/*
 		 * set freq to max when streaming count > 1 which indicate
 		 * dual camera would run
-		*/
+		 */
 		if (atomisp_streaming_count(isp) > 1) {
 			if (atomisp_freq_scaling(isp,
 						 ATOMISP_DFS_MODE_MAX, false) < 0)
@@ -2437,8 +2439,10 @@ static int atomisp_g_ext_ctrls(struct file *file, void *fh,
 	struct v4l2_control ctrl;
 	int i, ret = 0;
 
-	/* input_lock is not need for the Camera related IOCTLs
-	 * The input_lock downgrade the FPS of 3A*/
+	/*
+	 * input_lock is not need for the Camera related IOCTLs
+	 * The input_lock downgrade the FPS of 3A
+	 */
 	ret = atomisp_camera_g_ext_ctrls(file, fh, c);
 	if (ret != -EINVAL)
 		return ret;
@@ -2520,8 +2524,10 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 				ret =
 				    v4l2_s_ctrl(NULL, isp->flash->ctrl_handler,
 						&ctrl);
-				/* When flash mode is changed we need to reset
-				 * flash state */
+				/*
+				 * When flash mode is changed we need to reset
+				 * flash state
+				 */
 				if (ctrl.id == V4L2_CID_FLASH_MODE) {
 					asd->params.flash_state =
 					    ATOMISP_FLASH_IDLE;
@@ -2559,8 +2565,10 @@ static int atomisp_s_ext_ctrls(struct file *file, void *fh,
 	struct v4l2_control ctrl;
 	int i, ret = 0;
 
-	/* input_lock is not need for the Camera related IOCTLs
-	 * The input_lock downgrade the FPS of 3A*/
+	/*
+	 * input_lock is not need for the Camera related IOCTLs
+	 * The input_lock downgrade the FPS of 3A
+	 */
 	ret = atomisp_camera_s_ext_ctrls(file, fh, c);
 	if (ret != -EINVAL)
 		return ret;
-- 
2.25.1

