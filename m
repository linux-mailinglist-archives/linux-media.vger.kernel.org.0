Return-Path: <linux-media+bounces-41330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C17B3BB26
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7069EA03902
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11E7314B75;
	Fri, 29 Aug 2025 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UJCkVPum"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25EE3148A2
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756470066; cv=none; b=X9B8V6ehgCW7WMzW2OXUXr0kU1L1cmLfX/CYNQprzYGqqKLk5eQv7OIJZfQdLgZcDOZFIbIjXFvh8FnScgFS1+lDp+VFU4HpPmyJq9y4igfyS3uwEO8adPYXmU5lqZxDjXGljIe+g5gi3LE/Agz2h/ZBJNX9YZOpAeOyzSUjC+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756470066; c=relaxed/simple;
	bh=aWDmcKQxJLeLFc2zLkg59VZBRjE8kpjJMy4W/8wPRag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bke7lwF2G951GWmpJnsuubjRsx/OrU2xkc80I8IHGiInf8Og9E7K/R2d21yOQj2g/jiYpsdOMVB15/TM4+ZsEpiIf1UyezvUBMNep4SKa0z+UsujhlniEEkEc2Ft2CLyiWWYKxKfcrTZV7tims3IJ2VifJLZJi8MjyjXqn5uSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UJCkVPum; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso249919e87.0
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756470062; x=1757074862; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zW4AqSEKv0kJ/6/OBgXVXAF4o8+R44pXfVrj6w3QMT8=;
        b=UJCkVPumwxbKg8DOUW9LEQ2cD49u+20hj1tYg5PsFQ8VZ55Yml8r8tTnnQvyXyZGVl
         PyWrZpqHv3q1g/6QL5dMI6q2mltxE2PEwLi8Ww5AXjog54ZyC+n2+2Yn82tEsajkXNJ2
         Ky/SumRPgiEYNQTjyry2zVe+10zWc10NPEbVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756470062; x=1757074862;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW4AqSEKv0kJ/6/OBgXVXAF4o8+R44pXfVrj6w3QMT8=;
        b=vKbnD8bHwVIAOF4yoKQUTrItD6MR3z627kmRMru3rLLtCTTAx0YI3T/hap6nTyyYCx
         RoXsouDXXQrCFQ8utUCwX44Xz04s4PS1xl2yRIQ/YQqn0SNxiMS2NIdarD7x/+wW86XQ
         5Md16kXnc/6LQ/e9/TC16kJ6ujgCAlh4wUE98D6oi3VZbkuMgmBML/K6O6mxHty37GjU
         qHRCIcukoc136aDxohfkElmynJU4Sd6yKFCp0kT2FIqIj+Jm/aNuEm/EUHfjxTaa3ry8
         jFb57rIk0dzwZGbudZRT/mX9l8u83daBBzRuawv0rEK/2v0Ygq+dxLdK68TAsJsv+l5G
         170g==
X-Gm-Message-State: AOJu0YySMxKgjufe2OvHEAaPinCPA+zdNGp2rvtHHa7AafJ9zrLpQlDx
	nVqKpVwhc/Ut58kqWdAvEXv9KA6zDzK4sy/MlQCg4TiXWr9dRB14vnmUCLMMD3ClHJMiJHnLiTy
	uyg0=
X-Gm-Gg: ASbGnct2ZWGrOmYY4Txhwakl73p5IRWWQ+CEidvmFvqHIZYE1l54m5zOPqjPS4N9vHL
	y+Nj5uBn8XAMpYZGgPKjGKcZ3xWyCvmdQQ7f8Fka25CI8maBjYGIo03qjRkD2zaOJt4DhB2tcDE
	SBHGqj20tSwWXXJrWm3oGYVvgoc6Leh97r2Qgp+rTAj/1QJccx6oumA1FUc9eT5Hv68TPjySgY9
	IOeS+fzKhqD1QGLAoT8v0QtzUwKZrxoupImXmH8NBKwCajn4XF7JgZ7Bo0DdHcIwqL6FHUISWBG
	ke7eKihONiITdsEb4VTlUpeSPZCUhtS/jqgHDeephjPK2cDaTz9ymfP9jGt+cHcXgSI2KwL4BEC
	muJSV7Q+14MDQ6bvUS2bMQG6q6nQKak2e09SVjd4T3lvS1YVlEDat/7s9cd/3UQAygk2DD0euFr
	A=
X-Google-Smtp-Source: AGHT+IF2QWCHbTAObS7nDBaTJMvC3i63bxSUzXfhy7g5nsIjei4FJvSWRcK9EvWQJ5ryoIHlYZkW/g==
X-Received: by 2002:a05:6512:2282:b0:55f:4f99:f3cb with SMTP id 2adb3069b0e04-55f4f99f618mr3561895e87.15.1756470061985;
        Fri, 29 Aug 2025 05:21:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dbb6dsm600774e87.13.2025.08.29.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:21:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Aug 2025 12:21:00 +0000
Subject: [PATCH] media: i2c: imx214: Exit early on control init errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org>
X-B4-Tracking: v=1; b=H4sIACubsWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNL3czcCiNDE93i3MSS5AzdZJMUIDQ3MbJIMVUC6ikoSk3LrACbFx1
 bWwsAlYcLi18AAAA=
X-Change-ID: 20250829-imx214-smatch-c4d4d47428d5
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Now we try to initialize all the controls and at the very end check
ctrl_hdlr->error to check if one of them has failed.

This confuses smatch, who do not know how to track the state of
imx214->link_freq.

drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)

Fix this by exiting early on control initi errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Right now we are handling this with a quirk in media-ci, if Dan cannot
fix smatch in a kernel cycle we should merge this patch.
---
 drivers/media/i2c/imx214.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..7da9e8fa2b622adba53fa6b544bca9859da23e3e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 						   V4L2_CID_LINK_FREQ,
 						   imx214->bus_cfg.nr_of_link_frequencies - 1,
 						   0, imx214->bus_cfg.link_frequencies);
-	if (imx214->link_freq)
-		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (!imx214->link_freq)
+		goto err_init_ctrl;
+
+	imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/*
 	 * WARNING!
@@ -1101,6 +1103,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 
 	ret = ctrl_hdlr->error;
 	if (ret) {
+err_init_ctrl:
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		dev_err(imx214->dev, "failed to add controls: %d\n", ret);
 		return ret;

---
base-commit: 16428e2449ab96cce27be6ab17b750b404c76c7c
change-id: 20250829-imx214-smatch-c4d4d47428d5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


