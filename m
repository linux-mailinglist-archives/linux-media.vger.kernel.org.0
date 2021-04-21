Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD34366ECC
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 17:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243835AbhDUPKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 11:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243925AbhDUPJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 11:09:11 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3089C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 08:08:37 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g8so67402181lfv.12
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yU9qan4gkiNlAA8DevJSM8M5vX6K1Fxe1UmEnDRQ4eY=;
        b=Cp6clZrPVD7pgez08TByK9BJGYmFd5nfos5xMRxXSt9+iuJv5MXQwzr+LGvxFXnndl
         RFQRPYEdUHRF8QTJbPI2Eg/2xWGdgYCDR1axCb/iWfMsSyV4V/nVJec8WphXHyeeIFp4
         JrA+gQulOE8Hw1+zZfNHTKmwTafnggAYG7/mN9yXL9GBbbCXh/wZC9xplcOoM9B0D5iY
         8JwRoIPY0s9fcV1qeDMY+7Q8BUTSolR7jXf2CsGPekacHhxsLSuewoJikvK2WVQaxsoI
         M3v9BHL2B37cWNLdxRjZ8aJi+6xWYR+wbQjlsm124JnhTjeUySBWHyQfaZvzxKBvOCbw
         nCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yU9qan4gkiNlAA8DevJSM8M5vX6K1Fxe1UmEnDRQ4eY=;
        b=XGVeouIKJQQoKNOvZV7XUaAqkr20/bLnihCaUVDZ7KDKibU087hu9kwjc0Pod1Q29T
         /CV5pvwHVhH0ppbwsDY5Ftad7GdM6O7RqnkOe092/CyhRZlZUkBt45kxmY9XxAI5OK3I
         2lojWgtfxZKOWLOE1xmRRK4z16NpYEHB5SbdLVQGagg4GUNyehJh8Rzuj4LszegMubz9
         DhY7+DUtOEPBxBYlD4+XcW+xjpUMEeHPIxfmMDTsvFvwWaCINd9nx7noTv3GqpEEkgsy
         xhWnoPLs9jA8hZVrg9RJjzXrN4fnoNmg7U63/ZglTgE1B/17yY8riT4Ttuef1QBDpf/e
         k+Cg==
X-Gm-Message-State: AOAM531bMSK5o04BFn8Altxz+qBnQI2RnHkzz97j/CSj8NbK9GmUMXPN
        uJwVXeTXHgxo7ZN5q1/2AsDrst+EkXrlxg==
X-Google-Smtp-Source: ABdhPJy+x1M9zpCgkhO0A9rH3Q7zB2qQ9GtTRuDV9W3ouxtO2bN8NSFAGBI/lypt5vlZcS/kVhybuQ==
X-Received: by 2002:ac2:5d66:: with SMTP id h6mr20536144lft.359.1619017716373;
        Wed, 21 Apr 2021 08:08:36 -0700 (PDT)
Received: from [192.168.0.69] (cm-84.211.29.145.getinternet.no. [84.211.29.145])
        by smtp.googlemail.com with ESMTPSA id f8sm238983ljn.1.2021.04.21.08.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 08:08:35 -0700 (PDT)
Subject: Re: [PATCH v2] media: ccs: Fix the op_pll_multiplier address
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
References: <20210414162453.22868-1-be.wimm@gmail.com>
 <20210421123020.GJ3@valkosipuli.retiisi.eu>
From:   Bernhard Wimmer <be.wimm@gmail.com>
Message-ID: <1bacf8f5-cf36-aa12-bc08-b797558ce92f@gmail.com>
Date:   Wed, 21 Apr 2021 17:08:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421123020.GJ3@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 21/04/2021 14:30, Sakari Ailus wrote:
> Hi Bernhard,
> 
> Thanks for the patch.
> 
> On Wed, Apr 14, 2021 at 06:24:53PM +0200, Bernhard Wimmer wrote:
>> According to the CCS spec the op_pll_multiplier address is 0x030e,
>> not 0x031e.
>>
>> Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>
> 
> I missed last time that the register file and the driver were merged at a
> different time and the driver fix needs to be backported to the stable
> tree. Could you split the patch into two, i.e. one that has the changes
> under Documentation and another one in drivers?
> 
> I can do that too, just let me know.

I'm not entirely sure what tags or commits these patches should apply
to, so it's probably faster if you do it.

Alternatively if you can point me in the right direction then I'm happy
to do it (hopefully without too much spam on the mailing list).

> 
> Thanks.
> 
