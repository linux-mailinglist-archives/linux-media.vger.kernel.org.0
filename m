Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68901B995F
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 10:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0IHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 04:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgD0IHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 04:07:55 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36529C061A0F
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 01:07:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 31DCCC63FC; Mon, 27 Apr 2020 09:07:51 +0100 (BST)
Date:   Mon, 27 Apr 2020 09:07:51 +0100
From:   Sean Young <sean@mess.org>
To:     Martin Burnicki <martin.burnicki@burnicki.net>
Cc:     Rolf Pedersen <rolfpedersen@mindspring.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
Message-ID: <20200427080751.GA5925@gofer.mess.org>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
 <20200423153505.GA22057@gofer.mess.org>
 <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
 <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 27, 2020 at 09:03:22AM +0200, Martin Burnicki wrote:
> Martin Burnicki wrote:
> > Sean Young wrote:
> >> On Fri, Apr 24, 2020 at 07:46:26PM +0200, Martin Burnicki wrote:
> >>> I came across this thread and want to let you know that I also have
> >>> problems with the cx23885 driver on a Ryzen system.
> >>>
> >>> The only solution I found on the 'net that could make it work was to add
> >>> a line
> >>>
> >>> options cx23885 debug=7
> >>>
> >>> to the file /etc/modprobe.d/cx23885.conf
> >>
> >> Have you tried: 
> >>
> >> options cx23885 dma_reset_workaround=2
> > 
> > I think I remember I originally tried this when I set up this system,
> > and it didn't work, but that may not have been with a value of 2.
> 
> I've tried this now once more on my Ubuntu system with 5.3.0-46-generic,
> and indeed the workaround fixes the problem.
> 
> In case you are interested, here is the full dmesg output of the system
> when the error occurs if *no* workaround is enabled:
> 
> https://burnicki.net/martin/tmp/dmesg-with-error.txt
> 
> See the "mpeg risc op code error" message close to the bottom of the file.

Would you mind testing this patch please?

Thanks

Sean

From 216bd7f1a68de7a60bfa15a31f28343574bae313 Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Thu, 23 Apr 2020 17:28:09 +0100
Subject: [PATCH] media: cx23885: add a missing vid for other problematic AMD
 IOMMOs

The issue described in commit 95f408bbc4e4 ("media: cx23885: Ryzen DMA
related RiSC engine stall fixes") also affects this device.

Fixes: 95f408bbc4e4 ("media: cx23885: Ryzen DMA related RiSC engine stall fixes")

Cc: Brad Love <brad@nextdimension.cc>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/cx23885/cx23885-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..f18c5017be84 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2074,6 +2074,8 @@ static struct {
 	 * 0x1451 is PCI ID for the IOMMU found on Ryzen
 	 */
 	{ PCI_VENDOR_ID_AMD, 0x1451 },
+	{ PCI_VENDOR_ID_AMD, 0x1481 },
+	{ PCI_VENDOR_ID_AMD, 0x15d1 }, /* Raven2 IOMMU */
 };
 
 static bool cx23885_does_need_dma_reset(void)
-- 
2.25.4

