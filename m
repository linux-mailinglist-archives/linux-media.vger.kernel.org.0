Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7340E60C193
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 04:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJYCS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 22:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiJYCSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 22:18:22 -0400
X-Greylist: delayed 1463 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 19:18:21 PDT
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.46.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097B695E45
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 19:18:20 -0700 (PDT)
Received: from atl1wswcm04.websitewelcome.com (unknown [50.6.129.165])
        by atl1wswob02.websitewelcome.com (Postfix) with ESMTP id DFB5BE8705
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 01:53:56 +0000 (UTC)
Received: from br984.hostgator.com.br ([162.241.203.37])
        by cmsmtp with ESMTP
        id n98eojGGPgEOMn98eoBEl9; Tue, 25 Oct 2022 01:53:56 +0000
X-Authority-Reason: nr=8
Received: from [177.194.67.221] (port=40534 helo=[10.0.110.100])
        by br984.hostgator.com.br with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <pedro.guilherme@espectro.eng.br>)
        id 1on98e-0021b1-7h;
        Mon, 24 Oct 2022 22:53:56 -0300
Message-ID: <ffe53ee7-cd96-6183-bf71-81af2d728ec2@espectro.eng.br>
Date:   Mon, 24 Oct 2022 22:53:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] media: uvc_driver: fix missing newline after
 declarations
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221025010303.570815-1-pedro.guilherme@espectro.eng.br>
 <Y1c9nS04fpoLqPVe@pendragon.ideasonboard.com>
From:   Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
In-Reply-To: <Y1c9nS04fpoLqPVe@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - br984.hostgator.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - espectro.eng.br
X-BWhitelist: no
X-Source-IP: 177.194.67.221
X-Source-L: No
X-Exim-ID: 1on98e-0021b1-7h
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([10.0.110.100]) [177.194.67.221]:40534
X-Source-Auth: pedro.guilherme@espectro.eng.br
X-Email-Count: 14
X-Source-Cap: ZXNwZWN0ODU7ZXNwZWN0ODU7YnI5ODQuaG9zdGdhdG9yLmNvbS5icg==
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO0TXwEzcp515e91Y7x4nvNWRFRmJ9zZziSzBVKIbD8+N+a+s8cNA4fzNx1o/gqSR06iCguuESEZU3lIDWcpNAbUrMVDwzpY0V3MS1Nb9xHTno09cd5D
 wRTaoaQFC9wQIoV3T5WmdqXntPhePraJlHyHMbAd+9QaBlItrx/En9qeCJKFWA1B+YDDo2m0ZJIrr/51hohiN1lbfiUf7yv412K4wl0UTAed6fhaT3OegBer
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the heads up!  I'm fixing it right now.

On 10/24/22 22:36, Laurent Pinchart wrote:
> Hi Pedro,
> 
> Thank you for the patch.
> 
> On Mon, Oct 24, 2022 at 10:03:01PM -0300, Pedro Guilherme Siqueira Moreira wrote:
> 
> The code change looks good, but the commit message is missing. Same for
> the other two patches in the series.
> 
>> Signed-off-by: Pedro Guilherme Siqueira Moreira <pedro.guilherme@espectro.eng.br>
>> ---
>>   drivers/media/usb/uvc/uvc_driver.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index 215fb483efb0..b591ad823c66 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -732,6 +732,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>>   	/* Parse the alternate settings to find the maximum bandwidth. */
>>   	for (i = 0; i < intf->num_altsetting; ++i) {
>>   		struct usb_host_endpoint *ep;
>> +
>>   		alts = &intf->altsetting[i];
>>   		ep = uvc_find_endpoint(alts,
>>   				streaming->header.bEndpointAddress);
>> @@ -1859,12 +1860,14 @@ static void uvc_delete(struct kref *kref)
>>   
>>   	list_for_each_safe(p, n, &dev->chains) {
>>   		struct uvc_video_chain *chain;
>> +
>>   		chain = list_entry(p, struct uvc_video_chain, list);
>>   		kfree(chain);
>>   	}
>>   
>>   	list_for_each_safe(p, n, &dev->entities) {
>>   		struct uvc_entity *entity;
>> +
>>   		entity = list_entry(p, struct uvc_entity, list);
>>   #ifdef CONFIG_MEDIA_CONTROLLER
>>   		uvc_mc_cleanup_entity(entity);
>> @@ -1874,6 +1877,7 @@ static void uvc_delete(struct kref *kref)
>>   
>>   	list_for_each_safe(p, n, &dev->streams) {
>>   		struct uvc_streaming *streaming;
>> +
>>   		streaming = list_entry(p, struct uvc_streaming, list);
>>   		usb_driver_release_interface(&uvc_driver.driver,
>>   			streaming->intf);
> 
