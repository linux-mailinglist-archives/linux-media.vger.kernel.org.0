Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8310B84899
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 11:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfHGJ0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 05:26:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47519 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726772AbfHGJ0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 05:26:37 -0400
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747] ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vIDJhk9lbAffAvIDKh7Y1B; Wed, 07 Aug 2019 11:26:34 +0200
Subject: Re: [PATCH 4/5] media/ivtv: Reduce default FIFO priority
To:     Peter Zijlstra <peterz@infradead.org>,
        Andy Walls <andy@silverblocksystems.net>
Cc:     mingo@kernel.org, linux-kernel@vger.kernel.org,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <20190801111348.530242235@infradead.org>
 <20190801111541.858088180@infradead.org>
 <7970f0e30d1eb83e7067225d07b923863bf1ac50.camel@silverblocksystems.net>
 <20190801123806.GA31398@hirez.programming.kicks-ass.net>
 <20190802085822.GA2386@hirez.programming.kicks-ass.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c3f71479-d280-94ad-ab20-5098e599526a@xs4all.nl>
Date:   Wed, 7 Aug 2019 11:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190802085822.GA2386@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJl2hd1oBQ6uwnNgOxAxzYDsPm3NqVvYmwZbMVqyv1ZKT/NmBhqCp4Uh54+pKrRkJRXW3Z9kwoIqANVpdmBH4xrloe7lgEIluhdQnKHkpl9Vvi+dlbXQ
 OtrEb/s2mBU14VLDUJLDUXT2Mpsq6NhPxCgaZCYdt/i8481rV7ZdFozasa6ZBz7fpRfjRTjOdafazIdZ0Ul5masuvBxRf7BBoiiJZahGuEWx9ZI88OpjvJDX
 ZR/ZQ40CzRW6zzzzIPOf2jg1j7etAR9L6++sbnyTDGU+wO9Pi/RimhTp9cKqhx6y2Z1sTnUDeUvX3oEiIwv+dK/IyW038FkQ3k4JA3C3Y2qoB53EhtRvaoRW
 xEnSgOzDGzjSOfrsGId2tAB/2795uVIpXuHxfDAupAEVMfpzbKyVFvcVwCClXTsTNF5tMMfOuQWfvAnAIh3gGCJnikkS3LoXj2MgWfeT27IYXzK5QInHgSkA
 KtzsLpO0UhBWV3Jm71wi6EyJkeQ31112y7B0RQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/2/19 10:58 AM, Peter Zijlstra wrote:
> On Thu, Aug 01, 2019 at 02:38:06PM +0200, Peter Zijlstra wrote:
>> If the consumer of the data are RT tasks as well (I hadn't expected that
>> from a TV capture device) then I'd propose to use FIFO-50 as default.
>>
>> The thing is, the moment you're doing actual proper RT, the admin needs
>> to configure things anyway, which then very much includes setting the
>> priority of interrupt threads and the like.
>>
>> (that is exacty why pretty much everything defaults to FIFO-50)
> 
> Is the below acceptible?

I think this should be OK. ivtv is real-time sensitive since certain
tasks have to happen within (if I remember correctly) 1/60th of a second
(the time it takes to capture a single video field). Data is lost if it
can't be done within that time.

Using FIFO-50 means that it competes with other irq threads, and since
irq threads shouldn't take up much time anyway this should be OK.

Andy, what do you think?

Regards,

	Hans

> 
> ---
> Subject: media/ivtv: Reduce default FIFO priority
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Thu Aug  1 12:56:40 CEST 2019
> 
> The ivtv driver creates a FIFO-99 thread by default, reduce this to
> FIFO-50.
> 
> FIFO-99 is the very highest priority available to SCHED_FIFO and
> it not a suitable default; it would indicate the ivtv work is the
> most important work on the machine.
> 
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/media/pci/ivtv/ivtv-driver.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/media/pci/ivtv/ivtv-driver.c
> +++ b/drivers/media/pci/ivtv/ivtv-driver.c
> @@ -738,7 +738,7 @@ static void ivtv_process_options(struct
>   */
>  static int ivtv_init_struct1(struct ivtv *itv)
>  {
> -	struct sched_param param = { .sched_priority = 99 };
> +	struct sched_param param = { .sched_priority = MAX_RT_PRIO / 2 };
>  
>  	itv->base_addr = pci_resource_start(itv->pdev, 0);
>  	itv->enc_mbox.max_mbox = 2; /* the encoder has 3 mailboxes (0-2) */
> 

