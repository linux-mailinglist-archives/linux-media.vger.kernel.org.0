Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E584D017D
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 15:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243275AbiCGOgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 09:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbiCGOgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 09:36:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D3B7D01F;
        Mon,  7 Mar 2022 06:35:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EDBF478;
        Mon,  7 Mar 2022 15:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646663757;
        bh=SCTLfi1Xfty9Lg4VEGF2AZggP+lYSWFOBLF0oWztcQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f57QYuY7iVWUBd6yz9Re15QtkkcV/ETdcVJIxqXbsQoQltXaVvmutjDZdvJsj4Qvq
         MNsJrWL/rGiJxoJ9+L9GGDM2ODm/5baUgCCS7Gu+hC1GwrOflHn6tIe0zgsgQZZo+o
         seJpVqWcykhmdPP4a3gh3DVgoOGRn2pG338ohpTM=
Date:   Mon, 7 Mar 2022 16:35:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: fix kernel oops when removing module
Message-ID: <YiYYQE4gyGY468Jz@pendragon.ideasonboard.com>
References: <20220307133750.29708-1-laurentiu.palcu@oss.nxp.com>
 <164666323196.11309.2192554853786525085@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164666323196.11309.2192554853786525085@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 07, 2022 at 02:27:11PM +0000, Kieran Bingham wrote:
> Hi Laurentiu,
> 
> Quoting Laurentiu Palcu (2022-03-07 13:37:50)
> > When removing the max9286 module we get a kernel oops:
> > 
> > Unable to handle kernel paging request at virtual address 000000aa00000094
> > Mem abort info:
> >   ESR = 0x96000004
> >   EC = 0x25: DABT (current EL), IL = 32 bits
> >   SET = 0, FnV = 0
> >   EA = 0, S1PTW = 0
> >   FSC = 0x04: level 0 translation fault
> > Data abort info:
> >   ISV = 0, ISS = 0x00000004
> >   CM = 0, WnR = 0
> > user pgtable: 4k pages, 48-bit VAs, pgdp=0000000880d85000
> > [000000aa00000094] pgd=0000000000000000, p4d=0000000000000000
> > Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > Modules linked in: fsl_jr_uio caam_jr rng_core libdes caamkeyblob_desc caamhash_desc caamalg_desc crypto_engine max9271 authenc crct10dif_ce mxc_jpeg_encdec
> > CPU: 2 PID: 713 Comm: rmmod Tainted: G         C        5.15.5-00057-gaebcd29c8ed7-dirty #5
> > Hardware name: Freescale i.MX8QXP MEK (DT)
> > pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : i2c_mux_del_adapters+0x24/0xf0
> > lr : max9286_remove+0x28/0xd0 [max9286]
> > sp : ffff800013a9bbf0
> > x29: ffff800013a9bbf0 x28: ffff00080b6da940 x27: 0000000000000000
> > x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> > x23: ffff000801a5b970 x22: ffff0008048b0890 x21: ffff800009297000
> > x20: ffff0008048b0f70 x19: 000000aa00000064 x18: 0000000000000000
> > x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > x14: 0000000000000014 x13: 0000000000000000 x12: ffff000802da49e8
> > x11: ffff000802051918 x10: ffff000802da4920 x9 : ffff000800030098
> > x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff6364626d
> > x5 : 8080808000000000 x4 : 0000000000000000 x3 : 0000000000000000
> > x2 : ffffffffffffffff x1 : ffff00080b6da940 x0 : 0000000000000000
> > Call trace:
> >  i2c_mux_del_adapters+0x24/0xf0
> >  max9286_remove+0x28/0xd0 [max9286]
> >  i2c_device_remove+0x40/0x110
> >  __device_release_driver+0x188/0x234
> >  driver_detach+0xc4/0x150
> >  bus_remove_driver+0x60/0xe0
> >  driver_unregister+0x34/0x64
> >  i2c_del_driver+0x58/0xa0
> >  max9286_i2c_driver_exit+0x1c/0x490 [max9286]
> >  __arm64_sys_delete_module+0x194/0x260
> >  invoke_syscall+0x48/0x114
> >  el0_svc_common.constprop.0+0xd4/0xfc
> >  do_el0_svc+0x2c/0x94
> >  el0_svc+0x28/0x80
> >  el0t_64_sync_handler+0xa8/0x130
> >  el0t_64_sync+0x1a0/0x1a4
> > 
> > The Oops happens because the I2C client data does not point to
> > max9286_priv anymore but to v4l2_subdev. The change happened in
> > max9286_init() which calls v4l2_i2c_subdev_init() later on...
> > 
> 
> I think this needs a Fixes tag, but it looks like it happened when we
> merged the driver. So that makes it:
> 
> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> 
> I see in max9286_probe() we set
> 	i2c_set_clientdata(client, (struct max9286_priv) priv);
> 
> And indeed, then we call 
> 
> max9286_init()
>  max9286_v4l2_register()
>   v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> 
> So I think this patch should probably also remove the call to 
> i2c_set_clientdata() in probe to prevent confusion.

Agreed.

> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/i2c/max9286.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index d2a4915ed9f7..04f5b7e3a9e5 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -1385,7 +1385,7 @@ static int max9286_probe(struct i2c_client *client)
> >  
> >  static int max9286_remove(struct i2c_client *client)
> >  {
> > -       struct max9286_priv *priv = i2c_get_clientdata(client);
> > +       struct max9286_priv *priv = sd_to_max9286(i2c_get_clientdata(client));
> 
> What happens if the module load failed before calling max9286_init(), in
> that case, would the i2c_get_clientdata() return NULL?
> 
> If so, should this be checked?

.remove() isn't called if .probe() fails, so it should be fine

> >  
> >         i2c_mux_del_adapters(priv->mux);
> >  

-- 
Regards,

Laurent Pinchart
