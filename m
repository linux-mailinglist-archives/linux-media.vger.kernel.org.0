Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2219D4812F0
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 13:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236590AbhL2Myv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 07:54:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236046AbhL2Myv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 07:54:51 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C049C061574;
        Wed, 29 Dec 2021 04:54:51 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id h1so12614447pls.11;
        Wed, 29 Dec 2021 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KfD9IjU5XhrIZFvgmHtHCmMnkDPWizpAU4g0ttDwCPo=;
        b=faNUdExLq2iPl4pwYO49xHVJaZamVKlKmGQg++B5h/pGfAdU3AUfISQHCh6dRtBUzz
         lFhd+xDB7tLz9rTBy4LYAkNZcotRtzldtB5tnbxdxtvyynmskyVuODaqIFfrz+bUK7Ts
         spEyl6vLOEHcXMJ6FpnQStym7aXZZDgvydCnkInBOxBJx57WwtoljuOA6EuNpsZMutHB
         OgeJwo6+8FWf4/QxmPPAWvKnRzlO+fOgXp4YYEsaqHLcquIyzD/WXWQBtgq0XY12vuwp
         hrgT/Y33xB53I6G1iCETitBVN6eDwRid3jFwSz7YjxOhvR/5Ou93pGn6laUUSs9l8R6J
         clmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KfD9IjU5XhrIZFvgmHtHCmMnkDPWizpAU4g0ttDwCPo=;
        b=D6m2UtLpXsxl++crYBrICntE/8u7E1Atpv0z6FnCZTttPJUnFJsnaKAZohgetE134c
         8MPsBu+XapvHuhjGFChvB8MQZW95sSJxhUZXbPVccmDCixYFTT+EeVmPaa1WvzNzWUOe
         yv/LmGumUq/rwbAponAYw9nuWkbnTShZGoKQ4+lrcRxeP0ERI72rQ8QGF6pikfNqJIs5
         EAEsHrwGQ4h7NEY4xnF3K86QGdJCekLKTWJbQp14M5Pi7Eu6Ht/VjdL/Aw32dpy27JXc
         5oO2bxLyUzP9MxUd+KBZ9jTaWPe3NtMl94SQUcqZWy9Vb2UKJv+JeQPP1Fj5OnRmEjtm
         Y5RA==
X-Gm-Message-State: AOAM532UjYvRF7Mv4gfIdUGNHsm5KgisWV65GRNGWlElS0DlpnY/fxgt
        o5VuerAfrji6SiXeo2f0vDM=
X-Google-Smtp-Source: ABdhPJwiAFzAHUMNIaNixu7Ieio6O1Y3zH/lbKcIGj2OllRMxoSTStuhjQpt0ZU0d7m2JF3jpk7wSA==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id oc11mr32046979pjb.174.1640782490713;
        Wed, 29 Dec 2021 04:54:50 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id f8sm7678199pjs.47.2021.12.29.04.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 04:54:50 -0800 (PST)
Subject: Status of selection.svg update (was Re: [PATCH 0/3] docs:
 sphinx/kfigure.py: Improve conversion to PDF)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <de8def13-efbc-1d98-acb5-5cc1f6902e4b@gmail.com>
 <20211212113813.058e99fc@coco.lan>
 <8840a859-ca57-c49a-f542-0a37401ccdfc@gmail.com>
 <20211213073327.11191087@coco.lan>
 <60d50d23-e236-1105-dc2c-d6daca70e326@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e135a1fd-78df-d676-6678-9637a12ca8ec@gmail.com>
Date:   Wed, 29 Dec 2021 21:54:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <60d50d23-e236-1105-dc2c-d6daca70e326@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[+Cc: linux-media, -Cc: lkml]

Hi Mauro,

In case you are wondering what is going on in the update of
selection.svg, here is a status report.

On Mon, 13 Dec 2021 16:53:07 +0900, Akira Yokosawa wrote:
> On Mon, 13 Dec 2021 07:33:27 +0100, Mauro Carvalho Chehab wrote:
[...]
>> No matter if this is merged or not, if you find an issue at the images
>> at the media docs, please send them to linux-media@vger.org.
> 
> OK. I'll compose a proper change log for it and post it later this
> week or next.
> (I'm not a type of person who is good at doing several things in
> parallel.)

I started the patch preparation, but I found the patch would be
quite large in size (~500kB).

This is because current selection.svg consists of pretty high-
resolution raster images.
I see you had done several attempts to reduce the complexity of
the SVG, but it is still large (> 200kB) and conversion to PDF by
convert(1) generates a PDF of more than 1MB!
Even inkscape(1) generates a larger PDF (>1.3MB) with embedded
raster images.

I don't believe what the figure wants to explain deserves such
a large size.
So, from my POV, adding another bitmap image to the SVG for the
sake of browser compatibility is *not* the right thing to do.

Instead, my suggestion would be to get rid of the embedded raster
images and to draw some simple vector-graphics-based figure
instead.

Am I missing something here?

        Thanks, Akira

> 
> And the most easy fix is to install Inkscape on your system for
> the daily build.
> Then, convert(1) picks inkscape(1) for SVG rendering and you will
> see right ones (of raster images, though).
> 
> You know, ImageMagick prefers inkscape over rsvg-convert.
> I think it is the right thing to do in kfigure.py as well.
> 
[...]
