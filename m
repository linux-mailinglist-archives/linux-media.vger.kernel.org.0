Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D38E33802B
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 23:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhCKWUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 17:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhCKWT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:19:58 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938BCC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:57 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id c10so49391569ejx.9
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PU+PEkxuCZPyUA4RGvtWjC2ZXQnuk3ecTtjzX3NXk28=;
        b=EtzIOLd4WWFG8QSvRxqrGXH1U9iJrjCkW+GGA+/BI1TnQ8jqd0MTuxYGi0nNPbpobz
         WB7oQsrgMESCajedtK31aPnGOYTNFfrGLyEay8xxiocaCSu1OH/slfjPcHRM/UAGS9lf
         CvcVX6BmXFFwJ52Tjv5ZXL9NFiN4rVdofChE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PU+PEkxuCZPyUA4RGvtWjC2ZXQnuk3ecTtjzX3NXk28=;
        b=R4rm48Lt4UV6htAaqlPTXQKmdUiC8Frw+UuJOZNMFqxeud5X5aqL1y3ZoD04Y+K7eu
         FneHjKDo572iZM5h7C0ARlTgB5x4Kng8n2IxKDE9AOOQHUiErhwYf7A0okKfWxZlOP6+
         la8GTtkB2AKllVYZH4ierylK0xTDAwOmGY+BmtU0E3mjgU8n1vBQsc+Bb5zLY6pYELQ3
         2+tDqO9SCdaVex3I5pfdv+h+Dvf1MBCs8bsAYCCMKHjSE42guHVbVKhkzg95tAAlhPc+
         n/Z5HSX1tJy2SL1/KSsVs5mO8G0tu9mwQpSRqI4EHijv7HSLMvbV0NO7mNlvQwfbUAcK
         BIww==
X-Gm-Message-State: AOAM530w9HwWU12f/OnWsGypFgBebLFq0q5tG9XPFdkibSr1h644Zobu
        BUadZenxRB0X5Aa4x68AHH32VA==
X-Google-Smtp-Source: ABdhPJzDdIrAnaNzAB/vSFzneUHVBl+Vtdhjrtpf6CG2rGYRHD3MrQdr+JwIQGw4NZenp5G92R2FNQ==
X-Received: by 2002:a17:907:76c7:: with SMTP id kf7mr5173335ejc.470.1615501196346;
        Thu, 11 Mar 2021 14:19:56 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b18sm1942174ejb.77.2021.03.11.14.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:19:56 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 4/6] media: uvcvideo: set error_idx to count on EACCESS
Date:   Thu, 11 Mar 2021 23:19:44 +0100
Message-Id: <20210311221946.1319924-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311221946.1319924-1-ribalda@chromium.org>
References: <20210311221946.1319924-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the doc:
The, in hindsight quite poor, solution for that is to set error_idx to
count if the validation failed.

Fixes v4l2-compliance:
Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(645): invalid error index write only control
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 157310c0ca87..36eb48622d48 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1073,7 +1073,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 		ret = uvc_ctrl_get(chain, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
-			ctrls->error_idx = i;
+			ctrls->error_idx = (ret == -EACCES) ?
+						ctrls->count : i;
 			return ret;
 		}
 	}
-- 
2.31.0.rc2.261.g7f71774620-goog

