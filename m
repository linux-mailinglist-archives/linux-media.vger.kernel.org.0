Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975761BB7D4
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 09:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgD1HiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 03:38:14 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37375 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726253AbgD1HiO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 03:38:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TKohjjwJplKa1TKoljkB2C; Tue, 28 Apr 2020 09:38:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588059492; bh=+nAgS30c07wDN6lSEWd2/CCFrQtC4lXyHeV3iYFeXr8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mBrX3lU7q134xiasmBAak+ZWfmaAQQrJetv44aekDE+ksxsm8RXWBLJ1Use1JCl1I
         BNuw0PeUOY9yC8G8KpXKYvjaoWL6EF9bWY6mcY4gClBI4AZMAkIpBHVztc2QZ55FXQ
         hqWMlu9XFOpTiCm/THBGdcluPNCw8z9/ulLHdPO3zBmDxNx8GuKTMOHsIZQRy3i1Qr
         DG9NwevQ5K+bk1iU3tWo5kkmQN2NzghndxPOh2sB9lqm2fGjd0ToxEl+08T4tsqVBa
         XWuWsr42mhUyZOmHB5fjFR+g0jkbKbq+rX8zKv4jTYPVqn5w1yn3PuL7W/+rfXm1de
         zxwD9Uv85jWAA==
Subject: Re: [RFC PATCH v1 0/5] media: tegra: Tegra video driver follow-up
 patches
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com
Cc:     digetx@gmail.com, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5f065fc5-0f45-6b9e-068c-28d0a2e4684e@xs4all.nl>
Date:   Tue, 28 Apr 2020 09:38:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNnYN4mXESrKOpzlixmWEfZewJ9vePxyXiaZ6eW8U8sCyiqmmBh4L32L7ha5AdhsZGvLriTlcjavNogmiOF5LjXDr2At4PGJsV+wyFJ6oVTyHgLXXlE3
 lFXrY3m1G3Ek/L39otmz3XNqNPgLiN+8UWLeeJ9oQFu0gp7oUHuR05FWFDVbvG1G6rSV8v+6aR5PfiBZQNFim6rs8eXkhVKMdkuC5KUWY+SkEBrYaLJmjkP1
 AwEMi5Gn4fQpYifQsawYhLphF3CH1o3ueY5AGW5VEWUkIm0mA4aoMomZjhgiI7S5tdouZEwVreO8DvynFMnPcdMI6NhUaDIqwPLypDaULPyWhPfWqGpOAUrC
 AiwCUkqDCfAwoFVKTHgrToY5yrAnAF9NoKNV8TX8098zQMQItqIp3mOEAqNlWJ44PlYRfjLJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/04/2020 06:20, Sowjanya Komatineni wrote:
> This is a fllow-up to some last feedback received for Tegra VI driver RFC
> v10 patches.
> https://patchwork.linuxtv.org/cover/63334/
> 
> 
> Sowjanya Komatineni (5):
>   MAINTAINERS: Rename Tegra Video driver path
>   media: tegra: Rename driver path to tegra-video
>   media: tegra-video: Move PM runtime handle to streaming
>   media: tegra-video: Rearrange SoC specific to Tegra210 and cleanup
>     files
>   media: tegra-video: Remove module macros for vi and csi driver
> 
>  MAINTAINERS                                  |    2 +-
>  drivers/staging/media/Kconfig                |    2 +-
>  drivers/staging/media/Makefile               |    2 +-
>  drivers/staging/media/tegra-video/Kconfig    |   12 +
>  drivers/staging/media/tegra-video/Makefile   |    8 +
>  drivers/staging/media/tegra-video/TODO       |   10 +
>  drivers/staging/media/tegra-video/csi.c      |  536 ++++++++++++
>  drivers/staging/media/tegra-video/csi.h      |  146 ++++
>  drivers/staging/media/tegra-video/tegra210.c | 1080 ++++++++++++++++++++++++
>  drivers/staging/media/tegra-video/vi.c       | 1082 +++++++++++++++++++++++++
>  drivers/staging/media/tegra-video/vi.h       |  258 ++++++
>  drivers/staging/media/tegra-video/video.c    |  155 ++++
>  drivers/staging/media/tegra-video/video.h    |   29 +
>  drivers/staging/media/tegra/Kconfig          |   12 -
>  drivers/staging/media/tegra/Makefile         |    8 -
>  drivers/staging/media/tegra/TODO             |   10 -
>  drivers/staging/media/tegra/common.h         |  259 ------
>  drivers/staging/media/tegra/csi.c            |  604 --------------
>  drivers/staging/media/tegra/csi.h            |  144 ----
>  drivers/staging/media/tegra/tegra210.c       |  708 ----------------
>  drivers/staging/media/tegra/tegra210.h       |  190 -----
>  drivers/staging/media/tegra/vi.c             | 1127 --------------------------
>  drivers/staging/media/tegra/vi.h             |   72 --
>  drivers/staging/media/tegra/video.c          |  153 ----
>  drivers/staging/media/tegra/video.h          |   29 -
>  25 files changed, 3319 insertions(+), 3319 deletions(-)

I thought that the follow-up series was just a rename of a directory
and perhaps one or two smaller changes, but this is too much change.
I prefer to have a v11 instead with all these changes incorporated.

Sorry about that,

	Hans

>  create mode 100644 drivers/staging/media/tegra-video/Kconfig
>  create mode 100644 drivers/staging/media/tegra-video/Makefile
>  create mode 100644 drivers/staging/media/tegra-video/TODO
>  create mode 100644 drivers/staging/media/tegra-video/csi.c
>  create mode 100644 drivers/staging/media/tegra-video/csi.h
>  create mode 100644 drivers/staging/media/tegra-video/tegra210.c
>  create mode 100644 drivers/staging/media/tegra-video/vi.c
>  create mode 100644 drivers/staging/media/tegra-video/vi.h
>  create mode 100644 drivers/staging/media/tegra-video/video.c
>  create mode 100644 drivers/staging/media/tegra-video/video.h
>  delete mode 100644 drivers/staging/media/tegra/Kconfig
>  delete mode 100644 drivers/staging/media/tegra/Makefile
>  delete mode 100644 drivers/staging/media/tegra/TODO
>  delete mode 100644 drivers/staging/media/tegra/common.h
>  delete mode 100644 drivers/staging/media/tegra/csi.c
>  delete mode 100644 drivers/staging/media/tegra/csi.h
>  delete mode 100644 drivers/staging/media/tegra/tegra210.c
>  delete mode 100644 drivers/staging/media/tegra/tegra210.h
>  delete mode 100644 drivers/staging/media/tegra/vi.c
>  delete mode 100644 drivers/staging/media/tegra/vi.h
>  delete mode 100644 drivers/staging/media/tegra/video.c
>  delete mode 100644 drivers/staging/media/tegra/video.h
> 

