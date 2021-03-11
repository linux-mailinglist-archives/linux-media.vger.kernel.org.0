Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7ECD33725A
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbhCKMVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbhCKMUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:49 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35522C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:49 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id bm21so45793489ejb.4
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+2VPlkbiBZQvOkl3gccESI55+1fEnKM8yzQJ+4ZNUOo=;
        b=XJHDcFyZr/25m7sUaROvXVgRZWsuBS4L2oB9qni1bD8gOp2B338L4AJ7z5GBRXkyy8
         2OVDNpRboXem5rWxvEz5mJ2PMKX7YLLmbK3DefterAIQVkU1JcCkf3YhD837Ac7PnWiB
         kK5bJFoSaLtXSCpBTkpGmscjYzLPjOGCD/2yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+2VPlkbiBZQvOkl3gccESI55+1fEnKM8yzQJ+4ZNUOo=;
        b=m72KsuwDni4cCtaNwTxHpkgY0NJFx+Ot3Y1Uj18xZ9YjkzYjm9Q5IMl0ZOzbNmTXxP
         MkCa2bRQNrYvoH/Xo2tyhnlQnZYREsngp4op0/GlpIUqLHDvW7wlzVkumzkcAua6g/dT
         +ORGW0OA5Vw7wyMg/uh2I2p4urXYszPSz+Y/fu848YIdYoTIGsadFhkiMiRTx9Gt/HsE
         cLcG+fd+esCIH+64xV5yc+KBQk7YuRAWm4ABagSRYMXvZQvYG7vUzhQ/i6TxiOBAmdAV
         bEaq2lqEp0OQ72egWsmcjcJ5QQv9cVhBjAu2YkuBNV4zSRiobxE0cNEG0zNsKFDpbT9v
         vNSw==
X-Gm-Message-State: AOAM532ETteW5ea57um1Tby4cIesXfaN5F3ybFB19iZgVdAsffx8dWdt
        0V9x90/GAXLPWS2a4/3Jsk36SA==
X-Google-Smtp-Source: ABdhPJxOetNZ2J+JZUHp/jms7vJbrschr1qHqadBRSySKy3eYB1M2VhLPYjz/46qM4HlUa+rtDeueg==
X-Received: by 2002:a17:906:a86:: with SMTP id y6mr2920176ejf.354.1615465247889;
        Thu, 11 Mar 2021 04:20:47 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:47 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 08/10] media: uvcvideo: Always return a value on V4L2_CTRL_WHICH_DEF_VAL
Date:   Thu, 11 Mar 2021 13:20:38 +0100
Message-Id: <20210311122040.1264410-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes v4l2-compliance:
Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 9b6454bb2f28..b500356fd06c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1057,12 +1057,7 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 			struct v4l2_queryctrl qc = { .id = ctrl->id };
 
 			ret = uvc_query_v4l2_ctrl(chain, &qc);
-			if (ret < 0) {
-				ctrls->error_idx = i;
-				return ret;
-			}
-
-			ctrl->value = qc.default_value;
+			ctrl->value = (ret < 0) ? 0 : qc.default_value;
 		}
 
 		return 0;
-- 
2.31.0.rc2.261.g7f71774620-goog

