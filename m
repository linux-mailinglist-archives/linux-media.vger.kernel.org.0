Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC19F31E7DE
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 10:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhBRJRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 04:17:49 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49745 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231166AbhBRJA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 04:00:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Cf9qlLWDL5126Cf9tlkxa5; Thu, 18 Feb 2021 09:59:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613638777; bh=gtOCHoCFmxYBNbMPd14sed/V7TTiMapK02LTLG+7DS8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DPBnumIukOgXUoZFUVYUa8kgYXkWu5k/ICBP6ZW1LxeJEuuV35s05lvkNIIwq+Rnx
         37A2uPaQRPxDtFX8ueQh0SF+1p9D8kB4E8Wa+E3FAFwBwJkCHTuYY8UuGttGpRIx2L
         w6ckiqDQunkUWdUO2fMzZMbj42HWPk1iNrhOQe5oa2oZIWVJHnWM1x42Df3PbOjNQk
         ujH0dSfzP1kgV8haPuFH9BLLt+HI3ibUhhxXOeTJ7scRsN4kfifc6Ph2B5wd0Dfchy
         pQ6FdyxSg5OdjcBvrC/YFkehaqIn9fLfr/SfbMlbQY9ofqgUgsfMjJ4YGucWON3Aoj
         UeMZeu45B2kJw==
Subject: Re: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
To:     Sean Young <sean@mess.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
 <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
 <20210217143223.GA28632@gofer.mess.org>
 <1c081320-d040-12b7-fbd6-e6b8c03c2ae8@redhat.com>
 <20210217151159.GA29680@gofer.mess.org>
 <876e34f6-c39b-8e97-7ebb-79ae2c356e53@xs4all.nl>
 <20210218085214.GA9864@gofer.mess.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c7b500cd-552c-21b1-a5a3-b717c59bb2b4@xs4all.nl>
Date:   Thu, 18 Feb 2021 09:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218085214.GA9864@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfA3rpRmh8D3EACvBL4aVdBRaVINpwkNRT6ElYRsLUFtsTHct41Vx5YNLe28Q6ZQ1VFNo/539GN7+dgeegCvu9p9hQooAwK/AA/GpqxGQEZwyF/dHDJ8j
 S7jUtap6plsfBEF9UXnOcKgRSI+V7y9Pi49xhixBQqNVgXjg0aDx8kxlgNJf3m5kaKx1NM5uIB1Ahq3ifK6OmH2Eamk9gdHCC5n0OUaycQm4aMcipG/jJ3eI
 n0CbdlubbdLS+RUnUN1nQxbWLizxL3sNpMKqn54YoFHGHymokRvn0rRpsTiryXQ2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/02/2021 09:52, Sean Young wrote:
> Hi,
> 
> On Wed, Feb 17, 2021 at 05:29:46PM +0100, Hans Verkuil wrote:
>> On 17/02/2021 16:11, Sean Young wrote:
>>> On Wed, Feb 17, 2021 at 04:04:11PM +0100, Hans de Goede wrote:
>>>> On 2/17/21 3:32 PM, Sean Young wrote:
>>>>> On Wed, Feb 17, 2021 at 01:41:46PM +0100, Hans Verkuil wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> On 17/02/2021 13:24, Hans de Goede wrote:
>>>>>>> <resend with the linux-media list added to the Cc>
>>>>>>>
>>>>>>> Hi Hans,
>>>>>>>
>>>>>>> Fedora has a (opt-in) system to automatically collect backtraces from software
>>>>>>> crashing on users systems.
>>>>>>>
>>>>>>> This includes collecting kernel backtraces (including once triggered by
>>>>>>> WARN macros) while looking a the top 10 of the most reported backtrace during the
>>>>>>> last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/
>>>>>>>
>>>>>>> I noticed the following backtrace:
>>>>>>> https://retrace.fedoraproject.org/faf/problems/8150/
>>>>>>> which has been reported 170000 times by Fedora users who have opted-in during the
>>>>>>> last 14 days.
>>>>>>>
>>>>>>> The issue here is that cec_register_adapter ends up calling request_module()
>>>>>>> from an async context, triggering this warn in kernel/kmod.c __request_module():
>>>>>>>
>>>>>>>         /*
>>>>>>>          * We don't allow synchronous module loading from async.  Module
>>>>>>>          * init may invoke async_synchronize_full() which will end up
>>>>>>>          * waiting for this task which already is waiting for the module
>>>>>>>          * loading to complete, leading to a deadlock.
>>>>>>>          */
>>>>>>>         WARN_ON_ONCE(wait && current_is_async());
>>>>>>>
>>>>>>> The call-path leading to this goes like this:
>>>>>>>
>>>>>>>  ? kvasprintf+0x6d/0xa0
>>>>>>>  ? kobject_set_name_vargs+0x6f/0x90
>>>>>>>  rc_map_get+0x30/0x60
>>>>>>
>>>>>> It's not CEC, it is rc_map_get that calls request_module() for rc-cec.ko.
>>>>>>
>>>>>> I've added Sean Young to the CC list.
>>>>>>
>>>>>> Sean, is it possible to treat rc-cec as a built-in if MEDIA_CEC_RC is set?
>>>>>>
>>>>>> I think this issue is very specific to CEC. I would not expect to see this
>>>>>> with any other rc keymap.
>>>>>
>>>>> So CEC creates an RC device with a keymap (cec keymap, of course) and then
>>>>> the keymap needs to be loaded. We certainly don't want all keymaps as
>>>>> builtins, that would be a waste.
>>>>>
>>>>> The cec keymap is scanned once to build a map from cec codes to linux
>>>>> keycodes; making it builtin is not ideal, and makes the build system a
>>>>> bit messy.
>>>>>
>>>>> I don't think we can load the keymap later, user space may start remapping
>>>>> the keymap from udev.
>>>>>
>>>>> Possibly we could create the cec or rc device later but this could be a bit
>>>>> messy.
>>>>>
>>>>> Could CEC specify:
>>>>>
>>>>> #if IS_ENABLED(CONFIG_MEDIA_CEC_RC)
>>>>> MODULE_SOFTDEP("rc-cec")
>>>>> #endif
>>>>
>>>> That would need to be:
>>>>
>>>> MODULE_SOFTDEP("pre: rc-cec")
>>>>
>>>> I see that the drm_kms_helper and i915 drivers both depend on the cec module already,
>>>> so yes if that module will request for rc-cec to be loaded before it is loaded
>>>> (and thus before i915 is loaded) then that should work around this.
>>>>
>>>> Assuming the user is using a module-loader which honors the softdep...
>>>>
>>>> Also this assumes that rc_map_get is smart enough to not call request_module()
>>>> if the module is already loaded, is that the case ?
>>>
>>> Yes, see rc_map_get().
>>
>> I tried this. It works if CONFIG_RC_CORE is set to m, but setting it to
>> y resulted in the same problem. It looks like MODULE_SOFTDEP only works if rc_main
>> is a module as well.
> 
> Hmm, I'm not quite sure what is happening here. How can I reproduce this
> issue locally?

You need the right hardware for this, I'm afraid: this issue happens if you have
a DisplayPort-to-HDMI adapter that supports CEC and CONFIG_DRM_DP_CEC is set to y.

In my case I have an Intel NUC with a USB-C to HDMI adapter from Club 3D (CAC-2504).

I can easily test patches for you.

Regards,

	Hans
