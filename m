Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2403797902
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 19:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240184AbjIGRAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 13:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240180AbjIGRAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 13:00:16 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A2E1FF9
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:59:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-401b5516104so13094505e9.2
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105918; x=1694710718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwcHAIcWBLJgaFSQPPVwbdgX5AY+gP8RU9uRq6s//uY=;
        b=x2SHwgxklE/eqHpCscl0JifKWpamNJrwGqHq1IEmhdhI0m/WWiW1m6mX1Px5nEYdtQ
         TIA2RTJlRzraXbESzr/rughmrOamr5aHX9J7L1t/gura3ByPXEi/rPdBAknjW9PVVV8X
         zbn3nUxcdkk0RJpMG7xldvtwckVl/XQfeJuU9NFOcC2bgjPtP61MOmi1JV+/pDj59wOL
         6lwX66YZiangkewDAEfj/mVEQwzybjxtQhpfwIwYbMvet5/5cv7Vq6Mv62ON/RYm7wB3
         NDQTUeXMXDXqBLLgbEdt5hjzQ1Dzrkws9CkBcWKquGXIiRG1dyr4irbuZqWiTHGEsj8u
         PWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105918; x=1694710718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwcHAIcWBLJgaFSQPPVwbdgX5AY+gP8RU9uRq6s//uY=;
        b=TV641ypMXUKJNVv5OEvya3i3hFilSleyVoaqVZR76VdTAZJ0w32n5q5Kj/8BikGh0k
         FgVFJlTxzim1aVQ9PgRWfrCHUT6VP9JNpy7cQAiZ9TkwgVq0QOXwJOQvZ3OeWYMDyWGy
         ULytVaTlS4mlv7abRL76+1gJY3zQBCa3W+ij2Vm5k7yx2ulo4FOUj4piTfM2q6aedyEi
         CHRdSOinWFVbtWdgPzFIum0FCvpH2Qum5OOcGs4o9+bhKh4hdDBOxvxtazIOr7sDki4F
         mi2//7T9ewf9UQ2mDyuRH7X9bB9CB++g7f2QpFPWKFLewa3K7eELbPaF1i4HvikXRLGW
         8rjg==
X-Gm-Message-State: AOJu0YzHDC8QfKHhMbxpHodCdLXYghwz0vvgkllcBMF0eLe7RuZ0HFjP
        uVRSoJcucGXgMvN3BwrqheIYXIcyZeynX2CTahA=
X-Google-Smtp-Source: AGHT+IGI74jJS2lLMQ7WQZ30fEqVq6xagTXB+9/TYDSpq1UToqDG3+wKhhhWajVHYTAaSq6j59RRGA==
X-Received: by 2002:adf:cf0d:0:b0:317:7441:1a4 with SMTP id o13-20020adfcf0d000000b00317744101a4mr5783702wrj.29.1694105069227;
        Thu, 07 Sep 2023 09:44:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/17] media: qcom: camss: Allow clocks vfeN vfe_liteN or vfe_lite
Date:   Thu,  7 Sep 2023 17:44:04 +0100
Message-ID: <20230907164410.36651-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The number of Video Front End - VFE or Image Front End - IFE supported
with new SoCs can vary both for the full and lite cases.

For example sdm845 has one vfe_lite and two vfe interfaces with the vfe
clock called simply "vfe_lite" with no integer postfix. sc8280xp has four
vfe and four vfe lite blocks.

At the moment we declare vfe_lite0 and vfe_lite1 for sm8250 but never set
those clocks because we don't match the strings.

We need to support the following clock name formats

- vfeN
- vfe_liteN
- vfe_lite

with N being any reasonably sized integer.

There are two sites in this code which need to do the same thing,
constructing and matching strings with the pattern above, so encapsulate
the logic in one function.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index db8f68819ded9..f3cf387e4907e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -431,6 +431,20 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
 	complete(&vfe->reset_complete);
 }
 
+static int vfe_match_clock_names(struct vfe_device *vfe,
+				 struct camss_clock *clock)
+{
+	char vfe_name[6]; /* vfeXX\0 */
+	char vfe_lite_name[11]; /* vfe_liteXX\0 */
+
+	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
+	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+
+	return (!strcmp(clock->name, vfe_name) ||
+		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, "vfe_lite"));
+}
+
 /*
  * vfe_set_clock_rates - Calculate and set clock rates on VFE module
  * @vfe: VFE device
@@ -454,9 +468,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
-		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1") ||
-		    !strcmp(clock->name, "vfe_lite")) {
+		if (vfe_match_clock_names(vfe, clock)) {
 			u64 min_rate = 0;
 			long rate;
 
@@ -537,9 +549,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
-		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1") ||
-		    !strcmp(clock->name, "vfe_lite")) {
+		if (vfe_match_clock_names(vfe, clock)) {
 			u64 min_rate = 0;
 			unsigned long rate;
 
-- 
2.41.0

