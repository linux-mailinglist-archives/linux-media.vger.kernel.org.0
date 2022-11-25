Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB691638D75
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiKYPbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiKYPba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:31:30 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED3A25E8A
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:29 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so11124604ejc.4
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbB5XeuI7CFJnPNKzVvw7LjitODqqPmcZrkg+g4L/W8=;
        b=oHRW4lxzTjPYT9x7AaF+s3xJU4/YMxb0TVXoKajIxqYit5osgPIppMY5G3Lg38Cmcv
         dNImqPWhTB7c1FuXczwPU57DM3vxL2Whm0w/XXS+nCC/0xu/vQ5pDjUyI1OWRLiQAD91
         wdTihWcSeC5eFIoYKeVQ83+A6mt9XvdJxU4uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbB5XeuI7CFJnPNKzVvw7LjitODqqPmcZrkg+g4L/W8=;
        b=CN0lf2jw7HCFianTxiyBiII52lenYVEVgdByaZlIPfHqrzbcUgBkQYuIxwdU1Rrcmi
         UyJOltX3MTLlG62icNy1gy1Qky4qa+llTLZMuU/0+DNQDTxp2F5Zv+QTZ7F7+N/xM4gs
         oMLxNlsP8PdEv5b2yMKddJRrMVBdb/XSLMBvubwCQEzR8ZqsbbeoN6vefZZEsgmOr/32
         +K9ekAKTYOdfqQApQg/oS9OUyJWC7s2V/V3attpDXYT02ZmqA6aaD56ozFVXnBBLQGUB
         I+SkZJyQmkosm+B3X+sIuKE2pzzLNRBEHiapbVDXDZXMqDTjdNiidTAnxI7NjULp7J8q
         fDIQ==
X-Gm-Message-State: ANoB5pkCLdLFU8Zx1XUn+xHPoRSUMll3J/Bqc4aYJty66vYh0e26Twtw
        y7a1SzaqGcdwd9DPKhTTj8giaIhOzb4v1Q==
X-Google-Smtp-Source: AA0mqf4d7rNySYK/SUFr296vGifuJi8/6uMdWjdEtpaxYsfXduDJGi8c2HYfcq1q/odc+Nq9CUPXgw==
X-Received: by 2002:a17:907:d40e:b0:7bb:f10c:9282 with SMTP id vi14-20020a170907d40e00b007bbf10c9282mr5339920ejc.325.1669390287633;
        Fri, 25 Nov 2022 07:31:27 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p10-20020aa7cc8a000000b0045b4b67156fsm1878435edt.45.2022.11.25.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:31:27 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/5] Adds media driver for Sony IMX492 sensor
Date:   Fri, 25 Nov 2022 17:31:15 +0200
Message-Id: <20221125153120.541298-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
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

This patch adds dt-bindings documentation, driver source, etc for Sony imx492
image sensor.

imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
monochrome square pixel array and approximately 47.08 M effective pixels. 12-bit
digital output makes it possible to output the signals with high definition for
moving pictures. It is programmable through I2C interface. The I2C client
address can be either 0x10 or 0x1a depending on SLASEL pin. Image data is sent
through MIPI CSI-2.

Petko Manolov (5):
  DT bindings for imx492
  media: i2c: imx492: driver's header
  media: i2c: imx492: driver's source
  media: i2c: add imx492 config entry
  media: i2c: add imx492 entry for make

 .../bindings/media/i2c/sony,imx492.yaml       |  101 ++
 drivers/media/i2c/Kconfig                     |   14 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx492.c                    | 1092 +++++++++++++++++
 drivers/media/i2c/imx492.h                    |  555 +++++++++
 5 files changed, 1763 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
 create mode 100644 drivers/media/i2c/imx492.c
 create mode 100644 drivers/media/i2c/imx492.h

-- 
2.30.2

