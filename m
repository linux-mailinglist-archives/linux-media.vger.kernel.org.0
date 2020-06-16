Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDA01FAF25
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 13:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgFPL23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 07:28:29 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60294 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFPL23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 07:28:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GBSQk3084376;
        Tue, 16 Jun 2020 06:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592306906;
        bh=+sN66Gyv6ZsGXMwfBNz0Al/iWBgcu7SqKBbdQ103AJY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wa1QpVNt9hPdv4cQjVItGH5ga0GI/MQpeAMyPCTgn+BX/mJP5BL1sUxqaUXOatec8
         ZQI2toylKoJtnVl7VgGkcfLccrSC/auToKPCS0kPXrUMw5O4Pf70gJtJ5hNgXKdSNr
         jm+t5Yc48YRFU+08Uzv1+5iZCkzOmrSXEWKYwN6w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GBSQbt066189;
        Tue, 16 Jun 2020 06:28:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 06:28:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 06:28:26 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GBSPRU093299;
        Tue, 16 Jun 2020 06:28:25 -0500
Subject: Re: [PATCH v1 050/107] media: ti-vpe: cal: Fix usage of
 v4l2_fwnode_endpoint_parse()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
CC:     Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-51-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ba56f2c4-dfdc-17ba-dd5b-f428f55dc378@ti.com>
Date:   Tue, 16 Jun 2020 14:28:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614235944.17716-51-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 15/06/2020 02:58, Laurent Pinchart wrote:
> Letting the v4l2_fwnode_endpoint_parse() function determine the bus type
> automatically is deprecated. Set the bus type to DPHY manually as the TI
> CAL only supports DPHY.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/ti-vpe/cal.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Up to and including this patch:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Very nice cleanups. I'll continue with the rest later, I need a break =).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
