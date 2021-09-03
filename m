Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C6040059F
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 21:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350663AbhICTRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 15:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350618AbhICTQ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 15:16:56 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04736C061764
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 12:15:56 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so230132wme.1
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCEKx7utYrwkWL98r7FBoPPDURIg0879OiU6M0zgQ8Y=;
        b=VX11jB6gOfOzEMAWcceoSjCouFUaZpGXIPPupzOxCg7uZe9taoXFcI3QO2JUO4ZGci
         M3ThXVVTxMH2xiX3TRkMjlJpz298UVrE4/U0G8/gxuVL3KaZ7P7s1T/805gcveQmSjOA
         2dGBiymZFoCIap7OwP/Eyx5ZuEu+PsV1R2F6454Kf5ppfEvjtd1VeOTus/uHQNO/fLxy
         DhmDvp8wH0pxv++Ib/Nf65U4hjhY4Akkk2LFRVanDuVQatkHuM0fuVId6ohWL5h9adUJ
         Y/YGg9VgJMO4U2uUibUva6A20+W6cwnDix/3077970kAj1l+iJ2SEJsZUtRLuxM/mPn3
         YkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SCEKx7utYrwkWL98r7FBoPPDURIg0879OiU6M0zgQ8Y=;
        b=YpTBpuHcAx05m+DJFd8WNuscZyXqTJM4BUNbVD7qrnHC+44NtYd17snebACSHFOLba
         XErHd0ha3jGfR8WBTcNgZrFdsXS/rqJRUEuX3iM22kLHwYtqHrTQ8D9JXQx/GqsIa1VW
         FzDuh3Wsc6989thmn5fNVPmCyENXr326PuCbXYf8m6lVKfvvWOUq2+a2eWrpPCLMOsM4
         N62Xfc+YJ/ZU1nSGsboVgbaG3xJ7ExCuVAiIYnY+TS2PtnkRkR1DQMWjzzVrP3G4vde6
         29jh9hLAHvlyYZ6pwEeM1+I7HM04ZabDpMtJKbnW2sEXu1vNYhQjUX+oIAj6GNUQQ586
         NI2Q==
X-Gm-Message-State: AOAM530OrROcf5cUa/pcpLXv01q0Mz6dbAsmP/XtvRD1afMW62fhra/o
        MT2weDJJ3EBLsAZhVeGvulUJ27Xl0eTuVjezaFw=
X-Google-Smtp-Source: ABdhPJztyWjMkam7gbJm517Pa8QO9y5uIwtoPSks8MeGt/ZyN11hmZZ5n1fS8fPujss4uzjqYDqYUA==
X-Received: by 2002:a05:600c:2e4a:: with SMTP id q10mr224171wmf.189.1630696553935;
        Fri, 03 Sep 2021 12:15:53 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:53 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/8] staging: media: zoran: fusion in one module
Date:   Fri,  3 Sep 2021 19:15:32 +0000
Message-Id: <20210903191540.3052775-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

The main change of this serie is to fusion all zoran related modules in
one.
This fixes the load order problem when everything is built-in.

Regards

Corentin Labbe (8):
  staging: media: zoran: move module parameter checks to zoran_probe
  staging: media: zoran: use module_pci_driver
  staging: media: zoran: rename debug module parameter
  staging: media: zoran: add debugfs
  staging: media: zoran: videocode: remove procfs
  staging: media: zoran: fusion all modules
  staging: media: zoran: remove vidmem
  staging: media: zoran: move videodev alloc

 drivers/staging/media/zoran/Kconfig        |  24 +-
 drivers/staging/media/zoran/Makefile       |   8 +-
 drivers/staging/media/zoran/videocodec.c   |  60 +----
 drivers/staging/media/zoran/videocodec.h   |   5 +
 drivers/staging/media/zoran/zoran.h        |   7 +-
 drivers/staging/media/zoran/zoran_card.c   | 259 +++++++++++++--------
 drivers/staging/media/zoran/zoran_driver.c |   5 +-
 drivers/staging/media/zoran/zr36016.c      |  23 +-
 drivers/staging/media/zoran/zr36016.h      |   2 +
 drivers/staging/media/zoran/zr36050.c      |  20 +-
 drivers/staging/media/zoran/zr36050.h      |   2 +
 drivers/staging/media/zoran/zr36060.c      |  20 +-
 drivers/staging/media/zoran/zr36060.h      |   2 +
 13 files changed, 229 insertions(+), 208 deletions(-)

-- 
2.32.0

