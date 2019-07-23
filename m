Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE19716AB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 12:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731863AbfGWK7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 06:59:00 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37065 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731069AbfGWK7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 06:59:00 -0400
Received: from [IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2] ([IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id psVShunI2LqASpsVWhIbUw; Tue, 23 Jul 2019 12:58:58 +0200
Subject: Re: [RFC] Removal of drivers/staging/media/bcm2048
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <e78d190f-5185-f37a-c212-b88af2198f55@xs4all.nl>
 <20190723090952.GB30669@amd> <20190723094856.rlwt3rns3yt6q6uz@pali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f20fc4bf-537f-0672-11fd-9ba61eb788c7@xs4all.nl>
Date:   Tue, 23 Jul 2019 12:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190723094856.rlwt3rns3yt6q6uz@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI3b46cPLvIQxDBIqW3WoXCOSsHUsAr4/RaYScFeelY8SBQrVAZN+Mghx6UsRf/MVGX0CEtHaXiP+pwBjpl5L9dtOjgIA8RVA6xS3qtufQXYjAgk+/Gn
 1ptBm6LAujATg1dYShwKpl7gUuoiI92krYG09qKuTwmZ+C1xMe8jBBIGnD7a41YNno/YLqJ8NJ77Mi57cny8EiNlyOnDBMrFpnt0IdGLUZPPHZsvKCu1c/u+
 P5r0ZBzSRw+VFfHrNuLdzhqhVHHys0b2ytLX9jMTKRNhhiDBPYNQozvlk4nJ9Q/AvOGhYNm8D/vCWIVKXE6oiYbiyKNPx36R2QnILCOF5Ao=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/23/19 11:48 AM, Pali Rohár wrote:
> On Tuesday 23 July 2019 11:09:53 Pavel Machek wrote:
>> On Tue 2019-07-23 10:51:52, Hans Verkuil wrote:
>>> This staging driver is now almost 6 years old, but hasn't seen any real
>>> development for a long time.
>>>
>>> I think it is time to remove it, unless someone plans to do work on this
>>> in the near future.
>>>
>>> If anyone wants to work on this, please let us know.
>>
>> So... unfortunately this one depends on bluetooth driver, which is
>> quite complex. Unfortunately, that one was removed from staging while
>> it was being worked upon, and seen little progress since that.
> 
> There is already a new bluetooth driver hci_nokia for bcm2048:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bluetooth/hci_nokia.c

Hmm, this went in two years ago.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/omap3-n900.dts
> 

Is there any chance that this bcm2048 driver will be fixed and moved out of staging
by the end of this year? If not, then I want to remove it.

Regards,

	Hans
