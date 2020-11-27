Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9C22C6D42
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 23:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgK0Wdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 17:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731664AbgK0Wb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 17:31:27 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFD6C0613D1;
        Fri, 27 Nov 2020 14:31:02 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id s8so7006732wrw.10;
        Fri, 27 Nov 2020 14:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=usJ3A0+AEcyPFYMCun2w2vVyj54EaMcegACm6ZHIIqs=;
        b=Hv7hKNXh5ewYlUwLqPovTxP6piN42zRTWsKdKi5VP9nO3DAsJgEZw7P0N2geE2AeBL
         AS2jPRT6ZA2AG/W6q3BrZ2nF2kpwcXcY8sV+u6VTnZIDQz6eqR5/kV/Qaf+vAb9LmIDg
         bkdL9mPxcK+Ev2fXorKKP+BLG5DUkL/2gkmmvHZPIL6/tEfoJWAmaSkHgqWOzUOr+mtC
         5qo0ROEIh9sNN+vBBIr09isyGQFXnDsMto9JgpR8XajmU0klF6iUtI5jWGPt09q+B/y4
         wC6LgLiuA9O7GDBJpwynh4W2zDbmx1W2ApYyqTHmqdPT+LH45AQDXXe8I8vNitPZvq/7
         8TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=usJ3A0+AEcyPFYMCun2w2vVyj54EaMcegACm6ZHIIqs=;
        b=jEzlYsobkFIl7XIDu956om6zxA50LfRfp4E7Jj0BXI2uzowXrEcECyo4pc1ZnNsUfW
         nAAr4FJW+7bdXAvPnzX0s+6f9sZYjfgqUid7hOJR9ORupmDy6K7lqHZDWgXxqRlWsF2T
         Y/WqLPtsXpu+JIJsywELMfWMQyqHXftkHW5+rcSOnKBcKctsHDq+q8xu/wmiOJSpwVJM
         o/2TDOnQJyx0eaBSpNRUOhi7H/TpvTc1NhexRT8kZmgsaA+L6a2o9nIaqAYEydwftKR7
         GxymziFplXhVam3S51vX+paucO2WYJcCZlPV0QNOwxWJMOeOxnQaBKQsgviuKG2jwieM
         I3sA==
X-Gm-Message-State: AOAM530tEDOHtolEg50T1QWZfRVgBAABRDWY5rTGuoY97Zb+ek+LzTxa
        Zp3l2h/wG9jwHvk9J1Lulz0=
X-Google-Smtp-Source: ABdhPJyMvlVKabX/YwPo/pxpexAiMvONIINt4aYxVa0VIzBxunZlG4sFzih0FyqVnqn+xh0XV9opIw==
X-Received: by 2002:a05:6000:120c:: with SMTP id e12mr13777860wrx.59.1606516261315;
        Fri, 27 Nov 2020 14:31:01 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id v188sm3308696wmb.20.2020.11.27.14.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 14:31:00 -0800 (PST)
From:   kholk11@gmail.com
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, marijn.suijten@somainline.org,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@iki.fi, andrey.konovalov@linaro.org,
        angelogioacchino.delregno@somainline.org, kholk11@gmail.com
Subject: [PATCH v3 0/2] Add support for the Sony Exmor-RS IMX300 camera sensor
Date:   Fri, 27 Nov 2020 23:30:45 +0100
Message-Id: <20201127223047.2764643-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series adds support for the IMX300 camera sensor, (one of the)
first Exmor-RS Stacked CMOS sensor(s), with support for both of the
supported aspect ratios (4:3 and 16:9).
This driver came out from reverse engineering of so called "userspace
drivers" from Sony Xperia smartphones.

I tried to document all of my findings and giving a sense to the registers
as much as possible, but that was only partially possible and resembles
some names from the IMX219 public datasheet, even though the addresses are
basically completely different.

This camera sensor driver was tested with all the resolutions declared in
it on two phones: Sony Xperia XA2 and XA2 Ultra, on a SDM630 SoC (camss
patches for this SoC will come in a later series) and is working great.

- Changes in v3:
  - Removed unneeded fallthrough statements
  - Fixed double mode initialization at probe time
  - Fixed typo in the dt-binding description (8->25MPixels)
  - Fixed dt-binding data-lanes description, added to required properties

- Changes in v2:
  - Changed dt-binding name and fixed a misconception about lane
    operation (sensor supports 2/4-Lane, driver supports 4-Lane only)
  - Now using lowercase names for regulator supplies
  - Fixed redefinition of clock-noncontinuous property
  - Added informations about constraints on data bus frequencies
  - Fixed MAINTAINERS: removed git tree

AngeloGioacchino Del Regno (2):
  media: i2c: Add driver for the Sony Exmor-RS IMX300 camera sensor
  media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding

 .../bindings/media/i2c/sony,imx300.yaml       |  112 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx300.c                    | 3081 +++++++++++++++++
 5 files changed, 3214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
 create mode 100644 drivers/media/i2c/imx300.c

-- 
2.29.2

