Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD46C1B6110
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 18:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgDWQgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 12:36:01 -0400
Received: from gofer.mess.org ([88.97.38.141]:39611 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729407AbgDWQgB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 12:36:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0FF65C637F; Thu, 23 Apr 2020 17:35:59 +0100 (BST)
Date:   Thu, 23 Apr 2020 17:35:59 +0100
From:   Sean Young <sean@mess.org>
To:     Rolf Pedersen <rolfpedersen@mindspring.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
Message-ID: <20200423163559.GB23006@gofer.mess.org>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
 <20200423153505.GA22057@gofer.mess.org>
 <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
 <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 09:09:35AM -0700, Rolf Pedersen wrote:
> Okie-doke
> 
> On 04/23/2020 08:59 AM, Sean Young wrote:
> > Hi,
> > 
> > On Thu, Apr 23, 2020 at 08:49:17AM -0700, Rolf Pedersen wrote:
> > > Hi,
> > > 
> > > On 04/23/2020 08:35 AM, Sean Young wrote:
> > > > Hi,
> > > > 
> > > > On Thu, Apr 23, 2020 at 05:32:32AM -0700, Rolf Pedersen wrote:
> > > > > Hi Folks,
> > > > > I just subscribed after having trouble with this card that worked for 3
> > > > > years on Skylake i5-6500 but stopped tuning when I moved it to AMD Ryzen 5
> > > > > 3400G machine.  I found the workaround in the archived thread referenced in
> > > > > the subject line and don't know any way to reply directly to it:
> > > > > https://www.spinics.net/lists/linux-media/msg114563.html
> > > > > 
> > > > > My card is ATSC as on this page:
> > > > > https://www.kernel.org/doc/html/v4.10/media/v4l-drivers/cx23885-cardlist.html
> > > > > 57     Hauppauge WinTV-QuadHD-ATSC     0070:6a18, 0070:6b18
> > > > > 
> > > > > and
> > > > > 
> > > > > [rolf@x570i coup]$ lspcidrake -v | grep Conexant
> > > > > cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
> > > > > Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
> > > > > subv:0070 subd:6b18) (rev: 04)
> > > > > cx23885         : Conexant Systems, Inc.|CX23887/8 PCIe Broadcast Audio and
> > > > > Video Decoder with 3D Comb [MULTIMEDIA_VIDEO] (vendor:14f1 device:8880
> > > > > subv:0070 subd:6a18) (rev: 04)
> > > > > 
> > > > > Neither scan, dvbscan, nor w_scan2, nor Kaffeine TV, while finding working
> > > > > frequencies, could divulge any services.  The workaround was in the
> > > > > referenced post:  cx23885.debug=8
> > > > > 
> > > > > I've seen another report of a different kernel option that worked on Ryzen:
> > > > > |cx23885.dma_reset_workaround=2 here:
> > > > > https://www.dslreports.com/forum/r32639318-SFF-3400G-build#32640298
> > > > > 
> > > > > Ok.  Just wanted to join the chorus with a *metoo* in case I can provide
> > > > > some (guided) forensics.
> > > > So there is a commit for a related issue:
> > > > 
> > > > https://git.linuxtv.org/media_tree.git/commit/?id=4bd46aa0353e022c2401a258e93b107880a66533
> > > > 
> > > > That is kernel v5.0 and higher. So:
> > > > 
> > > > 1. What kernel are you using?
> > > > 
> > > > 2. What is the full lspci -n of your machine?
> > > > 
> > > > Thanks,
> > > > 
> > > > Sean
> > > > 
> > > [rolf@x570i ~]$ uname -r
> > > 5.5.15-desktop-3.mga7
> > > [rolf@x570i ~]$
> > > [rolf@x570i ~]$
> > > [rolf@x570i ~]$ lspci -n
> > > 00:00.0 0600: 1022:15d0
> > > 00:00.2 0806: 1022:15d1
> > > 00:01.0 0600: 1022:1452
> > > 00:01.1 0604: 1022:15d3
> > > 00:01.2 0604: 1022:15d3
> > > 00:01.6 0604: 1022:15d3
> > > 00:08.0 0600: 1022:1452
> > > 00:08.1 0604: 1022:15db
> > > 00:08.2 0604: 1022:15dc
> > > 00:14.0 0c05: 1022:790b (rev 61)
> > > 00:14.3 0601: 1022:790e (rev 51)
> > > 00:18.0 0600: 1022:15e8
> > > 00:18.1 0600: 1022:15e9
> > > 00:18.2 0600: 1022:15ea
> > > 00:18.3 0600: 1022:15eb
> > > 00:18.4 0600: 1022:15ec
> > > 00:18.5 0600: 1022:15ed
> > > 00:18.6 0600: 1022:15ee
> > > 00:18.7 0600: 1022:15ef
> > > 01:00.0 0604: 12d8:2304 (rev 05)
> > > 02:01.0 0604: 12d8:2304 (rev 05)
> > > 02:02.0 0604: 12d8:2304 (rev 05)
> > > 03:00.0 0400: 14f1:8880 (rev 04)
> > > 04:00.0 0400: 14f1:8880 (rev 04)
> > > 05:00.0 0604: 1022:57ad
> > > 06:02.0 0604: 1022:57a3
> > > 06:04.0 0604: 1022:57a3
> > > 06:08.0 0604: 1022:57a4
> > > 06:09.0 0604: 1022:57a4
> > > 06:0a.0 0604: 1022:57a4
> > > 07:00.0 0280: 8086:2723 (rev 1a)
> > > 08:00.0 0200: 8086:1539 (rev 03)
> > > 09:00.0 1300: 1022:1485
> > > 09:00.1 0c03: 1022:149c
> > > 09:00.3 0c03: 1022:149c
> > > 0a:00.0 0106: 1022:7901 (rev 51)
> > > 0b:00.0 0106: 1022:7901 (rev 51)
> > > 0c:00.0 0108: 144d:a808
> > > 0d:00.0 0300: 1002:15d8 (rev c8)
> > > 0d:00.1 0403: 1002:15de
> > > 0d:00.2 1080: 1022:15df
> > > 0d:00.3 0c03: 1022:15e0
> > > 0d:00.4 0c03: 1022:15e1
> > > 0d:00.6 0403: 1022:15e3
> > > 0e:00.0 0106: 1022:7901 (rev 61)
> > Thanks.
> > 
> > I'm afraid that I should have asked for: lspci -v
> > 
> > That would be helpful, thanks.
> > 
> > 
> > Sean
> > 
> Please find output of `sudo lspci -v` attached.
> Thanks,
> Rolf
> 

