Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AC880374
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2019 02:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390628AbfHCAZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 20:25:00 -0400
Received: from gofer.mess.org ([88.97.38.141]:33735 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390047AbfHCAZA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Aug 2019 20:25:00 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D299660A54; Sat,  3 Aug 2019 01:24:57 +0100 (BST)
Date:   Sat, 3 Aug 2019 01:24:57 +0100
From:   Sean Young <sean@mess.org>
To:     Vandana BN <bnvandana@gmail.com>
Cc:     Michael Ira Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, tskd08@gmail.com,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] media:dvb-frontends:Remove dvb_pll_devcount and id
 module parameters.
Message-ID: <20190803002457.2mq27h7e4p7toxyx@gofer.mess.org>
References: <20190717141204.19433-1-bnvandana@gmail.com>
 <20190720061302.24047-1-bnvandana@gmail.com>
 <20190724053635.4pl44glggvcnton2@gofer.mess.org>
 <CAOcJUbzqA9wVJtAaND+Rbpx_RjZNmVWzXMXZgaLT49YhMePo5Q@mail.gmail.com>
 <49af405b-40c0-7b04-e2bb-52e98400d0e7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49af405b-40c0-7b04-e2bb-52e98400d0e7@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 02, 2019 at 12:20:19PM +0530, Vandana BN wrote:
