Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BB428AFB4
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgJLILg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgJLILg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:11:36 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7838C0613CE;
        Mon, 12 Oct 2020 01:11:34 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id t25so21885246ejd.13;
        Mon, 12 Oct 2020 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=M1NhPSK8WcpTtZeyW8ggYwirkBLqPyAO/qcKCJS3Ci0=;
        b=hooBfwk+2I80d0Ms8XxtPp3CfKDIx3enCApEOuuytF3Anb8bHKoLNqZfbtlJbU56Hb
         yNwF7zdbzJAkZQVna9Si5mcidbKO5VoSKaNZpmIZIrXhFaGg0IHkXmRwRBHAoGB1ddD9
         ZKw3QjFBs+o7tQRDviU6aBtv/ckgsVeO558kbxdQAJXW1toWHTWlxDplYsvVyD2f/odt
         i/g0Botby3AkC2oTpABiBaKl/jcVCDz9nRj9CqvSQ8rBj7gVuIpkRNy85vuRePFfd4Rp
         cBlY/IUcu4KNrcgO3at/VEVS6tfMIxZ6VUZRaJBSrNxFxh53vobe1uI/OhZJbjdkg32x
         Y+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=M1NhPSK8WcpTtZeyW8ggYwirkBLqPyAO/qcKCJS3Ci0=;
        b=Sqit7FoOkWwFdZtQfFuK3jDIKx/+Izqmvw7mOBB8gkh2IOR+jrft+m0ZndwT/djinC
         UysFssBHEmBc67dl5S0qPpPWqvSkfHCvlTTtpHovVGctfVLKqCr9nPqu7VU5rnHlhb9c
         eRrTmEHnThv8qEsDgNCQlCTSfirMggDe4Fn4Tvnam9mb3TADtjCkWvb36VvXpIjyvSyA
         DuGoBEgm63FnejNaY2LSsEy9X1rBAuBytptluFBj1YEhxhAtRHmcVnDkvSx7ZV3ZAtYW
         T5WKAXxDw8zWviwvliu27XVDMMgOq//ELqUxKKlQDPzLLqP3tABCawZE3PUYYrueg2fq
         SNhg==
X-Gm-Message-State: AOAM532hWM2wQ7vYQNF6j+f1UBqExnYvfGFCN8xRDsYXwE952q0Oagrh
        CGP80efQXvHaCcl7LzZlOZg=
X-Google-Smtp-Source: ABdhPJweeE2yP6VxtQZod6lD2VKbJ5vhzDztVRMAHk7/HnG5S/RU3E8nwHmSCPtcnJZtER6cRV0qzw==
X-Received: by 2002:a17:906:53d7:: with SMTP id p23mr26383911ejo.232.1602490293318;
        Mon, 12 Oct 2020 01:11:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id j18sm10177649ejc.111.2020.10.12.01.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 01:11:32 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 2/6] mm: introduce vma_set_file function v3
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150342.1979-2-christian.koenig@amd.com>
 <20201009151418.GW5177@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9592e3da-a105-b0ec-3fb2-be349c464c2c@gmail.com>
Date:   Mon, 12 Oct 2020 10:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009151418.GW5177@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 09.10.20 um 17:14 schrieb Jason Gunthorpe:
> On Fri, Oct 09, 2020 at 05:03:38PM +0200, Christian König wrote:
>> +/*
>> + * Change backing file, only valid to use during initial VMA setup.
>> + */
>> +void vma_set_file(struct vm_area_struct *vma, struct file *file)
>> +{
>> +	if (file)
>> +	        get_file(file);
>> +
>> +	swap(vma->vm_file, file);
>> +
>> +	if (file)
>> +		fput(file);
>> +}
> fput crashes when file is NULL so the error handling after
> unmap_and_free_vma: can't handle this case, similarly vm_file can't be
> NULL either.
>
> So just simply:
>
>   swap(vma->vm_file, file);
>   get_file(vma->vm_file);
>   fput(file);
>   
> Will do?

I was considering this as well, yes.

> Just let it crash if any of them are wrongly NULL.

Mhm, changing from anonymous to file backed or reverse is probably not 
such a good idea.

So yes catching those problems early is probably the best approach we 
could do.

Going to do this in v4 if nobody objects.

Regards,
Christian.

>
> Jason

