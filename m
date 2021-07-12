Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1749F3C64D4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233935AbhGLUUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhGLUUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:20:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27D8C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:17:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id b26so13380140lfo.4
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rf/oy5V65atDUasHDpnT+GK9n0vIPf+l+Loy9PHEV2g=;
        b=L/LG0kiF9dQI5UYt03bUxC7db1G5mmL+zYogzrm0PTQpzCqJ0uOzPzrA1yBTDlUnHz
         Jpr5PYMzj0PHfeqWpQ5bNtX9glzqZC3nHSlYtIJSZjFZ+upR2lbNc0Bj5ptCvxj2E1MR
         RqexC9iCpP/UJEGdtL3o4wmJq2nle9+4svKtHWS8yC5G73xziKtVBi4wnAHYH+12crAV
         LgQJwndM1uaheql9aWc0jYm8tHQ4seYUoPFuRzTtQhLQzIO9dG6fGQt1zic/chZUihRj
         cCOts+iZafOz/VsQM9OyodwsaqxNwtbnDrY3qb6zEkh1Vq2jZaLndzM7vOZjy+szgjkQ
         /mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rf/oy5V65atDUasHDpnT+GK9n0vIPf+l+Loy9PHEV2g=;
        b=VDwRqAvNSvXF2+/jp1JYAP4WuQQF78+USx4018m5hW2vZ7y++JM5disuQWlqsq15oY
         y10AOyMb8TQqpu+O92evcFj3EFdM3WTQLi5xTEmtTTB5ugeHAQqzN21sombPnF0S+8Ox
         dZCGqq/hSHIPCGflFEzGGyBi39nIjWDxpa1ZeD1pEcIpghrk7weQzYhOCk13qGQGS8c3
         ZngrAx8ffw8Ezg/jXq1lQ5/3j5W1CvOpiFjBz/ao+0sOT1qZgE++kKHZa5YwazJ5sbK7
         Lul4Yiqt0INw4FPcsfoEzvhDQily1UnTa8hbVhhmSiKyPW32JQKeB3YHY9zYifdpM8p6
         XfdQ==
X-Gm-Message-State: AOAM533N9gPza7/kBVTlNCDMQ0iWiHpfFMtuy4fv+9bVDN5NzTKBHcdf
        EAPzJJhB6u+r+XhaUu9SMJq1ig==
X-Google-Smtp-Source: ABdhPJxCVPVINOvfBCrr5N+3NDAEy5lpwqjAIrHaYAzlV0oZuwGc8C5fQ5lsfWwgKXJsxv9hLu7lJg==
X-Received: by 2002:ac2:5e67:: with SMTP id a7mr417425lfr.450.1626121068917;
        Mon, 12 Jul 2021 13:17:48 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id p16sm631455lfr.122.2021.07.12.13.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:17:48 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v4 0/2] media: rc: add support for Amlogic Meson IR blaster
Date:   Mon, 12 Jul 2021 23:17:30 +0300
Message-Id: <20210712201732.31808-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is a driver for the IR transmitter (also called IR blaster)
available in some Amlogic Meson SoCs.

Viktor Prutyanov (2):
  media: rc: meson-ir-tx: document device tree bindings
  media: rc: introduce Meson IR TX driver

 .../bindings/media/amlogic,meson-ir-tx.yaml   |  65 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-ir-tx.c                | 404 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0

