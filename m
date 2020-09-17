Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4B726DAC3
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 13:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgIQLvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 07:51:46 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44789 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726874AbgIQLvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 07:51:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IsRokMGlKPTBMIsRpkls1Y; Thu, 17 Sep 2020 13:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600343493; bh=/O4gS7MSKU8PFxophiWRKJaaVyaXCETFhD6SSQxwQD0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CuJU/d6fbPMtsuKyKAjqfT0MyZB4FSe8DdVoFpUKvJm+KYd3SzecDkcyk+LQucYJ5
         Xu4N5u86tenuLaR8PRBcOdlS7Z6yUE7J3iQoB3MEqGvWUn4SZcY6qxSZJswqf0oM5p
         wOy/mWyJQ7GDjybcjtuuXTiI+DY6I5MIDhvafzlOnuRMWR0Wubk/kgThhnroH5Mu4e
         q+Jkuu5KMnyVuyfTUrJ0h0VepdEGG9xQ/iLJc8BaICEoQyO0HvFBTbk+y66WHSNFeA
         XDey+lsfuGI/DmgWSFlw4hnZQUHt/Y77RP7Qvp7Mbt4uRkOdI4GBzcLsQO6SYRz6HR
         IVV++zFOunyxA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] PM ref count fixes
Message-ID: <c25be17a-da29-5a82-468a-c6e80c9229ca@xs4all.nl>
Date:   Thu, 17 Sep 2020 13:51:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNUtdEuodRb1+pQSE6MeOONWIhrHLtR+CHmWAl6rd3pTgqEtf97/zK6hGFTP8CvqX+zaxRD9p6A/izD7Ldg3wbnXTNDaV3j1a4r8XFZhlLwojRTwOC+W
 SlH+KK1ALr1VPoQODttqgMHrNNqDMISqhrfpqUrLKvwasufaMzVLbErCmcL2hHwGnHYUc/ojAbn1UonrBzYGa3n66toO7osQTtjVM9y1B7j5uamo/7QrsvPi
 R/T4139DWwk1W4bHK5x1iSJHCFnTQwaj3NJ+PsbZzzE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I've decided to just take all these fixes. It's kind of ugly the way
pm_runtime_get_sync works (leaving a refcount on error), but there does
not appear to be any interest to fix this, and these are still bugs that
need fixing.

Regards,

	Hans

The following changes since commit 741043b02c2e00c8fea1a0f6f8ce43c6326cd9e8:

  media: vidtv: don't initialize cnr2qual var (2020-09-14 16:10:08 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10d

for you to fetch changes up to f2ddc25a73625596097e0984d8e825885ea62294:

  media: st-delta: Fix reference count leak in delta_run_work (2020-09-17 13:27:45 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aditya Pakki (1):
      media: st-delta: Fix reference count leak in delta_run_work

Dinghao Liu (5):
      media: bdisp: Fix runtime PM imbalance on error
      media: platform: sti: hva: Fix runtime PM imbalance on error
      media: platform: s3c-camif: Fix runtime PM imbalance on error
      media: coda: Fix runtime PM imbalance in coda_probe
      media: vsp1: Fix runtime PM imbalance on error

Qiushi Wu (12):
      media: rcar-vin: Fix a reference count leak.
      media: rcar-vin: Fix a reference count leak.
      media: rockchip/rga: Fix a reference count leak.
      media: platform: fcp: Fix a reference count leak.
      media: camss: Fix a reference count leak.
      media: s5p-mfc: Fix a reference count leak
      media: stm32-dcmi: Fix a reference count leak
      media: ti-vpe: Fix a missing check and reference count leak
      media: exynos4-is: Fix a reference count leak
      media: exynos4-is: Fix a reference count leak due to pm_runtime_get_sync
      media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
      media: sti: Fix reference count leaks

 drivers/media/platform/coda/coda-common.c        |  2 ++
 drivers/media/platform/exynos4-is/fimc-isp.c     |  4 +++-
 drivers/media/platform/exynos4-is/fimc-lite.c    |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c    |  4 +++-
 drivers/media/platform/exynos4-is/mipi-csis.c    |  4 +++-
 drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
 drivers/media/platform/rcar-fcp.c                |  4 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c       |  4 +++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c      |  4 +++-
 drivers/media/platform/rockchip/rga/rga-buf.c    |  1 +
 drivers/media/platform/s3c-camif/camif-core.c    |  5 ++---
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c      |  4 +++-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c    |  3 +--
 drivers/media/platform/sti/delta/delta-v4l2.c    |  4 +++-
 drivers/media/platform/sti/hva/hva-hw.c          |  4 +++-
 drivers/media/platform/stm32/stm32-dcmi.c        |  4 +---
 drivers/media/platform/ti-vpe/vpe.c              |  2 ++
 drivers/media/platform/vsp1/vsp1_drv.c           | 11 ++++++++---
 18 files changed, 48 insertions(+), 22 deletions(-)
