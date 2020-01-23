Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BFF146C4F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 16:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgAWPII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 10:08:08 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:41293 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbgAWPII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 10:08:08 -0500
Received: from [IPv6:2001:983:e9a7:1:1bd:458:b834:7f13]
 ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ue5UiN9E0pLtbue5WiR9XJ; Thu, 23 Jan 2020 16:08:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579792086; bh=GJSns9zp77+a9uH0/gReZ0+e2X6ef1pptIQYKOf0mII=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XkrZvWV1seDFq/S9WPurmvkg5MLy+6YPYLgZLerEgt1dYnntX12b/Fm6ZAF22mE1y
         +a+TdCO8kOVzpLSASkt6skSpCZhJ3BbADiKi2sovHuRLPTdO9CUKRAj7k/rdNUIcOd
         0uN0C3I7RSbq/fzio1kQ4oCRi1yro0QvFVhSg1OVtwETVUzwz/OHXX8/yKnBt167CG
         ms2z+eZOt7gizl5cPrgBFwDcDXxU6gdy4GQTGA2uOok4objLnztADoUmU8g2O+KtO0
         wrx0gDaJMi9SbH4wUV7+1BvXO6LkqokTcuXeH0Ca+PTF/la2uvB9X76gAELR029TUn
         WD7z3RYeDjzoQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR v5.7] Various fixes
Message-ID: <ddaec9b5-acad-6131-e8d1-60abfaef5af7@xs4all.nl>
Date:   Thu, 23 Jan 2020 16:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAm5QKHoSFPvLhBHo5x8d64i33x5hnvRbbzYUVPH45kDxgkl1HHNWabQ7I9ZcrTu/zqL+EEhr2Ky5braVM68hYIHFzwyVWyVkx4B4izTSgibfbEa4P62
 fprZfSFr+Xt7YqDx825uXUD5BC3OwEbuzKLG1e8HqAwKa7Flw60zmFGUcjNtOpB5FLEfmPmO/crOPcgjiEmzmLFy7v6rDnRFMleIZIA+wO62bH1pIduaROKu
 IVbHUo3Sh6cHk7YT4TouQjDWnczoCmLBNE5ykDMKu2k=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supersedes https://patchwork.linuxtv.org/patch/61151/.

Changes since 1:

Dropped since already merged:
	media: hantro: fix post-processing NULL pointer dereference
	media: platform: VIDEO_MEDIATEK_JPEG can also depend on MTK_IOMMU

Dropped since a new patch was posted:
      media: staging: rkisp1: Fix undefined reference to `phy_mipi_dphy_get_default_config' in rkisp1_mipi_csi2_start

Regards,

	Hans

The following changes since commit 29951078bb5be1f2105c2841a4ac119f1b81531b:

  media: platform: VIDEO_MEDIATEK_JPEG can also depend on MTK_IOMMU (2020-01-23 13:18:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6l

for you to fetch changes up to f796f53ef6216fcfcc5d5f216e2bcd81ce930a64:

  media: allegro: add missed checks in allegro_open() (2020-01-23 13:21:01 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Chuhong Yuan (2):
      media: exynos4-is: add missed clk_disable_unprepare in remove
      media: allegro: add missed checks in allegro_open()

 drivers/media/platform/exynos4-is/fimc-lite.c    |  3 +++
 drivers/staging/media/allegro-dvt/allegro-core.c | 24 ++++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)
