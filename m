Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937D746CF1
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2019 01:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfFNX0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 19:26:48 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34363 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFNX0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 19:26:48 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so9432585iot.1
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2019 16:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BgBzUprMwzxsPrUZNWFb4TI8c1DrqIQ3OMpOfxCgcVs=;
        b=MYEZ7rV6UMaiVgCFYJK+xu/nqaoPXZxT6oh0Pv0vsmoNEWPLqK8YlLR3v8iSy8V42X
         awYvACi/szyb7fIaoWUsI0FWo5Mzm3DoAf+clHBsjkN0aXAjD8KvE6GCxiX/TbgP+t4g
         PFvfSpT3DKHUCpLTfTUtcF4c0qttULVKYylIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BgBzUprMwzxsPrUZNWFb4TI8c1DrqIQ3OMpOfxCgcVs=;
        b=R0FF0FrbG/N0W624f48OzmXNMS4Uv6u7QLzd5JB04OevSd++15FFf5/lzMPMylb5tF
         Ynpf4KOzdV861b/gRbVwyy1sVNXL0Dle3CJr+eHoJbaGM5Q557pSF4eEtZpKhlxVg4Sl
         u1THXPUba41W9qqq6MS0RW5KV1EMJgNVPTc9FBipcIi9UczttKvWlWXWyhBcMPAH+ptZ
         EppYZ+e/Uiq8I436PuXhCtAfrNtpwkpv0yjHu8PoFDmbeZmErw7ftt9+dUPavmIEHl9V
         3C8IUOwLmNByIDd0fvsT973jpmteJ3uj/KsZ3sb2kjJmrkEy9Ef+u/dpdJcSmhWDdtx7
         HHqg==
X-Gm-Message-State: APjAAAWadkiNCiXwX1jvdssHVup/6L9pbhsr5GZLe9hsFz/A+c222pMw
        vmxQXbTUMBVimNkCQUWyf71Mqg==
X-Google-Smtp-Source: APXvYqxgmtCNsTmHG+dcHz1s0SZYMqut7P+FjNnZMFVIaHax7HqhzzuNcY6lDvMQIrBHy7YoUNYJOQ==
X-Received: by 2002:a05:6602:218b:: with SMTP id b11mr6217236iob.264.1560554807498;
        Fri, 14 Jun 2019 16:26:47 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o7sm3931020ioo.81.2019.06.14.16.26.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 16:26:47 -0700 (PDT)
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
 <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
Date:   Fri, 14 Jun 2019 17:26:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/13/19 7:24 AM, Helen Koike wrote:
> 
> 
> On 6/13/19 2:44 AM, Hans Verkuil wrote:
>> On 5/24/19 5:31 AM, Shuah Khan wrote:
>>> media_device is embedded in struct vimc_device and when vimc is removed
>>> vimc_device and the embedded media_device goes with it, while the active
>>> stream and vimc_capture continue to access it.
>>>
>>> Fix the media_device lifetime problem by changing vimc to create shared
>>> media_device using Media Device Allocator API and vimc_capture getting
>>> a reference to vimc module. With this change, vimc module can be removed
>>> only when the references are gone. vimc can be removed after vimc_capture
>>> is removed.
>>>
>>> Media Device Allocator API supports just USB devices. Enhance it
>>> adding a genetic device allocate interface to support other media
>>> drivers.
>>>
>>> The new interface takes pointer to struct device instead and creates
>>> media device. This interface allows a group of drivers that have a
>>> common root device to share media device resource and ensure media
>>> device doesn't get deleted as long as one of the drivers holds its
>>> reference.
>>>
>>> The new interface has been tested with vimc component driver to fix
>>> panics when vimc module is removed while streaming is in progress.
>>
>> Helen, can you review this series? I'm not sure this is the right approach
>> for a driver like vimc, and even if it is, then it is odd that vimc-capture
>> is the only vimc module that's handled here.
> 
> Hi Hans,
> 
> Yes, I can take a look. Sorry, I've been a bit busy these days but I'll
> try to take a look at this patch series (and the others) asap.
> 
> Helen
> 
>>
>> My gut feeling is that this should be handled inside vimc directly and not
>> using the media-dev-allocator.
>>

Hi Hans and Helen,

I explored fixing the problem within vimc before I went down the path to
use Media Device Allocator API. I do think that it is cleaner to go this
way and easier to maintain.

vimc is a group pf component drivers that rely on the media device vimc
in vimc and falls into the use-case Media Device Allocator API is added
to address. The release and life-time management happens without vimc
component drivers being changed other than using the API to get and put
media device reference.

thanks,
-- Shuah


