Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506B92E1CA4
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 14:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgLWNhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 08:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgLWNgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 08:36:54 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44E3C0611CD
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:37 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r7so18640646wrc.5
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PJT9YfpOUuN9zgDqW9T00WTEmQzGiIVXS8MvOfJZAQc=;
        b=i5Tt5ONVuf8DwBWKFv6dEwCwRL6Fb/CvSEsrBWIP1SvsZz3r1L/rOTd2DLOt0o+Qv9
         9uU3oDBPCx6cfwjGtG86ql0SXc7sIsY+/eNI7+ItCPlACdnpecU/hK+y4zzf9dnbL03c
         OL+lOMegYFQRCImJhrNUfh30QGPvmTCwK3wlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PJT9YfpOUuN9zgDqW9T00WTEmQzGiIVXS8MvOfJZAQc=;
        b=Aw3JjvE87ffkePi2LnDW/jsDcw0GuLpoZZXfGVmGnlhrr+3qaY2w4Uv7fWHk8UV+gd
         qFHdTZae1alaJ2E/9C71s7MRsl1NBP3OQFyitSEIxWgTQALB84buiN8Hd50cetwuvVr0
         886mqX6fF48k1QSqvrbZyQDVjVKcLFf7vDjcokXQavr7LFGeFE1CXm7x6TIBCwflSKT4
         hgn4LOrFCyvaCnCtCSGCnAfN+O5BXQKeVvvKeog1roU34EKGcl0vgO87MBj2o2zdKM/8
         7rPHeNUsJEioF7BNhrRaFvFCjl2+s96I02wAMFXvud5EpLVR1NEQSTYNXsxlKh/7XoY1
         bGFA==
X-Gm-Message-State: AOAM533rNQt5/cHyvVwiVps567TtcKSPO2fYFkjybwmvBm1lNAgErcMe
        4/bexT/d9dScQCAQGB2j+BDrPg==
X-Google-Smtp-Source: ABdhPJwZU8Tyz326aBotIhWdK8iF98/oM2POV3jWtQ/MMAEFDnt09ieSRJXC1ez9jH4boFECatqiSA==
X-Received: by 2002:adf:c642:: with SMTP id u2mr18551802wrg.243.1608730536482;
        Wed, 23 Dec 2020 05:35:36 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q143sm31572247wme.28.2020.12.23.05.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 05:35:35 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 07/12] media: uvcvideo: Add Privacy control based on EXT_GPIO
Date:   Wed, 23 Dec 2020 14:35:23 +0100
Message-Id: <20201223133528.55014-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201223133528.55014-1-ribalda@chromium.org>
References: <20201223133528.55014-1-ribalda@chromium.org>
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
index e0ab55583dd8..58ad63751baa 100644
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
2.29.2.729.g45daf8777d-goog

