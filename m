Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21145363E36
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 11:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237839AbhDSJGw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 19 Apr 2021 05:06:52 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:45601 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237684AbhDSJGw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 05:06:52 -0400
Received: by mail-ua1-f52.google.com with SMTP id r8so3113509uaw.12;
        Mon, 19 Apr 2021 02:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pYAQv9R/phgpUveLuxldTF7qrZoEHYn+bAjQ1tW/S3Q=;
        b=eW3teduGgqU0RwCwMWvI5gXdaoFBBr8NHNERMa5UAGbA2/SBPF+8P6KU89FpqxlaTf
         7fJX12AokFQvcETxU738cSAJqhDQafLjwXO67RZWx37ki46jutKBG0l82RVYLMRjQE/g
         fpTPZZIlPz4q1kyOdelIB7kL0qAqnFUfXcPhMnJ8zLQMd1x4xWDlc/BKU3D7C3TZFV+s
         quNtpqfrC+a43mzvuU/9wNeRVS3p+VcVLl/hXrYhZc9G8JS77KoH/o3sA41/fb1uHQpG
         ABs6t9vkOz2RSdB9FBMetSRIGfKxlHfWRtFkTc6roeURGMCDXmP7/LSds4INfVGksYSi
         4W8Q==
X-Gm-Message-State: AOAM532jLi3MDWsHsqbKMTgrXvA5U73YrA5i6LcFlbVBUAi6fP8nyvHI
        V8ZqTLVP2pm6/+gB/C/jPkFv4tlo7vPc3AwRmiA=
X-Google-Smtp-Source: ABdhPJyexCu/xnvGaiaD/QseCFh9zkVcxhdvmq8Tpl2mhV2BuT95UGXWPWeOYnwMEonl8EvtG9pULqS3o9/i2tmUPhI=
X-Received: by 2002:ab0:6306:: with SMTP id a6mr6069337uap.2.1618823182429;
 Mon, 19 Apr 2021 02:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
 <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com> <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
In-Reply-To: <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Apr 2021 11:06:11 +0200
Message-ID: <CAMuHMdUzX0JgcBixX0X9JoZQkZ_aVQ1YCuUz-QKyTr4OLfsjWA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is
 not mandatory
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Apr 16, 2021 at 10:08 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2021-04-15 22:09:12 +0300, Laurent Pinchart wrote:
> > On Tue, Apr 13, 2021 at 05:53:46PM +0200, Niklas Söderlund wrote:
> > > When converting the binding to use the video-interfaces schemas the node
> > > port@0 was incorrectly made a mandatory property.
> > >
> > > The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
> > > receiver is connected too. Not all boards connects all CSI-2 receivers
> > > to an CSI-2 transmitter.
> >
> > Ports are properties of the device, they should always be there,
> > regardless of connections. It's the endpoints that describe connections.
>
> I understand what you are saying and if that is the way things are done
> I'm fine with it. As this was brought to light by a recent change in the
> bindings I wish to understand if this was always the case the bindings
> have been wrong all along or not.
>
> I only ask as because if we keep the port@0 mandatory there will be
> board files that needs to add empty port@0 nodes as we know they are not

s/board/SoC .dtsi/

> used. And as the media bindings are already quiet large for some Renesas
> boards I want to understand this before spewing out a lot of patches
> adding empty nodes ;-)
>
> >
> > > Fixes: 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > index 20396f1be9993461..395484807dd5ed47 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > @@ -78,7 +78,6 @@ properties:
> > >            modules connected the CSI-2 receiver.
> > >
> > >      required:
> > > -      - port@0
> > >        - port@1
> > >
> > >  required:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
