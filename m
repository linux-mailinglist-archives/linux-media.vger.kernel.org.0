Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7E63C9314
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 23:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbhGNVaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 17:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235700AbhGNVaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 17:30:10 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8410C061760
        for <linux-media@vger.kernel.org>; Wed, 14 Jul 2021 14:27:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y42so6080248lfa.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jul 2021 14:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YRJ7o0mlWw/xRyIDlZj63kLihIyRP8arTxcwBPV6M+U=;
        b=j8mcdryO+1SyFilZ+FG/FAq5kAO+QkUfj8WRTqfc/eNRgoN5UR976iFyr+eVbqpXaa
         uV1ZpR8S2RqTIBTP6yh8hXowvMAnauzKxijs/jtVaHK2r4/bIP/2zCk+8g5PB6ZqtAC9
         eHxGdidSENetSYBgM4qhjAcUAa9rnbd8oPLH+N3iFCJH67fuxjvdbOmJhrIbhFIe43CW
         eupWhOvG3Ukd8QUk8LwKzdgcOoY3yOPhjvTVw9q7so9FH5+qOvn40uepilzpKZM9MBqe
         1QzWtqPbZQK29SszHunhc+I5gDxUih0HiNBU9OrOSq72dZGIsWobFV0A4OozlsNHUHZ6
         TL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YRJ7o0mlWw/xRyIDlZj63kLihIyRP8arTxcwBPV6M+U=;
        b=jGSN1gAFOxkjqHePGXGhcMmLzbTl+/GyB5llxxx6Yf1KKBx4WdrGqaOMTcAIG1PJZ9
         /by1LcrXybLsKBgyl8QTSVy7a5p4wqQGVZ1BMOwIH5Mtu6bRve37xH2Fxa2BrkuaQbD4
         KKfYf3zZspmqJO9kkY6bLoc87TAQXVmr9KgWju4BmbgnzsTXqqdBBJA37p8aI68eMAwK
         YsCwFqZu6n4Fq4PC9uctcniXnz/IgHRB+AzgvkcXdho11SlYRypfAwoQ2hXUOZSqa8iS
         AAw3y5jwzdIDrIahauIpWTUv3EKCHeYw3t5DJkwJIVhxwqXrOnltpJUFGCXFAq+ZZ16h
         a6vw==
X-Gm-Message-State: AOAM533lZ20SslPHE5PdqR3/eRuNKJpAdSynDZCHQcejP2WGrf1xnNn9
        QVI9aOSk4uoMoXJvDImpOlLgBg==
X-Google-Smtp-Source: ABdhPJwTodWJWpvnqxhn7bn8LTbuklkoZr0z0YR/nuJWVJnzpCfHQCP/2rK6t3ge41My9ZZ2Uhvseg==
X-Received: by 2002:a05:6512:33c4:: with SMTP id d4mr179570lfg.536.1626298036021;
        Wed, 14 Jul 2021 14:27:16 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:abfe:9c62:44e3:b0ab:76fd])
        by smtp.gmail.com with ESMTPSA id f1sm252156lfs.211.2021.07.14.14.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:27:15 -0700 (PDT)
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, narmstrong@baylibre.com
Cc:     jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Subject: [PATCH v5 0/2] media: rc: add support for Amlogic Meson IR blaster
Date:   Thu, 15 Jul 2021 00:27:04 +0300
Message-Id: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
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
 drivers/media/rc/meson-ir-tx.c                | 410 ++++++++++++++++++
 4 files changed, 488 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
 create mode 100644 drivers/media/rc/meson-ir-tx.c

-- 
2.21.0

