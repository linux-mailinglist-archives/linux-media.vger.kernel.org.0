Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF4579792A
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 19:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbjIGRE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 13:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbjIGRE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 13:04:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075AF1BF
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 10:03:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50078eba7afso2061189e87.0
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106173; x=1694710973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IGORlEL+j7QOCTKX6XyQpE4GsPUdQpP3Lht2awpSqA=;
        b=pXE1ZlHTW0yF4o5eNXpsm94SoAe8nE4e82QMqxatSypfoEq5E1nbQ3O6bWLq/GT6n4
         icA4l9r/dxF45DHEzbnjQJgunDeWRRfRzuofCQnKf2aYq7StrO29i3CE1CANr2i4DDeR
         tBPX4sc2dzMIV4xAevYXq7wYagkEIHx7ZuNWXoHw8Mj+V5sqCljr6QZb3yA1s6GngPGg
         /OAFNX0NxhmFxXgCtCeMUX1axHmZCTwc2dtTfEQyBeQ+sS21r0WUydr6B2q+oej69WeV
         PIEcr3a5T/ifIYkwf503ouhv9FAEwGe8czSoZNRY0QtHTJ+R1ysppHV5jL0pww54gTcc
         8iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106173; x=1694710973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IGORlEL+j7QOCTKX6XyQpE4GsPUdQpP3Lht2awpSqA=;
        b=PIyWnINamvrri9F/J5EH0Z9TU5oI/WdnH1gKMpVcIoF9euIH4kAECKclVCWPXOm9R+
         2qr3NZ4qesS1gXRkVSft1RCX6raJx15k2oB8V50TOuWWglaWHpJESJcOjfNLjvF4ajld
         z+raRgAPqnnBPQIJiJviW4nrSrv+vqTpHmJ7OdiqKYQ+RbzDie461p/R5rXbM20ZGs/9
         IQHwKNQraybKDQbcRaxReuQmb8mWBNeQV3MzAcMAiPnLe5IDeUhTpqVAvJlL7mf488pm
         8JfV4H2S9MR2oznvVISljEka+kNWABKv631t1vvhIizEY+8UzEm59Vq+A+wp7aSHsbQ2
         gBPg==
X-Gm-Message-State: AOJu0YzQ15IMI8U8UiO3fCaFLyhmIrFlIVvhJwTOZEGBLychhvj/E+Mc
        6EQHNbHU+kzugShAO6ObY6l6byFvf41sGO0kUos=
X-Google-Smtp-Source: AGHT+IFFhtFOfyjIUjTQaoISN3ahU3GulYsY3a4nJuObsLIa20hRbGZNlKWDpuep8zKWObREFaQEoQ==
X-Received: by 2002:a5d:6504:0:b0:31a:d4a9:bdac with SMTP id x4-20020a5d6504000000b0031ad4a9bdacmr948wru.11.1694105072392;
        Thu, 07 Sep 2023 09:44:32 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/17] media: qcom: camss: Fix support for setting CSIPHY clock name csiphyX
Date:   Thu,  7 Sep 2023 17:44:06 +0100
Message-ID: <20230907164410.36651-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
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

Several of our upstream and soon-to-be upstream SoC CAMSS dtsi declare
csiphyX as opposed to the older clock name csiX_phy.

Right now the CAMSS code will fail to set the csiphyX clock even if we have
declared it in our list of clocks. For sdm845 and sm8250 we appear to "get
away" with this error, however on sc8280xp we don't.

The right approach here is to set the clock when it is declared. If a SoC
doesn't require or a SoC driver implementer doesn't think we need, then the
clock ought to simply be omitted from the clock list.

Include csiphyX in the set of permissible strings which will subsequently
lead to the csiphyX clock being set during csiphy_set_clock_rates() phase.

sdm845 and sm8250 will work with the code as-is so I've omitted this from a
suggested Fixes list.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 87d6d65aa90cf..5202bfcdbc35a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -677,6 +677,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 				if (csiphy->rate_set[i])
 					break;
 			}
+
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+			if (csiphy->rate_set[i])
+				break;
 		}
 	}
 
-- 
2.41.0

