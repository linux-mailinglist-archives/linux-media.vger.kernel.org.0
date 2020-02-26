Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE84E1702CB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgBZPkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:40:31 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41560 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgBZPkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=RdfI8zcYUbYtVeFuEktgZYpmdsO2bxZo0zxF/fSi1ho=; b=QZiWhKFyhqE4wOJ4Fc2qb1NIjh
        +aCjkUnk6fdzX+rGLHwqwjOJ+6bxSaXFwf9Kl5W13iavOwYJu15WkjT+FRP9+8j1dlpP6+w1TjFkb
        l0KX7scOeP1gS6U0jzc4RTX9aMchaKjhHg00bVZv0j2+t9865z+c/u4otvCYk25mD576+3nVoAD53
        8reA1R6AD5lLyP+dykIdyV9K4AcNU6zV0ID4tLfSyVLPcXzZDCcP6lj+/O18BdoN69QwxFGcxefhi
        JsRx6aDf5Jc9A1XlpCtpHNdfuvIuJa1BXqtgkmmPgmJhscCnvmWd3X+Zm1f7o8h7o9sEd1Fut96kG
        a5cuJNdw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j6ynR-0001q6-Qg; Wed, 26 Feb 2020 15:40:25 +0000
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
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
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-4-enric.balletbo@collabora.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
Date:   Wed, 26 Feb 2020 07:40:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226105419.632771-4-enric.balletbo@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 2:54 AM, Enric Balletbo i Serra wrote:
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 2114b563478c..dcd6481a14d0 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>  	  driver.
>  
> +config MT8173_MMSYS
> +	bool "MediaTek MT8173 MMSYS Support"

Hi,
Can this be tristate instead of bool?

> +	depends on COMMON_CLK_MT8173
> +	help
> +	  Say yes here to add support for the MediaTek MT8173 Multimedia
> +	  Subsystem (MMSYS).
> +
>  endmenu

thanks.
-- 
~Randy