> 00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 Root Complex
> 	Subsystem: ASUSTeK Computer Inc. Device 876b
> 	Flags: fast devsel
> 
> 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
> 	Subsystem: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
> 	Flags: bus master, fast devsel, latency 0, IRQ 26
> 	Capabilities: [40] Secure device <?>
> 	Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
> 	Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+

Can you please try this patch and let us know if it works:

From c761fe49e66236b7e459d9f501ed20fd401181b8 Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Thu, 23 Apr 2020 17:28:09 +0100
Subject: [PATCH] media: cx23885: add a missing vid for another problematic AMD
 IOMMU

The issue described in commit 95f408bbc4e4 ("media: cx23885: Ryzen DMA
related RiSC engine stall fixes") also affects this device.

Fixes: 95f408bbc4e4 ("media: cx23885: Ryzen DMA related RiSC engine stall fixes")

Cc: Brad Love <brad@nextdimension.cc>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/cx23885/cx23885-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..1ed3b76de2fa 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2074,6 +2074,7 @@ static struct {
 	 * 0x1451 is PCI ID for the IOMMU found on Ryzen
 	 */
 	{ PCI_VENDOR_ID_AMD, 0x1451 },
+	{ PCI_VENDOR_ID_AMD, 0x15d1 }, /* Raven2 IOMMU */
 };
 
 static bool cx23885_does_need_dma_reset(void)
-- 
2.25.3

