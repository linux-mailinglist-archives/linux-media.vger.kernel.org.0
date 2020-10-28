Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682C729DC18
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 01:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390776AbgJ2AV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 20:21:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50560 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbgJ2AVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 20:21:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09S7fflf084854;
        Wed, 28 Oct 2020 02:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603870901;
        bh=Ax5/lSVFdAWpt9N2W3x9j4u+NVI3bfPAN+kwxm2q5AI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=raoGhAXmq3ocu16M6jlyQYXYzmVRaiB9n8hZw1ttz+o0924DH2aECLm7m9xafn1HX
         WvgWroNC65gk0U6UOLc8fnnvvbZPDKNUBBU5liL92QxS1R39oTuyfH0/HyMD6/Hfso
         4jAbxLxfq6L6+Yc9c6P3orNRTYIHKNq0uP0gAdbA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09S7ffpE084829
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Oct 2020 02:41:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 02:41:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 02:41:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09S7fdQd121725;
        Wed, 28 Oct 2020 02:41:40 -0500
Subject: Re: [PATCH] vpdma: Move firmware to the toplevel
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
CC:     <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Sekhar Nori <nsekhar@ti.com>
References: <20201026200922.12719-1-nikhil.nd@ti.com>
 <20201026210832.GE3756@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <868ff235-20c7-b0c0-df08-3d4582adb544@ti.com>
Date:   Wed, 28 Oct 2020 09:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026210832.GE3756@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/10/2020 23:08, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> Thank you for the patch.
> 
> On Tue, Oct 27, 2020 at 01:39:22AM +0530, Nikhil Devshatwar wrote:
>> Move the vpdma firmware to the toplevel directory so
>> that the existing drivers can use it with the same path.
>>
>> Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>  WHENCE                                         |   2 +-
>>  ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin | Bin
> 
> I think Tomi meant moving the file to ti/ instead of ti-connectivity/. I
> will let him comment on this.

I don't really have a strong opinion here, as I don't know if there are some rules or guidelines
about file/dir naming in linux-firmware.

But my argument is:

The fw should either be at the root dir, where the linux driver is already looking for it, OR, if we
do move it somewhere, move it to a "right" place. Afaics "ti-connectivity" is totally wrong place,
as vpdma has nothing to do with connectivity.

The root dir is a bit bad as "vpdma-1b8.bin" doesn't have TI or such in its name, so even if name
conflict with some other fw feels quite unlikely, the name is still rather vague. And moving is a
bit bad as then the current driver won't find the fw...

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
