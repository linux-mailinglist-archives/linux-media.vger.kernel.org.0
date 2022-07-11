Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0858656D796
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiGKIQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiGKIQr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:47 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A87B1D32E;
        Mon, 11 Jul 2022 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527405; x=1689063405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wJIcYkRsGF9fUVLPLj2/rG7n5kDL+2B4JzdLKgqT7oY=;
  b=MsXK2V2DXdbyuHI+twg7h4ZrakdAG7zgF7OoaOVe7/HtdtXvSTcfV3Fx
   VCInatZS9JB9/12xvhM32PdHENMHy7GJlbzzmTPY9Hr8hSGLfJ/GCgJm1
   7Fk2RZKc37Vj/x45CvMtHacbawjzyXe8rOTfuaAGSX7vo53DKt6Inq6C4
   GQxoc/ThCntC8pVpoJp7rSGXcbltd/3kWzTAqyxRHNhSy6ObYGFJw8EGE
   +e5+E7BvWkRezp9MRFkJK1+SE8xhRPTXpzj29QF7x6CdaUqslL6XCCvEG
   WOadoxCGahtCNwTbtnKrYknCVT5Ym1C1iMB10RzITlkEHxG40+u2W24y7
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967068"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jul 2022 10:16:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Jul 2022 10:16:42 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Jul 2022 10:16:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527402; x=1689063402;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wJIcYkRsGF9fUVLPLj2/rG7n5kDL+2B4JzdLKgqT7oY=;
  b=Oj6zoNfA3zRaZo+SqbgaIePIwPTWyH/bz3cUfStajIhDp5zUre9+gZHe
   sUwPOpDa9m9N87yWBvrL1gGuzV00xlqtaMZej6IMqGr9XK78upWiJ8m8g
   eRdc/501O5ManM9zpTePvKRC7q9h7P2J8zW/b72ZoOoO3x20PhEnJwOCB
   2XStqTwbkm3LRvm8ra4PNvVeSN3wWsB5AZRxRn2h6/+DEK4uFCL0E2lbY
   /srHVt5AStXtbu4q0itduAmEzH3GzJIqKc5XBp9mnisilPHC7YoxjlW6F
   CjHhgMICF9UBp40KV5tv6tQULtOp7Hb3CEnPDuCUoh9LpTQ9zi1GA3aas
   g==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967067"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:42 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7BBAD280075;
        Mon, 11 Jul 2022 10:16:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/6] OV9281 support
Date:   Mon, 11 Jul 2022 10:16:33 +0200
Message-Id: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
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

this series adds support for OV9281 which is quite similar to OV9282.
This includes:
* a small cleanup (Patch 1)
* adding a new compatible (Patch 2 & 3)
* adding support for regulators (Patch 4 & 5)
* Fix reading ID register on VC MIPI OV9281 (Patch 6)

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
 drivers/media/i2c/ov9282.c                    | 54 +++++++++++++++++--
 2 files changed, 63 insertions(+), 5 deletions(-)

-- 
2.25.1

