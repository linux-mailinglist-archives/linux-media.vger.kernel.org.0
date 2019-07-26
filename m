Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A9876BA5
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 16:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfGZO3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 10:29:41 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42576 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfGZO3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 10:29:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6QETP9c039059;
        Fri, 26 Jul 2019 09:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564151365;
        bh=Fb5rzjRMdVxF8BnVs/BBQy8Bg0VXLqTuycf8mt6VBzc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WedAVQL7i9gIPo52SLHsm7mGi8Cb+tIVPWoLiUtzSxl/KoRNWaIyIn8fjdcNfKy4M
         WDjFCURkU6Zjmf13iDR3pdTa0liEFMOGpqAgZvFlSvmIBO3lazv9331io2lhlkFWyY
         XPRFNsk3LdsSecsC/kI8M4Bvp+Zz8MNK7S2+Zb5Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6QETP8v005677
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jul 2019 09:29:25 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 09:29:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 26 Jul 2019 09:29:24 -0500
Received: from [172.24.190.172] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6QETKad101559;
        Fri, 26 Jul 2019 09:29:21 -0500
Subject: Re: [PATCH] media: staging: davinci: remove vpfe driver
To:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <laurent.pinchart@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <devel@driverdev.osuosl.org>
References: <20190723104602.3215243-1-arnd@arndb.de>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <baa4ea4f-f498-b114-4eb9-af469b644a95@ti.com>
Date:   Fri, 26 Jul 2019 19:59:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190723104602.3215243-1-arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/07/19 4:14 PM, Arnd Bergmann wrote:
> The davinci_vpfe driver was merged into staging back in 2012 by Manjunath
> Hadli from TI, with a long TODO list.
> 
> For all I can tell, since then it has only seen fixes for compile-time
> issues and global cleanups, but nobody has actually worked on the items
> on the TODO list.
> 
> To make things worse, the driver in its current form is incompatible with
> the platform code in arch/arm/mach-davinci, i.e. the driver expects to
> get its platform_data passed to the device as a 'struct vpfe_config',
> but uses a differnet definition for that structure compared to what the
> platform uses.
> 
> Finally, there is another driver for the same device in
> drivers/media/platform/davinci/vpfe_capture.c. From all I can tell, the
> staging version was originally a copy of a more featureful driver in TI's
> downstream kernels. However, that kernel no longer supports dm365 after
> linux-2.6.37, and the mainline version moved in a different direction.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
