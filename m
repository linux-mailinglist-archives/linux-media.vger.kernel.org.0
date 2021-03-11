Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED5E337251
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhCKMU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbhCKMUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:44 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62714C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:44 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p8so45764768ejb.10
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EYGFrEW02KUhIrzCGk6j2y1DSBi0VEvJiIGApiPKgfI=;
        b=TyoGQkrwpHdv/lBARJpZfrijdU2O8+MCDuhgh5lx3pNzaKF8z3/1RIh3bbpQ8dvFV9
         CWFbmvHewQd1NNb5IGRk/JBn2/4bTHHXKYYoMMyI2l++6uoCg+nmo60W6y8RFOzzvN1V
         WvuotfLz4U5ryDk7SNlIumi6A2y+ZCrSRcU3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EYGFrEW02KUhIrzCGk6j2y1DSBi0VEvJiIGApiPKgfI=;
        b=VAQLRc/ZxZEsx6f6523mfrhEGVVEDJYe7GBthjsdoG/uqFhy7RiHxmFhcYsu/2MRPp
         UwKChNwFgWkldWwQqQzTaRCoP7Equv4R14vAplUZldLCX72CpLcPRW4DmbLvMgqg8uXO
         A+tl4x/BCAlYECLzigErYtK86sENJZGg4bHGRM78TCEWQS6+sWbZWNlulHN1Wya1Fj6C
         QYffHC3iDUefVrSx7LS6z2ekWwPSTF0envs/U498ZqJhIxzHFwyqeDG5JxFaAUpZLyH4
         x5XGOt75Fhy2QxF9FeWE2PllwxC1xaWQEay6WztfolORGztbNmYYCJxkLLbANd0GCGaf
         uStA==
X-Gm-Message-State: AOAM53008HA/fv3XqVsmzQCwb/Hn9f/u9wUzTcq04+dS7VvkU+yR2ENR
        tcTTjKr4am0dUsWpzkXgwTCZ4g==
X-Google-Smtp-Source: ABdhPJy7bhbwfcyIHHrbJaVpNHOyI4lk2ai/ZsUE5g7/tTa7JvpDxHhjLUm/S3pqzbNR/qp+NFRv1Q==
X-Received: by 2002:a17:907:2093:: with SMTP id pv19mr2851780ejb.134.1615465243068;
        Thu, 11 Mar 2021 04:20:43 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:42 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 01/10] media: uvcvideo: Return -EINVAL for REQUEST API
Date:   Thu, 11 Mar 2021 13:20:30 +0100
Message-Id: <20210311122040.1264410-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver does not support it.

Fixes v4l2-compliance:

Buffer ioctls (Input 0):
                fail: v4l2-test-buffers.cpp(1925): ret != EINVAL && ret != EBADR && ret != ENOTTY
        test Requests: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..5e3ec4a376e4 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1046,6 +1046,9 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	unsigned int i;
 	int ret;
 
+	if (ctrls->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+		return -EINVAL;
+
 	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
 		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
 			struct v4l2_queryctrl qc = { .id = ctrl->id };
-- 
2.31.0.rc2.261.g7f71774620-goog

