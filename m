Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E6677BCB9
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjHNPNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 11:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbjHNPNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 11:13:04 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0C4EE
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 08:13:02 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe4cdb724cso41283825e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692025981; x=1692630781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHxvfmBq2wQcZEqJeTw0BxrGFmAlBN3kn0Ir0lpbaw4=;
        b=fFr7IcU9zLzY9T98mm/BX6HDp6EPfkSf0pa6+HInbwRrBiiNuwg7mKic2vgtpYiu7F
         AHF6wbKvVCjLnPHFn82VKtOr0mZPq3H4dkk8TzWnEzKLVGP8J+sFqjFPdiiMAXTzMDk7
         IWrIfTrw0Q3Pg0aAbBXf7JMRrrsIbCiTdnIisxgPdBwqHZgTrppmfdQPp//z+q+SMPf+
         aqUpo6mu52HGqJ7wqqF6o68HQH1wQoC7E2y11b5p33ocUH6Lg2k+MQPOmri3TzLu4EUM
         f5tUWteos/mXBsjL5Akns2qdyoUKPANSCrhjUe0fqxttcrKb3O/DOO442lkkuHI7QDuE
         L2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025981; x=1692630781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHxvfmBq2wQcZEqJeTw0BxrGFmAlBN3kn0Ir0lpbaw4=;
        b=Y9YkZoBF+YQ+TdLG1Vd5RaEG8yaAbRgPBxVCm29sc858T/L+iRwLJlNznd1IoU6dgc
         6HI+7IZOJkH6FiHtUl3HBUoy79zsUddP4gXzAC42HnoeY35arKwQRizylikZM5gAPfDZ
         5t6LO8DF2b6AcTKRRk2TilPjZTF97EwtoKky6kFts+QKDDLyU8bJ4j4Ys5ysK/k8/0yn
         I5EzCxGk2LT4jqzJH6sIDt2SUBtLy+DnzJw+3Ee6sSaFpofKEL3Cp/IRBZKJjNuVV6+U
         JqNqhNI6YVa48E6x5UcY092uD5BPbN4Mby6VFt7ZpyV9bvR4/Wgk57R6upCvusDGJY0p
         KR2A==
X-Gm-Message-State: AOJu0YwR6kVnU0SI6VsjK4S2YDUC5GJm9UT3fWXUuHLDv5JuVuORvzrh
        i8c1XpntKITDALt/Oj3lt8iGyA==
X-Google-Smtp-Source: AGHT+IEjFG0DujsHM87qHijilhHZRGP0bl7W5DcJIBGkrJ8/GOZB/NfMGN2iEl0sAhH7Fd/jEeNlQw==
X-Received: by 2002:a05:600c:3789:b0:3fe:1c11:7788 with SMTP id o9-20020a05600c378900b003fe1c117788mr8121542wmr.33.1692025980951;
        Mon, 14 Aug 2023 08:13:00 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003fe1c332810sm17644572wmi.33.2023.08.14.08.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:13:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v0 11/13] media: qcom: camss: Allow clocks vfeN vfe_liteN or vfe_lite
Date:   Mon, 14 Aug 2023 16:12:41 +0100
Message-ID: <20230814151243.3801456-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
References: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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
index 8f48401e31cd3..73380e75dbb22 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -437,6 +437,20 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
 	complete(&vfe->reset_complete);
 }
 
+static int vfe_match_clock_names(struct vfe_device *vfe,
+				 struct camss_clock *clock)
+{
+	char vfe_name[CAMSS_RES_MAX];
+	char vfe_lite_name[CAMSS_RES_MAX];
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
@@ -460,9 +474,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
-		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1") ||
-		    !strcmp(clock->name, "vfe_lite")) {
+		if (vfe_match_clock_names(vfe, clock)) {
 			u64 min_rate = 0;
 			long rate;
 
@@ -543,9 +555,7 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
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

