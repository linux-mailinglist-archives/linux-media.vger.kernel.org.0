Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C882C9047
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 22:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbgK3VuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 16:50:20 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46592 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgK3VuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 16:50:20 -0500
Received: by mail-il1-f195.google.com with SMTP id b8so12808785ila.13;
        Mon, 30 Nov 2020 13:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uyqMdc65sguiCBb2tLMESdiNVTjI093Y/QUo7pdzJWY=;
        b=XNwbnkpZtjnc0stjZ7Td+xXjBjLxwXfN84j/FrXrPgZ1fW1OqAxZ525d3ec9bjaxDx
         R+y51IQnPT7PNgTh3A98keYi48XfdfIDEXK68PVKWt1o1jE/9I/37/NH3iIOufYSP5pc
         BpqJRZuiFFtEr5TMO2qX1HumtC2wBrNJAHA/Cg1oouf1JpZbwXkWItrYRGAlfXi6YGkW
         78tt83aMP3c/CuGe16sYfDdVMHnrRlGWnfF6hckx83udzsPzigfvq1IheAmEz79TFDPF
         at7mrDctvyiGKdeA+pPzNHrflBdiDRNuVNsB0Xo/HRFbhOGDIYWuHGweG1zocC3XfyfV
         +Ucg==
X-Gm-Message-State: AOAM532jVLFx8mK7+D6YecSPAbmuqMcsniMWIdQCyT0v223V8hSzZLkV
        qd7/Gpo+jjKhDr1D/VEpTA==
X-Google-Smtp-Source: ABdhPJyxQYgOMHBJXBZXCv8wIYwln5AiOOCrTYiGFYjmkCW654Mc/fNyfvCBXBLvpjgplB+n7/5OTQ==
X-Received: by 2002:a05:6e02:120f:: with SMTP id a15mr18966070ilq.97.1606772978956;
        Mon, 30 Nov 2020 13:49:38 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c2sm11427211iln.70.2020.11.30.13.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 13:49:38 -0800 (PST)
Received: (nullmailer pid 3089193 invoked by uid 1000);
        Mon, 30 Nov 2020 21:49:35 -0000
Date:   Mon, 30 Nov 2020 14:49:35 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v6] dt-bindings: leds: Add DT binding for Richtek
 RT8515
Message-ID: <20201130214935.GA3085708@robh.at.kernel.org>
References: <20201123214439.1279464-1-linus.walleij@linaro.org>
 <20201123224543.GC4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123224543.GC4351@valkosipuli.retiisi.org.uk>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 12:45:43AM +0200, Sakari Ailus wrote:
> Hi Linus,
> 
> On Mon, Nov 23, 2020 at 10:44:38PM +0100, Linus Walleij wrote:
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index f1211e7045f1..92fa90b4a671 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -151,6 +151,12 @@ properties:
> >        Maximum flash LED supply current in microamperes. Required for flash LED
> >        nodes with configurable current.
> >  
> > +  torch-max-microamp:
> > +    description:
> > +      Maximum flash LED supply current in microamperes, when the flash LED is
> > +      used as a torch (flashlight). This is usually lower than the flash mode
> > +      maximum current, if the LED supports torch mode.
> 
> Thanks for the update.
> 
> One more thing. The other flash LED DT bindings are using led-max-microamp
> for the torch mode --- for it's what the non-flash LEDs do.
> 
> Could you use the same here?

Good point. Seems like it as led-max-microamp should be the max steady 
state current whereas flash-max-microamp is the max for a limited time.

Rob
