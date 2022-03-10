Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D56F4D47B9
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238385AbiCJNJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:09:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236886AbiCJNJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:45 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5149A46642
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:08:43 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 946F52000B;
        Thu, 10 Mar 2022 13:08:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH 0/6] media: i2c: ov5670: OF support, runtime_pm, regulators
Date:   Thu, 10 Mar 2022 14:08:23 +0100
Message-Id: <20220310130829.96001-1-jacopo@jmondi.org>
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

Thanks
   j

Jacopo Mondi (5):
  media: dt-bindings: i2c: Document ov5670
  media: i2c: ov5670: Allow probing with OF
  media: i2c: ov5670: Probe regulators
  media: i2c: ov5670: Probe GPIOs
  media: i2c: ov5670: Add runtime_pm operations

Jean-Michel Hautbois (1):
  media: i2c: ov5670: Add .get_selection() support

 .../devicetree/bindings/media/i2c/ov5670.yaml |  93 +++++++++
 drivers/media/i2c/ov5670.c                    | 189 +++++++++++++++++-
 2 files changed, 276 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5670.yaml

--
2.35.1

