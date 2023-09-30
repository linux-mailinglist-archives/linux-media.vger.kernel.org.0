Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56B5F7B4159
	for <lists+linux-media@lfdr.de>; Sat, 30 Sep 2023 17:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbjI3PAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Sep 2023 11:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbjI3PAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Sep 2023 11:00:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC502C5;
        Sat, 30 Sep 2023 08:00:11 -0700 (PDT)
Received: from uno.internal.cocoon-space.com (lfbn-idf1-1-343-200.w86-195.abo.wanadoo.fr [86.195.61.200])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04E104DA;
        Sat, 30 Sep 2023 16:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696085906;
        bh=+pOI2OeddBVoEg5ZS2+H0XuzhepYkolFdzxEzqjwn1E=;
        h=From:To:Cc:Subject:Date:From;
        b=NNmxArzFlmDRG8kwMr/EBh87sYhpYywlDupNwSek8dMW+pBe76GKR3foNY7XkrusA
         x3G7oEX8LGzQSUbKbZutGRpt537JAIUoYoDYJsy6npCutFx5vaPeZ3JK/074jb1m69
         Uk9ZTKXgrJpfNmFvv2589SPj4If9t46KRAC0k+D8=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de
Subject: [PATCH v3 0/7] media: bindings: Fix handling of video-interface-device
Date:   Sat, 30 Sep 2023 16:59:44 +0200
Message-ID: <20230930145951.23433-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v2->v3:
- s/bindings/dt-bindings/ in $SUBJECT

v1->v2:
- Fix a typo in the ov5640 bindings

As discussed in
https://patchwork.linuxtv.org/project/linux-media/patch/20230928121424.388019-1-festevam@gmail.com/

all properties specified in video-interface-device.yaml are valid for
image sensors.

Some schema however either allow only some of them one by one, or restrict
the supported values for no specific reason.

Fix this by allowing all properties from video-interface-device.yaml
and removing restrictions on the accepted values.

Jacopo Mondi (7):
  media: dt-bindings: hynix,hi846: Add video-interface-device properties
  media: dt-bindings: hynix,hi846: Restrict endpoint properties
  media: dt-bindings: ovti,ov02a10: Fix handling of
    video-interface-device
  media: dt-bindings: ovti,ov4689: Fix handling of
    video-interface-device
  media: dt-bindings: ovti,ov5640: Fix handling of
    video-interface-device
  media: dt-bindings: sony,imx214: Fix handling of
    video-interface-device
  media: dt-bindings: sony,imx415: Fix handling of
    video-interface-device

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml     | 10 ++++++++--
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml    |  8 +-------
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml     |  6 +-----
 .../devicetree/bindings/media/i2c/ovti,ov5640.yaml     |  7 +------
 .../devicetree/bindings/media/i2c/sony,imx214.yaml     |  2 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml     | 10 +---------
 6 files changed, 13 insertions(+), 30 deletions(-)

--
2.42.0

