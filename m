Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39B4611732
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiJ1QPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiJ1QOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:35 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B456A22EC85
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:25 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id bk15so7164749wrb.13
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODWk+kv3AZJLBdMzJJ45cSZp1i6pJ980r7TBZblT930=;
        b=X2MASRoYhsp1Xn1AEevBfnp6kBdMChc8DAFJoQDljxBbCScM/yaRoKO6M7MwkY6RHp
         PpaqUjcWgOACbKbsGcH94mdLvb+Yz5/kVt2NS2PS7G5LBabas8Vpk6H9tbmjrlXS4uul
         l3F/LOdGX4z4zVwg7m9P973fgQwS+oCN4jGxRog+sGr5CqTHOaBE+QHzvTWzzGkLFMRQ
         Ly4QeWo6li/z01Wb+wcqOBoofh/SORuL4mQIiqnokfXtt2OKLewTbHkxehfCvDKmBH8q
         /KeL5WNnsYymj2tgV0AqGcV8/5zyRPpk1d7N4J3dM+DuGbqZI/US/GR57wHMuHByG1Bi
         PZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODWk+kv3AZJLBdMzJJ45cSZp1i6pJ980r7TBZblT930=;
        b=De6MCmvNek9Dewc8Izxb8z8oPU8ZF0AghfFA/A3us6Z6XI5lwS8ecyFaxUygBdxpbb
         p7QmhaXJNtUkmUGB020MCiC+EakiDQFpnxS/K7jnDaj3Mez05CenPc+50G/qKJHR5MYk
         TPBVX5kvyhoRSdjpOp+JQrkPETa8bBxhLCCQXZRHZ2gVeahfntTnKzK1hU2IRrJPHtdy
         EraEc/afLL6mrw64Jur023rFHe0BYGIARCJyM/KI1RyoDRqzrxhSyJzQ2BCIsv4/EIim
         2pVzfOCVZBJqEX5pId7zOTagyAGyZLQu1DWAV25Ab9LyWCKTDBpOimfYc0yYvGYatl1Q
         Ygmw==
X-Gm-Message-State: ACrzQf0F87fhi82Xx1Nqarsnvhihm5wko+OUUx3d4Y3lFol25BC7AQHe
        sEHDgjw/2Tr/OyA2DoYgxHBDrA==
X-Google-Smtp-Source: AMsMyM7yDiEJIQBHgArJNDatE4Cqkc1Uoyu8R24hK0EpL/mL5mqLHlFvUtpd+bVplwfGAuDj6UQbBA==
X-Received: by 2002:adf:f7cd:0:b0:236:860d:6db3 with SMTP id a13-20020adff7cd000000b00236860d6db3mr72613wrq.674.1666973544303;
        Fri, 28 Oct 2022 09:12:24 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:23 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/16] Updates to ov9282 sensor driver
Date:   Fri, 28 Oct 2022 17:08:46 +0100
Message-Id: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds to the functionality of the Omnivision OV9282 driver to make it
usable with libcamera.

Tested on a Raspberry Pi with OV9281 sensor (same as OV9282 but with alternate
CRA on the optics)

Changes in v2
Collected the relevant R-b tags from Jacopo (many thanks)
Patch 5 - replaced macro OV9282_NUM_MODES with direct use of ARRAY_SIZE (Sakari)
Patch 6 - reworded commit text (Jacopo)
Patch 7 - correct typo (250 instead of 151) (Jacopo)
Patch 8 - moved setting CSI2 clock mode from streamon to power on (Sakari)
Patch 10 - double empty line removed (Jacopo)

No response on patch 11 with regard policy on whether V4L2_CID_VFLIP & HFLIP
should be with regard sensor native orientation or initially submitted driver,
so I've left it as is.

No response on patch 16 as to whether all sensor drivers with controls should
have V4L2_SUBDEV_FL_HAS_EVENTS and subscribe_event/unsubscribe_event handlers,
so again it's unchanged. It fixes a v4l2-compliance failure and therefore would
appear to be valid.

Dave Stevenson (16):
  media: i2c: ov9282: Remove duplication of registers
  media: i2c: ov9282: Split registers into common and mode specific
  media: i2c: ov9282: Remove format code from the mode
  media: i2c: ov9282: Remove pixel rate from mode definition
  media: i2c: ov9281: Support more than 1 mode.
  media: i2c: ov9282: Correct HTS register for configured pixel rate
  media: i2c: ov9282: Reduce vblank_min values based on testing
  media: i2c: ov9282: Add selection for CSI2 clock mode
  media: i2c: ov9282: Add the properties from fwnode
  media: i2c: ov9282: Action CID_VBLANK when set.
  media: i2c: ov9282: Add HFLIP and VFLIP support
  media: i2c: ov9282: Make V4L2_CID_HBLANK r/w
  media: i2c: ov9282: Add selection API calls for cropping info
  media: i2c: ov9282: Add support for 1280x800 and 640x400 modes
  media: i2c: ov9282: Add support for 8bit readout
  media: i2c: ov9282: Support event handlers

 drivers/media/i2c/ov9282.c | 563 ++++++++++++++++++++++++++++++-------
 1 file changed, 456 insertions(+), 107 deletions(-)

-- 
2.34.1
