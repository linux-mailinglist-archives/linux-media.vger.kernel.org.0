Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD39192B14
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 15:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgCYO1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 10:27:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44160 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgCYO1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 10:27:39 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F40680C;
        Wed, 25 Mar 2020 15:27:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585146456;
        bh=T/NU9bG3Ykan0YqIk2beytUWlsNYrWgCCO7/WVsCUEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VaiKySylbOLXPVVqs8NII08Ozf/P9Ih+urqBZm/t5DdET0UjQVHTgIVS4UmYkNlid
         o562ehmdoX1Ln7LXI9vuZSkDaRGi5tDEl1wSVxTuawLfn4eOeSNfEyz3qDdsHvDYh7
         xHOPAM1zLhpExjFvar7AlRRBGuXI073B+8NESr/w=
Date:   Wed, 25 Mar 2020 16:27:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [GIT PULL FOR v5.7] ti-vpe/cal and imx7-mipi-csis cleanups/fixes
Message-ID: <20200325142733.GG19171@pendragon.ideasonboard.com>
References: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Mar 25, 2020 at 02:51:55PM +0100, Hans Verkuil wrote:
> The following changes since commit ad71693f41aa60217eaf1c29afb49b3aa0a2db5d:
> 
>   media: mtk-vpu: load vpu firmware from the new location (2020-03-24 17:11:47 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7n
> 
> for you to fetch changes up to 938b4f6cbbd7c7bd2236f4594ef37431c519f7a7:
> 
>   media: ti-vpe: cal: fix stop state timeout (2020-03-25 13:21:59 +0100)
> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Laurent Pinchart (14):
>       media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
>       media: imx: imx7-mipi-csis: Centralize initialization of pad formats
>       media: imx: imx7-mipi-csis: Add missing RAW formats
>       media: imx: imx7-mipi-csis: Expose correct YUV formats
>       media: imx: imx7-mipi-csis: Fix MEDIA_BUS_FMT_UYVY8_2X8 data alignment
>       media: imx: imx7-mipi-csis: Add MEDIA_BUS_FMT_UYVY10_2X10 support
>       media: imx: imx7-mipi-csis: Rename data_alignment field to width
>       media: imx: imx7-mipi-csis: Align image width based on format
>       media: imx: imx7-mipi-csis: Never set MIPI_CSIS_ISPCFG_ALIGN_32BIT
>       media: imx: imx7-mipi-csis: Align macro definitions
>       media: imx: imx7-mipi-csis: Remove link setup on source pad
>       media: imx: imx7-mipi-csis: Cleanup includes
>       media: imx: imx7-mipi-csis: Don't use imx-media-utils helpers
>       media: imx: imx7-mipi-csis: Implement the .enum_mbus_code() operation
> 
> Tomi Valkeinen (19):
>       media: ti-vpe: cal: fix DMA memory corruption
>       media: ti-vpe: cal: improve enable_irqs
>       media: ti-vpe: cal: fix use of wrong macro
>       media: ti-vpe: cal: use runtime_resume for errata handling
>       media: ti-vpe: cal: drop cal_runtime_get/put
>       media: ti-vpe: cal: catch error irqs and print errors
>       media: ti-vpe: cal: print errors on timeouts
>       media: ti-vpe: cal: simplify irq handling
>       media: ti-vpe: cal: remove useless CAL_GEN_* macros
>       media: ti-vpe: cal: remove useless IRQ defines
>       media: ti-vpe: cal: use reg_write_field
>       media: ti-vpe: cal: cleanup CIO power enable/disable
>       media: ti-vpe: cal: fix dummy read to phy
>       media: ti-vpe: cal: program number of lines properly
>       media: ti-vpe: cal: set DMA max seg size
>       media: ti-vpe: cal: move code to separate functions
>       media: ti-vpe: cal: improve wait for CIO resetdone
>       media: ti-vpe: cal: improve wait for stop-state
>       media: ti-vpe: cal: fix stop state timeout

Tomi has posted v3, is that what the pull request contains ?

>  drivers/media/platform/ti-vpe/cal.c        | 397 ++++++++++++++++++++++++++++++---------------------
>  drivers/media/platform/ti-vpe/cal_regs.h   |  21 +--
>  drivers/staging/media/imx/imx7-mipi-csis.c | 446 ++++++++++++++++++++++++++++++++++++----------------------
>  3 files changed, 518 insertions(+), 346 deletions(-)

-- 
Regards,

Laurent Pinchart
