Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E7475414
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 18:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbfGYQbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 12:31:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49068 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGYQbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 12:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WFGNQK9Xt+5KkwS+JsVqt04X8jXlX3FjXaAj+5cy4rY=; b=hpXXu9cdiwwSIDOxxNuU3gJ85
        OJFZ1bkCJFQ3tFoMx6Hewic6/7YWb1uzRdG/KqPbwqePIK36YXiBVX2+qzcNWXYqdh0m1zPH+oalf
        oFo6K10h12CVHC4lH4aFVmJ7N0OS1HI5STeJL4UXPhAPTcL3kZHumimiKflIy285o6YS7wXo+hrc+
        lruc9hZdEmzLn+sCMCMiTeJW45+seE8IvZoXj5HN2lHcz+XiArpw5txEZqxg6YodpRpR/pS9fHG7H
        co1xhYdq9C9GXv3+PTKsE5tdkpvfzrZIiCLUvWz8FesSg/+TXAIOVzq26riU6N4IpBd+ButxFsH2W
        XNBNnfVVQ==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqgea-0007AW-K0; Thu, 25 Jul 2019 16:31:41 +0000
Date:   Thu, 25 Jul 2019 13:31:37 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/6] media: v4l2-core: Module re-organization
Message-ID: <20190725133137.4a99dc05@coco.lan>
In-Reply-To: <20190715210649.31681-3-ezequiel@collabora.com>
References: <20190715210649.31681-1-ezequiel@collabora.com>
        <20190715210649.31681-3-ezequiel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 15 Jul 2019 18:06:43 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> videodev.ko and v4l2-common.ko driver are built under
> the same conditions. Therefore, it doesn't make much sense
> to split them in two different modules.
> 
> Splitting v4l2-common to its own driver has done many
> years ago:
> 
>   commit a9254475bbfbed5f0596d952c6a3c9806e19dd0b
>   Author: Mauro Carvalho Chehab <mchehab@infradead.org>
>   Date:   Tue Jan 29 18:32:35 2008 -0300
> 
>       V4L/DVB (7115): Fix bug #9833: regression when compiling V4L without I2C
> 
> Back then, the subsystem organization was different.
> However, With the current organization, there is no issue
> compiling V4L2 with I2C as y/m/n.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 4d42418e603e..8e2f52f7800b 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -7,14 +7,13 @@ tuner-objs	:=	tuner-core.o
>  
>  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
>  			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o v4l2-clk.o \
> -			v4l2-async.o
> +			v4l2-async.o v4l2-common.o
>  videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
>  videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
>  videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
>  
>  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>  obj-$(CONFIG_VIDEO_V4L2) += videodev.o
> -obj-$(CONFIG_VIDEO_V4L2) += v4l2-common.o
>  obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
>  
>  obj-$(CONFIG_VIDEO_TUNER) += tuner.o


Huh? This patch sounds incomplete... Where are you removing the
MODULE_foo macros) from v4l2-common.c?


Thanks,
Mauro
