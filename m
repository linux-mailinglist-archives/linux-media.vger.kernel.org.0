Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334511FAE7E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 12:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgFPKtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 06:49:06 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50356 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPKtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 06:49:06 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GAn3lD057794;
        Tue, 16 Jun 2020 05:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592304543;
        bh=+aja+BAxrkxbbWUiG+J/g8HChgMv2nPWrIvas6qhFc0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LQYhT22gVBtN2zKXJN1ia7lxQ2FiC4SXvfQy/JXTRy8c4iQHnIfMpz7dukambkt6M
         I+kPtk1mpMZWZpaiQncrqsuNOMHGYXxRWLD1fJ+pYikO8KBIMZF++mjC0VXlkNOwRC
         w4OGpPYyBW+fijkdM9D5+hCKlmybRu0x8uPrnKZc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GAn3u0014461;
        Tue, 16 Jun 2020 05:49:03 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 05:49:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 05:49:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GAn2jx025735;
        Tue, 16 Jun 2020 05:49:02 -0500
Subject: Re: [PATCH v1 006/107] media: ti-vpe: cal: Merge all status variables
 in IRQ handler
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-7-laurent.pinchart@ideasonboard.com>
 <7f6d0a6e-de9f-53c0-9aa3-9be8dc9b3240@ti.com>
 <20200616104440.GA19010@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5736f220-eb20-fc20-142f-846561ebddc9@ti.com>
Date:   Tue, 16 Jun 2020 13:49:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616104440.GA19010@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 13:44, Laurent Pinchart wrote:

>> I do like to keep local variables inside smaller scopes when possible,
>> as it reduces chances for bugs. Any reason you moved i to the whole
>> function scope?
> 
> I do the same as well, but tend to keep variables used in multiple
> smaller scopes as top-level variables. I'm fine multiple instances of
> 'i' if you prefer.

Then you risk having the first use initialize the variable, and the second use missing 
initialization but using it as initialized from the first use. And the compiler doesn't warn about 
the bug.

If changing it here would create lots of conflicts (as this is in the beginning of the series), it's 
fine.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
