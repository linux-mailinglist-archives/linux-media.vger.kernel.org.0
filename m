Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F4B4D7675
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 16:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbiCMPg7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 11:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiCMPgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 11:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 75E9371CBE
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647185744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8lIyBMBGORfp1VxiABBqMU4c3GxXnpu4EV87YIyaZMI=;
        b=bChcxHYKWd/T4sDxR4B5tj/Z58ew73S9xl7EODfAeZoR3coVMzT+Sd3tnRDBP5R57SD84r
        H6nkpWl38rTb1Q1OegDdzKLqWAqsy+1vlDhExF3boobCRockkl/p++EqpIoEtJqm1aXjHw
        tOgUKLW6/iheHJdyKjO1wntF12qmsnU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-77ak--_KNuKvL9vfqyc8jA-1; Sun, 13 Mar 2022 11:35:43 -0400
X-MC-Unique: 77ak--_KNuKvL9vfqyc8jA-1
Received: by mail-oi1-f199.google.com with SMTP id 9-20020aca1009000000b002d9a9f48c79so9821493oiq.0
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 08:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8lIyBMBGORfp1VxiABBqMU4c3GxXnpu4EV87YIyaZMI=;
        b=edmxz10Pq7dtXu3RjHWmfpixe+Gas2Y0wKvbLeCtQo6PIFDSw2LTygLEjqpdrOqn4d
         exAkekozEUzk4nor79ag0bRui5vgizspdjaeVfKXdL88Qzvmo4eK1pBQGCr77t7hFjwm
         GsdiT0ov+VoItCiqgLPPQm6boiJ2Cu29sJOi5TNfiB5VbjjJ2eKUeGuJdA1Tlz+Z6OFg
         lmqPUp2ZWZ6LiJEjqd8w5ufh561UCH+OpVvBnsGaZri3Excfq+L4RyEM8lPyg9cD8qef
         0s0JL2ImYETba6rwa8dOJ0I1nHXHpZQfUZyMco8Ethrz3fg/cDKF1cbfsykSfpJDmLRv
         q7fA==
X-Gm-Message-State: AOAM532BrKGsyZuzolATfCqwftZIr3POHkkInl/i5yOnje+4HehO8KkA
        TbVGYL2v+NX2hnYyZlLPy6S+TN+mhHliEJD4T18kG6eNyku5hd/f0XZsKFYXRnoolVRz1MnaiSA
        sA/PNN17zdrwIrcGukl6OaGI=
X-Received: by 2002:aca:2119:0:b0:2ec:a7ff:c042 with SMTP id 25-20020aca2119000000b002eca7ffc042mr5766985oiz.73.1647185742584;
        Sun, 13 Mar 2022 08:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiUqUbO1cgdW16d+fK6APreS35khYTNjQE4uRvu0O4kZQO/jSJCfXtJ8gHlGESptMtsI5+bg==
X-Received: by 2002:aca:2119:0:b0:2ec:a7ff:c042 with SMTP id 25-20020aca2119000000b002eca7ffc042mr5766977oiz.73.1647185742376;
        Sun, 13 Mar 2022 08:35:42 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id s2-20020a4ae482000000b0031c42eb457csm5875274oov.43.2022.03.13.08.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Mar 2022 08:35:42 -0700 (PDT)
Subject: Re: [PATCH] media: stkwebcam: move stk_camera_read_reg() scratch
 buffer to struct stk_camera
To:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, cai.huoqing@linux.dev,
        xose.vazquez@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220312173049.1410977-1-trix@redhat.com>
 <65a1d178-8511-a023-2655-94540114086c@gmail.com>
 <c3723690-cacb-0c42-cc5d-397a3363b4da@redhat.com>
 <0d8dfedb-1c2c-1a70-18dc-0c4439cf4bda@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <b5711870-b047-d1cb-d272-b193175d6238@redhat.com>
Date:   Sun, 13 Mar 2022 08:35:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0d8dfedb-1c2c-1a70-18dc-0c4439cf4bda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/13/22 8:11 AM, Pavel Skripkin wrote:
> Hi Tom,
>
> On 3/13/22 02:48, Tom Rix wrote:
>> These do show up in my usual static analysis and it why I was looking at
>> this file.
>>
>> And was sidetracked by the short malloc.
>>
>> Unfortunately I looked and there are many other similar instances
>> treewide ~100
>>
>
> Most of them are in very old drivers and I don't think they ever be 
> fixed. I've looked into one bug reported by syzkaller and there was 
> like 30 calls w/o proper error handling in one driver. Redoing whole 
> driver logic without access to hw seems dangerous :))

 From the checkpatch change below, there are about 150 dinky allocs treewide

Here is a refactoring

https://lore.kernel.org/lkml/20220313141008.1503638-1-trix@redhat.com/

>
>
>> These aren't caught in checkpatch, so working on that..
>>
>
> I think, it's not checkpath responsibility. Maybe it worth adding such 
> check to smatch. I tried to implement such checker, but never finished 
> it :(
>
>
Poking new development to not do dinky allocs I think is worth it, here 
is my checkpatch patch

https://lore.kernel.org/lkml/20220313140827.1503359-1-trix@redhat.com/

steal the regex for smatch.

Tom

>
> With regards,
> Pavel Skripkin
>

