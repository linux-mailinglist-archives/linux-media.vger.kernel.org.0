Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5ADA2A6C6F
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732261AbgKDSHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:07:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732236AbgKDSHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:53 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D10C0613D4
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:52 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id x7so23089232wrl.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nmto78jsH6BP6EX0aLno4Xjo3zNTYMaOPlWvmD+y/wA=;
        b=IBYm2Gr8EXSUOYL6JJZjaMkyyFYG6BPmGFxxSeNIp9Nf5XEOxreKOMsN0y2MlluiND
         nnGl5AoNkXTonVo+vPsF9HBVvcCFU/TLq4qK+FyvMQNX9rEcjciurjcaIP5cW6vFJLg/
         yJ52SUEbHyyO1YelKxpa/piYskUD+jI35yF0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nmto78jsH6BP6EX0aLno4Xjo3zNTYMaOPlWvmD+y/wA=;
        b=fWMTvsgFYAqnne0UMFmBBEz9yAFmx6GRQ35ZKaqT5cyBn2lLWHzzdmDjahn5RrxcE/
         bfWOpUgiyI7pHt2Zk47mwDSdiqxe4Ujb573WN0/+f8pqKOIrzlwOPJpA3k4oQJMGBNvS
         o6ihXMIxINofHTDRVJYDMo3+j8vM6N2YAiwNA/hRkZ+cXjejmW6i0EuVGXn14o6gCn6N
         3+UAOGz+0r/gaW7bxcnzy/pDZaT+6RQTw7f3HfreaKzBMeP0PCw9db8C66qhv/QOsFxv
         IV5dS7F8ZwC666BvG8D0ACefCisLhG9PJKgNPUfxxIyEAYuU7+J3kZqaCgqla9BR2WFc
         TjPA==
X-Gm-Message-State: AOAM532AjIOmYKBUY1YeZv1e/841CLg+akHs8xFjLaX/zzGFKk96QSXq
        w+rJGiFCMqHHGdOEgwJS5FeacQ==
X-Google-Smtp-Source: ABdhPJzuXIR9p1qoOh6D+1lieXOhk8pgGbPZS4owSlNy7AgFeX0GWLwWa8ZjCqRdgD0pzH57cb0j9g==
X-Received: by 2002:a5d:6ac6:: with SMTP id u6mr24341534wrw.145.1604513271613;
        Wed, 04 Nov 2020 10:07:51 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:51 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 7/7] media: uvcvideo: Add Privacy control based on EXT_GPIO
Date:   Wed,  4 Nov 2020 19:07:34 +0100
Message-Id: <20201104180734.286789-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104180734.286789-1-ribalda@chromium.org>
References: <20201104180734.286789-1-ribalda@chromium.org>
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
index f9382f8c10a8..285a7a5e15d2 100644
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
2.29.1.341.ge80a0c044ae-goog

