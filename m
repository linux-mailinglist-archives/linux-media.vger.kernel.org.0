Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D964199C3
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 18:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbhI0Q6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 12:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235425AbhI0Q6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 12:58:00 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0339C061604
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 09:56:21 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id a13so17261718qtw.10
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LxG4HPV4FXiyd9Nx3Il3K8msxXap3JQb5VLOGuZR7VY=;
        b=lg1n7FUxcNqWTq5zo6ikpYbbg1qh5zQzLTJ8zwUneGdbsMi0M8mPV5zE8+Xcnd4HAQ
         gP4NyCqJ20CSOR+CPqKX/7qhd/sNzEYzCKw4BD4XJoCDHPDw+ma36rX2v5+8bAAdsQXE
         1U8inMUrBNXMZLxmcTjggGzHf9MKW1SPst+Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LxG4HPV4FXiyd9Nx3Il3K8msxXap3JQb5VLOGuZR7VY=;
        b=tkY8e+JV8ElNjLExlYpk/6oU27seSwGvhhBtG6U4RsLan6CShGnZfjtRBRYebJWkkA
         LxP5GbuIQdZo/o78n8woCtK5JHvk7JxiryduWaGvnImTvQxIWtfererwhM722O0wZVzR
         XWPmMvDah6MsbZM2QPQlMnm/TrxS8eKjz2by6YLd86wXLFEwHLQKyh84L0CnqmqJzxwn
         jKzBrgI+GWP7xqA4T0/OqstUAFF4bn2GNIxr/S0Oa3xnVEPSZzf7QucQ+OCBr0j1o280
         ySEkxlXqvVQM7Kxsuz9XMd7iLVq2j60qHbXgesEAcfOs/uvj7XOJYC7FuTVJTXAsM+Je
         X/Hw==
X-Gm-Message-State: AOAM530G3dTXOLruv81KRNiaXwHhFYUZMyGaUpeF8uxjx895sl46D1ty
        uyubqNFkX1b34sKW8EbHqONJ4rry2z20JlhRhwstXg==
X-Google-Smtp-Source: ABdhPJxks+ildD0Q8dRhHE4wWhlya4id4tdrl9iWX9N3kBCiqQIO9AuMcdOLdKpmnSNIRpILzZVNT9+rwNTdRNHeUGM=
X-Received: by 2002:ac8:1c6:: with SMTP id b6mr855002qtg.221.1632761781171;
 Mon, 27 Sep 2021 09:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
In-Reply-To: <20210901083215.25984-1-yunfei.dong@mediatek.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Mon, 27 Sep 2021 09:56:10 -0700
Message-ID: <CAC-pXoNT8AFA2j1DiD9M_uGb92fVcukTGDKVURaGjwpPstcwqQ@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei,

> This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> "Mediatek MT8192 clock support"[2].
>
> 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> to add stateless decoder. Otherwise it will cause conflict. This patch will be
> accepted in 5.15[1].
Just a few basic questions. What kind of "conflict" are you expecting here?
Are you referring to kernel "5.15" here?
Probably not. If yes, then that sounds strange to me considering our
current kernel uprev plans and current kernel used for MT8183.

> 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
>
> [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
This link seems to be no longer available.

> [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
