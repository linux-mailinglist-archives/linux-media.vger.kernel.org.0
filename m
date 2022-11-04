Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6357E619ADB
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 16:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiKDPC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 11:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbiKDPCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 11:02:32 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CA440935
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 08:00:19 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id y14so13931968ejd.9
        for <linux-media@vger.kernel.org>; Fri, 04 Nov 2022 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGBWxjsREcf/mRnaEwnaOQb1KRRlx3tSPPTFXGX4lwM=;
        b=K+Nzx7awgnEA6rpeESU2hc1sp8CI7+Uqd3AYJ90O1aJTcFOCdVIFkAo5q2L01sK+35
         fN25CnA/+V/KXRlaq4BmVqPV9UlVZ/AqDlxzCiIVmxYXsrbzRrQehCaCy7t/3I7f6mSF
         j/mkMOCYLHauH5LiphZmR1SLhAw3RFKaXB76x/K5R5taTrHNJ4Q2+pPWQmmWbQ9ZKH0w
         C0ElncD8hRhheA4kWeeceaHA6Q8UuDOpVlhPaLEsL9dR5KN/zUF2t0UR9adVv9ARFdkp
         qh2xplGVQ4J0TvZrGW/Fzw8DXOYYjiR8BK2C8zp4diTLSUIrv46WZ7vGurhi8zSIgfoQ
         mImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGBWxjsREcf/mRnaEwnaOQb1KRRlx3tSPPTFXGX4lwM=;
        b=mq62kxBKGbeV0VGufonUuP5Q4m86DsUaJpr1nbeB/wxlYMv3OnPCPR7aG8RKJglrPe
         vHEpTuuXYtjG+KqClLkWhw+1ZvbTSgsx3EG4aQssWCKc3f0qUJTnH3e0g6dEKREDAO2F
         dydp1cElHuk41CZQdt2C/Tgduv0BXxekwePD390iUOFcUxVFzWuplfeigHG+MxwcbPr4
         fhfk00uiRhaKKr0gPinimj72cJ1438d4W6zfqrDeDxO4Y6jbuU5ls/7bBD0humI6Nnr0
         m/p1J1PmJw4aVfJ9F5ADNOFlfcQLsnH9bNM1XzFUljK5P1xPZTOHS46ryGoJlw4ek5YD
         lWIA==
X-Gm-Message-State: ACrzQf2Vz1i8de0ynzt4N5W8ZZdGZLO2SjcWcwv63sWfmQ+MFZh5L7l6
        D1GXb/KzCJX/csObFVs7xY0=
X-Google-Smtp-Source: AMsMyM4/6Xrg+nCjBO6Q4ZHslz5bGkJxxYS6HKmG/P5l/wF4GU9nJDNHE3Nygc3YDM6mHOPBDPSytg==
X-Received: by 2002:a17:907:1188:b0:78d:8267:3379 with SMTP id uz8-20020a170907118800b0078d82673379mr321675ejb.415.1667574018116;
        Fri, 04 Nov 2022 08:00:18 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:8469:5663:826a:8164? ([2a02:908:1256:79a0:8469:5663:826a:8164])
        by smtp.gmail.com with ESMTPSA id fq35-20020a1709069da300b007adb67aec1asm1900944ejc.111.2022.11.04.08.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 08:00:17 -0700 (PDT)
Message-ID: <6c9a7faf-b967-de0a-a4e9-6d69b4eb4b20@gmail.com>
Date:   Fri, 4 Nov 2022 16:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Stone <daniel@fooishbar.org>, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <CAF6AEGsA_AqMm2csMv_21Y8wFdbnCiYT36AEUszGK63zJM0hqw@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAF6AEGsA_AqMm2csMv_21Y8wFdbnCiYT36AEUszGK63zJM0hqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.11.22 um 15:58 schrieb Rob Clark:
> On Wed, Nov 2, 2022 at 5:21 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Lucas,
>>
>> Am 02.11.22 um 12:39 schrieb Lucas Stach:
>>> Hi Christian,
>>>
>>> going to reply in more detail when I have some more time, so just some
>>> quick thoughts for now.
>>>
>>> Am Mittwoch, dem 02.11.2022 um 12:18 +0100 schrieb Christian König:
>>>> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
>>>>> [SNIP]
>>>> As far as I can see it you guys just allocate a buffer from a V4L2
>>>> device, fill it with data and send it to Wayland for displaying.
>>>>
>>>> To be honest I'm really surprised that the Wayland guys hasn't pushed
>>>> back on this practice already.
>>>>
>>>> This only works because the Wayland as well as X display pipeline is
>>>> smart enough to insert an extra copy when it find that an imported
>>>> buffer can't be used as a framebuffer directly.
>>>>
>>> With bracketed access you could even make this case work, as the dGPU
>>> would be able to slurp a copy of the dma-buf into LMEM for scanout.
>> Well, this copy is what we are trying to avoid here. The codec should
>> pump the data into LMEM in the first place.
>>
> For the dGPU VRAM case, shouldn't this be amdgpu re-importing it's own
> dmabuf, which more or less bypasses dma-buf to get back the backing
> GEM obj?

When the codec and scanout is on the same device, then yes.

But we already had cases where the codec was on the dGPU and scanout 
happened on the integrated engine.

Regards,
Christian.

>
> BR,
> -R

