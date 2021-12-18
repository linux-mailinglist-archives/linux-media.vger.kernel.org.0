Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC338479CA5
	for <lists+linux-media@lfdr.de>; Sat, 18 Dec 2021 21:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbhLRUvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Dec 2021 15:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234004AbhLRUvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Dec 2021 15:51:23 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E15C061574
        for <linux-media@vger.kernel.org>; Sat, 18 Dec 2021 12:51:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b40so12275919lfv.10
        for <linux-media@vger.kernel.org>; Sat, 18 Dec 2021 12:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=642IAAbJx4NRRgrIWXRhy+dVTeyC+PQozaaX+0Pdd0Y=;
        b=GAmfAq7pDYHMtcPYIYI0P+ys4IRetGT2UdMD8zun6kGX7hTHGBS8Ql+LfA6ExakLis
         fS91aPFP/J31sFU1jLsUVsfMtf1OEV10QSKYnD1XQ3u8Co+xyt1kqZScuep7U5A+YEJt
         VuYjgmmFb8ycvvYDilqcEsBEG+XSoz40zDZx0ZQ5E2jTsw7fW6jf5cJGz5QX2LKi7VNM
         vNsG+UaAAKL1th0usskN41HfnhYExhp/iZmblCyf1hloiGiWFrUyPy5YJMQaNCDQGS1E
         kfoCC8OLnbHPDY+uvEvVFuXWHuH3dtoMr7Yg2Guo4ylK/RldbI2LWBA4HdMmNruCPeM2
         pOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=642IAAbJx4NRRgrIWXRhy+dVTeyC+PQozaaX+0Pdd0Y=;
        b=5odjp12n35+KQKZc9pD2UkuDVTgUnoKhlkF2zH4m6ehLTV6+UjsmW/JQp6HXnLHUKl
         oP+kfeweq6ckMgcQSFHHJLKEY3j4949lYYfVzs/U6tqVAObZuALlzPa8v5VkW96Y09S+
         yGmrjiVDY52cKCKbMXOKzI9wpyI96/D6AzVIRkD/9HrnPt3CECXSdSjmNuRTgXcHvxgT
         CcV4+0T6z9qn0pkOMC3S6XBDTqmEtEzGeCQBfthJKpDPgnAzEUJ4VkNlS91i5DA29fxa
         aINbCdTcP5R9CRz6Atu+9nfQeqjU6q87NmABYijteWuVw0QOSG5ddeIPW115LN4hz0Qd
         4gbA==
X-Gm-Message-State: AOAM532AIGWRPwaLklmDxgPKEqRgTDzq4sfauICZ7LlhmPb8PiKv7efO
        rw27BEYrNv1Qi4SeDW7VUnReovfiAa5zNQ==
X-Google-Smtp-Source: ABdhPJzJ/1FmuWNllfv/j6bHeAecXEOZwx/nNRImaPsVJPnHAk7M6i5J77f9NXGdm10Fvv2MJxo26A==
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr8790488lfb.118.1639860681033;
        Sat, 18 Dec 2021 12:51:21 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.239])
        by smtp.gmail.com with ESMTPSA id a24sm662628lff.207.2021.12.18.12.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 12:51:20 -0800 (PST)
Message-ID: <bcd3265f-9a63-ca40-bdf9-ef7bc671f5d1@gmail.com>
Date:   Sat, 18 Dec 2021 23:51:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
To:     Robert Schlabbach <Robert.Schlabbach@gmx.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <trinity-7eee9e9d-525d-4c2b-9346-53f362c89264-1639859596666@3c-app-gmx-bap71>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <trinity-7eee9e9d-525d-4c2b-9346-53f362c89264-1639859596666@3c-app-gmx-bap71>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/18/21 23:33, Robert Schlabbach wrote:
>> Such patch should actually be fixing a use-after-free on disconnect.
> 
> I wonder if it's the right thing to do, though, because if you look into the em28xx_close_extension() function in em28xx-core.c:
> 
> 		if (ops->fini) {
> 			if (dev->dev_next)
> 				ops->fini(dev->dev_next);
> 			ops->fini(dev);
> 		}
> 
> So doing this in em28xx_cards.c:
> 
> 	em28xx_close_extension(dev);
> 
> 	if (dev->dev_next) {
> 		em28xx_close_extension(dev->dev_next);
> 		em28xx_release_resources(dev->dev_next);
> 	}
> 
> will end up calling ops->fini() twice on dev->dev_next, no matter in which order you put the calls.
> 

I don't see any problem in calling ->fini() twice. I see only 4 ->fini() 
variants and of them have guards against double free.

I've checked out if there possible kref unbalance, but ->init() is also 
called 2 times: em28xx_register_extension() and em28xx_init_extension().


> So it looks prone to double-free, but at least em28xx_dvb_fini() in em28xx_dvb.c guards against that by NULLing the dev->dvb pointer after free and checking the pointer at entry.
> 
> Still, there are redundant calls here. I think a decision should be made whether dev->dev_next is taken care of in em28xx-core.c or in em28xx-cards.c, and the code then be made consistent accordingly.
> 

Agree. Some kind of refactoring should be done :)


With regards,
Pavel Skripkin
