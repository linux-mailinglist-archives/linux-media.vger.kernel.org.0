Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8641929E0FE
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 02:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732726AbgJ2BrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 21:47:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44964 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729098AbgJ2BqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 21:46:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SHJQVl069453;
        Wed, 28 Oct 2020 12:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603905566;
        bh=xw3/OYpYabhSVgmiGBRFSQkrGBCD4qoimkYDCSBz89A=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=S3PDiK26N0dO/2hGt1qpIWTwC9tp+4OUk+JJsqq+kP+ROnRhC8TzS5kxHCIrgTdKp
         Zp2G+JU7O+AV7m73F6AYyi8AeJKmEfpFg5GG4qC2D62ufv7Y9YsI0Xll/sLw7wI5t2
         K9VAlRb6+xNV0fDKF9SbgxnVBxS2q4cJZFH6cDho=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SHJQxJ108689
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Oct 2020 12:19:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 12:19:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 12:19:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SHJOkq006523;
        Wed, 28 Oct 2020 12:19:25 -0500
Date:   Wed, 28 Oct 2020 22:49:24 +0530
From:   Nikhil Devshatwar <nikhil.nd@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] vpdma: Move firmware to the toplevel
Message-ID: <20201028171924.dk2swpi2uzpgz5az@NiksLab>
References: <20201026200922.12719-1-nikhil.nd@ti.com>
 <20201026210832.GE3756@pendragon.ideasonboard.com>
 <868ff235-20c7-b0c0-df08-3d4582adb544@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <868ff235-20c7-b0c0-df08-3d4582adb544@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09:41-20201028, Tomi Valkeinen wrote:
> On 26/10/2020 23:08, Laurent Pinchart wrote:
> > Hi Nikhil,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Oct 27, 2020 at 01:39:22AM +0530, Nikhil Devshatwar wrote:
> >> Move the vpdma firmware to the toplevel directory so
> >> that the existing drivers can use it with the same path.
> >>
> >> Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
> >> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >> ---
> >>  WHENCE                                         |   2 +-
> >>  ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin | Bin
> > 
> > I think Tomi meant moving the file to ti/ instead of ti-connectivity/. I
> > will let him comment on this.
> 
> I don't really have a strong opinion here, as I don't know if there are some rules or guidelines
> about file/dir naming in linux-firmware.
> 
> But my argument is:
> 
> The fw should either be at the root dir, where the linux driver is already looking for it, OR, if we
> do move it somewhere, move it to a "right" place. Afaics "ti-connectivity" is totally wrong place,
> as vpdma has nothing to do with connectivity.
> 
> The root dir is a bit bad as "vpdma-1b8.bin" doesn't have TI or such in its name, so even if name

With this, I am more inclined to put it in ti/ directory.

> conflict with some other fw feels quite unlikely, the name is still rather vague. And moving is a
> bit bad as then the current driver won't find the fw...

Since the current driver is not getting any firmware anyways, it should
be fine to move it and update the driver accordingly.
I will send v2 with the firmware moved to ti/

> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
