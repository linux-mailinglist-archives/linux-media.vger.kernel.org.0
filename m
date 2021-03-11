Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA683374A4
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbhCKNul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbhCKNuk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:50:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB0AC061761
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:50:39 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id h13so2843633eds.5
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q1DGKsTr9REpSe+LIHgT2CR/kX2zCTaPdy5dQ7gbqsY=;
        b=AnnmfsHK6LUVCoklpMLiOpQgfHg+xYzvpok0NBXBur9Mgw94jQ6KqzH/yvT3EhEz5p
         QaRUT6XQHeVNGLeJ3nl4MTtEeyy241oNjTM2yZJcGr2yf6d/dNMSyKvCchpFrjBIC4x9
         UuuWC6r0LDwi8PjhqHewzmcUbKqYW8AS4BgDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q1DGKsTr9REpSe+LIHgT2CR/kX2zCTaPdy5dQ7gbqsY=;
        b=fK+xJwGYaRA9BrmLmPG1uasZ7Cykp/80laIxQdgJ2SN1j9Xba10suywIS7m37DwhdT
         qdDHo+wqxVUQUqxvnIDXJfQXBiHCJ3Tb5s3c8tbPPbPU1IJsb7bIFqMWwiXKDFBNYlYz
         MsNw8BcjKU5KNSmAmmRtzvioGQhMxxwSbo1GEkJAadC/3n+QANk6UDsEjp4c4u3Ea6aa
         kflQedP6cXAW+nHgg+ot1wHVS9YEi9+dRsEIL2GWZXSlRr7CGvddFZ9MBCWBRPKQ2yQR
         ePydGjZlkt3e90Sjwl7ySBlQhLe2hO+AEDSN/rcmQDzvP0FgsdyV8UsPj3cpkf2QSSnF
         DkdA==
X-Gm-Message-State: AOAM531Cqrg6bJCBlIIwRlhFiuCxbpt4Kln6/ZI74ZOmVL0wDZrSdxub
        gLKM/p74/VcPJ3qDK4UN7eQ/Mw==
X-Google-Smtp-Source: ABdhPJwYp0jCiWbrMqxCRs9bS7ZmwlkvSD21K4wgP8FHeY8o/uiuNF3sJmJx6CZKmiJbuiRP3EOAHw==
X-Received: by 2002:a05:6402:48c:: with SMTP id k12mr8589635edv.237.1615470634904;
        Thu, 11 Mar 2021 05:50:34 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a12sm1308567ejj.121.2021.03.11.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 05:50:34 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH] media: v4l2-ioctl: Fix check_ext_ctrls
Date:   Thu, 11 Mar 2021 14:50:32 +0100
Message-Id: <20210311135032.1287187-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers that do not use the ctrl-framework use this function instead.

- Return error when handling of REQUEST_VAL.
- Do not check for multiple classes when getting the DEF_VAL.

Fixes v4l2-compliance:
Control ioctls (Input 0):
		fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Cc: stable@vger.kernel.org
Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..6f6b310e2802 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -924,8 +924,10 @@ static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
 	 */
 	if (!allow_priv && c->which == V4L2_CID_PRIVATE_BASE)
 		return 0;
-	if (!c->which)
+	if (!c->which || c->which == V4L2_CTRL_WHICH_DEF_VAL)
 		return 1;
+	if (c->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+		return 0;
 	/* Check that all controls are from the same control class. */
 	for (i = 0; i < c->count; i++) {
 		if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
-- 
2.31.0.rc2.261.g7f71774620-goog

