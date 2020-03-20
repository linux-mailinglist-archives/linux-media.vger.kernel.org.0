Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC64B18C92B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 09:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgCTIs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 04:48:27 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38642 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCTIs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 04:48:26 -0400
Received: by mail-oi1-f193.google.com with SMTP id k21so5701747oij.5;
        Fri, 20 Mar 2020 01:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=r20INFdy7c88gDnE8p93UG+z/HnHRIMdNoDb/T153Dk=;
        b=eetNd92+QHCzwMwIExa+dOG89N27YT60kOLduTUztYrJSCAm8zt5TRchD6rC3e0ttK
         RyVwTzFhVTu5cyFulgFZmd/Hh5mWm8ir338ne0HTv6Sz05wmjmZuSd1RZMj81l4qr4FK
         ltJhRW5jPB1/8oikJX8RWyVCBFHUIJnAzG3tOPoXeXqQNP9qektmkJhvbf6ORqmACkCH
         aqiZMqtknATxdkFvN/x9QOjIRjq7ZcXmciSe+jCRkdIg7Zei8/n8PrqtEPSuVz2FK54+
         oxw9lI+87TTsI4wJ4bIbO0sHbxTQB3onO2QruJh/YKlCGRjeHIgB6xzA694CO+ARGJyl
         9s7g==
X-Gm-Message-State: ANhLgQ0V0cSwCqmFxVEDjnvC9jOD89yTH3GKr1PMyZj2qMvlGLgiblZS
        nJ+khveqdfmubZXHFkQUta8QwPzdDiaZsyejSOXOHA==
X-Google-Smtp-Source: ADFU+vuodlM7mvUF+rTQ9nef3TgHryKYhBbHdZc1CmVWQ2CDidna4tAYWLd1J2bx8M6xmj0E3O52PNbuj3QsnGbiDSk=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr5311062oib.148.1584694105840;
 Fri, 20 Mar 2020 01:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com> <20200320084406.GB4344@pflmari>
In-Reply-To: <20200320084406.GB4344@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 09:48:14 +0100
Message-ID: <CAMuHMdUdVb0LwZDx-MH2FLYYPvgq=uj_3Nrzo9obWAi-Q-2ZnA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Fri, Mar 20, 2020 at 9:44 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> Laurent Pinchart, Thu, Mar 19, 2020 19:01:25 +0100:
> > On Thu, Mar 19, 2020 at 06:42:36PM +0100, Alex Riesen wrote:
> > > As the driver has some support for the audio interface of the device,
> > > the bindings file should mention it.

> > > @@ -16,6 +18,8 @@ Required Properties:
> > >      slave device on the I2C bus. The main address is mandatory, others are
> > >      optional and remain at default values if not specified.
> > >
> > > +  - #clock-cells: must be <0> if the I2S port is used
> >
> > Wouldn't it be simpler to set it to 0 unconditionally ?
>
> Would it? If the port itself is optional, shouldn't the clock be an option
> too?

You'd be surprised how many board designers would consider this a cheap
12.288 MHz clock source, without using the I2S port ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
