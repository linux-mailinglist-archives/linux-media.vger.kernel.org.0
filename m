Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41382509B5
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 22:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgHXUBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 16:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgHXUBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 16:01:18 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273E7C061573;
        Mon, 24 Aug 2020 13:01:18 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i26so9208064edv.4;
        Mon, 24 Aug 2020 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C8lKf4ORmfqEPGg/u/S9g7wmze0cyqq99uKDJUmoY6g=;
        b=sxS3hCoqrdvLAzjdfIC3Q8aHGfsiccjZ3yuleXvJF78H8hcuJow6cb7aurAtd59Bni
         N042Cqv7KgPT+kfvm9k2B3r/1A7SEREtCarU4MNMBilQCerdh+pxWKRz3lQIkfcjZD/N
         jykow2vv7cUUdA92oQPqrRGhTVOfqKi+BJbIx1cqkrucrr+VFdlcwi1yhzeBXnl5odoU
         AGBW93GD2WV52VC8JXJlsbFSnIJ9hc5KNbX/F8v0EbYuC4lPRNz4zwcloS+iNcSBSNUh
         BpaZxm6Dx7ynVdu6B1CFGbfu6u9DAGLn9/F1mtterVW1bRL4OkJMq9U6n8CGMs/W73Q2
         m4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C8lKf4ORmfqEPGg/u/S9g7wmze0cyqq99uKDJUmoY6g=;
        b=YblAdF2HeoTyHJnWP1XdjpFwoCZmtww4A0/N2V6nFIngMwPCDL54ZZcCr0Btcj7DOY
         HmxvNnHJ9tJAsDs1vrIYpA4sBaL2g7wtQhz86pehQOM/XQOF3dnuDa9GW7wxuVzgXEDa
         fw/ggPKNjh1TTedNLndrdWfoZEk56Gn8CwjdDtk1lkxVMnhNBzkAhhQIjetcMHHpNu5F
         GLZAZc7rkli9lAGRBH8nIQvWYtJ2zEvYeg4MESEO2zowChnnmD6NwjvAZvvdwf/EAa7h
         08Mr8sI3mCnzSJlana2HbGI5O5IKgxes/mpfAuh5bFbQ+XU+cD0o6kLcDMAuXA+X9QIG
         LKOg==
X-Gm-Message-State: AOAM533c+FaqkNzAJdMOoIhkwitH753LoHNAWpfrCQ/v5VgThBqw9frn
        Trnz+rM6vtOKcNwdYmUPY1/LGyjimso=
X-Google-Smtp-Source: ABdhPJzxKx6i7dAfqTJsLy20vJypB4N5BuHtTeGENG25gH0Wti7clLH3SrAPkxHd2rd/1uFzO5BTgQ==
X-Received: by 2002:a50:8f44:: with SMTP id 62mr7338692edy.3.1598299274966;
        Mon, 24 Aug 2020 13:01:14 -0700 (PDT)
Received: from [192.168.43.227] ([148.252.128.110])
        by smtp.gmail.com with ESMTPSA id u10sm10295771edo.14.2020.08.24.13.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 13:01:14 -0700 (PDT)
Subject: Re: [likely PATCH] media: lmedm04: Fix misuse of comma
To:     Joe Perches <joe@perches.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <e6cd92faf09722fe729a7de03e7bde592f62499c.camel@perches.com>
From:   Malcolm Priestley <tvboxspy@gmail.com>
Message-ID: <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
Date:   Mon, 24 Aug 2020 21:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <e6cd92faf09722fe729a7de03e7bde592f62499c.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good catch the interrupt URB is not running because usb_submit_urb is tangled with it.

It only really affects signal strength.

add

Fixes: 15e1ce33182d ("[media] lmedm04: Fix usb_submit_urb BOGUS urb xfer, pipe 1 != type 3 in interrupt urb")
Cc: <stable@vger.kernel.org>

Regards


Malcolm
