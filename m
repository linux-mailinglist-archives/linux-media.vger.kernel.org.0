Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41C81D43C3
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 04:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgEOCwG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 22:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgEOCwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 22:52:06 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205BDC05BD09
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 19:52:06 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id u38so874881qtc.0
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 19:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=NAyaejGrf93nt8pW36yE2fNFkiHLtUAH63j40bBmenI=;
        b=ZQhRm5S1cEg3649XV8qDQfM7xNWtqqmevcu401ZzYJJzZAXPmJno+266EDY5uEKtkw
         ifZTmFUHsOUEDT6VYK8UFoyaPole5rIJ+0+ygxasn8rfSso/WKZ2lUzXP9tSISABoFQz
         qVcMvlIngJmaQX4mAhOjKntXui+zHGW4cr8ivUL141QCsPt0brMzwWNXuSUW1U/JLC94
         LA6rYGhODdHMII7BTX6JP4IkCs1oaH2SSwzEPwPcLschCgMLgPVVarfm3zSv0Va3xkL8
         lyD2N4mLq8hyVwYfx8IxevDQgM4f/vKv/MZwHcKtAnuagdc4Qgvcd/v2oGgOXuqupX7y
         XrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=NAyaejGrf93nt8pW36yE2fNFkiHLtUAH63j40bBmenI=;
        b=ExVJwbkKQ53i97ra3E6cMUvJSEtbizzWjY10jrLnE6qV/mJPHNVnRz8oEOMEzLppLz
         eIaVMoyMxx9t8arooHDfhDapO65wVaqsn+oE5lApyFqjI8qljrg9LPO79xJgvp5VK1AF
         6LKzor8zYQFT2WpO9txtlQrmuZOxpLn1uAxMaQ8bJusMaw6q/4URKdFiVFAEcx3s6e9B
         bHwwXICwEyAGDMpMmy3FVmdTp7yWmheYjfdw9IrvSNVfgSUm++UPhGfOLYFVwpvXT6or
         enolZt2GB1xT6AxMlsLcYD7muofE3lO2vV8xPzn5K6BuhEVwnrJp8tQ2KHPoJ9d37+J8
         vPfw==
X-Gm-Message-State: AOAM532r2EZ5Wu1zmS/Vs2DbDJR/tOFRCTqgwkuJzSzyeT6OqV9KVXV4
        lbqow7Hoy6cOeyldOIPBtccCsA6reDs9J+c2j54E1rqsknYmuVlz6TyC3tf01ZJFSKGJihxvYrF
        vvAO5iM11ulFQgYAnNaXQEk1pVKwH/1gTzKoO1ASRG/CW5BGblY6nNNEVtDXF3wcVm7LYG5M=
X-Google-Smtp-Source: ABdhPJzVF7glSMtfobwUtKu/g8RRnTn+EXn8JI6tlCrq5/XbZH99kq3gAROFhsNb3fT5Mdpr3CNz7GlT0hLd
X-Received: by 2002:ad4:4c4f:: with SMTP id cs15mr1397904qvb.117.1589511124983;
 Thu, 14 May 2020 19:52:04 -0700 (PDT)
Date:   Thu, 14 May 2020 22:51:57 -0400
Message-Id: <20200515025159.101081-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
Subject: [PATCH v2 0/2] CH7322 CEC controller driver
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
 drivers/media/cec/i2c/ch7322.c                | 501 ++++++++++++++++++
 8 files changed, 597 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.26.2.761.g0e0b3e54be-goog

