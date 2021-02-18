Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D551831ECB0
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhBRQ6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232148AbhBRPfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 10:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613662429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cXwBu44Gt/59PVNAKPRiMaGm733nNFeT0v/3m+FoRdg=;
        b=FIUgA0mAzfYt3nCNdMxTdjyUy8FT4gPS9qauHAJDLMSXlVHXMGwGyjZ1o2gMpHVU9wYwYT
        C04xdyw0UpMqtIwABRV0tPtJUVXanE0Eo1d88PNbP2K12EnFtwc+QUCXVsj4sL/5UQuL2N
        DfVK1Z73SBMZ8vXunT60LLrJS/Wx2K0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Yyu4nz4YOtqntOSEM_7vxw-1; Thu, 18 Feb 2021 10:33:41 -0500
X-MC-Unique: Yyu4nz4YOtqntOSEM_7vxw-1
Received: by mail-ed1-f71.google.com with SMTP id l23so1056794edt.23
        for <linux-media@vger.kernel.org>; Thu, 18 Feb 2021 07:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cXwBu44Gt/59PVNAKPRiMaGm733nNFeT0v/3m+FoRdg=;
        b=SgFuBqXiaFdlVSIR6USvOY4BR9UjGBC+3PGgFkAVEzgIsLZcHp9ZDzOxKmmG8rb48F
         FCPeOpJp2TRL3Ki16LZqBLNAbfuh14xowPms1DJ1DW0/+fTFlFgf2CMUhvq/fcA5Vw2q
         Ut/s1tPToM/ky4C+ctn7CiXYHtgIrEy5CW69AFqbQsSYxgJWs6DuksZu3/3E1tPVcbTP
         a8ndglWSU0hTrGLrxpfkNYA6nk/nL7KDyMdX9njUSDPwl5CH0DEWXj0uhLFD62UzYhaY
         SO56fAgBd/doSGE4QOXHpCzs6yITYg1cIozik/utb97zly53SMFXpik1LOkfMBOQ4UHP
         yM9A==
X-Gm-Message-State: AOAM531uhyRUh/yzxEx8pgLjpJFeGaNEPHQDoI6+NwsN0QBfx95jgyqA
        2p7bs1khx0b3tuf8HY28yY3u7BSda+9ccZR8YNZ8SfRYnr1bP2PzM/LbSCKhWRod4BHOWxaOzai
        ZCZLJttL8TiHpOnoY4fb5nM2Gu7PMCfjQlwruXqbhjCB0b/0B1kq/hJDVk23cxp4Q4wwjoWBzaZ
        s=
X-Received: by 2002:a17:906:9455:: with SMTP id z21mr2783510ejx.174.1613662419188;
        Thu, 18 Feb 2021 07:33:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza1iW6RF5uJer+oZDReT/x4THRY7QezKMknIvzSC+EFxhJ1b4ijyCH4aH9pK5y4BF4X1efHQ==
X-Received: by 2002:a17:906:9455:: with SMTP id z21mr2783490ejx.174.1613662418922;
        Thu, 18 Feb 2021 07:33:38 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e22sm3207946edj.54.2021.02.18.07.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 07:33:38 -0800 (PST)
Subject: Re: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
To:     Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
 <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
 <20210217143223.GA28632@gofer.mess.org>
 <1c081320-d040-12b7-fbd6-e6b8c03c2ae8@redhat.com>
 <20210217151159.GA29680@gofer.mess.org>
 <876e34f6-c39b-8e97-7ebb-79ae2c356e53@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3e3c983f-b3bc-fe94-9247-69c8d97754df@redhat.com>
