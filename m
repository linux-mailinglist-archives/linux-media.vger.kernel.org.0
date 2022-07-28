Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432EF583F74
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238457AbiG1NCs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236063AbiG1NCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:47 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484DD120AD;
        Thu, 28 Jul 2022 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013365; x=1690549365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=twfzwC4ZtHVwen3q6kY8rgaaSpJtjcr+xNILXgSzAdo=;
  b=lHXOzY0WMz1SREhHGlavPEfmdWP8RQeSdgtiuFhyj29ycQqnUZHbbwCV
   pHGuswYLHHvOL5jtCZVemfHCtIJpzDey70bS6FS8h7BKb7ZW/guis4Whb
   yl8XU21NHPXZuaPDMz1ucHlhoWVykZNwZkw2yTYObaI6NXNjRL+f362Kq
   9r/VNQm1G03F7ql7GzT/ReVNXPCeucS+2ctQ6TFef+Zn1eP2kBJNT9ur5
   uhzvXawQPyHd6aqRwO9ykY3kYfsAnvMmO35QyPwOtDwDea4OyWM13nrhn
   JdPwESK/WER4MSkLO3awIxlvIbCtarRwOj7gAfEpWNRQp04AcE2msZsSH
   g==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321363"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013363; x=1690549363;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=twfzwC4ZtHVwen3q6kY8rgaaSpJtjcr+xNILXgSzAdo=;
  b=TgBiX7QEbBhJwtLSjakHT+EsF4Td16r2ANwvIHQndZgluRl2lEKTD4tF
   k3K3iig+NMpYfcg53txG/92326ZfZX5E/SG04TaoXk2WF2/9D43u6wABy
   y+C5PJpXht9de4XWD3GkXo/NeIfHGIXkIBQsQcdBCijZtsU+WqyiuSO5c
   HNuL8mMOf16fQiKgAA3UXHzwxUYe8lwOVgd+dXVO5SbWi3aunjZARjkRk
   GaOZXtm0g0dKBexc2OSNwplPqKW4hwyolXY4EnKmd//Qbsudoefc+qFwG
   nZcgN/Tib3t4wpyN0FWYJinkdq+IJ6FLURQlpTpOy7Dhi+dIjUwpf47Xg
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321362"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 302BF280056;
        Thu, 28 Jul 2022 15:02:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 0/7] OV9281 support
Date:   Thu, 28 Jul 2022 15:02:30 +0200
Message-Id: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
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

this is the 4th series adding support for OV9281 which is quite similar to OV9282.
This includes:
* a small cleanup (Patch 1)
* adding a new compatible (Patch 2 & 3)
* adding support for regulators (Patch 4 & 5)
* Fixing v4l2 subdev name depending on actual model name (Patch 6)
* Add regmap support (Patch 7)

Thanks for anyone doing review and giving a feedback.

Here are the changes in v4:
* Use platform data to set sensor name (Patch 6)
* Fixed some style issues (Patch 7)

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
 drivers/media/i2c/ov9282.c                    | 108 ++++++++++++------
 2 files changed, 89 insertions(+), 33 deletions(-)

-- 
2.25.1

