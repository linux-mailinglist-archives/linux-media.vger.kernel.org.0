Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA7E372A7A
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 14:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhEDM5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 08:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhEDM5B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 08:57:01 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446A1C061574
        for <linux-media@vger.kernel.org>; Tue,  4 May 2021 05:56:06 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id o16so11019374ljp.3
        for <linux-media@vger.kernel.org>; Tue, 04 May 2021 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ZEIfQIWplyJsRjhAB9oJ0mVxCOsZMQEFoeb6pJvTqk=;
        b=P2xiwxC9N7JTjuvp40yQtJbPylijakcYl1ZZ7HGbdTWla3UaPkanl5AEiQcR4rhrM3
         WjaO3gBAyqKEHCnQ34sF3SBIAPXIuO35j963dIxZRlM7Nb+22HonRKQL2nb6aHKYp/gS
         I/5u/1nThzvX3AOyBptLIhReutJxeW15knqcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ZEIfQIWplyJsRjhAB9oJ0mVxCOsZMQEFoeb6pJvTqk=;
        b=i7vIgWJKEArujpLSqECt5CETBCksDNtFIfqWR3F3Puo+3+COTog/kozj82X9sI5teI
         wWMIMgvvSdPNRmWUo4f9rIrvMeVXRg2yAxwFAfXs5yeZSM6v4ZtBs/RlfV73W+kunaiQ
         aCHOHYx/DHi1XHiHAu2daDRQKJ+hQSKNZeW84kuiFfnwfIN9WNmZSQwN7UyPs9vvX3LT
         TW4pzXdLTTyhwUzPxJdYdICm8UwSJePUSIr8DaOk2jHXFrjkysC7kIlNz3mFp1Fcu5Xi
         LebEesUqkjWQ491lEa/hc6xU3TWOUiDmS4owsfJLV8scT44ifyGtOHMwbt/fvuajBUrL
         qe4Q==
X-Gm-Message-State: AOAM530LBtiJvE9TiMJzWiDtGMKhprTw3f5kD6UdHX1lAktPlHfSE007
        JFWg1GXFJAxdXrAZj026AeGIphAN47kksw==
X-Google-Smtp-Source: ABdhPJyopazp1Rqyn31RMoXnYbovJWPW0+/o0SKi5tJoA48Aedv/5ozBQOPHuIoPYdnCOUJjPV1BrA==
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr10341474ljm.222.1620132964602;
        Tue, 04 May 2021 05:56:04 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 26sm1207413ljv.140.2021.05.04.05.56.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 05:56:04 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id j10so13080154lfb.12
        for <linux-media@vger.kernel.org>; Tue, 04 May 2021 05:56:03 -0700 (PDT)
X-Received: by 2002:a05:6512:108c:: with SMTP id j12mr16512793lfg.403.1620132963589;
 Tue, 04 May 2021 05:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org> <20210427111526.1772293-9-acourbot@chromium.org>
In-Reply-To: <20210427111526.1772293-9-acourbot@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 4 May 2021 21:55:51 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
Message-ID: <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] dt-bindings: media: document mediatek,mt8183-vcodec-dec
To:     Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Tue, Apr 27, 2021 at 8:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> MT8183's decoder is instantiated similarly to MT8173's.

Gentle ping on this, could we get your Acked-by for this minor change?

Thanks,
Alex.

>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 06db6837cefd..a2a2a9e2ade3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -9,6 +9,7 @@ Required properties:
>    "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> +  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
>  - reg : Physical base address of the video codec registers and length of
>    memory mapped region.
>  - interrupts : interrupt number to the cpu.
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
