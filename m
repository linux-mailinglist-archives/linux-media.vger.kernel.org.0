Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9237F481861
	for <lists+linux-media@lfdr.de>; Thu, 30 Dec 2021 03:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhL3CJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 21:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbhL3CJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 21:09:09 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E018CC061574;
        Wed, 29 Dec 2021 18:09:08 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id b22so20116536pfb.5;
        Wed, 29 Dec 2021 18:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TZVzcidko6K+Lqc1iyE1FztY+DsnJya+2TnQVmPDI1k=;
        b=O9F1r1jyp7Di1qO8KYiq0YCx50QjEkUfHxjkM6Cg+KWCYrQoQjghGMRc3xBZ4vsaFi
         gx4P67fjs5b0k6DFTCUQmeNvyaqf9H0uiFiLM6Yioxy8VI1Xun8ajTBygcom57pF7zAe
         tZW+sTRWROw0zZ+cY81f+NwzNYl861zUiUkQtZQ9KmYOnJHn+Q4bvPXkWHX/TDj5xpxu
         m9bz0uF7spU9oymshoQkD0bEzRN/7mjKf5qLL1FNN+EphP9tomYWG4uJkyt0XhAPD43Z
         Zp1ncEPMAQrqOXxp74ymM6ZQg+oxSPPr01K5p87Q4edgu+nRRKAQUxRPkQj1PhKJ8Jb0
         z8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TZVzcidko6K+Lqc1iyE1FztY+DsnJya+2TnQVmPDI1k=;
        b=Wa1j0wYvdpzCRDH+rXZwyIwnt8Rf5r1iBOlD8uCGjwaGy0nSavL9ynau5j8j4vyfl9
         eU312eSuQpEiJRLDSFRgpDLs6y/BRofd0w2Ww+roMKb3A5uGXSHokDZn28WiGv33VzcS
         lVDrS2Hf2c9JZ34AMrbHUofIpBtZg/YXjpVEfXxep4jMmN0kkShVgILQ758id0x1dLOR
         412jVvD54rwBNENQcdPuhnzSxj6UB3UhwlWsYJ7TIP9JAPufuvxH8TlokfQ58Ev3DHaq
         Jsw6n/xEQxLXEOrNXhA24+aznyslhHZCC8kbMrHuqh42rNjclOCfSlta6Sne5+3mcHZ9
         nXzw==
X-Gm-Message-State: AOAM530Pq8Q4opm/XwwaxJwa/lP4kQmlLQwytF4iy5r0f+fwUu+ejAPA
        6peiRkmmQTQ5lmja1kuYEAY=
X-Google-Smtp-Source: ABdhPJxE0RaNqd69wnGr8aec/CeZL0bHXEmwwQ7DetbTWGuTkfobAzWhBjfvu2c5nY+BIf3ZMjBNfg==
X-Received: by 2002:a63:804a:: with SMTP id j71mr25581661pgd.72.1640830148396;
        Wed, 29 Dec 2021 18:09:08 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d17sm26225848pfv.48.2021.12.29.18.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 18:09:08 -0800 (PST)
Subject: Re: Status of selection.svg update (was Re: [PATCH 0/3] docs:
 sphinx/kfigure.py: Improve conversion to PDF)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <de8def13-efbc-1d98-acb5-5cc1f6902e4b@gmail.com>
 <20211212113813.058e99fc@coco.lan>
 <8840a859-ca57-c49a-f542-0a37401ccdfc@gmail.com>
 <20211213073327.11191087@coco.lan>
 <60d50d23-e236-1105-dc2c-d6daca70e326@gmail.com>
 <e135a1fd-78df-d676-6678-9637a12ca8ec@gmail.com>
 <20211229231424.365d9d4a@coco.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c5d5ad98-1b4e-3d55-cb20-2f33441eec14@gmail.com>
