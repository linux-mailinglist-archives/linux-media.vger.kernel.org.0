Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8487918C9F2
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 10:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgCTJPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 05:15:31 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46765 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgCTJPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 05:15:30 -0400
Received: by mail-ot1-f67.google.com with SMTP id 111so5243678oth.13;
        Fri, 20 Mar 2020 02:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=8x4focGPb4ERLGjucd62jlveYIVPZ0IBCjA7nXBe5yM=;
        b=sME/KImcjBxE/37hOQylbQP4HypdVVyIc3va3OtlqWKytWb1lJRvFntHZHme8p6h/R
         6B3FF5CP0y9lCMox2fxr7Dmi57sspcvJv1B1zJUaliqEXvc3TR+Fe2e8b81piwYinsj2
         cwd/IKP8goTMZaNU0gToUnbFBFl3KFgIyZuiVi0qJz2tmsWG0aI0x402XCpHPkdU0SeO
         Q92cSm6viNVU9kGW/n1VcAcWpNgEyQfubPJET3E2n7V1OD03QuzodcJqZGRc/hGVs0GL
         PfKXljaE0xDNqC1UoPPGkfn/JM3rtPazyp9lTO9jmSrPt+rqmIFLK2qu7UPIRSXSNPks
         jPmA==
X-Gm-Message-State: ANhLgQ3OHt6fVwgDspHxVJNZ4972UanHIR9RYw2ppSK2V+fjHB/a/kqD
        v4VufE3IR7ArcMs8P0taNfddU0XvevI/himV5rp+wQ==
X-Google-Smtp-Source: ADFU+vsYLnunQuvHtatOG7BsZ09H8JNgkdZkzpSDXVv4nRP0XZF8aXP6gXAbKfpS7Iv8xwSoBWNPpDjt9weJDu9tK5g=
X-Received: by 2002:a9d:6a47:: with SMTP id h7mr6013558otn.297.1584695728515;
 Fri, 20 Mar 2020 02:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com> <20200320084406.GB4344@pflmari>
 <CAMuHMdUdVb0LwZDx-MH2FLYYPvgq=uj_3Nrzo9obWAi-Q-2ZnA@mail.gmail.com> <20200320090339.GD4344@pflmari>
In-Reply-To: <20200320090339.GD4344@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 10:15:17 +0100
Message-ID: <CAMuHMdVtsdNg0s5fio8GAhHGV9H+1J=xvuCXj5VdZ6gwqxGrZw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
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

On Fri, Mar 20, 2020 at 10:03 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Fri, Mar 20, 2020 09:48:14 +0100:
> > On Fri, Mar 20, 2020 at 9:44 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > Laurent Pinchart, Thu, Mar 19, 2020 19:01:25 +0100:
> > > > On Thu, Mar 19, 2020 at 06:42:36PM +0100, Alex Riesen wrote:
> > > > > As the driver has some support for the audio interface of the device,
> > > > > the bindings file should mention it.
> >
> > > > > @@ -16,6 +18,8 @@ Required Properties:
> > > > >      slave device on the I2C bus. The main address is mandatory, others are
> > > > >      optional and remain at default values if not specified.
> > > > >
> > > > > +  - #clock-cells: must be <0> if the I2S port is used
> > > >
> > > > Wouldn't it be simpler to set it to 0 unconditionally ?
> > >
> > > Would it? If the port itself is optional, shouldn't the clock be an option
> > > too?
> >
> > You'd be surprised how many board designers would consider this a cheap
> > 12.288 MHz clock source, without using the I2S port ;-)
>
> Well, I am :-)
>
> Especially considering that the driver will not switch the MCLK pin aktive
> (all I2S-related pins are tristate by default).

OK, didn't consider that.  But that still won't stop the hardware designer.
E.g. on Lager, the clock input of the PMIC is tied to the clock line of an SPI
bus, so to use that feature, the SPI clock must be kept running all the time,
not just when doing a transfer.

> And how do I require it to be set unconditionally? By just removing the
> "if ..." part of the statement?

Indeed.  This is still the plain text binding, not yaml.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
