Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A22A167871
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgBUHqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 02:46:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54898 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgBUHqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 02:46:37 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 8BF432904EA
Subject: Re: [PATCH v8 1/6] drm/mediatek: Use regmap for register access
To:     Randy Dunlap <rdunlap@infradead.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com
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
 <0b2046b9-90de-c894-7502-993b5df12e7a@infradead.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <5c19af7a-170b-2cd1-da98-e4125504eb34@collabora.com>
Date:   Fri, 21 Feb 2020 08:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0b2046b9-90de-c894-7502-993b5df12e7a@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

On 21/2/20 0:48, Randy Dunlap wrote:
> On 2/20/20 9:21 AM, Enric Balletbo i Serra wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> The mmsys memory space is shared between the drm and the
>> clk driver. Use regmap to access it.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v8: None
>> Changes in v7:
>> - Add R-by from CK
>>
>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
>>  5 files changed, 30 insertions(+), 43 deletions(-)
> 
> Hi. Just a quick question:
> 
> Do you need to select REGMAP or one of its derivatives to make sure
> that the proper interfaces are available for this driver?
> 

Right, I will fix this in next version.

> thanks.
> 
