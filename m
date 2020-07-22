Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA015229775
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 13:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGVLa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 07:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgGVLa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 07:30:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D981EC0619DC;
        Wed, 22 Jul 2020 04:30:56 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d7so826540plq.13;
        Wed, 22 Jul 2020 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=REutpgTEY8zqFjKsJaL/pIrbvSAniP7JYrpnR8Uq2Hg=;
        b=kPwE57tThRH2Xl2UQew/QQhJ0HEFx8Jfswz2xfdVqwfJEnOAVAQt/gxOFQAaucsGkP
         iwTxQyDTZN9pqWHyQWba20tdpkLJC2eECm1uryNRmShampx1pE6Vqnabd5MtVoMw6sjt
         R+ycwIZOfR1O7qUEEU+VW5xTpGSYvO1YVON5j49sDyzYwH17KCT6JRCUGuZvoh9PiFfA
         DRZE8xEzFRyPWozCxhyMyoRKlnMCyCM8Y5O4ruvALKA/qPYA4j14X5sJUIKVOhfQHLge
         BVw42vbho9lHN+PHthr4gTN2OkWYS5xn1ArFGBP5FXQOm6N1+ddhU1wxKIa+NP6Zwsiq
         +xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=REutpgTEY8zqFjKsJaL/pIrbvSAniP7JYrpnR8Uq2Hg=;
        b=aCyrPU/bVv2GJYNtNf6vLt6qtZS7anPm01nVbO9uZOo0OPnZkARXjWNBXPqtNc/6yS
         UPXOdiacxD60cv+BYcz2OWFUvq39L8RnSHl3PjBLbqVc5fo6CRO8BP/kTUs0BRyXGP+6
         EcQnHe60UYAlYdyt7TD0POAar+UiubfIeTtuCeLHN9R+27nksOi0U1BRPOQdST8yT8ut
         75d1BNnUbRyo9clrsqceDKFeJAxCbRloORkzvddWblE6OAZy0geusZz9MTwTRYCuQEX6
         kvf85ITiKNj1qt845tOKj0bqXgcEA5jWN9Ubk/vXNa+g4b2mKlwJglNwF9tWB/x94Uvx
         IJGw==
X-Gm-Message-State: AOAM530aKUxgl+K3tgl8fU/dbfM69rScSG5CA/0bgTC2n7PcHe7EESY6
        o5a3jj2NjOgEoc1dsucCA0s=
X-Google-Smtp-Source: ABdhPJyeGR7pcKdtW0vy20t9YcWddsffnZ+VrlDb2rR78ZIMmGBE0qd26bogPd3aN3sGzeQ3acYUJQ==
X-Received: by 2002:a17:902:10e:: with SMTP id 14mr24718428plb.297.1595417456363;
        Wed, 22 Jul 2020 04:30:56 -0700 (PDT)
Received: from rahulg-ThinkPad-T450 ([122.175.73.180])
        by smtp.gmail.com with ESMTPSA id gv16sm6507715pjb.5.2020.07.22.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:30:55 -0700 (PDT)
Date:   Wed, 22 Jul 2020 17:00:52 +0530
From:   Rahul Gottipati <rahul.blr97@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: atomisp: Fix coding style issue - correct
 multiline comments
Message-ID: <c73ee9bced34777cea5b1a3a97f57c723b0a97b1.1595416585.git.rahul.blr97@gmail.com>
References: <cover.1595416585.git.rahul.blr97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1595416585.git.rahul.blr97@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes some coding style issues of multiline comments to
correct a few checkpatch.pl warnings.

Signed-off-by: Rahul Gottipati <rahul.blr97@gmail.com>
---
Changes in v2:
	Distributed changes across 2 patches instead of the previous 1.
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9cdcbe774229..5bf3a86f98f8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1281,7 +1281,8 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	 * But the capture number cannot be determined by HAL.
 	 * So HAL only sets the capture number to be 1 and queue multiple
 	 * buffers. Atomisp driver needs to check this case and re-trigger
-	 * CSS to do capture when new buffer is queued. */
+	 * CSS to do capture when new buffer is queued.
+	 */
 	if (asd->continuous_mode->val &&
 	    atomisp_subdev_source_pad(vdev)
 	    == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE &&
@@ -1806,7 +1807,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		/*
 		 * set freq to max when streaming count > 1 which indicate
 		 * dual camera would run
-		*/
+		 */
 		if (atomisp_streaming_count(isp) > 1) {
 			if (atomisp_freq_scaling(isp,
 						 ATOMISP_DFS_MODE_MAX, false) < 0)
@@ -2438,7 +2439,8 @@ static int atomisp_g_ext_ctrls(struct file *file, void *fh,
 	int i, ret = 0;
 
 	/* input_lock is not need for the Camera related IOCTLs
-	 * The input_lock downgrade the FPS of 3A*/
+	 * The input_lock downgrade the FPS of 3A
+	 */
 	ret = atomisp_camera_g_ext_ctrls(file, fh, c);
 	if (ret != -EINVAL)
 		return ret;
@@ -2521,7 +2523,8 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 				    v4l2_s_ctrl(NULL, isp->flash->ctrl_handler,
 						&ctrl);
 				/* When flash mode is changed we need to reset
-				 * flash state */
+				 * flash state
+				 */
 				if (ctrl.id == V4L2_CID_FLASH_MODE) {
 					asd->params.flash_state =
 					    ATOMISP_FLASH_IDLE;
@@ -2560,7 +2563,8 @@ static int atomisp_s_ext_ctrls(struct file *file, void *fh,
 	int i, ret = 0;
 
 	/* input_lock is not need for the Camera related IOCTLs
-	 * The input_lock downgrade the FPS of 3A*/
+	 * The input_lock downgrade the FPS of 3A
+	 */
 	ret = atomisp_camera_s_ext_ctrls(file, fh, c);
 	if (ret != -EINVAL)
 		return ret;
-- 
2.25.1

