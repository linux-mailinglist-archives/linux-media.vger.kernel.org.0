Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B01D15CDF0
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 23:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgBMWP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 17:15:27 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:50461 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgBMWP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 17:15:27 -0500
Received: by mail-wm1-f47.google.com with SMTP id a5so7974372wmb.0
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 14:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3cvRiUD9Nl8p8YLjwne8+EjZQQWMV3C+2eRUsxiU0Y=;
        b=obfKpjZrGeQ28llGQWizduZmcSjrU3n3fyjbkEtDAc7X4E4qGuZpF0KupIwTnVYeKb
         /4depdHqgxty/txIX/hotOggnb7A57wwTi9brubyBvVyKVwSjQ5RdEMZ4or8PAoAPGSN
         WHiTzXU4H1NRkgC+MmVuFK6t0VSI7Ds5r/sQ8rDbyQCbhQlx26ZA+59Z6O9vJzPqi2lI
         7epmIFe4CYldjIdF94AVjnl+ByvFGqGnixrAD1ysfvqvo8dRSviBm6x+BDpt5xjNDGwL
         4HYni4Z4pdKsc8EhHLdBXnX6LlsyrPmAYWAIkqLA1VUdsCTIlMJhuQvVd9llGnqpSnwa
         ffVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3cvRiUD9Nl8p8YLjwne8+EjZQQWMV3C+2eRUsxiU0Y=;
        b=lVZx0Yl6bJX8cgt7WMQ75M7dXyXHZgwnjn2rJ5/V1H3lEwtiIoyL3tw3Nm3OQBlyGM
         I4O9k7k4XE/UQ//dFbYTxOe8qPdNQ9bp00q++IqBoiGMKCLmEVLM/F65VYdOFWWkKqsy
         /TdvrXVQu4AI/wH8Oq08LDoLGH9+nHIAx/LPh8SkOszPQBQauoR7g/9s11lSntmOQ0R0
         jPGUjvFLkRGEAnbodGK5BUuzKzQU1qlSjE4wSk1pInKIznlwoyyn4VrFwKWXmc8hipVB
         yrobt4KdnGhxyNBQ3+Guav80caISJf/U/rB8Qd6A/Qce2j20ER+U5PsdOVEvysyRf8dZ
         Ea3g==
X-Gm-Message-State: APjAAAXTw3oFXH9mA2k/Ca8E7H5O9tJkLHSCZ44JLiO0h9tXplmwvtJt
        eMkuHdf2LWzf5xk4Og+FKG64+LTU
X-Google-Smtp-Source: APXvYqxt0CpQAAb1iZV4IYSleIdo4xdoY1PZW+GdIRpE9o6+t7Mrte9eakVwz2MN3zs/5hbTzore6w==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr184315wmc.185.1581632124560;
        Thu, 13 Feb 2020 14:15:24 -0800 (PST)
Received: from localhost ([37.237.208.38])
        by smtp.gmail.com with ESMTPSA id i4sm4524633wmd.23.2020.02.13.14.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 14:15:24 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v4 0/2] add videostrong kii pro keymap
Date:   Fri, 14 Feb 2020 01:15:11 +0300
Message-Id: <20200213221513.28540-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Videostrong kii pro comes with a NEC remote control, this adds support
for this remote and also select it from the device dts

Changes since v1:
- fix styling issues

Changes since v2:
- use KEY_VENDOR for mouse key
- use KEY_PVR instead of KEY_RECORD
- use KEY_APPSELECT for the launcher
- use KEY_TV for the tv app key

Changes since v3:
- add a patch to use the keymap by the device's dts


Mohammad Rasim (2):
  media: rc: add keymap for Videostrong KII Pro
  arm64: dts: amlogic: add rc-videostrong-kii-pro keymap

 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |  4 +
 drivers/media/rc/keymaps/Makefile             |  1 +
 .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c

--
2.25.0

