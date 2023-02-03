Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0707768A2BF
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbjBCTRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjBCTRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:17:24 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E2CEF9C
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:17:22 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so4649455wms.1
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMYcoycLdQPDhvNJ8NTYUjLBtRJcOozpMT/JV8HIjUU=;
        b=l2YCsMMPR9b54JbdHSOWxzYTL4vHe5MGAxH2fNXpsaaoligB0DdsY1TsyU54z1EvJe
         JTZY+MyWm2t9iYsjHIRmbUb72U5LnKWwUZM4/NETnOhzXt6uSO6NQfiF3gY3CZOaMSqm
         AxBPENI8fhtY3x1sryAy3U8jRzuFuMJFpvZfjUur9rXberpM/cHz8ZhWL88NgESTeMBu
         aoo6HdGTKsnWp+mKd8PsGyXB9VGPRpTDt+t09rvuwVghfwUIjI95GxZLSCdwIiWPv4v9
         1PXqkQv0L7ebas9g84DMEpEK7FJs9x0EGMcHffHaKNy5jb5wvSua5kJ9uwPa7p9F6s9Y
         pK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMYcoycLdQPDhvNJ8NTYUjLBtRJcOozpMT/JV8HIjUU=;
        b=UikzbIm++3XmWMeHS3jBsEN2GkmNmZ9Ow9+mtD2SOrup0pSWv3Zl8waX8dKRoy0sK4
         IHFdHap8/8/sqC6JJ/kRzMGvXNOPZ8MVPDzQYwug5lhgCqUpiIgRLi5fqeiQXuD9vjkN
         h/1ss+UhJ7sKHJilPpYH4S8UwMSwP3nbo7WRT/7n8xtPeOOw3RLsCKDx/ZeyC45qul5T
         PiZlA2PMc9SPsv0IRGBPe1GsQBeEFxJWKURMuE2iFGwXOiv2KgofytRsDYYN2x5a9CCa
         q7qahCjFiaC8YZKun8w5L44LBSQZ07lZOk39UtZB5PJGtSfplR1fmhPeSEMsHn17zXVt
         iJcQ==
X-Gm-Message-State: AO0yUKW3i4P+g7pVZNXfbRW8pq/16NbEaZsFh6yiCoCYBKEJDX4y1RZl
        uY4zl8NuoNom/YBZqdfdJt/T8w==
X-Google-Smtp-Source: AK7set9mo8i2Xkq53GyWQH0NJcp8KXAxbLA5LPGPWg3g5BMZ0NWfcBbd+VF5YqDJDMVnRtariPhA9g==
X-Received: by 2002:a05:600c:3d1a:b0:3da:1e3e:1ce8 with SMTP id bh26-20020a05600c3d1a00b003da1e3e1ce8mr10841715wmb.13.1675451840676;
        Fri, 03 Feb 2023 11:17:20 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id l20-20020a05600c089400b003dc41a9836esm3349263wmp.43.2023.02.03.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:17:20 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/2] Add support for mono version of Sony IMX290 sensor
Date:   Fri,  3 Feb 2023 19:16:42 +0000
Message-Id: <20230203191644.947643-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX290 comes in both mono and colour variants, but has no runtime way
of determining which is connected.
These patches adds support for either option.

Changes from v1:
- Renamed compatible from "sony,imx290-mono" to "sony,imx290llr" which is the
  actual model number for the mono sensor.
- Added an additional sony,imx290lqr as a synonym for the existing colour
  "sony,imx290".
- Broken description into paragraphs.
- Reworked the driver to take a struct for each compatible, rather than just
  the mono/colour status.

Dave Stevenson (2):
  media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
  media: i2c: imx290: Add support for the mono sensor variant.

 .../bindings/media/i2c/sony,imx290.yaml       | 16 +++-
 drivers/media/i2c/imx290.c                    | 81 +++++++++++++++----
 2 files changed, 76 insertions(+), 21 deletions(-)

-- 
2.34.1

