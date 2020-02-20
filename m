Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC41166B25
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 00:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgBTXsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 18:48:21 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53870 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbgBTXsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 18:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=B9aSlxx7wx7w6JgLrqupsTcq3VAPuxTbkmWcCtYGRVU=; b=DBC8QHhVOjtp6ibn9AOlSwONWa
        KS+1mQxLjWZ1bi5hyXU/HxnJJwr3OJQUSwQCDAtI7+eoLSgn4iNjY2MhDzDP5n8GYn0FvCNJCttJQ
        rzKiBZcNL/0HJ8S7fG5sVQlps4VT5UOhSQScg+usFQZfMgH4c+qokRCncDFOblytGeiad8VvhuHWM
        m5TZoAk/xEjg7RR957H7+0JnmNmSWKZnToH/oDiHO4hUdf+EJ8swHkdE81GLLywKdWUgeyOqJaYBb
        WZ8O4Njk0F3VrCdwmLZyr23M+MYDcHnvxj+3k5AemtVQ0OK2yhmdgHvB0lOfiIhILLv0qlqtwe5Kl
        BHd46h3w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j4vYF-0007k0-KU; Thu, 20 Feb 2020 23:48:15 +0000
Subject: Re: [PATCH v8 1/6] drm/mediatek: Use regmap for register access
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
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <20200220172147.919996-2-enric.balletbo@collabora.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0b2046b9-90de-c894-7502-993b5df12e7a@infradead.org>
Date:   Thu, 20 Feb 2020 15:48:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220172147.919996-2-enric.balletbo@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/20/20 9:21 AM, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The mmsys memory space is shared between the drm and the
> clk driver. Use regmap to access it.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v8: None
> Changes in v7:
> - Add R-by from CK
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
>  5 files changed, 30 insertions(+), 43 deletions(-)

Hi. Just a quick question:

Do you need to select REGMAP or one of its derivatives to make sure
that the proper interfaces are available for this driver?

thanks.
-- 
~Randy

