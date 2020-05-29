Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3401E7332
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 05:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391764AbgE2DAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 23:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391728AbgE2DAU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 23:00:20 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63289C08C5C7
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 20:00:20 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id l1so1249015qtv.13
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=lI0Q6FZINWMsCqdHMNmAEdxWrOY+He9ibCjQyKGbuIo=;
        b=iR0wgaCZ4Cqh0pE/qgXOa1suDs5YWBzaulscmYb2YUgV2sA9zHfS7zjVfINGwrhkbc
         fXtlLJjqejfEsL9x/WY3TnkaK31HM9lA9kLPZKCFCXqPgzulGPgSaekSdykIR/L3bKRS
         psMXsaG96OSATMQYHeszaY8qIlH9zRIcec5GO2GW30+YDzXVdJtw15i7O4TR9IOnOJz0
         0uM5kQG8T+JiH00KK3Dep7OSuWu1R3h+109QXLT0lyeVaxp3ggzgcOqfGJ381DyiJLpU
         xcoEh6fmE8Jmn9/2n8yjFemuB6qC2NhcB8FJjwPO8tYSKKQ9ydrtvjgiGyf4mLiJWQKX
         vYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=lI0Q6FZINWMsCqdHMNmAEdxWrOY+He9ibCjQyKGbuIo=;
        b=PxuzeEDg1F0jMqWa0MiFCTxmzsWcn0EC67MX9Xhi6/pT3crHhBJ8JkB3Xs9Plamq2P
         g6OMIYbTGqgRJqcCrKg6T1lpshenWi3av83Hb7UELjWZA0qpq1v/PYoD2DwyEAXID3vl
         aRxxslRey1HU158ovMNoxmRHIEnSOpEfbDRfrjT8lA0N53lqy0zY0gFK7NBJLnXCLzm8
         XQgdfC+Vtnsj5ATd55WjfmJHMdCeTvQqFqgtd9+R5dBKpNiSAIXJwfacMcctlAKlypJS
         H0RdrgNh62xujeRaQz/eUeaN0g2LoAKNMgQim9AMSMI1VatIezeTTvkXMUuL7OoAeXJi
         xZfw==
X-Gm-Message-State: AOAM531T0sitkXH3ieSRUXaYYPifEjiLapqOrGvohDz1YzE4xl8htbQ3
        VFVzFyTxAwrTqtzmcyK0+fEEc6a3So72gprst6nVrZYtcgA6ol9But1m3antg6JKeEG1RsMjaGy
        WJ1r4tV5YTZefDw3iHFsCfCQMlIr8OKqwTWudEpjkGQukG5+26n+4cJmySKZ3KhntSsiqpIU=
X-Google-Smtp-Source: ABdhPJyZfiv7R2c/sS2hwIC+F1gIlp+a63vWm1DnHY3Ra0l1F2/057hmvFvmeEuVeO/iQwjJe9keFhdI1x9x
X-Received: by 2002:a0c:e48f:: with SMTP id n15mr6380735qvl.73.1590721219377;
 Thu, 28 May 2020 20:00:19 -0700 (PDT)
Date:   Thu, 28 May 2020 23:00:10 -0400
Message-Id: <20200529030012.254592-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v3 0/2] CH7322 CEC controller driver
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

 .../bindings/media/i2c/chrontel,ch7322.yaml   |  65 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 drivers/media/cec/Kconfig                     |   1 +
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/i2c/Kconfig                 |  14 +
 drivers/media/cec/i2c/Makefile                |   5 +
 drivers/media/cec/i2c/ch7322.c                | 523 ++++++++++++++++++
 8 files changed, 619 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.27.0.rc0.183.gde8f92d652-goog

