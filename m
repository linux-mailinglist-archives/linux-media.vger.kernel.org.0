Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A9B683610
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjAaTHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjAaTHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:07:51 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4FB15574
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:07:47 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id t7so6827558wrp.5
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8u9MUcqGJPFEKolVS5GxO0QQI8oiywQSvdO+4XYGjY=;
        b=cM7XVn7a7dnz07Q23IRShl3dtQ9B4gxvNuVmzvZX82y63o4KJ2kZRE6vBdtz/v4U7C
         ZBKbMfI1Y/A9dLJWxTbJmoZqzzhqjHFnGVo3b2UYMUCxBnREmpoYa7UU1owAW+JDu/Ce
         Gn44p6J9eVDuDklkn1lM0bEYUx3RqEbjncuOuA+vRTL8zLzVKY9cUGSQAhAPUhnzU/hi
         s0er1X6IsR3bflH7Vxhn28Y39q6zGIoV24y/OhJL89/1pI5q+dBlhMyr4dzYVIq9IaJv
         veBVIz8UptqW9m8qpLtiCxZ0Kb5I3FF7AT0wKhtysRHrE4hgR3xQJOGdEXL3rW0TTEpi
         5YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8u9MUcqGJPFEKolVS5GxO0QQI8oiywQSvdO+4XYGjY=;
        b=khECTgT1gESFAc9rC+CDzP6WYir3spa3jpu/WTOOaQsOWsz+yeAVSlv9JhfLOevpQG
         rNM0Qyp7Gsq6ae5V4eMlJxr+ys+FyfWi8ESY2rOpGZ0fd1hESJye9wloxs+JMQRGfAkt
         8Eoui8gAzQtL3Sf9opC/m+Ahu+nsCHMmo25xrKiIg+erGek08FHTpXCe2LFc6r9bjIpU
         +Nlr/gvqi9fc+d7VKH4mkjEjjWWfktqgaWkr67HMVsuAC8qvWQkQJoaziceex21oTFvz
         O1lcgnP915hHk+5SLmkY46TQmyrBuNsnM6zDBcb7LncyVQYPyA8ZILC/O3zOxi+h+L3e
         zIOA==
X-Gm-Message-State: AO0yUKXTSbso1KNHFKvyMW+tV9k+APvvXMoJN+lmLZuDZGe6u6l4JhJ6
        G/fQ/Iex3tQbiAfBpuKR0BxiMQ==
X-Google-Smtp-Source: AK7set+c7/OZVD9dMyfADAOXdrIkNTLghC9AiBQE49DusjrMo9mA1xEpw+X6F8YfJo+FmleYv/Oahw==
X-Received: by 2002:a5d:584f:0:b0:2be:1ea0:f794 with SMTP id i15-20020a5d584f000000b002be1ea0f794mr4525593wrf.52.1675192066347;
        Tue, 31 Jan 2023 11:07:46 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id c17-20020adffb11000000b002bc8130cca7sm15574989wrr.23.2023.01.31.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:07:44 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/2] Add support for mono version of Sony IMX290 sensor
Date:   Tue, 31 Jan 2023 19:06:58 +0000
Message-Id: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
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

Dave Stevenson (2):
  media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
  media: i2c: imx290: Add support for the mono sensor variant.

 .../bindings/media/i2c/sony,imx290.yaml       |  8 ++--
 drivers/media/i2c/imx290.c                    | 47 ++++++++++++-------
 2 files changed, 35 insertions(+), 20 deletions(-)

-- 
2.34.1

