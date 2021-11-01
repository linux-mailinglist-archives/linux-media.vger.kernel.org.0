Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F31441976
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbhKAKJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhKAKJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:09:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D991FC07B071;
        Mon,  1 Nov 2021 02:43:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id k24so9049050ljg.3;
        Mon, 01 Nov 2021 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/sAaTCsGEvX971H9PZ+79ejrTrHZcLZymIeiO6p1VXA=;
        b=lJ0bJxp7WNtyStPLrWYIwUwv1Ed0NEWOutm7Sw+Z1z9y1RH5Ub79O+tu1FCMD8sPs3
         C0smZkIvPtnWFkY6BeYSjBTMPNA2GyRq3LyGuC8ebWPNRHW3o+qh5hgB82uu6/9zOBkk
         XdeAl0e7ob9pufMR3suXBcdugXRs1I3PlU9sHVyeu4Qv/VZA9/2rY3Wdr3qK5HkIxpyo
         mJjUZAvOzKyqS5stxGAeANg97zNmC1EJZfg3XqjDa0SHPdinfZ/2CBXyZTdLoFjK/6Qn
         XSB3Ga7a023CFVr3e0Vc+J6Bml5Bh//PO+mjtWE+IbVJ5mCnPFV15osjol4NwMyaNx5H
         kUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/sAaTCsGEvX971H9PZ+79ejrTrHZcLZymIeiO6p1VXA=;
        b=C+BDrPIz11bdDnOTBZucjy51NUTcqv4fuPBRNVygy8/P7GXvoG/GCjFrlVVN68+FJj
         pZneERyOhOlvonRpbCv0ZBzxGIJyxlmabwhGZF1XaYik+OfM43dOBmecqNIX3Sf1ApTP
         WA4Jp9f2QrTa37L84j1+lpytAvHvzu/bCoGbWUA/rb0/LT8ITTHs9wR0uDVSCuqB5/wo
         SyF/dRLc1X+Q+wPDkGK+xKzszS+ZH1+0ekpgcalvPqfUILCI3kY5jpp7+2T0QdPWe91b
         pRRI5FD5vH/RHRkni5UuzPqT4yNNc/mSzMKc/4mKBSDzWAhefjYXFLXLic3kM3jIE1CM
         zd6Q==
X-Gm-Message-State: AOAM533A4JyqBv3e+FiWpGwrSs2ftZc2cxMR4bpq92c66QbP++MD1aIt
        VDJYWk9Ql9o1j282DZsx/YcGNDPbLh9Kpw==
X-Google-Smtp-Source: ABdhPJxouib5kBa62gnK7ZA4iyJRHHuIlAeP7eh9jIzlBPu8TPxpoMlFicnesFFywK+L784q6RLkxw==
X-Received: by 2002:a2e:9108:: with SMTP id m8mr30732185ljg.216.1635759823272;
        Mon, 01 Nov 2021 02:43:43 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id d15sm1336490lfs.210.2021.11.01.02.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:43:42 -0700 (PDT)
Message-ID: <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
Date:   Mon, 1 Nov 2021 12:43:42 +0300
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
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
 <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/1/21 12:41, Dongliang Mu wrote:
>> Hi, Dongliang,
>>
>> Did patch attached to my previous email pass syzbot's reproducer test?
>> Unfortunately, I am not able to test rn :(
> 
> Yes, it works. The memory leak does not occur anymore.
> 
> But I am crafting another patch based on yours as there is a small
> issue in the retval and I would like to make the error handling code
> uniform.
> 

Cool! Thank you for confirmation.


With regards,
Pavel Skripkin
