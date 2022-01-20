Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5F8495504
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 20:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346987AbiATTmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 14:42:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346782AbiATTmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 14:42:54 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79A9C061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 11:42:53 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id br17so25652607lfb.6
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 11:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lIwAaV/sOiJskwZ8dAZjFcKyoRWiQLL8BKYqIJj5Q/M=;
        b=B6P+imJStArjlUjyghxrWxOrIwtqhypkrileqh4LhJWtKW7XoZ+pJhmgZ5fgZ+iU5H
         R4wH3YQKOjaMxhSXoEMRluk+KxSjLUttFgk/ty9TOvwptBz6PZAuvtuTpe3uDbyCwGci
         eqJALWGmB6Zh8fEzWY8WxFn97wu6SFoaVbkXoyVEl9dW5MEaZ6BfLNrPS6vrWlxJDIoK
         AaSuzOW2EBHris16YKkkGTcbIRCu3zT+pyObN2k+4HPdyrL5FzyOSTN4M9+bQiny8dTB
         i5rqWkDgX7hBglK5STYC6MvMfTRsIM/wFqwyBRY9sXqU3cVYpDzr6Ye38uULAU2olfua
         SEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lIwAaV/sOiJskwZ8dAZjFcKyoRWiQLL8BKYqIJj5Q/M=;
        b=2WACdeATTTuKgwibKRszLRR1wZcBBnDQn8fyomVpjDqfg47DT0E6/klPrcATTrqaIl
         z5ZYnuA+iYzqw1i0BtOtjGsiYePAjPoyJYKu1kUeaJcTkkMtnHXIYLp6XTaxttXkQRRU
         1vALgoHNvsSpCaj4JXLdIbhbW+PZXWa8eHSdpPcA2tXqqJMrVj/2yP8opRDVxmaNIubr
         IRFTiqgdG/1POC9P+JtCET1yMvfQrGReg0yuGuJyhSOOgudEfub0AdDBR84OfXLDO/5Z
         OSV0Ozm6OgC87tMJ6cBbwNLceHYd0Co05J+P1mAI2uKkw2bc3vwQfeMSgFF1tbKRpg+k
         HWRw==
X-Gm-Message-State: AOAM5322STGTQVPdHyxg8g92QlffMOx150uvhQGRAiDY5Gq+hafAAMqt
        oOBseEkCvEdUVJqoP5lvGcs=
X-Google-Smtp-Source: ABdhPJwo2Ril0461ZnOkT2YtoMWMnMb4D5vegeFcz/yXGD0vlA7HNY6XOYNSQ5iV/jCqwnAnCeV/KQ==
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr447619ljc.3.1642707772258;
        Thu, 20 Jan 2022 11:42:52 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id d22sm12548lfm.252.2022.01.20.11.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 11:42:51 -0800 (PST)
Message-ID: <aae2d8c3-a683-bdcd-ee72-c12f49083bd0@gmail.com>
Date:   Thu, 20 Jan 2022 22:42:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge WinTV
 dualHD
Content-Language: en-US
To:     =?UTF-8?Q?Maximilian_B=c3=b6hm?= <maximilian.boehm@elbmurf.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     hverkuil-cisco@xs4all.nl, sashal@kernel.org,
        linux-media@vger.kernel.org, Brad Love <brad@nextdimension.cc>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
 <45306193-deec-d1a3-d74d-41dc361b36d9@gmail.com>
 <e7c54b23-d163-ef33-3f62-c25b72e30aa8@elbmurf.de>
 <c6dcf627-047f-8726-0c4e-aa2a9ae12da9@gmail.com>
 <5c891c4a-7a02-18b7-c4c1-8429fcd3366f@elbmurf.de>
 <12440c22-9f69-740d-bcfd-3b6bf0e4dcc1@gmail.com>
 <23b3f65c-8f52-6109-d5ca-52ee12da6115@elbmurf.de>
 <afdd8f33-9d75-7e73-b7b6-a0363e316beb@gmail.com>
 <a0e25415-2db7-bea0-b00c-f1b4bf84d0d6@gmail.com>
 <a0ba3685-8c59-cb89-7f81-280c38a92c40@elbmurf.de>
From:   Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <a0ba3685-8c59-cb89-7f81-280c38a92c40@elbmurf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maximilian,

On 1/20/22 22:29, Maximilian Böhm wrote:
> Hey Pavel,
> 
> I would prefer reverting your use-after-free change. I’m still on Linux 5.15.2 to avoid this issue. I’m not sure if I understand your last mails correctly, did you already revert the change or did you just offer to do it? Anyway, reverting locally wouldn’t be feasible long-term.
> If I could help eliminating this bug, I would gladly offer my system for a remote hacking session via ssh or Teamviewer or try other patch ideas.
> 

Since I don't have enough time to look into this, I've just sent a 
revert. I've looked couple of times at the code, but unfortunately 
solution didn't come up

You should be in CC list, can you also test and reply to patch with 
Tested-by: tag, which will indicate, that revert actually works for you

Thanks

> Btw, found this forum thread describing the same original problem (which is forcing me to use usbreset after standby) on Windows, so this probably is a bug in the tuner hardware, not in the Linux driver: https://www.dvbviewer.tv/forum/topic/63002-hauppauge-wintv-dualhd-stick-geht-oft-nicht-nach-standby/
> 
> If I were to submit an official "device quirk" for the Linux kernel, would it be affected of your use-after-free change too? Nobody knows, I guess?
> 




With regards,
Pavel Skripkin
