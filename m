Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386D11709A8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 21:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbgBZU3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 15:29:52 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56902 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbgBZU3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 15:29:52 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0912129576D
Message-ID: <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform
 driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        dri-devel@lists.freedesktop.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-clk@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, wens@csie.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sean.wang@mediatek.com, frank-w@public-files.de,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <mbrugger@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
        Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 26 Feb 2020 17:29:35 -0300
In-Reply-To: <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
         <20200226105419.632771-4-enric.balletbo@collabora.com>
         <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-02-26 at 07:40 -0800, Randy Dunlap wrote:
> On 2/26/20 2:54 AM, Enric Balletbo i Serra wrote:
> > diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> > index 2114b563478c..dcd6481a14d0 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -44,4 +44,11 @@ config MTK_SCPSYS
> >  	  Say yes here to add support for the MediaTek SCPSYS power domain
> >  	  driver.
> >  
> > +config MT8173_MMSYS
> > +	bool "MediaTek MT8173 MMSYS Support"
> 
> Hi,
> Can this be tristate instead of bool?
> 

Wouldn't that conflict with
the driver being a builtin_platform_driver,
or am I just confusing things badly?

Thanks,
Ezequiel

> +	depends on COMMON_CLK_MT8173
> > +	help
> > +	  Say yes here to add support for the MediaTek MT8173 Multimedia
> > +	  Subsystem (MMSYS).
> > +
> >  endmenu
> 
> thanks.
> -- 
> ~Randy
> 
> 


