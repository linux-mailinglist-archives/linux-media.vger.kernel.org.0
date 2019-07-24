Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC7772765
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 07:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfGXFgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 01:36:38 -0400
Received: from gofer.mess.org ([88.97.38.141]:52547 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGXFgi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 01:36:38 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F32C260474; Wed, 24 Jul 2019 06:36:35 +0100 (BST)
Date:   Wed, 24 Jul 2019 06:36:35 +0100
From:   Sean Young <sean@mess.org>
To:     Michael Ira Krufky <mkrufky@linuxtv.org>
Cc:     Vandana BN <bnvandana@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tskd08@gmail.com, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] media:dvb-frontends:Remove dvb_pll_devcount and id
 module parameters.
Message-ID: <20190724053635.4pl44glggvcnton2@gofer.mess.org>
References: <20190717141204.19433-1-bnvandana@gmail.com>
 <20190720061302.24047-1-bnvandana@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190720061302.24047-1-bnvandana@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 20, 2019 at 11:43:02AM +0530, Vandana BN wrote:
> Syzbot reported global-out-of-bounds Read in dvb_pll_attach, while
> accessing id[dvb_pll_devcount], because dvb_pll_devcount was 65,
> that is more than size of 'id' which is DVB_PLL_MAX(64).
> 
> Fix would be to check if DVB_PLL_MAX devices are attached and if so return
> NULL from dvb_pll_attach(). But this will put a limit on the number of
> devices that can be attached.
> Also dvb_pll_devcount and "id" module parameter are used for debugging
> purpose to override/force PLL type.
> So this patch removes these module parameters.
> 
> Reported-by: syz...@syzkaller.appspotmail.com
> 
> usb 1-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the
> software demuxer
> dvbdev: DVB: registering new adapter (774 Friio White ISDB-T USB2.0)
> usb 1-1: media controller created
> dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> tc90522 0-0018: Toshiba TC90522 attached.
> usb 1-1: DVB: registering adapter 0 frontend 0 (Toshiba TC90522 ISDB-T
> module)...
> dvbdev: dvb_create_media_entity: media entity 'Toshiba TC90522 ISDB-T
> module' registered.
> ==================================================================
> BUG: KASAN: global-out-of-bounds in dvb_pll_attach+0x6c5/0x830
> drivers/media/dvb-frontends/dvb-pll.c:798
> Read of size 4 at addr ffffffff89c9e5e0 by task kworker/0:1/12
> 
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc6+ #13
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x67/0x231 mm/kasan/report.c:188
>   __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
>   kasan_report+0xe/0x20 mm/kasan/common.c:614
>   dvb_pll_attach+0x6c5/0x830 drivers/media/dvb-frontends/dvb-pll.c:798
>   dvb_pll_probe+0xfe/0x174 drivers/media/dvb-frontends/dvb-pll.c:877
>   i2c_device_probe+0x790/0xaa0 drivers/i2c/i2c-core-base.c:389
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   i2c_new_client_device+0x5b3/0xc40 drivers/i2c/i2c-core-base.c:778
>   i2c_new_device+0x19/0x50 drivers/i2c/i2c-core-base.c:821
>   dvb_module_probe+0xf9/0x220 drivers/media/dvb-core/dvbdev.c:985
>   friio_tuner_attach+0x125/0x1d0 drivers/media/usb/dvb-usb-v2/gl861.c:536
>   dvb_usbv2_adapter_frontend_init
> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:675 [inline]
>   dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804
> [inline]
>   dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
>   dvb_usbv2_probe.cold+0x24dc/0x255d
> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x30b/0x410 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> 
> The buggy address belongs to the variable:
>   id+0x100/0x120
> 
> Memory state around the buggy address:
>   ffffffff89c9e480: fa fa fa fa 00 00 fa fa fa fa fa fa 00 00 00 00
>   ffffffff89c9e500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > ffffffff89c9e580: 00 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa
>                                                         ^
>   ffffffff89c9e600: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
>   ffffffff89c9e680: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
> ==================================================================
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb-pll.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
> index ba0c49107bd2..c3a04751e9cf 100644
> --- a/drivers/media/dvb-frontends/dvb-pll.c
> +++ b/drivers/media/dvb-frontends/dvb-pll.c
> @@ -33,19 +33,11 @@ struct dvb_pll_priv {
>  	u32 bandwidth;
>  };
> 
> -#define DVB_PLL_MAX 64
> -
> -static unsigned int dvb_pll_devcount;
> 
>  static int debug;
>  module_param(debug, int, 0644);
>  MODULE_PARM_DESC(debug, "enable verbose debug messages");
> 
> -static unsigned int id[DVB_PLL_MAX] =
> -	{ [ 0 ... (DVB_PLL_MAX-1) ] = DVB_PLL_UNDEFINED };
> -module_param_array(id, int, NULL, 0644);
> -MODULE_PARM_DESC(id, "force pll id to use (DEBUG ONLY)");
> -

Mike, you introduced this module parameter in:

commit 05a4611b5d71ad6f968fdeef092c24914570898b
Author:     Michael Krufky <mkrufky@linuxtv.org>
AuthorDate: Fri Sep 7 18:19:57 2007 -0300

    V4L/DVB (6228): dvb-pll: add module option to specify rf input
    
    Add a module option to dvb-pll, called "input" to specify which rf
    input to use on devices with multiple rf inputs.  If the module option
    is not specified, then the driver will autoselect the rf input, as per
    previous behavior.
    
    Signed-off-by: Michael Krufky <mkrufky@linuxtv.org>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@infradead.org>

What was your motivation?

>  /* ----------------------------------------------------------- */
> 
>  struct dvb_pll_desc {
> @@ -795,10 +787,6 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
>  	b1[0] = 0;
>  	msg.buf = b1;
> 
> -	if ((id[dvb_pll_devcount] > DVB_PLL_UNDEFINED) &&
> -	    (id[dvb_pll_devcount] < ARRAY_SIZE(pll_list)))
> -		pll_desc_id = id[dvb_pll_devcount];
> -
>  	BUG_ON(pll_desc_id < 1 || pll_desc_id >= ARRAY_SIZE(pll_list));
> 
>  	desc = pll_list[pll_desc_id];
> @@ -825,7 +813,7 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
>  	priv->pll_i2c_address = pll_addr;
>  	priv->i2c = i2c;
>  	priv->pll_desc = desc;
> -	priv->nr = dvb_pll_devcount++;
> +	priv->nr = pll_desc_id;

The nr filed of the struct is no longer needed with this patch.

> 
>  	memcpy(&fe->ops.tuner_ops, &dvb_pll_tuner_ops,
>  	       sizeof(struct dvb_tuner_ops));
> @@ -846,13 +834,12 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
> 
>  	fe->tuner_priv = priv;
> 
> -	if ((debug) || (id[priv->nr] == pll_desc_id)) {
> +	if (debug) {
>  		dprintk("dvb-pll[%d]", priv->nr);
>  		if (i2c != NULL)
>  			pr_cont(" %d-%04x", i2c_adapter_id(i2c), pll_addr);
>  		pr_cont(": id# %d (%s) attached, %s\n", pll_desc_id, desc->name,
> -		       id[priv->nr] == pll_desc_id ?
> -				"insmod option" : "autodetected");
> +				"insmod option");

This is not set via insmod, also you could replace the %s in the format with
the string itself since it is always the same value.


>  	}
> 
>  	kfree(b1);
> --
> 2.17.1
