Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E414B7AFC
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240618AbiBOXIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238501AbiBOXIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:01 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCB86371
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:50 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id v129so182655wme.2
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZwUCCz3a8+hruS8plpVfZG4F3YP5wNaI2NNM/Gn1wT0=;
        b=d62VTF2+humuxvylUwmbYMPUScUulw1jg5Gk58PMj+TZ8mVzSTvRsMwPbTqOmx+OPn
         XawUTw7f8gYMWODOsesZ4rsiqkaVzTi0wYLUlTiwuqj2XaQ2DvW89Q3Q+MnuNuNgSSPx
         KFMSZsyeib3331Gm+pf93Zb/6cvANDBeG+IHsAOheMF7Xehr11YA5B/Z12NFXUm4drD7
         mwHDgOn3xmEU3ZBnzyJNdNahU4NiZ3qr9DlRG/Iy+SBUCAQ0QrtNWj77Ful5UG5pwx02
         rcJQlL7J749IZ36fE3cfvRL8z9BC1uvmS5g0QrPczyHjcppjzHWv7YsOXS1wNbkb8L2w
         kMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZwUCCz3a8+hruS8plpVfZG4F3YP5wNaI2NNM/Gn1wT0=;
        b=vbHH7nU/2MJW5RECrX2Z3nmjQrdWxtc4pIC+yikysnyorG1s5EwXU2IMWXHxwAq+7c
         yRDYttaex9k9H7670LmitQWHTk8evytO7+LS+psm3h3PevgrTPpbygImKhLYtXnbFFh3
         bUnNNg4ROALb9kiwoTyZAPWO9xpNGi6eu/7pwkyF7Gk31t7aQZvOBOk8JW7okux0L6Uf
         xbjx1QjVAwxJqk6vWKuo4Cie7Jds4sbPN5sVdDehy7KeacDbJAHg30ycb5FCDociIbed
         vtIgsjOQFy5HzXLTvJtMBJ+nnxD307Vmkna1Kq5HN+lpscns5vK+4qw3Bp7EBcG5Xq13
         levQ==
X-Gm-Message-State: AOAM533GB/89LiX68qoPIcF5IawZkWbByTwPUcaj9k/A6cHi8kMyjo+H
        g5KFGVe1te8xlIAENmJs/7Abw5UY2oCIEg==
X-Google-Smtp-Source: ABdhPJwWrAsDSeC8QeyhcmoyUNw2BV1tgpS2ppdKhhgUVcPnvkaLG8GVWTINsqdQKgZoLnB/H/JSZg==
X-Received: by 2002:a05:600c:190d:b0:351:4a49:4bda with SMTP id j13-20020a05600c190d00b003514a494bdamr122967wmq.194.1644966468788;
        Tue, 15 Feb 2022 15:07:48 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:48 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 00/10] Support OVTI7251 on Microsoft Surface line
Date:   Tue, 15 Feb 2022 23:07:27 +0000
Message-Id: <20220215230737.1870630-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series extends the OV7251 driver so it's functional on the
Microsoft Surface line of laptops, where it's used as the IR
camera for face login. The camera sensor is connected to a CIO2
device which packs the 10-bit greyscale data into 25 pixels per 32
bytes similar to the IPU3 formats for Bayer data, so I also added
a new format to describe that and added it to the ipu3-cio2 driver's
list of supported formats. 

Thanks
Dan

Daniel Scally (10):
  media: uapi: Add IPU3 packed Y10 format
  media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
  media: i2c: Add acpi support to ov7251
  media: i2c: Provide ov7251_check_hwcfg()
  media: i2c: Add ov7251_pll_configure()
  media: i2c: Add support for 19.2MHz clock to ov7251
  media: i2c: Add ov7251_detect_chip()
  media: i2c: Add pm_runtime support to ov7251
  media: i2c: Remove .s_power() from ov7251
  media: ipu3-cio2: Add INT347E to cio2-bridge

 .../media/v4l/pixfmt-yuv-luma.rst             |  14 +-
 drivers/media/i2c/ov7251.c                    | 480 +++++++++++++-----
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |   2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 6 files changed, 365 insertions(+), 140 deletions(-)

-- 
2.25.1

