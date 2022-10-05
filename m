Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A965F576F
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiJEP2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiJEP2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:44 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BC621818
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r13so4993213wrj.11
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fxL3zqj66TpbI+50u411EHLc1+V1/zL0zwU2j19qJ3g=;
        b=d65WM6F8bSwRNUUa79Lq/eMRm3bcNr183OeR+WVZLCxo5NtuigtZ6+WKHp11Ly0Q2K
         bU8oWGIKeSA3+7PFG8z7ExbIBqpBFktfZ5kSIS0sZViOVGVFGrdUl9LwvfMhhA2t1HzM
         +1T77TZAL8pJp6HmTLXGGTdnYt4K/hhCncvsL57tklQPTNJiPBVmNm0c7IJ8S9t3Rj8N
         iltQLHax4jPiAG9HMz9hEBOTqwZphfkDEBpJ8gagUx2fFtNTPq51NFp53+GJ1/XeBW1U
         hQmPSbR0QaLrhcSKAWB3sJ5gnmv/G2fip3QrL+luJ4zZBZMHjXtzpSgz+E1RxxERblvz
         Y06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fxL3zqj66TpbI+50u411EHLc1+V1/zL0zwU2j19qJ3g=;
        b=mTG+QEfohbDKseVYtQOYyCk4tXWXtFnyBwB+q0oYzmhZs2MPKCxVYQyylBswmao3Nh
         XStm9mAq0aQGF7Y5xU0lJsPFSSTOxjwf+Urg6TZM7mtkPt80UZGqV+fPpeDjdHaqVoeU
         bGPo0XGTG8a5ZkfzrLhL4Y/KWPsyV2eVrcawp8y0IINQoqyQE8TlIPWzmBKPPju4GplQ
         WbFvim7r6fdFzyGCNwM1w5izHG+wQ+jpsJ0AXZmC/CDG6wYtZyOhGA2u/YqIGUm3Lkim
         vzLKZtJO+d/6/i+4XKB26B/5oOoxtchNV24ZLgmfSSFRBq0qxPucK7mXMLRk1d6dR053
         KPOA==
X-Gm-Message-State: ACrzQf3bAW5OUwyJ2TAFhKySvLRmTfWmCxOOw6AuaHOOfQ1/FJrcQB+7
        pBmGp6+tSMErOwQ0iq8aBMMZEg==
X-Google-Smtp-Source: AMsMyM7YCxB3RmaJrcd02iCBxKHa0HRwo0SjesQcMqzjcFMh2ofXc5LhJlM7hcC9kVqlFM194lc+gg==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id g7-20020a5d4887000000b00226ed347bbdmr161336wrq.561.1664983722289;
        Wed, 05 Oct 2022 08:28:42 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:41 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 00/16] Updates to ov9282 sensor driver
Date:   Wed,  5 Oct 2022 16:27:53 +0100
Message-Id: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
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

This series adds to the functionality of the Ominvision
OV9282 driver to make it usable with libcamera.

Tested on a Raspberry Pi with OV9281 sensor (same as
OV9282 but with alternate CRA on the optics)

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

 drivers/media/i2c/ov9282.c | 552 ++++++++++++++++++++++++++++++-------
 1 file changed, 446 insertions(+), 106 deletions(-)

-- 
2.34.1