Date:   Thu, 18 Feb 2021 16:33:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <876e34f6-c39b-8e97-7ebb-79ae2c356e53@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/17/21 5:29 PM, Hans Verkuil wrote:
> On 17/02/2021 16:11, Sean Young wrote:
>> Hi,
>>
>> On Wed, Feb 17, 2021 at 04:04:11PM +0100, Hans de Goede wrote:
>>> On 2/17/21 3:32 PM, Sean Young wrote:
>>>> On Wed, Feb 17, 2021 at 01:41:46PM +0100, Hans Verkuil wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On 17/02/2021 13:24, Hans de Goede wrote:
>>>>>> <resend with the linux-media list added to the Cc>
>>>>>>
>>>>>> Hi Hans,
>>>>>>
>>>>>> Fedora has a (opt-in) system to automatically collect backtraces from software
>>>>>> crashing on users systems.
>>>>>>
>>>>>> This includes collecting kernel backtraces (including once triggered by
>>>>>> WARN macros) while looking a the top 10 of the most reported backtrace during the
>>>>>> last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/
>>>>>>
>>>>>> I noticed the following backtrace:
>>>>>> https://retrace.fedoraproject.org/faf/problems/8150/
>>>>>> which has been reported 170000 times by Fedora users who have opted-in during the
>>>>>> last 14 days.
>>>>>>
>>>>>> The issue here is that cec_register_adapter ends up calling request_module()
>>>>>> from an async context, triggering this warn in kernel/kmod.c __request_module():
>>>>>>
>>>>>>         /*
>>>>>>          * We don't allow synchronous module loading from async.  Module
>>>>>>          * init may invoke async_synchronize_full() which will end up
>>>>>>          * waiting for this task which already is waiting for the module
>>>>>>          * loading to complete, leading to a deadlock.
>>>>>>          */
>>>>>>         WARN_ON_ONCE(wait && current_is_async());
>>>>>>
>>>>>> The call-path leading to this goes like this:
>>>>>>
>>>>>>  ? kvasprintf+0x6d/0xa0
>>>>>>  ? kobject_set_name_vargs+0x6f/0x90
>>>>>>  rc_map_get+0x30/0x60
>>>>>
>>>>> It's not CEC, it is rc_map_get that calls request_module() for rc-cec.ko.
>>>>>
>>>>> I've added Sean Young to the CC list.
>>>>>
>>>>> Sean, is it possible to treat rc-cec as a built-in if MEDIA_CEC_RC is set?
>>>>>
>>>>> I think this issue is very specific to CEC. I would not expect to see this
>>>>> with any other rc keymap.
>>>>
>>>> So CEC creates an RC device with a keymap (cec keymap, of course) and then
>>>> the keymap needs to be loaded. We certainly don't want all keymaps as
>>>> builtins, that would be a waste.
>>>>
>>>> The cec keymap is scanned once to build a map from cec codes to linux
>>>> keycodes; making it builtin is not ideal, and makes the build system a
>>>> bit messy.
>>>>
>>>> I don't think we can load the keymap later, user space may start remapping
>>>> the keymap from udev.
>>>>
>>>> Possibly we could create the cec or rc device later but this could be a bit
>>>> messy.
>>>>
>>>> Could CEC specify:
>>>>
>>>> #if IS_ENABLED(CONFIG_MEDIA_CEC_RC)
>>>> MODULE_SOFTDEP("rc-cec")
>>>> #endif
>>>
>>> That would need to be:
>>>
>>> MODULE_SOFTDEP("pre: rc-cec")
>>>
>>> I see that the drm_kms_helper and i915 drivers both depend on the cec module already,
>>> so yes if that module will request for rc-cec to be loaded before it is loaded
>>> (and thus before i915 is loaded) then that should work around this.
>>>
>>> Assuming the user is using a module-loader which honors the softdep...
>>>
>>> Also this assumes that rc_map_get is smart enough to not call request_module()
>>> if the module is already loaded, is that the case ?
>>
>> Yes, see rc_map_get().
> 
> I tried this. It works if CONFIG_RC_CORE is set to m, but setting it to
> y resulted in the same problem. It looks like MODULE_SOFTDEP only works if rc_main
> is a module as well.

Yeah that is a known limit of module softdeps, they only work inside modules ...

Still, assuming there is no easy other fix, we could still use this somehow.

I do see that at least Fedora actually has CONFIG_RC_CORE=y for some reason.

I guess we could maybe add the softdep to the CONFIG_RC_MAP module or
maybe to the module which contains the code enabled by CONFIG_DRM_DP_CEC ?

At least Fedora has all drm stuff as modules and also has CONFIG_RC_MAP=m,

I know this is not a real fix but a workaround to get rid of 170,000
backtraces / 14 days being reported by (opted-in) systems running the
Fedora generic kernel config would be welcome regardless of it being the
"perfect" fix.

Regards,

Hans

