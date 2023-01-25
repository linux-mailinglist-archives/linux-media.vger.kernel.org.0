Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A8667B8B5
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 18:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236098AbjAYRhe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 12:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235736AbjAYRhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 12:37:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C96058641
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 09:37:31 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 058596E0;
        Wed, 25 Jan 2023 18:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674668249;
        bh=sYS9oolgVGs7DTkOqSAH5JnL+Mq8tS+JZx3gDSILSMw=;
        h=From:To:Cc:Subject:Date:From;
        b=PSQiUWLupHDvrznbe0df8zCsGE5Iyg2hxr5rvagLihF6m/4Ekc81sKNYkWijJOliD
         DumQlvzZKYoLC6ypUGAvQvmPkjY7asKGa/pYMw4RW6U6uWOJ1Ua6uuoniTof4SsWnK
         zHSLUh1RMWmJcsBPRuagC/gwI4eHPb/3bYLj53zM=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v4 0/6] media: i2c: ov5670: OF support, runtime_pm, regulators
Date:   Wed, 25 Jan 2023 18:36:59 +0100
Message-Id: <20230125173707.127687-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello this small series introduces OF support for the ov5670 sensor and
adds support for regulators and GPIOs.

Last year I dropped the ball as I didn't have access to HW anymore.
Luca (in cc) has reported he has a sensor and might give this new version
a spin, thanks!

Cheers
  j

v3->v4:
- Rework power enablement in power up sequence to support !CONFIG_OF
- Minor changes as per Sakari's review

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

Thanks
   j

Jacopo Mondi (8):
  media: dt-bindings: Add OV5670
  media: i2c: ov5670: Allow probing with OF
  media: i2c: ov5670: Probe clocks with OF
  media: i2c: ov5670: Probe regulators
  media: i2c: ov5670: Probe GPIOs
  media: i2c: ov5670: Add runtime_pm operations
  media: i2c: ov5670: Implement init_cfg

Jean-Michel Hautbois (1):
  media: i2c: ov5670: Add .get_selection() support

 .../bindings/media/i2c/ovti,ov5670.yaml       |  92 ++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov5670.c                    | 284 +++++++++++++++---
 3 files changed, 338 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml

--
2.39.0

