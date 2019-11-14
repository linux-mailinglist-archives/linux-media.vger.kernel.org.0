Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FEAFBE47
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 04:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfKNDVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 22:21:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:59584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfKNDVV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 22:21:21 -0500
Received: from localhost (unknown [124.219.31.93])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FC8A206F3;
        Thu, 14 Nov 2019 03:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573701680;
        bh=FmT+xIiI8fjMzRISC6E96FWJYAdkxpETep6dx0aAOFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2ZZqboLMJesjq8BgSJ7MoVJfF7TgnYS/cpHL36P4jLxMYovM+i28jf1w3HevubntO
         CeDfpE3nKYFUIcb2Vwhkjbuo4IYsEvU7SVWvJfBdlElMiMJ5CCs+VgGXsWTotdq/qS
         w53jwTQdO8muQEOIrztPV0CPbjIZ2Oh5POjkNcYQ=
Date:   Thu, 14 Nov 2019 11:21:17 +0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Bin Liu <b-liu@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Colin Ian King <colin.king@canonical.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 12/13] usb: gadget: udc: gr_udc: create debugfs
 directory under usb root
Message-ID: <20191114032117.GA130252@kroah.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
 <1573541519-28488-12-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573541519-28488-12-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 02:51:58PM +0800, Chunfeng Yun wrote:
> Now the USB gadget subsystem can use the USB debugfs root directory,
> so move it's directory from the root of the debugfs filesystem into
> the root of usb
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2:
>   1. abandon new API usb_debugfs_create_dir(), and use usb_debug_root
> ---
>  drivers/usb/gadget/udc/gr_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
> index 7a0e9a58c2d8..5faa09a6c770 100644
> --- a/drivers/usb/gadget/udc/gr_udc.c
> +++ b/drivers/usb/gadget/udc/gr_udc.c
> @@ -208,7 +208,7 @@ static void gr_dfs_create(struct gr_udc *dev)
>  {
>  	const char *name = "gr_udc_state";
>  
> -	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), NULL);
> +	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), usb_debug_root);
>  	debugfs_create_file(name, 0444, dev->dfs_root, dev, &gr_dfs_fops);
>  }
>  

This breaks the build:
drivers/usb/gadget/udc/gr_udc.c: In function ‘gr_dfs_create’:
drivers/usb/gadget/udc/gr_udc.c:211:57: error: ‘usb_debug_root’ undeclared (first use in this function)
  211 |  dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), usb_debug_root);
      |                                                         ^~~~~~~~~~~~~~
drivers/usb/gadget/udc/gr_udc.c:211:57: note: each undeclared identifier is reported only once for each function it appears in
make[4]: *** [scripts/Makefile.build:265: drivers/usb/gadget/udc/gr_udc.o] Error 1

so I've dropped it from the patch series.

Please fix up and resend.

And of course, always test-build your patches before you send them
out...

greg k-h
