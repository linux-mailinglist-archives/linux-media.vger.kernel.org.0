Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2D831D95E
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 13:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhBQM0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 07:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30985 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231889AbhBQMZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 07:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613564668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=erP6z4iS9l8jSM/k98u9owq5tUaRX8nsSTHFj5oxZ6o=;
        b=Nl7ZvTltX3o9+FT5EBF8/J72pCAlfAGRNyCZK1aMNiqgz9SbmDos4ANN3nfxf3izxlXWZU
        4fNd2PBKkyaJLRWUiJkhFgRojYZn1tTkxATiMGEBqhl+uuyS7UYDnQhqqxWvWKgYGL9nuu
        TJZeoi2A1Xjvbu4GYkgHGm97qcS1WPE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-YKRjfLXwNzuaL1r5S_AXVA-1; Wed, 17 Feb 2021 07:24:26 -0500
X-MC-Unique: YKRjfLXwNzuaL1r5S_AXVA-1
Received: by mail-ed1-f69.google.com with SMTP id i4so10071373edt.11
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 04:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=erP6z4iS9l8jSM/k98u9owq5tUaRX8nsSTHFj5oxZ6o=;
        b=GbOkV+NcvK+0tJePa83DJgl1ml/gkxJsab0WPW/6jDKpFs/4BJOZDBJjBnOs1p5jdc
         3VCAxsnNQiLrn9TDfhjuxkWJn8I/V/yxBM8Nk0a52Bjh7D2UhOodAvLGlHR5Q3yL8BoR
         Pc7tW4Hh5ONRp+99WeoVUD4V4tOgItkWxgkXv7usbI34aBfqRAxGisgTvGjEtPBgxR0v
         D+6+4HzYjOmC4OEZhS7DP/mgKt9rC5EKCDF1O/8uHfM3DAAwga6VKllFaRl7WQSP8tJD
         yTw+BMGTE9mF6e3+efNRtFU+WRh00Ei6grjaJfv4wS/SzlkSXlhARB4gW8KGyXWSkC6o
         Xaug==
X-Gm-Message-State: AOAM532lmWQ/NRnVfMtFCGqzcvW0lnsrh4r7jHCtiQfTurE+awnWlxE5
        R1yf44Pxb7EGNzgX5RHOc8Q/kAQcgl8CEOSgBLFtvjSmyLqpKtbWkMaLbEACfDAEIrRastabXaQ
        6WqHkeaqrStHRRWH4Z0QYuhbKZiJA6ZWFCJEX6KX12Hf7li3wJXDh6C9P1o0+YhH6Nz8tJAKaUX
        Y=
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr25521895edk.201.1613564665450;
        Wed, 17 Feb 2021 04:24:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6ILlMlSHB8/jRL5Kin9zyvYBoaGnDKwb+QWIVQn0IiMsAvp3wwtgmrNCbD9zJ2luu278xoQ==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr25521882edk.201.1613564665261;
        Wed, 17 Feb 2021 04:24:25 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n17sm810314ejx.77.2021.02.17.04.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Feb 2021 04:24:24 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Issue with cec_register_adapter calling request_module() from an
 async context when called from intel_dp_detect
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <91b0f6c8-79ca-d04f-1ae0-66bf954dd421@redhat.com>
Date:   Wed, 17 Feb 2021 13:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

<resend with the linux-media list added to the Cc>

Hi Hans,

Fedora has a (opt-in) system to automatically collect backtraces from software
crashing on users systems.

This includes collecting kernel backtraces (including once triggered by
WARN macros) while looking a the top 10 of the most reported backtrace during the
last 2 weeks report from ABRT: https://retrace.fedoraproject.org/faf/problems/

I noticed the following backtrace:
https://retrace.fedoraproject.org/faf/problems/8150/
which has been reported 170000 times by Fedora users who have opted-in during the
last 14 days.

The issue here is that cec_register_adapter ends up calling request_module()
from an async context, triggering this warn in kernel/kmod.c __request_module():

        /*
         * We don't allow synchronous module loading from async.  Module
         * init may invoke async_synchronize_full() which will end up
         * waiting for this task which already is waiting for the module
         * loading to complete, leading to a deadlock.
         */
        WARN_ON_ONCE(wait && current_is_async());

The call-path leading to this goes like this:

 ? kvasprintf+0x6d/0xa0
 ? kobject_set_name_vargs+0x6f/0x90
 rc_map_get+0x30/0x60
 rc_register_device+0x108/0x510
 cec_register_adapter+0x5c/0x280 [cec]
 drm_dp_cec_set_edid+0x11e/0x178 [drm_kms_helper]
 intel_dp_set_edid+0x8d/0xc0 [i915]
 intel_dp_detect+0x188/0x5c0 [i915]
 drm_helper_probe_single_connector_modes+0xc2/0x6d0 [drm_kms_helper]
 ? krealloc+0x7b/0xb0
 drm_client_modeset_probe+0x25b/0x1320 [drm]
 ? kfree+0x1ea/0x200
 ? sched_clock+0x5/0x10
 ? sched_clock_cpu+0xc/0xa0
 __drm_fb_helper_initial_config_and_unlock+0x37/0x470 [drm_kms_helper]
 ? _cond_resched+0x16/0x40
 intel_fbdev_initial_config+0x14/0x30 [i915]
 async_run_entry_fn+0x39/0x160

So 2 questions:

1. Can we get this fixed please ?
   Related to this, what happens if we make this an async modprobe
   (when running from async context) is that a problem, or is it fine
   if the rc_map module gets loaded later ?

2. If the answer to 1. is "tricky", "maybe" or some such then can we
look into a workaround here ? E.g. do we know in advance which module
is going to be requested (1), or does that depend on the EDID data ?

Regards,

Hans


1) And can we thus do tricks with a softdep on it ?

