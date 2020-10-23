Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2D2296FCB
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464133AbgJWM5X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464125AbgJWM5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:57:23 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC57C0613D7
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id n18so1708708wrs.5
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NrL1MV7N8ATs/PXzXCVKhIPAGTP6zOyD9l2GObHN45o=;
        b=aNLgRz5OfNWd4OVUswB3R+mClvdaOMsQ3yNLaj50D2E2YZeDMQM7UOwmkIS+rq8Qsr
         VIZy440MXqYI8mkQ4sKRjLfH7Xo7N1FpVP9hD8sKyeiAXnzlp9dJya5yd4wfa7WRqk2X
         v4Egaa5GIejStfexy1x80XFxLIROT0PXBqGIKW3XzT/0kI2A1nVvccj1EWOK5AfAGGx4
         TgFiDRwHQEZA6Ld9Nylc/SZAT0dqMngLX5wsZNKNroPum4pA9oI/Q8Dcft0shtYhNLrO
         oVzK50Ajoi44aIlj/yTieRcj1OUiujthKWsGt3bNkIZKxvekXsx+JfFWzTXUJsK9vK4F
         fDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NrL1MV7N8ATs/PXzXCVKhIPAGTP6zOyD9l2GObHN45o=;
        b=OVGgLVg4oVrAUqkx8tvspGT/c6rjfQ4gF8zYHn4XsGXwNecRzNWGRqag68UtNc59P2
         0KoBAmWgbvdhidqiy2VtoBr0wqx30XL/jfRSUgd41VTlOb6hehApVU+vEEiOI7V2NLP5
         chyWsuIk8lVs/JNm+v6QosCA9Ah2lj8NBbPxTkLvI6riJpoJVZtj9k3UNz2uYsja5U//
         z7GlHdm2P1etEchpR9wB0iEu32yrxYl3HXgvcWYybvOQ5KytULw55CF+aR6bKCdDlBgG
         jhhxCFZdWwpPctYWP9au+5fw7yiHOgeKs/ZAhg+Dx3U5u3brIGUJRDQZ9p8loW2OO1OZ
         FU1g==
X-Gm-Message-State: AOAM530O95ZmziB/YMALQtypvJkxr7K4YfK3pMV1+Bl7vm5zYpldpitP
        FPN7WMfxoup/mcwyYZcfKQUgwnu4jHreXciA
X-Google-Smtp-Source: ABdhPJzXsFAYq8o4JA+bX89U8lRgr1JK8t6fu6sP2QaoFHcwf0aAu9vq25qV4YFATQUCxuV89vzmEQ==
X-Received: by 2002:adf:b787:: with SMTP id s7mr2636696wre.390.1603457840965;
        Fri, 23 Oct 2020 05:57:20 -0700 (PDT)
Received: from localhost.localdomain (hst-221-77.medicom.bg. [84.238.221.77])
        by smtp.gmail.com with ESMTPSA id s19sm3475873wmc.0.2020.10.23.05.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:57:20 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/4] venus: hfi: Use correct state in unload resources
Date:   Fri, 23 Oct 2020 15:57:01 +0300
Message-Id: <20201023125704.4984-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
References: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

INST_RELEASE_RESOURCES state is set but not used, correct this
by enter into INIT state once the unload resources is done.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c | 2 +-
 drivers/media/platform/qcom/venus/hfi.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index a59022adb14c..1480a76d4da4 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -376,7 +376,7 @@ int hfi_session_unload_res(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->state = INST_RELEASE_RESOURCES;
+	inst->state = INST_INIT;
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index f25d412d6553..e9c944271cc1 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -87,7 +87,6 @@ struct hfi_event_data {
 #define INST_LOAD_RESOURCES			4
 #define INST_START				5
 #define INST_STOP				6
-#define INST_RELEASE_RESOURCES			7
 
 struct venus_core;
 struct venus_inst;
-- 
2.17.1

