Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5A12694CD
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 20:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgINS06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 14:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgINS0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 14:26:51 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471DDC06174A;
        Mon, 14 Sep 2020 11:26:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so1323221ejb.8;
        Mon, 14 Sep 2020 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rRCccI3O7Q3cBqCSADJ9p4p+tEsMBm/uVKtxbUUahJg=;
        b=AHU/AtiFLbe3+YZTSiSO41xN3EYAURxPkCRh+hyV2jBoPZbsqwzbhpl0akYfJBMPh2
         GdoV/jU0y46ZvoaNtPW5sVRWLONy7foziuLCeS1APrEX8izp6/it+zrdWHvQUOjPECV8
         kB7W1+i3+4RQmCjcYSgt8GmVX60YbKXvrYQ935YbMGmcC+Y3RrmejwX9MuUqN/4gxW+w
         p9wyDOyjmoAnidi0YOCj7SvrMJ4axu2Wgsuk7CwANUckz/Frkghi87fW2cv/ABBYL0YV
         xb4eWMau1U5Byo4YNt3vlVYn6A8mZH4KW40UkwdZmk/fyI2XhIUesHolLHBTj+uM0sjB
         W+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=rRCccI3O7Q3cBqCSADJ9p4p+tEsMBm/uVKtxbUUahJg=;
        b=aSr6mDncjpypoZ7ldivJ6EpLYm/PQM6LSDKrcCXkfPA2vSk7EPQSCsYIlaExJAVZju
         IylBuG1kGUpVFjBVPZgnSNJrFPaT8ciAsgG6X6Ita54ZxWjLhJHudtwaLwTTVEsBJ2HH
         /Jo3bYJ0EgmxwOtYAtemTOvb22JQ70Kvk0V6GBx60dPoHwTldzbFiwoLcIfqOaEt5PRS
         W+cgneKnfFKgGg3zj6LEI3P4okr7Vqbz/43NlONmgl/LoF3z0Sboc6DZwq2Ix4PRunly
         0phAtjnFTzETtm3LJ6x3N0EoEQMqPbl4/9yLavSlNB+hn3NAIlkaBgiyM/O+HUC7Htyp
         Nczw==
X-Gm-Message-State: AOAM532oKIk8bgiLfmBzJbONumUNUy4mqi3q3t9X0VfNhK4f5v42FvA0
        YxLhPfU3msrE8JIfiBXepqU=
X-Google-Smtp-Source: ABdhPJz2+wxT5cFNCOXfBWV9IOT32aJMuEc+G7OyK+aP3oDWfuWU/cXhqKfbYJVkKAeo1FWAagaPJg==
X-Received: by 2002:a17:906:a101:: with SMTP id t1mr15720702ejy.203.1600108009977;
        Mon, 14 Sep 2020 11:26:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id b6sm9871930eds.46.2020.09.14.11.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 11:26:49 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     akpm@linux-foundation.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
Date:   Mon, 14 Sep 2020 20:26:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914140632.GD1221970@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.09.20 um 16:06 schrieb Jason Gunthorpe:
> On Mon, Sep 14, 2020 at 03:30:47PM +0200, Christian König wrote:
>> Am 14.09.20 um 15:29 schrieb Christian König:
>>> Hi Andrew,
>>>
>>> I'm the new DMA-buf maintainer and Daniel and others came up with
>>> patches extending the use of the dma_buf_mmap() function.
>>>
>>> Now this function is doing something a bit odd by changing the
>>> vma->vm_file while installing a VMA in the mmap() system call
> It doesn't look obviously safe as mmap_region() has an interesting mix
> of file and vma->file
>
> Eg it calls mapping_unmap_writable() using both routes

Thanks for the hint, going to take a look at that code tomorrow.

> What about security? Is it OK that some other random file, maybe in
> another process, is being linked to this mmap?

Good question, I have no idea. That's why I send out this mail.

>>> The background here is that DMA-buf allows device drivers to
>>> export buffer which are then imported into another device
>>> driver. The mmap() handler of the importing device driver then
>>> find that the pgoff belongs to the exporting device and so
>>> redirects the mmap() call there.
> So the pgoff is some virtualized thing?

Yes, absolutely.

Christian.

>
> Jason

