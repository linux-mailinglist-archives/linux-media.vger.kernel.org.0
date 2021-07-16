Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008693CB8FF
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 16:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240359AbhGPOsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 10:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240361AbhGPOsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 10:48:12 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C17C061760
        for <linux-media@vger.kernel.org>; Fri, 16 Jul 2021 07:45:16 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h9so14397633ljm.5
        for <linux-media@vger.kernel.org>; Fri, 16 Jul 2021 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VewEt9Sal2E694kwqU/1zQiu0e9L1vNSWqLI289mobQ=;
        b=GkNk0fsCcdTMKo5D6LBy/xNq2Wnz9hXULvjrUWYo2Dw4dB7jE1SqZzZEGKsaAfLpaO
         5WiLZmeFr1kLQ/lhl+GwIJZ7UG8sUT1Py+w6Bxf8mM1CfKNGYXcCX9iPqyHpdpk57uf/
         YirL+S4f9IR6w6c+Dr2DSVrDz7Kz6ywObNMiVN13FXO/iZoXsa8Ay8pnQKigio+HEUKq
         5hYq4kr8jR/k7jrdGfWBaHjK2XdazjwwhHK5rRjG4Umz5iULOuKIkeB6wkD9+zj2+KC9
         dMmU9CaciDfGxQcVXjjtj05DmIq4QJMANVKhpjKbQZQtIyTLoB6QE6XYM1IdfieBcSVb
         qmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VewEt9Sal2E694kwqU/1zQiu0e9L1vNSWqLI289mobQ=;
        b=I+3+723tjWjVPh3JFjpPjcQEbHVf0zq6olISQQyCUJk6HejT/iBNw1pt3tOGRk+6gS
         l1NH0SuiuWoLxWsUcqBGhUX20tgDWSmW1hy9qKF00hEHSVU4WbRVC/iIRKePCe6whJcT
         P1PVHJx7UT3WjMA9BLGzHxKSUEpQ+pjeb2ckeN+hpNaofrVC3a9Abu3voLafYuiz4CA6
         LKDi428H5Q1I2VZ3tK9jZfABtaUaTe7YRnzmUv6ifj8I4j4tLPA92TpuBVSNY862dJs4
         Yj5hXPxvw0hKXQAHgIdwx/6sQSc4NANwXD1oXBdZc7UaROp2RcbxQkgP7jLhEfBSaaW0
         qfmA==
X-Gm-Message-State: AOAM533w182Ruz/1RB9l4TXMDm1rZuLX6HnEk0TWR9l/4gZ1R+wyCe7L
        3Ct2C8pqOYXzS7juSVoOWFXa7A==
X-Google-Smtp-Source: ABdhPJwy/jnKpQb7gQ4wl9610QlKRrHy9FWD9SWd1F4D+5MmjA+SijzOnrs5gXqreZh/gl6SLs9Mmg==
X-Received: by 2002:a2e:8887:: with SMTP id k7mr9194849lji.226.1626446715159;
        Fri, 16 Jul 2021 07:45:15 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id b6sm992327ljf.59.2021.07.16.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 07:45:14 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v6 0/2] media: rc: add support for Amlogic Meson IR blaster
Date:   Fri, 16 Jul 2021 17:45:06 +0300
Message-Id: <20210716144508.6058-1-viktor.prutyanov@phystech.edu>
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

 .../bindings/media/amlogic,meson-ir-tx.yaml   |  67 +++
 drivers/media/rc/Kconfig                      |  10 +
 drivers/media/rc/Makefile                     |   1 +
 drivers/media/rc/meson-ir-tx.c                | 415 ++++++++++++++++++
 4 files changed, 493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0

