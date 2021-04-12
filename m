Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E61E35C7ED
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 15:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241996AbhDLNs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 09:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241917AbhDLNs5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 09:48:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD1CC06174A
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 06:48:39 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id y124-20020a1c32820000b029010c93864955so8729904wmy.5
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gytAL/yvWV0C/C+QEAvYYaxpKrXZ+OUo1TE3J+Md6ys=;
        b=D480wbwNLKlAyfVkcA1JsZYy/BJ1qJcaF1+jY+CkOsjJHpVeQgIGm5L3HiubXoP8np
         qJGDbnjgWUSL2ISmwd0pUK9fe45YRl9xlkHsUWjhnmX4Hd0Pbfj+QruFYy4rTiIOaILP
         +chfTiiw9AQFz07iI9oPx6sLocK1jrGfb96B3XJluj4PLSSI3v1xBXE4S+YHGhuLwqLm
         DQCyLZXlIu8fz+SfZAXs9WGaSRZAeJ+twZQ5HdfGYyI8uAzkllHhlM1nQgAzwbTsr2RX
         XhgR/B7hLRaJC60Dva83D3+9WoS9fwuWdXcINw6EAnGGVMBQVszVzbgaV8Yyegtm+QGW
         T8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gytAL/yvWV0C/C+QEAvYYaxpKrXZ+OUo1TE3J+Md6ys=;
        b=NCiwBfEQIqHnnFqrsazZB4goxtI8+EB898t7gVNeJyHNil+1OosBQib0Re2cWUeN0p
         dcXYyEQCbLp5DXJ5HhEyXSjbZ7JJ+C9EehhhaNivw5tBTONZ5hPjQOVpOrgJoik1Un5O
         070+5lFoip903WRP+3Lkgbsle4a1FlBWHlFbtJ53arqqOCFGYugxr4JxPPBue3QhxhJ1
         4ryvvWTNo1SQU5aRj7F6tB93MWv3U8aTWoletZPYfHuKoz2toe70IJPtVwAAYeue1Mvy
         rQ/R/0DUOPHnd4co5w/T0QQaonCK041kFGjjvBVjcNjnX9mRx7H7DNlZ/3/Tb/S8q21U
         w3/A==
X-Gm-Message-State: AOAM53290aT9D/hIqy01Yz+b7TvZ/Tel+WmqVTWTTsy0VW0/GV74e7dS
        oQtp8FU19LIIRF8U5jPUMdexfA==
X-Google-Smtp-Source: ABdhPJxR3exKbfRYuJe7lOTxlwuy+IeGAtvwCGj0DHgKIfnlvq/AQ9U/WYiAArEc4CmHRDj65/ogmg==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr27332470wmk.139.1618235317683;
        Mon, 12 Apr 2021 06:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
        by smtp.gmail.com with ESMTPSA id m3sm17084423wme.40.2021.04.12.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:48:37 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: meson-ge2d: fix rotation parameters
Date:   Mon, 12 Apr 2021 15:48:33 +0200
Message-Id: <20210412134833.3467694-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=MnWqbtgLNHEO28iGPrU+2fi2Vi4/zgsTM+Wk44sFw6M=; m=LSyi1GIrRi5+cTBT/6Pa7vdOC7D2by2eVWnO1StDcX8=; p=ddQBmT3ON6PerWL2JNhQ08pBoO1RzWVwzA9FpwbnVjk=; g=a5d89b1dd77083c5c89c5f661408958dbf25cbb4
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE; b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB0T5MACgkQd9zb2sjISdH0yg/+KQL O6DzQoiEzq7fvnh5Cfi3Ivw46p6oSQO4az4sxBwfpC2O0aTprtUvFzwvrDLdhncJisN3lwXEEIjIx CyPheCQT9fR4OWvEtzAYkMf7V6fS0j0RHzYVpwSkk30gpmLby5DRlfAjm9MWX9LkV++Fehgd6bBBF JSmUc5Y9er2kdQOjqsnTJFxafDRJKqwidz0hb5RKd01SANxhGnnN14S6xV5VR3n0hyZaDG5h5rn8D U2Xa+VvSf5pIrRdCRF7WADadib4MIjVJrw5lf8na3bfN+42w4Chn50NoFMftmToxRRsR/eFaKbH2/ 6xXqTyhvng4j2JZrwn6LZuEX30MJaFJRz4iGQEH80gxM8c9t9S+6G/4m10j9ZDxIYsYKxg6eCnHIa Yeidwea1rkpBloTzmN9R8fu/Wd9i8SxA9BdaPIDYjIieCdwy6JDl8SBHqG6rVHgk8ElqI6zlvObaa aNEt7f1l+1c3baq9JlV2EuTXFrcXtoFOwEMIOSM6GXLNke2yIGDgYLM3q2f8V3mg2SSUblG8KgBRt jkBsDFTdzksBPjq4rCC3eg9R+hi4k5Yzb/mql6gLvmOaA+Ixg7C5vW0ocPCRedgFECSAASz8cgSXh u62cWPv2Luv7oHEpYhwfH9M8ZtDtSmfyt9N+DHmvDQn809dT5HSxLSLuvdHSoNhQ=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With these settings, 90deg and 270deg rotation leads to inverted
vertical, fix them to have correct rotation.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ge2d/ge2d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index 153612ca96fc..a1393fefa8ae 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -757,7 +757,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		if (ctrl->val == 90) {
 			ctx->hflip = 0;
-			ctx->vflip = 0;
+			ctx->vflip = 1;
 			ctx->xy_swap = 1;
 		} else if (ctrl->val == 180) {
 			ctx->hflip = 1;
@@ -765,7 +765,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->xy_swap = 0;
 		} else if (ctrl->val == 270) {
 			ctx->hflip = 1;
-			ctx->vflip = 1;
+			ctx->vflip = 0;
 			ctx->xy_swap = 1;
 		} else {
 			ctx->hflip = 0;
-- 
2.25.1

