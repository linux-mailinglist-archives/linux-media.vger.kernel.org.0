Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366721F1FFC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 21:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgFHTeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 15:34:15 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:53567 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726506AbgFHTeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 15:34:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iNX6jTdrTCKzeiNXAjnzTX; Mon, 08 Jun 2020 21:34:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591644852; bh=5iRji4Zf7koD7J9KXKq7rgxmgZbega3V8cX+6hwdqT0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EuyO0HpqT8S3vejGALdf8K4Niiet+Icw4ZQBW+McVUMxxD0S5C1u4YqUm6iuaIX8D
         yi9usFAwx6Ar7wXIUL2x7+0JWIc7/EyUKIk6nGv3PZ1GEFbf2cYUmWsam7QYybSEoj
         +mtrUsZwKydctPSkliQxRW5veWTsaZSUAuBLFAnI3sY3IPBJo5TGrVHmKXY3lpdRd5
         mBuiufCEt1ggDqqA+SeGOCjVaXQEctJgWxovMw7TyP1DBnwYNQ2iG6qrF6h8EHjYHc
         g9NCHSaq4nWlCr9t5Ic/Q3smhJSksXS5icypdZW/GFmRgPPFIdo5zEgmw03/kx8o9p
         cd4YyfBx7GojQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Various fixes
Message-ID: <04f2cd86-ddf1-dbcc-0f03-fc4b2f586ccd@xs4all.nl>
Date:   Mon, 8 Jun 2020 21:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMOk9Z8+dpTpETmaRHNx42LqlOk4ZQhwkpkoX9l1ewxNSYWG/UFgvtLvN3GfJHi6tUd/5IMZB5sk6/HBatQJyB6T3jlLAW7JNm33tMpHqt42gBXmQ7vF
 V7yemSqdXf2Uxtq2cApNGbb0B2+wiSOBR8ENAV0goj6enkBeblBhnwq0LYeVyPx6rdOWMBrmoz9Xr02Kfq0Vqha48I+2frUV+7o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes, mostly a lot of PM imbalance fixes.

Regards,

	Hans

The following changes since commit 938b29db3aa9c293c7c1366b16e55e308f1a1ddd:

  media: Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 15:47:02 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9b

for you to fetch changes up to bf8989564f8070187bb372ef9569b171758a7a08:

  doc-rst: Fix typos in packed Bayer raw14 pixel formats diagram (2020-06-08 15:50:33 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (1):
      media: gspca: remove redundant assignment to variable retval

Dafna Hirschfeld (3):
      media: staging: rkisp1 stats: set a measure flag with '|=' instead of '='
      media: staging: rkisp1: stats: don't set stats flags in rkisp1_stats_send_measurement
      media: staging: rkisp1: fix dev param for dev_* debugs

Dinghao Liu (10):
      media: staging: tegra-vde: fix runtime pm imbalance on error
      media: s5k6a3: Fix runtime PM imbalance on error
      media: fimc-capture: Fix runtime PM imbalance on error
      media: coda: Fix runtime PM imbalance on error
      media: camss: csid: Fix runtime PM imbalance in csid_set_power
      media: camss: ispif: Fix runtime PM imbalance on error
      media: camss: vfe: Fix runtime PM imbalance on error
      media: exynos4-is: Fix runtime PM imbalance in isp_video_open
      media: exynos4-is: Fix runtime PM imbalance in fimc_is_probe
      media: vpif: Fix runtime PM imbalance in vpif_probe

Niklas Söderlund (1):
      doc-rst: Fix typos in packed Bayer raw14 pixel formats diagram

 Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst | 28 ++++++++++++++--------------
 drivers/media/i2c/s5k6a3.c                                |  2 +-
 drivers/media/platform/coda/coda-common.c                 |  5 ++---
 drivers/media/platform/davinci/vpif.c                     |  1 +
 drivers/media/platform/exynos4-is/fimc-capture.c          |  4 +++-
 drivers/media/platform/exynos4-is/fimc-is.c               |  1 +
 drivers/media/platform/exynos4-is/fimc-isp-video.c        |  1 +
 drivers/media/platform/qcom/camss/camss-csid.c            |  4 +++-
 drivers/media/platform/qcom/camss/camss-ispif.c           |  4 +++-
 drivers/media/platform/qcom/camss/camss-vfe.c             | 10 ++++------
 drivers/media/usb/gspca/jl2005bcd.c                       |  2 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c                 |  2 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c                 | 17 ++++++++++-------
 drivers/staging/media/rkisp1/rkisp1-params.c              |  2 +-
 drivers/staging/media/rkisp1/rkisp1-resizer.c             |  2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c               | 15 ++++-----------
 drivers/staging/media/tegra-vde/vde.c                     |  4 +---
 17 files changed, 52 insertions(+), 52 deletions(-)
