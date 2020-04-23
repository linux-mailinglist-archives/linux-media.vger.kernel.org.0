Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C401B5660
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 09:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgDWHsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 03:48:20 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59635 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726271AbgDWHsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 03:48:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RWahjKdw87xncRWaljPcej; Thu, 23 Apr 2020 09:48:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587628096; bh=lJ9loEmVaJryUiVmPLNo9go2q+BR27ddnJpMegvNhPw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rPlAzvHYxfTDXr8aJtmoN4++BOKth5dNDNcSepvFoJT7P7WCOYzzwnHy4TOSHZe6S
         7M2KN8kdpM6BukUl+UG7o8I1zMXlJJ02sCYwkjEai36m/CH89gdApuOz5JLxTq5EAz
         wFbfX234WeCAnqBYj6TX+ZyYzSFoKYg2vv0zpGDC/rZ1jcxQvZZmiDldoRQeGIj9Cy
         OqJwPWDWtjrtQoAtrRs7iP5lKi1skasCMeAfZmOefMAydY4Tb39VlV14vmByJUUYY4
         LXubK5zsBb5sfzdtqje206JABOfOzo+m5hx2Crs8fnQB/GJfvgwJkGCGvWhXXxcO09
         gSVMCkGxDBr3A==
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
Date:   Thu, 23 Apr 2020 09:48:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBrqqqyGyVRnDMGKreG0gYg22SyVz4yFDJM/l05Yhqmq4BQCdIaJ4DuxIQosu4gWlSjxs/MSCdBjvgXZu3W/LAAUpVk9hbTWPilQrU08m1zbkoKfwi3f
 IeI5VvCQ4yT9S2S93z9cpy80I6a77P8ny8m/ETG6EDu8B+kD1AwsRZfL/2w/Cyq3J4O4/y2vVNxVwkc0qVapTgjSAl8hZSriuL9sgkUrIUBQ6Mrgji4ae0Ow
 8tiQQiScGT7/SFoLT9fd4PgY6msv9uEWYUwz0R5kmizB1B+Rg5vUx7rj8XUZ+CrBbv2b25xdwN0pEksib83f92vtLpidRoj0oXFjqbSEbanvcUuFdHkWpYYu
 kJx9rWU6ZZdK2Qx8id5pQRK3WAAin3PZxGtn1Q6UWMJGZkDRqGm102J2zTbpuqD6VqR2HwuRd3aoomLeBCm4WEWsItddDwFjMiqAMcIrKW6oPEjFCY3cxtaA
 VXIVmba0haiNpsRiLFhh0SsUy9pci3J1/PowZ8iTZJdXJDLEMYdwrQhHX5oeFf34vJdlM7Ns+aLX+SoHX4SeN9Jj9jc07fwMcUhC+tCjj1go2vwHteqZc6pm
 YmE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 08:18, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
> 
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig          |    2 +
>  drivers/staging/media/Makefile         |    1 +
>  drivers/staging/media/tegra/Kconfig    |   13 +
>  drivers/staging/media/tegra/Makefile   |    8 +
>  drivers/staging/media/tegra/TODO       |   10 +
>  drivers/staging/media/tegra/common.h   |  262 ++++++++
>  drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>  drivers/staging/media/tegra/csi.h      |  149 +++++
>  drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>  drivers/staging/media/tegra/vi.c       | 1132 ++++++++++++++++++++++++++++++++
>  drivers/staging/media/tegra/vi.h       |   83 +++
>  drivers/staging/media/tegra/video.c    |  153 +++++
>  drivers/staging/media/tegra/video.h    |   34 +
>  14 files changed, 3352 insertions(+)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/common.h
>  create mode 100644 drivers/staging/media/tegra/csi.c
>  create mode 100644 drivers/staging/media/tegra/csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>  create mode 100644 drivers/staging/media/tegra/vi.c
>  create mode 100644 drivers/staging/media/tegra/vi.h
>  create mode 100644 drivers/staging/media/tegra/video.c
>  create mode 100644 drivers/staging/media/tegra/video.h

With 'make menuconfig' I get this:

scripts/kconfig/mconf  Kconfig

WARNING: unmet direct dependencies detected for TEGRA_HOST1X
  Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM && COMPILE_TEST [=y])
  Selected by [y]:
  - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])

This is an x86_64 build with COMPILE_TEST set. I can provide my full .config if you need it.

CONFIG_TEGRA_HOST1X=y
CONFIG_VIDEO_TEGRA=y

Regards,

	Hans
