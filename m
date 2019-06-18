Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 693194A677
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbfFRQQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:16:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39929 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729496AbfFRQQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:16:31 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so141250ljh.6;
        Tue, 18 Jun 2019 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d8ND7EMqaMTRopWlb9o22BJGzZDsnY6w/hHhefd0ijU=;
        b=ct1sAJ72OfB3a7/VItKwWaSDmJQErSldkaPh8Hg2zwhb8dkdhBO5l07HrG1HPzr2Cq
         BX8/hcHEi2jUxzEJODMJlesBskFGwyntCcRmWSczwh6xGsPgzAyCUFU3T1ebFaJ3u0vo
         r3LmRCsAr1Aw+S8iXpRppPZo+pFNLxa3QsfZDFri5Sf54zrxIgLFWGpfPbMW4XQ5tnfZ
         RdKXQc2j3dX3p/G17K0qbRg/so9Uh9IoY80w0UjAK+pOTTKvJPSq5GwqSzDWZfPbC2Dl
         2QgF8Oxi9A6EjHtGuiAIiULB+VTVINjT3tHmjF5xCi5PZ3vvGPp5+Gsd34vHF1EONBZS
         4HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d8ND7EMqaMTRopWlb9o22BJGzZDsnY6w/hHhefd0ijU=;
        b=Xa3dA/aDQAldD4IVxuZMwAO/uOiLNXeeNQ+1OEnjzx/WHwX8AifLPMmoDgoa47SePL
         mSK0XeCFexb9S1FCTIE/eE0HrBGC16BMBmW022/YrPleKJvhx/sXF3yhZNQRY8mxPO5H
         vmhaw3xD7UKIHklwHIxiqPHFexwXDr1hBgYv8E4Y6J87AJuAPBQXTNIzclOMfOL7pN9E
         W6wbXuJ/m0MBtWw7iF96phOOxdm/ikslevF02GyDsSbl8Jlx0NWoUZyi2dG7ptbNGDZq
         gDvU6JbPJSYMBEhEwWfcqnuTvz7oOU+sSHDMqkPLJLgU9f4hGYueHKi7hh+Yexv3UXXD
         t4yw==
X-Gm-Message-State: APjAAAWAULMWbmK4wQO3SET6ejdv6VHLHvCejw3NgEzAA2I6EbVglzHa
        RP88KI94YWAt07Sx3nhh+l+Jrdza
X-Google-Smtp-Source: APXvYqzQZqoqlL5858/34W8b9dFe+28g3zDpsZLYQzftoSykaQpl1uH4YqhI48VZjTWooCY0JCYU+A==
X-Received: by 2002:a2e:868e:: with SMTP id l14mr22398515lji.16.1560874588806;
        Tue, 18 Jun 2019 09:16:28 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id v15sm2273295lfd.53.2019.06.18.09.16.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:16:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] NVIDIA Tegra Video Decoder driver improvements
Date:   Tue, 18 Jun 2019 19:14:51 +0300
Message-Id: <20190618161458.20499-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series cleans up some of minor shortcomings that are caused by
checkpatch recommendations that are not very applicable for the driver.
Then IOMMU support is added to the driver and now it can handle sparse
memory buffers that GPU hands to VDE in a default kernel configuration
on Tegra30+.

Changelog:

v2: - Fixed use-after-free bug and uninitialized-variable warning that
      were reported by smatch and pointed out by Hans Verkuil in the
      review comment to v1.

    - Fixed build failure when CONFIG_ARM_DMA_USE_IOMMU=y and tested this
      case properly (multi-platform kernel config).

    - Made some extra minor changes, prettifying code a tad more.

Dmitry Osipenko (4):
  staging: media: tegra-vde: Remove BIT() macro from UAPI header
  staging: media: tegra-vde: Manually pack UAPI structures
  staging: media: tegra-vde: Add IOMMU support
  staging: media: tegra-vde: Defer dmabuf's unmapping

 drivers/staging/media/tegra-vde/Kconfig       |   1 +
 drivers/staging/media/tegra-vde/Makefile      |   1 +
 .../staging/media/tegra-vde/dmabuf-cache.c    | 226 ++++++++++++++++++
 drivers/staging/media/tegra-vde/iommu.c       | 149 ++++++++++++
 drivers/staging/media/tegra-vde/trace.h       |   2 +
 drivers/staging/media/tegra-vde/uapi.h        |  48 ++--
 .../media/tegra-vde/{tegra-vde.c => vde.c}    | 212 ++++++----------
 drivers/staging/media/tegra-vde/vde.h         | 105 ++++++++
 8 files changed, 581 insertions(+), 163 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
 create mode 100644 drivers/staging/media/tegra-vde/iommu.c
 rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (88%)
 create mode 100644 drivers/staging/media/tegra-vde/vde.h

-- 
2.22.0

