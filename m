Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5652F99B2
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 07:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732389AbhARGGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 01:06:14 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60525 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732405AbhARGF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 01:05:27 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id A121A1677;
        Mon, 18 Jan 2021 01:04:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 18 Jan 2021 01:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=8
        Y5aub9ECMRXXD0kdJTyQjccPhkVlbJUuEjFiWgNNz4=; b=FW9Q+Q1hmBudxtvHu
        K1pX5N/+bdo67npyezsorriAB+qcHGL1259UuyXmiAKsSHxtZGYsY+daPXzS5hmh
        b7wbs7z0CMY5QSpNyBC7Wn0qqr4fyXnhmrddNa+WifGbdzGNW2fxUOlVtmwi5oRl
        G6FeMrZoW2fuPXkLBqMy4xtElpRwxFMhqJIHkcQX3MPXk2ine7pRqjpDykAnS8x2
        0VJt1dJBSxB6nWegBrz87NXobUuYeEJ8NaTqJjPGPJvM+ahJtr6M2naFYIuPjq5p
        ifENKoceZvTDJyp9FTnJT9KRLWiF410yx5PG+DG9YgnoLqvAcGiamhoYJ41oi4FO
        wC0Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=8Y5aub9ECMRXXD0kdJTyQjccPhkVlbJUuEjFiWgNN
        z4=; b=F1Fs+zq5tNE66BmrfNY9xlq7/BoBiILEIYRDLq2FX7sBV/WwIQ/K/5uOD
        mpJwZQHiUhprFDO7qoFP/eOcjsi5XM64Wbv2kW7ULiVxaPYoNfsRPvhyAiqrjY4P
        aqWEbV62A9DNTFoAHpB2YvHo7P3tg0JSaBiqE0etq435a9bwAyxzrwRk++aGEnc2
        cmykKIqdNjgEtIDRH11/tFOrtb+MnKZoR6aHEVFX90VLCi7jZ5svQzXoM1O9UWCz
        y06Pj5BVOFPyVU8KuWoXQc1hKjyhC40JC11baPoFA1z7rAsrQSEXxdvBJZojKWgg
        9Rc+VTm2j7ZnzIkHcAWcIiGNxjqZQ==
X-ME-Sender: <xms:5CQFYKE0a4beRbsI98SNYL2RU2600YPS6LbCwH14BC5_T-J63ZqvrA>
    <xme:5CQFYLUqUPdZKmEK0DYX5lX-NceflF_acekv6EIq3eg79OFmLpHH_ELJajDh1p8hH
    Qm0efW5tgOX5yPuNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:5CQFYEIlvZ8LCHfGN94Etik6384JqyfgOBN1cvvvCEQJUCQlmTwP5g>
    <xmx:5CQFYEGVvcxa6hzOdPlRugVlf4Zcz952mDQfFRm9RBckz_zQxwrQlA>
    <xmx:5CQFYAW3ALPjGTOcduaieWnff4_d9C1qT8Y1cDOwA04HxtI1XiVCyg>
    <xmx:5SQFYKfSXRGUNdTEQafVnHPa0dyeIksSsApQLeOmQ3JjnBU-s-ub-w>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 289B5108005C;
        Mon, 18 Jan 2021 01:04:20 -0500 (EST)
Subject: Re: [PATCH v2 0/4] media: sunxi-cir: Cleanup and power management
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20210118060048.22267-1-samuel@sholland.org>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <60db28fd-928e-a735-d6ef-6c6cd04bb289@sholland.org>
Date:   Mon, 18 Jan 2021 00:04:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210118060048.22267-1-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/18/21 12:00 AM, Samuel Holland wrote:
> This series cleans up some dead code in the sunxi-cir driver and adds
> system power management hooks.
> 
> ---
> Changes from v1:
>   - Unregister the RC device first thing in sunxi_ir_remove() [3]

I forgot to add:

Acked-by: Maxime Ripard <mripard@kernel.org>

from v1.

> Samuel Holland (4):
>   media: sunxi-cir: Clean up dead register writes
>   media: sunxi-cir: Remove unnecessary spinlock
>   media: sunxi-cir: Factor out hardware initialization
>   media: sunxi-cir: Implement suspend/resume/shutdown callbacks
> 
>  drivers/media/rc/sunxi-cir.c | 169 ++++++++++++++++++++---------------
>  1 file changed, 95 insertions(+), 74 deletions(-)
> 

