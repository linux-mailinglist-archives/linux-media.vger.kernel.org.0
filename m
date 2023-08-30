Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E22478D841
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbjH3S36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245459AbjH3PQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 11:16:31 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A761A4
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:28 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so54552905e9.0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693408586; x=1694013386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KIMxr1F1MR2h2+mqKRkXjNnFpbeeayJcHKqoZjQQsY=;
        b=OXKAZpB0h6XHYMdCyW8RfBKPaxcvifWODJragGxgv+4JwJ6zciVUHhY/PJJjldcUgA
         JC7/9suujVrrQJm/xzO986OwQK1IyLqzUIsrBfgmYq3ycHGfKYedGwcJ58Pe1wYxIg0J
         ZTKV9GAutm+QsI94JpHGNE3YgYILk1QTLgPdRILt5M1pFkL1Y1sc+gPDmLe11CIdWaMu
         WChBXQaV8UOTGgmTux+2ELPxU75tmwD7idCUJrhi8QdPBXlajLCQSqI4mG3upSUs0Laa
         srej5dY0UuoBQBf3nq0mVBB1RQY9gYOPHKLlF/nfrA2LhLLlt/yubaFQxX3jNfNCq25f
         DM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408586; x=1694013386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KIMxr1F1MR2h2+mqKRkXjNnFpbeeayJcHKqoZjQQsY=;
        b=R5F1uk46YjvCz67u2iQ9/f1HBbqyndAFnNV0X2VujlO9cIOZKbdJGTTifBScRn+SkG
         R2jR2MlzHS89JRYMSULjcqHKFKPxnXZZZV4B7ZSvtWCz6vQlCZ3Dp5WCVbA0FySDAzBi
         ETh/2tki+T1aSRdwtbkpgdnHQYPD0TuocyvMOA/DDdDBamlVF3g/75MYnsvrd0VDHeP5
         Q7fkvnr3GdzIcjFR1sqM9iVr3z57GMdWTmHgogOyO6h4PJ4A4ykk+aIz82hkbeidsHY0
         ex1KUOKS2c1koPLo2olgurapSfsDlp10nFb7pqAzEoPzqPQJ+30kE0D+aslUzwPAopTN
         EjBA==
X-Gm-Message-State: AOJu0YyYJUpUwcD6Scfn//Yl+AvrXWyVRdUypba6aCfXp+uYTMd2mkj6
        /wCjFJ+6pFZPLIGLcogXwHkJ9Q==
X-Google-Smtp-Source: AGHT+IGLGy4V+kOvzFjlyXUBjO/5UGTdiimSA44ymzUkR2RS+k/8pZ74R8cLnKUxO+YtC/mxTDFJww==
X-Received: by 2002:adf:deca:0:b0:317:5a3c:ed28 with SMTP id i10-20020adfdeca000000b003175a3ced28mr1981661wrn.6.1693408586673;
        Wed, 30 Aug 2023 08:16:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0030fd03e3d25sm16989961wru.75.2023.08.30.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:16:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 07/10] media: qcom: camss: Fix missing vfe_lite clocks check
Date:   Wed, 30 Aug 2023 16:16:12 +0100
Message-ID: <20230830151615.3012325-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
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

check_clock doesn't account for vfe_lite which means that vfe_lite will
never get validated by this routine. Add the clock name to the expected set
to remediate.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 938f373bcd1fd..b021f81cef123 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -535,7 +535,8 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1")) {
+		    !strcmp(clock->name, "vfe1") ||
+		    !strcmp(clock->name, "vfe_lite")) {
 			u64 min_rate = 0;
 			unsigned long rate;
 
-- 
2.41.0

