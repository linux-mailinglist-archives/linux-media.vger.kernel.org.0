Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397C81A998A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895999AbgDOJvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:51:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:46384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895866AbgDOJtc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:49:32 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FA2A20787;
        Wed, 15 Apr 2020 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586944170;
        bh=yizjy06EFNp5cBRnjnt/vw5ztC1lUh6kH2Srmve5Xz4=;
        h=From:To:Cc:Subject:Date:From;
        b=mCVRVeomnk5S/oi2XnljzCL2xsQ1gBCMMsztZkTP9KUqX43To/iI3te5vBDh2Pmut
         pGyl4op/golVPrevUKXmTLZVu3tP329A3BTzxPFVfznOKt3WrH+InGID7OnYUo+t0L
         +eYo48tZ3T+EIKNwLtRTeKn8OP8xrl2haxsbA3yQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOefg-006WIH-02; Wed, 15 Apr 2020 11:49:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/4] Move CEC drivers and menu to be out of MEDIA_SUPPORT
Date:   Wed, 15 Apr 2020 11:49:23 +0200
Message-Id: <cover.1586944045.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC_CORE doesn't depend on MEDIA_SUPPORT. So, it doesn't make
much sense to keep it under its menu.

This series move it to be just after RC support. As a side effect, now
dependencies like PCI and USB are now selected, making easier to
enable CEC drivers.

Mauro Carvalho Chehab (4):
  media: cec: move the core to a separate directory
  media: place CEC menu before MEDIA_SUPPORT
  media: move CEC platform drivers to a separate directory
  media: move CEC USB drivers to a separate directory

 drivers/media/Kconfig                         |  30 +----
 drivers/media/cec/Kconfig                     |  25 ++++
 drivers/media/cec/Makefile                    |  16 +--
 drivers/media/cec/core/Makefile               |  16 +++
 drivers/media/cec/{ => core}/cec-adap.c       |   0
 drivers/media/cec/{ => core}/cec-api.c        |   0
 drivers/media/cec/{ => core}/cec-core.c       |   0
 drivers/media/cec/{ => core}/cec-notifier.c   |   0
 .../media/cec/{ => core}/cec-pin-error-inj.c  |   0
 drivers/media/cec/{ => core}/cec-pin-priv.h   |   0
 drivers/media/cec/{ => core}/cec-pin.c        |   0
 drivers/media/cec/{ => core}/cec-priv.h       |   0
 drivers/media/cec/platform/Kconfig            | 121 ++++++++++++++++++
 drivers/media/cec/platform/Makefile           |  11 ++
 .../{ => cec}/platform/cec-gpio/Makefile      |   0
 .../{ => cec}/platform/cec-gpio/cec-gpio.c    |   0
 .../s5p-cec => cec/platform/s5p}/Makefile     |   0
 .../platform/s5p}/exynos_hdmi_cec.h           |   0
 .../platform/s5p}/exynos_hdmi_cecctrl.c       |   0
 .../s5p-cec => cec/platform/s5p}/regs-cec.h   |   0
 .../s5p-cec => cec/platform/s5p}/s5p_cec.c    |   0
 .../s5p-cec => cec/platform/s5p}/s5p_cec.h    |   0
 .../seco-cec => cec/platform/seco}/Makefile   |   0
 .../seco-cec => cec/platform/seco}/seco-cec.c |   0
 .../seco-cec => cec/platform/seco}/seco-cec.h |   0
 .../sti/cec => cec/platform/sti}/Makefile     |   0
 .../sti/cec => cec/platform/sti}/stih-cec.c   |   0
 .../tegra-cec => cec/platform/tegra}/Makefile |   0
 .../platform/tegra}/tegra_cec.c               |   0
 .../platform/tegra}/tegra_cec.h               |   0
 drivers/media/cec/usb/Kconfig                 |   6 +
 drivers/media/cec/usb/Makefile                |   6 +
 .../pulse8-cec => cec/usb/pulse8}/Kconfig     |   3 +-
 .../pulse8-cec => cec/usb/pulse8}/Makefile    |   0
 .../usb/pulse8}/pulse8-cec.c                  |   0
 .../usb/rainshadow}/Kconfig                   |   3 +-
 .../usb/rainshadow}/Makefile                  |   0
 .../usb/rainshadow}/rainshadow-cec.c          |   0
 drivers/media/platform/Kconfig                | 121 ------------------
 drivers/media/platform/Makefile               |   8 --
 drivers/media/usb/Kconfig                     |   6 -
 drivers/media/usb/Makefile                    |   2 -
 42 files changed, 192 insertions(+), 182 deletions(-)
 create mode 100644 drivers/media/cec/core/Makefile
 rename drivers/media/cec/{ => core}/cec-adap.c (100%)
 rename drivers/media/cec/{ => core}/cec-api.c (100%)
 rename drivers/media/cec/{ => core}/cec-core.c (100%)
 rename drivers/media/cec/{ => core}/cec-notifier.c (100%)
 rename drivers/media/cec/{ => core}/cec-pin-error-inj.c (100%)
 rename drivers/media/cec/{ => core}/cec-pin-priv.h (100%)
 rename drivers/media/cec/{ => core}/cec-pin.c (100%)
 rename drivers/media/cec/{ => core}/cec-priv.h (100%)
 create mode 100644 drivers/media/cec/platform/Kconfig
 create mode 100644 drivers/media/cec/platform/Makefile
 rename drivers/media/{ => cec}/platform/cec-gpio/Makefile (100%)
 rename drivers/media/{ => cec}/platform/cec-gpio/cec-gpio.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/Makefile (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cec.h (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cecctrl.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/regs-cec.h (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.h (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/Makefile (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.c (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.h (100%)
 rename drivers/media/{platform/sti/cec => cec/platform/sti}/Makefile (100%)
 rename drivers/media/{platform/sti/cec => cec/platform/sti}/stih-cec.c (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/Makefile (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.c (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.h (100%)
 create mode 100644 drivers/media/cec/usb/Kconfig
 create mode 100644 drivers/media/cec/usb/Makefile
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Kconfig (91%)
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Makefile (100%)
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/pulse8-cec.c (100%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Kconfig (92%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Makefile (100%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/rainshadow-cec.c (100%)

-- 
2.25.2


