Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1562F203FF8
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 21:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgFVTTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 15:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgFVTTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 15:19:00 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379DAC061573
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 12:19:00 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id b4so16579830qkn.11
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iK9b0EPkb6qG0mOFqaFrLa8QxwJcgxn9y/5nMaSGoEU=;
        b=1Q+UeySM9m+RieJpwm1qIb376mZikssyY8BRHOOH7HgUY+uIsutg5arleyL2ZoVPoQ
         xzs7tY7b6kfesUYLtGFV9ywWnUsuY0RuwxeWEDZwxDmOLmpLRPwNfT1cY0VqgFG8PBhs
         mmWJbpB+MF0hW5IVjE9J9F8e5RQsOq6xpcCb2zWK5rjcQ1IJljOWDT5ShvDf4F1XpDiX
         CNBKTgVW4lfcOa0bbcSVyUjJe1tieEvK5iPsBVoBwn+8NJRTWevNjZqgcrUaIbnPPfI0
         cYydKWaX8qzHvc56RPyxsvuFzHHbbrea0B/7B0l15T+S7efyP11YLg8IrzoB0iSqc1bn
         j2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iK9b0EPkb6qG0mOFqaFrLa8QxwJcgxn9y/5nMaSGoEU=;
        b=pSiU2vnitIErJ1A9bXfChUZs9m9+5Ou4SE8MKFEtwie+OmddZzmuRMeXRV3uu6cyhx
         XSMKmAxBml7YVTNaRehX800eW6NqtcG6LtuoHi2bi9KoO20zavMODp1fxgldk2IcfcQ1
         DJFlp5jBFAfm969AWCf66oHDDnF3T5pUA7gs977vz6eMC6dFr2+Abto7Yby78vUhiZ+e
         TwSAdN3Oum61V7rctwocPEDTz8Q0A+ST4tI+DXJ+1IOBoRclmg1FGyOfvk1tXTLDGF1A
         xNMyt3pU3PeZzylMk12vOxtkM6LSIFb9jAi3Vg2Vp6esB9qxdVo+f+pQlva5pKgf0hpu
         v7DA==
X-Gm-Message-State: AOAM533rdTqksvBw3hVhMy30ARTH5qMpibOTd8mgM/R0IYBsAihMLbAG
        YVL9zsTQi8C6/kjo8kpG+7jjgw==
X-Google-Smtp-Source: ABdhPJyhvhMnOyMzO71eEvbLMFgXi3uSN6B1fuobYR49nYpOsja15ov0SugX9gt7ljNcsRuqiVYT2g==
X-Received: by 2002:a05:620a:8da:: with SMTP id z26mr15988107qkz.461.1592853539433;
        Mon, 22 Jun 2020 12:18:59 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id m126sm14838582qkd.108.2020.06.22.12.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 12:18:58 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, gjasny@googlemail.com
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
 <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <1ce5f387-56c7-a81c-0c80-de99ba3bf108@vanguardiasur.com.ar>
Date:   Mon, 22 Jun 2020 16:19:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Sorry for the late reply.

On 6/18/20 10:57 AM, Kieran Bingham wrote:
> Hi Ariel,
> 
> Wow there's a lot of work there! That must have taken quite some effort
> between you and Ezequiel!
> 
> I've looked through, and about the only thing that stands out to me is
> the way you're joining strings.
> 
> Meson provides a join_paths() function specifically for that.
> Now we're "probably" not going to build this library on anything other
> than linux, but I think the function still has merit over the arbitrary
> strings which I mis-interpreted for 'divide' at first glance :S
> 
> Other than that, I expect we will have to run both build systems in
> parallel for some time to allow packaging and other builders to adapt.
> That might mean it's a bit more difficult to make sure both build
> systems are updated when adding new files or changing the build in anyway.
> 
> However, that said - I'm most certainly in favour of this change and
> would love to see more meson support, so theres an:
> 
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> for the principle of this either way, but I don't maintain this library
> anyway ;-)
> 
> With join_paths() used instead of (I guess it's just plain string
> concatenation?):

So, this has already been discussed in the thread... skipping.

> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> But that's a whole lot of text, so I'm sure I've probably missed
> something. Lets see what more eyes find...
> 
> --
> Kieran
> 
> 
> 
> On 18/06/2020 14:33, Ariel D'Alessandro wrote:
>> Supports building libraries and tools found in contrib/, lib/ and
>> utils/ directories, along with the implemented gettext translations.
>>
>> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> ---
[snip]
>> diff --git a/contrib/gconv/meson.build b/contrib/gconv/meson.build
>> new file mode 100644
>> index 00000000..88abc46f
>> --- /dev/null
>> +++ b/contrib/gconv/meson.build
>> @@ -0,0 +1,42 @@
>> +arib_std_b24_sources = files(
>> +    'arib-std-b24.c',
>> +    'jis0201.h',
>> +    'jis0208.h',
>> +    'jisx0213.h',
>> +)
>> +
>> +arib_std_b24_deps = [
>> +    dep_jis,
>> +    dep_jisx0213,
>> +]
>> +
>> +arib_std_b24 = shared_module('ARIB-STD-B24',
>> +                             arib_std_b24_sources,
>> +                             name_prefix : '',
>> +                             dependencies : arib_std_b24_deps,
>> +                             install : true,
>> +                             install_dir : get_option('libdir') / 'gconv',
> 
> Looks like this should also be join_paths() (noticed below first, and
> skipping back to look for other occurences).
> 
> 
> 
>> +                             include_directories : v4l2_utils_incdir)
>> +
>> +dep_arib_std_b24 = declare_dependency(link_with : arib_std_b24)
>> +
>> +en300_468_tab00_sources = files(
>> +    'en300-468-tab00.c',
>> +)
>> +
>> +en300_468_tab00_deps = [
>> +    dep_jis,
>> +    dep_jisx0213,
>> +]
> 
> you could do
> 
> gconv_install = join_paths(get_option('libdir'), 'gconv')
> 
>> +
>> +en300_468_tab00 = shared_module('EN300-468-TAB00',
>> +                                en300_468_tab00_sources,
>> +                                name_prefix : '',
>> +                                dependencies : en300_468_tab00_deps,
>> +                                install : true,
>> +                                install_dir : get_option('libdir') / 'gconv',
> 
> 				   install_dir : gconv_install,
> 
> 
> 
>> +                                include_directories : v4l2_utils_incdir)
>> +
>> +dep_en300_468_tab00 = declare_dependency(link_with : en300_468_tab00)
>> +
>> +install_data('gconv-modules', install_dir : get_option('libdir') / 'gconv')
> 
> Then you can reuse the gconv_install variable here.
> 
> Same wherever approrpiate in other build files too.

Sounds good, I'll do that and reuse those variables whenever possible.
