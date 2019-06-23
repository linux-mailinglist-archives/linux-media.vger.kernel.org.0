Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E28704FD30
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2019 19:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfFWRIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jun 2019 13:08:05 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40265 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfFWRIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jun 2019 13:08:04 -0400
Received: by mail-qt1-f196.google.com with SMTP id a15so12104695qtn.7;
        Sun, 23 Jun 2019 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6kjF5fXn7CUbLQsdln+pNA94ruY+IQSwhFY01H/Qs0=;
        b=PgdexjanEdOhiC1e7XrrB0kACIXlVM4YPZNLusSVxV8F7FdKSyoaeGZUuzGLwol3hv
         9jSCHyPbTgtJLupSe12qTtZLFZmYVv7WHAjSBbJwa9veh+3hSA4lOStXc1Vb6jTH6YE1
         8IM5XrdHWpbbFJqawEjt2uFSCHnBbJdM0bcsPyDxYrWhnwIIPdtMDW5DgCLV1bkovRw/
         ykU5WzMuEx+qSFwYP4ZLOqIAnYKQahoU2BxDPUot1kR+kBBlCe6c8vbLEJZlzqnUWBgC
         CzHa/NvuP+R9HF55wfCXXs/w5TCh8fCSk3TindbHsnkNEVMPKeC0aFoIlBeVr53EdvZi
         WPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6kjF5fXn7CUbLQsdln+pNA94ruY+IQSwhFY01H/Qs0=;
        b=DM6Gov4qHAQnKjnfqxni+qnaduHtk+8aqg+LdBV3nkhY2Y3yR+bbVtO2/yXmsEsgD3
         zJs+9BOf8xayQ0jXlM4L07G4W20wfXMG569l3NYMI2bjg0A+mw7BjjEhCErB29ra93ih
         FghVphyaWqrcK49V7+qSWrO09SUMl3dX7TAyzPHmus6dZXOSkrMU+I3C2nRvFL+1+6dx
         iOmgfcO/l+P3V2Il00zvwxpik/rGy2XM1Nq2AGLMQfemL2w0FhkFUMj3T9ihlC4WeDee
         VSEmZF3BQQuMrxjZ/pa8ZZyUbhJ1eaUCsYk7mw2WwZSsmXF19JUr6XvGrjRCaP2U0ihA
         ZZVA==
X-Gm-Message-State: APjAAAUAo1fE/DEKPTlQl3G0RjHz6NnxPM4f4glP/F1S2n+cLJ28hpQK
        YJ9lLgsbx/mdsQD3AJsYYgU=
X-Google-Smtp-Source: APXvYqxzaFsjcPSti6Fji5wNYEaAxx/IvO8JkiRdoec5MecyPJfs37elqCcHrmJjE1ZnPjcyqooRuw==
X-Received: by 2002:ac8:2e14:: with SMTP id r20mr68598966qta.241.1561309683700;
        Sun, 23 Jun 2019 10:08:03 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id o54sm5790756qtb.63.2019.06.23.10.08.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 10:08:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] NVIDIA Tegra Video Decoder driver improvements
Date:   Sun, 23 Jun 2019 20:07:23 +0300
Message-Id: <20190623170730.5095-1-digetx@gmail.com>
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

v3: - Fixed memory leak on driver's module reload. For some reason I
      erroneously assumed that IOVA reservations are released on IOVA
      destruction themselves.

    - Corrected PFN's for the last-page's IOVA reservation. We want to
      reserve the last page, but a page before the last was reserved.

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
 drivers/staging/media/tegra-vde/iommu.c       | 157 ++++++++++++
 drivers/staging/media/tegra-vde/trace.h       |   2 +
 drivers/staging/media/tegra-vde/uapi.h        |  48 ++--
 .../media/tegra-vde/{tegra-vde.c => vde.c}    | 212 ++++++----------
 drivers/staging/media/tegra-vde/vde.h         | 107 +++++++++
 8 files changed, 591 insertions(+), 163 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
 create mode 100644 drivers/staging/media/tegra-vde/iommu.c
 rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (88%)
 create mode 100644 drivers/staging/media/tegra-vde/vde.h

-- 
2.22.0

