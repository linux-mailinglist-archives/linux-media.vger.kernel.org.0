Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06753AE87E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhFUL7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:59:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229651AbhFUL7H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26EFF610C7;
        Mon, 21 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624276613;
        bh=kxakYSNRVuDodkZft6TScXV0U+zp0Xa4cGVu/The1dU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TmB/MoKPWOaf/pdMvYiOZa8kjJWQ5vpVHBW39bJmGlOdQ/uXHWdj5cqJiTBoYoHIo
         9/3dOpo4IJRvl3MkXLhN9Xr/0/jwHfZk/VbnaWPWXCv9DERctvHb47ygiD0mDRkzvc
         w9ovzNLsN+IuR5gya5of8ONctsPU6UdlWW93g62HbtRnZ+u5VFz31pDz303F5z5vVh
         vdkaQn92q5MMN0ufs6p/jxKM9VAv6NC29WlG+S6jVG3GsrtsEQ01T5x3qFkH/YyHEW
         grNd2oIHYE/6MVVOO1NqpgXque0TO3L2rh/ZhjBw2EnpQSjUOVScP4kTGC3IliDfo3
         poDwsOWWHc/jg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvIXq-000Hck-U8; Mon, 21 Jun 2021 13:56:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/5] media: uvc: don't do DMA on stack
Date:   Mon, 21 Jun 2021 13:56:46 +0200
Message-Id: <d9d3b95daf726f3d4dc09477b1f61669763e301a.1624276138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624276137.git.mchehab+huawei@kernel.org>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by smatch:
	drivers/media/usb/uvc/uvc_v4l2.c:911 uvc_ioctl_g_input() error: doing dma on the stack (&i)
	drivers/media/usb/uvc/uvc_v4l2.c:943 uvc_ioctl_s_input() error: doing dma on the stack (&i)

those two functions call uvc_query_ctrl passing a pointer to
a data at the DMA stack. those are used to send URBs via
usb_control_msg(). Using DMA stack is not supported and should
not work anymore on modern Linux versions.

So, use a temporary buffer, allocated together with
struct uvc_video_chain.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++------
 drivers/media/usb/uvc/uvcvideo.h |  3 +++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..e60d4675881a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -900,7 +900,6 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 	struct uvc_fh *handle = fh;
 	struct uvc_video_chain *chain = handle->chain;
 	int ret;
-	u8 i;
 
 	if (chain->selector == NULL ||
 	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
@@ -910,11 +909,11 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 
 	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, chain->selector->id,
 			     chain->dev->intfnum,  UVC_SU_INPUT_SELECT_CONTROL,
-			     &i, 1);
+			     &chain->input, 1);
 	if (ret < 0)
 		return ret;
 
-	*input = i - 1;
+	*input = chain->input - 1;
 	return 0;
 }
 
@@ -923,7 +922,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	struct uvc_fh *handle = fh;
 	struct uvc_video_chain *chain = handle->chain;
 	int ret;
-	u32 i;
 
 	ret = uvc_acquire_privileges(handle);
 	if (ret < 0)
@@ -939,10 +937,10 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	if (input >= chain->selector->bNrInPins)
 		return -EINVAL;
 
-	i = input + 1;
+	chain->input = input + 1;
 	return uvc_query_ctrl(chain->dev, UVC_SET_CUR, chain->selector->id,
 			      chain->dev->intfnum, UVC_SU_INPUT_SELECT_CONTROL,
-			      &i, 1);
+			      &chain->input, 1);
 }
 
 static int uvc_ioctl_queryctrl(struct file *file, void *fh,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index cce5e38133cd..3c0ed90d6912 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -475,6 +475,9 @@ struct uvc_video_chain {
 	struct mutex ctrl_mutex;		/* Protects ctrl.info */
 
 	struct v4l2_prio_state prio;		/* V4L2 priority state */
+
+	u8 input;				/* buffer for set/get input */
+
 	u32 caps;				/* V4L2 chain-wide caps */
 };
 
-- 
2.31.1

