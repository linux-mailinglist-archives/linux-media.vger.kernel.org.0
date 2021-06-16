Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AA23A9ECF
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 17:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhFPPVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 11:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbhFPPVQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 11:21:16 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3CBC061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 08:19:09 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u11so2913582oiv.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZe+2o7dtcE+Iuoj5Vekn/DR/Fb6eQVfuYTEronJ4CM=;
        b=DZytHaNOvmD4SCp49cy0JrrhcJgOcco4Ke2cSFWNEAYDv2Fv3il63d7lvZnEAWWIHg
         OovX2xzohd36HghpohB/c0uX5g/Gau5XdvHE8W/8SlA2kaujIgUi28T42ibJIRZ5f1ch
         BKwE0bc9KhYUPwrn9tjN4CznCQq2IxmPCqlW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZe+2o7dtcE+Iuoj5Vekn/DR/Fb6eQVfuYTEronJ4CM=;
        b=n4X7leFG6l+EX4jI59QPevktNaYAKPOqhyKrZJ8SKo5rEpKjhNclyvsGQ4E7wOJblB
         yf9HLJQ12L5jZdrjsbHg+WjaFWkJoVQLvDgwDkytxwOUTA8a2O0Lfa+fG/JapsJUoH1d
         lO9+T2MxKanZaa0jJr3d3YrNgWLpbKCgmS5NTeurWpHNrGZZobAR3FABxsDhDg9LUixf
         +J9xC7qnybZ3WQkiE1DTG8jLIfFx42DUUTXKaUJ4drExN5SjFqJfRLN+9eNI4TjP1C/G
         h5LnBFdJzya1YGkPa2o2s37yKHJATx5i7ll0RZ/bEyCd2Y2QmjRyFvPMFzvepVjkSGSJ
         vGqw==
X-Gm-Message-State: AOAM533E6ejC9M9iSx/+TrfY3vzxjfhwJXaWBDk8bM6vmJcDLEEUcsBO
        JtOIdp8oD8phgLsk8/bicyAVggu371M57Q==
X-Google-Smtp-Source: ABdhPJxBHlESlq9QN8I4BsotqKjL3Vd+g7+eat/8fHGeQF66ssWfCNi+iuUzy1auZ7ZcZ87VK/ju2g==
X-Received: by 2002:aca:3e06:: with SMTP id l6mr71186oia.147.1623856748592;
        Wed, 16 Jun 2021 08:19:08 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l7sm588521otp.71.2021.06.16.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 08:19:08 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] media: Fix Media Controller API config checks
Date:   Wed, 16 Jun 2021 09:19:06 -0600
Message-Id: <20210616151906.8912-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Smatch static checker warns that "mdev" can be null:

sound/usb/media.c:287 snd_media_device_create()
    warn: 'mdev' can also be NULL

If CONFIG_MEDIA_CONTROLLER is disabled, this file should not be included
in the build.

The below conditions in the sound/usb/Makefile are in place to ensure that
media.c isn't included in the build.

sound/usb/Makefile:
snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o

select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
       (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)

The following config check in include/media/media-dev-allocator.h is
in place to enable the API only when CONFIG_MEDIA_CONTROLLER and
CONFIG_USB are enabled.

 #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)

This check doesn't work as intended when CONFIG_USB=m. When CONFIG_USB=m,
CONFIG_USB_MODULE is defined and CONFIG_USB is not. The above config check
doesn't catch that CONFIG_USB is defined as a module and disables the API.
This results in sound/usb enabling Media Controller specific ALSA driver
code, while Media disables the Media Controller API.

Fix the problem requires two changes:

1. Change the check to use IS_ENABLED to detect when CONFIG_USB is enabled
   as a module or static. Since CONFIG_MEDIA_CONTROLLER is a bool, leave
   the check unchanged to be consistent with drivers/media/Makefile.

2. Change the drivers/media/mc/Makefile to include mc-dev-allocator.o
   in mc-objs when CONFIG_USB is enabled.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/alsa-devel/YLeAvT+R22FQ%2FEyw@mwanda/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

Changes since v1:
- Fixed the drivers/media/mc/Makefile incorrect logic to check
  CONFIG_USB value. Test with CONFIG_USB_SUPPORT enabled/disabled
  CONFIG_USB y/m and disabled.

 drivers/media/mc/Makefile           | 2 +-
 include/media/media-dev-allocator.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/Makefile b/drivers/media/mc/Makefile
index 119037f0e686..2b7af42ba59c 100644
--- a/drivers/media/mc/Makefile
+++ b/drivers/media/mc/Makefile
@@ -3,7 +3,7 @@
 mc-objs	:= mc-device.o mc-devnode.o mc-entity.o \
 	   mc-request.o
 
-ifeq ($(CONFIG_USB),y)
+ifneq ($(CONFIG_USB),)
 	mc-objs += mc-dev-allocator.o
 endif
 
diff --git a/include/media/media-dev-allocator.h b/include/media/media-dev-allocator.h
index b35ea6062596..2ab54d426c64 100644
--- a/include/media/media-dev-allocator.h
+++ b/include/media/media-dev-allocator.h
@@ -19,7 +19,7 @@
 
 struct usb_device;
 
-#if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
+#if defined(CONFIG_MEDIA_CONTROLLER) && IS_ENABLED(CONFIG_USB)
 /**
  * media_device_usb_allocate() - Allocate and return struct &media device
  *
-- 
2.30.2

