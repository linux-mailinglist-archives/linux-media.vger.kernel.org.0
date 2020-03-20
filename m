Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE6518C99B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 10:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgCTJKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 05:10:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42033 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgCTJKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 05:10:46 -0400
Received: by mail-ot1-f67.google.com with SMTP id a2so5258855otq.9;
        Fri, 20 Mar 2020 02:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Tg5BjS+sqoKmcQ+42q9TxLcAJmVp9TX8V+2Cw9tSbTc=;
        b=aTcVktbEX8rrXl/LM4BLIEi3AcDdULW8imP+UQd+83ol927lkqqyFhnxPmFXYO7PxW
         FEy2nLzIk4gIaGzlxosaQ5JYaG+DJAczIxAHBhe9hmUtYP/7wQTo7AQACPMdQvPrffQo
         s1IovBhLxhO3/IyvayndMiWkXq72qjebMieBhaRUP+1fiMHfals4sZCZLLzOJ13YuCLX
         Am/S83dgH8ovyRAKTBqjLS05LhxCsYd92+0XQs0ytYmsK/oiAA8aax1PgRXkw4yc+TML
         IwOw0P6gDPp8kGFdOjEVtrq91Q+z06VMxEDRE/jcog/fxAHjajc3HiqDvq1B9CX2i9rT
         Ealg==
X-Gm-Message-State: ANhLgQ0Zc2jfbB5Sn1Rn/8vFxmFYqrDEpDrj19Afnqq5gyMAxtdzm6nu
        vrodkNfTcy1W4oDkPDF5iXpQlGhT2Htk/V7bQhBzNQ==
X-Google-Smtp-Source: ADFU+vsUtq7aKxlPk7a6wmuKLwOjxCxHK6YYdo8yUXNmA1Av41cm11S+ggWl9zkA56I5lN+TzJt+7vYyBdanbV3/AIo=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr5844474otk.145.1584695445126;
 Fri, 20 Mar 2020 02:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <252bb433f47b0ccb61bb077abdbd892091abc550.1584639664.git.alexander.riesen@cetitec.com>
 <CAMuHMdXOAQtuxCAfb=sZKodyJWwSrf-GO-pdV3HYkOytQW4ENg@mail.gmail.com> <20200320085748.GC4344@pflmari>
In-Reply-To: <20200320085748.GC4344@pflmari>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 10:10:24 +0100
Message-ID: <CAMuHMdUvLGx41631HD-jOrpiw7Nyode-iXk0hxDhBHZ9JEqy7Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] media: adv748x: add support for HDMI audio
To:     Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On Fri, Mar 20, 2020 at 9:58 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
> Geert Uytterhoeven, Fri, Mar 20, 2020 09:43:29 +0100:
> > > +int adv748x_dai_init(struct adv748x_dai *dai)
> > > +{
> > > +       int ret;
> > > +       struct adv748x_state *state = adv748x_dai_to_state(dai);
> > > +
> > > +       dai->mclk = clk_register_fixed_rate(state->dev,
> > > +                                           "adv748x-hdmi-i2s-mclk",
> >
> > I assume there can be multiple adv748x instances in the system?
> > Hence the clock name should be unique for each instance.
>
> I think that can happen.
>
> Is it alright to derive the clock name from the device name? E.g.:
> adv748x.4-0070-mclk? Where "adv748x.4-0070" is a struct device->name.

Yes, that's the idea.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
