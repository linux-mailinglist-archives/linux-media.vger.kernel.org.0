Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67B820190B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 19:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387546AbgFSREy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 13:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733192AbgFSREv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 13:04:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19A9C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 10:04:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80646556;
        Fri, 19 Jun 2020 19:04:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592586288;
        bh=FIP4q7Izr0lMqul61mbu67jF8tDPnC38NiQ8gzLXQKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tixLlKmOZO6ADs1bZWqd223P+M/jgTIOMuR/n4CjI1F9qO3YYm4/wvxCNy4MydY3U
         TassVXEGcKsrOxhB9DpTmodM4aS8efMUGtcdmH9ZBotn3Q7IY3piZ1yDSJ7VaWneB1
         XFF/iQ4dxhH8FYHszHcpxKZf2TmvTTZEpJxf0Ztk=
Date:   Fri, 19 Jun 2020 20:04:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 000/107] media: ti-vpe: cal: Add media controller
 support
Message-ID: <20200619170425.GM5823@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <52af8e54-2ad9-6f2f-3c61-6db08d7726dc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52af8e54-2ad9-6f2f-3c61-6db08d7726dc@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Jun 16, 2020 at 02:43:09PM +0300, Tomi Valkeinen wrote:
> Hi Laurent,
> 
> On 15/06/2020 02:57, Laurent Pinchart wrote:
> > Hello,
> > 
> > This small patch series adds media controller support to the ti-cal
> > driver.
> 
> I did some small testing on AM6, and after third module unload I got:

My bad, it's a bug in "media: ti-vpe: cal: Create subdev for CAMERARX"
that erronously calls of_node_put(phy->sensor_ep_node) on success. I'll
fix it in v2.

