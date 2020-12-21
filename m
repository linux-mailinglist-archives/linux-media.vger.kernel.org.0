Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96FF2DFFC6
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgLUSbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgLUSbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:31:13 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3018C061793
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:30:32 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 190so10781169wmz.0
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qPSq8Qf3oa+zDwHMEyCyB9kgDU9ZtwoI+tmmh5RXbH8=;
        b=HlnjMoT59rU/B9gGWIQ7KZMrB3raq1PufLD3CQG7Ag9LG8pc0bzeCx9BeWI4n5aOzT
         MyegdMcpsXln4DMElmsRTXDAj727kvyHsfD6qMoruL4BiPqpj9FTMDkFUS1nPvsSR/Hx
         atALFDOSSa1m4CR1QxF0psYtrdZbAr7jEPfSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qPSq8Qf3oa+zDwHMEyCyB9kgDU9ZtwoI+tmmh5RXbH8=;
        b=ghc8mp2lTM1hJyfpzt66U5akEBc1nXlgWb9owWYLinaELWrd7crFJDBaraqaeEakys
         jXjLMB1HIarqOg/uPurnJ2GHWWHPD7bfbxmD+zbsKUi5y28ZrEhLbHUOXH8U7hWpem4/
         z+0tvbJ85FunSlKQxvDdEGq+znF7fCghdzTxurUFJLEm8xVY9RAZwVds5AlPR4GGe9PF
         chQKsoB7OkiJ2W+4CgNw7UCNvANeCGcyhmcDkmPq2JRnd+mGV/T5umgyQLytHRlI8cfv
         WNkdv2Iftt49PS3aQbSQwhJSPoSSW6VwSK3Mf3zu9IBGN9GBcLQGEDrG1fKUAjV9+kL4
         H7Vw==
X-Gm-Message-State: AOAM53335oTulKaKHoRdQRH3xwmrigZhIK1V0gxQW5SFbDr7cy6Riafz
        K5fA3pQvXAoUItAUjzGxlrNIkTcEEKvVQ1RiB2k=
X-Google-Smtp-Source: ABdhPJzwr+Ql4FgZh2mD5Zb+KIel/a8kyCyrrS8u7Yhn3O0hJGqu71Zn8JBJfVPSL3UGIsGS3Gat2A==
X-Received: by 2002:a1c:3c09:: with SMTP id j9mr17557080wma.180.1608569308037;
        Mon, 21 Dec 2020 08:48:28 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:27 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 08/12] media: uvcvideo: Add Privacy control based on EXT_GPIO
Date:   Mon, 21 Dec 2020 17:48:15 +0100
Message-Id: <20201221164819.792019-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new control and mapping for Privacy controls connected to
UVC_GUID_EXT_GPIO_CONTROLLERs.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a430fa666897..374822b1ee94 100644
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

