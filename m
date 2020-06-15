Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85D61FA067
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 21:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729807AbgFOTiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 15:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728771AbgFOTiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 15:38:17 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D9BC05BD43
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 12:38:17 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id w12so13854679qvh.13
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5eOZUAynrB54V2IFcB0rduao9pIQ/GV86N0Z7+fYQuk=;
        b=Rw0geJKsbkTzCx1CNT4BSLxHeMF0uXmJ36DSuJbfRs4jqw4O2fIZranQppKk4Jixi8
         +PsChKOjN9TYHcZWdBaAfTRyuHu0eLt4X9zTn3llYtSQgkjB/vPmyxyW58sW7ctcVK6m
         nALDmJNiS4frYolhjIc8TpvVWJciw7bTzbQpxvkOhMMFzHKVk6a/Lyg106MmWoeiSKpl
         96LPpNnfTvX0aqrd9b1SUmmES1oF/eC0uTR43jb1rdZOyuO1fUM3hZ8SW0QZsPKOKsVa
         UA4DWhKxW3I484NOmuqfRT1CtZgBpB5VMxHbYuyJjmw62cp0wsilI6EyfpmPpO8G6TTZ
         MvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5eOZUAynrB54V2IFcB0rduao9pIQ/GV86N0Z7+fYQuk=;
        b=sEGKm96Bv1AWIKSLrX0qq8jVKkHrFaShOAqvpDh8JepZ17ZjdqLX+EBINqPofmntYS
         /LrhPA7YXxKI15OQJmImwq1YjvuvIm8D5DRNv/c9OZ+qZgr8lhCV9BB1gAAmOGttRnbk
         9iovt3xk2KK2ha5j4qwAGHu21nR3oA6mMgwPmJhNy/9q/EOppaNBQW0iqaVT6d17LRg3
         qp5Bea3IYeJv2I60xaFPE0Ve62XhnsXL4xCPnpsxXqJpBCboIQmU8GRfsPZdULGCYqO5
         rME+pwp6SXrkIAwHSHSB58aidpFXe4AU9V0mRTeFdy4ooNLjtVbzv5ZCIsiI7gz9p5Wy
         Kt1A==
X-Gm-Message-State: AOAM5325Qh2ydIVLFax/VpkYarkPnloevZottXgOQ5G53oLseWkcPrFB
        QTXk10ErH7s+1yLOuW7fn15CqfgXkDw5Z1ER8+BFO3xfKt69Lsg6u1R4qfnzIMwUWjtsDpLWSoi
        enXZvA/VshrcCciB19j2dh2Cetzh5Sp7ksP/ci3T/kqEYB5hwx+gmuCLyZMo1C2GqaNd2sA4=
X-Google-Smtp-Source: ABdhPJwRDxMUcF+Z2stea+XUcMYbmNoEZH2WRU4z72FyekNDlYKYCgYKDnS0rsS9L27ixycQv8H4OQs3X1+s
X-Received: by 2002:a0c:ed26:: with SMTP id u6mr25754393qvq.141.1592249896661;
 Mon, 15 Jun 2020 12:38:16 -0700 (PDT)
Date:   Mon, 15 Jun 2020 15:38:09 -0400
Message-Id: <20200615193811.233737-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v5 0/2] CH7322 CEC controller driver
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device driver and device tree bindings for a Chrontel CEC
conroller. This is an I2C device that can send and receive CEC
messages.

Changes from v4:
- rebase onto master (vendor-prefixes.yaml already updated)

Changes from v3:
- address devicetree comments
- revert interrupt mask/unmask in cec adapter enable
  (the driver relies on the interrupt to get the physical address)

Changes from v2:
- fix formatting errors
- mask and unmask interrupt in cec adapter enable

Changes from v1:
- fix formatpatch.pl --strict errors
- additional comments
- enable and program logical address register
- add flags to aid interpreting transmit done status
- move ch7322 out of devicetree trivial devices

Jeff Chase (2):
  dt-bindings: Add ch7322 media i2c device
  media: cec: i2c: ch7322: Add ch7322 CEC controller driver

 .../bindings/media/i2c/chrontel,ch7322.yaml   |  67 +++
 MAINTAINERS                                   |   8 +
 drivers/media/cec/Kconfig                     |   1 +
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/i2c/Kconfig                 |  14 +
 drivers/media/cec/i2c/Makefile                |   5 +
 drivers/media/cec/i2c/ch7322.c                | 503 ++++++++++++++++++
 7 files changed, 599 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.27.0.290.gba653c62da-goog

