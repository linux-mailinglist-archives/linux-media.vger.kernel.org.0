Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17354D90C2
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393004AbfJPMYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:24:44 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53023 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392997AbfJPMYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:24:44 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KiM3iHU2tPduvKiM6iqv2o; Wed, 16 Oct 2019 14:24:42 +0200
Subject: Re: [PATCH 30/34] media: cec-gpio: Use CONFIG_PREEMPTION
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-31-bigeasy@linutronix.de>
 <6897ccdb-e2b7-7739-e6b9-872306895a4f@xs4all.nl>
 <23950aea-3972-64fd-9493-d7f9f81db9d2@xs4all.nl>
 <20191016120225.bi6zyewpruvmxlnl@linutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <da2b5eb1-18c7-f0ca-d236-6395b2683f50@xs4all.nl>
Date:   Wed, 16 Oct 2019 14:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016120225.bi6zyewpruvmxlnl@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGm1tmWiMRu/hHe3FaOJBNR1p5NaWpTb0zP3uhTPN3nXL5KKo63TJ9oBbRIPPsvEJ7MaaONixt/ae1A+bQx8DjwEX8SJ498ZLBqrKiL1RAWfAfW8k9ue
 Hl9KmmsSuBffFBuXJDM7HSLix0t5qC2hBVd+RtzDAA+Z0ykvT0krhNljyVMNWyztgIV0d5hqLV/unxd9Oh9MizXKPSecq/b+z5kAjCMClOKmvvfu29Bd5He3
 ge6fED6wesngcO0PK1GHr9OP9RkeQ1w5pTLmTdaO9N+9RJ+YVzBqTXRK7i2L5KGAqfK1BKbUQ9g4oyVqhY+o4w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/16/19 2:02 PM, Sebastian Andrzej Siewior wrote:
> On 2019-10-16 13:51:14 [+0200], Hans Verkuil wrote:
>> Do you want me to take this patch? Just checking.
> 
> It is up to you. You have all the dependencies so you can either add it
> to your -next branch or leave it and we will pick it up for you.

I'll take it. I'm preparing a pull request anyway.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
> 
> Sebastian
> 

