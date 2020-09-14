Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B65268C49
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 15:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgINNgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 09:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbgINNbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 09:31:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFB2C06174A;
        Mon, 14 Sep 2020 06:30:50 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id c8so17618037edv.5;
        Mon, 14 Sep 2020 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MJZms6QlGOYEjnVyjgzH8924ZUFCbrOAjhB8S+SOw0Q=;
        b=AZo4Zrph06jSQFMyghqg1VeH/uJOLm2FTxlr/lwLz7LcGc0dGWMtJGTGfIa56pfqRD
         SfHBHsrbfH2iLoCUhK/MZHqrDpM/JA26F/AGyypmlC8llez2CWnSY5tQ3e2HcDw2L9BQ
         Idd41N3fpgLMR5/YftegmeplJ+0U4knjuLatzRauZq3iLjrWvmUDIVY8+gM3rBhrXqyO
         5fAQ4JfxeJMiJ3yLE4UMugQzETfzbzi9LiAlrW8D3PaHaUUg0XX1Gb8R/XnjddNgeN8y
         hPH3z3PjWYW7jYaLwy++Ij502YqCHABMpErfK7GUyDUDXbvFsj5PDRunJeTmU9KmumUU
         4vjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MJZms6QlGOYEjnVyjgzH8924ZUFCbrOAjhB8S+SOw0Q=;
        b=tQmopRIchFop1uP8VbwCaVFZ38Ji6uyJg5aChIM+up+wbszWk8dnt+SY4Vc1l82zda
         MKSpF0bFvC5sFZOSoAnRKEhjLtqKB0ZzgEUyndwMRxsZIefEIN+QgPt6OVdzhnYFtlsD
         a9+TwJNejZk1/TCcOuzlo8rkGWXi2APaKhKIW7eBCgqCoJ9JknG7NDNov2VLq1WiXdFz
         PuhHpAtl/yFVi5ytb+3i6l8HP4tx8P7ECSfEiCcAB68cxI5/nehF+HquiZZILzAvHeAW
         8mm1iQ9Juy9tIuopYVrTZBTibaiC2P598q9OCGrMG29tlY4VNmj5mDppHA/LyvUaw/Oe
         oXpA==
X-Gm-Message-State: AOAM530obYZ4wywoWW6KVjRUXb2i4847/L/dNp3H8xoPrpwFlkNo47+T
        h/EtiiPRi1iTgT827CFU6BNAKs8x3fY=
X-Google-Smtp-Source: ABdhPJwM5ZL8+pefIM8N8Pp/HAs1Da9AhS9+TCqXwmw1+Bfwc5H4UJw/fibBFv4vSEBRyYvPybunNQ==
X-Received: by 2002:a50:fb15:: with SMTP id d21mr17942730edq.150.1600090249097;
        Mon, 14 Sep 2020 06:30:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id nh1sm7646664ejb.21.2020.09.14.06.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 06:30:48 -0700 (PDT)
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     akpm@linux-foundation.org
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200914132920.59183-1-christian.koenig@amd.com>
Message-ID: <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
Date:   Mon, 14 Sep 2020 15:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914132920.59183-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.09.20 um 15:29 schrieb Christian König:
> Hi Andrew,

Sorry forgot to add Daniel as well.

>
> I'm the new DMA-buf maintainer and Daniel and others came up with patches extending the use of the dma_buf_mmap() function.
>
> Now this function is doing something a bit odd by changing the vma->vm_file while installing a VMA in the mmap() system call
>
> The background here is that DMA-buf allows device drivers to export buffer which are then imported into another device driver. The mmap() handler of the importing device driver then find that the pgoff belongs to the exporting device and so redirects the mmap() call there.
>
> In other words user space calls mmap() on one file descriptor, but get a different one mapped into your virtual address space.
>
> My question is now: Is that legal or can you think of something which breaks here?
>
> If it's not legal we should probably block any new users of the dma_buf_mmap() function and consider what should happen with the two existing ones.
>
> If that is legal I would like to document this by adding a new vma_set_file() function which does the necessary reference count dance.
>
> Thanks in advance,
> Christian.
>
>

