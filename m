Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEAD74C1C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbfGYKrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:47:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44414 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbfGYKrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lVWSvMti17F8POnwuS7EAyc3O7WloP9rxEkzwLg6TD8=; b=W7QoRAjz2R9Cyj7PLvxtg+aoY
        Exgo1z2uv90MCPfnczKPDe8Xjt8RQD3vFIs8ELDmsnUDcVsmv+ZBbMVgitj2pW6i9RMkG8LbJwPB/
        hfCTwDuBMkRPlU0J2smAQHdNS+V6SdWFs2QVOk+HVMioYAnsscgih9e0ovVx0zdAR5MPUH0rXgOCp
        Ni3lX5kucpRGIZ0pcX/zbOKnKViHI3xaEqM0YY/2u5zGS29FFwPDxXyOhjrvg8S09S9wNfEDPJLTU
        FK0yIDm9LLaipuRmlYMUd0EXxpcSE14N+Ip9XNWLNV2g/kNgyQ6v7VXoNcxJfThsW3xbYJ02xFugZ
        3sDDgnfJg==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqbHJ-0002hn-Iz; Thu, 25 Jul 2019 10:47:18 +0000
Date:   Thu, 25 Jul 2019 07:47:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL for 5.4] V4L2 ISP, fwnode, sensor and CSI2 patches
Message-ID: <20190725074714.52f775f2@coco.lan>
In-Reply-To: <20190725095030.GG1263@valkosipuli.retiisi.org.uk>
References: <20190725095030.GG1263@valkosipuli.retiisi.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 25 Jul 2019 12:50:30 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> Here's my first set of V4L2 patches for 5.4. Included are sensor driver
> patches, but also update for the Cadence CSI2TX driver and odd fixes and
> cleanups. No new drivers this time.
> 
> Please pull.
> 
> 
> The following changes since commit ebe15c7679680308268b99d911b1db15d514c7b8:
> 
>   media: tegra-cec: use cec_notifier_cec_adap_(un)register (2019-07-23 08:40:57 -0400)
> 
> are available in the Git repository at:
> 
>   ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.4-3-signed
> 
> for you to fetch changes up to d0de3d651cbc2ff02084a1671368c461bb3c3e78:
> 
>   media: staging/intel-ipu3: Use dev_get_drvdata where possible (2019-07-25 12:30:25 +0300)
> 
> ----------------------------------------------------------------
> V4L2 patches for 5.4
> 
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       media: v4l2-fwnode: Switch to use fwnode_property_count_uXX()
> 
> Christophe JAILLET (1):
>       media: ov2680: fix a typo in a function name
> 
> Chuhong Yuan (2):
>       media: pci: Use dev_get_drvdata where possible
>       media: staging/intel-ipu3: Use dev_get_drvdata where possible
> 
> Fabio Estevam (5):
>       media: ov5645: Remove unneeded regulator_set_voltage()
>       media: ov5645: Use regulator_bulk() functions
>       media: i2c: ov5640: Check for devm_gpiod_get_optional() error
>       media: i2c: ov5640: Fix the order for enabling regulators

>       media: imx7.rst: Fix the references to the CSI multiplexer

This patch has an issue: it breaks a code block at documentation.

So, I'm skipping this one, picking the remaining patches.

Regards,
Mauro


> 
> Jan Kotas (4):
>       media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
>       media: Add lane checks for Cadence CSI2TX
>       media: Fix Lane mapping in Cadence CSI2TX
>       media: Add support for Cadence CSI2TX 2.1
> 
>  .../devicetree/bindings/media/cdns,csi2tx.txt      |   3 +-
>  Documentation/media/v4l-drivers/imx7.rst           | 127 +++++++++--------
>  drivers/media/i2c/ov2680.c                         |   4 +-
>  drivers/media/i2c/ov5640.c                         |   7 +-
>  drivers/media/i2c/ov5645.c                         | 120 +++-------------
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   3 +-
>  drivers/media/pci/pt1/pt1.c                        |   6 +-
>  drivers/media/pci/pt3/pt3.c                        |   6 +-
>  drivers/media/platform/cadence/cdns-csi2tx.c       | 155 ++++++++++++++++-----
>  drivers/media/v4l2-core/v4l2-fwnode.c              |   8 +-
>  drivers/staging/media/ipu3/ipu3.c                  |   3 +-
>  11 files changed, 225 insertions(+), 217 deletions(-)
> 



Thanks,
Mauro
