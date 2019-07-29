Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2130796D7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 21:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390634AbfG2Tz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 15:55:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33688 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404229AbfG2Tzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 15:55:50 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so59788738ljg.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 12:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5AIV3bhDTMo2KA4dIrmXwLSUtBSIQ7oOV6EAOsD1k0A=;
        b=rwAinQNsrHsXyutJABCo3H9CAJc9UBVAAtCGiQvTGPFVqIK879udYEVtNolfL0F8qI
         D3UAnSrBHg6mVbCcmJQZWFIuDEf3Qbw5h0k7HwmG4Q/+S8xyNODugp/kHHg91vNnmkG7
         ZE5i+WI7TBpu9+0cZrg8rENYgOCj4KYppcxSfBqjhKku1HcOurq7QvW8fhTVgSd9/w6p
         hjLxYkJnXteTIM5pqQ/X+PlJ5+fs6sXxBA3VL4aKdFZe9r/kQLAVb7CLGnNpKjcd23Mi
         9ryExjkHAGOSAPH4RfURTNmND2CsU4oa7S/9gNBqD0Xv3DwG/dUR7PUVX3M8ZbPwQNt+
         mnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5AIV3bhDTMo2KA4dIrmXwLSUtBSIQ7oOV6EAOsD1k0A=;
        b=kPcpfTEExoYTNhKnPgNdNLKZ4A3DB/8LIBNwnYvSeNM1Q6Iffs2oKH4Jt50xmiNdT2
         qghPgzERbqHqbbD69AR0azNw7SXqPWxv4lwEuURCdYkTSwg0te5SKgW6itH8nCayYozM
         a8J+rxKqDqP5lBeZ1cHd5a6MfOIWIEPewuhoWUg0t7WMNKOzprZ/sP+ikbIU2txB1iJl
         JdwD43J0g0IrvFLmPO5uofzLrGGI+MUS8N5/iI6wed1Iy+gNlCjkketak+sFrgb+viqM
         6z5pXr8DRQzoT/zxLLOWxPBl8k6h9+qFqZowPxgcpy4uR80JxU2e76+Z6P+49SD8YvKS
         O3Nw==
X-Gm-Message-State: APjAAAU6oGKNxbBl3CYhXCyIVtV08eDIFbYLG/3wuQctF2Tm5tP0kJbC
        TSFGmf4tHGi2MVr9sGelMLc=
X-Google-Smtp-Source: APXvYqyI4jdiPFxEKXAoJCx+bBq8QVKIIwFJ54C0wjZO0MWQirKCMKXIY7bOlSXh5TMGWEHJITlOeg==
X-Received: by 2002:a2e:9048:: with SMTP id n8mr12238028ljg.37.1564430148831;
        Mon, 29 Jul 2019 12:55:48 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id v17sm14577614ljg.36.2019.07.29.12.55.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 12:55:48 -0700 (PDT)
Date:   Mon, 29 Jul 2019 21:55:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190729195547.GG3186@bigcity.dyn.berto.se>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
 <20190712071703.GE9317@wyvern>
 <20190729074355.urlf77ihukgnk6ov@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729074355.urlf77ihukgnk6ov@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2019-07-29 09:43:55 +0200, Simon Horman wrote:
> On Fri, Jul 12, 2019 at 04:17:03PM +0900, Niklas Söderlund wrote:
> > Hi,
> > 
> > A gentle ping on this patch. I assume if it could get a ack from Rob it 
> > could be taken in thru the media-tree?
> 
> Given the lack of interest I think it could also be taken through
> Geert's tree.

I would be happy if that could happen thru Geert's tree.

> 
> > 
> > On 2019-06-12 23:12:41 +0200, Niklas Söderlund wrote:
> > > Renesas media binding documentation files uses a naming schema of
> > > 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> > > pattern.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > ---
> > >  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
> > >  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
> > >  MAINTAINERS                                                   | 4 ++--
> > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
> > >  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> > > similarity index 100%
> > > rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > > rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> > > diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> > > similarity index 100%
> > > rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> > > rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
> > >  L:	linux-renesas-soc@vger.kernel.org
> > >  T:	git git://linuxtv.org/media_tree.git
> > >  S:	Supported
> > > -F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > > -F:	Documentation/devicetree/bindings/media/rcar_vin.txt
> > > +F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
> > > +F:	Documentation/devicetree/bindings/media/renesas,vin.txt
> > >  F:	drivers/media/platform/rcar-vin/
> > >  
> > >  MEDIA DRIVERS FOR RENESAS - VSP1
> > > -- 
> > > 2.21.0
> > > 
> > 
> > -- 
> > Regards,
> > Niklas Söderlund
> > 

-- 
Regards,
Niklas Söderlund
