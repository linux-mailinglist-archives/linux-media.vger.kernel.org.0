Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD17186BD7
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 14:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731153AbgCPNN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 09:13:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43494 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731025AbgCPNN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 09:13:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GDDPAS100488;
        Mon, 16 Mar 2020 08:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584364405;
        bh=tHi0rNmBrBnUKIa7jtPlKNrjxNGBZpUmXXoPS+hhX0U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sSGMsiZ55jdoS2n6meMtwVCcFbs1CsQLaXk8SIwrtladOLCQ8VYsJ3VQx+FOYe57C
         hZzbd4Gv7bP7Dmko51BU3sYv//cCd1LNG8Jf5DabMzUDiquBIh2ezdZWWWjwY5riQj
         qb8Z9TvaN+u3Ad5/GlYykeba9rH/BDMAZR7nD3GQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GDDOIJ046341
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Mar 2020 08:13:25 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 08:13:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 08:13:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GDDJsT115765;
        Mon, 16 Mar 2020 08:13:21 -0500
Subject: Re: [PATCH 11/16] media: ti-vpe: cal: program number of lines
 properly
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-11-tomi.valkeinen@ti.com>
 <20200316123732.GD4732@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <92abe975-f88a-1d86-3ab3-9aa9ba65806a@ti.com>
Date:   Mon, 16 Mar 2020 15:13:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316123732.GD4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 14:37, Laurent Pinchart wrote:
> On Fri, Mar 13, 2020 at 01:41:16PM +0200, Tomi Valkeinen wrote:
>> CAL_CSI2_CTX register has LINES field, which, according to the
>> documentation, should be programmed to the number of lines transmitted
>> by the camera. If the number of lines is unknown, it can be set to 0.
>> The driver sets the field to 0 for some reason, even if we know the
>> number of lines.
>>
>> This patch sets the number of lines properly, which will allow the HW to
>> discard extra lines (if the sensor would send such for some reason),
>> and, according to documentation: "This leads to regular video timings
>> and avoids potential artifacts".
> 
> And possibly buffer overflows !

There's a register in the DMA block which defines the max number of lines the DMA will transfer. So 
overflow should not be possible even without this patch.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
