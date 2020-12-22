Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022A32E1080
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgLVXGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbgLVXGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:06:12 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6EBC0611CE
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:55 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id y17so16630923wrr.10
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jeskSU6Gmnp8dDQ9PLWTGGQJBUrwx9CRb9pxIKyWggs=;
        b=JZYwJXJoZHDzSQN4cFnUDKj6M1rVxBTJ8aE9DcVtM6hpTNOxLJ051/gACpNY9f/cya
         iRas/iAdvLSSGys8ieoZuCjteyQlyAILrP5e1Y+fKTbFBvn2C0ywhGvXJ+nVrUwS8xXE
         7PsjNniAaAyroJ00x1KR0zPtWYnkaCYYinjWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jeskSU6Gmnp8dDQ9PLWTGGQJBUrwx9CRb9pxIKyWggs=;
        b=Jst7hf+ywN3IHO5axIPw1H06/KayKQodUgw9t9jg5FMiRA243wD45rXGgSRIqB8EZx
         6rCDXL0m4oI2hbSvTbEoYQDUbSurC7f81XSoX9Sz7YyQw3udmwnpc3pJ6uT+0CZzYvhz
         E73wvvNflfgxChwOXzwdUxseUMC0q8W5h73mixMNE7HcbX1+nGoAffZen5f+yfkukfHE
         txccAyXzMCn3qBJjufyZTieh1Lr/zuKvV/U41va23xwD0I0NvpkKkscyWITuPcm8dS4M
         on8wqm1HEqptTbugB4Ne63cfzfXlkbiGH6LpopUuS8Km8Z6hJsYMphvL+3ufqZ+w80qM
         QngQ==
X-Gm-Message-State: AOAM530vpnde0mxCXYEp+BuDAmqBxkhJoLWErQbdjUCWaYtvLcKHQoKe
        KdFJNK+uYlsg1G0++Kuw12+NcA==
X-Google-Smtp-Source: ABdhPJwXPz9lgSKJ8l32XvNLQ0QLIZ/YXRKmS4Pgp3hK5hw/LsxjB7zKjOpNzGXDuRTb0edpXYDzzQ==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr26292534wrr.187.1608678294081;
        Tue, 22 Dec 2020 15:04:54 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:53 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 07/11] media: uvcvideo: Add Privacy control based on EXT_GPIO
Date:   Wed, 23 Dec 2020 00:04:42 +0100
Message-Id: <20201222230446.1027916-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
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
index 22857b6a71e2..8519f4fbbeb1 100644
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

