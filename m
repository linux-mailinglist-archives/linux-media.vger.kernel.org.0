Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD6843B54E
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 17:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbhJZPUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 11:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbhJZPUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 11:20:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD61CC061745;
        Tue, 26 Oct 2021 08:17:44 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 9DB4A1F43A1C
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
To:     Flora Fu <flora.fu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
Message-ID: <88a4e8f1-6ab7-cb2d-c88b-758b92b1811e@collabora.com>
Date:   Tue, 26 Oct 2021 17:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-7-flora.fu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 23/10/21 13:14, Flora Fu ha scritto:
> Add apu core driver.
> The core driver will init the reset part of apu functions.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig           | 18 +++++
>   drivers/soc/mediatek/apusys/Makefile   |  3 +
>   drivers/soc/mediatek/apusys/apu-core.c | 91 ++++++++++++++++++++++++++
>   drivers/soc/mediatek/apusys/apu-core.h | 11 ++++
>   4 files changed, 123 insertions(+)
>   create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
>   create mode 100644 drivers/soc/mediatek/apusys/apu-core.h
> 

Hello Flora,

I don't think that this custom probe/init mechanism through apu-core.c
can ever be a thing: you should simply register a number of platform
drivers (likely modules) and let the kernel decide what to probe
first, what to probe last, as it's done for every kernel driver.

I understand that this may reduce probe deferrals, as it's a controlled
probe sequence, made specifically for apusys, but it's anyway something
that won't give you big gains (and if it was, then you should still let
the kernel decide and eventually optimize that mechanism somehow).


I want to note that, since this series is rather huge, I will probably
do more than one incremental review of it... and for how things look,
this will most probably be split to more than one series, to allow getting
reviews from specific subsystem maintainers, leading to better code quality
and robustness in the end.

Some more details are coming in reply of other patches in this series.

Thanks,
- Angelo
