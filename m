Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11254D890C
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 17:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242993AbiCNQ2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 12:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241796AbiCNQ2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 12:28:37 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604652AE1
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 09:27:26 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 57B11240004;
        Mon, 14 Mar 2022 16:27:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v2 0/8]  media: i2c: ov5670: OF support, runtime_pm, regulators
Date:   Mon, 14 Mar 2022 17:27:06 +0100
Message-Id: <20220314162714.153970-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
 drivers/media/i2c/ov5670.c                    | 281 +++++++++++++++---
 3 files changed, 340 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml

--
2.35.1

