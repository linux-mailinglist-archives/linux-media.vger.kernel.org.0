Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E40C2ECE20
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbhAGKsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAGKsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:48:23 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DBCC0612F5
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 02:47:36 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id q75so5130794wme.2
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 02:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67aHJ6nmJ5xT+4FkpaqqiF0RNZx/OpHs6USNxyglm+k=;
        b=d9O0z/YZ3nMDTzMSYWwJTt/i/hdMf7zp3N0Q+VypsJPV67Ut5VSGwzLvzvRjyroHsv
         YMdLUT8HcO4DGZM4daocgGGNsJB3sK9xzyx1GSEwLHyihkYeCPZhhNBaNrUV1qyoxQXk
         83WMwYwomHAaI6xt87YmxAkKyjKlCQe/dk3ZD7OfBUhT/tc+KRdoxBtT/T9Oft38834p
         QlJO1Y/QoAT4ao9eJ0uJUYatR84t1nJdlclMKyaq5bAHZqdOZ4x8IT3NprDI3tI6Akqu
         BbcFCy2vF7CCfTM+PAsgFkRkyccl6dLg/fWw2nO4f9vdFGrK8Ttr0+tXJivv2UZKfhhW
         ducw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67aHJ6nmJ5xT+4FkpaqqiF0RNZx/OpHs6USNxyglm+k=;
        b=cwPGOEA1P+JfovtaOAQ8bVQN9l1SyOQU9Rk/X6/MVGjTW2liKPcNzm6egSfaEs7+Vf
         slqbi+iN2xCGBGqupROVvfwdtYsiWwHD3ZDL9qcspHIyp4aza5CAaLp2OGqjqPey05zu
         MidL0lLRZlL05YJwF0CZ0U2K97GUYPbinSuWdmiYd4S/4iU2UX0k9aL/cXxC/yJ94B7l
         Qjj5f6qJD6ahzK25BYArUggcXr9wqK5E9ygfKRddFAZ+jyBvW2lhJM8Is2vWSSiqgNUN
         BbaoojvloeWchgFjsOR81XFYIpmpgYPfz3uUC5oOrXHy7da+qMGeVruGfCpUEFWUMxnp
         rMnA==
X-Gm-Message-State: AOAM5307LA+A08X4S8LVadLh5aQcEBO2iuSnkelLhzvH+SyhDOAxufh+
        2ULxiAsALim1Ht1OyLvVgtbXNQ==
X-Google-Smtp-Source: ABdhPJzqaO8gQrfYUaxLI+jpql9qYOJrNyi1GrVc+xJT09WbBMh7Q2rAnnHDcclFbcqIPHho09gHag==
X-Received: by 2002:a1c:6654:: with SMTP id a81mr7254936wmc.113.1610016455574;
        Thu, 07 Jan 2021 02:47:35 -0800 (PST)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o74sm7841449wme.36.2021.01.07.02.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 02:47:34 -0800 (PST)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 1/2] media: imx7: csi: Fix regression for parallel cameras on i.MX6UL
Date:   Thu,  7 Jan 2021 10:47:25 +0000
Message-Id: <20210107104726.1294538-2-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107104726.1294538-1-rmfrfs@gmail.com>
References: <20210107104726.1294538-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Commit 86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as
a CSI mux") made an incorrect assumption that for imx7-media-csi,
the bound subdev must always be a CSI mux. On i.MX6UL/i.MX6ULL there
is no CSI mux at all, so do not return an error when the entity is not a
video mux and assign the IMX_MEDIA_GRP_ID_CSI_MUX group id only when
appropriate.

This is the same approach as done in imx-media-csi.c and it fixes the
csi probe regression on i.MX6UL.

Tested on a imx6ull-evk board.

Fixes: 86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as a CSI mux")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a3f3df901704..31e36168f9d0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1164,12 +1164,12 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
 
-	/* The bound subdev must always be the CSI mux */
-	if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
-		return -ENXIO;
-
-	/* Mark it as such via its group id */
-	sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
+	/*
+	 * If the subdev is a video mux, it must be one of the CSI
+	 * muxes. Mark it as such via its group id.
+	 */
+	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
+		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
 
 	return v4l2_create_fwnode_links_to_pad(sd, sink);
 }
-- 
2.30.0

