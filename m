Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9760510A443
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 20:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKZTAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 14:00:51 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:41040 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfKZTAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 14:00:51 -0500
Received: by mail-io1-f66.google.com with SMTP id z26so18310811iot.8
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aoAPBOreT/JVspRqD7alivzy2zhFPWfUGYCAJ1RTC+4=;
        b=FfVfpqfIzGDu1Ynk8c5ZqsUWJ2qQxXXJX+A4PTAJ5/ey4++Wv7u393mfX0LcitMrU5
         RJvVP7Dj7ADuRf0io/3ncZGp4m+aDuwU0TTkalCfIr3Wkkb3sHtbw2KXc+w16WF3w+GP
         BvCkSmim5olSNZsJEv4ioae1r1KCf7CVhyihM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aoAPBOreT/JVspRqD7alivzy2zhFPWfUGYCAJ1RTC+4=;
        b=AiHo2j2P0mMT+PfNX3sN9CTv3wNEFi1wX8A+fD5A27VR80MRaSCFb4Sl1+3XhlE+dF
         W1Q0PwlAIB58TXEaqy1n3E92hVydCTqejp71+eBKhBN6w3Q8+ci4P0uTQHmoNn+hS56t
         7nk1bXfmP2TbS/BdygrePsL/oPNDMwgfspUt8YWZE3iI45SmAyHprKs0BnY619UexKE4
         vAdHEt46UGHXAVhmDxwAWZmakO15oEPl78Nna6bYbdKVs/iWqko/rPlAemR+lmump9XM
         XLnVPyAAZPoJI6ThfJJ2YsjUk+OKlz4M7h1pOxhOVwW5n+R1DuwJedP9a/LN5FwZZSzV
         v9kA==
X-Gm-Message-State: APjAAAWJg/QR6PseCYdSrtcm7hk4JPgDLnyBdnGZCXjURJ0eTiCVwli9
        s4y3mvUNGQc8CoGMvfFxPeaA8A==
X-Google-Smtp-Source: APXvYqwT0/dnGF0OPx4X4RCxk9RfeT7BcRS+13y1DqoUypCbTchKvtXw8Uebh/YtKhiBnet69ZhUDw==
X-Received: by 2002:a05:6638:626:: with SMTP id h6mr76560jar.113.1574794850192;
        Tue, 26 Nov 2019 11:00:50 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w1sm3403238ilq.62.2019.11.26.11.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Nov 2019 11:00:49 -0800 (PST)
Subject: Re: [PATCH v3 0/3] media: vimc: release vimc in release cb of
 v4l2_device
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <54fed414-e55f-b955-0a03-6305d1245d35@linuxfoundation.org>
Date:   Tue, 26 Nov 2019 12:00:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/26/19 5:08 AM, Dafna Hirschfeld wrote:
> This patchset solves a crash that happens when unbinding the vimc
> device while it is streaming. Currently when the device is unbounded
> the vimc entities are released imidiettaly, this cause a crash
> if the streaming thread or the capture device dereference them
> after the release. The patchset solves this by deferring the release
> to the release callback of v4l2_device. This ensures that
> the vimc entities will be released after the last fh is closed
> and so the streaming terminates before.
> 
> - The first patch replaces the usage of vimc_device.pdev.dev
> with vimc.mdev.dev
> - The second patch allocates the vimc_device dynamically.
> This is needed since the release of the device is deferred
> and might run after the device is initialized again.
> - The third patch moves the release of the vimc_device
> and all the vimc entities to the release callback of
> v4l2_device.
> 
> Changes from v2:
> in patch 3, in case of failure in the probe function the memory is released
> directly from the probe function, and only on success path the release callback
> of v4l2_device is assigned
> 

You might be able to fix the streaming crash with this change,
however, I don't think this will work in all cases.

Please test these changes with tools/testing/selftests/media_tests

I am curious what happens when you bind/unbind the driver while
running media ioctls e.g: MEDIA_IOC_DEVICE_INFO.

thanks,
-- Shuah
