Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFBBF1390F2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 13:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgAMMRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 07:17:40 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37695 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726180AbgAMMRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 07:17:40 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qyf1i85lupLtbqyf4iabGh; Mon, 13 Jan 2020 13:17:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578917858; bh=GBRB5MjmPOz/z8EYd10MwtrtMcIrReG2TeHcJyhsKuQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CdDj4K3uUYw5eWKTmdyQb+xZ32xC0hg2xm6yzbM3hi2FbAe28JXy0axUSama09Okd
         HA86lzF8GtJ42mauX8Ul/bqqiolda8MsVbCXSilMMECKANRjpCloepCXMgvJh6CgLX
         L3l54mqkTHaUu5uTK3BEwSADzQ+0ZEYK9gSZu6q1qwS7SiS+eZHQDGCL+eGbZpTU9z
         upWhRQjxHvMazRROjDGDotrXphqY6s4vqGOVICUTkFvBWgjvA8viFRJ0hq0f7nHCEq
         AohDOutWUtrpZfl39ieCFAUmhKmE1ltSPp5rMbEQiD6qL/I2fCzv+lIP1IwcCZMRH7
         L7KoKl2eImsLA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Various fixes
Message-ID: <da873712-6eda-e564-6f3b-efb09d6a64f5@xs4all.nl>
Date:   Mon, 13 Jan 2020 13:17:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIsNIlSVBZ97kdF3/YrhxLapaps0ygabZ/+O6X+7cbFv9CBCy72u0yze7yoX8KqI2K6cBLqi97xhjOaaiAiHj7b2lYf+O8aOgIb1q7eI+S96G9oAHOW/
 hauVtnsVFve/kiuu8IUfvXqlaTdanxK3ORTaiFwxAlXlBifZTWD6zPEvAPYslqsjlraahyi7KsJ93A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:

  media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6l

for you to fetch changes up to fb5696fbfd3cde5a9a934884925bb454b749a26d:

  media: allegro: add missed checks in allegro_open() (2020-01-13 13:06:45 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Chuhong Yuan (2):
      media: exynos4-is: add missed clk_disable_unprepare in remove
      media: allegro: add missed checks in allegro_open()

Jonas Karlman (1):
      media: hantro: fix post-processing NULL pointer dereference

Maoguang Meng (1):
      media: platform: VIDEO_MEDIATEK_JPEG can also depend on MTK_IOMMU

Zhang Xiaoxu (1):
      media: staging: rkisp1: Fix undefined reference to `phy_mipi_dphy_get_default_config' in rkisp1_mipi_csi2_start

 drivers/media/platform/Kconfig                   |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c    |  3 +++
 drivers/staging/media/allegro-dvt/allegro-core.c | 24 ++++++++++++++++++++----
 drivers/staging/media/hantro/hantro_postproc.c   |  6 ++++++
 drivers/staging/media/rkisp1/Kconfig             |  1 +
 5 files changed, 31 insertions(+), 5 deletions(-)
