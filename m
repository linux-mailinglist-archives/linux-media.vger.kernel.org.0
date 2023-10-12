Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDA27C69E1
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 11:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbjJLJmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 05:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjJLJml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 05:42:41 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4A89D
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 02:42:38 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40666aa674fso7890585e9.0
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 02:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697103757; x=1697708557; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiF3KTiiR4Oh0BQncYvRim4KBPdpNbmgjcOPih22PDM=;
        b=R1QtCc4sWAYAi8XBWwY2gft+TDt7f8zy4dwTI+RU6uIbafu7zcm8fyQHFR+m00F4qZ
         WkIX6KAh/myMdKySsoNUvi1BUl6MBbAq6FxrVBs3jhW6MW1LmaFwG99J6spQAJqzzWST
         IuhxKyWhkCipYJyyuULbaeK0WneF5UbG4iMroYTSRx+FNVAz/gxbNXE8xlLBPdAJnF0e
         DZp6u4zsOkfKQzsesnK8bVZW1UVBk9vKae2fSa7Q/2gENbiPGgWnjDzJ+MOkvDSivLKc
         Kin1NV0G6EJsetp3jt2H+3APUvcLKDhnpcXQXPbvGrbvS3UzdwUvLcMoFkWDWcRgR/0X
         QewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697103757; x=1697708557;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiF3KTiiR4Oh0BQncYvRim4KBPdpNbmgjcOPih22PDM=;
        b=IOdI2pDDM9wD6An0Sb+3z4iskM+V0JREeIW05kUAkxmwExWzklyvW68vVTb66l6Loe
         9znrASYPtD/FAtNAsL0zuRs22sgjxygXikC66PiT38R89IpAWgvzoxd7tku1JkyuGiWu
         093eAaUqHwpg8YxLgXLa00X91PjLciq1bJJ7mI0Eicvg7wpnK/WJsXT0ZeH60tcERcZN
         B7kB7DUaDOZo2/IR9lUAzlWAZEut1vzRiLTthOY4TBfgjRgj/+RGu6PbL8ADwVf6AisC
         U71vXTUhYVS0Btmyx1vxEL4wyYFa5EU5e7Xm4uIte3GNztb4yyNJsiRANtBg1hHIOEib
         dxsQ==
X-Gm-Message-State: AOJu0YzdDCRXZrHw4pP+G9QvHRBxH7dGUI3PNzh9+I/iXcJT5n+is+ZH
        M6psu1ZJsDslsv9OqjPu6A3ILg==
X-Google-Smtp-Source: AGHT+IEUeZBQHKosDpFY+aJbO9GwqLCMH9ttZl9nGNPvhZCOXO8mWPbqhMFZage/aeI1+JYeoVyfSQ==
X-Received: by 2002:a7b:c84d:0:b0:3fa:934c:8356 with SMTP id c13-20020a7bc84d000000b003fa934c8356mr21790318wml.10.1697103757055;
        Thu, 12 Oct 2023 02:42:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05600c1e1400b0040640073d25sm19340499wmb.16.2023.10.12.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 02:42:36 -0700 (PDT)
Date:   Thu, 12 Oct 2023 12:42:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Robert Foss <rfoss@kernel.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: qcom: camss: clean up a check
Message-ID: <f11b1d6b-5800-4d75-9732-506be3f8458d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Imagine that "->vfe_num" is zero, then the subtraction will underflow to
UINT_MAX.  Plus it's just cleaner to use >= instead.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index be9d2f0a10c1..ddfe94377ee5 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -270,7 +270,7 @@ static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
 	unsigned long time;
 	u32 val;
 
-	if (vfe_id > camss->res->vfe_num - 1) {
+	if (vfe_id >= camss->res->vfe_num) {
 		dev_err(camss->dev,
 			"Error: asked reset for invalid VFE%d\n", vfe_id);
 		return -ENOENT;
-- 
2.39.2

