Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F453BEFEF
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 20:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhGGTAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 15:00:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45740 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhGGTAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 15:00:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 167Iuh5Z013295;
        Wed, 7 Jul 2021 13:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1625684203;
        bh=ysXKhu/YQEOD9RH6IXI3N9bmAnu537/RgcFRSisedoY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=lcqWWpADbVZw4WQtTa94+/1MYkA3oyxHoKeOUUh99wr7cI9GkwV9WZwtB+3Xxy2Fc
         s7ou9kbJf1duh1pHVzLl5qBi4M77WF1n68uTkxW1sleK/JAgSu6tMQ/HG271QehAXv
         MeP4D0+m7h4jeTy7oOh/My05WG0BCezN6iWFO0xE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 167IufKo056691
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Jul 2021 13:56:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Jul
 2021 13:56:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Jul 2021 13:56:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 167IudZJ097674;
        Wed, 7 Jul 2021 13:56:41 -0500
Date:   Thu, 8 Jul 2021 00:26:38 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>, Benoit Parrot <bparrot@ti.com>,
        Bert Vermeulen <bert@biot.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Qiushi Wu <wu000273@umn.edu>, Raag Jadav <raagjadav@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Zou Wei <zou_wei@huawei.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] CSI2RX support on J721E
Message-ID: <20210707185636.xxu6n6p4gihrs37d@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
 <dd3b13ec-a883-5b22-47ce-d6e591b674aa@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dd3b13ec-a883-5b22-47ce-d6e591b674aa@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thanks for looking into the patches.

On 01/07/21 10:56AM, Tomi Valkeinen wrote:
> Hi Pratyush,
> 
> On 24/06/2021 22:21, Pratyush Yadav wrote:
> > Hi,
> > 
> > This series adds support for CSI2 capture on J721E. It includes some
> > fixes to the Cadence CSI2RX driver, adds runtime PM support to OV5640
> > driver, and finally adds the TI CSI2RX wrapper driver.
> > 
> > This series used to include the DPHY and DMA engine patches as well, but
> > they have been split off to facilitate easier merging. Patch 3 is
> > build-dependent on the DPHY series [0].
> > 
> > The DMA engine patch [1] can go in any order since that is only a run
> > time dependency. Things probably won't work without it but it will still
> > build fine.
> > 
> > Tested on TI's J721E with OV5640 sensor.
> 
> I applied these (csi-2 rx, phy, dma-engine) to linux-media/master, and added dts changes to add the csi2-rx. When sending the series, can you also push the branch you use for testing, as the posted patches do not include everything needed?

Please use https://github.com/prati0100/linux-next/ branch "capture"

I will include the link in the cover letter from next version onwards.

> 
> Here are some notes from quick tests:
> 
> Capture works, but the fps is ~28.98. I would expect it to be closer to 30. Are the clocks configured correctly?

I see this as well. I figured this had something to do with the sensor. 
Which clock could cause this? I don't think anything in Cadence CSI2RX 
bridge is sensitive to frame rate.

> 
> When I load the modules, I get:
> 
> [  237.322258] platform 4504000.csi-bridge: Fixing up cyclic dependency with 9-003c

Ok, I enabled lockdep configs and I see it too. Will look into it.

