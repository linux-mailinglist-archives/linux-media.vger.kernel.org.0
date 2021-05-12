Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CCE37C682
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 17:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhELPvz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 11:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236871AbhELPrD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 11:47:03 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17404C0610D7
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 08:20:37 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a4so24037658wrr.2
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=buJpAC6QoOTLxZ966jwMtcerOd80qLSkRBkOYBRB+ec=;
        b=F+vlUdgsDlWwi8V9v5Egg1vsWQK7XzEPsiqZcsHQffR3P0WmPUFAT45bt+2EV2KRO3
         XUpVXqX72yQILc21zP7xh9NIojCRKZTkO2thyhjABJIXvBRkLbXMfgWheHhHuz9hM/+/
         XmUxDNj88m7G1SUnK7H4FoZFdxSW0ioq2Sk7Hf0pYiynoY2z0YM8Q8sWXPpJena8PuwU
         cJlOXI+EE70FXSnjuA673XR0L8pXXO6j/LuZ8dFEWg/+oc2vQDPo9rTt7+inkDXXzaj1
         5VqqG1vd1bM6Wj84Qjll/jE2AxU07pPONAK3vWnkqsTNvLLEnHi4nTluah4o8rpg1WGY
         qVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=buJpAC6QoOTLxZ966jwMtcerOd80qLSkRBkOYBRB+ec=;
        b=Bl347Al+yQNQI8dmUIxGw8W4e6P/JGfwPcivatC8kDLQDqJqjRN+vEZ+ROF4m/Rtmt
         W2qj83pLqnym/fsLMSy3O5cJLoHHGBurzRk4mGoWLx0A03PU9wLwO5Z8WRYPi7xEjAoh
         SP2AFoZ8YO3lGMM++iifi2qiXQ1sAzJCctluS1UNpyHJ3qgSRGHxa0yY2afat1ZvJk2H
         S7GgWhWKXR813OL1hn91O/saLw1+uw3To+8ojC9i6p6a/UPr1Bn3kwVtvyeKZ+hVOdbd
         PU82AiOlXpztIT4xvcHb8TwYz3Wzo6iEHm/n9GrRx4cAH+L2Q6Aw1eXNheRxEhU8ded5
         fG2A==
X-Gm-Message-State: AOAM531gogl9bSw5cvgutRvdNEsX7/s3+X186pDCHt2pUPaikCkmvR21
        c07RlASMza1tc5Np1M8QzlVZY3OgLVypjtBB
X-Google-Smtp-Source: ABdhPJxZnd+OwXBWmMaw+RssHKSlkdl7vHO4zVGr2wLy/CeMm6Ul6+67OE+sONIkvZSNHu/FCfyJjw==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr45560697wrt.39.1620832835860;
        Wed, 12 May 2021 08:20:35 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id s126sm5708250wme.18.2021.05.12.08.20.35
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 12 May 2021 08:20:35 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     "Ezequiel Garcia" <ezequiel.garcia@collabora.com>
Cc:     "Hans Verkuil" <hverkuil@xs4all.nl>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
Subject: Re: Dynamic array control support: please test!
Date:   Wed, 12 May 2021 16:20:35 +0100
Message-ID: <e9sn9gp7kk0f6fepfm7trt7oq6bor137iv@4ax.com>
References: <5trl8gldqb467m4nmmbbnubuudajg4j3hb@4ax.com> <5212-609bc880-9-623f1400@218746912>
In-Reply-To: <5212-609bc880-9-623f1400@218746912>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel

>Hi John,
>=20
>On Thursday, April 29, 2021 14:56 -03, John Cox <jc@kynesim.co.uk> =
wrote:=20
>=20
>> Hi
>>=20
>> >Hi Ezequiel, John,
>> >
>> >After creating extensive new compliance tests for this feature I am =
now
>> >confident enough about the implementation.
>> >
>> >You can find it here:
>> >
>> =
>https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dctrl-refactor
>> >
>> >There are two items that I want to fix before I will post this:
>> >
>> >1) The new flag needs to be documented
>> >2) I think there are some simplifications possible w.r.t. storing the
>> >   size of the new array, I want to look at that a bit more.
>> >
>> >In the meantime it would be great if some testing of this series can =
be
>> >done with real drivers instead of just vivid.
>>=20
>> Well I finally managed to put together your patch (in 5.10), tweaked
>> driver & ffmpeg to have a variable noof slice headers and it all seems
>> to work well. With the code I have it doesn't give a significant
>> improvement in performance over 1 slice at a time but that is probably
>> because I have multithreaded userland code and take liberties with
>> buffer returns from the driver that Ezequiel disaproves of (but my
>> ffmpeg code is happy with).
>>=20
>
>I don't think I have ever disapproved anything (and if I made it sound =
like that, it was a mistake). Quite the opposite, I am more than =
supportive to see get more drivers merged upstream.

Yes - sorry - my mistake - I was thinking of one person and typed
another. And in any case, even if I had the right name, that wasn't a
constructive remark on my part.

Please accept my apologies

John Cox

>Thanks!
>Ezequiel
