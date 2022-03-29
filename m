Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E974EA9FA
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbiC2JEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:30 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3C51F0815
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:02:47 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 06CE2100007;
        Tue, 29 Mar 2022 09:02:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 0/8] media: i2c: ov5670: OF support, runtime_pm, regulators
Date:   Tue, 29 Mar 2022 11:01:25 +0200
Message-Id: <20220329090133.338073-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello this small series introduces OF support for the ov5670 sensor and
adds support for regulators and GPIOs.

It also register runtime_pm callbacks and rework the powering sequence (cc
Paul(s) and Sakari for the discussion about the same topic on ov5640)

Tested on an OF system, ACPI should not be affected
(ofc, testing would be nice :)

v2->v3:
- bindings:
  - Drop assigned-clock properties from schema (moved to example)
  - s/pwdn-gpios/powerdown-gpios/

- driver
  - Use is_of_node() to decide how to parse clocks
  - Fix:
    drivers/media/i2c/ov5670.c:1787:18: error: initializer element is not a compile-time constant
                   .analog_crop = ov5670_analog_crop,
                                  ^~~~~~~~~~~~~~~~~~

    reported by kernel test robot and Nathan Chancellor with
    clang15 and gcc < 8

v1->v2:
- Address Krzysztof comments on bindings
- 2/8: new patch to use the common clock framework
- Address Lauren's comment on runtime_pm function names
- 7/8: new patch to implement init_cfg as suggested by Laurent
- Rework 8/8 which was incorrect as reported by Laurent

Thanks
   j

Jacopo Mondi (7):
  media: dt-bindings: i2c: Document ov5670
  media: i2c: ov5670: Allow probing with OF
  media: i2c: ov5670: Probe clocks with OF
  media: i2c: ov5670: Probe regulators
  media: i2c: ov5670: Probe GPIOs
  media: i2c: ov5670: Add runtime_pm operations
  media: i2c: ov5670: Implement init_cfg

Jean-Michel Hautbois (1):
  media: i2c: ov5670: Add .get_selection() support

 .../bindings/media/i2c/ovti,ov5670.yaml       |  99 ++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov5670.c                    | 282 +++++++++++++++---
 3 files changed, 341 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml

--
2.35.1

