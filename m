Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19A17D66ED
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 11:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbjJYJeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 05:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234034AbjJYJeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 05:34:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AF6128
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 02:34:14 -0700 (PDT)
Received: from [192.168.1.110] (unknown [103.251.226.9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 061EABD1;
        Wed, 25 Oct 2023 11:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698226440;
        bh=AQIUyN3q2B19i/osyY/zQtS+ykAVpqCGPNXTKZY8Ce0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KXE5rCcS0N7b+qh+5PMe1bSMIiUHzdFHvb8PBSFOE2NmMsp9FQFdwchCzZwhmAxTG
         Qv/B2D0JQQtRUg4edKfCKmzmzL7BhGp8N4eqi4tHWw6pOWYybrfkgavG8AqOlf6Sqy
         1vs0DA9gIq7P1i42i8n7ns9FAB6njxfbcwfjUnTk=
Message-ID: <fe0b6ed1-61ba-5373-1525-adb040f68184@ideasonboard.com>
Date:   Wed, 25 Oct 2023 15:04:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-staging@lists.linux.dev,
        "Ricardo B . Marliere" <ricardo@marliere.net>
Cc:     linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
 <20231025060717.71895-2-umang.jain@ideasonboard.com>
 <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
 <ZTjf0fT0yl2cwGWJ@kekkonen.localdomain>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <ZTjf0fT0yl2cwGWJ@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/25/23 2:58 PM, Sakari Ailus wrote:
> On Wed, Oct 25, 2023 at 10:10:08AM +0300, Dan Carpenter wrote:
>> On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
>>> Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
>>> modifier to print FourCC codes in the logs.
>>>
>>> vchiq_use_internal() and vchiq_release_internal() uses entity
>>> character-array to store a transient string that contains
>>> a FourCC code. Increase the length of entity array(to 64 bytes)
>>> since %p4cc requires more bytes to hold the output characters.
>>>
>>> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> ---
>>>   .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
>>>   .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
>>>   .../interface/vchiq_arm/vchiq_core.h          |  6 ---
>>>   .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
>>>   4 files changed, 33 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> index fc6d33ec5e95..de6a24304a4d 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>>>   {
>>>   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
>>>   	int ret = 0;
>>> -	char entity[16];
>>> +	char entity[64];
>>>   	int *entity_uc;
>>>   	int local_uc;
>>>   
>>> @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>>>   		sprintf(entity, "VCHIQ:   ");
>>>   		entity_uc = &arm_state->peer_use_count;
>>>   	} else if (service) {
>>> -		sprintf(entity, "%c%c%c%c:%03d",
>>> -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
>>> +		sprintf(entity, "%p4cc:%03d",
>> Not related to your patch but these sprintfs() make me very
>> uncomfortable.
>>
>> KTODO: change sprintf() to snprintf() in staging/vc04_services/
> Umang: how about one patch on top of this? :-) There are just five
> instances of it.

Ricardo, how about this? Do you want to take a swing at this ? :-)

And send a v2. ?
>

