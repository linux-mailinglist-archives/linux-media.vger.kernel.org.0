Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78534F804E
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 15:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbiDGNS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 09:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiDGNS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 09:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D70B1C2A0C
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649337412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vbRblRxq/SE2km/rkmjkdSJvts57gYuZ3JZvtprFnTs=;
        b=EgH0WdLqZCJ6UQnvEwLUSU7YKr4zUWq2cnKNit5ghhI5tVeTWJvrZIzWjwX1MVJ0EStlz/
        BgAgdsxlepfTCPGBwG1gY63mMXE0Co4cepTBDWo7uOoN7lgzcRqrYRNhmnlFi/C9GifhKE
        SA1Giz8n75iRCVa80UdowboMy8FTIHk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-8NYf4yZoP_eXPfYJvYftmg-1; Thu, 07 Apr 2022 09:16:51 -0400
X-MC-Unique: 8NYf4yZoP_eXPfYJvYftmg-1
Received: by mail-wm1-f72.google.com with SMTP id m35-20020a05600c3b2300b0038c90ef2dceso4564533wms.4
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 06:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vbRblRxq/SE2km/rkmjkdSJvts57gYuZ3JZvtprFnTs=;
        b=12wN0ifHlG3yncg5N/CQuq+24E4BPqB8NprblIdmYZwLgyZN+FMYG4sNrWT2VA5bNR
         qR000tbmwnbKwqnFZdsW/HqerJxnm1EftF2rsN3hPuwiHB/GinW1p5l74D18ORG1LsiE
         BMbQlRgnrHzPPdMkEDMz0M0xHIAJh8ea1joPvAIw5h0nrp++07j9GQOiQQkQRS3TJ74n
         FMKwm47dJ//2L66lrBEjnI6h7GwzDYD4tt5f3lXFS0LEoJzYW961mXVIysxFdjoEb0gc
         RpOhMWDN0w/HhBp2HzmUF7dAEt2ZBY13NWU0mvOWjMoK81GTFlC2kn368vsJCNcPmtqn
         mBYg==
X-Gm-Message-State: AOAM532Xt3MkfSsgjnVpX+Xvt6HC7GXzi25d4YenLE1+bSRK00T2kIhE
        3eU/h+ny0qnleRqSljYYfcHJyiLWLfFFJXzspa2BwQC3aevOfMp3mBU6upQD4kqPPe7yqjeoN1I
        5RYZQ2zpi1iCYWsw+H7SXzTw=
X-Received: by 2002:a05:600c:590:b0:38c:804e:4197 with SMTP id o16-20020a05600c059000b0038c804e4197mr12313545wmd.22.1649337410262;
        Thu, 07 Apr 2022 06:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqkG5lfR25b85G/v8443+CqBWY7ukzbb2XsMCNk9TeIagKJa+MIeW8P/wBh5/pVz1uMvC5wQ==
X-Received: by 2002:a05:600c:590:b0:38c:804e:4197 with SMTP id o16-20020a05600c059000b0038c804e4197mr12313529wmd.22.1649337410062;
        Thu, 07 Apr 2022 06:16:50 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm16607003wrm.82.2022.04.07.06.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 06:16:49 -0700 (PDT)
Message-ID: <aa949d43-5c88-377c-9f93-1886f934bbca@redhat.com>
Date:   Thu, 7 Apr 2022 15:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dma-buf: specify usage while adding fences to
 dma_resv obj v7
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-3-christian.koenig@amd.com>
 <29677a4e-42dc-d35e-f487-f8b344678bee@redhat.com>
 <79648b84-e7d0-4c38-d8f1-cc569238ee7e@amd.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <79648b84-e7d0-4c38-d8f1-cc569238ee7e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/7/22 15:13, Christian König wrote:
> Am 07.04.22 um 15:08 schrieb Javier Martinez Canillas:
>> Hello Christian,
>>
>> On 4/7/22 10:59, Christian König wrote:
>>> Instead of distingting between shared and exclusive fences specify
>>> the fence usage while adding fences.
>>>
>>> Rework all drivers to use this interface instead and deprecate the old one.
>>>
>> This patch broke compilation for the vc4 DRM driver.
> 
> My apologies for that. I've tried really hard to catch all cases, but 
> looks like I missed some.
> 

No worries, I know that's not easy to get all callers when doing these
subsystem wide changes.

>> I've this patch locally
>> which seems to work but I don't know enough about the fence API to know if
>> is correct.
>>
>> If you think is the proper fix then I can post it as a patch.
> 
> Yes, that patch looks absolutely correct to me.
>

Thanks for looking at it.
 
> Feel free to add an Reviewed-by: Christian König 
> <christian.koenig@amd.com> and CC me so that I can push it to 
> drm-misc-next ASAP.
> 

I can also do it after posting (just to get a proper Link: tag with dim)

Already have another set that wanted to push but found this issue after
doing a build test before pushing.

> Thanks,
> Christian.
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

