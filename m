Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 615C468A2C5
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbjBCTSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjBCTSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:22 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BC670D58
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:21 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so3157240wms.0
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM91PBae9Dy2y1WbKYmrhvz9xsda0h2veMNQ3c2eHLA=;
        b=jQoqRdXbHyIfISI1sX3FgdKwD6w5Fu3U5jicW0OoHQgIrGK0w/+jhd0trVkBrAkKSG
         BargX7nLg2jbc667H2JF1SRf84vBx+IPpT9ERBMVGJn7NOM3vmbpPTPDsaFJe03siKfy
         aUEJhsOxfHGk0XdYtE3CFYm1sWq8wtT1kZgcshotPgFjWof2jhxlO1EShLe3aqsI8UiC
         X694eKFC+uu06/A7Ag4kXGL79n9mSAcm7dNfoFsVdAbBYfDe9DuJjI/slLE1tWkpu1I6
         uTwCXNUJ5rngtkY0FF+JeaisU50VeJXHW/wX7zEgLs3EaEnVC8su4U1AxLvvcNVLieLk
         MGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM91PBae9Dy2y1WbKYmrhvz9xsda0h2veMNQ3c2eHLA=;
        b=09LKwqYdsiQEUNTOjl/inLcpNyIQ/TUmis7q38RR8FuiLge3I2ZuyJesQrmrDAuB0h
         X2g73H3dGr3b6HMxGPonqaQ9mWLigFv1VVzB/ztp9AFkWIPsdSsDBhNRE1ossWgSQFk7
         /88FnyNtvPr4/aGKWP0Jy88ONQt1s4+IQVs58TEjU1hqEsIqvca1O8sdmHH8Sc87kNU6
         jzP1icnQW9fDkNhcvFBBpVdVGxU6UTUKw1Y7F1Ij4oSlt7mIrw2EFp03BidGGgn2vPbi
         XAJUxn8JhKdL1o/uCDSXGDk6kLbai7C5VAyhmYCGbfyHVbFUa80w24PbipQx6cy4BfQa
         UHTg==
X-Gm-Message-State: AO0yUKUtEKB7GRa+vJHSzl5xv2/sS1IQvvZjWQAL7owcVJ9oPUzscnAP
        XFp97NsxYxo811Nu+SWMOHU8XQ==
X-Google-Smtp-Source: AK7set+oflhAR4PpzQ2SEoJmNDLzztDpy6hvUmD6hfbB0oN1/XaLxGB/RclRqACXkzUCqz4ILJnsRQ==
X-Received: by 2002:a05:600c:46ca:b0:3da:fbd2:a324 with SMTP id q10-20020a05600c46ca00b003dafbd2a324mr10308207wmo.36.1675451900063;
        Fri, 03 Feb 2023 11:18:20 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:19 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/13] imx290: Minor fixes, support for alternate INCK, and more ctrls
Date:   Fri,  3 Feb 2023 19:17:58 +0000
Message-Id: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
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

Hi All

This is a small patch set that fixes a number of issues, adds in support
for the alternate input clock frequency option, and expands the control support
for flips and VBLANK/HBLANK.

My source tree has the 2 patches I've just sent for mono support first, but I
believe the two series should apply in either order (true for v1, possibly not
for v2).
There's tree with both patchsets applied at [1]. 

  Dave

Changes since v1:
2/11: Hardcoded colourspace values.
4/11: Missing blank line added.
6/11: s/repitition/repetition/
8/11: Set exposure range on changing mode.
8/11: Alter the initial exposure to be max.
8/11: Split out allowing VMAX to drop to 750 in 720p mode into a new patch.
10/11: Switch to an enum.
10/11: Compute IMX290_EXTCK_FREQ.
10/11: Move EXCK_FREQ and IMX290_INCKSEL7 settings to 
New patch: Add error code to logging in imx290_start_streaming.
Collected R-B tags.

[1] https://github.com/6by9/linux/tree/upstream_imx290

Dave Stevenson (13):
  media: i2c: imx290: Match kernel coding style on whitespace
  media: i2c: imx290: Set the colorspace fields in the format
  media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
  media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
  media: i2c: imx290: Support 60fps in 2 lane operation
  media: i2c: imx290: Use CSI timings as per datasheet
  media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
  media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
  media: i2c: imx290: VMAX is mode dependent
  media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
  media: i2c: imx290: Add support for 74.25MHz external clock
  media: i2c: imx290: Add support for H & V Flips
  media: i2c: imx290: Add the error code to logs in start_streaming

 drivers/media/i2c/imx290.c | 464 +++++++++++++++++++++++++++++--------
 1 file changed, 365 insertions(+), 99 deletions(-)

-- 
2.34.1

