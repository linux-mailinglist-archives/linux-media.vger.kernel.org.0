Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DB3578BC9
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 22:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbiGRUbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 16:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235224AbiGRUbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 16:31:04 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B692ED4A;
        Mon, 18 Jul 2022 13:31:01 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id f14so9732250qkm.0;
        Mon, 18 Jul 2022 13:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ztWxP70SPPra9KJuFOmxCRhYGqoDBVpQMjJSseEb90=;
        b=dsynwEpg46o6ulGUa1f07Vwu1vz7XJmjxzDRH/c2kTpXHyw8qDcnpswUhAWaMPEw4z
         yiu98eDYTGgsQXVDhBBv+yXaJ9EhVsufEsxB7qt96vLdjMzqGCjHuRbU+iEXYnWRUFbE
         AlK2ghp5XM7T/vLEM9ug9ItRZgowB4SwJY6vvTaX06uJaHV9WK5K8cTZmkJj8BOZuvI7
         IGh6eeD0S1Z62UKcKrf8kcthMQGJOGR6uMAOLYxROPrjCaje7MsUL2ZjS263YGh+lzwt
         6q7rAkO2vi+gPIC03YAZC54kNrV2RqZaJJ26omAkFxyrq2T5+KVRdI7wBbMS55leXxrt
         MbFA==
X-Gm-Message-State: AJIora+EPAt+2pUcCRazuxJQob1FqghinGdHg0FWrYr//GkU4YoYgge2
        PnnYdsk/SBNB92eaKB7IXsjQbw9kKRqNaA==
X-Google-Smtp-Source: AGRyM1tO8a84MIafTB7xVOvLZJNK4hzdP1maE7v6CznZY+luIlMRfIEqIcvRKuDrEIj7ARVJjDzOTg==
X-Received: by 2002:a05:620a:1901:b0:6b5:e309:cc6a with SMTP id bj1-20020a05620a190100b006b5e309cc6amr5787730qkb.624.1658176259965;
        Mon, 18 Jul 2022 13:30:59 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id ay17-20020a05620a179100b006b5d3a6f1e1sm8774322qkb.0.2022.07.18.13.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 13:30:59 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-31d85f82f0bso119816837b3.7;
        Mon, 18 Jul 2022 13:30:59 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:31c:e3b9:7442 with SMTP id
 g9-20020a0ddd09000000b0031ce3b97442mr32925297ywe.47.1658176259129; Mon, 18
 Jul 2022 13:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com> <20220713081856.GA14683@pengutronix.de>
 <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
 <20220713103216.GA10829@pengutronix.de> <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
 <OS0PR01MB5922AEA08C8DD71390E51A97868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <f3d19a38e59e73b91601b7a34aaf1c2ea41ff915.camel@pengutronix.de> <OS0PR01MB5922B692CA3784F4C481118F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922B692CA3784F4C481118F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jul 2022 22:30:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJ0=J6ZG4BJEdG21ks3NVpm6nbBgz7UySeQ8xdLj159g@mail.gmail.com>
Message-ID: <CAMuHMdXJ0=J6ZG4BJEdG21ks3NVpm6nbBgz7UySeQ8xdLj159g@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Mon, Jul 18, 2022 at 12:12 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> > deassert/assert reset line
> >
> > Hi,
> >
> > On Mo, 2022-07-18 at 09:46 +0000, Biju Das wrote:
> > > Hi Philipp and Geert,
> > >
> > > > Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> > > > deassert/assert reset line
> > > >
> > > > Hi Philipp,
> > > >
> > > > On Wed, Jul 13, 2022 at 12:32 PM Philipp Zabel
> > > > <p.zabel@pengutronix.de>
> > > > wrote:
> > > > > On Wed, Jul 13, 2022 at 11:27:56AM +0200, Geert Uytterhoeven wrote:
> > > > > [...]
> > > > > > Actually I suggested handling this in the VSP driver, as VSP
> > > > > > seems to be "special".
> > > > > >
> > > > > > >
> > > > > > > [1]
> > > > >
> > > > > So reset_control_status never actually returns 1 and the polling
> > > > > loop is not necessary at all?
> > > > >
> > > > > If it's just the status register read that fixes things for VSP,
> > > > > could it be that the deasserting register write to the reset
> > > > > controller and the following register writes to VSP are not
> > > > > ordered somewhere at the interconnect and the read issued to the
> > > > > reset controller just guarantees that order?
> > > >
> > > > The udelay() also works.
> > > >
> > > > While the reset may be deasserted immediately (at the reset
> > > > controller level), the VSP may need some additional time to
> > > > settle/initialize (at the VSP level).
> >
> > ^ this feels to me like we are blindly applying a workaround for an
> > unknown problem. Is there any way to find out what actually causes this
> > delay (or status readback) to be necessary? Is there something
> > documented, like a certain number of VSP clocks required to internally
> > propagate the reset?
>
> OK.
>
> >
> > > >
> > > > Reset is known to work on other blocks on the same SoC, so that's
> > > > why I suggested handling this in the VSP driver instead, like we
> > > > already do for i2c.
> > >
> > > From the discussion, we agree that the current implementation is good.
> > >
> > > Please correct me if my understanding is wrong.
> >
> > From my understanding, not quite. At least the timeout poll is
> > unnecessary and misleading. It suggests that reset_control_status() could
> > return 0 at this point, which would be a bug in the reset driver.
> >
> > If reset_control_status() only ever returns 1 and the polling loop ends
> > in the first iteration, you can drop the loop and just read status once.
> > Or use udelay(), at this point I have not enough information to
> > understand which would be more appropriate.
>
> For RZ/G1N SoC's like Geert mentioned in [1], calling reset_control_status() only once fixes the
> issue. So strictly speaking polling is not required.
>
> @Geert Uytterhoeven, Please share your opinion on this.

According to that thread, it also works without reading the
register, when adding a small delay() (to the vsp driver)?

>
> [1]
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220504184406.93788-1-biju.das.jz@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
