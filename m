Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB7C136222
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 22:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgAIVAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 16:00:10 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39506 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgAIVAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 16:00:07 -0500
Received: by mail-qt1-f194.google.com with SMTP id e5so26504qtm.6;
        Thu, 09 Jan 2020 13:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/xvwQqyQ8+yjxyHa9VfJyTVc4pgN9X8nV0LcNR2KOME=;
        b=lbHHztI+gTzCiiH8w8iP08KLZlSVeeFrQZMly1jmHiP0HPEWRqKm2hfaUIZaT70LoR
         tnCYplz6vLjg6KEHsyJNt7sm5jZNDcClop4aJ1GdJ4COYJ3rhcr9MgnxPeVJzeCGUmpr
         PW1oETjR1AUvC8E+wbI+EZ0FPi5xDrP71uQtbpv4CXRXsHlNkZ4E+8j7gKhmQ2wk5iQi
         Xve+KAXZDKnnXqCSXBrNUncsab1O08JmRXc0hFrXNRPuosZLwAx3xGQ60DppbMYlKMui
         r8RpT5NOzorzFWJLTq/FRnOesDoGprakDDxgW87fWhfUQBhgOOYxck/79iYDhaX4Y039
         LYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/xvwQqyQ8+yjxyHa9VfJyTVc4pgN9X8nV0LcNR2KOME=;
        b=n3P0GDDZq7ZT/T9sObCm0uvGjot/02prIVRpfOdwmXVg9rYlQhML0qFjqIDKTGXWPg
         Ce6yKuWYHInkt6a10Pj4HggAKJdn3StHyKkTBLFBMrfkJDp/7wEkbVnEpFCJu1gAU6b1
         OupRibM+hlMa0Wcg5HrW1ZTeOVgrEYNcUlaCjtkKhz29sAkzKyDtLwmRl8RcJPhMk9e3
         yAqh06SyrAr2reth1LhGNQJnkfi0MZBRe1Ii6DK3K2tKELr+867Acm3hDibNm55tAJ9D
         zPil1rrwBov4WQjFSnT8sTz9rNsZ0WI5UNYP60UJCzwBameqBEGQvYS3sDtkImLmrmr0
         DlwQ==
X-Gm-Message-State: APjAAAUUSkOkf6jh4f8N5Jd5lqvZX0GOrwnJYzfAs3sdyGnyB6CCuebl
        rSbxZcvXQ3ap1JTjoRlguUA=
X-Google-Smtp-Source: APXvYqyRivoNnTw9ttnfJ8D2CRVbI5k/cuprBtIEQdwYCHvNWdSxL5IOXINmsdB826L+plB+Yk94FQ==
X-Received: by 2002:ac8:7b24:: with SMTP id l4mr9659546qtu.3.1578603606042;
        Thu, 09 Jan 2020 13:00:06 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id w21sm4112241qth.17.2020.01.09.13.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 13:00:05 -0800 (PST)
Subject: Re: [PATCH 1/1] media: dvb_dummy_tuner: implement driver skeleton
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
 <5f296977-6aac-cfd9-9082-ff824f85ab43@linuxfoundation.org>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <ebec2bb5-8db0-76fe-9c66-0316c1800f7c@gmail.com>
Date:   Thu, 9 Jan 2020 18:00:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5f296977-6aac-cfd9-9082-ff824f85ab43@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah, thank you for you input!


>
> Looks like there is more code to be added to register/unregister 

Just to be clear, attach() is missing, but register / unregister belong 
in the bridge driver. Is this correct?


>
> Please add more detail here on what this driver does. What this
> driver is used for and so on.
>
>
> Samehere. Give more details on what this driver does. Add enough detail
> to help users decide why they should enable it or not. 
>
> General practice is the following.
>
> Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

> Please add details about the driver similar to the .c file. 

OK.


Thanks

- Daniel


