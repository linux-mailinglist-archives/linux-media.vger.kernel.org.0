Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A93635EF4
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 14:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238697AbiKWNG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 08:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238638AbiKWNGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 08:06:13 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E4FD2F72
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 04:49:47 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p16so12989614wmc.3
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 04:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAXiwhITo1fYPFHeaxZuA3JnvtciKXegmNlmVm1MLTo=;
        b=QcDOmyJPMmV74tHIYH2f3pF018aonfW3C+atn7ceR7fOjNdM7WpYgKbl2TOcGlAfNf
         eS6geetBOAXpvAu1ByBRfnE1WtA5FjJ7po22QR0Hau5dh+ZOr4Vf+rUpnP1qOaSUU3gK
         xP7WLbATr1oEA0BwcHpPIVVoIjma1yOMMBcSs0QkZAdvqUt3iSH7RrYeGOuVFF1Thnd/
         DFdglq37JxouigDQDU1kqqUTT+l6o8mNES99yXFoOFjifePHX0doUNVZsto2RyJA0/3B
         4nO04XCDC1bCb2DPKhY1FHcr+ZlcPgldYLiQgYA4d7TG6tiuDsEPB/Jcmow6G5hiuE+H
         Ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAXiwhITo1fYPFHeaxZuA3JnvtciKXegmNlmVm1MLTo=;
        b=nKJd5tvklLpw2+dDhsRcY21Bk/8hsPRaKOHe8C4EZc0+9x7PfWz5piwZn3QzRvVXJG
         l59dusoDdUpauVstFODknTCiYuZv2kCrlc0uXgu7ECi7sSeuEQeTImnaIWpuG3Y49wO6
         CPecLKcLLvOVOVt4O5Mi9uEb5ZK9nUHC7SqlimDr3fVIbDS89tT9iP2yvSrQzn5zaEYz
         pLexGMuXLoe148JohaQpYOVYjuEJWRfH8d4mrKOpDR0w9meaDggozh/UeKCBMvTnMTEv
         Ve1pWaqANoedL6PfnLmm/ee6/IML1FPN3wlYQjboM6+PDQQbV9eTpgnaXH8nole1K6Pl
         Wh8g==
X-Gm-Message-State: ANoB5plQJeVgcsmIT1P2dewKXuTCJJfvgVHk+iV55MILSkJu/rnOa+fJ
        0Usy+Y+r4ybbCoUl0A6pHjU=
X-Google-Smtp-Source: AA0mqf58T+ReNLwV7A/JFKqP0idHpqbq4k2Ql3MVFCyZKZT2MWOwbf7fqQlJHYiTQN9oEiyfL76KUg==
X-Received: by 2002:a7b:cd18:0:b0:3cf:a359:de90 with SMTP id f24-20020a7bcd18000000b003cfa359de90mr9926352wmj.122.1669207785530;
        Wed, 23 Nov 2022 04:49:45 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d2d7:ceea:efc2:af43? ([2a02:908:1256:79a0:d2d7:ceea:efc2:af43])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003cfa3a12660sm7774387wms.1.2022.11.23.04.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 04:49:44 -0800 (PST)
Message-ID: <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
Date:   Wed, 23 Nov 2022 13:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y34WI9SZdiH/p1tA@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
> On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
>
>>> Maybe a GFP flag to set the page reference count to zero or something
>>> like this?
>> Hm yeah that might work. I'm not sure what it will all break though?
>> And we'd need to make sure that underflowing the page refcount dies in
>> a backtrace.
> Mucking with the refcount like this to protect against crazy out of
> tree drives seems horrible..

Well not only out of tree drivers. The intree KVM got that horrible 
wrong as well, those where the latest guys complaining about it.

>
> The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
> though, though you must combine this with the special PTE flag..

That's not sufficient. The pages are released much later than things 
actually go wrong. In most cases this WARN_ON here won't hit.

Christian.

>
> Jason

