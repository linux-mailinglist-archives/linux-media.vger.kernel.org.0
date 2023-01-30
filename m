Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53880680752
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 09:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235722AbjA3IWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 03:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235321AbjA3IW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 03:22:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EF3180
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 00:22:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B855260EC5
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 08:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59ADC433EF;
        Mon, 30 Jan 2023 08:22:26 +0000 (UTC)
Message-ID: <95a97057-49e4-2133-cb42-ceadc681e8d7@xs4all.nl>
Date:   Mon, 30 Jan 2023 09:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.3] CEC bindings improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:

  media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.3g

for you to fetch changes up to 763d62e0e5d76e6282c114ee0ce91f70a40be7ba:

  media: dt-bindings: st,stih-cec: convert to DT schema (2023-01-27 12:27:37 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
      media: dt-bindings: st,stm32-cec: move to cec subfolder
      media: dt-bindings: cec: convert common CEC properties to DT schema
      media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
      media: dt-bindings: chrontel,ch7322: reference common CEC properties
      media: dt-bindings: samsung,s5p-cec: convert to DT schema
      media: dt-bindings: cec-gpio: convert to DT schema
      media: dt-bindings: nvidia,tegra114-cec: convert to DT schema
      media: dt-bindings: st,stih-cec: convert to DT schema

 Documentation/devicetree/bindings/media/cec-gpio.txt                           | 42 ----------------------
 Documentation/devicetree/bindings/media/cec.txt                                |  8 -----
 Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml | 11 +++---
 Documentation/devicetree/bindings/media/cec/cec-common.yaml                    | 28 +++++++++++++++
 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml                      | 74 ++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml           | 58 ++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml               | 66 ++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml                   | 66 ++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml                  | 53 +++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml               | 11 +++---
 Documentation/devicetree/bindings/media/s5p-cec.txt                            | 36 -------------------
 Documentation/devicetree/bindings/media/stih-cec.txt                           | 27 --------------
 Documentation/devicetree/bindings/media/tegra-cec.txt                          | 27 --------------
 MAINTAINERS                                                                    | 12 +++----
 14 files changed, 360 insertions(+), 159 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (86%)
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt
 delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
