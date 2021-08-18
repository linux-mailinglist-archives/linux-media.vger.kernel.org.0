Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07A73EFE33
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238405AbhHRHve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237962AbhHRHvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:51:33 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AA2C061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 00:50:59 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g13so2705354lfj.12
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 00:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iel16lsj6RMRR46Er5XdYCOwg9LzHhn4KhXWnbYd6I8=;
        b=Z6UL4g1ShVuS90FHgfgXoDI0ewpCEgBdf/rZjBW7xBbfy2iaS+ch/kpFLuCG76wgsg
         XjzJywFmHZyLb/7h1BhV8W++8I6HRHNqOXU1z09Ff1N1nsKiRPXfUPFbtuK5EegZ3NNL
         qUHLFEliYdrejtMHhNSu19/d3oLe737Y9Z0JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iel16lsj6RMRR46Er5XdYCOwg9LzHhn4KhXWnbYd6I8=;
        b=fotSiHXLYqnSG7I4LOA/zKQ1FiS/aJznRdKox4rykzWPYuR7j9pU+S1XO3YZvCslp7
         Ny7PM7njPf2k+hGbT73MsSz3wlhoHTxu5+0+C43isnUh8Cahi5DBLflh36oC8s40H0zx
         YcnDq8lbjORGbO79xeXXK1oQwNmu9yvcwclOLrtBG2xrL5KZHd4aH2x7JU3+DN6RfxyR
         1GFxQ8G6VlIoehdb6aiMxPVL5Z9ew1km15DEaIoG8JtxtVhL+ArMhl9SyslASACtAl5O
         1fywqNsohSBlUl1nXXH/Pr0gMVXJZqiY56ZsQTbWCEvh8Gvo73M37fUqT/J5a0RLCHlL
         DKVQ==
X-Gm-Message-State: AOAM531OosVBhNBRi8iMxN6kb8su5kV1CTptwVdhHAjtn2Hiz1OHxLij
        OuT63qkM7dM6Gob9rgYjdyJkTMZ55PwpoA==
X-Google-Smtp-Source: ABdhPJxiDT0yHjQqB2SUVtZsiWhN+MPG6PEFSDFyZ2pJ23ktksBOMVayFrdqwN3TfiOO6NEoR2jX0w==
X-Received: by 2002:ac2:4ecc:: with SMTP id p12mr5338878lfr.452.1629273057528;
        Wed, 18 Aug 2021 00:50:57 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id r19sm446822ljn.139.2021.08.18.00.50.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:50:57 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id h11so3388899ljo.12
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 00:50:57 -0700 (PDT)
X-Received: by 2002:a2e:b0e8:: with SMTP id h8mr6695165ljl.189.1629273056836;
 Wed, 18 Aug 2021 00:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com> <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
In-Reply-To: <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
From:   Eizan Miyamoto <eizan@chromium.org>
Date:   Wed, 18 Aug 2021 17:50:39 +1000
X-Gmail-Original-Message-ID: <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
Message-ID: <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To:     houlong wei <houlong.wei@mediatek.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wenst@chromium.org" <wenst@chromium.org>,
        =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <yong.wu@mediatek.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?= 
        <minghsiu.tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Houlong,

Thank you for your review on this series, it is much appreciated.

On Mon, Aug 16, 2021 at 2:53 PM houlong wei <houlong.wei@mediatek.com> wrote:
> Is your removing "mediatek,vpu" necessary for this series "Refactor MTK
> MDP driver into core/components" ?

Removing it is not strictly necessary for the series to function, I
will re-upload the series and omit the following changes:
- [PATCH v6 8/9] dts: mtk-mdp: remove mediatek,vpu property from
primary MDP device
- [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement from mtk-mdp

Do please let me know if you meant something different.

Thanks,

Eizan




>
> In some MediaTek projects (not upstream yet), the device-tree node name
> "vpu" may be changed to something like "vpu0", "vpu1" or other name,
> which depends on the implementation of "mtk-vpu" driver. We can specify
> the different phandle to "mediatek,vpu" in .dtsi file. If we use
> of_find_node_by_name() to get the vpu_node, we have to modify the name
> string in different project.
> If the answer of my previous questions is "No", I prefer to slow down
> the modification of removing "mediatek,vpu".
>
> Sorry for late reply.
>
> Regards,
> Houlong
