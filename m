Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9098F784B11
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 22:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjHVUGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 16:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjHVUGk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:40 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3253AE47
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31aeedbb264so3036032f8f.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692734795; x=1693339595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJ2VKKNJcWBxsnE8fA4GSZFE3NOH8fxJi08OtAhPrEw=;
        b=mNvKMnHZpUgmIcopeD8Ka6HB1CjCaeg+3MBlLKAp1ZqKrBObHsIPnVrfx1b5hRhbpz
         D0MLXlrdnZDOx84YsDHdM+cRxcAoxTEVLSbmwmxRoEr8MlSu00ZtwQhH0AD/zRxwli78
         N/xMgAo4M4oyi7noM4hABWRVGDLATi4cVqsUW7TaLP1QtEk5OZHnUKlfR9o8VQ8d1k9O
         xyZSbvX0lDcl4hKiOi609HrYUfYT8XsO08THJhYYdjC64yTA61eMjd9uX5FZNHgf9RsY
         PHXoEWY31uvEo9KTd3WBnSwfZEmuC4trhFGqmudUwcDHfoLMXQZK6RhXphf9+tirGaph
         VDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734796; x=1693339596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJ2VKKNJcWBxsnE8fA4GSZFE3NOH8fxJi08OtAhPrEw=;
        b=gIptqYSAygDT/ocU60UaAFkP8/bijx6Ls9a3rAMrZ4rH5tJgCrWjQEhBKpGxIeJaGD
         r8FpVGFgIAFysITNo3wa7ZoXInZiz1MXRAgJZGS12mJTRGqkQqCwDJSHRqJB/8A2FVy5
         hvF3+7FTgXHupq8wgJKuiG3KJLd3jDvIbW8q97pZq46X9raTypYUB4+dQn0mUt4Sbwhc
         ZrydhPsDfgLgWR1GnrfdPfgEqYdl429LZsosMHIf3A2QFxjpXJW6BG68VqfRcm3YbI2S
         husrhbfgE300KjO4I81p2hyEl2c0MtGbW06LyDM+RdmkgPiUwzKPSSTRimV60RVtrHpz
         PlvQ==
X-Gm-Message-State: AOJu0Ywm12bUmAhRWWHtnPsmbkzxuXiz1zad0weKfnxsul4hbMgPP65F
        Ih0x8BoD2Hi2tGgwpaSBKAAynQ==
X-Google-Smtp-Source: AGHT+IHqSqIZ1/zkCPCh2/tNtxOXi0IsYdOY9eaoZrSN7DLj6sqQC7PCqYRiWK35jeH26vmbqfBvNg==
X-Received: by 2002:a5d:44d1:0:b0:31a:d2b2:f29d with SMTP id z17-20020a5d44d1000000b0031ad2b2f29dmr7643714wrr.8.1692734795807;
        Tue, 22 Aug 2023 13:06:35 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aeca90e1fsm12873690wrn.70.2023.08.22.13.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:06:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 5/9] media: qcom: camss: Fix VFE-480 vfe_disable_output()
Date:   Tue, 22 Aug 2023 21:06:22 +0100
Message-ID: <20230822200626.1931129-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
References: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe-480 is copied from vfe-17x and has the same racy idle timeout bug as in
17x.

Fix the vfe_disable_output() logic to no longer be racy and to conform
to the 17x way of quiescing and then resetting the VFE.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-480.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index f70aad2e8c237..a64d660abc538 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -334,28 +334,15 @@ static int vfe_disable_output(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	unsigned long flags;
 	unsigned int i;
-	bool done;
-	int timeout = 0;
-
-	do {
-		spin_lock_irqsave(&vfe->output_lock, flags);
-		done = !output->gen2.active_num;
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-		usleep_range(10000, 20000);
-
-		if (timeout++ == 100) {
-			dev_err(vfe->camss->dev, "VFE idle timeout - resetting\n");
-			vfe_reset(vfe);
-			output->gen2.active_num = 0;
-			return 0;
-		}
-	} while (!done);
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
 		vfe_wm_stop(vfe, output->wm_idx[i]);
+	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
+	vfe_reset(vfe);
+
 	return 0;
 }
 
-- 
2.41.0