> 
> On 01/08/19 2:31 PM, Michael Ira Krufky wrote:
> > Sean,
> >
> > Please pardon the late reply.   See my responses inline below:
> >
> > On Wed, Jul 24, 2019 at 1:36 AM Sean Young <sean@mess.org> wrote:
> >> On Sat, Jul 20, 2019 at 11:43:02AM +0530, Vandana BN wrote:
> >>> Syzbot reported global-out-of-bounds Read in dvb_pll_attach, while
> >>> accessing id[dvb_pll_devcount], because dvb_pll_devcount was 65,
> >>> that is more than size of 'id' which is DVB_PLL_MAX(64).
> >>>
> >>> Fix would be to check if DVB_PLL_MAX devices are attached and if so return
> >>> NULL from dvb_pll_attach(). But this will put a limit on the number of
> >>> devices that can be attached.
> >>> Also dvb_pll_devcount and "id" module parameter are used for debugging
> >>> purpose to override/force PLL type.
> >>> So this patch removes these module parameters.
> >>>
> >>> Reported-by: syz...@syzkaller.appspotmail.com
> >>>
> >>> usb 1-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the
> >>> software demuxer
> >>> dvbdev: DVB: registering new adapter (774 Friio White ISDB-T USB2.0)
> >>> usb 1-1: media controller created
> >>> dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> >>> tc90522 0-0018: Toshiba TC90522 attached.
> >>> usb 1-1: DVB: registering adapter 0 frontend 0 (Toshiba TC90522 ISDB-T
> >>> module)...
> >>> dvbdev: dvb_create_media_entity: media entity 'Toshiba TC90522 ISDB-T
> >>> module' registered.
> >>> ==================================================================
> >>> BUG: KASAN: global-out-of-bounds in dvb_pll_attach+0x6c5/0x830
> >>> drivers/media/dvb-frontends/dvb-pll.c:798
> >>> Read of size 4 at addr ffffffff89c9e5e0 by task kworker/0:1/12
> >>>
> >>> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc6+ #13
> >>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> >>> Google 01/01/2011
> >>> Workqueue: usb_hub_wq hub_event
> >>> Call Trace:
> >>>   __dump_stack lib/dump_stack.c:77 [inline]
> >>>   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >>>   print_address_description+0x67/0x231 mm/kasan/report.c:188
> >>>   __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
> >>>   kasan_report+0xe/0x20 mm/kasan/common.c:614
> >>>   dvb_pll_attach+0x6c5/0x830 drivers/media/dvb-frontends/dvb-pll.c:798
> >>>   dvb_pll_probe+0xfe/0x174 drivers/media/dvb-frontends/dvb-pll.c:877
> >>>   i2c_device_probe+0x790/0xaa0 drivers/i2c/i2c-core-base.c:389
> >>>   really_probe+0x281/0x660 drivers/base/dd.c:509
> >>>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
> >>>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
> >>>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >>>   __device_attach+0x217/0x360 drivers/base/dd.c:843
> >>>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >>>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
> >>>   i2c_new_client_device+0x5b3/0xc40 drivers/i2c/i2c-core-base.c:778
> >>>   i2c_new_device+0x19/0x50 drivers/i2c/i2c-core-base.c:821
> >>>   dvb_module_probe+0xf9/0x220 drivers/media/dvb-core/dvbdev.c:985
> >>>   friio_tuner_attach+0x125/0x1d0 drivers/media/usb/dvb-usb-v2/gl861.c:536
> >>>   dvb_usbv2_adapter_frontend_init
> >>> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:675 [inline]
> >>>   dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804
> >>> [inline]
> >>>   dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
> >>>   dvb_usbv2_probe.cold+0x24dc/0x255d
> >>> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
> >>>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >>>   really_probe+0x281/0x660 drivers/base/dd.c:509
> >>>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
> >>>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
> >>>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >>>   __device_attach+0x217/0x360 drivers/base/dd.c:843
> >>>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >>>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
> >>>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >>>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >>>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >>>   really_probe+0x281/0x660 drivers/base/dd.c:509
> >>>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
> >>>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
> >>>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >>>   __device_attach+0x217/0x360 drivers/base/dd.c:843
> >>>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >>>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
> >>>   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
> >>>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
> >>>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
> >>>   port_event drivers/usb/core/hub.c:5350 [inline]
> >>>   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
> >>>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
> >>>   process_scheduled_works kernel/workqueue.c:2331 [inline]
> >>>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
> >>>   kthread+0x30b/0x410 kernel/kthread.c:255
> >>>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >>>
> >>> The buggy address belongs to the variable:
> >>>   id+0x100/0x120
> >>>
> >>> Memory state around the buggy address:
> >>>   ffffffff89c9e480: fa fa fa fa 00 00 fa fa fa fa fa fa 00 00 00 00
> >>>   ffffffff89c9e500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >>>> ffffffff89c9e580: 00 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa
> >>>                                                         ^
> >>>   ffffffff89c9e600: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
> >>>   ffffffff89c9e680: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
> >>> ==================================================================
> >>>
> >>> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> >>> ---
> >>>  drivers/media/dvb-frontends/dvb-pll.c | 19 +++----------------
> >>>  1 file changed, 3 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
> >>> index ba0c49107bd2..c3a04751e9cf 100644
> >>> --- a/drivers/media/dvb-frontends/dvb-pll.c
> >>> +++ b/drivers/media/dvb-frontends/dvb-pll.c
> >>> @@ -33,19 +33,11 @@ struct dvb_pll_priv {
> >>>       u32 bandwidth;
> >>>  };
> >>>
> >>> -#define DVB_PLL_MAX 64
> >>> -
> >>> -static unsigned int dvb_pll_devcount;
> >>>
> >>>  static int debug;
> >>>  module_param(debug, int, 0644);
> >>>  MODULE_PARM_DESC(debug, "enable verbose debug messages");
> >>>
> >>> -static unsigned int id[DVB_PLL_MAX] =
> >>> -     { [ 0 ... (DVB_PLL_MAX-1) ] = DVB_PLL_UNDEFINED };
> >>> -module_param_array(id, int, NULL, 0644);
> >>> -MODULE_PARM_DESC(id, "force pll id to use (DEBUG ONLY)");
> >>> -
> >> Mike, you introduced this module parameter in:
> >>
> >> commit 05a4611b5d71ad6f968fdeef092c24914570898b
> >> Author:     Michael Krufky <mkrufky@linuxtv.org>
> >> AuthorDate: Fri Sep 7 18:19:57 2007 -0300
> >>
> >>     V4L/DVB (6228): dvb-pll: add module option to specify rf input
> >>
> >>     Add a module option to dvb-pll, called "input" to specify which rf
> >>     input to use on devices with multiple rf inputs.  If the module option
> >>     is not specified, then the driver will autoselect the rf input, as per
> >>     previous behavior.
> >>
> >>     Signed-off-by: Michael Krufky <mkrufky@linuxtv.org>
> >>     Signed-off-by: Mauro Carvalho Chehab <mchehab@infradead.org>
> >>
> >> What was your motivation?
> > Sean,
> >
> > This was to support DVB-T/C & ATSC/QAM-B cards that had multiple RF
> > input options intended to be used to connect an aerial and a Cable TV
> > input source simultaneously.  It should not be removed.
> 
> Hi Mike,
> 
> Thanks for clarifying.
> 
> This patch tries to fix global out of bounds reported by syzbot.
> 
> 1st patch i submitted, checked for DVB_MAX_PLL before adding the device in dvb_pll_attach(), Akihiro pointed that this would put a limit on number of devices that can be attached.
> 
> 2nd patch, was to remove the module parameters, as per suggestion from Akihiro.
> 
> Should the module parameters use DEFINE_IDA and ida simple_get,ida_simple_remove, as suggested by Sean.
> 
> Can you please suggest on how to fix it.

