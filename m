Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A08D3E40F3
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 09:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbhHIHnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 03:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbhHIHnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 03:43:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5B5C0613CF;
        Mon,  9 Aug 2021 00:43:02 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01] (unknown [IPv6:2a02:810a:880:f54:bc37:c53f:a9f8:ed01])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 99E751F42802;
        Mon,  9 Aug 2021 08:42:59 +0100 (BST)
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
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
 <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
 <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
 <CAOak1e_xw84Q+ikAn7TEqie00Sbv4Qpaax==jZ5MJVfPP1pf0Q@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <171db357-0d8a-6676-32dd-7c506708375c@collabora.com>
Date:   Mon, 9 Aug 2021 09:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOak1e_xw84Q+ikAn7TEqie00Sbv4Qpaax==jZ5MJVfPP1pf0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 09.08.21 05:23, Eizan Miyamoto wrote:
> Hi Dafna, thank you very much for spending time to review the patch,
> your time spent is very much appreciated.
> 
> On Thu, Aug 5, 2021 at 4:06 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>> +err_clk_prepare_enable:
>>> +     for (--i; i >= 0; i--) {
>>> +             if (IS_ERR(comp->clk[i]))
>>> +                     continue;
>>> +             clk_disable_unprepare(comp->clk[i]);
>>>        }
>>> +
>>> +     return status;
>>
>> There is an API function clk_bulk_prepare_enable to prepare and enable an array of clks
>> so you can just use it.
> 
> As per Enric's suggestion earlier in this email thread, are you OK
> with me making this change in a follow-up patch, particularly since
> the logic as it is was preserved from previous functionality?

sure,
I just give suggestions.
A follow-up patch would be nice.

> 
>>> -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>>> +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>>>    {
>>> -     struct device *dev = &mdp->pdev->dev;
>>>        struct mtk_mdp_comp *comp_node;
>>> +     int status;
>>> +     struct device *dev = &mdp->pdev->dev;
>>> +     int err;
>>>
>>> -     list_for_each_entry(comp_node, &mdp->comp_list, node)
>>> -             mtk_mdp_comp_clock_on(dev, comp_node);
>>> +     list_for_each_entry(comp_node, &mdp->comp_list, node) {
>>> +             err = mtk_mdp_comp_clock_on(dev, comp_node);
>>> +             if (err) {
>>> +                     status = err;
>>
>> You can get rid of the new var 'status' and just return ret in case of error
> 
> This seems like a nit (please let me know if you disagree), and it's
> also cleaned up in a follow-on patch in the series ("don't
> pm_run_time_get/put for master comp in clock_on"). Is making the
> change you are suggesting here something that should require uploading
> a new series version?

Hi, no, I am fine with it. No need for new version.


Thanks,
Dafna

> 
> Eizan
> 
