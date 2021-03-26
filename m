Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8B934A52F
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhCZJ7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhCZJ7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:59:01 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4DBC0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:59:00 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z1so5617731edb.8
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bONtZGsS4XqAKxeuy/H43uHE8WmZWjf3WVxgmtV5zE8=;
        b=W+Hm9SkjmsW0r45zVcLVwAM80sqfX6SfjfmMYq8EWW5OQf5aH5R+wL3veXe34hcJ29
         QFIVN7Vp1P3ODMWodMitoNeSXTnKaVMGiICZqsy7FN900zkOsyRTxnQDqyZIoi0tZvb3
         0T1V3yVIpWDhm2OAz12iHhJqJOuJYouV7Uyfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bONtZGsS4XqAKxeuy/H43uHE8WmZWjf3WVxgmtV5zE8=;
        b=NNMFNuStLAfXCAKmaVL0ESQLueqP0H8YmOmWv75IsNGsyb6PxYgGRsDUclE1V8YIvb
         CbMCJJwyFXHMVLOuxWQ1GNmsuNEwqSOYn4gDwtabYIbfzFv6mUKKloZg1jCP0SGHZZ6Z
         hUFDPGLCE8P+v8holXdsMxVEUWTPGK+Xw7GG8lKeGTGOTlyP+Bc39Q8ttMt3UiUEtGn/
         aYcOTmLsCFFgXZVwqbDr4/VY4g5r+IEVGUvUN1TXGU0LnuTQn71LYF/dw5uSGNR6pwEJ
         rH29AB3dKdiKU2a6dGaY+dldELHDhPuIhT2H7MuGE8QD1svToXAJ/fjNx/Dl1stf+agI
         Zouw==
X-Gm-Message-State: AOAM533a2K5zYZN4v5K29bXp/lFcNpqzv6DALI2HdES2fvpvGBzl1pMp
        AtKWGYfUEwl2JK2waVDlBAGo1w==
X-Google-Smtp-Source: ABdhPJwIbtASlZisUUvzHQbZuyZBqTk0Wn+fv19PofYh6AFM9f2DR2r4sbUNnDVTaw9CT+NleZJN8Q==
X-Received: by 2002:aa7:c74a:: with SMTP id c10mr13750092eds.332.1616752739397;
        Fri, 26 Mar 2021 02:58:59 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:59 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v9 21/22] uvcvideo: don't spam the log in uvc_ctrl_restore_values()
Date:   Fri, 26 Mar 2021 10:58:39 +0100
Message-Id: <20210326095840.364424-22-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Don't report the restored controls with dev_info, use dev_dbg instead.
This prevents a lot of noise in the kernel log.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6e7b904bc33d..df6c33932557 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2182,10 +2182,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			if (!ctrl->initialized || !ctrl->modified ||
 			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
 				continue;
-			dev_info(&dev->udev->dev,
-				 "restoring control %pUl/%u/%u\n",
-				 ctrl->info.entity, ctrl->info.index,
-				 ctrl->info.selector);
+			dev_dbg(&dev->udev->dev,
+				"restoring control %pUl/%u/%u\n",
+				ctrl->info.entity, ctrl->info.index,
+				ctrl->info.selector);
 			ctrl->dirty = 1;
 		}
 
-- 
2.31.0.291.g576ba9dcdaf-goog

