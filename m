Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4080976C802
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 10:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbjHBII6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 04:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbjHBII5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 04:08:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566DB189
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 01:08:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E53CD61853
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 08:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C421CC433C8;
        Wed,  2 Aug 2023 08:08:54 +0000 (UTC)
Message-ID: <23dabcf0-d633-05b0-abbd-de4aed60dea4@xs4all.nl>
Date:   Wed, 2 Aug 2023 10:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [bug report] [media] adv7511: add new video encoder
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-media@vger.kernel.org
References: <591910e0-15db-4055-85ef-d4ca99649120@moroto.mountain>
 <1f43956c-296a-b1ad-6a36-19a3f0ffeb6b@xs4all.nl>
 <8bab054d-2e28-4189-8f7c-9982d959c891@kadam.mountain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <8bab054d-2e28-4189-8f7c-9982d959c891@kadam.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/08/2023 09:49, Dan Carpenter wrote:
> On Wed, Aug 02, 2023 at 09:27:17AM +0200, Hans Verkuil wrote:
>> Hmm, this is old code and when digging into this I noticed inconsistencies
>> in how it is used and how it is documented.
>>
>> It's used by the v4l2_subdev interrupt_service_routine callback. The header
>> include/media/v4l2-subdev.h claims that it is called from IRQ context, but this
>> isn't true in most cases. It's used primarily to pass on interrupts meant for
>> i2c video receivers/transmitters that arrive at the bridge chip to the actual
>> i2c device. And that happens in work handlers that allow the use of locking.
>>
>> I found one exception where it is also used for an IR (infrared) receiver and
>> there it is actually called from IRQ context. It doesn't use i2c or sleeps/locking
>> in that case, so it is safe.
>>
>> But what confuses me is that you state 'This looks at functions which are passed to
>> request_irq()', but adv7511_isr isn't passed to request_irq. So why is this warning
>> raised?
>>
> 
> Actually you're right.  I was thrown off a bit by the name.
> 
> Was the exception cx23885_irq()?  Because that's what Smatch is
> concerned about.  That calls "v4l2_subdev_call(dev->sd_ir, core,
> interrupt_service_routine," and Smatch thinks interrupt_service_routine
> can point to here.

Indeed, that's the exception. I wasn't even aware of this myself until I started
grepping the code.

I wonder if there is better kernel support for things like this, i.e. the irq
from one device is hooked up to another device. Typical for PCI devices where
the i2c devices on the PCI card route their interrupt lines to the PCI bridge
device.

An alternative is to change the sd_ir handling so that it doesn't use
the interrupt_service_routine callback and then change the documentation for
the interrupt_service_routine callback to allow sleeping. It's rather ugly
the way these two modes are mixed today.

Regards,

	Hans

> 
> Thanks for looking at this.  It's a new check I'm working on and it
> still has a bunch of issues.
> 
> regards,
> dan carpenter
> 

