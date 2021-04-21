Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA36366AD5
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 14:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbhDUMbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 08:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239745AbhDUMbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 08:31:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACCEC06138B
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 05:31:05 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j18so66644792lfg.5
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i3Tcr4PCdw/0rP4VM3hbtBcRyZ8BylNBEH0Nga70ISs=;
        b=Db/mbQL5GHMY/2Na7XjhO6X9FlrNHhP+vcVTz46eckXqmV+FVXqyNYehAYH8l+ZC6z
         X26g2+ksd3DOLWloPJG95Eea7Nw/czs2jDOttl/5habmzQmx4l64CVmJTjCpBnCkfFf/
         S7PUP1KDUpDBUIrxJiM3IvSiSFe4npbAcrVqFoOJ9JiShDtGAKJiNLUs185zj7RB0xvw
         ulTPwGxThY2rWRIRsC0Klnh5jGTlkmLt0AuroFwkdWjJxjT9gHP4iGp71nAbT8vFLYim
         Yks6Oy07rFkMbHcuXye4gBtJmFZHTQuyAMyT4JoQpFbz3b9r8E/okHNZ+UaAWV2VIdxK
         ilXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i3Tcr4PCdw/0rP4VM3hbtBcRyZ8BylNBEH0Nga70ISs=;
        b=AtiWkeWyDk/2nOuCIV04PvwJ2WWVg4YGNCASC6mHvGAtm4D0b9/wlIc1kXRZ/nt080
         umjEQ6TLE0nEzcjlbJJ3QIBOCyXPW7s/FoC1p2+bouOSIgE3BAEBawO6eG5mVjnWEVTu
         dj/1SikW4bP3VSri0itbu5T2aPDDG5A78FcKmCgL/sYGZPZ+jNsgxOicOwnebLbI7nu6
         wh/xcQMlau3Sgihv9nowcrj1lOC0iGQaOIGDbuAAgR1uQ8SiB1T10NlaOLdCTm3IGRGJ
         XdBaKh5YIxvvtEdpU4Y9Ang1UYbJAgocsDEu4Ywz8QtNjfb1DX/5yK3fofDLjvcZQ7bR
         BRrA==
X-Gm-Message-State: AOAM530c9X36see47/tmgiawAtVFTAh5bOV8R9tvGTPviBYkaIGDe9Iv
        1RUufn56pFZZHBQOTG2tXzXLUA==
X-Google-Smtp-Source: ABdhPJw9RickldUu1hZROkFGOjkKFxNfUwCza5ewJ1NUNjTvkQ74YHXRa09ayNox8Um13FCug/guHg==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr18764470lfi.643.1619008264092;
        Wed, 21 Apr 2021 05:31:04 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c23sm197431ljr.73.2021.04.21.05.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 05:31:03 -0700 (PDT)
Date:   Wed, 21 Apr 2021 14:31:02 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is
 not mandatory
Message-ID: <YIAbBoqEAZONAYii@oden.dyn.berto.se>
References: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
 <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com>
 <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
 <YH/zyzfgpmXvkDpB@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YH/zyzfgpmXvkDpB@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Geert,

On 2021-04-21 12:43:39 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Fri, Apr 16, 2021 at 10:05:46AM +0200, Niklas Söderlund wrote:
> > On 2021-04-15 22:09:12 +0300, Laurent Pinchart wrote:
> > > On Tue, Apr 13, 2021 at 05:53:46PM +0200, Niklas Söderlund wrote:
> > > > When converting the binding to use the video-interfaces schemas the node
> > > > port@0 was incorrectly made a mandatory property.
> > > > 
> > > > The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
> > > > receiver is connected too. Not all boards connects all CSI-2 receivers
> > > > to an CSI-2 transmitter.
> > > 
> > > Ports are properties of the device, they should always be there,
> > > regardless of connections. It's the endpoints that describe connections.
> > 
> > I understand what you are saying and if that is the way things are done 
> > I'm fine with it. As this was brought to light by a recent change in the 
> > bindings I wish to understand if this was always the case the bindings 
> > have been wrong all along or not.
> > 
> > I only ask as because if we keep the port@0 mandatory there will be 
> > board files that needs to add empty port@0 nodes as we know they are not 
> > used. And as the media bindings are already quiet large for some Renesas 
> > boards I want to understand this before spewing out a lot of patches 
> > adding empty nodes ;-)
> 
> In my opinion port@0 should be in the SoC .dtsi, not in the board .dts.
> Individual boards can then add endpoints when the CSI-2 receiver is
> connected. Would that make sense for you ?

I think this is a case of pragmatism vs being technically correct, and 
of course 'technically correct' being the best kind of correct ;-)

Any of the two options works for me as long as we fix the DT validation 
errors that currently exists. Laurent seems to prefers keeping the 
port@0 mandatory and adding empty port@0 nodes to dtsi files.

@Geert: Does this work for you?

> 
> > > > Fixes: 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > > index 20396f1be9993461..395484807dd5ed47 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > > > @@ -78,7 +78,6 @@ properties:
> > > >            modules connected the CSI-2 receiver.
> > > >  
> > > >      required:
> > > > -      - port@0
> > > >        - port@1
> > > >  
> > > >  required:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
