Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F783AFD1D
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 08:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFVGji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 02:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVGjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 02:39:37 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD89BC061756;
        Mon, 21 Jun 2021 23:37:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id s6so22080123edu.10;
        Mon, 21 Jun 2021 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ARIuYpj0vICVBtmBb3c3c4gAgJZM8iqcs3K8o/EZTjo=;
        b=iUMD7Hk4c0JkMp0x+Dln9bhYJl3rjQlccq+p6tXmffk7ioCjS8gyxJDmuE2F7hDSBG
         Q0jOeZOZhTzxMfBICEbNTh9/Hq32KI8q0jafUrAZCH9VDqxOdZz0dXaIFuqWf8JraUMB
         pi0Wp3RzfTBmK6ItILEqsfyOYMKzBA297ivkmXyjnj0CS/vsXqIHIXrlTmB1v2H6XbwN
         wOKF5bKVP+qVPcmezEpyZoFS/gYtwvIJqwfbPTI/O7tFB0pWdBN4wRsabWnEMOS1aLPZ
         c1zX7Y9N87rIPOQ08tAtdwRUrJ4Xm0aYh9w4Yz9mk8vxFfb+XAlj6yNpGBCFeU8xa65N
         a8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ARIuYpj0vICVBtmBb3c3c4gAgJZM8iqcs3K8o/EZTjo=;
        b=pmVL2CEKaULl3kDCOIvZs61ZwcLIbMmea22cT93FAfmtLjR0y3BRnsTihvePxesXXp
         WzwU4vnjAHaEFKzD04QD/4YnEc+GnAR7U8fahjoKeS4cz9KwXO1M2yzkP/8fvzyweqzM
         skf/700GGS2KN2dhJUItTAHHBMbbgBTjRKeFrSMXvBJsHrDzbugxTx/GbepupZOJzlmz
         ZmcrTlh9c02xcwTcd4fiR9hdUP5P7OycO2AJxhVmojCqnApkrMOP7sNh4NMfx2GGc2If
         KV5j6fRG4fFgdo0Z00IJrolWINGhkVyCP0ACX4qGAaaiIKcoPxzh0dbY2defDkYilkdS
         qCEQ==
X-Gm-Message-State: AOAM530NKNcfDzbYbuR0yekFAEzNgN8Hik+fiTw/q/1+Fc19RFOtUAUc
        wHPcnUEkLvkx6AH48aFsjdBijxc5eTQ=
X-Google-Smtp-Source: ABdhPJwiVGo3pmIkaPSyoKltDY97MiB1i1xd6tbT4Ywmxox6TqJUxOsJ5UQwUuiz7VochB1nnWV0Fg==
X-Received: by 2002:aa7:d34f:: with SMTP id m15mr2693414edr.311.1624343837985;
        Mon, 21 Jun 2021 23:37:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4? ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
        by smtp.gmail.com with ESMTPSA id f14sm1006382edd.69.2021.06.21.23.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 23:37:17 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To:     Jason Gunthorpe <jgg@ziepe.ca>, Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        Tomer Tayar <ttayar@habana.ai>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
Date:   Tue, 22 Jun 2021 08:37:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621232912.GK1096940@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
>
>> Another thing I want to emphasize is that we are doing p2p only
>> through the export/import of the FD. We do *not* allow the user to
>> mmap the dma-buf as we do not support direct IO. So there is no access
>> to these pages through the userspace.
> Arguably mmaping the memory is a better choice, and is the direction
> that Logan's series goes in. Here the use of DMABUF was specifically
> designed to allow hitless revokation of the memory, which this isn't
> even using.

The major problem with this approach is that DMA-buf is also used for 
memory which isn't CPU accessible.

That was one of the reasons we didn't even considered using the mapping 
memory approach for GPUs.

Regards,
Christian.

>
> So you are taking the hit of very limited hardware support and reduced
> performance just to squeeze into DMABUF..
>
> Jason
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

