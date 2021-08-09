Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296A73E4126
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 09:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbhHIHx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 03:53:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49546 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhHIHx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 03:53:56 -0400
Received: from [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01] (unknown [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DC7831F4223F;
        Mon,  9 Aug 2021 08:53:34 +0100 (BST)
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
To:     Eizan Miyamoto <eizan@google.com>
Cc:     linux-kernel@vger.kernel.org, wenst@chromium.org,
        houlong.wei@mediatek.com, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        chunkuang.hu@kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <0aff1abb-734f-c714-6ecc-c906862255c3@collabora.com>
 <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <014b8075-8588-d741-e6f2-edc0567e8c8f@collabora.com>
Date:   Mon, 9 Aug 2021 09:53:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOak1e8n6JpNKODfM57OTtbCNz8UBbj+wefwipVWP_Ep6SHmHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 09.08.21 05:23, Eizan Miyamoto wrote:
> Hi Dafna,
> 
> On Thu, Aug 5, 2021 at 4:40 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>> +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>>
>> This function can be static
> 
> If it's all the same to you, are you okay for me to make this change either:
> - If upstream requests changes be made to this series, I will include
> this suggestion
> - If the series is accepted as-is, I will make a follow-up patch
> 
> This is to reduce workload on reviewers having to re-ack changes for
> (what I hope you agree is) a nit.

I think you can keep the review-by tag of the reviewers since this is just a nit.
So sending a new version won't need a re-ack from the reviewers.

You can send it also as a separate patch. I don't care too much.

> 
> If you don't agree, I will happily oblige and make the change and
> upload a new version of the series.
> 
>>>        for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>>>                comp->clk[i] = of_clk_get(node, i);
>>
>> that iteration can be replaced with clk_bulk_get
> 
> As per Enric's suggestion in response to "propagate errors from
> clock_on" in this series, are you okay for me to make the change in a
> follow-up patch?

yes,

Thanks,
Dafna

> 
> Thanks again for your review,
> 
> Eizan
> 