> 
> I get a warning from DMA-API debug:
> 
> [  298.774236] ------------[ cut here ]------------
> [  298.779109] DMA-API: ti-udma 31150000.dma-controller: mapping sg segment longer than device claims to support [len=1900544] [max=65536]
> [  298.791331] WARNING: CPU: 1 PID: 605 at kernel/dma/debug.c:1172 debug_dma_map_sg+0x304/0x390
> [  298.799764] Modules linked in: ov5640 j721e_csi2rx cdns_csi2rx cdns_dphy v4l2_fwnode v4l2_async tidss ti_tfp410 tc358767 display_connector cdns_mhdp8546 panel_simple
>  drm_kms_helper drm drm_panel_orientation_quirks cfbfillrect cfbimgblt cfbcopyarea phy_j721e_wiz phy_cadence_torrent
> [  298.824656] CPU: 1 PID: 605 Comm: cam-mplex.py Not tainted 5.13.0-rc4-00417-g3331992006e9 #3
> [  298.833079] Hardware name: Texas Instruments K3 J721E SoC (DT)
> [  298.838900] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> [  298.844895] pc : debug_dma_map_sg+0x304/0x390
> [  298.849245] lr : debug_dma_map_sg+0x304/0x390
> [  298.853593] sp : ffff800014dcf730
> [  298.856899] x29: ffff800014dcf730 x28: ffff00080154a880 x27: ffffffffffffffff
> [  298.864032] x26: 0000000000000000 x25: 0000000000000002 x24: 0000000000000001
> [  298.871164] x23: ffff80001163abe0 x22: 0000000000000000 x21: 0000000000000001
> [  298.878295] x20: ffff000801fa3010 x19: ffff000807585300 x18: 0000000000000000
> [  298.885426] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000030
> [  298.892558] x14: 6e61687420726567 x13: 6e6f6c20746e656d x12: ffff800011a91578
> [  298.899689] x11: 00000000000c0000 x10: ffff8000116b18f8 x9 : ffff8000100eabe0
> [  298.906820] x8 : ffff8000116598f8 x7 : ffff8000116b18f8 x6 : 0000000000000001
> [  298.913951] x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff800011260000
> [  298.921082] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00080673b000
> [  298.928214] Call trace:
> [  298.930653]  debug_dma_map_sg+0x304/0x390
> [  298.934655]  dma_map_sg_attrs+0x70/0xb0
> [  298.938487]  drm_gem_map_dma_buf+0x6c/0xf0 [drm]
> [  298.943185]  __map_dma_buf+0x28/0x80
> [  298.946756]  dma_buf_map_attachment+0xe4/0x220
> [  298.951191]  vb2_dc_map_dmabuf+0x3c/0x150
> [  298.955194]  __prepare_dmabuf+0x1dc/0x514
> [  298.959197]  __buf_prepare+0x1a0/0x25c
> [  298.962938]  vb2_core_qbuf+0x3d4/0x72c
> [  298.966679]  vb2_qbuf+0x9c/0xf4
> [  298.969814]  vb2_ioctl_qbuf+0x68/0x7c
> [  298.973468]  v4l_qbuf+0x54/0x70
> [  298.976603]  __video_do_ioctl+0x194/0x400
> [  298.980603]  video_usercopy+0x374/0xa14
> [  298.984431]  video_ioctl2+0x24/0x4c
> [  298.987912]  v4l2_ioctl+0x4c/0x70
> [  298.991222]  __arm64_sys_ioctl+0xb4/0xfc
> [  298.995138]  invoke_syscall+0x50/0x120
> [  298.998885]  el0_svc_common.constprop.0+0x68/0x104
> [  299.003667]  do_el0_svc+0x30/0x9c
> [  299.006976]  el0_svc+0x2c/0x54
> [  299.010025]  el0_sync_handler+0x1a8/0x1ac
> [  299.014025]  el0_sync+0x198/0x1c0
> [  299.017333] irq event stamp: 98582
> [  299.020727] hardirqs last  enabled at (98581): [<ffff8000100ec2bc>] console_unlock+0x53c/0x6b4
> [  299.029325] hardirqs last disabled at (98582): [<ffff800010be4bd4>] el1_dbg+0x24/0xa0
> [  299.037144] softirqs last  enabled at (98568): [<ffff800010010ba0>] __do_softirq+0x500/0x6bc
> [  299.045565] softirqs last disabled at (98413): [<ffff80001005d504>] __irq_exit_rcu+0x1d4/0x1e0
> [  299.054164] ---[ end trace bfe019acb2a9a04f ]---

I don't get this warning. I remember you reported this last time as 
well. I tried reproducing this but have not managed to do so. I have 
CONFIG_DMA_API_DEBUG and CONFIG_DMA_API_DEBUG_SG enabled.

What application/command do you use to run into this? I use yavta and 
don't see this.

> 
> I get a warning from media graph walk:

I don't see this one either.

> 
> [  299.066357] WARNING: CPU: 1 PID: 605 at drivers/media/mc/mc-entity.c:343 media_graph_walk_next+0x268/0x2cc

