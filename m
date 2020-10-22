Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4FC296025
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900254AbgJVNiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900222AbgJVNiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:38:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2BBC0613CE
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:38:00 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 13so2152624wmf.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Hb+989JOofjjUh5aGhwd9WAuZ4cL+L7iJMxJ5IqyWA=;
        b=AKmlJVaT5Hrvhfka8Opvo4KGn4rXOOHMq018iYikKCOr5GKn74IR9yNWaWbyPpg+9Q
         7nMmwl5Ts4ahYOEbBKa0G11DXK0YJ9dRIQS9GH+jEbSzijfTgJVA4CKybQn+cy7JwNcR
         +6r6dsEJXiwc6tHA55H55+gFsHOgYlOT44+HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Hb+989JOofjjUh5aGhwd9WAuZ4cL+L7iJMxJ5IqyWA=;
        b=KJJ/+zZfeGvAxkJW3DaH2kuKCvgYNAw2f8WRBPwOkXoJO+LEO5oHElEWDFX5osrogS
         1pUpMJEHnjGeOQbP9kK/DKVeamgSLOIPML1y8/3/J9jbMQQBMwCQjYtjBsdy4/UcNY/8
         dlCa3aVUiZyEGXJsdKW42PtDesWKAAFSI1m5KNVcro1RDpgkpkes2wxSNydZOlEWaq8A
         LMOb5VLjmR1YI51jY49bcjhCB7twQEy5yWOCT16W6zg6B4/KI7loZC/4U7s3mRLKudre
         uYXlKFmH+mXagMhJvdPXz7hUj8wiWFIhGxI+2L75mpt4QzWDcHDt4DO3e2Sn2cVmD2wZ
         8cwQ==
X-Gm-Message-State: AOAM531G2n4zyhzntcUUNth/e0dOVbnR3TjKIUexfWOTh2IhONY1bVOv
        13+fKXwboR/IrpZFQ+uWPySxjg==
X-Google-Smtp-Source: ABdhPJwUGkUAkh6z5NDXNn1qijT3VBPtRSez3VFLz5/oC5CV9v2FsLKhesBZ0ALXzqnmqdA+0CjGaA==
X-Received: by 2002:a1c:9d54:: with SMTP id g81mr2652082wme.102.1603373879643;
        Thu, 22 Oct 2020 06:37:59 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q10sm4094031wrp.83.2020.10.22.06.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:37:59 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     tfiga@chromium.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 4/6] media: uvcvideo: Add Privacy control based on EXT_GPIO
Date:   Thu, 22 Oct 2020 15:37:51 +0200
Message-Id: <20201022133753.310506-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201022133753.310506-1-ribalda@chromium.org>
References: <20201022133753.310506-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new control and mapping for Privacy controls connected to
UVC_GUID_EXT_GPIO_CONTROLLERs.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 913739915863..786498e66646 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -347,6 +347,16 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_RESTORE
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
+		.selector	= UVC_CT_PRIVACY_CONTROL,
+		.index		= 0,
+		.size		= 1,
+		.flags		= UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_AUTO_UPDATE
+				| UVC_CTRL_FLAG_ENTITY_GET_INFO
+				| UVC_CTRL_FLAG_ENTITY_GET_CUR,
+	},
 };
 
 static const struct uvc_menu_info power_line_frequency_controls[] = {
@@ -735,6 +745,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
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
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8e5a9fc35820..a493bc383d3e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -58,7 +58,7 @@
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf, \
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x01}
+	 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x01}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
-- 
2.29.0.rc1.297.gfa9743e501-goog

