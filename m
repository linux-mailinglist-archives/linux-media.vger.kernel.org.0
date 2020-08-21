Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E42824D293
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgHUKfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgHUKfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:35:36 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8431C061385
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:35:34 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id n128so1149311oif.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EfdWudG0h0q5CaIQdMWXtuPOgO5LF8y0CpSBc1t8Vmo=;
        b=lXZJddLsySTWLGE+UKv+3I86NhQqIIkV25M4nrFxsyNqk9bRGqRcr/4gkY5vkypS3r
         wOPaCUxWj0gLJv835VT/xORv9cX8tCUo6OPSPVTSyJeHT2tLG5KU8SaeHkzuAU8g9g3P
         sB8dCJJ+xxPfWuX2xnQJgFAjw346ICZ01pnVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfdWudG0h0q5CaIQdMWXtuPOgO5LF8y0CpSBc1t8Vmo=;
        b=Bd9fTA5fqp4k5tSHCCc1pW7mDNnNSvlzxdM5vAXervBHfmWiPeKtfdqkli2GgLFl59
         BEZ3i7RlfyVOiX/lYlU2lskhNPI18FZNkioOIaYYmo8jHNW1iNg20/AhwwQmIqsWk+8f
         qIEMFR0JAniLcKRkhOVHpuQrkwlFnf1XEac2aXXKXNE0/bKlXex41sQ4ZCo0u5X1rAup
         Yhc3oxUasUkAaup/jGXzizhDPxrEMS4Txnp+oUnCHT40V91wWZsDJZ+quSo3JU6EzCTG
         Lao+eTn2TEMaS4CbbDWoP9kze4r6lQR/d6GBSJayD8oiykbspAgq75lLXM966pfpHuWY
         +o0Q==
X-Gm-Message-State: AOAM533tFTx+/Nfb/jk8W25S+llR7R/xfXWLvwNCHkN8f4yNU11sJncB
        F2bjoNlpD+7LzTj2QeUmtiizBK6PmwIdCO1p
X-Google-Smtp-Source: ABdhPJzlq00vgK54Sp/gEgSLV9ilA/LfAZSvZaEi2c8MJUratLyJjBI5sMq/vT4JfzJFHolhV5JQGw==
X-Received: by 2002:a05:6808:3da:: with SMTP id o26mr1235036oie.3.1598006133076;
        Fri, 21 Aug 2020 03:35:33 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id z63sm292087otb.19.2020.08.21.03.35.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 03:35:32 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id b22so1120850oic.8
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:35:31 -0700 (PDT)
X-Received: by 2002:a05:6808:196:: with SMTP id w22mr1229658oic.55.1598006131352;
 Fri, 21 Aug 2020 03:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org> <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
In-Reply-To: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 21 Aug 2020 19:35:20 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXZ4WoRcdpO42RAbBJZGdWteE76=jMM2HjTfMukUYf4Qg@mail.gmail.com>
Message-ID: <CAPBb6MXZ4WoRcdpO42RAbBJZGdWteE76=jMM2HjTfMukUYf4Qg@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 13, 2020 at 3:20 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> On Mon, Jul 13, 2020 at 2:09 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > The mediatek codecs can use either the VPU or the SCP as their interface
> > to firmware. Reflect this in the DT bindings.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index b6b5dde6abd8..7aef0a4fe207 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -19,7 +19,9 @@ Required properties:
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > -- mediatek,vpu : the node of video processor unit
> > +One of the two following nodes:
> > +- mediatek,vpu : the node of the video processor unit, if using VPU.
> > +- mediatek,scp : the noode of the SCP unit, if using SCP.
>
>                          ^ typo / extra o

Fixed, thanks!
