Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B40531D9A6
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 13:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbhBQMme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 07:42:34 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39173 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232689AbhBQMmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 07:42:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CM9KljF3hYbfZCM9NlpCak; Wed, 17 Feb 2021 13:41:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613565710; bh=jMNufNdjrLzsPUqUinFZj/ht+Jb0NxZ/XBg60m8kUCA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ojLgGalnnBCmFLrjG12ifcpdbLc8zQ3oSuat2T9FJDMKmd17b2Yki93vtDGkOQEvN
         RxQ5U+BWlc42UY8kfhO3/QrYmj0jr9gg6tG6nBQshuQvVOUFSA8BnUQIUm4ABHS0+j
         TrljBaWmvDxf5BpW1WOFiiIAa7MWD+erLdNqLW7iGKW6/o4cH8v8qGrDpJSJmFH0ql
         gkZw4MvbhUbYyE7JKHR1awbK7ad2SJHRTXKLToM6IwOSmVgVY/nYFsvLfCadEeD03c
         oRODv1P4Md5akBPbJhWHLsAoJwR5TEHe8tafRZuBH0++0UjLrmi76vbWgIDbDbeneF
         0AHV1NdtEOMXQ==
Subject: Re: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
References: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8d24dad6-cb2a-da91-bd38-887a7aa3282f@xs4all.nl>
Date:   Wed, 17 Feb 2021 13:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLElcs5b0M81Mfdvb3J39zxVGtl6MH4k5XJmk7tHAJu/YHLzfZdOyeWzzzhi7b7L3DPhn5wmXIC+pQrInTiOf4Dp38J4OFPqTue1pcZ1d1RWyx3XrltE
 azfgd6KkqDFb+UQC22UWO+ZQE4dZCvUonh5W41GiBaezfpOpKRTjZLCncsMNNta4iAskipu5+drfbrxmzAuK5NehP86sJb5qToEv7QZ/34G5pYmcClfj50d+
 9ZAeALcZCiu7H2HYGZaexhm24Wwz3W70297WzjjrRo0IWlx8pfO0KG5x2+tRYu9Q
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 17/02/2021 13:24, Hans de Goede wrote:
> <resend with the linux-media list added to the Cc>
> 
> Hi Hans,
> 
> Fedora has a (opt-in) system to automatically collect backtraces from software
> crashing on users systems.
> 
> This includes collecting kernel backtraces (including once triggered by
> WARN macros) while looking a the top 10 of the most reported backtrace during the
> last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/
> 
> I noticed the following backtrace:
> https://retrace.fedoraproject.org/faf/problems/8150/
> which has been reported 170000 times by Fedora users who have opted-in during the
> last 14 days.
> 
> The issue here is that cec_register_adapter ends up calling request_module()
> from an async context, triggering this warn in kernel/kmod.c __request_module():
> 
>         /*
>          * We don't allow synchronous module loading from async.  Module
>          * init may invoke async_synchronize_full() which will end up
>          * waiting for this task which already is waiting for the module
>          * loading to complete, leading to a deadlock.
>          */
>         WARN_ON_ONCE(wait && current_is_async());
> 
> The call-path leading to this goes like this:
> 
>  ? kvasprintf+0x6d/0xa0
>  ? kobject_set_name_vargs+0x6f/0x90
>  rc_map_get+0x30/0x60

It's not CEC, it is rc_map_get that calls request_module() for rc-cec.ko.

I've added Sean Young to the CC list.

Sean, is it possible to treat rc-cec as a built-in if MEDIA_CEC_RC is set?

I think this issue is very specific to CEC. I would not expect to see this
with any other rc keymap.

Regards,

	Hans

>  rc_register_device+0x108/0x510
>  cec_register_adapter+0x5c/0x280 [cec]
>  drm_dp_cec_set_edid+0x11e/0x178 [drm_kms_helper]
>  intel_dp_set_edid+0x8d/0xc0 [i915]
>  intel_dp_detect+0x188/0x5c0 [i915]
>  drm_helper_probe_single_connector_modes+0xc2/0x6d0 [drm_kms_helper]
>  ? krealloc+0x7b/0xb0
>  drm_client_modeset_probe+0x25b/0x1320 [drm]
>  ? kfree+0x1ea/0x200
>  ? sched_clock+0x5/0x10
>  ? sched_clock_cpu+0xc/0xa0
>  __drm_fb_helper_initial_config_and_unlock+0x37/0x470 [drm_kms_helper]
>  ? _cond_resched+0x16/0x40
>  intel_fbdev_initial_config+0x14/0x30 [i915]
>  async_run_entry_fn+0x39/0x160
> 
> So 2 questions:
> 
> 1. Can we get this fixed please ?
>    Related to this, what happens if we make this an async modprobe
>    (when running from async context) is that a problem, or is it fine
>    if the rc_map module gets loaded later ?
> 
> 2. If the answer to 1. is "tricky", "maybe" or some such then can we
> look into a workaround here ? E.g. do we know in advance which module
> is going to be requested (1), or does that depend on the EDID data ?
> 
> Regards,
> 
> Hans
> 
> 
> 1) And can we thus do tricks with a softdep on it ?
> 

