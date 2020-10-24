Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CF8297A0D
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 02:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756664AbgJXAfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 20:35:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41734 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756252AbgJXAfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 20:35:45 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E79AA1C;
        Sat, 24 Oct 2020 02:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1603499743;
        bh=NbyCUxAU6lhvIbqrP0bRYys1d2xfIqZWoMdhyQf020A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S0TgQHhJm22pfbwPg66Pg0OYRGGGxBckG6ALN9D4QdwskckmDf/m2vAqgR+FFJZll
         LJoUK5auUzVJCp/Oo30i1+4ev9gDHNiib/kyD/w1gfV+B5NZrMD70OIJIS1O/LoDWU
         6bb76mwRoPXfj/v3v17I39l71EGludnd6IPv/j3c=
Date:   Sat, 24 Oct 2020 03:34:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 6/9] ipu3-cio2: Rename ipu3-cio2.c to allow module
 to be built from multiple sources files retaining ipu3-cio2 name
Message-ID: <20201024003456.GR5979@pendragon.ideasonboard.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-7-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Oct 19, 2020 at 11:59:00PM +0100, Daniel Scally wrote:
> ipu3-cio2 driver needs extending with multiple files; rename the main
> source file and specify the renamed file in Makefile to accommodate that.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- patch introduced
> 
>  drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
>  drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
>  2 files changed, 2 insertions(+)
>  rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)
> 
> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> index 98ddd5bea..b4e3266d9 100644
> --- a/drivers/media/pci/intel/ipu3/Makefile
> +++ b/drivers/media/pci/intel/ipu3/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> +
> +ipu3-cio2-y += ipu3-cio2-main.o
> \ No newline at end of file

I would have sworn the usual naming for this kind of case was -drv.c,
but it seems -main.c is more common (I've probably been mistaken by
focussing quite a bit on drivers/gpu/drm/ in the past few years).
-core.c wins over both though :-) Anyway, enough bikeshedding, with the
newline fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> similarity index 100%
> rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
> rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c

-- 
Regards,

Laurent Pinchart
