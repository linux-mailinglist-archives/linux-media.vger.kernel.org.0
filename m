Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BAE3C25E2
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhGIO3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbhGIO3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:13 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B23C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d12so11792468wre.13
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbC5nJaoh+hWdWc67g+zjhO1RlIfhIErNWQTAaXY+Pk=;
        b=CyUBP0y5kzTeCOA3wDLlYi/nrmG8nHNpxrQFRbRZodozeH85RnPwCUlkdA6OfmpwIa
         LSNQt9WslBxxsUUG+r4kgdGFFvbIHaNjJQ/a3rzFPXZSxxFmhCMonlLz8ccoHJfgUjFJ
         aJv7O6f+zbs7dLwldhzd1b8ISZSiM9Z5JW8crH3FRfXDZVQNMQITeLubkMDppX1txGUZ
         gvR3C4ZL95W03g5h6SkBCSJp/3YGJ1yo8i6y+TZiasYBX/uHV9orp0FmMBD0l7mQN8JL
         Sc/ZxM3m4zYNTZwVvjDu2StFzxK90rijwAFYzEcAxHPbDoufRncvHyPxMNMNpiG7+23Z
         jKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DbC5nJaoh+hWdWc67g+zjhO1RlIfhIErNWQTAaXY+Pk=;
        b=eVJcvykHB9+kZQ7pUn/3ICkNmREuOmMGRvTsky0I4Jb1L01zAYx30XRY2zymf/FAeu
         qI1rtZtL9hOWI2Zzzz4kWUp4nSRTMdTsflbJUHrUUsWa63UY3uQSlMip7AH8Ly8/NO6S
         mrVojR4KsfbpCJ/9tr6UDM67+ftQl5LJDGWWKbsgabPRYnPxM92VqgQqRvjL647vvBR5
         raZmafZJWJBgXgKSV+UyTPRpWnkwnIrRG/8Zxg8nZq35qq0Bs8JoY/TIMWGglDbx2cPA
         /g3PHCnFVJGOsGEguUkq+UIkV1HWVX6G6VTAgCo/eC72LTauVwbuYnjOImUs3iNzJTOX
         D9GQ==
X-Gm-Message-State: AOAM532+6zFOOsSPEVZUBDLbb4t7wRHDDKCxHn4ukNidksempRExhEZY
        EKuMW565AK46Gz6HMIF+yh0l0g==
X-Google-Smtp-Source: ABdhPJxY+EC3lUAjIE9FkShh6ndNJWtH7/7l37Q57S3ImnBq2/uaJ2A3JO2VgWmWEFD+TccmYV2/nA==
X-Received: by 2002:a5d:684f:: with SMTP id o15mr41131746wrw.134.1625840788138;
        Fri, 09 Jul 2021 07:26:28 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:27 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 00/11] rcar-vin: Add r8a779a0 support
Date:   Fri,  9 Jul 2021 16:25:49 +0200
Message-Id: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds support for V3U (r8a779a0) to the R-Car VIN driver. The
V3U SoC is different from other Renesas SoCs as a new IP block (the ISP
channel selector) is added between the CSI-2 receiver and the VIN
modules. This new ISP IP deals with CSI-2 channel filtering based on
VC/DT which in turn makes the VIN drivers much simpler with regards to
the media graph. But it also means the rcar-vin driver needs to support
and generate both the generic Gen3 MC-graph and the specific V3U
MC-graph.

The rcar-vin driver intertwines the VIN group concept and the usage of
the media graph into a single implementation. This needs to be broken
apart before the new V3U support can be added. The first 01/11 - 10/11
patches deals with this separation and its fallout. Fortunately patch
11/11 after all that preparation work is quiet simple and straight
forward when adding the V3U support.

There is a large patch (10/11) in the series, reviewers please fear not
it only moves blocks of code around verbatim.

While working on this series it have become even more apparent to me
that the VIN group concept probably should be replaced with something
like the Media Device Allocator API once it learns how to work with DT.
This series separation of the two VIN concepts is a good first step for
me to hope to find time to dig into that.

Niklas Söderlund (11):
  rcar-vin: Refactor controls creation for video device
  rcar-vin: Fix error paths for rvin_mc_init()
  rcar-vin: Improve async notifier cleanup paths
  rcar-vin: Improve reuse of parallel notifier
  rcar-vin: Rename array storing subdevice information
  rcar-vin: Move group async notifier
  rcar-vin: Extend group notifier DT parser to work with any port
  rcar-vin: Create a callback to setup media links
  rcar-vin: Specify media device ops at group creation time
  rcar-vin: Move and rename CSI-2 link notifications
  rcar-vin: Add r8a779a0 support

 drivers/media/platform/rcar-vin/rcar-core.c | 960 +++++++++++---------
 drivers/media/platform/rcar-vin/rcar-dma.c  |  20 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |  24 +-
 3 files changed, 577 insertions(+), 427 deletions(-)

-- 
2.32.0

