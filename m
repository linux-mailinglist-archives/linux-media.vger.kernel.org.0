Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC13296029
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900196AbgJVNh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900191AbgJVNh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:37:58 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB17C0613CF
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:37:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id n6so2435531wrm.13
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VK4FgjtpkHHYUN2/U6FSltdeDbo7aonVsHt4FDf3Llc=;
        b=ird/YN9lH1BtBZ8Hed7YgeAeT5tU18FYvjLagm5kFiAIzqkS7YnirxsmUHHEnhQLhb
         6hWmyaetMck/VZVm7Jy3Ckp9huRBvTs4e1bCst7zuc/OuPwBLPy0OJu0vyS0350wy1bJ
         0y+ou/mHS7B1rzft7O+VzXHDXyuVcnIKLHaHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VK4FgjtpkHHYUN2/U6FSltdeDbo7aonVsHt4FDf3Llc=;
        b=NQ2xTPt36r5YH0jipH/p9r4u2RDke6OLNwEy8C8VwCy9gk6zkKDigFe7twSlPnBP8M
         LyLlLnFYFF4ifgknPDemvrOhKllEYPCohzQj5HxQTcM1G2+ZDDpbH0LDeFe33f2bjYd1
         WWpOGylH5+8fOOv4XZ5AP15eAY5DmZwMSohB1flT96xGFIGtKv6o/GGJZtcFQdOmYYe1
         JWseVBA4sm+ocuWMqvx6CRYdw5huZwQfOcsxOrngAH0BRvOElhqWzcUOVIS014SGNjcj
         6uIBTCG8efpRcL0v6oYmH7hbi1t76y4mEsKJaFvjysflv7i/C3+C0K4OhhayVbYKaIvX
         21MA==
X-Gm-Message-State: AOAM533zOJmdI+0bHHlatDjY1FyNIg4q4S74LoJCCg03hkLuHMQUSXLN
        hipN13CCjD9tj1zSVp/9+ZzFTA==
X-Google-Smtp-Source: ABdhPJzwijLPW+SG7YfBNlKDFj8QOg+9H2CDvF1LuekVvASb0hAlxfQ0fAqaiAtQCAFFbzbOYLvIfA==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr2813167wro.339.1603373876297;
        Thu, 22 Oct 2020 06:37:56 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q10sm4094031wrp.83.2020.10.22.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:37:55 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     tfiga@chromium.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] Show privacy_gpio as a v4l2_ctrl
Date:   Thu, 22 Oct 2020 15:37:47 +0200
Message-Id: <20201022133753.310506-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices can implement a physical switch to disable the input of the
camera on demand. Think of it like an elegant privacy sticker.
    
The system can read the status of the privacy switch via a GPIO.

The ACPI table maps this GPIO to the USB device via _CRS and _DSD
descriptors, so the kernel can find it.

The userspace applications need to know if the privacy pin is enabled
or not. 

The obvious way to show it to userspace is via the V4L2_CID_PRIVACY control.

This patchset implement this functionality.

Ricardo Ribalda (6):
  media: uvcvideo: Add UVC_CTRL_FLAG_ENTITY_GET_INFO
  media: uvcvideo: Add UVC_CTRL_FLAG_ENTITY_GET_CUR
  media: uvcvideo: Add UVC_GUID_EXT_GPIO_CONTROLLER
  media: uvcvideo: Add Privacy control based on EXT_GPIO
  media: uvcvideo: Implement UVC_GPIO_UNIT
  media: uvcvideo: Handle IRQs from the privacy_pin

 drivers/media/usb/uvc/uvc_ctrl.c   |  56 ++++++++++++++--
 drivers/media/usb/uvc/uvc_driver.c | 102 +++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  14 ++++
 include/uapi/linux/uvcvideo.h      |   3 +
 4 files changed, 169 insertions(+), 6 deletions(-)

-- 
2.29.0.rc1.297.gfa9743e501-goog

