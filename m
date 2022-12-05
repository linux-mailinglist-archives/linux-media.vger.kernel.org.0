Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99354643915
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 00:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiLEXHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 18:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbiLEXHe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 18:07:34 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697C21B7B6
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 15:06:52 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 7B5EB2014C
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 01:06:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1670281608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=UD1u6IrYXob84zpxetDNZyBQJyRcsuPYidWthHZn5Q8=;
        b=SbP0BADMn0w1sQrX+aVMQdPXfckLd/hNgM4rj+ViS7pV2nHsCgB3sYY8ZeJ0OPXV2q2QJF
        1IiQ4UkDWgz2aixnJG5upSYEe8Z8h56Oe0iDqbS4ExkxteIl9w8WAkSb5jiZGyCA+JBt+R
        Obqt9FhINDblQUJ2AG/WCaic45DGHZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1670281608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=UD1u6IrYXob84zpxetDNZyBQJyRcsuPYidWthHZn5Q8=;
        b=geGvwJrq0K83RpSk3OTZYF88inAU1tOtwL39POlKXxJDJVI37xlnJFa7qnOmaQ//ZgqU6u
        bjB+zoLZPxiBWo+vRC9rvF2txzvvId02sDY98Y8o1fajzgs+xcAGJG+7wUefJCvZh8O3eo
        HzlXIvx8Z7VQ36zAJBaoqmNfq1ndD8g=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1670281608; a=rsa-sha256; cv=none;
        b=bOzwIiMKw/cuatFfyE+MKux3IMevJQxIc0JuWwZrI7ZnQLX3s4cNJ/7GXS/FnQpAU6AI5g
        R+cGuQVfqpQP5GOs4as5T71ZxTfwee3a+5tcUB9C/HUSM5pANADrFbNXDXp/I4xMfL/ied
        FCoX4940nnfKK1STaD7w65+uOxC0oBs=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BB534634C95
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 01:06:47 +0200 (EET)
Date:   Tue, 6 Dec 2022 01:06:47 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.2] Sensor driver fixes
Message-ID: <Y455h3riDE/NdZj7@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of fixes and a few trivial patches for 6.2. In particular, a
number of drivers were missing the MODIFY_LAYOUT flag on flip controls and
there are miscellaneous fixes for a few other drivers. Also included is a
new compatible string for ov9281 sensor in the ov9282 driver as well as
ov9282 driver smatch fixes.

Please pull.


The following changes since commit 2496ee3821b0fd585c84a3b66d7c2894fc66503a:

  media: dvb-usb: m920x: make read-only arrays static const (2022-12-02 15:36:44 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.2-4.3-signed

for you to fetch changes up to 4e02013257bb37910b24ffd5952593925453339e:

  media: i2c: ov9282: Add missing clk_disable_unprepare to error path (2022-12-06 01:04:37 +0200)

----------------------------------------------------------------
V4L2 patches for 6.2

----------------------------------------------------------------
Alexander Stein (2):
      media: dt-bindings: media: Add compatible for ov9281
      media: i2c: ov9282: Add ov9281 compatible

Dave Stevenson (8):
      media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: imx208: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: imx355: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: ov08d10: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: ov9282: Fix missing documentation in structures
      media: i2c: ov9282: Make common_regs_list static
      media: i2c: ov9282: Add missing clk_disable_unprepare to error path

Guoniu.zhou (2):
      media: ov5640: set correct default link frequency
      media: ov5640: report correct frame rate to user

 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |  5 ++++-
 drivers/media/i2c/imx208.c                         |  4 ++++
 drivers/media/i2c/imx319.c                         |  4 ++++
 drivers/media/i2c/imx355.c                         |  4 ++++
 drivers/media/i2c/ov08d10.c                        |  5 +++++
 drivers/media/i2c/ov2680.c                         |  2 ++
 drivers/media/i2c/ov5640.c                         | 25 ++++++++++++----------
 drivers/media/i2c/ov9282.c                         | 15 ++++++++++---
 8 files changed, 49 insertions(+), 15 deletions(-)

-- 
Kind regards,

Sakari Ailus