Line 343 seems to be
  
  lockdep_assert_held(&entity->graph_obj.mdev->graph_mutex);

I wonder why I don't hit this even with lockdep configs (CONFIG_LOCKDEP, 
CONFIG_DEBUG_LOCKDEP).

> [  299.076005] Modules linked in: ov5640 j721e_csi2rx cdns_csi2rx cdns_dphy v4l2_fwnode v4l2_async tidss ti_tfp410 tc358767 display_connector cdns_mhdp8546 panel_simple
>  drm_kms_helper drm drm_panel_orientation_quirks cfbfillrect cfbimgblt cfbcopyarea phy_j721e_wiz phy_cadence_torrent
> [  299.100889] CPU: 1 PID: 605 Comm: cam-mplex.py Tainted: G        W         5.13.0-rc4-00417-g3331992006e9 #3
> [  299.110698] Hardware name: Texas Instruments K3 J721E SoC (DT)
> [  299.116518] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> [  299.122513] pc : media_graph_walk_next+0x268/0x2cc
> [  299.127295] lr : media_graph_walk_next+0x264/0x2cc
> [  299.132076] sp : ffff800014dcfa40
> [  299.135382] x29: ffff800014dcfa40 x28: 0000000000000000 x27: 0000000040045612
> [  299.142514] x26: 0000000000000001 x25: ffff800010d890f0 x24: ffff0008055c8148
> [  299.149645] x23: ffff0008055c8148 x22: ffff80001182bc40 x21: ffff80001163e2e8
> [  299.156776] x20: ffff80001182bbd0 x19: ffff0008055c8cb8 x18: 0000000000000000
> [  299.163907] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
> [  299.171037] x14: 0000000000000002 x13: 0000000000007e6f x12: 0000000000000002
> [  299.178169] x11: 0000000000040464 x10: 00000000916d3a5c x9 : ffff8000093110c0
> [  299.185301] x8 : ffff000807583d88 x7 : 0000000000000000 x6 : ffff00080673b900
> [  299.192431] x5 : 000000000000000a x4 : ffff000807583d80 x3 : ffff800011260000
> [  299.199562] x2 : 00000000000000c0 x1 : 00000000000000c0 x0 : 0000000000000000
> [  299.206693] Call trace:
> [  299.209133]  media_graph_walk_next+0x268/0x2cc
> [  299.213568]  ti_csi2rx_start_streaming+0xe0/0x5c8 [j721e_csi2rx]
> [  299.219569]  vb2_start_streaming+0x70/0x160
> [  299.223745]  vb2_core_streamon+0x9c/0x1a0
> [  299.227745]  vb2_ioctl_streamon+0x68/0xbc
> [  299.231747]  v4l_streamon+0x30/0x40
> [  299.235230]  __video_do_ioctl+0x194/0x400
> [  299.239230]  video_usercopy+0x374/0xa14
> [  299.243058]  video_ioctl2+0x24/0x4c
> [  299.246539]  v4l2_ioctl+0x4c/0x70
> [  299.249847]  __arm64_sys_ioctl+0xb4/0xfc
> [  299.253764]  invoke_syscall+0x50/0x120
> [  299.257508]  el0_svc_common.constprop.0+0x68/0x104
> [  299.262291]  do_el0_svc+0x30/0x9c
> [  299.265599]  el0_svc+0x2c/0x54
> [  299.268648]  el0_sync_handler+0x1a8/0x1ac
> [  299.272647]  el0_sync+0x198/0x1c0
> [  299.275956] irq event stamp: 98754
> [  299.279349] hardirqs last  enabled at (98753): [<ffff800010bf216c>] _raw_spin_unlock_irqrestore+0x9c/0xc0
> [  299.288900] hardirqs last disabled at (98754): [<ffff800010be4bd4>] el1_dbg+0x24/0xa0
> [  299.296716] softirqs last  enabled at (98606): [<ffff800010010ba0>] __do_softirq+0x500/0x6bc
> [  299.305138] softirqs last disabled at (98585): [<ffff80001005d504>] __irq_exit_rcu+0x1d4/0x1e0
> 
> Unloading the modules gives me:

