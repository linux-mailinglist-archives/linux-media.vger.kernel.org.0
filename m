Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C389523A1C5
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 11:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgHCJbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 05:31:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34917 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgHCJbs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 05:31:48 -0400
Received: by mail-ot1-f67.google.com with SMTP id 93so17274377otx.2;
        Mon, 03 Aug 2020 02:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNQhjEuMT8QktkBdiT53ZebNYf/kgY2N7FdiAWEIJE4=;
        b=DlKWAQnOqjkK9QgfxqupuGgRa5A+/aiWLdoXyEwtT5d8ZrIkmjEozg7HOivQM05Faz
         XtKLatZ9q11FQgNkkFhIofDdmJVX1X2QvNJe+UvhPNI8/rHshH/BRuSENwVfxJGfgCEg
         1HXukUtXWpVjTSJlpLoav5Vq9mlr+hVIXijoxFrxZNrzzyhV5+4X+PKXAdsjcCVOH/Rr
         iDZNww03yYgS5zh4KVIvZLHZSdvMTqbvcFU+ZfT7oPBnd60OIaNpGua8oI2rxdRKnpp5
         s0+4F9p5cLmn72qr/0dFPTqRtNCWWSSXVlrVRqSAEFh6mC+hfe7PF4l7T5js0Emrkrap
         JAuA==
X-Gm-Message-State: AOAM530/OyHCS2pfZIGRIcJvzSBLUTBI6wqi4H556sMZLgUbv9IOOuFW
        JL1Tp1JHDZ+3KWWPbSsF92vamQFC535Hgupxc54=
X-Google-Smtp-Source: ABdhPJxWHu6bmTNcqR+flJJ2oDdPHMxmw1tynMHEul1JJgkV5TSGCfXj/5LSyfY8jhyV1OsM5EXnn9dNW/aJyDE/ox8=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr12167826ote.107.1596447106515;
 Mon, 03 Aug 2020 02:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200724193752.GE2729799@oden.dyn.berto.se> <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
 <20200725081146.GF2729799@oden.dyn.berto.se> <CA+V-a8sNxUaj88DDcWyc4zrmsAAGndjoQX=OmJ3u1GRJCT6TBQ@mail.gmail.com>
 <20200801091759.GC1379367@oden.dyn.berto.se>
In-Reply-To: <20200801091759.GC1379367@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Aug 2020 11:31:35 +0200
Message-ID: <CAMuHMdUv-8v1Uqh9qU5NfCz0gr2iag_9Y28NiHU_X8nijLXRKA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Document
 renesas-vin-ycbcr-8b-g property
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sat, Aug 1, 2020 at 11:18 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
> On 2020-07-25 23:23:13 +0100, Lad, Prabhakar wrote:
> > On Sat, Jul 25, 2020 at 9:11 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > On 2020-07-24 22:11:31 +0100, Lad, Prabhakar wrote:
> > > > On Fri, Jul 24, 2020 at 8:37 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > > > On 2020-07-24 15:58:51 +0100, Lad Prabhakar wrote:
> > > > > > Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit data
> > > > > > input pins.

> > > > > This nit apart I'm not sure a property is the right way here. Could it
> > > > > not be possible on some designs to have two different sensors one wired
> > > > > to DATA[7:0] and the other to DATA[15:8] and by controlling the
> > > > > VNDRM2_YDS register at runtime switch between the two? If so adding a DT
> > > > > property to hard-code one of the two options would prevent this. I fear
> > > > > we need to think of a runtime way to deal with this.
> > > > >
> > > > Aha Gen2 and Gen3 hardware manuals have a bit different description
> > > > about the YDS field. (I was working R8a7742 SoC so I referred Gen2
> > > > manual)
> > >
> > > Ahh, I think we should use the Gen3 names as I find them overall an
> > > improvement over the Gen2 ones.
> > >
> > Agreed.
> >
> > > >
> > > > > The best way to do that I think is to extend the port@0 node to allow
> > > > > for two endpoints, one for each of the two possible parallel sensors.
> > > > > This would then have to be expressed in the media graph and selection if
> > > > > YDS should be set or not depend on which media links are enabled.
> > > > >
> > > > In that case how do we handle endpoint matching each would have two
> > > > subdevs to be matched.
> > >
> > > It would be handle in the same was as the multiple endpoints in port@1.
> > >
> > > > And in case non media-ctl cases we cannot
> > > > switch between subdevs.
> > >
> > > For the Gen2 none media graph enabled mode this could be handled with
> > > the S_INPUT ioctl. For this feature to be merged however I it needs to
> > > be possible to select input both in Gen2 and Gen3 I'm afraid.
> > Ohh yes S_INPUT could be used to switch inputs. But  how do we decide
> > YDS needs to be enabled, for example with the below dts say vin3 is
> > parallel bus split into 2x 8-bit bus one connected to a ov5640 sensor
> > and other connected to ov7725 sensor. Should we use data-shift
> > property for the second vin endpoint (vin3ep1) to enable YDS ?
>
> Using data-shift is a great idea! If I understand your use-case you
> currently only have one sensor attached on the parallel bus right? If so
> we can postpone the multi sensor part until it's needed and just learn
> the VIN driver about data-shift. From the documentation,
>
>   - data-shift: on the parallel data busses, if bus-width is used to
>     specify the number of data lines, data-shift can be used to specify
>     which data lines are used, e.g. "bus-width=<8>; data-shift=<2>;"
>     means, that lines 9:2 are used.
>
> So in this case would not specifying data-shift=<8> solve the DT
> description problem? The VIN driver still needs to learn about this tho.

And the PFC drivers need to be extended with the data8_sft8 groups
(present in the BSP), right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
