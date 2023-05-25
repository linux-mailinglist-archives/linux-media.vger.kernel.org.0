Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1204471061D
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 09:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbjEYHTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 03:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjEYHTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 03:19:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1531F83
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 00:19:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97FB264327
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE81C433EF;
        Thu, 25 May 2023 07:19:01 +0000 (UTC)
Message-ID: <e94d6e3f-f2c5-a389-85aa-283ea53f0458@xs4all.nl>
Date:   Thu, 25 May 2023 09:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] staging: media: atomisp: initialize settings to 0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
 <20230524121150.435736-2-hverkuil-cisco@xs4all.nl>
 <301a968c-77ef-22f3-8fc0-6be9a5839c69@redhat.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <301a968c-77ef-22f3-8fc0-6be9a5839c69@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2023 18:04, Hans de Goede wrote:
> Hi Hans,
> 
> On 5/24/23 14:11, Hans Verkuil wrote:
>> Fix a compiler warning:
>>
>> drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1525:13: warning: 'settings' may be used uninitialized [-Wmaybe-uninitialized]
>>
>> The 'settings' variable is actually always initialized, but the
>> compiler isn't quite able to figure that out. Just initialize it
>> to 0 to avoid this warning.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Hans de Goede <hdegoede@redhat.com>
> 
> Thank you for these patches. I have merged this one and 8/8
> into:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
> 
> I'm currently doing a lot of work on the atomisp code,
> so merging them through my atomisp branch is best to
> avoid conflicts (I already had to resolve a conflict).
> 
> So please refrain from merging 1/8 + 8/8 to some
> other linux-media tree/branch.

I've delegated patches 1 and 8 to you in patchwork.

Regards,

	Hans

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
>> ---
>>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> index c718a74ea70a..48ba0d0bcfe5 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> @@ -1522,7 +1522,7 @@ static int v4l2_acpi_handle_gpio_res(struct acpi_resource *ares, void *_data)
>>  	const char *name;
>>  	bool active_low;
>>  	unsigned int i;
>> -	u32 settings;
>> +	u32 settings = 0;
>>  	u8 pin;
>>  
>>  	if (!acpi_gpio_get_io_resource(ares, &agpio))
> 

