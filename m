Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342AA20AF1E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 11:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgFZJhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 05:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgFZJhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 05:37:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19726C08C5C1;
        Fri, 26 Jun 2020 02:37:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id EE0602A04F6
Subject: Re: [PATCH v2 0/2] Refactor MDP driver and add dummy component driver
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Eizan Miyamoto <eizan@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20200506084039.249977-1-eizan@chromium.org>
 <25cbac25-035f-9c2b-24ec-f59403b56424@xs4all.nl>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <177292b5-ebe9-6e10-c93e-0106e312ba83@collabora.com>
Date:   Fri, 26 Jun 2020 11:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <25cbac25-035f-9c2b-24ec-f59403b56424@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan and Hans,

On 24/6/20 16:05, Hans Verkuil wrote:
> On 06/05/2020 10:40, Eizan Miyamoto wrote:
>>
>> This series depends on all changes in the series:
>> https://patchwork.kernel.org/patch/11530275/
> 
> I plan on merging the v3 of this series.
> 
>>
>> We are adding a dummy MDP component driver so that all the components
>> are properly configured with IOMMUs and LARBs. This is required for
>> us to get hardware video decode working in 4.19, and possibly newer
>> kernels.
> 
> What is the status of this series?
> 

First of all, sorry, I should have had answer before but for some reason I
missed the track of this patchset.

> There was some discussion with Enric, but that didn't come to a conclusion,
> I think.
> 

Yes, my main concern is how this driver is instantiated, it is using one of the
rdma nodes, see the rdma0 node vs rdma1, to instantiate the driver,

       mdp_rdma0: rdma@14001000 {
                compatible = "mediatek,mt8173-mdp-rdma";
                             "mediatek,mt8173-mdp";
                reg = <0 0x14001000 0 0x1000>;
                clocks = <&mmsys CLK_MM_MDP_RDMA0>,
                         <&mmsys CLK_MM_MUTEX_32K>;
                power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
                iommus = <&iommu M4U_PORT_MDP_RDMA0>;
                mediatek,larb = <&larb0>;
                mediatek,vpu = <&vpu>;
        };


        mdp_rdma1: rdma@14002000 {

                compatible = "mediatek,mt8173-mdp-rdma";
                reg = <0 0x14002000 0 0x1000>;
                clocks = <&mmsys CLK_MM_MDP_RDMA1>,
                         <&mmsys CLK_MM_MUTEX_32K>;
                power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
                iommus = <&iommu M4U_PORT_MDP_RDMA1>;
                mediatek,larb = <&larb4>;
        };


My point is that DT is to describe hardware not a trick to instantiate drivers,
so the "mediatek,mt8173-mdp" is completely unnecessary. We had the same issue
with the MMSYS driver and the mediatek DRM driver, and we solved by having the
mmsys driver instantiating the drm driver. I think we should apply the same
solution here, see [1] for reference. If you want to continue the discussion
maybe would be better


Thanks,
 Enric

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=667c769246b01c53ad0925d603d2a2531abd3ef2

> Regards,
> 
> 	Hans
> 
>>
>> Changes in v2:
>> - remove empty mtk_mdp_comp_init
>> - update documentation for enum mtk_mdp_comp_type
>> - remove comma after last element of mtk_mdp_comp_driver_dt_match
>>
>> Eizan Miyamoto (2):
>>   [media] mtk-mdp: add driver to probe mdp components
>>   [media] mtk-mdp: use pm_runtime in MDP component driver
>>
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 172 ++++++++++++++---
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  32 +--
>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 182 ++++++++++++------
>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
>>  4 files changed, 286 insertions(+), 101 deletions(-)
>>
> 
