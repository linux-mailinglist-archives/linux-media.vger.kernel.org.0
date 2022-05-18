Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCCF52BCF5
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237908AbiERNaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 09:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237979AbiERNaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 09:30:09 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A045B972A5
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:30:08 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l38-20020a05600c1d2600b00395b809dfbaso1057916wms.2
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rMq3wtgdWa638xFl37YBKw35mdAeVWoOmMk7IagjbL0=;
        b=imaQStz4jhD3xQX6A/kF0adZYAG0NDXBwIXg3cmu2KcdR9ePDEJfjTuT12pRnoC+8Z
         I17OR6sfQfpxUR1Z5h3AD5NcKYMEF5tC7aMALyt5lIhf9+lu3t0g63ZjEsmSnm35GEl1
         eJjkliWPNrV2VMApNpPxfYDzrCsHmCPMM1cL80a3Zhg/WwV3E2YS7+fqiJk08Yq8DTrS
         vs8UjJwm/dqrkHELzEbfhh6CqO+mP32ZUqS5SFF6hCkxhL0LqlyWIhm5tocGHHRA6vJH
         c7xrnb2XX5Lv8LisPg1LgYk8bLzS3oLafla109CwIyaLYUwp105zN1ZxGO+4GwQEHMkW
         dMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rMq3wtgdWa638xFl37YBKw35mdAeVWoOmMk7IagjbL0=;
        b=30sHpS1yqoFcWl4HQzWJ3jY8RNimrQXOwwmNkpT1X7RhnGiUnzqGJt7IvgybGlCtuW
         P612XXBfYWCAzmr7Mqi8zqy/wFpOkomQPVbLvbYGGuQjZ5e4kfQLkZ13IZB342FWTtlT
         +GOeXEq9USzHpHD0ixM2nHTaontY4TBTEcHkeXHzsuXLZ+74D+sJhC+D3wbJf+buVEmU
         99gZfssKy90QLgwWFZBEfGkrSWkMCNuc50kzLCDIyzgAUyt6HOwFDogIsb0bY4TMK2oS
         Qu/+bScHYwM6oUWBqP1vUkZ2XWqzl2SQRYATPzBsM1ivzrW/3eAuHNiBc/FOqWaSd1ic
         NTWQ==
X-Gm-Message-State: AOAM530Vnq+SfjIe3ZHWJhC8rcHoAH1XnSb1RLyKJBCT//LM8Cx9FucT
        L8AQYvteT9F9Ba2gqIeHu+Tyxw==
X-Google-Smtp-Source: ABdhPJyHGsc5U1Y1zW/pY7IAMb6cT8LEH88fuMsAlvBbFqV8t9/KFU7viwSxO7vwvnyr1YBxNxaflg==
X-Received: by 2002:a05:600c:1e17:b0:394:547c:e5a6 with SMTP id ay23-20020a05600c1e1700b00394547ce5a6mr1824wmb.203.1652880606872;
        Wed, 18 May 2022 06:30:06 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v14-20020a056000144e00b0020cdf6ecafbsm2905580wrx.81.2022.05.18.06.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 06:30:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/1] Switch on IMX577 on RB5
Date:   Wed, 18 May 2022 14:30:03 +0100
Message-Id: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Linux-next now has everything we need to switch on this sensor both in the
qcom DTS and in the imx412 driver.

After this, no further dts or driver work is required to capture images on
the RB5.

Here's a bootable linux-next with a kernel config. I added Vladimir's
power-domain changes on-top to verify nothing breaks for me.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-18-05-22%2bimx577-rb5

Bryan O'Donoghue (1):
  arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on cam1

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 98 ++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

-- 
2.36.1

