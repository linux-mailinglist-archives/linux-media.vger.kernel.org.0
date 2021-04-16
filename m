Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACEE361B16
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbhDPIGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 04:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239068AbhDPIGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 04:06:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC8AC061574
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:05:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x19so13015343lfa.2
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=T/GkAnca9gBf511+UOP69s2zUlqQA3ka9GPh9sfgQbc=;
        b=Td0hNryxzo4/5Jjil+l1dVCEn0uaPVRuHVqlNzciYKmWWT1rNLYq4ak104sOE9WRc4
         mhFCBnLttOOlqSSKdogpXcJfMpSaKvGWT9/z7+kWpJT+UAmf39LVqETI9YUwbX5fEgEn
         UKJTLpFk2OyiRyFTStGN/nJVp1jY+6W3uLyUqGK2vI5lqvk7IUqlnLEKP8780ju3Kh9Z
         NnrrY9aEWc94jGkrN3ULAk+DeOvYINJJk3poGhVJGuBrtRGkL4/bzksUNZbnraXdu/+x
         2ALROintHs/GC9/dvlH0TyiBWiKhM9QqRrHxNFBRRX+6O1PgYiknhYaykgfvWtM4MTaJ
         Fy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=T/GkAnca9gBf511+UOP69s2zUlqQA3ka9GPh9sfgQbc=;
        b=kij/9Bg+GXxavoA0pBBshimSawtRTDmCmU3vO5S4tbrbVWeZ524PaXi5yS1NlSVJZv
         RU5G7EYKldSD1D8KnmJpz61q0I15Gar7pyVerceizrr6efLuehWql5Epw/UOsLkFh+RE
         6ZvUyVFu0JaNkHGGVvimmJCAvnLeHbZtih+h/sStpY8TKFAnK3eTijbswmk7ORbl209e
         MS9k5blWCFSPMZ7Ci1YWuPBuRDo1MSiN1Mr39HhELSF8WsltSn3yWDiu+iZVJYPZt1ag
         vBP/BuC00tcikHTVKiF8jsUhuGovprNm4CDAqxCTxiCMexqqWDv7IB40sJR+4/zdduO3
         3e3A==
X-Gm-Message-State: AOAM531aO7tlCSsBQTL0HvDi+xdCrDK8tRIV6Foyv13ZaXnj3UresDhA
        QhKnfX900X1RZ4xnie5CtvSzJ4WdKZVUFw==
X-Google-Smtp-Source: ABdhPJxo5PcSFtDcjWkfeg3gfNEGkt4GXmGFhUuXDxFdZR1rssvChhMsKWdPLsfmhE+8PdTKTsgxgg==
X-Received: by 2002:a19:f807:: with SMTP id a7mr2092989lff.437.1618560348314;
        Fri, 16 Apr 2021 01:05:48 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z22sm929311lfu.112.2021.04.16.01.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 01:05:47 -0700 (PDT)
Date:   Fri, 16 Apr 2021 10:05:46 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is
 not mandatory
Message-ID: <YHlFWvVBps2vYnPM@oden.dyn.berto.se>
References: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
 <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your comments.

On 2021-04-15 22:09:12 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Tue, Apr 13, 2021 at 05:53:46PM +0200, Niklas Söderlund wrote:
> > When converting the binding to use the video-interfaces schemas the node
> > port@0 was incorrectly made a mandatory property.
> > 
> > The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
> > receiver is connected too. Not all boards connects all CSI-2 receivers
> > to an CSI-2 transmitter.
> 
> Ports are properties of the device, they should always be there,
> regardless of connections. It's the endpoints that describe connections.

I understand what you are saying and if that is the way things are done 
I'm fine with it. As this was brought to light by a recent change in the 
bindings I wish to understand if this was always the case the bindings 
have been wrong all along or not.

I only ask as because if we keep the port@0 mandatory there will be 
board files that needs to add empty port@0 nodes as we know they are not 
used. And as the media bindings are already quiet large for some Renesas 
boards I want to understand this before spewing out a lot of patches 
adding empty nodes ;-)

> 
> > Fixes: 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > index 20396f1be9993461..395484807dd5ed47 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > @@ -78,7 +78,6 @@ properties:
> >            modules connected the CSI-2 receiver.
> >  
> >      required:
> > -      - port@0
> >        - port@1
> >  
> >  required:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
