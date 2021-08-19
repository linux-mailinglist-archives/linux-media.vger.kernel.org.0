Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7337F3F1639
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 11:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237086AbhHSJcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 05:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhHSJcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 05:32:15 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7A7C061575;
        Thu, 19 Aug 2021 02:31:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k5so11498354lfu.4;
        Thu, 19 Aug 2021 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7E4XK/pyvKGm5VQwd7JG0gyZWpWLDZvtzVPwABZJCIs=;
        b=t4rs7bq+PLF3d/NjGO/H8jkBiLnvRhusMVSaM3TjBSwtkI+RieuQCm9XKFWGBh88yS
         x5/L7fNVmFd89zlqmI0UosrT/PkKdPNybkPqIILKeqOvpEphI7QFzMt5YvV5L1T6B33C
         +ezc2MMyeuEuNszdXYap1LbS1UXTqer8J0Efx6tUkQipNED4GiCyXTON85L2liKJghQE
         5W7i2CZPXPw3P4Bm4EUBT7zoQ7CzWIFV02ZhL3SCqsw7zAqx6+/F+CybK/mPMiVBZCu4
         mzdWqSW46t76u3hP0loYgYOn8h+q++itgJItDLOt2gifmW8D9pXeVHDn0z4SnIwau0pH
         Bg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7E4XK/pyvKGm5VQwd7JG0gyZWpWLDZvtzVPwABZJCIs=;
        b=ivDu2p9yRm+YnimqBaYfXoucJY8qxlNVsMidl4CWzRyeD4lo2oYRyl1R+88rhzsSs2
         E3+gVq5L4+Oo5FCG93iEORYsjCoPWNwt9uCD34G9eGtjDFU62wLxH/40U4Y9FP+IqhZH
         7DjDq2UERfB23oQgj3hrQEwnJARNSUOejJbMPd/fCZubcHe5r/AVPZHUddct3tmU6OA+
         iiM7lJRyd8auaF+uiM+Bl7E/C2PEQDjHOex0yZXwEg5KnYBT+wRaRi1lBtRkTQBT9Tre
         ztbOEXySibOW9JOJsSEGIn26xYhc3xD1HQ6epyxQIugRABqCbm/3RXHYfpc8/DtJZAh6
         LwPw==
X-Gm-Message-State: AOAM531bvXqnj42K+XyACVmwU4r9Afm81a+Mbf4e+QqrF8enzTDlrItj
        JsgtxjK4GS28TihjLgMipU4=
X-Google-Smtp-Source: ABdhPJxosNNjl/Pu0Vo0C5nf8MGIE28HhfDMseNjios0/ACDhUPF79vjI+q7dHoGXvsBwCeYErYkXQ==
X-Received: by 2002:a05:6512:3487:: with SMTP id v7mr9763988lfr.302.1629365497464;
        Thu, 19 Aug 2021 02:31:37 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id u12sm249811lfo.86.2021.08.19.02.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 02:31:37 -0700 (PDT)
Subject: Re: [PATCH] media: mxl111sf: change mutex_init() location
To:     Sean Young <sean@mess.org>
Cc:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
References: <20210730213829.2909-1-paskripkin@gmail.com>
 <20210815083755.GA1827@gofer.mess.org>
 <7ee99788-d9a5-0a38-ed02-51d9b42ebc11@gmail.com>
 <80648833-5f5a-0811-a281-0dba87938d3c@gmail.com>
 <20210819092908.GA27679@gofer.mess.org>
From:   Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <c084ddbd-04ee-9033-5ec9-9d13cab05311@gmail.com>
Date:   Thu, 19 Aug 2021 12:31:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210819092908.GA27679@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/21 12:29 PM, Sean Young wrote:
> On Sun, Aug 15, 2021 at 12:06:16PM +0300, Pavel Skripkin wrote:
>> On 8/15/21 11:49 AM, Pavel Skripkin wrote:
>> > On 8/15/21 11:37 AM, Sean Young wrote:
>> > > On Sat, Jul 31, 2021 at 12:38:29AM +0300, Pavel Skripkin wrote:
>> > > > Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
>> > > > mutex. The problem was in wrong mutex_init() location.
>> > > > 
>> > > > Previous mutex_init(&state->msg_lock) call was in ->init() function, but
>> > > > dvb_usbv2_init() has this order of calls:
>> > > > 
>> > > > 	dvb_usbv2_init()
>> > > > 	  dvb_usbv2_adapter_init()
>> > > > 	    dvb_usbv2_adapter_frontend_init()
>> > > > 	      props->frontend_attach()
>> > > > 
>> > > > 	  props->init()
>> > > > 
>> > > > Since mxl111sf_frontend_attach_atsc_mh() calls mxl111sf_ctrl_msg()
>> > > > internally we need to initialize state->msg_lock in it to make lockdep
>> > > > happy.
>> > > 
>> > > What about the other frontends like mxl111sf_frontend_attach_dvbt? They
>> > > no longer initialize the mutex.
>> > > 
>> > Good point. I see, that all other frontends also call
>> > mxl111sf_ctrl_msg() inside ->frontend_attach() call.
>> > 
>> > I think, that fixing dvb-usb core is not good idea, so, I will add
>> > mutex_init() call inside all frontends, which use mxl111sf_init().
>> > 
>> > What do you think about it?
>> > 
>> > 
>> 
>> 
>> Something like this should work. Helper is just to not copy-paste code
>> parts. Build tested against v5.14-rc5
> 
> How about creating a dvb_usb_device_properties probe function and
> initializing the mutex init there?
> 
> 

Sounds reasonable. Will do it in v2, thank you!



With regards,
Pavel Skripkin
