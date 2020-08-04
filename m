Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEED23BA45
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 14:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgHDMZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 08:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgHDMZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 08:25:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFB5C0617A2
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 05:16:44 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r2so32102297wrs.8
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+3IkTx0hOmYJqAWzeGKVdZJDF3W0OgO+hAR+bSLPvfs=;
        b=FKxSty5ZDUxUvsKEibNbhCFgezTz/r3TbKDBIbQJTgI08POEGigJ8a4bSigyBtbyiz
         SOfgDnuTXNSMgCHGnsUAgFW3EgFlKrkvhCSarGrVcuoacNSMLxr41x8G8n37UTzGl9Co
         zoT1DMvvm4C7FeVH8DWfNmwSfWJPFriGlOrIlB/dJYXGE4KlK/4bgkxqYyZOicoAyISC
         bx55pl1xDO9TL93cr+toXm4c1BewaJXimWr2J6/SXkW+QuQrhtN0fYTuyLN1w2ON1W/f
         Ir4gkeBXKA/9gdQOLh/FmHO7XSrx0HOFUCt+VUK5Rz479sAUEMnlbIvPjTZCb5xJ8IFx
         t1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+3IkTx0hOmYJqAWzeGKVdZJDF3W0OgO+hAR+bSLPvfs=;
        b=KMkfV7+WidmGeSLsEz3FBboGSoL3IwPXlAhf+/sHGmp9NhfsoTAnUOLuXN11d0oiSg
         xDk8RiBOhjnWWl5Mietip2aXHiUuaZKT/PvyqI48JcQZEHPA0KLqhf5mTORZQHX+l7//
         +a1BKa9jDA8x4QmUWvYuvDRjzB2P7SJSYydrFmiiLsNpfgQyvp8NH07YRsZ7+0ZBS2D/
         PAOkv08/jo4MvQezBGi4iCJPn8pHkF6puMp2ChncWQrx15PWgBingSZaecgM/U6wH2Ao
         F96pSidP4uMTJYqcApagaJfxDaGz8/TKX+WkBfQ7PkQEzAn8y5YmsH3Bx5HKixxniaIS
         1ZOQ==
X-Gm-Message-State: AOAM530+D5Hnh6kmlhC20hAgddHTZr+g8Yw4HtxghKV1jvCAju+jEw+f
        YK9a7neJpsoScvoZ2FjN+XMDDg==
X-Google-Smtp-Source: ABdhPJzUdUBliyTCT6JbwaeujYt8TAUOvmg2N6kycDGYn0Ug0xhXaqqlkFcUYoM40/ESFo8vIYW+NA==
X-Received: by 2002:adf:8bd3:: with SMTP id w19mr18947045wra.167.1596543402409;
        Tue, 04 Aug 2020 05:16:42 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id w1sm4235228wmc.18.2020.08.04.05.16.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2020 05:16:41 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     stanimir.varbanov@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        anibal.limon@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] media: venus: Fix reported frame intervals
Date:   Tue,  4 Aug 2020 14:21:57 +0200
Message-Id: <1596543717-9106-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On dragonboard-410c (apq8016) with HFI_VERSION_1XX, the reported
framerate is in unit of 1/65535 fps (for fine grained control).
So the current reported supported frame intervals is wrong (max
is 1/65535 fps), leading to encoding issues or format negotiation
failures with gstreamer.

Fix that by setting the framerate denominator to coherent value
based on the the framerate factor.

The factor is not always the same, e.g. with db820c (apq8096) HFI
reports framerate in fps unit. So only apply that for HFI_VERSION_1XX.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: Use IS_V1 helper for retrieveing venus core version
     Adjust denominator instead of numerator

 drivers/media/platform/qcom/venus/venc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 9981a2a..5b3df09 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -576,6 +576,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 {
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt;
+	unsigned int framerate_factor = 1;
 
 	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
 
@@ -600,12 +601,17 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	    fival->height < frame_height_min(inst))
 		return -EINVAL;
 
+	if (IS_V1(inst->core)) {
+		/* framerate is reported in 1/65535 fps unit */
+		framerate_factor = (1 << 16);
+	}
+
 	fival->stepwise.min.numerator = 1;
-	fival->stepwise.min.denominator = frate_max(inst);
+	fival->stepwise.min.denominator = frate_max(inst) / framerate_factor;
 	fival->stepwise.max.numerator = 1;
-	fival->stepwise.max.denominator = frate_min(inst);
+	fival->stepwise.max.denominator = frate_min(inst) / framerate_factor;
 	fival->stepwise.step.numerator = 1;
-	fival->stepwise.step.denominator = frate_max(inst);
+	fival->stepwise.step.denominator = frate_max(inst) / framerate_factor;
 
 	return 0;
 }
-- 
2.7.4

