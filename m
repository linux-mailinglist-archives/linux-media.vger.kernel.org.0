Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 694223ADA6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 05:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387459AbfFJDcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 23:32:22 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38151 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387462AbfFJDcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 23:32:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id s15so4240119wmj.3
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 20:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aB/CXMwsJOLPR4IkBpKLs3rzXiAB5Hq8Pmg82KTdnpc=;
        b=Y4/jV4x/QxbzMXVAb5TMOW4WdmEW5sviWbYsTmRNFNlD69uTDhv6J8R+yhmkWCVyBN
         LQZ/CFTN0p8CmCFVXPT9wvG8NPn2HZPdjK3T0gfr78v6nandp9hVA0mOohamnOS3xAic
         5Zjn4PE8b2O3HGvcCHt8K8jeOmxLL99cpm5f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aB/CXMwsJOLPR4IkBpKLs3rzXiAB5Hq8Pmg82KTdnpc=;
        b=aVzOKWvNA2zzhWi0PIq402Yo5/IC3XOe/GwXXFtQCvaQ29PVuxH3AXyUpOY9YzAKdV
         Fu6K0YIjc9B3itDy+JzpEFcsMFGkgzqowAEUZIZYW20jVci8nSYtvJTjccJgUn1iPJfl
         qFd2eIcpay63TJzZM8OIltU11xYdQrA5DbCz4JSoRW2WD6JwgDXGWN80DSdHEt2OhcEw
         5aEdaoUs84r2pIyFcuIzTURwpV6ZzJZD13u0xj//h2fFRTLElt3vyifhwQgifxOzEuGZ
         iBwThGzZKJjVOG7ogejmZ/8AJI3pT2W7MO9jmtUCsDwxY029n+wSqPv+otDzI0pwp07E
         fABg==
X-Gm-Message-State: APjAAAXv/3mFTo8+UlZMWuPG/a6Cp/taO1VqZSgGVJt0otEP9ihrx8GD
        Hpm2okiXtGNX+bmFnOpmJ9S/yo/ghM51sK5m15nk+w==
X-Google-Smtp-Source: APXvYqxQJliHEcKaKIvUY9ONOqr7UkNdbKO1DVUr+ac8CojHhnvVRkYyq2OEzprCcxtZsq0ucGzSaD6jwh7YT2ESHRc=
X-Received: by 2002:a1c:2bc7:: with SMTP id r190mr11435752wmr.174.1560137537307;
 Sun, 09 Jun 2019 20:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
 <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com> <1560134057.28527.5.camel@mtksdaap41>
In-Reply-To: <1560134057.28527.5.camel@mtksdaap41>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 10 Jun 2019 12:32:06 +0900
Message-ID: <CAHD77H=vuPi2Rj4Mw-CQ2=UYX7YnS8w8FpUk0QTVxNUVLWKbJg@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
To:     CK Hu <ck.hu@mediatek.com>
Cc:     Stu Hsieh <stu.hsieh@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi CK, Stu,

On Mon, Jun 10, 2019 at 11:34 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Stu:
>
> "mediatek,mt2712-mipicsi" and "mediatek,mt2712-mipicsi-common" have many
> common part with "mediatek,mt8183-seninf", and I've a discussion in [1],
> so I would like these two to be merged together.
>
> [1] https://patchwork.kernel.org/patch/10979131/
>

Thanks CK for spotting this.

I also noticed that the driver in fact handles two hardware blocks at
the same time - SenInf and CamSV. Unless the architecture is very
different from MT8183, I'd suggest splitting it.

On a general note, the MT8183 SenInf driver has received several
rounds of review comments already, but I couldn't find any comments
posted for this one.

Given the two aspects above and also based on my quick look at code
added by this series, I'd recommend adding MT2712 support on top of
the MT8183 series.

Best regards,
Tomasz
