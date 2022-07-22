Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB4E57E22E
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234213AbiGVNT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiGVNT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:19:56 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D2CA0B89;
        Fri, 22 Jul 2022 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495994; x=1690031994;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9lU3VOLu3bGS86ILe8xqwKQc2zmHhqEUzo9rR/CT3aI=;
  b=Qsu+blDkKfe4NqYh2sbDHqkvTuASWRTKliUdGaIy5fimiZf846QItkZu
   c+9yeG2Wya4ZZSwooaOBYbu4Fqm28nVTshuAd+uDwzfFBvqTTo/KrSpK8
   SaB1iJBj8zO/Xjd8piK6Ao1iYPmKD3408sxnTikqIWybnEX123t1upaOb
   uBcnVZNG43irzF/si2DqAcntR8MbUSIopXj2aq/ghsV4ikci/ZTk2w48o
   9FQM0ncG2uhdPeC7hFmaAnjfFMDNh4leNC+KUIxRDYDAq8bbrYG7VUL1D
   ATCLckx3X4m1tza/x38k29zIfYddSYzM+dvD3IefGiA4eKqTJs9BAl0Uq
   g==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212299"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 22 Jul 2022 15:19:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 22 Jul 2022 15:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658495992; x=1690031992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9lU3VOLu3bGS86ILe8xqwKQc2zmHhqEUzo9rR/CT3aI=;
  b=L50+Ev9j18j5hwtWM1S2Qm6EbRgNAoZz4IWlgZM5OMsOOVJGxXu78Ieb
   DQ/JVc5z1U4pTco4rUuc/hl4+m2O6y5yTxZZzvxSPh0u/epWAXgYilyB+
   +46QQ/HQd23I8dHLh0WopAWi/xiJm3B0orbGKAj1zYo3K6ouy0q8rDJ9e
   X+Rbxwm8E+tt+U+DUfhq5Swf3Y2XqJB2kIzSsz7pWJDG1/5oNOUX+9a8h
   x0huX+Ki3FRqTKl4PQXRhr06HcVKLoqpEV1OuvrG+2oK9IvcI/PGRkdmV
   2AhYHZ2pqigR/qkozhAUvBtGkNf/2hRxnje7Bq1QpNBgJwXe078W3Cmp5
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654552800"; 
   d="scan'208";a="25212297"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jul 2022 15:19:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F14BB280056;
        Fri, 22 Jul 2022 15:19:51 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v3 0/7] OV9281 support
Date:   Fri, 22 Jul 2022 15:19:40 +0200
Message-Id: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is the 3rd series adding support for OV9281 which is quite similar to OV9282.
This includes:
* a small cleanup (Patch 1)
* adding a new compatible (Patch 2 & 3)
* adding support for regulators (Patch 4 & 5)
* Fixing v4l2 subdev name depending on actual model name (Patch 6)
* Add regmap support (Patch 7)

Thanks for anyone doing review and giving a feedback.

Here are the changes in v3:
* Removed struct field documentation as well (Patch 1)
* Dropped v2 Patch 6 (wrong approach)
* Added new Patch 6 to set subdev name according to model parsed form compatible
* Added new Patch 7 adding regmap support
  This is a preparation to solve the defunct auto-increment using regmap's
  'use_single_read' (still WIP)

Here are the changes in v2:
* Added Krzysztof's a-b for Patch 2 & 4
* Added Daniele's a-b for Patch 1 & 3
* Removed additional error message in ov9282_power_off
* Renamed function from ov9282_configure_regulators to ov9282_get_regulators
* Cleaned-up reading ID registers

The regulator support is based on the driver from Raspberry Pi downstream kernel
[1], the ID register read fix as well. Please refer to [2] why this fix is
required. I can confirm this is necessary by checking with a Logic analyzer on
the i2c bus.

Best regards,
Alexander

[1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/ov9281.c
[2] https://github.com/raspberrypi/linux/commit/58deee7c917e1c3c5e37987c3a89ad19d791f58a


Alexander Stein (7):
  media: i2c: ov9282: remove unused and unset i2c_client member
  media: dt-bindings: media: Add compatible for ov9281
  media: i2c: ov9282: Add ov9281 compatible
  media: dt-bindings: media: ov9282: Add power supply properties
  media: i2c: ov9282: Add regulator support
  media: i2c: ov9282: Set v4l2 subdev name according to sensor model
  media: i2c: ov9282: Add regmap support

 .../bindings/media/i2c/ovti,ov9282.yaml       |  14 ++-
 drivers/media/i2c/ov9282.c                    | 102 ++++++++++++------
 2 files changed, 84 insertions(+), 32 deletions(-)

-- 
2.25.1

