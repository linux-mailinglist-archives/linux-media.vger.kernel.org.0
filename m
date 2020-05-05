Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BE81C5268
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgEEKBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728481AbgEEKBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:01:46 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB9DC061A41
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 03:01:46 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r26so1656031wmh.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LL5Exw/qifs+ywjXu90IVbYhDqBc3wJ0gzzOrYmWxA=;
        b=h+wkAt1i/yCYuX+qg1JC8lx8oQsta2OrisDGdBFuMTcvtQk/cQivwwqTaDR0pmR3DP
         39LFUa7BjHELU77lw1tHM5xu+whtgayMBcmmYv3pIh9k7md57hp0p93IVtvEWnIqdujM
         coqXsmWyzIIzwqGFLyxYVnKyb92OfpUSbyDGNjGexX6ymnJPeW7KUNHXsCB2YO6JPH/n
         ENOoE7YlGuM/vT5atE4/qKpekrQsvgrCqC2/4crQaO2O7W+OLjuQGfD5khlyDBk5OuuN
         2wuWE6Kfi+D2X9DZJQ9f8lJU8LiHMfPbQu6xwjW/piotoJSnupNpYhyAgkg7XEWc77L+
         ueSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LL5Exw/qifs+ywjXu90IVbYhDqBc3wJ0gzzOrYmWxA=;
        b=Dh5wGyNhvaDu4J+YmjBpfFFLLo6m2dJmGuivYOlswXD+5jKP76pEHSTgFW5pgerdRm
         EG9IAA3staUX7Z7afaKie4NLXhdDc79mrps2g6Kiu5ZWjFGs9SjJQ9Rv9/hlpc4kXDfP
         T138AROKdVU4s0OY8eH0RUyHTDiuIsmdJkIfrKSF03ESx8/M1w+pKpKBBAJ2z1gGAMqL
         hUcFtrYGPeS1E6e6NlgHgalxyrnTph6ZZlW+CjzSKMU2/Umbcwd9gDyTvmI7X6iH/zyD
         G8h1IpkB0Tz+c6VGLx9yIG4GxA1DCeLLyQKbuEdJ7o3fQPuNHFAt3hsXfZWKgChNbR29
         ruPQ==
X-Gm-Message-State: AGi0PubtOvBn51htw5KKyi7DFyn3tyRZYrDN2ipo0WKwwYb+QSU1l+pr
        pjgTvZJ0yG+PjNgBVFw/xPozPA==
X-Google-Smtp-Source: APiQypJH4ypVMYFM9XMVWAInmVcCnVeQt1dycl0lYgZmTAGLLZ0z5kQZxnBsAutgmTA2Hwem48xMXg==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr2318452wmg.109.1588672904726;
        Tue, 05 May 2020 03:01:44 -0700 (PDT)
Received: from localhost.localdomain ([37.120.63.158])
        by smtp.gmail.com with ESMTPSA id n6sm2884258wmc.28.2020.05.05.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 03:01:44 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v7 0/3] media: ov8856: Add devicetree support
Date:   Tue,  5 May 2020 12:01:27 +0200
Message-Id: <20200505100129.104673-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.


Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 142 +++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 190 ++++++++++++++++--
 3 files changed, 319 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.25.1

