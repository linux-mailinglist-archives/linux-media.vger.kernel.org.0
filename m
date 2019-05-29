Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDFB2E015
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfE2Orp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:47:45 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58203 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbfE2Orp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:47:45 -0400
Received: from [IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e] ([IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VzrihqjyRsDWyVzrjhhsMi; Wed, 29 May 2019 16:47:43 +0200
Subject: Re: [PATCH v7 1/3] media: cec: expose HDMI connector to CEC dev
 mapping
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190521105203.154043-1-darekm@google.com>
 <16889839-b4e9-9984-2e36-5f07ceb7d7f2@xs4all.nl>
 <CALFZZQH7-mzRZbji1w-UwRLdw6c8+CThn0e96oG8E2Eq1ivANQ@mail.gmail.com>
 <8e575d0b-4765-ae54-019e-0fab522fe1d5@xs4all.nl>
Message-ID: <a421ff13-c8ee-b72c-3e1e-376b9e426064@xs4all.nl>
Date:   Wed, 29 May 2019 16:47:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8e575d0b-4765-ae54-019e-0fab522fe1d5@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOFT+KbQpijqyY5R6EctfAmZFUWcR7Yo8VtDvKyY1iseCfmQislEu119ZXE7vyKuwoWGVlrk+vRYss4UV7TI8lpabv6A4Ezf/SBF9CeiZfUq0sePM05e
 klvYpdsrUkSKH2hKRVUZ1ZAeP0aAob/B/vnp76BTChU1VyxDtyuYsYr0o9Hdy+U7dgTuyiYF3rHTAH9oYrUS9Q2nMMMUWBlGV9iCOaC8uSe99TNO1rPcszYo
 Nzu1hK4y16hkHF8msZQxpkL5JfsrZGydglixkKiYet2TKPe7rYJu6upOAlaXYloccL2jEDt0MakXY9bc2OZ72gj8JjsGUCWl+NNQJAzeUXqpoT9MgPQoYjnt
 tHyGHbib
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/28/19 10:05 AM, Hans Verkuil wrote:
> On 5/28/19 9:53 AM, Dariusz Marcinkiewicz wrote:
>> On Fri, May 24, 2019 at 11:21 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>
>>> Hi Dariusz,
>>>
>>> I did some more testing with the Khadas VIM2 and found another problem,
>>> something that will, unfortunately, require some redesign.
>>>
>> ...
>>>
>>> The other problem is in the CEC driver: it creates the CEC device as
>>> soon as the HDMI device is found (cec_notifier_parse_hdmi_phandle).
>>>
>>> But that doesn't mean that the HDMI device also had registered itself
>>> as a CEC notifier.
>>>
>>> Until now that never mattered: as long as the HDMI device was found
>>> the CEC adapter would function fine, it would just have no physical
>>> address until so notified by the HDMI device once it registered its
>>> CEC notifier.
>>>
>>> But if we want to have valid connector info during the lifetime of
>>> the CEC adapter, then this no longer works.
>>>
>>> I'm not entirely sure how to handle this.
>>>
>>> Another issue here is that when the HDMI driver removes the notifier,
>>> then it should also zero the connector info. Remember that both the
>>> HDMI and the CEC drivers can be loaded and unloaded independently from
>>> one another.
>>>
>> Given all of the above, what do you think about coming back to the v1
>> of the patch, where a connector info could be set on an adapter at any
>> time and an event was used to notify userland when that happened? That
>> approach seems to cover all the scenarios mentioned above.
> 
> That's just hiding the real problems :-)
> 
> I hope to spend some time on CEC tomorrow and I'll get back to you then.

Unfortunately I had too many other things going on to spend time on this.

Hopefully next week.

Regards,

	Hans

