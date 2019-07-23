Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D62B714F7
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 11:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbfGWJZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 05:25:06 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56371 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726432AbfGWJZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 05:25:06 -0400
Received: from [IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2] ([IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pr2ahuGpYLqASpr2ehIIXD; Tue, 23 Jul 2019 11:25:04 +0200
Subject: Re: [RFC] Removal of drivers/staging/media/davinci_vpfe
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sekhar Nori <nsekhar@ti.com>, Arnd Bergmann <arnd@arndb.de>
References: <93050d86-ec75-8394-4fdb-6a06ebb5ce6b@xs4all.nl>
 <cc1790b8-4199-e0ef-afb9-36eca9fd5c0a@xs4all.nl>
 <CA+V-a8tK+YGf7ww27OzM6FuO_4hwbz0eOvqFKgGe2cdiULzb6A@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <88fa0656-e819-3558-7d16-478cf8be75fc@xs4all.nl>
Date:   Tue, 23 Jul 2019 11:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CA+V-a8tK+YGf7ww27OzM6FuO_4hwbz0eOvqFKgGe2cdiULzb6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOqTMXvxAf49osZdPPgo7xY9dQglL/5UBDUrnV4MMCys7aLQ4ZcGYITXeHVgO/VtJrLwsLKYo5I7npkqzyYegeuqx5lL/8y5SQvi7p+1PHb9UJWmfsIO
 uht1iokgj0ZLv+8SwRRbnRUcSe7yi1ahmVoi5XNlnWokcx4qB7nwgkiJmKcKYaiSofjy7/BbumybF5RWYs8TJG9TbTTjHxlnfUh8ccoeNVzAmjTF+6lqYPpN
 nCiVvbBsCSp1y2ITYDBNpvQeikDF8vpqvdA6vEMWbWhkJB6zlew+sMr3wE+UoVmcR92lGc90kEYj+PI/niaqICTdLcRzoxEmqdE9St8pL4i8wvxMmXL5vIlL
 YmfzZJOfms3KB8VuFKPnReZAtPCkJe18jDyGob65Z3KjWaM4OSoepk9PkjHs+4j4FtLDW7FJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/23/19 11:06 AM, Lad, Prabhakar wrote:
> Hi Hans,
> 
> On Tue, Jul 23, 2019 at 9:48 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> +Laurent Pinchart
>>
>> On 7/23/19 10:46 AM, Hans Verkuil wrote:
>>> Hi Prabhakar,
>>>
>>> This staging driver is now almost 7 years old, but hasn't seen any real
>>> development for a long time.
>>>
>>> I think it is time to remove it, unless you plan to do work on this.
>>>
>>> What do you think?
>>>
> I don’t have any plans to work on it anytime soon, and also referring
> to Sekhar's email
> on Arnd's patch he's OK too drop the driver from staging.
> 
> shall I create a patch doing this ?

Arnd mentioned he was going to post a patch for that.

Regards,

	Hans
