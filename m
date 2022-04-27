Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849CE51242C
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 22:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236777AbiD0U7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 16:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiD0U7m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 16:59:42 -0400
X-Greylist: delayed 2175 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 Apr 2022 13:56:31 PDT
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449031083
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 13:56:30 -0700 (PDT)
Message-ID: <7a3bfccf-743f-6c18-e221-9490c258a903@gentoo.org>
Date:   Wed, 27 Apr 2022 16:56:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/1] media: i2c: ov2640: Depend on V4L2_FWNODE
Content-Language: en-US
References: <90ec589b-7361-03aa-dab1-54ccd4116207@gentoo.org>
 <YmmthjPAJIboBCbk@valkosipuli.retiisi.eu>
To:     linux-media@vger.kernel.org
From:   Mike Pagano <mpagano@gentoo.org>
In-Reply-To: <YmmthjPAJIboBCbk@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/27/22 16:54, Sakari Ailus wrote:
> Hi Mike,
> 
> Thanks for the patch.
> 
> On Wed, Apr 27, 2022 at 04:20:12PM -0400, Mike Pagano wrote:
>> Add V4L2_FWNODE as a dependency to match other drivers and prevent
>> failures when compile testing.
>>
>> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
>> ---
>>   drivers/media/i2c/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index fae2baabb773..6168c04d8b37 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -372,6 +372,7 @@ config VIDEO_OV13B10
>>   config VIDEO_OV2640
>>   	tristate "OmniVision OV2640 sensor support"
>>   	depends on VIDEO_DEV && I2C
>> +	select V4L2_FWNODE
> 
> The driver doesn't use v4l2-fwnode but seems to depend on v4l2-async.
> 
> Shouldn't this be V4L2_ASYNC instead?
> 
> Could you also add this tag:
> 
> Fixes: ff3cc65cadb5 ("media: v4l: async, fwnode: Improve module organisation")
> 
>>   	help
>>   	  This is a Video4Linux2 sensor driver for the OmniVision
>>   	  OV2640 camera.
> 

Thank-you for the response, Sakari, I will fix and resubmit.


