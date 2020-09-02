Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6C025B6AB
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 00:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgIBWtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 18:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgIBWsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 18:48:19 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE40C061246
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 15:48:19 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c18so1011676wrm.9
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 15:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l80LLYGa/yYmt3H9jqHnhQDWkk8QQ1YTQWwpquPQW8Q=;
        b=nuwm7bilclieGOSY2ZWyaQnC5HjoU7juXZSnF039IugZj8wLuLXsFFqF7YHrQzDJJX
         pKqwXoM9mQrAdmZgV6mPwaelAFb1YUvkZkr565NZZXAQ8Eoha8o1gf/8odXr5OWhHwWm
         aGYN3wplbcEGgf8jXv8nBNjFyjZyrYkMAXNvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l80LLYGa/yYmt3H9jqHnhQDWkk8QQ1YTQWwpquPQW8Q=;
        b=px8OBTWk61agAI9NZ96ufQUfGcWl9+mJTsaOLrPCxlVRD/0qvY7VmMsPr+9aOXIOYW
         xqePzNVD92Um+LwBgk7XSbWPxj+iuNTuGS0PTjXtUjRRky1cUTMQgjdgFDs7uRwq01k0
         bfTf0sg1PVrEv4ElnHaojZ/6AJmEWDP2I3+y1LxauI7jgrk96FpeRwNSNZ1wdr6fUwHt
         a4CNbjCSenUXP0FnZF41M6x/xP/LQieN9rZYcgXqc79k32B2vfTh05piH/FBRZ9LujKy
         B1IHmtYAWcbhUs9lfZnqNW5UueuqjjtumF1ceUd4Alhvn0843svsXRRXfmbmTS1a+ado
         WO8w==
X-Gm-Message-State: AOAM533+vk4WWOKYwZgP5ClFeYxPDvcujfuP/mJMp2yJ6jaZBzfzLIMm
        YpHI3vVGA30xIcrO5rTe/uRmcOUXb+2hdA==
X-Google-Smtp-Source: ABdhPJyvFaOl5Bp71SygSFaYE7q0D2J9roMhkJJIvfrjHfZdhbmgcAK/3ymTae/CPSE3tuE1xJQZ/Q==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr392900wrm.229.1599086897633;
        Wed, 02 Sep 2020 15:48:17 -0700 (PDT)
Received: from tfiga.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id m125sm1557568wme.35.2020.09.02.15.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:48:17 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hao He <hao.he@bitland.com.cn>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, drinkcat@chromium.org,
        Xingyu Wu <wuxy@bitland.com.cn>, dongchun.zhu@mediatek.com,
        sj.huang@mediatek.com, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v4 0/4] Galaxycore GC5035 sensor driver
Date:   Wed,  2 Sep 2020 22:48:09 +0000
Message-Id: <20200902224813.14283-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

This series adds YAML DT binding and V4L2 sub-device driver for
Galaxycore GC5035 5-megapixel 10-bit Bayer CMOS 1/4" sensor, which has a
two-lane MIPI CSI-2 data interface and uses the I2C bus for control

The initial version supports the following features:
 - Manual exposure, analog and digital gain control
 - Vertical blanking interval control
 - Test pattern generator (color bars)
 - Media controller support
 - Runtime PM support
 - Support operating modes:
    o 2592x1944 at 30fps,
    o 1296x972 at 30fps,
    o 1280x720 at 60fps.

A separate patch in the series adds support for loading manufacture-time
configuration from the sensor OTP, which currently includes:
 - register patch table,
 - DPC table.

This is based on Hao He's and Xingyu Wu's v3 series that partially reached
the maling lists:
 - patch 1/3 - equivalent of patch 1/4 of this seres:
 https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1597380295-6297-3-git-send-email-wuxy@bitland.com.cn/
 - patch 3/3 - equivalent of patches 3/4 + 4/4 of this series:
 https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1597380295-6297-5-git-send-email-wuxy@bitland.com.cn/
Patch 2/3 that adds DT bindings was missing so I recreated it from
scratch on my own.

Changes from v3:
 - Require and handle clock-frequency and link-frequencies device
   properties.
 - Separate the driver patch into one for base functionality and another
   for OTP handling.
 - Do not perform OTP initialization on driver probe, since it's a
   costly operation. Instead do it at first streaming time.
 - Fix power sequencing to match the hardware specification.
 - Set system PM ops.
 - Various stylistic changes and general clean-up.
 - Add myself as a maintainer.

Hao He (3):
  dt-bindings: Add a vendor prefix for Galaxycore Inc.
  media: i2c: Add a driver for the Galaxycore GC5035 sensor
  media: i2c: gc5035: Add OTP configuration handling

Tomasz Figa (1):
  media: dt-bindings: media: i2c: Add bindings for GC5035

 .../devicetree/bindings/media/i2c/gc5035.yaml |  142 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc5035.c                    | 1972 +++++++++++++++++
 6 files changed, 2137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/gc5035.yaml
 create mode 100644 drivers/media/i2c/gc5035.c

-- 
2.28.0.402.g5ffc5be6b7-goog

