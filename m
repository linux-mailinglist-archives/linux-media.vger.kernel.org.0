Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1A479B793
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234402AbjIKUsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237795AbjIKNOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 09:14:32 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7895E9
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 06:14:25 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bed101b70so556507166b.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694438064; x=1695042864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TCXlkx9FBx7XbMn7VMNDwyuOtzJKgBsRO7jREukP4c=;
        b=Y56b8e+YU9PnufBoGgPTApzgOXcK+2g8EuHQ6pN8bzRIIHBormuQdUdQGGYtp6JAii
         9lRh8htmjCpb9vGYNhTHrB0uN36c60/tnX3rWrQq/6kh2AdMhWVFtosDRP5xnDNKa5p+
         lkhVYlNCHpQcrOJ8wFhp99gL0wIuh9axnDgEI9g+zGw1LTczB33ocgoudJ07Wee8aqsH
         6ZDoTPtp7TOiavw2vSgnpb/YT81scTSm4a6XwSJpc0nha8svVjdcfXll33JAroDBeaHe
         sQJ6ZzluurGOhRgMhPKFbgDp1NmoJxuMTLbbe3KOBhnP4j5UU5eQYH3Y8ylhZdQh2sia
         6uFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438064; x=1695042864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TCXlkx9FBx7XbMn7VMNDwyuOtzJKgBsRO7jREukP4c=;
        b=Y9HdGYsk/y7icsefrV1+loSRnV8rteTeQX2dTYbcmW3rD3V6xSU5ILdYAY/5rrDvwt
         CHYwuQbAH9PwtWT5NPzzpzZf4IF9xtajEBuPDUv/HMeoEt1qPYo94mlQfNzo6oj4BjQ1
         ElM00+7IGH9Ap+Am1UgNI08CPYrQxev/2+o0LoMmrucVFi6foYBeO7IojJIp9gyDPm9H
         biEJ++8Mhr34/OqLRS2J3gbLD0hQJ0sGTV6XUzG4B2hzQYDJzQmHkgR833tF4cFMAmxr
         cAnmFDHCrJJ3ejY7+PbUqt5TOiD6IBT9ioJvx0BdTyU3QhiJU3j1xaQET1abUq1aXhC0
         cCkw==
X-Gm-Message-State: AOJu0Yzhv4z5VlPxw0iZ4qo1TWyjLMFA/OKFO9GFkgWYuaQmi0sA9RSW
        SUhYsIXBTqbkEzWjs6Br6rb+Vw==
X-Google-Smtp-Source: AGHT+IFZzXhiNfwKFMF6Zm2cRmio9F67gVYIwv8DcTVRfvwtJ3y2kR4pCcWDGQrHs17pzDMQ4a2NaA==
X-Received: by 2002:a17:907:2cd8:b0:9a1:c357:c743 with SMTP id hg24-20020a1709072cd800b009a1c357c743mr8074375ejc.52.1694438063804;
        Mon, 11 Sep 2023 06:14:23 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b00988e953a586sm5313648ejb.61.2023.09.11.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:14:23 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/17] media: qcom: camss: Remove special case for VFE get/put
Date:   Mon, 11 Sep 2023 14:14:03 +0100
Message-ID: <20230911131411.196033-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
References: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From sdm845 onwards we need to ensure the VFE is powered on prior to
switching on the CSID.

Currently the code tests for sdm845, sm8250 and then does get/set. This is
not extensible and it turns out is not necessary either since vfe_get and
vfe_set reference count.

Remove the over-conservative SoC version check.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb3 # db410c
---
 drivers/media/platform/qcom/camss/camss-csid.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 99f651e2021cb..02ae3f5cb0c0e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -159,15 +159,12 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	struct camss *camss = csid->camss;
 	struct device *dev = camss->dev;
 	struct vfe_device *vfe = &camss->vfe[csid->id];
-	u32 version = camss->res->version;
 	int ret = 0;
 
 	if (on) {
-		if (version == CAMSS_8250 || version == CAMSS_845) {
-			ret = vfe_get(vfe);
-			if (ret < 0)
-				return ret;
-		}
+		ret = vfe_get(vfe);
+		if (ret < 0)
+			return ret;
 
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
@@ -217,8 +214,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);
-		if (version == CAMSS_8250 || version == CAMSS_845)
-			vfe_put(vfe);
+		vfe_put(vfe);
 	}
 
 	return ret;
-- 
2.42.0

