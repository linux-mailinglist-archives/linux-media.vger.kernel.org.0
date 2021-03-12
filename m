Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C4B338A2C
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbhCLKdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbhCLKcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:32:55 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6921EC061574;
        Fri, 12 Mar 2021 02:32:54 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g25so3480641wmh.0;
        Fri, 12 Mar 2021 02:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CC6/sDxlGq/QTBQVFI/RVN7Ji2HwY64YYGDFhUnVtCE=;
        b=Mz+GP4llrzoVC1uCUb6nDwmULwpEI3v9hbApCzptpvPcOTqKEhDZiMixv0t2il/eXq
         X0nkZBnjko5SQxPc/d4O/kh3bs37kN5lPthUABorWKdfJPJVQnz5Cabv6YbRGESAsJaR
         IVLx7k7hJmKAzDoH87yq25KQV5AyCXnqzm6PaDnWVVDo9ibmwF1JOeji9j00c9ZKqXAz
         pOmkAbAJqsCBv+Wy+dNLLJ3NWJG5N4vWfMH6wMnV+wOEcqyPCn8FltnnYZPKEoiQsZ/2
         3ZX6g65KfC4pxicO6jvgAVxOUyUXTLBGeR2/KNrdzDq19SZbvtRQGtdy2l3a/aIVVPij
         1USg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CC6/sDxlGq/QTBQVFI/RVN7Ji2HwY64YYGDFhUnVtCE=;
        b=sHNUKc/wFbWWLeEOj3QCFPn2sWnf/uaF97vrDhYf65u4kZLfrleZiCUq9dpbhRzRua
         0LV6JgYypWgF8UmmRdXUQQEUm+LOuGIDSNps6ULTxWY0d6j0OF8h+zlvYjfQZvuUgKGI
         IZDQ+g96p1g+qVEE7HUbP/h4jla/mK2/a1rIkExd1qfMEqmsfQIvCTqW2gMTLGrMa6lb
         PlB1akiEzmpNrrGtbjV4+l5dLLNNhbYjjWpro0FDOR+SYKH2/8HJyxrF2VHrUxPhMcKE
         Kqai+JGwG+R1gt0ygq0HwvZ1Fl5IP9OWFz6QkkSsJHbbK2S0OmLpg2Q/MHNjGTQAQ/au
         YKpQ==
X-Gm-Message-State: AOAM532bFeBcZeKqx79RtdVq8oRwHoPNqzWYA+9RKK5mQK8y1o4FcCR9
        xzzRM860XpnuZRt5F/8lv1ycVuoa3gQ=
X-Google-Smtp-Source: ABdhPJyV14kIMVP0Kg+hqjBEFlyLlvIE458ue01lu5OwKNA1ceUxsjtbiBLA/8yjQo82e+7SNgMNzQ==
X-Received: by 2002:a1c:a74b:: with SMTP id q72mr12240723wme.158.1615545173647;
        Fri, 12 Mar 2021 02:32:53 -0800 (PST)
Received: from valhalla.home ([2.26.187.30])
        by smtp.gmail.com with ESMTPSA id u2sm7411821wrp.12.2021.03.12.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 02:32:53 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        dongchun.zhu@mediatek.com, tian.shu.qiu@intel.com,
        luzmaximilian@gmail.com, me@fabwu.ch,
        jeanmichel.hautbois@ideasonboard.com, kitakar@gmail.com,
        jorhand@linux.microsoft.com
Subject: [PATCH 0/1] Add support for OV5693 Sensor
Date:   Fri, 12 Mar 2021 10:32:38 +0000
Message-Id: <20210312103239.279523-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This patch adds support for the OV5693 sensor found as the front camera in
many Microsoft Surface devices, along with a number of similar style laptops.
It is a heavily adapted derivative of the atomisp-ov5693 driver in staging,
which retains most of the global register settings and some of the other
functions from that driver, but otherwise uses the "normal" v4l2
infrastructure.

There are 3 supported modes (down from 18 in the atomisp one!); 2592x1944,
1920x1080 and 1280x720.

As we're targeting libcamera, all mandatory, recommended and optional controls
for that library (at least, at time of writing) are supported.

Daniel Scally (1):
  media: i2c: Add support for ov5693 sensor

 MAINTAINERS                |    7 +
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ov5693.c | 1585 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1604 insertions(+)
 create mode 100644 drivers/media/i2c/ov5693.c

-- 
2.25.1

