Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E7D1BB516
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 06:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgD1EVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 00:21:47 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3105 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgD1EVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 00:21:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea7af190000>; Mon, 27 Apr 2020 21:20:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Apr 2020 21:21:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Apr 2020 21:21:47 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 04:21:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Apr 2020 04:21:46 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea7af5a0003>; Mon, 27 Apr 2020 21:21:46 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <digetx@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 0/5] media: tegra: Tegra video driver follow-up patches
Date:   Mon, 27 Apr 2020 21:20:45 -0700
Message-ID: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588047641; bh=GSaMPCKjtNmN1Ta1JOSfTlnh71rhEs0nSfWQEPuSKxE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=cfpTSu7BVIMEqPMmEbhrIo3aj3uQpeE6xd23i88x4YANtXUYEhEAvkDTvZEb+xQsA
         SvVej6EzYWbWpo8lMCxXU6LDheAswgMHP5t+W1hwhNKdklCTo6pSPo4irLw6tRlwvh
         Y+lcBPy7Gg1Ul+lM/GxE287Ju6I/gGDndeDl+3INyTIs1EitgkNP3S0gzxW0U+wpby
         L4v7NGKKGmcv/yJN+378Klf8q/91Ya4LCyuyhNYoJsabjR/vasc9nkqJIUD0NQnst7
         LEZGO9IoXWQkAl0H56Vubh1tntcYLrK15C51pcabWyE0s2AVvVyeX9jPuOFWTaV0W5
         zUct0grgYXWZA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a fllow-up to some last feedback received for Tegra VI driver RFC
v10 patches.
https://patchwork.linuxtv.org/cover/63334/


Sowjanya Komatineni (5):
  MAINTAINERS: Rename Tegra Video driver path
  media: tegra: Rename driver path to tegra-video
  media: tegra-video: Move PM runtime handle to streaming
  media: tegra-video: Rearrange SoC specific to Tegra210 and cleanup
    files
  media: tegra-video: Remove module macros for vi and csi driver

 MAINTAINERS                                  |    2 +-
 drivers/staging/media/Kconfig                |    2 +-
 drivers/staging/media/Makefile               |    2 +-
 drivers/staging/media/tegra-video/Kconfig    |   12 +
 drivers/staging/media/tegra-video/Makefile   |    8 +
 drivers/staging/media/tegra-video/TODO       |   10 +
 drivers/staging/media/tegra-video/csi.c      |  536 ++++++++++++
 drivers/staging/media/tegra-video/csi.h      |  146 ++++
 drivers/staging/media/tegra-video/tegra210.c | 1080 ++++++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c       | 1082 +++++++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h       |  258 ++++++
 drivers/staging/media/tegra-video/video.c    |  155 ++++
 drivers/staging/media/tegra-video/video.h    |   29 +
 drivers/staging/media/tegra/Kconfig          |   12 -
 drivers/staging/media/tegra/Makefile         |    8 -
 drivers/staging/media/tegra/TODO             |   10 -
 drivers/staging/media/tegra/common.h         |  259 ------
 drivers/staging/media/tegra/csi.c            |  604 --------------
 drivers/staging/media/tegra/csi.h            |  144 ----
 drivers/staging/media/tegra/tegra210.c       |  708 ----------------
 drivers/staging/media/tegra/tegra210.h       |  190 -----
 drivers/staging/media/tegra/vi.c             | 1127 --------------------------
 drivers/staging/media/tegra/vi.h             |   72 --
 drivers/staging/media/tegra/video.c          |  153 ----
 drivers/staging/media/tegra/video.h          |   29 -
 25 files changed, 3319 insertions(+), 3319 deletions(-)
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h
 delete mode 100644 drivers/staging/media/tegra/Kconfig
 delete mode 100644 drivers/staging/media/tegra/Makefile
 delete mode 100644 drivers/staging/media/tegra/TODO
 delete mode 100644 drivers/staging/media/tegra/common.h
 delete mode 100644 drivers/staging/media/tegra/csi.c
 delete mode 100644 drivers/staging/media/tegra/csi.h
 delete mode 100644 drivers/staging/media/tegra/tegra210.c
 delete mode 100644 drivers/staging/media/tegra/tegra210.h
 delete mode 100644 drivers/staging/media/tegra/vi.c
 delete mode 100644 drivers/staging/media/tegra/vi.h
 delete mode 100644 drivers/staging/media/tegra/video.c
 delete mode 100644 drivers/staging/media/tegra/video.h

-- 
2.7.4

