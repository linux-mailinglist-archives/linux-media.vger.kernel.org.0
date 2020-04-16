Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F251AB9F5
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 09:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439188AbgDPH3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 03:29:52 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53689 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438921AbgDPH3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 03:29:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Oyy1jx9r5lKa1Oyy4jQQRk; Thu, 16 Apr 2020 09:29:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587022188; bh=DqdND6kuqgf4MP68rqbu4eVpo/IvPUThVX/E1b9qYWk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O28htVFB2g9VlKyjMpQaO4Qkw3hkSru6nelJM36LYDNa9BEeobSS1at17dB6Y0zjK
         YISPjKIWGH9mS0/E/itkcRGu0Z8ZdV4EHuUNQYNm4ANvIKj9CykfWaDfPm2GOSxysC
         0vLb5xB0tF+fVISetD2RxAqXxzTDq1x/UvVoIR0NP4ougU40ybOvJxiTlveLGTXaUp
         5rFsGgQbcv2MF53R/hBlZjFFrkc2mnio16ak/7n1H5h9T0NHdJxK8QO2YqiV7pS+65
         AynqPK2g23inc5ad+YgSOJz0OflSpaHS+gmCnjny7vDD2Wl0o3arcWwg69FEz0eL6X
         xWqZzVOJ3+viQ==
Subject: Re: Script to build the media documentation as if it were a single
 book
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20200414153739.30b58bdc@coco.lan>
 <e83dbd40-2a34-3bad-be5f-e451c3a5d020@xs4all.nl>
 <20200416092132.2cbfce7e@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c55b5aae-ffb5-3ca0-b855-1df4a2da08f9@xs4all.nl>
Date:   Thu, 16 Apr 2020 09:29:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416092132.2cbfce7e@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEJxDXEvmPRMUaxgPzbrIU30tLVQ6SnwR+iWXGCMdvn7IZ4tQKHULJsiqKACxC9H+qhOvATWiLFiDOB0p9o9DygQdYTcyonWJMUJkLpWrpWj5LtYRyBx
 87C0uNhhy7dUGgGap/g8eRU9PwXXuo5nsV1L6ojux5DCRBjDhZzOhamaqHuxaRniE3gLumnnafR+qzw/QKarLdQ1irjYxRBYL3k=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2020 09:21, Mauro Carvalho Chehab wrote:
> Em Thu, 16 Apr 2020 09:01:55 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 14/04/2020 15:37, Mauro Carvalho Chehab wrote:
> 
>>> ================================
>>> Linux Kernel Media Documentation
>>> ================================
>>>
>>> .. toctree::
>>> 	:maxdepth: 4
>>>
>>>         admin-guide/index
>>>         driver-api/index
>>>         userspace-api/index  
>>
>> Wouldn't it make more sense to have the userspace-api before the admin-guide?
> 
> There, I just placed them on alphabetic order.
> 
> But answering your question, that depends on the audience ;-)
> 
> -
> 
> Yet, assuming that we are doing a good job, I would expect a lot more
> users than developers[1].

If you want to see what it looks like with userspace-api on top:

https://hverkuil.home.xs4all.nl/spec/index.html

I think it makes more sense that way.

Regards,

	Hans

> 
> [1] Granted, there are lots of gaps there for it to be a generic guide
>     to media subsystem. I'm planning to improve the admin-guide in order
>     to make it more consistent and useful for media users.
> 
> The order there, IMHO, doesn't matter much, as someone accessing it from
> LinuxTV.org would likely use this URL:
> 
> 	https://linuxtv.org/docs.php
> 
> Side note: I need to add a pointer to the admin guide there - and at the
> wiki pages.
> 
> Thanks,
> Mauro
> 

