Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26A860F6E8
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 14:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbiJ0MOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 08:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbiJ0MOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 08:14:17 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92514D2587
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 05:14:16 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id f27so3998696eje.1
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozR3pFF6qvev8k9P0jdmPJjlIVCpHvZvFTrYrZyvlug=;
        b=PZjRFX7hCJSMc+Y64bXTjS1Y0HjMKr7mBuRJEyhLjLFHCu86uE4HnLAuCExy6utvd1
         FOgBhXiiAJSLrrUG20YbdRvbVsNsZwCbTOPXaDHJFE88JKd+2iypeS1yDOEDzE57VkjJ
         UqWne/R3v2Wnj8Xa4C6S+5rj0k7XRgR9qoxXW4GzTzZDgcO+MzbvkuT1O61ovT/wJi+D
         Ha3tj9vLaD9yQYMZ/8SkAKkNiZ/YgGPwpKyMnOgfHSbBlgl4run+/9wq3qhNRVlg17Ki
         vDrwt6JEo/l/1NL27ZVsNuW2qV7SdZinurpZSn7BRkWNw1fV8rlE01TvkJBC9O4zTpDK
         1seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozR3pFF6qvev8k9P0jdmPJjlIVCpHvZvFTrYrZyvlug=;
        b=an9C3948CTDKlqA4cStciq1Qq5p/vufPDZfg3IeXINaJRRMSQUUTd/miW44UU7tdd6
         m3X2tvtbiQOCBlAETenLX/nzJyPgfBM6RZGRHtlMq3RSlc2lnLJ1VU7YHhRAPumq15ma
         csW1yBueGO9M1s7bKew2IVukzYkt/IlcolXxq4Q3Y4PRmTxXMn8VARbaU8OVTKBIij5m
         SCD0HJLFx66ApjvrhJ6MYvuijy3LpohQXTVnLMZBV5TVKqu3+NuKuOE1XfKyMRgDXmMl
         lKmV355bkPrtGwPnqsw6BMrGye8UMXr76tdy8Q+B4DhdoiHuShL2C1kChH8sWYb1cY0c
         vF5g==
X-Gm-Message-State: ACrzQf0dab/cdZgjai5xPGaNoAfzaWTu/TmH09acAt99428ViOkr20FY
        L/2mHdN0cjVuZ2YPRCBbiDo=
X-Google-Smtp-Source: AMsMyM4Sne+rY2Ji3vF5c/d7Ew6GneR38fuCK0QW1XQVz5EfmwMiRau9oJnErgKoc5ml8Y39s8E8kA==
X-Received: by 2002:a17:907:1dda:b0:7a6:8ffc:7dc with SMTP id og26-20020a1709071dda00b007a68ffc07dcmr20109443ejc.163.1666872855035;
        Thu, 27 Oct 2022 05:14:15 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
        by smtp.gmail.com with ESMTPSA id bm27-20020a0564020b1b00b004615f7495e0sm917790edb.8.2022.10.27.05.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:14:14 -0700 (PDT)
Message-ID: <59ac9998-a838-abf8-124c-8fd98c4f0f7a@gmail.com>
Date:   Thu, 27 Oct 2022 14:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
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

Am 20.10.22 um 14:13 schrieb Christian König:
> Hi guys,
>
> after finding that we essentially have two separate worlds for coherent sharing
> of buffer through DMA-buf I thought I will tackle that problem a bit and at
> least allow the framework to reject attachments which won't work.
>
> So those patches here add a new dma_coherent flag to each DMA-buf object
> telling the framework that dev_is_dma_coherent() needs to return true for an
> importing device to be able to attach. Since we should always have a fallback
> path this should give userspace the chance to still keep the use case working,
> either by doing a CPU copy instead or reversing the roles of exporter and
> importer.
>
> For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
> return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
> the flag for their buffers if special handling like the USWC flag in amdgpu or
> the uncached allocations for radeon/nouveau are in use.
>
> Additional to that importers can also check the flag if they have some
> non-snooping operations like the special scanout case for amdgpu for example.
>
> The patches are only smoke tested and the solution isn't ideal, but as far as
> I can see should at least keep things working.

Gentle ping on this. Lucas, Daniel and Nicolas you have been rather 
active in the last discussion. Do you mind taking a look?

Thanks,
Christian.

>
> Please review and/or comment,
> Christian.
>
>