Date:   Thu, 30 Dec 2021 11:09:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211229231424.365d9d4a@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 Dec 2021 23:14:24 +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 29 Dec 2021 21:54:47 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> [+Cc: linux-media, -Cc: lkml]
>>
>> Hi Mauro,
>>
>> In case you are wondering what is going on in the update of
>> selection.svg, here is a status report.
>>
>> On Mon, 13 Dec 2021 16:53:07 +0900, Akira Yokosawa wrote:
>>> On Mon, 13 Dec 2021 07:33:27 +0100, Mauro Carvalho Chehab wrote:  
>> [...]
>>>> No matter if this is merged or not, if you find an issue at the images
>>>> at the media docs, please send them to linux-media@vger.org.  
>>>
>>> OK. I'll compose a proper change log for it and post it later this
>>> week or next.
>>> (I'm not a type of person who is good at doing several things in
>>> parallel.)  
>>
>> I started the patch preparation, but I found the patch would be
>> quite large in size (~500kB).
>>
>> This is because current selection.svg consists of pretty high-
>> resolution raster images.
> 
> No, it is not a raster image. That's why it scales so well.

Ah, I was confused by the behavior of Inkscape.
Looking at the SVG source, which I am not that familiar with, it
has a ton of very long <path ...> objects.

I must have been more careful.

Sorry for the false blaming...  :-/

> Btw, the basis for this image is on this commit:
> 
>     commit 8032b526d1a3bd91ad633dd3a3b5fdbc47ad54f1
>     Author: Rusty Russell <rusty@rustcorp.com.au>
>     Date:   Mon Mar 16 09:05:07 2009 +1030
> 
>     linux.conf.au 2009: Tuz

So this logo.svg has the same issue when displayed in a browser.
I'm wondering if you could ask Rusty for some advice on this issue.

> 
>> I see you had done several attempts to reduce the complexity of
>> the SVG, but it is still large (> 200kB) 
> 
> One of the reasons why it is big is that the same vector image is added
> there twice: the original one on the left, plus a second copy of it that
> is scaled and has a clip group that hides the elements of it that aren't
> visible at the image on the right.
> 
>> and conversion to PDF by
>> convert(1) generates a PDF of more than 1MB!
>> Even inkscape(1) generates a larger PDF (>1.3MB) with embedded
>> raster images.
> 
> It doesn't matter the size of the output, provided that the image is
> properly displayed on pdf and html.

Well, I have noticed sluggish behavior of both browsers and PDF
viewers when this figure is displayed.  Not a big deal, though.

> 
>> I don't believe what the figure wants to explain deserves such
>> a large size.
>> So, from my POV, adding another bitmap image to the SVG for the
>> sake of browser compatibility is *not* the right thing to do.
> 
> I actually used a Tux-based svg image as basis because:
> 
> 1. Tux (or Tuz, in this case) is well-known Linux image;
> 2. It is a nice image;
> 3. It was committed by another Kernel developer that already
>    took care on having it properly licensed;
> 4. As this was merged to the Kernel already, it is under GPLv2.
> 5. It scales well on both html and pdf.
> 
> It could have used any other image, or I could have drawn a
> random image, but, as I'm not good on drawing things and finding
> something that won't cause a potential licensing and/or trade mark
> headache could be tricky, I opted to use an already-merged Linux
> image as basis.
> 
>> Instead, my suggestion would be to get rid of the embedded raster
>> images and to draw some simple vector-graphics-based figure
>> instead.
> 
> There were another image before selection.svg that used a simple
> figure, but the cropped version didn't represent too well (IMHO).
> That's why I opted to use a real figure, where you can see the
> details of the image at the crop region.
> 
> I wouldn't mind replacing it with something else, but it should
> be something that it won't cause licensing issues and will still
> properly represent what selection does: crop, compose and scale.

So I have no strong opinion WRT the figure.
I'm not going to post any updates for selection.svg.

        Thanks, Akira

> 
>> Am I missing something here?
>>
>>         Thanks, Akira
>>
>>>
>>> And the most easy fix is to install Inkscape on your system for
>>> the daily build.
>>> Then, convert(1) picks inkscape(1) for SVG rendering and you will
>>> see right ones (of raster images, though).
>>>
>>> You know, ImageMagick prefers inkscape over rsvg-convert.
>>> I think it is the right thing to do in kfigure.py as well.
>>>   
>> [...]
> 
> 
> 
> Thanks,
> Mauro
> 