I had something like this in mind. This is compile-tested only.

Thanks,
Sean


From b6a9118b8c306898add0707e334d29cca5573c78 Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Thu, 1 Aug 2019 14:02:21 +0900
Subject: [PATCH] media: dvb-frontends: use ida for pll number

KASAN: global-out-of-bounds Read in dvb_pll_attach

Syzbot reported global-out-of-bounds Read in dvb_pll_attach, while
accessing id[dvb_pll_devcount], because dvb_pll_devcount was 65,
that is more than size of 'id' which is DVB_PLL_MAX(64).

Rather than increasing dvb_pll_devcount every time, use ida so that
numbers are allocated correctly. This does mean that no more than
64 devices can be attached at the same time, but this is more than
sufficient.

Reported-by: syz...@syzkaller.appspotmail.com

usb 1-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the
software demuxer
dvbdev: DVB: registering new adapter (774 Friio White ISDB-T USB2.0)
usb 1-1: media controller created
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
tc90522 0-0018: Toshiba TC90522 attached.
usb 1-1: DVB: registering adapter 0 frontend 0 (Toshiba TC90522 ISDB-T
module)...
dvbdev: dvb_create_media_entity: media entity 'Toshiba TC90522 ISDB-T
module' registered.
==================================================================
BUG: KASAN: global-out-of-bounds in dvb_pll_attach+0x6c5/0x830
drivers/media/dvb-frontends/dvb-pll.c:798
Read of size 4 at addr ffffffff89c9e5e0 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc6+ #13
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  dvb_pll_attach+0x6c5/0x830 drivers/media/dvb-frontends/dvb-pll.c:798
  dvb_pll_probe+0xfe/0x174 drivers/media/dvb-frontends/dvb-pll.c:877
  i2c_device_probe+0x790/0xaa0 drivers/i2c/i2c-core-base.c:389
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  i2c_new_client_device+0x5b3/0xc40 drivers/i2c/i2c-core-base.c:778
  i2c_new_device+0x19/0x50 drivers/i2c/i2c-core-base.c:821
  dvb_module_probe+0xf9/0x220 drivers/media/dvb-core/dvbdev.c:985
  friio_tuner_attach+0x125/0x1d0 drivers/media/usb/dvb-usb-v2/gl861.c:536
  dvb_usbv2_adapter_frontend_init
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:675 [inline]
  dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804
