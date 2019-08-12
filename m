Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8138A981
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 23:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfHLVjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 17:39:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50693 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfHLVjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 17:39:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so935802wml.0;
        Mon, 12 Aug 2019 14:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0Y60wYJikPFoyVE8po0R5xiNA7aHqFFqyU6s39ynbR4=;
        b=T/twmb6NbU+JyRmU+IjpUg7OUgarruldoKpvAJBRy+01o6M/4Q3t8OBcPypDnxaZEO
         0+61UIBOVzv8V0SwktWxNNky379+O5dEkRu/V8D7clbUnsAoGLi5UbOAZMz0lNGUaLWw
         S9Wcc6ocvjRrTfOIvpJdV61wjRVhCh3vdLw6Hg44t43xjiXq8ST4cocY9Zd6zMeMHW69
         WZzrQkmLRFZRer+DvZkBIgV2ec3V+T04soi3hXllC87N/SkZVTiyTglw5nOEjB5/2dby
         jOpHInCMb8YBv4q8s+UkfNGnVgysah7ZvECjWE8DpsX/N4bXUAl1EI4pEuedK+GomOsd
         1mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0Y60wYJikPFoyVE8po0R5xiNA7aHqFFqyU6s39ynbR4=;
        b=dBXfHg4uLfq73ob6D1ecjdPZ/xP6OeHgal/JLeChM+wqlkQgQpDBqs1R80OmQdBKZi
         HYI4rYroqmZknKd9Fbs7b1MIKtzkYdEvqNxqZGfgFlqD8Ficg72d/dxBtVloGpdAaDZe
         h7/EzogjpdsZzMKeZ+5jcAAcge3qzSo/p9SlUnLXxezI71STsyKDZgJfwzO5UiiQuzTJ
         sQZdiX25soX/DVyDSEU3wWzXi2unQGUbgOee6qP0iBFBsN0gUx/cH9Vi9O3L/NptQdDx
         1ihYDnidsiXhU2SuANNSQtsvuQ+ky+HpNzqgCTbPNhsH48hFtLkfEZeIjIq0hTBk+05c
         Nveg==
X-Gm-Message-State: APjAAAVF3zTKKaR/DUGMsSw9wvPulgB/D4Tgqb/5QNLYWkgbTWsqCL6S
        O7dWmNhXTJfLhWInCcLMRYyZGlLQ
X-Google-Smtp-Source: APXvYqzrlbXXDcWBccC/EfD9cUS7Vm50tycRKcl/Sy7qnHvkJmCIIkd8H4EFatBTGVXJPnD5vHwl2A==
X-Received: by 2002:a05:600c:254c:: with SMTP id e12mr1079932wma.168.1565645989596;
        Mon, 12 Aug 2019 14:39:49 -0700 (PDT)
Received: from [172.30.88.160] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id j20sm15557792wre.65.2019.08.12.14.39.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 14:39:48 -0700 (PDT)
Subject: Re: [PATCH] media: docs-rst: Clarify duration of LP-11 mode
To:     Ian Arkver <ian.arkver.dev@gmail.com>, linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190811173621.20454-1-slongerbeam@gmail.com>
 <3f31cde6-8faf-f9a0-626e-dc995260a640@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <2a84063e-b66f-bef2-1277-3514566aa236@gmail.com>
Date:   Mon, 12 Aug 2019 14:39:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3f31cde6-8faf-f9a0-626e-dc995260a640@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ian,

On 8/12/19 1:53 AM, Ian Arkver wrote:
> Hi Steve,
>
> On 11/08/2019 18:36, Steve Longerbeam wrote:
>> Add a sentence that makes it more clear when the CSI-2 transmitter
>> must, if possible, exit LP-11 mode. That is, maintain LP-11 mode
>> until stream on, at which point the transmitter activates the clock
>> lane and transition to HS mode.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   Documentation/media/kapi/csi2.rst | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/media/kapi/csi2.rst 
>> b/Documentation/media/kapi/csi2.rst
>> index a7e75e2eba85..6cd1d4b0df17 100644
>> --- a/Documentation/media/kapi/csi2.rst
>> +++ b/Documentation/media/kapi/csi2.rst
>> @@ -49,9 +49,13 @@ where
>>     The transmitter drivers must, if possible, configure the CSI-2
>>   transmitter to *LP-11 mode* whenever the transmitter is powered on but
>> -not active. Some transmitters do this automatically but some have to
>> -be explicitly programmed to do so, and some are unable to do so
>> -altogether due to hardware constraints.
>> +not active, and maintain *LP-11 mode* until stream on. Only until
>
> s/until/at/ perhaps?

Sure, that's a bit better language.

Steve

>
> Regards,
> Ian
>> +stream on should the transmitter activate the clock on the clock lane
>> +and transition to *HS mode*.
>> +
>> +Some transmitters do this automatically but some have to be explicitly
>> +programmed to do so, and some are unable to do so altogether due to
>> +hardware constraints.
>>     Stopping the transmitter
>>   ^^^^^^^^^^^^^^^^^^^^^^^^
>>

