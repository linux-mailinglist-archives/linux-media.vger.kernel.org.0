Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A91467453
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379609AbhLCJ6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 04:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhLCJ6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 04:58:43 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19678C06174A
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 01:55:19 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id t5HfmQD4hDFskt5HimNQr3; Fri, 03 Dec 2021 10:55:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638525318; bh=CX5pEqZFdy7zwleaJGvnXOyN6LYTwhVQGPorqAZuKKY=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:From:
         Subject;
        b=DwdKOYw9ESi5R0Qa2z6z7kwIA3fOxQuzzgzKrNoPejE5SLxC6oTVt88iEuWM3JMG8
         HTcAh/HQhwLLHTVUXNPUjNx++qaVhQebLCFPTCVd+WwdOg/m59E/XKa1YOsdiSe7/5
         drgKw8U7ZwwUqm9Ckkj7WjTrxN6R3p9lHiYeRP8WaiEBEhWpU23dyEWbipZZdWpRRM
         LH5nUHKWrSPZ61iXwOiM5/B+kR1hHABiJKb4nDJuZHTwI2TdhUAYAUHClpQ1xU1Kkm
         FLfWDAriI9tPoeO0bKfVMzeZRM35mhCHIZaO5yaAJlGNwIRyE9IKLO9xVvfaC9Ch/R
         wbsrpk9MQZu3A==
Message-ID: <63c9501c-6a58-ed69-265f-45f203952242@xs4all.nl>
Date:   Fri, 3 Dec 2021 10:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: ovm6211 linux driver
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
References: <YanepzHYQMH/DfHY@karbon.home.net>
 <b881c5b5-ee29-f250-5270-66c9d7357c94@xs4all.nl>
In-Reply-To: <b881c5b5-ee29-f250-5270-66c9d7357c94@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBAjElmEDBeZN1yupTDiHJFchjTJio7f6GvZSBU4EMSbYk1VoAKMkeCkBm2qS8hr6hqbNTnVjPOIEmBQw4RA0QJrxUwcHeihouVX1+oW4CR2x7L56Yqn
 JxA+GIIPWowaipJox6zzoUcG12Qlw0e/OOl9CsaQJWv+oa/OKTEr4mFZVk3NG0uaKL0B4oNR3z9caF96PgPtJwyapRskugNlmpO0Q+AJOXcxiK4NGs2n9HVs
 aZeGObXymTRR0rHJfG20Yw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/12/2021 10:43, Hans Verkuil wrote:
> Hi Petko,
> 
> On 03/12/2021 10:08, Petko Manolov wrote:
>> 	Hi guys,
>>
>> On request by certain company we've developed a media driver for OmniVision's 
>> ovm6211 camera sensor.  We just got permission to mainline the code.  How shall 
>> i proceed?
>>
>>
>> cheers,
>> Petko
>>
> 
> You found the correct mailinglist, so that's good :-)
> 
> This is a good starting page:
> 
> https://www.linuxtv.org/wiki/index.php/Developer_section
> 
> Check the 'Kernel driver development' - 'Submitting Your Work:' links.
> 
> Regards,
> 
> 	Hans
> 

Actually, this is a better source (for the media-subsystem-specific stuff):

https://www.kernel.org/doc/html/latest/driver-api/media/maintainer-entry-profile.html

together with this (general kernel development):

https://www.kernel.org/doc/html/latest/process/index.html

Regards,

	Hans
