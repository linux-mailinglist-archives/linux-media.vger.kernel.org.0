Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95CD4637544
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 10:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiKXJgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 04:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiKXJga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 04:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA51F28718
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669282527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=el6XGWviR/PCGmRihnqAZfscMrZw0hrSkTQ+6kb8ZRU=;
        b=cXPK8EaDehQW9xyEo5vFP+Gbbykg2rQdvk03Ds0nWi8srcP/2rxHXfRxkVLf0aBOG55oGe
        326+4rVzqwcXAhPEkWVUB6W5nfmba58omERvO/SIoLGMgWynXmaXQw3s2A1t3Q5XteyuQ6
        8HTX07l/vZHplpk9N17lvFSuPnWhhq4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-uAc3eZADPQG_9joEzofXVg-1; Thu, 24 Nov 2022 04:35:26 -0500
X-MC-Unique: uAc3eZADPQG_9joEzofXVg-1
Received: by mail-wr1-f72.google.com with SMTP id q13-20020adfab0d000000b002420132f543so98221wrc.19
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 01:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el6XGWviR/PCGmRihnqAZfscMrZw0hrSkTQ+6kb8ZRU=;
        b=7ehlIXzhEx9xlA2AMUOi3cHk3JYz0w/3TTjKfXU6iUOcdCfiwfYgAwIkgFl0u98gCE
         LaTZWegnpeD1Cl4gaW8czfErf3dHqJMn3Usm1Ac6lb4/hTCzz+4UhqNBnk1pXrxhJsuG
         k4k46iiDBl0KXUzZoUxmeAfdrDSY+3bXSB/YzatR3BCiLTlPmTWqrRypF35CiT7+iOEF
         VHkxqW2t+hlcajmSjAY+Zb2ygj7zLMwWKQ/dTHMxAFzxoYJ/Y/7SsUqphZRycIdwXRIk
         Qd7kURyZ/VsWhDYp0yPWkRnE5bAE9zCPMqjW3BMTphNAWPbBW7hQu5N2LiUum6w8kFMn
         0Tew==
X-Gm-Message-State: ANoB5pnNm4KkoO759xyr4Edf3vmiIVp37+cof5LgIz1HpuhWecWujsaj
        m1Q/4QkTaJP4hiZRTtp0M+N3NKWJJHZBF1RPtN6F/bg1FEd+NTD9i8ichq5TaNVp25BFvwCJg5g
        K4YELPr3hIxZKZi/0+OTI+XI=
X-Received: by 2002:a05:6000:1c03:b0:241:c567:8e3a with SMTP id ba3-20020a0560001c0300b00241c5678e3amr7536690wrb.120.1669282524893;
        Thu, 24 Nov 2022 01:35:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vzKuHBnrxrR5/zffozdmnM5k4upWLPl7eg5r5wbB8p43k4LW4nIVoASmSJU1EFMZVS52ZIw==
X-Received: by 2002:a05:6000:1c03:b0:241:c567:8e3a with SMTP id ba3-20020a0560001c0300b00241c5678e3amr7536673wrb.120.1669282524544;
        Thu, 24 Nov 2022 01:35:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:2200:bfcb:7212:1370:de13? (p200300cbc7042200bfcb72121370de13.dip0.t-ipconnect.de. [2003:cb:c704:2200:bfcb:7212:1370:de13])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d4087000000b002366b17ca8bsm923888wrp.108.2022.11.24.01.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 01:35:24 -0800 (PST)
Message-ID: <e79ea6b6-f4a5-51e2-5d1d-e93a1cb314f4@redhat.com>
Date:   Thu, 24 Nov 2022 10:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <71bdd3cf-b044-3f12-df58-7c16d5749587@xs4all.nl>
 <b437cabc-bf3f-135f-2100-13f45c16e3a3@redhat.com>
 <951827b8-22cd-2a7b-274f-25aa5dcd15cf@xs4all.nl>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] media: videobuf2: revert "get_userptr: buffers are always
 writable"
In-Reply-To: <951827b8-22cd-2a7b-274f-25aa5dcd15cf@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.11.22 10:13, Hans Verkuil wrote:
> On 24/11/2022 09:45, David Hildenbrand wrote:
>> On 24.11.22 09:29, Hans Verkuil wrote:
>>> Commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
>>> always writable") caused problems in a corner case (passing read-only
>>> shmem memory as a userptr). So revert this patch.
>>>
>>> The original problem for which that commit was originally made is
>>> something that I could not reproduce after reverting it. So just go
>>> back to the way it was for many years, and if problems arise in
>>> the future, then another approach should be taken to resolve it.
>>>
>>> This patch is based on a patch from Hirokazu.
>>>
>>> Fixes: 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always writable")
>>> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> ---
>>
>> Regarding possible merge conflicts with the FOLL_FORCE patch [1] that's already in -next, would it make sense to base this patch on the FOLL_FORCE patch and routing it through the -mm tree? Or what's
>> the best way to move forward?
>>
>> CCing Andrew
>>
>> [1] https://lkml.kernel.org/r/20221116102659.70287-17-david@redhat.com
>>
> 
> My preference would be to apply the removal of FOLL_FORCE *after* this
> patch has been merged. This patch will likely be something that will be
> backported to older kernels as well, and that's easier to do if it is
> applied before your patch.
> 
> I think it is best to apply your patch for this after v6.2-rc1 is released.
> If you post a patch removing FOLL_FORCE to linux-media once v6.2-rc1 is released,
> then I can ensure it will be merged in a later v6.2-rcX.

Such dependencies with the -MM tree usually imply trouble. :/

There are two ways:

1) Andrew picks up your patch and we rebase my patch based on yours. All 
goes in via the -mm tree in -rc1.

2) Andrew drops my patch and you apply the rebased patch later.


Applying patches after v6.2-rc1 doesn't really give them the chance to 
lurk in -next for a longer time, and it kind-of feels wrong for 
something that doesn't have a fixed tag attached. But I don't care as 
long as we don't unnecessarily delay the FOLL_FORCE cleanup from getting 
merged.

@Andrew?

-- 
Thanks,

David / dhildenb

