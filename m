Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002C851896B
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 18:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239215AbiECQQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 12:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239103AbiECQQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 12:16:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1571EAD4;
        Tue,  3 May 2022 09:12:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3251C3E4;
        Tue,  3 May 2022 18:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651594374;
        bh=MxqwHZCOaswIGIKaJ0V2Hy/6259LM2oBFjoUFOfGrKk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNlV4lDb3s9B8G7f+fzapq63WEnLQmA2FI7+oVVi+LGrVmxiqcceV0nWh1vxpTqer
         RjuwUN/QwkHPRl/2I/2yJ+/EKmyK1u2n2BNmG/jyAvlu4cnn0omXPpT9Ix7ZC0BsGe
         EthGgqlHF/m2+GBR7UIwg7flGWAWw8+kSwsNIczk=
Date:   Tue, 3 May 2022 19:12:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Message-ID: <YnFUhEBI0ln8EWE7@pendragon.ideasonboard.com>
References: <20220428065333.3108-1-biju.das.jz@bp.renesas.com>
 <20220428065333.3108-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
 <OS0PR01MB5922A4BB0AA5477409F8AA2B86C09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922A4BB0AA5477409F8AA2B86C09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 03, 2022 at 04:02:56PM +0000, Biju Das wrote:
> Hi Geert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v9 2/5] media: renesas: vsp1: Add support to
> > deassert/assert reset line
> > 
> > Hi Biju,
> > 
> > On Thu, Apr 28, 2022 at 8:53 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > As the resets DT property is mandatory, and is present in all .dtsi in
> > > mainline, add support to perform deassert/assert using reference
> > > counted reset handle.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Thanks for your patch!
> > 
> > Unfortunately this patch causes a lock-up during boot on the Koelsch
> > development board.
> > 
> > Adding some debug code reveals that the VSP1 registers are accessed while
> > the reset is still asserted:
> > 
> > | WARNING: CPU: 0 PID: 1 at
> > drivers/media/platform/renesas/vsp1/vsp1.h:121 vsp1_read+0x48/0x74
> > | reset not deasserted
> > | CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
> > 5.18.0-rc5-shmobile-04787-g175dd1b77531-dirty #1230
> > | Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> > | unwind_backtrace from show_stack+0x10/0x14  show_stack from
> > | dump_stack_lvl+0x40/0x4c  dump_stack_lvl from __warn+0xa0/0x124
> > | __warn from warn_slowpath_fmt+0x78/0xb0  warn_slowpath_fmt from
> > | vsp1_read+0x48/0x74  vsp1_read from vsp1_reset_wpf+0x14/0x90
> > | vsp1_reset_wpf from vsp1_pm_runtime_resume+0x3c/0x1c0
> > | vsp1_pm_runtime_resume from genpd_runtime_resume+0xfc/0x1bc
> > 
> > vsp1_pm_runtime_resume() initializes the VSP1.
> > 
> > |  genpd_runtime_resume from __rpm_callback+0x3c/0x114  __rpm_callback
> > | from rpm_callback+0x50/0x54  rpm_callback from rpm_resume+0x3e4/0x47c
> > | rpm_resume from __pm_runtime_resume+0x38/0x50  __pm_runtime_resume
> > | from __device_attach+0xbc/0x148  __device_attach from
> > | bus_probe_device+0x28/0x80
> > 
> > __device_attach() calls "pm_runtime_get_sync(dev->parent)",
> > bypassing vsp1_device_get().
> > Hence it wakes the parent, but does not deassert reset.
> > 
> > |  bus_probe_device from device_add+0x560/0x784  device_add from
> > | cdev_device_add+0x20/0x58  cdev_device_add from
> > | media_devnode_register+0x1b8/0x28c
> > |  media_devnode_register from __media_device_register+0xb0/0x198
> > |  __media_device_register from vsp1_probe+0xf74/0xfe0  vsp1_probe from
> > | platform_probe+0x58/0xa8  platform_probe from really_probe+0x138/0x29c
> > | really_probe from __driver_probe_device+0xc4/0xd8
> > | __driver_probe_device from driver_probe_device+0x40/0xc0
> > | driver_probe_device from __driver_attach+0xd4/0xe8  __driver_attach
> > | from bus_for_each_dev+0x64/0xa8  bus_for_each_dev from
> > | bus_add_driver+0x148/0x1a8  bus_add_driver from
> > | driver_register+0xac/0xf0  driver_register from
> > | do_one_initcall+0x70/0x16c  do_one_initcall from
> > | kernel_init_freeable+0x1ac/0x1f8  kernel_init_freeable from
> > | kernel_init+0x14/0x12c  kernel_init from ret_from_fork+0x14/0x2c
> > 
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > 
> > > @@ -567,7 +568,17 @@ static void vsp1_mask_all_interrupts(struct
> > vsp1_device *vsp1)
> > >   */
> > >  int vsp1_device_get(struct vsp1_device *vsp1)  {
> > > -       return pm_runtime_resume_and_get(vsp1->dev);
> > > +       int ret;
> > > +
> > > +       ret = reset_control_deassert(vsp1->rstc);
> > > +       if (ret < 0)
> > > +               return ret;
> > 
> > Perhaps you can move the deassertion of the reset to
> > vsp1_pm_runtime_resume(), so it is called automatically on every resume?
> 
> Looks like reset behaviour is different from R-Car Gen2 and Gen3,
> As one uses memory to display and later one uses VSPD to display.
> 
> I can see 2 options:
> 
> Option 1) move the deassertion of the reset to vsp1_pm_runtime_resume(), as you said.
> 
> Or
> 
> Option 2) Use reset calls only for Gen3.
> 
> I will go with option 1, if there is no issue.

Sounds good to me.

> > > +
> > > +       ret = pm_runtime_resume_and_get(vsp1->dev);
> > > +       if (ret < 0)
> > > +               reset_control_assert(vsp1->rstc);
> > > +
> > > +       return ret;
> > >  }
> > >
> > >  /*
> > > @@ -579,6 +590,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
> > > void vsp1_device_put(struct vsp1_device *vsp1)  {
> > >         pm_runtime_put_sync(vsp1->dev);
> > > +       reset_control_assert(vsp1->rstc);
> > 
> > Likewise, move to vsp1_pm_runtime_suspend()?
> 
> Ok.
> 
> > >  }
> > >
> > >  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
