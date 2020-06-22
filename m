Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECC92044E3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 02:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731356AbgFWAAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 20:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731328AbgFWAAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 20:00:06 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6973BC061795
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 17:00:05 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id g6so1679961qtr.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 17:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Kbj1L+CzMZjrx3rE3YlmC8C322viCZOa/XuI/qh7XHY=;
        b=Wf1CIIaeJEMzJi6JMIFXDfHyQR55ZHih8Vuj42ZuhQsZi3B4T0DcfW7B6bzUaRlA+4
         RUdnu6z6atcjpOcEClW6eApEVb/0eh3O7NP9V8zS99xfb2cc0AKLLoIabCt49VQd4wTR
         hdWzAAyGvPrP60Qm+lEYw/Xrb8dNVUAgLDjLB+YhLkbdjEFJ9wHJxR4QXGjIK21M5fw1
         ZkZrMwO+UoC0piEKeOebhYAsba/2SJrmGFKTnA+bNImUzLGPQIUeYKR9PYtp/H4PIatf
         lrR2VHfSzMvJ6kpzgkp5OVrFVHRdq7B3e7GDDcB/R3ZVFuANKIG/nj3c8KxijND1D9J4
         alUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Kbj1L+CzMZjrx3rE3YlmC8C322viCZOa/XuI/qh7XHY=;
        b=XsfYX2C2YXdfyb1pZ/gbEC++QEm/uwFB8qWxyBfpRHiem+9aErVcgVR4eA9shcj6ZP
         dSD7mRhhoq5Jw8b09mAwuPoeI9MvMmJOLk/vDw5MLq4PUbDdk92QViPIBFvaIFdeq6nB
         jN4+iOqiJ2+coob0K/0cEteRsq1gRw3OMv43IzO3ss3uW5+yEFAiftDWz0XTujC/WAJC
         syAv0xxSS1fNt3k15QPcu/U7H4RknoMWNSZ9HzdzDBByp1H2vHv9KUxLepaYg+xCgyJ6
         LHsLgpceoHen18bq+MburcgCMp/LCNM2T/qMB6jOJ8Y4gG+WRmZmJcAj0eUnFkCwZZnT
         QRHw==
X-Gm-Message-State: AOAM53322QILMv0pVWvTIFfk9DygdzrqMwD3p3Dx28PijQ7fJUoO/xWD
        hVqVmbZAU5n2Gf3kG3dlfCqBLY8NnIvdf0FjpENeSTiNNlEJJlzEv9E8yjew5Z56kB/xonQsA27
        hBxX4yCSy63tutYPJlxr18EHJ1cZNdOUKzjehkGe7Kh96IQrjAUp2KDnpcCTwLCOElHwG274=
X-Google-Smtp-Source: ABdhPJzD2pnYyDNNYyJdRWQ9j/+yUwfi4kxZdw0W0H54U6n8c4awjxcuKblW4xDd0d9NT7OK7zgjBI5AU9qD
X-Received: by 2002:ad4:4e61:: with SMTP id ec1mr14236966qvb.197.1592870404041;
 Mon, 22 Jun 2020 17:00:04 -0700 (PDT)
Date:   Mon, 22 Jun 2020 19:59:47 -0400
Message-Id: <20200622235950.169001-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v6 0/3] CH7322 CEC controller driver
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

Changes from v5:
- Kconfig option should depend on I2C, not select
- add flag to cec adapter in order to use notifier without addr updates
  (notifier is needed to enable CEC_CAP_CONNECTOR_INFO)
- add optional dmi matching to associate adapter with hdmi port
- read phys addr if hpd is up instead of relying on pending interrupt
  in device probe

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

Jeff Chase (3):
  dt-bindings: Add ch7322 media i2c device
  media: cec: add adap_controls_phys_addr option
  media: cec: i2c: ch7322: Add ch7322 CEC controller driver

 .../bindings/media/i2c/chrontel,ch7322.yaml   |  67 ++
 MAINTAINERS                                   |   8 +
 drivers/media/cec/Kconfig                     |   1 +
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/core/cec-notifier.c         |  11 +-
 drivers/media/cec/i2c/Kconfig                 |  14 +
 drivers/media/cec/i2c/Makefile                |   5 +
 drivers/media/cec/i2c/ch7322.c                | 604 ++++++++++++++++++
 include/media/cec.h                           |   1 +
 9 files changed, 708 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.27.0.111.gc72c7da667-goog

