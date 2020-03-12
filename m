Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC396182D3B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgCLKO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:14:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40344 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgCLKO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:14:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id p2so6643875wrw.7
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=99zCoGvBDUcvfpO9a9LFfTGeDECAtBMxFB8De2EMWp0=;
        b=DMpTpwApva9r8u9lx0Op6r/whtC4At15bKd8fkbJdGqjQmio4yaGOYfzdcgindAbK5
         a7IJacyFiFVDhWiooi8BZ1gmXDW51k7Cu4OwA92puB3ehtgeShNeQm/yORTN/rMIZsjP
         x0tnmnRUeruhgJD/DksHtunDqv65HV+HpSFPKh0Ag5N2owWZVZjBtZ8Fi2gskr1OTNEa
         k1KAwLcYReLu0/Qda9qtjPmaxH1fDxytxmTHE5Jbwl32hEe/AM4Fshde1kNpgW97hYwD
         iOh3Hmoez2s6Q7A52Ek10fpT00nYOdsHcoamPgYGt59j9pogB7fbSq3yLAAu1i7xfBRK
         0AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=99zCoGvBDUcvfpO9a9LFfTGeDECAtBMxFB8De2EMWp0=;
        b=DW0hcvbPR1yKTpHttv4qdzjjzy3GtIjfYkuij3oeu7vs9ur7cgpEI5Hx9cxaOvBCQ7
         Ev2eqUFPpiID0FTQSWtcLlymhOqJL6ZQRfYaDYs6HKNbRyCspzWQIScKOmUK5yzWkxJH
         3W7ck318H1vErJ6xZ2f87lcox68U8vivO8tAZI6YRkQgC56in9I57h6UHsimKjGdU0aP
         J4JjWq+YygD7aCU/volxuoVTvBiK9+FAlyA6AMcvYu1c6vxWZhbs4HflWyR6ViUD6CA+
         GOiL27qAu8fN92oKJZ3+oq6bHvHFTy4DJ8ZdZHEmbQIjLX2GCVfcdabE0q96VgTzsM8Z
         W23w==
X-Gm-Message-State: ANhLgQ09DowFzOsbnuKx3bKJ7HfptG5jbapAFQSJ10rIwhKXZdf15w4U
        cN8e9ixwxDCHbHxYa9L33Gs=
X-Google-Smtp-Source: ADFU+vt9s8OYMtKOql4lFTOfhZHcw/9Pzcas2QNpKDhr/rEHArSKwzODj38Q68fYVw1jBI8UvymV/Q==
X-Received: by 2002:adf:db84:: with SMTP id u4mr10434358wri.317.1584008064004;
        Thu, 12 Mar 2020 03:14:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id a9sm27966191wrv.59.2020.03.12.03.14.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2020 03:14:23 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
To:     Christoph Hellwig <hch@infradead.org>
Cc:     David1.Zhou@amd.com, jgg@ziepe.ca, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
Date:   Thu, 12 Mar 2020 11:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200311152838.GA24280@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 11.03.20 um 16:28 schrieb Christoph Hellwig:
> On Wed, Mar 11, 2020 at 02:51:53PM +0100, Christian König wrote:
>> This can be used by drivers to setup P2P DMA between device
>> memory which is not backed by struct pages.
>>
>> The drivers of the involved devices are responsible for
>> setting up and tearing down DMA addresses as necessary
>> using dma_map_resource().
>>
>> The page pointer is set to NULL and only the DMA address,
>> length and offset values are valid.
> NAK.  The only valid way to fill DMA address in scatterlists is
> dma_map_sg / dma_map_sg_attr.

How can we then map PCIe BARs into an scatterlist which are not backed 
by struct pages?

Regards,
Christian.
