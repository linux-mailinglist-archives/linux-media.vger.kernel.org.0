Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F657577F30
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 12:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiGRKCJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Jul 2022 06:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGRKCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 06:02:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ED91A825
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 03:02:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oDNZj-0002p0-V7; Mon, 18 Jul 2022 12:02:04 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oDNZh-001gde-S2; Mon, 18 Jul 2022 12:02:01 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oDNZh-0004FR-8O; Mon, 18 Jul 2022 12:02:01 +0200
Message-ID: <f3d19a38e59e73b91601b7a34aaf1c2ea41ff915.camel@pengutronix.de>
Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date:   Mon, 18 Jul 2022 12:02:01 +0200
In-Reply-To: <OS0PR01MB5922AEA08C8DD71390E51A97868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
         <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
         <20220713081856.GA14683@pengutronix.de>
         <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
         <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
         <20220713103216.GA10829@pengutronix.de>
         <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
         <OS0PR01MB5922AEA08C8DD71390E51A97868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mo, 2022-07-18 at 09:46 +0000, Biju Das wrote:
> Hi Philipp and Geert,
> 
> > Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> > deassert/assert reset line
> > 
> > Hi Philipp,
> > 
> > On Wed, Jul 13, 2022 at 12:32 PM Philipp Zabel <p.zabel@pengutronix.de>
> > wrote:
> > > On Wed, Jul 13, 2022 at 11:27:56AM +0200, Geert Uytterhoeven wrote:
> > > [...]
> > > > Actually I suggested handling this in the VSP driver, as VSP seems
> > > > to be "special".
> > > > 
> > > > > 
> > > > > [1]
> > > 
> > > So reset_control_status never actually returns 1 and the polling loop
> > > is not necessary at all?
> > > 
> > > If it's just the status register read that fixes things for VSP, could
> > > it be that the deasserting register write to the reset controller and
> > > the following register writes to VSP are not ordered somewhere at the
> > > interconnect and the read issued to the reset controller just
> > > guarantees that order?
> > 
> > The udelay() also works.
> > 
> > While the reset may be deasserted immediately (at the reset controller
> > level), the VSP may need some additional time to settle/initialize (at
> > the VSP level).

^ this feels to me like we are blindly applying a workaround for an
unknown problem. Is there any way to find out what actually causes this
delay (or status readback) to be necessary? Is there something
documented, like a certain number of VSP clocks required to internally
propagate the reset?

> > 
> > Reset is known to work on other blocks on the same SoC, so that's why I
> > suggested handling this in the VSP driver instead, like we already do for
> > i2c.
> 
> From the discussion, we agree that the current implementation is good.
> 
> Please correct me if my understanding is wrong.

From my understanding, not quite. At least the timeout poll is
unnecessary and misleading. It suggests that reset_control_status()
could return 0 at this point, which would be a bug in the reset driver.

If reset_control_status() only ever returns 1 and the polling loop ends
in the first iteration, you can drop the loop and just read status
once. Or use udelay(), at this point I have not enough information to
understand which would be more appropriate.

regards
Philipp
