Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5902C6A27
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 17:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731882AbgK0Qua (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 11:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731859AbgK0Qu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 11:50:28 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72693C0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:50:26 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id x16so1326538ejj.7
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t1q1/SHKgIbW+C5B/mTAdQ8BsxcSyq0zUymWZe9rx3U=;
        b=ge2XywzPkpdxv9n/Fbs5vWEHA989qR/8Yox1ZRHLfL1xJSVMaIqd7r2X0hfJqySlWl
         MUDt/K1VtjFqQsHHOQBDcWjh9BqtMyF0ol3dlQdiybZobKY7sLJHvFb0vte1J1XIoGRz
         juKlidqO/OxMgfrKNYLPFyQQExhPFDMupmdj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t1q1/SHKgIbW+C5B/mTAdQ8BsxcSyq0zUymWZe9rx3U=;
        b=awWk1TxzqkG7MpH5ME3/NqU8Tue0gxwpA5yK/3PMTy1l8VirOMDYteYnVT98aYzjSQ
         OdHLB1kGxS3PymzfOBk9r7VtkZCsy9KmmSn6fDLco3ThCsenfCp1uGI1r9rpGgc7tZnj
         Ze5yG8o4OnEcnlwX5VO7uin/9+HP90X+5MqDSjaj1Jjgak+mFnluafPaTmAMs+6t0ah1
         QvJQsO4OoaUSFpbfpEJXWlj5Q34Lxu0DhWKJPVOYivW/98iiGMwX6nOGIAKdtf+UBK60
         mqdCRv0z9B59wzUTeaCQUj/q5uhOaCxuflATvQ9Tb3+UImWNwYHDk4je3vCJdBpBVEt5
         v66A==
X-Gm-Message-State: AOAM532AVIQH1hMC/mq3JQDp4ghsFiuWMloncX9Fcb0s+l6xSUeOLTPd
        C+1AjbrMPdpxWKv8z9O37sKF6/8b6mE/hA==
X-Google-Smtp-Source: ABdhPJxgLhwbezcmohndLRfV733/AiF0p3PzkrOIKQx6OQLg6TqPw3FqYJ43MGNZFyFcvL9332mYmA==
X-Received: by 2002:a17:906:adcd:: with SMTP id lb13mr8511981ejb.362.1606495824974;
        Fri, 27 Nov 2020 08:50:24 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id d7sm3471414edv.17.2020.11.27.08.50.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 08:50:24 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id s8so6209683wrw.10
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 08:50:24 -0800 (PST)
X-Received: by 2002:adf:f542:: with SMTP id j2mr11727842wrp.32.1606495823649;
 Fri, 27 Nov 2020 08:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
 <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl> <X8ENifLanjYuhF/r@jagdpanzerIV.localdomain>
 <509cc69b-39d7-4b13-f392-ebf25530c8fe@xs4all.nl> <X8Eq4V++hRsKuYSF@jagdpanzerIV.localdomain>
In-Reply-To: <X8Eq4V++hRsKuYSF@jagdpanzerIV.localdomain>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 28 Nov 2020 01:50:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D7V8hbdZv_VxAUHUBsbknJsWMaU=h=5j19Z-J8FL27FQ@mail.gmail.com>
Message-ID: <CAAFQd5D7V8hbdZv_VxAUHUBsbknJsWMaU=h=5j19Z-J8FL27FQ@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 28, 2020 at 1:35 AM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> On (20/11/27 15:56), Hans Verkuil wrote:
> > Yes.
> >
> > BTW, wouldn't it be sufficient to change this code to:
> >
> >       if (!q->allow_cache_hints && q->memory != VB2_MEMORY_DMABUF) {
> >               vb->need_cache_sync_on_prepare = 1;
> >               vb->need_cache_sync_on_finish = 1;
> >       }
>
> I think it would be sufficient.

Does it matter at this point if allow_cache_hints is set or not?

Best regards,
Tomasz
