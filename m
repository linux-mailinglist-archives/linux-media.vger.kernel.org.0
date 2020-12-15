Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BB22DB090
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 16:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgLOPwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 10:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730393AbgLOPqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 10:46:20 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BA4C0611CC
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:44:59 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id v14so17288268wml.1
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PMIn5g0aAv9praenzzp8l+mN/1tHE3RD2X9YPbvTKnE=;
        b=S+kLu7GCd5MUCCzuJszS23SqiD6zpj19b7lueeVCR4ymtLh0+PLXi2idrHGgCp7a9b
         oezTyKjPaf6VMfVTghnZS47OGXr9LeS+lDwhpoIcjU0Kmo7SVHe+p5aaySUGzZ6BweO9
         FjYULFiP94NGWI4Msh8dSeGo5ELtUeeHmGwM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PMIn5g0aAv9praenzzp8l+mN/1tHE3RD2X9YPbvTKnE=;
        b=oBMroHdPHN0sjkA1IWWJu0paJP0fDAWipt4NI5lMJby+yFlAy2f6Inz903x+j+TjFY
         Zg8KNyun/NCxAlnbANeeII3EypHrw8WusMUr84TA8UYWy76n5wqDHWqQUY2eJf68nV2e
         B9dlFAq5V6utp+1zAAruUe2bvPxzmNuw3hx9St0ZAdcZAdhKUEBakWYjUVTq0l1gscQ3
         uvqkYyk4yjrQDT0DB7i9cviWtA/vvC7BpPIWqaKtdBa8jH+rEPQ0S3D90FeffmlM44Qn
         lsCVoJRXI12KxQ+S1+UKzeuCI99P3mcCHNtih16lYMoJgEulxeLYXhUqF+FyzXn/quSs
         m0Wg==
X-Gm-Message-State: AOAM533ZEAseMrjhUYJXAZMhuJILGm7oKTubMkBj/oiHTN+qVUuxK9QW
        vrl7I1u0qMvrgnrD1jML8ly0xw==
X-Google-Smtp-Source: ABdhPJx4jAnY9q4kDxn2ZuI4ifetLMypmyHRw1IxWzvrL+k7k6QeP+2FwSlxGejE/wMSHhJInJdx0g==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr22105133wmj.142.1608047098134;
        Tue, 15 Dec 2020 07:44:58 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 125sm38204141wmc.27.2020.12.15.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:44:57 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 6/9] media: uvcvideo: Add Privacy control based on EXT_GPIO
Date:   Tue, 15 Dec 2020 16:44:36 +0100
Message-Id: <20201215154439.69062-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201215154439.69062-1-ribalda@chromium.org>
References: <20201215154439.69062-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new control and mapping for Privacy controls connected to
UVC_GUID_EXT_GPIO_CONTROLLERs.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 53da1d984883..511927e8b746 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -347,6 +347,14 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_RESTORE
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
+		.selector	= UVC_CT_PRIVACY_CONTROL,
+		.index		= 0,
+		.size		= 1,
+		.flags		= UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_AUTO_UPDATE,
+	},
 };
 
 static const struct uvc_menu_info power_line_frequency_controls[] = {
@@ -735,6 +743,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_PRIVACY,
+		.name		= "Privacy",
+		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
+		.selector	= UVC_CT_PRIVACY_CONTROL,
+		.size		= 1,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
+		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
+	},
 };
 
 /* ------------------------------------------------------------------------
-- 
2.29.2.684.gfbc64c5ab5-goog

