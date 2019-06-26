Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7DE56C1C
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 16:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfFZOfs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 10:35:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfFZOfs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 10:35:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QEZda3024948;
        Wed, 26 Jun 2019 09:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561559739;
        bh=6wfxBmWQStrcEx9R/kwwqP1CuirjnegmLXPpCXE7Llk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=WYrN/q3Kex5S6dhKoXL6C/zN3MWf9SuVKA72Xa8c/2uCcFQ4zIF8Q+MBiGySA8cJF
         TuWBc9bV+hI1Y0RzWmIDsRLwvAbz4pue7UvJGONIDyRIzBmC3/38LkG+FCrijnDzNZ
         RqjtlG/dhYqiZ6VpIrRqR5i/U096Wpp0/VbyKQEY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QEZd90105031
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Jun 2019 09:35:39 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 09:35:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 09:35:39 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x5QEZdi8112094;
        Wed, 26 Jun 2019 09:35:39 -0500
Date:   Wed, 26 Jun 2019 09:36:58 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 5/5] media/platform: don't set description in ENUM_FMT
Message-ID: <20190626143658.42evvbsxuikyo6lp@ti.com>
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
 <20190626112748.31730-6-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190626112748.31730-6-hverkuil-cisco@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote on Wed [2019-Jun-26 13:27:48 +0200]:
> The V4L2 core sets the format description and flags for the driver in order
> to ensure consistent naming.
> 
> So drop the strscpy of the description in drivers. Also remove any
> description strings in driver-internal structures since those are
> no longer needed.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Benoit Parrot <bparrot@ti.com>

For am437x-vpfe.c and ti-vpe/vpe.c 

Acked-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/am437x/am437x-vpfe.c   | 18 ++-----------
>  drivers/media/platform/davinci/vpbe_display.c | 14 ++--------
>  drivers/media/platform/davinci/vpif_capture.c | 11 ++------
>  drivers/media/platform/davinci/vpif_display.c |  4 ---
>  drivers/media/platform/exynos-gsc/gsc-core.c  | 22 ---------------
>  drivers/media/platform/exynos-gsc/gsc-core.h  |  2 --
>  .../media/platform/exynos4-is/fimc-capture.c  |  3 ---
>  drivers/media/platform/exynos4-is/fimc-core.c | 20 --------------
>  .../platform/exynos4-is/fimc-isp-video.c      |  1 -
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  3 ---
>  drivers/media/platform/exynos4-is/fimc-lite.c |  8 ------
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |  1 -
>  drivers/media/platform/m2m-deinterlace.c      |  4 ---
>  .../media/platform/marvell-ccic/mcam-core.c   | 10 -------
>  drivers/media/platform/mx2_emmaprp.c          |  4 ---
>  drivers/media/platform/omap/omap_vout.c       |  7 -----
>  .../media/platform/s3c-camif/camif-capture.c  | 11 +++-----
>  drivers/media/platform/s3c-camif/camif-core.c |  6 -----
>  drivers/media/platform/s3c-camif/camif-core.h |  1 -
>  drivers/media/platform/s5p-g2d/g2d.c          |  6 -----
>  drivers/media/platform/s5p-g2d/g2d.h          |  1 -
>  drivers/media/platform/s5p-jpeg/jpeg-core.c   | 27 -------------------
>  drivers/media/platform/s5p-jpeg/jpeg-core.h   |  2 --
>  .../media/platform/s5p-mfc/s5p_mfc_common.h   |  1 -
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 15 -----------
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  | 10 -------
>  drivers/media/platform/sh_veu.c               | 19 ++++++-------
>  drivers/media/platform/sh_vou.c               | 12 ++-------
>  drivers/media/platform/ti-vpe/vpe.c           | 12 ---------
>  drivers/media/platform/via-camera.c           |  4 ---
>  drivers/media/platform/xilinx/xilinx-dma.c    |  2 --
>  drivers/media/platform/xilinx/xilinx-vip.c    | 16 +++++------
>  drivers/media/platform/xilinx/xilinx-vip.h    |  2 --
>  include/media/drv-intf/exynos-fimc.h          |  2 --
>  34 files changed, 28 insertions(+), 253 deletions(-)
> 
