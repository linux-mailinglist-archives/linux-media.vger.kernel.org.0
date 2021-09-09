Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60451405CB6
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 20:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243456AbhIISOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 14:14:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45106 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237265AbhIISOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 14:14:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 189IBrJ0059511;
        Thu, 9 Sep 2021 13:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631211113;
        bh=cxuf1yCKJhWJMvOQO6JBFWdwMfc6/w+BZAbQKRdDsnw=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Vnzu3W1MhRrWkGzUBORcEIStrc4d4pU5ZtMj2u1pJd0tdJkTnS0a3YCeJO87Erz2o
         dv4KhYJgVKndGFYmkUTCbAsAPhXAKaHTQY6QksMVhR3AIjiSoKEEd75e6XEMbq62JH
         NmbFSfHIgDvOh+1FRHfu2HBrSqlzDAGOc7+Ctlog=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 189IBrlI081442
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Sep 2021 13:11:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Sep 2021 13:11:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Sep 2021 13:11:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 189IBq1a104877;
        Thu, 9 Sep 2021 13:11:52 -0500
Date:   Thu, 9 Sep 2021 23:41:51 +0530
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
Message-ID: <20210909181149.a5i46sfs4rskuqhk@ti.com>
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
> 
> Here are some notes from quick tests:
> 
> Capture works, but the fps is ~28.98. I would expect it to be closer to 30. Are the clocks configured correctly?
> 
> When I load the modules, I get:
> 
> [  237.322258] platform 4504000.csi-bridge: Fixing up cyclic dependency with 9-003c

I see this with CAL's OV5640 overlay as well. I think this is caused by 
the endpoint nodes on csi-bridge and sensor pointing to each other. I 
can't quite understand any bad implications of this warning since 
everything seems to work correctly.

Should we model the connections between the sensor and CSI bridge 
differently to not cause a cycle in the graph? Or can we just ignore 
this warning since things seem to work fine despite it?

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

I still can't reproduce this, and I think this might be why. I am saving 
the stream to a file and then replaying on my PC. You seem to be sending 
it to a display. The DMA warning looks to be coming from DRM side, not 
CSI.

Anyway, I think this is not a big problem. The UDMA driver simply does 
not populate max_segment_size, so dma_get_max_seg_size() returns 64 KiB 
as default. The hardware can actually support virtually unlimited 
segment size for TR mode and 2^27 bytes for packet mode. CSI uses TR 
mode so it can certainly handle more than 64 KiB long segments. I am not 
sure which mode DRM uses but 2^27 is still much bigger than 1900544.

Long story short, this warning has little to do with the CSI patches 
here and can be safely ignored IMO.

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
> 
> I get a warning from media graph walk:

Fixed this one. It was caused by the graph_mutex not being held.

> 
> [  299.066357] WARNING: CPU: 1 PID: 605 at drivers/media/mc/mc-entity.c:343 media_graph_walk_next+0x268/0x2cc
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

Fixed this too. Both cdns-csi2rx and j721e-csi2rx share the same power 
domain, but only j721e-csi2rx contains the power-domains property. If 
you load cdns-csi2rx before j721e-csi2rx then the PD is not active and 
register access causes an abort. Fixed by adding power-domains to the 
csi-bridge node.

> 
> ERROR:   Unhandled External Abort received on 0x80000001 from S-EL1
> ERROR:   exception reason=0 syndrome=0xbf000000
> Unhandled Exception from EL1
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
