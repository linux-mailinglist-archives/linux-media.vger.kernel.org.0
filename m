Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D7920DDE5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgF2UUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:20:36 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48759 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732968AbgF2UUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 16:20:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id poa3jwdSRxmkVpoa6jrcJI; Mon, 29 Jun 2020 09:51:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593417118; bh=n2F3aTBOa4joxWST/JEYSEL6V66wosTxhb8FoIF7TCs=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nKoZs9OhhNOZuEkadDqVEJu3v+Eqoem/dySTjo8xGlMT5sylN+ON+EK+jzm7dxD+E
         CS804EWYPKtsIaK0Qj1wg+QEIIApQNOBbTtAt+Ho4orzU6PK5WYRxFLVQs3GclVIMG
         NOwgGd11ICA125+6ZvK41uqRt2UqykF4NRQKXDRNg8v3g7tNkr0vDcqVZ0aZBz45pS
         YaIFfZi+yhSneLIpAmFUrMZN2SnXdYt2W6aMWUmyRiveZHDruAtnzPLiCwID/VKm4C
         4xIJ5OJkzNgZ+OMWVXauPED/hTvQGzoHGFZ1tnb6dkic4MXDdn46HXqHtaKQAKPRkJ
         ogFgd5Xjd7EcA==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Removal of soc-camera and dependent sensor
 drivers
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <bf6d5d12-9460-2bcc-a0d7-5553e7e18065@xs4all.nl>
Date:   Mon, 29 Jun 2020 09:51:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIAS4QfHzy+EUFTqJFYXu3HFjKuiCPy3Ij5mzH1VQ9i3x0fAk73d9e64/nUJp4Z+0yihHddFI8ZsmCIIMDBTwn1iLVBD/1DOuKLgdLBP5GXMkgdVUrn7
 szfV1U1E8CSXND/1iBTMuOiFCz7I/L8c1QnkIPf3xwL13Wpu79FD2jbM+izWODQCV+QnY9NbogWK2A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This pull request removes drivers/staging/media/soc_camera since
soc-camera has long been a deprecated driver depending on BROKEN. Also
the several sensors drivers in that same directory that depended on the
soc-camera driver (and thus on BROKEN) have been removed.

To remove the soc_camera.h header several board files that depended on
that had to be modified, specifically by removing the remaining camera
support (which wasn't functioning since 4.6/4.8 anyway). At the request
of Arnd these patches go through the media tree as well.

Any remaining CONFIG_SOC_CAMERA* entries in config files were also removed.

The first two patches just update MODULE_DESCRIPTIONs in two camera drivers
to avoid referring to SoC Camera since those drivers have been independent
of the soc-camera framework for a long time now.

Finally the last patch removes the SOC-CAMERA entry from the MAINTAINERS file.

Regards,

	Hans

The following changes since commit e30cc79cc80fd919b697a15c5000d9f57487de8e:

  media: media-request: Fix crash if memory allocation fails (2020-06-23 15:19:37 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-soc-camera

for you to fetch changes up to 041ddbe862acb03d6f33ff9f6bdf83d045f15b4d:

  MAINTAINERS: remove SOC-CAMERA entry (2020-06-29 09:40:55 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (10):
      ov9640: update MODULE_DESCRIPTION
      pxa_camera: update MODULE_DESCRIPTION
      mach-imx: mach-imx27_visstrim_m10.c: remove soc_camera dependencies
      mach-omap1: board-ams-delta.c: remove soc_camera dependencies
      mach-pxa: palmz72/pcm990: remove soc_camera dependencies
      staging/media/soc_camera: remove this driver
      soc_camera.h: remove this unused header
      arch/arm/configs: remove obsolete CONFIG_SOC_CAMERA*
      arch/sh/configs: remove obsolete CONFIG_SOC_CAMERA*
      MAINTAINERS: remove SOC-CAMERA entry

 MAINTAINERS                                      |    7 -
 arch/arm/configs/ezx_defconfig                   |    2 -
 arch/arm/configs/imote2_defconfig                |    2 -
 arch/arm/configs/imx_v4_v5_defconfig             |    1 -
 arch/arm/configs/imx_v6_v7_defconfig             |    1 -
 arch/arm/configs/pxa_defconfig                   |    3 -
 arch/arm/configs/sama5_defconfig                 |    2 -
 arch/arm/mach-imx/mach-imx27_visstrim_m10.c      |   31 -
 arch/arm/mach-omap1/board-ams-delta.c            |   32 -
 arch/arm/mach-omap1/camera.h                     |   14 -
 arch/arm/mach-omap1/devices.c                    |   43 --
 arch/arm/mach-pxa/palmz72.c                      |  112 ---
 arch/arm/mach-pxa/pcm990-baseboard.c             |  157 -----
 arch/sh/configs/ap325rxa_defconfig               |    3 -
 arch/sh/configs/ecovec24_defconfig               |    3 -
 arch/sh/configs/migor_defconfig                  |    3 -
 arch/sh/configs/se7724_defconfig                 |    2 -
 drivers/media/i2c/ov9640.c                       |    2 +-
 drivers/media/platform/pxa_camera.c              |    2 +-
 drivers/staging/media/Kconfig                    |    2 -
 drivers/staging/media/Makefile                   |    1 -
 drivers/staging/media/soc_camera/Kconfig         |   51 --
 drivers/staging/media/soc_camera/Makefile        |    7 -
 drivers/staging/media/soc_camera/TODO            |    4 -
 drivers/staging/media/soc_camera/imx074.c        |  492 -------------
 drivers/staging/media/soc_camera/mt9t031.c       |  853 -----------------------
 drivers/staging/media/soc_camera/soc-camera.rst  |  171 -----
 drivers/staging/media/soc_camera/soc_camera.c    | 2164 ----------------------------------------------------------
 drivers/staging/media/soc_camera/soc_mediabus.c  |  529 --------------
 drivers/staging/media/soc_camera/soc_mt9v022.c   | 1008 ---------------------------
 drivers/staging/media/soc_camera/soc_ov5642.c    | 1085 -----------------------------
 drivers/staging/media/soc_camera/soc_ov9740.c    |  992 ---------------------------
 include/linux/platform_data/media/omap1_camera.h |   32 -
 include/media/drv-intf/soc_mediabus.h            |  107 ---
 include/media/soc_camera.h                       |  397 -----------
 35 files changed, 2 insertions(+), 8315 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/camera.h
 delete mode 100644 drivers/staging/media/soc_camera/Kconfig
 delete mode 100644 drivers/staging/media/soc_camera/Makefile
 delete mode 100644 drivers/staging/media/soc_camera/TODO
 delete mode 100644 drivers/staging/media/soc_camera/imx074.c
 delete mode 100644 drivers/staging/media/soc_camera/mt9t031.c
 delete mode 100644 drivers/staging/media/soc_camera/soc-camera.rst
 delete mode 100644 drivers/staging/media/soc_camera/soc_camera.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_mediabus.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_mt9v022.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_ov5642.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_ov9740.c
 delete mode 100644 include/linux/platform_data/media/omap1_camera.h
 delete mode 100644 include/media/drv-intf/soc_mediabus.h
 delete mode 100644 include/media/soc_camera.h
