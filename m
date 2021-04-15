Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97014360064
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 05:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhDODZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 23:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbhDODZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 23:25:06 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AB7C061574;
        Wed, 14 Apr 2021 20:24:44 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id c15so19011651ilj.1;
        Wed, 14 Apr 2021 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qEo3mthyR3dOnmcZMQVvD2ZSwCGPs4Eje1etCG0w1Q=;
        b=PBPl4AUojHm+9CmoViiO5eWVpd2gZgf93mXiISsejyDN4BJ3ByvjBrPuGm68e+7W75
         5CLsWIlzG6OsnxjpBCP2FJ06XBoWYySLdlw3EOCCH5FaiHnjGZBQ3xFSoDSZpLW7kC4D
         l1+a7/XDCAwIF46e22uzbJs11P1ok+mSV4RRNU/bBlwukoC0YHxmR26KYnPCY723GenC
         KMV366uSRxQV9XQBRceX4DhtZusDKnLqXhZkbzGCahOS1eL1nypMWF4MpF7KAbzTSgG3
         fJ/2G9M8ebPBg4zsdnBNHF6gKZS9MiFPnBfuMzdYfkv3Qi3f5ZobQ2WbRDbEOJB94NPa
         zmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qEo3mthyR3dOnmcZMQVvD2ZSwCGPs4Eje1etCG0w1Q=;
        b=bBsqdBLWuawD1cNTpgRQcW/9dXOpENPUUh9Qi5WxCB8LsUPIueevqJ50blQNyDxGJY
         ZUu8yauB78PAI4WvTr52C9rO/yiiYdlCw+OmHBWA6oUsBa1Zou3qgTFMLWAoWUFr0hCE
         TGuSN2zXWyO5J4pha9UICX5siyddkqhDCrZAB1RyuLPG+qG1FcvG64xe07/zAItYQTJJ
         fyIc8q4QoOcgJDROYN7QWEF8po0NlNa7LZ/WwlATYwq0yztHC2nw+LDrhSLrGGHd9Wk2
         c6D5xJggGBYs7WfgCYt+35HRZKipVMXs2SxcdEaQJC/dxXr2U3GtplMkVUubfuB2m/ws
         0w3g==
X-Gm-Message-State: AOAM53346GlYKzuHpuxRpeOeCqMJHI5lgrk+xSdDHLwEf0xpiKXyIIzb
        CA635175dK1dfcaMl/y0K6ccJHqqR33toJLxBy4=
X-Google-Smtp-Source: ABdhPJwsC2fqSbm+ZcKDH7BP+UiKQX3ja0N2rwdXSTWKywzbyG3ZXx2KlpXuFVkWa+UICmCz9x4AOa8WUC8d3aDaYHc=
X-Received: by 2002:a05:6e02:e0a:: with SMTP id a10mr1070085ilk.271.1618457083879;
 Wed, 14 Apr 2021 20:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <1618383117-17179-1-git-send-email-dillon.minfei@gmail.com>
 <1618383117-17179-5-git-send-email-dillon.minfei@gmail.com> <9f8f3d55-b3f3-54d6-9143-5d676a21c901@canonical.com>
In-Reply-To: <9f8f3d55-b3f3-54d6-9143-5d676a21c901@canonical.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Thu, 15 Apr 2021 11:24:08 +0800
Message-ID: <CAL9mu0KB9cm6khKzftaW=X+RGkBEPEnRWFPHVaxLaHrQEzOGKw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: add dasheng vendor prefix
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        krzk@kernel.org, linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        festevam@gmail.com, prabhakar.csengg@gmail.com, mchehab@kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 9:01 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/04/2021 08:51, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Add vendor prefix for DaSheng, Inc.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> > v2: new add
> >
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> This should be the first patch in the series.
OK, will place this patch at v3's first. thanks

Best regards
Dillon,
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
>
> Best regards,
> Krzysztof