[inline]
  dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
  dvb_usbv2_probe.cold+0x24dc/0x255d
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the variable:
  id+0x100/0x120

Memory state around the buggy address:
  ffffffff89c9e480: fa fa fa fa 00 00 fa fa fa fa fa fa 00 00 00 00
  ffffffff89c9e500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffffff89c9e580: 00 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa
                                                        ^
  ffffffff89c9e600: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
  ffffffff89c9e680: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
==================================================================

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/dvb-frontends/dvb-pll.c | 41 ++++++++++++++++-----------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
index ba0c49107bd2..ec0c1c93c9ef 100644
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -9,6 +9,7 @@
 
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/idr.h>
 #include <linux/dvb/frontend.h>
 #include <asm/types.h>
 
@@ -34,8 +35,7 @@ struct dvb_pll_priv {
 };
 
 #define DVB_PLL_MAX 64
-
-static unsigned int dvb_pll_devcount;
+static DEFINE_IDA(pll_ida);
 
 static int debug;
 module_param(debug, int, 0644);
@@ -787,6 +787,7 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 	struct dvb_pll_priv *priv = NULL;
 	int ret;
 	const struct dvb_pll_desc *desc;
+	int nr;
 
 	b1 = kmalloc(1, GFP_KERNEL);
 	if (!b1)
@@ -795,9 +796,15 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 	b1[0] = 0;
 	msg.buf = b1;
 
-	if ((id[dvb_pll_devcount] > DVB_PLL_UNDEFINED) &&
-	    (id[dvb_pll_devcount] < ARRAY_SIZE(pll_list)))
-		pll_desc_id = id[dvb_pll_devcount];
+	nr = ida_simple_get(&pll_ida, 0, DVB_PLL_MAX, GFP_KERNEL);
+	if (nr < 0) {
+		kfree(b1);
+		return NULL;
+	}
+
+	if ((id[nr] > DVB_PLL_UNDEFINED) &&
+	    (id[nr] < ARRAY_SIZE(pll_list)))
+		pll_desc_id = id[nr];
 
 	BUG_ON(pll_desc_id < 1 || pll_desc_id >= ARRAY_SIZE(pll_list));
 
@@ -808,24 +815,20 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 			fe->ops.i2c_gate_ctrl(fe, 1);
 
 		ret = i2c_transfer (i2c, &msg, 1);
-		if (ret != 1) {
-			kfree(b1);
-			return NULL;
-		}
+		if (ret != 1)
+			goto out;
 		if (fe->ops.i2c_gate_ctrl)
 			     fe->ops.i2c_gate_ctrl(fe, 0);
 	}
 
 	priv = kzalloc(sizeof(struct dvb_pll_priv), GFP_KERNEL);
-	if (!priv) {
-		kfree(b1);
-		return NULL;
-	}
+	if (!priv)
+		goto out;
 
 	priv->pll_i2c_address = pll_addr;
 	priv->i2c = i2c;
 	priv->pll_desc = desc;
-	priv->nr = dvb_pll_devcount++;
+	priv->nr = nr;
 
 	memcpy(&fe->ops.tuner_ops, &dvb_pll_tuner_ops,
 	       sizeof(struct dvb_tuner_ops));
@@ -858,6 +861,11 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 	kfree(b1);
 
 	return fe;
+out:
+	kfree(b1);
+	ida_simple_remove(&pll_ida, nr);
+
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_pll_attach);
 
@@ -894,9 +902,10 @@ dvb_pll_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 static int dvb_pll_remove(struct i2c_client *client)
 {
-	struct dvb_frontend *fe;
+	struct dvb_frontend *fe = i2c_get_clientdata(client);
+	struct dvb_pll_priv *priv = fe->tuner_priv;
 
-	fe = i2c_get_clientdata(client);
+	ida_simple_remove(&pll_ida, priv->nr);
 	dvb_pll_release(fe);
 	return 0;
 }
-- 
2.21.0

