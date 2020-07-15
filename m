Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30097220508
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 08:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbgGOGdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 02:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgGOGdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 02:33:44 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301E4C061755;
        Tue, 14 Jul 2020 23:33:44 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 06794BC069;
        Wed, 15 Jul 2020 06:33:39 +0000 (UTC)
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: Xilinx video IP cores
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     hyun.kwon@xilinx.com, mchehab@kernel.org, robh+dt@kernel.org,
        michal.simek@xilinx.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200705075524.22657-1-grandmaster@al2klimov.de>
 <20200714235724.GR5854@pendragon.ideasonboard.com>
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <5fca4c17-9e83-3936-0d8f-ad73ae760033@al2klimov.de>
Date:   Wed, 15 Jul 2020 08:33:35 +0200
MIME-Version: 1.0
In-Reply-To: <20200714235724.GR5854@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: +
X-Spam-Level: *
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.07.20 um 01:57 schrieb Laurent Pinchart:
> Hi Alexander,
> 
> Thank you for the patch.
> 
> The subject line should be
> 
> dt-bindings: media: xilinx: Replace HTTP links with HTTPS ones
> 
> On Sun, Jul 05, 2020 at 09:55:24AM +0200, Alexander A. Klimov wrote:
>> Rationale:
>> Reduces attack surface on kernel devs opening the links for MITM
>> as HTTPS traffic is much harder to manipulate.
>>
>> Deterministic algorithm:
>> For each file:
>>    If not .svg:
>>      For each line:
>>        If doesn't contain `\bxmlns\b`:
>>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>>            If both the HTTP and HTTPS versions
>>            return 200 OK and serve the same content:
>>              Replace HTTP with HTTPS.
>>
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Will you get this patch merged as part of a bigger series, or do you
> expect us to take care of it ? In the latter case, if you agree with the
I've just followed the patch submission instructions as for any 
non-treewide patch. So yes, I assume the people I write to take care of 
the patch.

> subject line change, there's no need to resubmit, I can fix this when
> applying the patch.
OK.

> 
>> ---
>>   Continuing my work started at 93431e0607e5.
>>
>>   If there are any URLs to be removed completely or at least not HTTPSified:
>>   Just clearly say so and I'll *undo my change*.
>>   See also https://lkml.org/lkml/2020/6/27/64
>>
>>   If there are any valid, but yet not changed URLs:
>>   See https://lkml.org/lkml/2020/6/26/837
>>
>>   Documentation/devicetree/bindings/media/xilinx/video.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/xilinx/video.txt b/Documentation/devicetree/bindings/media/xilinx/video.txt
>> index 68ac210e688e..d0335ca0cd57 100644
>> --- a/Documentation/devicetree/bindings/media/xilinx/video.txt
>> +++ b/Documentation/devicetree/bindings/media/xilinx/video.txt
>> @@ -32,4 +32,4 @@ The following properties are common to all Xilinx video IP cores.
>>     defaults to "mono".
>>   
>>   
>> -[UG934] http://www.xilinx.com/support/documentation/ip_documentation/axi_videoip/v1_0/ug934_axi_videoIP.pdf
>> +[UG934] https://www.xilinx.com/support/documentation/ip_documentation/axi_videoip/v1_0/ug934_axi_videoIP.pdf
> 
