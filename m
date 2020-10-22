Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1F2295DB0
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 13:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897562AbgJVLqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 07:46:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54666 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897551AbgJVLqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 07:46:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MBjwiM081625;
        Thu, 22 Oct 2020 06:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603367158;
        bh=EE/DZo0PL/2irLAlEwon0caz5GAxPi++AqrqJtoT5s4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=GiY978tyrw4bJK9EsPfuadBt/NaVLU50wMyImTezAcZ9Tb7lWIUhiUewRZ3lMx6db
         Oz3uZrgf7KlzmYbjKq0BRFGnBPyh/Sm6+61CQKNQCwVdYH+ZjU0pQekZKlVHT155zL
         KPkZwQyQgvBHJaM7BJJGTiRgQilS8Jei/cH/QOwM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MBjwg1122245
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Oct 2020 06:45:58 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 22
 Oct 2020 06:45:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 22 Oct 2020 06:45:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MBjueg109935;
        Thu, 22 Oct 2020 06:45:57 -0500
Date:   Thu, 22 Oct 2020 17:15:56 +0530
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
Message-ID: <20201022114556.hzk7tqjpvwrmbqyw@NiksLab>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
 <67d3fae1-5ba6-9f9a-3036-5752e3f6849d@ti.com>
 <20201020073817.3cug7vgaezf3vj67@NiksLab>
 <72b65370-095e-9875-e5d4-096256b77ced@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72b65370-095e-9875-e5d4-096256b77ced@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10:52-20201020, Tomi Valkeinen wrote:
> On 20/10/2020 10:38, Nikhil Devshatwar wrote:
> > On 14:38-20201019, Tomi Valkeinen wrote:
> >> On 12/10/2020 15:52, Nikhil Devshatwar wrote:
> >>> vpdma firmware is now available in the linux-firmware repo.
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
> >>>
> >>> Update the firmware path requested by the VPDMA driver so that
> >>> it gets looked up correctly in the filesystem.
> >>>
> >>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>> ---
> >>>  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> >>> index 2e5148ae7a0f..5a378449a4ff 100644
> >>> --- a/drivers/media/platform/ti-vpe/vpdma.c
> >>> +++ b/drivers/media/platform/ti-vpe/vpdma.c
> >>> @@ -23,7 +23,7 @@
> >>>  #include "vpdma.h"
> >>>  #include "vpdma_priv.h"
> >>>  
> >>> -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
> >>> +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"
> >>
> >> I don't think "ti-connectivity/" makes sense for vpdma fw. I don't know if there are guidelines for
> >> directories in linux-firmware, but "ti/vpdma-1b8.bin" would be better in my opinion.
> > 
> > The firmware is already merged at ti-connectivity/
> > I didn't create a new folder because I felt the exising ti-connectivity
> > is good enough.
> 
> ti-connectivity is for TI wlan, no?
I didn't know that. I assumed all ti firmwares regarding connectivity go
here :)
I am not sure if the linux-firmware accept moving firmware path.
I can try posting the patch and see what's the feedback.

> I think the fw should either be in the root dir, as that's where
> the driver has been loading it from for a long time, or if we're going to change the path in the
> driver, put it into a proper directory.
> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
