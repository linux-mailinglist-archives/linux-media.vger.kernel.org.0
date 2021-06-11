Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697EA3A3FCD
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 12:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFKKJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 06:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhFKKJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 06:09:26 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BF4C061574;
        Fri, 11 Jun 2021 03:07:28 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e11so5450361wrg.3;
        Fri, 11 Jun 2021 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gFhqPqOGSTJJX3dT27efQ5zQlrIM3h1f2aA9XZu0Vc8=;
        b=Fb53nvxjK0BcaL7BNdeGiZtFhAi6nR4cLzDs/h/OmS32FIVcPer0MefjbMscy6hQXG
         WMiJm90n3CUAcReVU4u3av59Vc6dEzxTd5D9bEFg8lJZiE210pmWEqeBDMBs1DQSL6dF
         MAF21gvl2Xq08HRmFab1/k4A/kSdoqnLrq33ukkcjDTHatq70Lv4U25FLv0FcqxhfNGO
         U7kVBzy5cS5yKtji5+YZARfpqSNYRHSw9oXO8shNn3E318Ag1KiTRFhxtfzd1EAkPoBy
         TJet10s2y8zWQ5CY/FGR9VQUKRpBUjE6b9Fwdn4A48fsQpWlWMUN14UbhJda6vp5o1s4
         TeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gFhqPqOGSTJJX3dT27efQ5zQlrIM3h1f2aA9XZu0Vc8=;
        b=aj/zKptdauNSfjOU/B3CGZrwOoVTyuI+IOrYWFyTFULUD1JhBxY36a9E57nGgGAhkp
         gWzQthDj4FAKXKaQ7B7XGkL3NLi17zF41PtSD7Mk7rUWlS9P3MiJ8RP84B6+eZ9Umg4F
         FQrR1qb1ddvVT9RlwUS1/pf1F1J0EUXj810foDVDx656mZgvSgoSJTVl9BMHvfR8RRy+
         gxrvNEoyVY1GqV2Yf+DrhD8NVlG9fts4LnDTXFzHKV0MXOHJZ3fD3ZhDkNrHn6kk42b6
         idG2zdMG0bw6Fe8VYLIWq1PVOPkDbyLze0GKfI88Qlevo83MbM0GYGCZd8H91SDeonHQ
         ATHg==
X-Gm-Message-State: AOAM5309Mvetyq5Rkv/ckQLJt6366CtNhi8LcWC8oS6nyw5W0CBbtOUr
        +aCkixS99ptHUNPzb04Yry3U2DfbeLkR6g==
X-Google-Smtp-Source: ABdhPJyXEm705FvtfJsTKJDMlqkddRVeBGjayOW/x5R9yipKm4VX2Cwnxm40M9p06MvhSKM1KAZsQg==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr3166775wrn.64.1623406047349;
        Fri, 11 Jun 2021 03:07:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id r6sm6437738wrz.91.2021.06.11.03.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 03:07:26 -0700 (PDT)
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, srv_heupstream@mediatek.com,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
        chao.hao@mediatek.com, ming-fan.chen@mediatek.com,
        yi.kuo@mediatek.com, eizan@chromium.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
 <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
 <1620822547.2983.8.camel@mhfsdcap03>
 <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
 <1623326528.23717.20.camel@mhfsdcap03>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com>
Date:   Fri, 11 Jun 2021 12:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623326528.23717.20.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/06/2021 14:02, Yong Wu wrote:
> On Thu, 2021-06-10 at 09:53 +0200, Matthias Brugger wrote:
>> Hi Yong,
>>
>> On 12/05/2021 14:29, Yong Wu wrote:
>>> On Wed, 2021-05-12 at 17:20 +0800, Hsin-Yi Wang wrote:
>>>> On Sat, Apr 10, 2021 at 5:14 PM Yong Wu <yong.wu@mediatek.com> wrote:
>>>>>
>>>>> MediaTek IOMMU has already added the device_link between the consumer
>>>>> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
>>>>> the smi-larb's pm_runtime_get_sync also be called automatically.
>>>>>
>>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>> Reviewed-by: Evan Green <evgreen@chromium.org>
>>>>> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
>>>>> ---
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 46 ++-----------------
>>>>>  4 files changed, 10 insertions(+), 77 deletions(-)
>>>
>>> [...]
>>>
>>>>> @@ -108,13 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>>>>>                 }
>>>>>         }
>>>>>
>>>>> -       ret = mtk_smi_larb_get(pm->larbvenc);
>>>>> -       if (ret) {
>>>>> -               mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
>>>>> -               goto clkerr;
>>>>> -       }
>>>>> -       return;
>>>>
>>>> You can't delete the return; here, otherwise vcodec_clk will be turned
>>>> off immediately after they are turned on.
>>>
>>> Thanks very much for your review.
>>>
>>> Sorry for this. You are quite right.
>>>
>>> I checked this, it was introduced in v4 when I rebase the code. I will
>>> fix it in next time.
>>>
>>
>> Please also make sure that you add all maintainers. I realized that at least for
>> the media/platform drivers we miss the maintainer and the corresponding mailing
>> list.
>> This is especially important in this series, as it spans several subsystems.
> 
> Thanks for hint. I only added the file maintainer here. I will add
> linux-media in next version.
> 
> By the way, this patchset cross several trees, then which tree should it
> go through. Do you have some suggestion?
> 

That's a good question. I think the media tree would be a good candidate, as it
has the biggest bunch of patches. But that would mean that Joerg is fine that.
The DTS part could still go through my tree.

Regards,
Matthias
