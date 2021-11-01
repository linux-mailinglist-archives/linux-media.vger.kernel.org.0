Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C70744163D
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 10:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhKAJXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 05:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbhKAJWj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 05:22:39 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEFCC06120A;
        Mon,  1 Nov 2021 02:19:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 205so28308892ljf.9;
        Mon, 01 Nov 2021 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=omsuco/GDjU8Uw354veydtpi80x8BoUPArMGHXMwgns=;
        b=eQxsS1nZPpKfBSRdoInfpmAvTA87XoF8w70ievMYBiEoshjHrj1nUzpuFRSDjFKzwz
         51B/Txkk8lNSQSISjCjzio+PFZsX66Nprd+Qh+H3v1liPbOfqL3MDJiwuwN7kBNFd0wg
         0YBetwjHpBM+ffDV3n6kWfDeg7IeuXbejfYBjOr1nCl+epwotheMgb6NkXWT7pS8gJNO
         6lVOE6z7h0/HTKXENXZL58XQgWlsE7D4M9Hyzg/zUgsErbhPs52xksbzafLwG0fwsSz7
         nwx76g3GkKf80fBDwufGEOYoKW3OtKAAOvB9lsHmwPxYk0GxgWeIM71BftQgbrgF2Dvv
         Dxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=omsuco/GDjU8Uw354veydtpi80x8BoUPArMGHXMwgns=;
        b=FukcS0iWhQRttJoizgzunDVuX4G1/QsXGu5B1Uz4XwFnCOkkAnz7LZYNXifqCyNQVC
         fM2h3U6MBiBdEeLnTYarwPWZsSleYKOwCMZVIC3hA/f30UsI8PyYIK/zQtmJkFWSS3Cr
         YzeTqIfCNPP11PkEhlQYD2yHCnRI4ZcfwalUzALAQeB9UZ+DRKTDnokPi6bnxghDoceI
         JMM7wd0enlycYkoseL98fhDrRhTuCpqwES7+cDpWIad76Eghsm4b2lJ3YO3rl6jiFCsS
         qdoPErfg7AipbW9sEi8bc4CAfVO+ubPNVgc3g4y9LC3bU5MrsF8CMfHl9kGybY1bsFUk
         fE9g==
X-Gm-Message-State: AOAM531EhQnIf+p9fG4ODrgsLztiVjlVn2HJzTwPfi0C/BfM7anKPiIo
        L4dBung6pznuTDTKAHhsngR54pWsTy7oCw==
X-Google-Smtp-Source: ABdhPJwDK6CNE8RL68kbEE62RucRI+I+d1hTcAJCbMvShvyv3+rnnGorNwIrBxEpVtowSy1qexCGQg==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr27014683ljj.499.1635758386373;
        Mon, 01 Nov 2021 02:19:46 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id b15sm1480092ljp.95.2021.11.01.02.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:19:46 -0700 (PDT)
Message-ID: <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
Date:   Mon, 1 Nov 2021 12:19:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
Content-Language: en-US
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
 <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/1/21 11:55, Dongliang Mu wrote:

>>
>>
>> Looks like missing clean up on error handling path.
>>
>> ->probe()
>>      em28xx_init_dev()
>>        em28xx_media_device_init() <- dev->media_dev allocated
>>        *error somewhere in em28xx_init_dev()*
>>
> 
> Hi Pavel,
> 
> you're right. In some error handling code (em28xx_audio_setup fails),
> em28xx_init_dev fails to deallocated the media_dev field.
> 

Hi, Dongliang,

Did patch attached to my previous email pass syzbot's reproducer test? 
Unfortunately, I am not able to test rn :(




With regards,
Pavel Skripkin
