Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACA6251853
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 14:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbgHYMMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 08:12:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35926 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730193AbgHYML7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 08:11:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PCBQmf025168;
        Tue, 25 Aug 2020 07:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598357486;
        bh=64WTZ3HRqH6kl7oo8EhgHRIFEmqtSddYbOq3wFaHCvo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=svoqMLr99vg6gFueXzCOei6VeWNH8u1PU2q2+u7DqLEIfsMsJPqgVcW71OiwVUJG4
         6j8d9jB8fhYdh3hLK6lNeYT+VSpL65YHU9aBML7cf8wQom+Z3tauo0YbguzLDBR21D
         28fJnaBJ9bEJpTbqFqLOboxMyWLYi6iSin6qxpro=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PCBQcP047964;
        Tue, 25 Aug 2020 07:11:26 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 07:11:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 07:11:26 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PCBP9x120021;
        Tue, 25 Aug 2020 07:11:25 -0500
Subject: Re: [PATCH] media: ti-vpe: cal: Fix compilation on 32-bit ARM
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
References: <20200823050257.564-1-laurent.pinchart@ideasonboard.com>
 <20200824092303.GP7145@valkosipuli.retiisi.org.uk>
 <20200824105422.GB6002@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0f697317-bbe3-9632-0e56-eb1d0458f43e@ti.com>
Date:   Tue, 25 Aug 2020 15:11:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824105422.GB6002@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/08/2020 13:54, Laurent Pinchart wrote:
> On Mon, Aug 24, 2020 at 12:23:04PM +0300, Sakari Ailus wrote:
>> On Sun, Aug 23, 2020 at 08:02:57AM +0300, Laurent Pinchart wrote:
>>> When compiled on 32-bit ARM, the CAL driver fails with the FIELD_PREP()
>>> macro complaining that the mask is not constant. While all callers of
>>> the inline cal_write_field() function pass a constant mask, the mask
>>> parameter itself is a variable, which likely doesn't please the
>>> compiler.
>>>
>>> Fix it by replacing FIELD_PREP() with a manual implementation.
>>>
>>> Fixes: 50797fb30b95 ("media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functions")
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Thanks!
>>
>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> And I forgot to add
> 
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Tomi, will you handle this patch ? Could you add the tags ?

I don't see this when compiling. Which compiler version is it? What's the failing call?

If FIELD_PREP is broken, isn't FIELD_GET too (used in cal_read_field)?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
