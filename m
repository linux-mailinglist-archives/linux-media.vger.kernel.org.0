Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCA6344D5FF
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 12:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbhKKLnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 06:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbhKKLnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 06:43:52 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570DDC061766;
        Thu, 11 Nov 2021 03:41:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 542691F45B1A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636630861; bh=yaYinyVYYl0N0+dtMK6+ku0bg03EnhdN+DOz/1sMwr8=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=no3Uds5F4F508vhMrZab+HejB/C3NhT5KZUDZRYsQXmxZ/JLYlFoKTLKUpb2hzBxE
         BgJAwDrXf1Ado/c/hLd3dPF00AjE3S4yMfKNiC+boOLn7hAgCnr9oE1Sz4b7XXuLKE
         Bkj9qW4XxFaKRDdVC1kR+C8XyTtz7OI6LGezuDYkoHHwHsb+RKyyYpZ/pjZjJ9wr4b
         G/qwQ/2SsBlzcPSB/6g3bbBCdqJfZc1zSbcQiS0PtjKl1CsjXt1DlVoS2iu92npFrY
         LzZU/xW98Bokw+uovBd6WuIlpdjRfRGCJElGWWU5qREaviFcx5jVJWy6UiAyqzOaOJ
         8eKvxTizo/RiQ==
Subject: Re: [PATCH v8 1/7] soc: mediatek: mmsys: add support for MDP
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, allen-kh.cheng@mediatek.com,
        randy.wu@mediatek.com, srv_heupstream@mediatek.com,
        hsinyi@google.com
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-2-moudy.ho@mediatek.com>
 <31577e05-34b8-2e5e-14f0-db9949ffdd3d@collabora.com>
Message-ID: <6876d923-bd71-8f10-e5fb-1c228642a163@collabora.com>
Date:   Thu, 11 Nov 2021 12:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <31577e05-34b8-2e5e-14f0-db9949ffdd3d@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 18/10/21 15:50, AngeloGioacchino Del Regno ha scritto:
> Il 15/10/21 14:38, Moudy Ho ha scritto:
>> For the purpose of module independence, related settings should be moved
>> from MDP to the corresponding driver.
>> This patch adds more 8183 MDP settings and interface. and MDP
>> related settings must be set via CMDQ to avoid frame unsynchronized.
>>
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>> ---
>>   drivers/soc/mediatek/Kconfig           |   1 +
>>   drivers/soc/mediatek/mt8183-mmsys.h    | 219 +++++++++++++++++++++++++
>>   drivers/soc/mediatek/mtk-mmsys.c       |  52 ++++++
>>   drivers/soc/mediatek/mtk-mmsys.h       |   2 +
>>   include/linux/soc/mediatek/mtk-mmsys.h |  56 +++++++
>>   5 files changed, 330 insertions(+)
>>
> 

This patch does not apply cleanly anymore, as of next-20211111.
Can you please send a v9 asap?

Thanks,
Angelo
