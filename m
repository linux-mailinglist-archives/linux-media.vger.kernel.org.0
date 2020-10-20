Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39852935E9
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 09:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgJTHiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 03:38:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48394 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgJTHiX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 03:38:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K7cKXA047075;
        Tue, 20 Oct 2020 02:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603179500;
        bh=cYat3m6qFodXURHdpwmWAmiNW1GLAZIgIwuh64e92V8=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=QXhDFig0BhcB6zDx+azLC+gFoUkIOPWtMSW2D/V8iWoV1gICxWsC+2ANpurffmU+u
         ZtOkRp9UAivQ3IO8BGfB0ilTEbGCvEgeEkjgcCRGKdQzRchaIy8zIucxqYQDPJIeMm
         K2+7e0mUvn9EBkUxsuh38RGsujggxObAdDzg85zY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K7cKck035483
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Oct 2020 02:38:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 02:38:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 02:38:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K7cIaL078875;
        Tue, 20 Oct 2020 02:38:19 -0500
Date:   Tue, 20 Oct 2020 13:08:17 +0530
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benoit Parrot <bparrot@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] media: platform: ti-vpe: Update the path to firmware
Message-ID: <20201020073817.3cug7vgaezf3vj67@NiksLab>
References: <20201012125200.11643-1-nikhil.nd@ti.com>
 <67d3fae1-5ba6-9f9a-3036-5752e3f6849d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <67d3fae1-5ba6-9f9a-3036-5752e3f6849d@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14:38-20201019, Tomi Valkeinen wrote:
> On 12/10/2020 15:52, Nikhil Devshatwar wrote:
> > vpdma firmware is now available in the linux-firmware repo.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ti-connectivity/vpdma-1b8.bin
> > 
> > Update the firmware path requested by the VPDMA driver so that
> > it gets looked up correctly in the filesystem.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/vpdma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
> > index 2e5148ae7a0f..5a378449a4ff 100644
> > --- a/drivers/media/platform/ti-vpe/vpdma.c
> > +++ b/drivers/media/platform/ti-vpe/vpdma.c
> > @@ -23,7 +23,7 @@
> >  #include "vpdma.h"
> >  #include "vpdma_priv.h"
> >  
> > -#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
> > +#define VPDMA_FIRMWARE	"ti-connectivity/vpdma-1b8.bin"
> 
> I don't think "ti-connectivity/" makes sense for vpdma fw. I don't know if there are guidelines for
> directories in linux-firmware, but "ti/vpdma-1b8.bin" would be better in my opinion.

The firmware is already merged at ti-connectivity/
I didn't create a new folder because I felt the exising ti-connectivity
is good enough.

> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
