Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABAA51CC68
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386529AbiEEXHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbiEEXHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:07:54 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449755EDC4
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:13 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id i133-20020a1c3b8b000000b003946c466c17so586501wma.4
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OEhPfnnG/uon8vIFgr8dhlIDYToz250Xuu1RG9oiPv8=;
        b=kEh2N2jxgLuDTxWLyWUZw4B18gpSSbMWi+d4cMetmzSl60bBaNQ5oa6hfcGDhdNl+X
         LX3WBIYs10kXvqlHfYNXReDjb8NKLJqIrPY3XAKe0FYmcNEbjBFkZmuHiRhZVHoxsyUw
         1MxgPWfp4N/2lpfqK/i6/eIzoBI0jPW2yM2NnYzenwvioZ1ZzJAsaI+RWNeUDLhPYcuV
         C3S5YozPHQeHDhZ56uKLA6/880hx4+ntBy8brFjciFCF67rsnS6nf0wg+F6OlSVPEUSW
         Ez/ECVCmoEuIuHrcB3bv37QG7YN1bNoHWgRtph4tBgSU5hvCbCwKWJ4Py9fZDUoOARgw
         pGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OEhPfnnG/uon8vIFgr8dhlIDYToz250Xuu1RG9oiPv8=;
        b=l2M/ImfbHsVGbQZQ4oc32jjGcqvSwPFFFqCoNczp2Z9VpkzMHkE0Jk7N5jz5VKnxNO
         ZyxeCkOQt+xVK8SFgPogtrsyGcIKzbv1fwGnEhhrhUhoqpNfXn+zG+jaETLO8pPzldgY
         VHsU8CqIS/Ky9Kyhn26kW4qkEnSVuuhYeypLc6Y5k01G1V2WtweFLzA/9eAoE7xpsRuh
         /KZwGzQNgx7JQOUsQ8V3ISXyunVzzGauHWXK1peipfZ6W2t9QLU2Ci2d8L4awI9Z3RwY
         PSy4fOPme1CRjfWmm+YbzDJmiREVSK9EHbQ9ltJhSpTo7PKYoc7E3FeoVdAJiWvV+tFo
         UIFQ==
X-Gm-Message-State: AOAM532mgTTbDmBUmXT8k9GQZdqeyHNFHlYlOJ4HR7y+CD6HPo4kcZSh
        obdYC9o6fsUs2BWDg3bKr5PuWgNEVyQ=
X-Google-Smtp-Source: ABdhPJzzOuq8PuqYurM4dPxFdvZQRc30Ah5xhekHiFDVqz01jvivqTMSwSWks43HAwAzb6LDUZ8+Xw==
X-Received: by 2002:a05:600c:4ecb:b0:394:5be7:791d with SMTP id g11-20020a05600c4ecb00b003945be7791dmr6863520wmq.151.1651791851825;
        Thu, 05 May 2022 16:04:11 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:11 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 00/15] Support OVTI7251 on Microsoft Surface line
Date:   Fri,  6 May 2022 00:03:47 +0100
Message-Id: <20220505230402.449643-1-djrscally@gmail.com>
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

Series-level changes:

	- None

Thanks
Dan
Daniel Scally (15):
  media: uapi: Add IPU3 packed Y10 format
  media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
  media: i2c: Add acpi support to ov7251
  media: i2c: Provide ov7251_check_hwcfg()
  media: i2c: Remove per-mode frequencies from ov7251
  media: i2c: Add ov7251_pll_configure()
  media: i2c: Add support for new frequencies to ov7251
  media: i2c: Add ov7251_detect_chip()
  media: i2c: Add pm_runtime support to ov7251
  media: i2c: Remove .s_power() from ov7251
  media: ipu3-cio2: Add INT347E to cio2-bridge
  media: i2c: Extend .get_selection() for ov7251
  media: i2c: add ov7251_init_ctrls()
  media: i2c: Add hblank control to ov7251
  media: i2c: Add vblank control to ov7251 driver

 .../media/v4l/pixfmt-yuv-luma.rst             |  14 +-
 drivers/media/i2c/ov7251.c                    | 749 +++++++++++++-----
 drivers/media/pci/intel/ipu3/cio2-bridge.c    |   2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   3 +-
 6 files changed, 553 insertions(+), 221 deletions(-)

-- 
2.25.1

