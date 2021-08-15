Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E083EC82E
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 10:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236717AbhHOIuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 04:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbhHOIuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 04:50:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400D2C061764;
        Sun, 15 Aug 2021 01:49:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so28371798lfu.5;
        Sun, 15 Aug 2021 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N9F061E103kzIB2bNqHdTfx672Vo2UjZty49a/4DJ+w=;
        b=OhHaAV9O+FHFRjcYeAaP+svuQawi9NmDbJrnB42D893+TC3jfIhEhsGp3LypOIj25N
         6qFOa+ganVg9wUolLUURshmKPMhuxozf/7QgdxXd8LbO/9ti8HxodkC9XJBDisOcObm5
         B7z82DZ6Ol4/m9O/Ipj/1WB9rvJbtwyn5yXIZ6dLbaGt7yYIa8B0ybkgmYFmi3jWX3j4
         7ybKvPsbftc7JABSrCwlv9G3J4qEW5hv0Tw5+rhar8uL4Zii9gTR8l5C/udxnzr2+g/4
         +DPa08VkTSL7yQRDay5++uPxTfmBlSm5od23vT1uEFv8RkAZDB796fNa9T+Y9YiU5zLL
         rJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N9F061E103kzIB2bNqHdTfx672Vo2UjZty49a/4DJ+w=;
        b=Nd5/P1Kk6RbLMxwFciWjCPS97s5emKuhbk6xQnncG6N12erSmE3yGX2jgmw2c3Hu16
         9reiKg0kVSESA2XAiXEuC23iLiCJX+/yGlDdX/U892GPr7R1Bh9iXepPoms971KrHSMg
         xnthgfcE42GehsU0Y7IOTwJJKnzRFDpOWWrhu6dn8Y6R6eQnfu+/RLqeaTur3PjjmY+E
         5z0TMyHHe0aHrO2ClAScAVgrrVZmV/SJqHJNmMk7UpG2nXv3+j9CDOD7pdGq5sEAhPYt
         BILxKJlMFm9dPSwnv4j46OyLkIYXZD8z4gfg49dozSd3gNx/QMMcuQYJZA2hV0x9dFba
         1oDw==
X-Gm-Message-State: AOAM532t/RjyqxUwsxO4MhoRZZzHPbdO2L6y5iCb2C/qDMXZW4jGUI7R
        YQKzbj0B0dnal6ly368a67Q=
X-Google-Smtp-Source: ABdhPJzQPUhgvswLIbgJZSq9C56IDi0X9Jz/n4DB4TI3eYFRJyA6ROtj4DrLmzqTg7TidjWcb6VMGQ==
X-Received: by 2002:ac2:5a0b:: with SMTP id q11mr7623433lfn.578.1629017370317;
        Sun, 15 Aug 2021 01:49:30 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.79])
        by smtp.gmail.com with ESMTPSA id x26sm618967lfu.206.2021.08.15.01.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 01:49:29 -0700 (PDT)
Subject: Re: [PATCH] media: mxl111sf: change mutex_init() location
To:     Sean Young <sean@mess.org>
Cc:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
References: <20210730213829.2909-1-paskripkin@gmail.com>
 <20210815083755.GA1827@gofer.mess.org>
From:   Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <7ee99788-d9a5-0a38-ed02-51d9b42ebc11@gmail.com>
Date:   Sun, 15 Aug 2021 11:49:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210815083755.GA1827@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/21 11:37 AM, Sean Young wrote:
> On Sat, Jul 31, 2021 at 12:38:29AM +0300, Pavel Skripkin wrote:
>> Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
>> mutex. The problem was in wrong mutex_init() location.
>> 
>> Previous mutex_init(&state->msg_lock) call was in ->init() function, but
>> dvb_usbv2_init() has this order of calls:
>> 
>> 	dvb_usbv2_init()
>> 	  dvb_usbv2_adapter_init()
>> 	    dvb_usbv2_adapter_frontend_init()
>> 	      props->frontend_attach()
>> 
>> 	  props->init()
>> 
>> Since mxl111sf_frontend_attach_atsc_mh() calls mxl111sf_ctrl_msg()
>> internally we need to initialize state->msg_lock in it to make lockdep
>> happy.
> 
> What about the other frontends like mxl111sf_frontend_attach_dvbt? They
> no longer initialize the mutex.
> 
Good point. I see, that all other frontends also call 
mxl111sf_ctrl_msg() inside ->frontend_attach() call.

I think, that fixing dvb-usb core is not good idea, so, I will add 
mutex_init() call inside all frontends, which use mxl111sf_init().

What do you think about it?


With regards,
Pavel Skripkin
