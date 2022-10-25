Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64BE560D548
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 22:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbiJYUMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 16:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbiJYUMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 16:12:09 -0400
X-Greylist: delayed 1427 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Oct 2022 13:11:59 PDT
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.152.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9477E326
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 13:11:58 -0700 (PDT)
Received: from atl1wswcm06.websitewelcome.com (unknown [50.6.129.167])
        by atl3wswob01.websitewelcome.com (Postfix) with ESMTP id 08F4B1A208C
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 19:48:09 +0000 (UTC)
Received: from br984.hostgator.com.br ([162.241.203.37])
        by cmsmtp with ESMTP
        id nPuDoB89HPz0tnPuDoUviO; Tue, 25 Oct 2022 19:48:09 +0000
X-Authority-Reason: nr=8
Received: from [200.168.210.66] (port=39217 helo=[10.10.85.164])
        by br984.hostgator.com.br with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <pedro.guilherme@espectro.eng.br>)
        id 1onPuC-001nmw-N6;
        Tue, 25 Oct 2022 16:48:08 -0300
Message-ID: <01f80fd2-b869-fb1c-1e97-e4b73ab87605@espectro.eng.br>
Date:   Tue, 25 Oct 2022 16:48:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/3] media: uvc_driver: fix missing newline after
 declarations
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221025050450.1743072-1-pedro.guilherme@espectro.eng.br>
 <Y1gwETdTkfAMTB8E@pendragon.ideasonboard.com>
 <Y1gxfeHa5iOax8BD@pendragon.ideasonboard.com>
From:   Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
In-Reply-To: <Y1gxfeHa5iOax8BD@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - br984.hostgator.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - espectro.eng.br
X-BWhitelist: no
X-Source-IP: 200.168.210.66
X-Source-L: No
X-Exim-ID: 1onPuC-001nmw-N6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([10.10.85.164]) [200.168.210.66]:39217
X-Source-Auth: pedro.guilherme@espectro.eng.br
X-Email-Count: 2
X-Source-Cap: ZXNwZWN0ODU7ZXNwZWN0ODU7YnI5ODQuaG9zdGdhdG9yLmNvbS5icg==
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMS9zFJyHVH6JoOrVC+uhkgjV9QR/O4X5FfpL3i+jngt1WqQzGtQFeVkTvgkH93L3PmomWPumhxe4NznwHWGxsrp58sS4LFf3ES6q/GPI6NPMO90hpTB
 lCx0aIZ/W8sPfotWadVUJnCWLY/o9GVp9+fvj6ij5zkqUdhbIKJ08e47op5kr3XUmJhVsQPabkFjUOA3oDq5PkyT+eMqbCuN4QeF+babJON9ZNiv+DBg6KS+
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the info and for accepting my patch!  I'll better revise 
the subject lines from now on.

On 25/10/2022 15:57, Laurent Pinchart wrote:
> I forgot to mention, the subject line should start with "media:
> uvcvideo:", not "media: uvc_driver:". You can have a look at the git log
> to see how subject lines are usually formatted for a driver or
> subsystem.
> 
> No need to send a v3, I'll change this in my tree, for all three patches
> in the series.
> 
> On Tue, Oct 25, 2022 at 09:51:03PM +0300, Laurent Pinchart wrote:
>> Hi Pedro,
>>
>> Thank you for the patch.
>>
>> On Tue, Oct 25, 2022 at 02:04:48AM -0300, Pedro Guilherme Siqueira Moreira wrote:
>>> Fixes 'Missing a blank line after declarations' warning issued by
>>> scripts/checkpatch.pl on drivers/media/usb/uvc/uvc_driver.c
>>>
>>> Signed-off-by: Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>>> ---
>>>   drivers/media/usb/uvc/uvc_driver.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index 215fb483efb0..b591ad823c66 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -732,6 +732,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>>>   	/* Parse the alternate settings to find the maximum bandwidth. */
>>>   	for (i = 0; i < intf->num_altsetting; ++i) {
>>>   		struct usb_host_endpoint *ep;
>>> +
>>>   		alts = &intf->altsetting[i];
>>>   		ep = uvc_find_endpoint(alts,
>>>   				streaming->header.bEndpointAddress);
>>> @@ -1859,12 +1860,14 @@ static void uvc_delete(struct kref *kref)
>>>   
>>>   	list_for_each_safe(p, n, &dev->chains) {
>>>   		struct uvc_video_chain *chain;
>>> +
>>>   		chain = list_entry(p, struct uvc_video_chain, list);
>>>   		kfree(chain);
>>>   	}
>>>   
>>>   	list_for_each_safe(p, n, &dev->entities) {
>>>   		struct uvc_entity *entity;
>>> +
>>>   		entity = list_entry(p, struct uvc_entity, list);
>>>   #ifdef CONFIG_MEDIA_CONTROLLER
>>>   		uvc_mc_cleanup_entity(entity);
>>> @@ -1874,6 +1877,7 @@ static void uvc_delete(struct kref *kref)
>>>   
>>>   	list_for_each_safe(p, n, &dev->streams) {
>>>   		struct uvc_streaming *streaming;
>>> +
>>>   		streaming = list_entry(p, struct uvc_streaming, list);
>>>   		usb_driver_release_interface(&uvc_driver.driver,
>>>   			streaming->intf);
> 

-- 
Regards,
Pedro
