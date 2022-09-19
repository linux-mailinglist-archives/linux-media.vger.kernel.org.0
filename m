Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377625BCF52
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiISOmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiISOmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:42:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C573A261A
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:42:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EB829BA;
        Mon, 19 Sep 2022 16:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663598535;
        bh=FJcFvEX0dOf7OwC7lVaCL262kemSmjwopgCzYJEgxJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NAmemR4K5OkN21n4CDzbTDZdufoSnM8vT6S2rzBBDyXii96WXBcuonDwTGHJuhB/u
         8D3DBEWrwY8b0rjywv9C23xYnQVDhzCJ2kWN2sqJeatwFRKrJLBWWdXhgXO39dVE/E
         jo5hBF9coP8kpbiVjQeq9o+DlnSfrQ+lmqUoCHkE=
Date:   Mon, 19 Sep 2022 17:42:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 00/13] media: Switch to use dev_err_probe() helper
Message-ID: <Yyh/uouJ8hHmD/Mc@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

On Thu, Sep 15, 2022 at 11:03:11PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER. It will print
> error code in a human readable way and simplify the code.

How would you like to get this merged ? A few patches need fixes, and
all of them could benefit from a typo fix in the commit message. If you
send a v2, it could be merged in one go instead of individual
maintainers taking patches in their tree. Hans, would you handle this ?

> Yang Yingliang (13):
>   media: platform: stm32-cec: Switch to use dev_err_probe() helper
>   media: i2c: ad5820: Switch to use dev_err_probe() helper
>   media: i2c: imx274: Switch to use dev_err_probe() helper
>   media: i2c: tc358743: Switch to use dev_err_probe() helper
>   media: platform: mtk_mdp_comp: Switch to use dev_err_probe() helper
>   media: platform: exynos4-is: Switch to use dev_err_probe() helper
>   media: stm32-dcmi: Switch to use dev_err_probe() helper
>   media: omap3isp: Switch to use dev_err_probe() helper
>   media: xilinx: csi2rxss: Switch to use dev_err_probe() helper
>   media: rc: gpio-ir-recv: Switch to use dev_err_probe() helper
>   media: rc: gpio-ir-tx: Switch to use dev_err_probe() helper
>   media: rc: ir-rx51: Switch to use dev_err_probe() helper
>   media: uvcvideo: Switch to use dev_err_probe() helper
> 
>  drivers/media/cec/platform/stm32/stm32-cec.c  |  9 +++----
>  drivers/media/i2c/ad5820.c                    | 18 +++++--------
>  drivers/media/i2c/imx274.c                    |  5 ++--
>  drivers/media/i2c/tc358743.c                  |  9 +++----
>  .../platform/mediatek/mdp/mtk_mdp_comp.c      |  5 ++--
>  .../platform/samsung/exynos4-is/media-dev.c   |  4 +--
>  drivers/media/platform/st/stm32/stm32-dcmi.c  | 27 +++++++------------
>  drivers/media/platform/ti/omap3isp/isp.c      |  3 +--
>  .../media/platform/xilinx/xilinx-csi2rxss.c   |  8 +++---
>  drivers/media/rc/gpio-ir-recv.c               | 10 +++----
>  drivers/media/rc/gpio-ir-tx.c                 |  9 +++----
>  drivers/media/rc/ir-rx51.c                    |  9 ++-----
>  drivers/media/usb/uvc/uvc_driver.c            |  9 +++----
>  13 files changed, 41 insertions(+), 84 deletions(-)

-- 
Regards,

Laurent Pinchart