> [   75.292797] OF: ERROR: Bad of_node_put() on /interconnect@100000/i2c@2010000/ov5640@3c/port/endpoint
> [   75.292839] ------------[ cut here ]------------
> [   75.292849] refcount_t: addition on 0; use-after-free.
> [   75.292856] WARNING: CPU: 0 PID: 421 at lib/refcount.c:25 refcount_warn_saturate+0xa0/0x148
> [   75.292861] Modules linked in: ov5640 ti_cal(-) tidss ti_tfp410 tc358767 display_connector phy_j721e_wiz phy_cadence_torrent panel_simple drm_kms_helper drm drm_panel_orientation_quirks cfbfillrect cfbimgblt cfbcopyarea [last unloaded: ov5640]
> [   75.292935] CPU: 0 PID: 421 Comm: rmmod Not tainted 5.8.0-rc1-00107-g5de7cabe3995 #6
> [   75.292941] Hardware name: Texas Instruments AM654 Base Board (DT)
> [   75.292946] pstate: 00000085 (nzcv daIf -PAN -UAO BTYPE=--)
> [   75.292951] pc : refcount_warn_saturate+0xa0/0x148
> [   75.292956] lr : refcount_warn_saturate+0xa0/0x148
> [   75.292961] sp : ffff80001324f760
> [   75.292965] x29: ffff80001324f760 x28: ffff0a00ffffff05 
> [   75.292978] x27: ffff800011f2731a x26: ffff800010e21c28 
> [   75.292991] x25: ffff800010b6d468 x24: ffff00087ff30338 
> [   75.293003] x23: ffff800011f276d8 x22: 0000000000000005 
> [   75.293016] x21: 0000000000000005 x20: ffff800011f276d8 
> [   75.293028] x19: ffff00087ff30378 x18: 0000000000000000 
> [   75.293041] x17: 0000000000000000 x16: 0000000000000000 
> [   75.293054] x15: 0000000000000004 x14: 0000000000048963 
> [   75.293066] x13: 0000000000000000 x12: 0000000000000000 
> [   75.293079] x11: ffff8000116e1540 x10: 0000000000000000 
> [   75.293091] x9 : 000000006d17ab9f x8 : 612d657375203b30 
> [   75.293104] x7 : 206e6f206e6f6974 x6 : ffff00087f823c12 
> [   75.293116] x5 : 0000000000000000 x4 : ffff00087f823bb0 
> [   75.293128] x3 : 0000000000000000 x2 : 0000000000000023 
> [   75.293141] x1 : 2e76dc4eebb2b000 x0 : 0000000000000000 
> [   75.293153] Call trace:
> [   75.293158]  refcount_warn_saturate+0xa0/0x148
> [   75.293163]  kobject_get+0x40/0xb0
> [   75.293168]  of_node_get+0x20/0x38
> [   75.293172]  of_fwnode_get+0x34/0x58
> [   75.293177]  fwnode_get_nth_parent+0x34/0x78
> [   75.293182]  fwnode_full_name_string+0x4c/0xc8
> [   75.293187]  device_node_string+0x318/0x3f0
> [   75.293192]  pointer+0x204/0x2e0
> [   75.293196]  vsnprintf+0x204/0x728
> [   75.293201]  vscnprintf+0x30/0x68
> [   75.293206]  vprintk_store+0x64/0x210
> [   75.293210]  vprintk_emit+0xd4/0x340
> [   75.293215]  vprintk_default+0x3c/0x48
> [   75.293219]  vprintk_func+0xec/0x258
> [   75.293224]  printk+0x60/0x84
> [   75.293229]  of_node_release+0xcc/0xd8
> [   75.293233]  kobject_put+0x8c/0x200
> [   75.293238]  of_node_put+0x18/0x28
> [   75.293243]  cal_camerarx_destroy+0x28/0x50 [ti_cal]
> [   75.293247]  cal_remove+0xa4/0x110 [ti_cal]
> [   75.293252]  platform_drv_remove+0x2c/0x50
> [   75.293257]  device_release_driver_internal+0xfc/0x1d0
> [   75.293262]  driver_detach+0x50/0xe0
> [   75.293267]  bus_remove_driver+0x5c/0xd8
> [   75.293272]  driver_unregister+0x30/0x60
> [   75.293276]  platform_driver_unregister+0x14/0x20
> [   75.293281]  cal_pdrv_exit+0x1c/0xb060 [ti_cal]
> [   75.293286]  __arm64_sys_delete_module+0x1a8/0x250
> [   75.293291]  el0_svc_common.constprop.0+0x74/0x198
> [   75.293296]  do_el0_svc+0x24/0x90
> [   75.293300]  el0_sync_handler+0x9c/0x1b8
> [   75.293305]  el0_sync+0x158/0x180
> [   75.293309] irq event stamp: 4884
> [   75.293315] hardirqs last  enabled at (4883): [<ffff800010235b14>] slab_free_freelist_hook+0xf4/0x190
> [   75.293322] hardirqs last disabled at (4884): [<ffff8000100cf090>] vprintk_emit+0x88/0x340
> [   75.293328] softirqs last  enabled at (4150): [<ffff800010000db8>] _stext+0x5b8/0x5fc
> [   75.293333] softirqs last disabled at (4135): [<ffff800010047f7c>] irq_exit+0x114/0x128
> [   75.293339] ---[ end trace 3ee89555752a3b07 ]---
> [   75.293344] ------------[ cut here ]------------
> [   75.293349] refcount_t: underflow; use-after-free.
> [   75.293356] WARNING: CPU: 0 PID: 421 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
> [   75.293360] Modules linked in: ov5640 ti_cal(-) tidss ti_tfp410 tc358767 display_connector phy_j721e_wiz phy_cadence_torrent panel_simple drm_kms_helper drm drm_panel_orientation_quirks cfbfillrect cfbimgblt cfbcopyarea [last unloaded: ov5640]
> [   75.293433] CPU: 0 PID: 421 Comm: rmmod Tainted: G        W         5.8.0-rc1-00107-g5de7cabe3995 #6
> [   75.293438] Hardware name: Texas Instruments AM654 Base Board (DT)
> [   75.293443] pstate: 00000085 (nzcv daIf -PAN -UAO BTYPE=--)
> [   75.293448] pc : refcount_warn_saturate+0xf4/0x148
> [   75.293453] lr : refcount_warn_saturate+0xf4/0x148
> [   75.293458] sp : ffff80001324f740
> [   75.293462] x29: ffff80001324f740 x28: ffff0a00ffffff05 
> [   75.293475] x27: ffff800011f2731a x26: ffff800010e21c28 
> [   75.293487] x25: ffff800010b6d468 x24: ffff00087ff30338 
> [   75.293500] x23: ffff800011f276d8 x22: 0000000000000005 
> [   75.293512] x21: 0000000000000005 x20: ffff00087ff30208 
> [   75.293525] x19: ffff00087ff30378 x18: 0000000000000000 
> [   75.293537] x17: 0000000000000000 x16: 0000000000000000 
> [   75.293550] x15: 0000000000000004 x14: 0000000000048963 
> [   75.293562] x13: 0000000000000000 x12: 0000000000000000 
> [   75.293574] x11: ffff8000116e1540 x10: 0000000000000000 
> [   75.293587] x9 : 000000006d17ab9f x8 : 72657466612d6573 
> [   75.293600] x7 : 75203b776f6c6672 x6 : ffff00087f8246d1 
> [   75.293612] x5 : 0000000000000000 x4 : ffff00087f823bb0 
> [   75.293625] x3 : 0000000000000000 x2 : 0000000000000023 
> [   75.293637] x1 : 2e76dc4eebb2b000 x0 : 0000000000000000 
> [   75.293650] Call trace:
> [   75.293655]  refcount_warn_saturate+0xf4/0x148
> [   75.293659]  kobject_put+0x140/0x200
> [   75.293664]  of_node_put+0x18/0x28
> [   75.293668]  of_fwnode_put+0x34/0x48
> [   75.293673]  fwnode_get_next_parent+0x48/0x80
> [   75.293678]  fwnode_get_nth_parent+0x4c/0x78
> [   75.293683]  fwnode_full_name_string+0x4c/0xc8
> [   75.293688]  device_node_string+0x318/0x3f0
> [   75.293693]  pointer+0x204/0x2e0
> [   75.293697]  vsnprintf+0x204/0x728
> [   75.293702]  vscnprintf+0x30/0x68
> [   75.293706]  vprintk_store+0x64/0x210
> [   75.293711]  vprintk_emit+0xd4/0x340
> [   75.293715]  vprintk_default+0x3c/0x48
> [   75.293720]  vprintk_func+0xec/0x258
> [   75.293724]  printk+0x60/0x84
> [   75.293729]  of_node_release+0xcc/0xd8
> [   75.293734]  kobject_put+0x8c/0x200
> [   75.293738]  of_node_put+0x18/0x28
> [   75.293743]  cal_camerarx_destroy+0x28/0x50 [ti_cal]
> [   75.293748]  cal_remove+0xa4/0x110 [ti_cal]
> [   75.293753]  platform_drv_remove+0x2c/0x50
> [   75.293758]  device_release_driver_internal+0xfc/0x1d0
> [   75.293763]  driver_detach+0x50/0xe0
> [   75.293768]  bus_remove_driver+0x5c/0xd8
> [   75.293772]  driver_unregister+0x30/0x60
> [   75.293777]  platform_driver_unregister+0x14/0x20
> [   75.293782]  cal_pdrv_exit+0x1c/0xb060 [ti_cal]
> [   75.293787]  __arm64_sys_delete_module+0x1a8/0x250
> [   75.293792]  el0_svc_common.constprop.0+0x74/0x198
> [   75.293796]  do_el0_svc+0x24/0x90
> [   75.293801]  el0_sync_handler+0x9c/0x1b8
> [   75.293806]  el0_sync+0x158/0x180
> [   75.293810] irq event stamp: 4884
> [   75.293816] hardirqs last  enabled at (4883): [<ffff800010235b14>] slab_free_freelist_hook+0xf4/0x190
> [   75.293822] hardirqs last disabled at (4884): [<ffff8000100cf090>] vprintk_emit+0x88/0x340
> [   75.293828] softirqs last  enabled at (4150): [<ffff800010000db8>] _stext+0x5b8/0x5fc
> [   75.293834] softirqs last disabled at (4135): [<ffff800010047f7c>] irq_exit+0x114/0x128
> [   75.293839] ---[ end trace 3ee89555752a3b08 ]---
> [   75.293844] ------------[ cut here ]------------
> [   75.293849] refcount_t: saturated; leaking memory.
> [   75.293855] WARNING: CPU: 0 PID: 421 at lib/refcount.c:22 refcount_warn_saturate+0x74/0x148
> [   75.293859] Modules linked in: ov5640 ti_cal(-) tidss ti_tfp410 tc358767 display_connector phy_j721e_wiz phy_cadence_torrent panel_simple drm_kms_helper drm drm_panel_orientation_quirks cfbfillrect cfbimgblt cfbcopyarea [last unloaded: ov5640]
> [   75.293932] CPU: 0 PID: 421 Comm: rmmod Tainted: G        W         5.8.0-rc1-00107-g5de7cabe3995 #6
> [   75.293938] Hardware name: Texas Instruments AM654 Base Board (DT)
> [   75.293943] pstate: 00000085 (nzcv daIf -PAN -UAO BTYPE=--)
> [   75.293948] pc : refcount_warn_saturate+0x74/0x148
> [   75.293952] lr : refcount_warn_saturate+0x74/0x148
> [   75.293957] sp : ffff80001324f760
> [   75.293961] x29: ffff80001324f760 x28: ffff0a00ffffff05 
> [   75.293974] x27: ffff800011f2731a x26: ffff800010e21c28 
> [   75.293986] x25: ffff800010b6d468 x24: ffff00087ff30338 
> [   75.293999] x23: ffff800011f276d8 x22: 0000000000000004 
> [   75.294011] x21: 0000000000000004 x20: ffff0000ffffff00 
> [   75.294024] x19: ffff00087ff30378 x18: 0000000000000000 
> [   75.294036] x17: 0000000000000000 x16: 0000000000000000 
> [   75.294049] x15: 0000000000000004 x14: 0000000000048963 
> [   75.294061] x13: 0000000000000000 x12: 0000000000000000 
> [   75.294073] x11: ffff8000116e1540 x10: 0000000000000000 
> [   75.294086] x9 : 00000000fffffffe x8 : 6c203b6465746172 
> [   75.294098] x7 : 75746173203a745f x6 : ffff00087f8251c4 
> [   75.294111] x5 : 0000000000000000 x4 : ffff00087f823bb0 
> [   75.294123] x3 : 0000000000000000 x2 : 0000000000000023 
> [   75.294136] x1 : 2e76dc4eebb2b000 x0 : 0000000000000000 
> [   75.294148] Call trace:
> [   75.294153]  refcount_warn_saturate+0x74/0x148
> [   75.294157]  kobject_get+0x78/0xb0
> [   75.294162]  of_node_get+0x20/0x38
> [   75.294166]  of_fwnode_get+0x34/0x58
> [   75.294171]  fwnode_get_nth_parent+0x34/0x78
> [   75.294176]  fwnode_full_name_string+0x4c/0xc8
> [   75.294181]  device_node_string+0x318/0x3f0
> [   75.294186]  pointer+0x204/0x2e0
> [   75.294190]  vsnprintf+0x204/0x728
> [   75.294195]  vscnprintf+0x30/0x68
> [   75.294199]  vprintk_store+0x64/0x210
> [   75.294204]  vprintk_emit+0xd4/0x340
> [   75.294208]  vprintk_default+0x3c/0x48
> [   75.294213]  vprintk_func+0xec/0x258
> [   75.294218]  printk+0x60/0x84
> [   75.294222]  of_node_release+0xcc/0xd8
> [   75.294227]  kobject_put+0x8c/0x200
> [   75.294231]  of_node_put+0x18/0x28
> [   75.294236]  cal_camerarx_destroy+0x28/0x50 [ti_cal]
> [   75.294241]  cal_remove+0xa4/0x110 [ti_cal]
> [   75.294246]  platform_drv_remove+0x2c/0x50
> [   75.294251]  device_release_driver_internal+0xfc/0x1d0
> [   75.294255]  driver_detach+0x50/0xe0
> [   75.294260]  bus_remove_driver+0x5c/0xd8
> [   75.294265]  driver_unregister+0x30/0x60
> [   75.294270]  platform_driver_unregister+0x14/0x20
> [   75.294275]  cal_pdrv_exit+0x1c/0xb060 [ti_cal]
> [   75.294280]  __arm64_sys_delete_module+0x1a8/0x250
> [   75.294285]  el0_svc_common.constprop.0+0x74/0x198
> [   75.294289]  do_el0_svc+0x24/0x90
> [   75.294294]  el0_sync_handler+0x9c/0x1b8
> [   75.294299]  el0_sync+0x158/0x180
> [   75.294303] irq event stamp: 4884
> [   75.294309] hardirqs last  enabled at (4883): [<ffff800010235b14>] slab_free_freelist_hook+0xf4/0x190
> [   75.294315] hardirqs last disabled at (4884): [<ffff8000100cf090>] vprintk_emit+0x88/0x340
> [   75.294320] softirqs last  enabled 
> [   75.294329] Lost 2 message(s)!
> [   76.258340] CPU: 1 PID: 421 Comm: rmmod Tainted: G        W         5.8.0-rc1-00107-g5de7cabe3995 #6
> [   76.267490] Hardware name: Texas Instruments AM654 Base Board (DT)
> [   76.273689] Call trace:
> [   76.276160]  dump_backtrace+0x0/0x1d8
> [   76.279843]  show_stack+0x18/0x28
> [   76.283177]  dump_stack+0xe4/0x150
> [   76.286596]  of_node_release+0xd0/0xd8
> [   76.290360]  kobject_put+0x8c/0x200
> [   76.293864]  of_node_put+0x18/0x28
> [   76.297296]  cal_camerarx_destroy+0x28/0x50 [ti_cal]
> [   76.302283]  cal_remove+0xa4/0x110 [ti_cal]
> [   76.306484]  platform_drv_remove+0x2c/0x50
> [   76.310597]  device_release_driver_internal+0xfc/0x1d0
> [   76.315748]  driver_detach+0x50/0xe0
> [   76.319338]  bus_remove_driver+0x5c/0xd8
> [   76.323274]  driver_unregister+0x30/0x60
> [   76.327211]  platform_driver_unregister+0x14/0x20
> [   76.331936]  cal_pdrv_exit+0x1c/0xb060 [ti_cal]
> [   76.336483]  __arm64_sys_delete_module+0x1a8/0x250
> [   76.341289]  el0_svc_common.constprop.0+0x74/0x198
> [   76.346094]  do_el0_svc+0x24/0x90
> [   76.349426]  el0_sync_handler+0x9c/0x1b8
> [   76.353361]  el0_sync+0x158/0x180

-- 
Regards,

Laurent Pinchart