I tested unloading and reloading modules and it worked fine for me. 
Maybe this is dependent on the order in which modules are inserted or 
removed? Can you please share the order in which you loaded and unloaded 
them?

> 
> ERROR:   Unhandled External Abort received on 0x80000001 from S-EL1
> ERROR:   exception reason=0 syndrome=0xbf000000
> Unhandled Exception from EL1
> x0             = 0x0000000000000000
> x1             = 0xffff00080564c000
> x2             = 0xffff800014314000
> x3             = 0xffff800011260000
> x4             = 0x0000000000000001
> x5             = 0x0000000000000001
> x6             = 0x0000000000000001
> x7             = 0x0000000000000000
> x8             = 0xffff8000118870c0
> x9             = 0xffff800010bf2140
> x10            = 0x000000008260a2b7
> x11            = 0x00000000000c821c
> x12            = 0xffff800011a91578
> x13            = 0x0000000000008b8e
> x14            = 0x0000000000000006
> x15            = 0x0000000000000028
> x16            = 0x0000000000000000
> x17            = 0x0000000000000000
> x18            = 0x00000000fffffffb
> x19            = 0xffff00080634cc00
> x20            = 0x0000000000000000
> x21            = 0xffff0008051eed00
> x22            = 0xffff00080555f010
> x23            = 0xffff00080555f000
> x24            = 0xffff8000092e0058
> x25            = 0x0000000000000047
> x26            = 0xffff8000116d71d8
> x27            = 0xffff8000092e0350
> x28            = 0xffff8000092e0148
> x29            = 0xffff800014d2f850
> x30            = 0xffff8000092b0430
> scr_el3        = 0x000000000000073d
> sctlr_el3      = 0x0000000030cd183f
> cptr_el3       = 0x0000000000000000
> tcr_el3        = 0x0000000080803520
> daif           = 0x00000000000002c0
> mair_el3       = 0x00000000004404ff
> spsr_el3       = 0x0000000000000005
> elr_el3        = 0xffff8000092b0440
> ttbr0_el3      = 0x0000000070010b00
> esr_el3        = 0x00000000bf000000
> far_el3        = 0x0000000000000000
> spsr_el1       = 0x0000000060000005
> elr_el1        = 0xffff800010be5e10
> spsr_abt       = 0x0000000000000000
> spsr_und       = 0x0000000000000000
> spsr_irq       = 0x0000000000000000
> spsr_fiq       = 0x0000000000000000
> sctlr_el1      = 0x0000000034d4d91d
> actlr_el1      = 0x0000000000000000
> cpacr_el1      = 0x0000000000300000
> csselr_el1     = 0x0000000000000000
> sp_el1         = 0xffff800014d2f850
> esr_el1        = 0x0000000056000000
> ttbr0_el1      = 0x00000008826e4a00
> ttbr1_el1      = 0x076a000083180000
> mair_el1       = 0x000c0400bb44ffff
> amair_el1      = 0x0000000000000000
> tcr_el1        = 0x00000034f5d07590
> tpidr_el1      = 0xffff80086e790000
> tpidr_el0      = 0x0000ffff980d6920
> tpidrro_el0    = 0x0000000000000000
> par_el1        = 0x0000000000000000
> mpidr_el1      = 0x0000000080000001
> afsr0_el1      = 0x0000000000000000
> afsr1_el1      = 0x0000000000000000
> contextidr_el1 = 0x0000000000000000
> vbar_el1       = 0xffff800010011000
> cntp_ctl_el0   = 0x0000000000000005
> cntp_cval_el0  = 0x000000294b786efd
> cntv_ctl_el0   = 0x0000000000000000
> cntv_cval_el0  = 0x0000000000000000
> cntkctl_el1    = 0x00000000000000d6
> sp_el0         = 0x000000007000abd0
> isr_el1        = 0x0000000000000040
> dacr32_el2     = 0x0000000000000000
> ifsr32_el2     = 0x0000000000000000
> cpuectlr_el1   = 0x0000001b00000040
> cpumerrsr_el1  = 0x0000000000000000
> l2merrsr_el1   = 0x0000000000000000
> 
>  Tomi
> 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
