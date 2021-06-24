Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE88A3B2B33
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhFXJUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 05:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhFXJUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 05:20:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEA9C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 02:18:26 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n23so3459548wms.2
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=cMEBQkB/WMnbxUIi62N7f1EezBIMWFz+VlumbIv4K5w=;
        b=ToFiAC8BtAXVTJEOAVcqGcpM0e4wzH4d848yHejsUb2G7TEDLKZXCe3+7Aq53uMMgb
         bL6qdwh2QDaDa2PvzLAz8URdo2UdZ4HDi4wXKrxFhfttvY2MBPNq27NaTybnMSJnzpg7
         zdxpLCI0+B0zaTDd5kT6U5oc8Tvwryn8VtPcuyzOQbEgxM2iUO97R9l4TOvdqLoynNNK
         xFFBdgV3oY33KUJEAHojIJeXBfiKdf42AfsG/QXZLWq2lpq01jRSJJ7BeAVjnQVxrw03
         9BCsJe09BrAySyM/KFZTBHMMl/WSbRRfwp+DT6OXeQiqiKUJBbptj/I1gf4ayrHIDmkS
         x7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=cMEBQkB/WMnbxUIi62N7f1EezBIMWFz+VlumbIv4K5w=;
        b=uMkrfdjOtiYFSpVc8wGB0LMlukheInH9wtLhEb5wWuCOaGZGqSRPK3Ly6r2bfXThG+
         NRzKFttMi5Xv8eMlOksBaB+x8QC4xE+uDD8gZU2bgEi9wVQKKMwhl53ZVzogJhEv8vtX
         VGsIiayU0W9AAcZDvwg/4ThobvsvouIiHoNx1kEtY99MVc1jzKMMeQfuPStlDPV2ROma
         LpqB6rYaEdVqHIHPGI/n0seLKo/tCoH/TzByVo4KphUQiBAc/NFD7B/rPH8ScwY51F50
         jPpgio1W6R/vBzPnWONFw91ab87G1AwhwtxDplyZnTgMWRvPcjLUu8x7+Pg1HazjJjtO
         b5iA==
X-Gm-Message-State: AOAM530E/rCvEijmqUMYIYym2AVnYJaFOD0Hsjm0gzne6DsuBi11PvRx
        xtBcTzXtGTLNSODViu2LS0JgWGPbPJM=
X-Google-Smtp-Source: ABdhPJwSwdd+SvGUfoCz9wxVh7XZktwcTy8VdH/fe1n5OH6D3+jxsAu9aEYt9EShtNdiP4QSy30UJA==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr3114359wmc.120.1624526305448;
        Thu, 24 Jun 2021 02:18:25 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z8sm659004wrw.18.2021.06.24.02.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 02:18:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 24 Jun 2021 10:18:24 +0100
Message-Id: <CCBQIHDJJSFT.SSW6EZS7A3C2@arch-thunder>
Cc:     =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
        "Andrey Konovalov" <andrey.konovalov@linaro.org>,
        "Jacopo Mondi" <jacopo@jmondi.org>
Subject: Re: [PATCH v3 3/6] v4l: async: Rename async nf functions, clean up
 long lines
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Sakari Ailus" <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20210624084046.13136-4-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,
On Thu Jun 24, 2021 at 9:40 AM WEST, Sakari Ailus wrote:

> Rename V4L2 async notifier functions, replacing "notifier" with "nf" and
> removing "_subdev" at the end of the function names adding subdevs as you
> can only add subdevs to a notifier. Also wrap and otherwise clean up long
> lines.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../driver-api/media/v4l2-subdev.rst          |  14 +-
>  drivers/media/i2c/max9286.c                   |  17 +-
>  drivers/media/i2c/st-mipid02.c                |  22 ++-
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 +-
>  drivers/media/platform/am437x/am437x-vpfe.c   |  19 +-
>  drivers/media/platform/atmel/atmel-isc-base.c |   4 +-
>  drivers/media/platform/atmel/atmel-isi.c      |  17 +-
>  .../media/platform/atmel/atmel-sama5d2-isc.c  |  15 +-
>  .../media/platform/atmel/atmel-sama7g5-isc.c  |  15 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  14 +-
>  drivers/media/platform/davinci/vpif_capture.c |  21 +--
>  drivers/media/platform/exynos4-is/media-dev.c |  20 +--
>  .../media/platform/marvell-ccic/cafe-driver.c |   9 +-
>  .../media/platform/marvell-ccic/mcam-core.c   |  10 +-
>  .../media/platform/marvell-ccic/mmp-driver.c  |   6 +-
>  drivers/media/platform/omap3isp/isp.c         |  21 ++-
>  drivers/media/platform/pxa_camera.c           |  26 ++-
>  drivers/media/platform/qcom/camss/camss.c     |  18 +-
>  drivers/media/platform/rcar-vin/rcar-core.c   |  34 ++--
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |  19 +-
>  drivers/media/platform/rcar_drif.c            |  14 +-
>  drivers/media/platform/renesas-ceu.c          |  29 ++-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  17 +-
>  drivers/media/platform/stm32/stm32-dcmi.c     |  18 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  12 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  19 +-
>  drivers/media/platform/ti-vpe/cal.c           |  16 +-
>  drivers/media/platform/video-mux.c            |  17 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c   |  17 +-
>  drivers/media/v4l2-core/v4l2-async.c          | 168 +++++++++---------
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  74 ++++----
>  drivers/staging/media/imx/imx-media-csi.c     |  17 +-
>  .../staging/media/imx/imx-media-dev-common.c  |   7 +-
>  drivers/staging/media/imx/imx-media-dev.c     |   6 +-
>  drivers/staging/media/imx/imx-media-of.c      |   6 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  17 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  24 +--
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  16 +-

For the imx7 parts:
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
