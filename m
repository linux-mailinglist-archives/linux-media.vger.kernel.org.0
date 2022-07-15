Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49FFD575CAE
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiGOHtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiGOHtH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:07 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6445248F1;
        Fri, 15 Jul 2022 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871346; x=1689407346;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eicw0z0T9aiw8jm7PfQeKRnHCaVuVH/3l4xK3EyDX0M=;
  b=FxXNtQJ3fhrhwoH1Qks8/p7vMwhODkMJqFilQzB6UOrG1ydbN6JInGnH
   ORHcc6nUZT3zDJCUyoun9SP2jUS2H64YhZBP2ekwaM/WmM1NTLtCAwJ1R
   ntGrQqsxU29GSEOEZ1XVs0r9Jwt44BRbK1mJ44mq22QoMYiJiJnEn4bfo
   7TDIJCn8/kg1Ox/Y4gQKQPIDSQQ1OD9aKF3kL0+wQ+CtqRdjInRF3foYW
   IugYgly2LHOFI6i+az20VVniH0gg0c3fjp5vGIlJoGBA3e8CT/LRBWlWF
   UqIfZVZr56Ux93wj6t3TAEaiXR6+skezAlR3jJtVd9rEL6o90pj2igS+u
   w==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069080"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:49:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871344; x=1689407344;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eicw0z0T9aiw8jm7PfQeKRnHCaVuVH/3l4xK3EyDX0M=;
  b=HSiHwSlD6pEmS5AS7j+JsA8emZX8GaHf7ULXaIV/R9g3NX0qCfQ1GWfa
   e9BVQ8czqQoYDcCCqmJbix//NS6X9VbiU1czzx7LTzqL2xicdc9zvWE2r
   egaHBAevBhy7+2NS1lg9Dqm93KQn7R9yDKFqpQThgFgX/gAzFp5RlA8Ic
   dCuil0Su4Ab1999NeGHKBBmuTpZf2/B1o0+lTTZSUWjU4g+bjIRrnINDd
   uP8iLZ0tzCG59ic9sVXC5rScoxxLFSCW4O2a0gB9F6G6rBQnB75eG6C8Z
   PYlxOby6aAP3X3b7lCmihE3fjZeLoqifmlPiXzd1bRpzoEonaX96cCCL+
   A==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069079"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D0A90280056;
        Fri, 15 Jul 2022 09:49:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] OV9281 support
Date:   Fri, 15 Jul 2022 09:48:52 +0200
Message-Id: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is the 2nd series adding support for OV9281 which is quite similar to OV9282.
This includes:
* a small cleanup (Patch 1)
* adding a new compatible (Patch 2 & 3)
* adding support for regulators (Patch 4 & 5)
* Fix reading ID register on VC MIPI OV9281 (Patch 6)

Thanks for anyone doing review and giving a feedback.
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


Alexander Stein (6):
  media: i2c: ov9282: remove unused and unset i2c_client member
  media: dt-bindings: media: Add compatible for ov9281
  media: i2c: ov9282: Add ov9281 compatible
  media: dt-bindings: media: ov9282: Add power supply properties
  media: i2c: ov9282: Add regulator support
  media: i2c: ov9282: Fix device detection

 .../bindings/media/i2c/ovti,ov9282.yaml       | 14 ++++-
 drivers/media/i2c/ov9282.c                    | 56 ++++++++++++++++++-
 2 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.25.1

