Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D2B2C7036
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 18:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbgK1FHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 00:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgK1FE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 00:04:58 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830AEC0613D1;
        Fri, 27 Nov 2020 21:04:46 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t37so5829175pga.7;
        Fri, 27 Nov 2020 21:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1wR2Kvfb5vjG8T/PCijsWnV5/Q6MbpEzV8Vjtc0CiDc=;
        b=aHPcBfuVBnDc/UEbN7yMv5xeqS+GxfQGwavrxwH6cH4XS0raWlwle2tQKxQSUKmkN+
         ovcJzX6Y4PIz6fLFX2fxop62ys7QHTYbs/aY0kduavQ4HiA+m210l88xCcG0TrY0B0Xm
         lmQmrOENCW7G94Z2pZ765mi4uQqb1a7HPz8pyLn5vMtocTqCSfmnnk/Qri7m5VnMkItZ
         ovINqEOaUi17LvC+LfoKIOhByqt8svCwXXmEgQ6cvZdzzygDmK09fMWf0iGCniTz4F8e
         rHIvaVcboSMS+SweQeAfQOyp0TC1iUkw4teva/lt5tG2QUOiG9S7raHKEdoWNtD4Rv8D
         7onA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1wR2Kvfb5vjG8T/PCijsWnV5/Q6MbpEzV8Vjtc0CiDc=;
        b=VCaUBwWUK4LqxWUIkXjKGsHDLPvhoYrPqfdef8hP2ypjX0Pawy0Ft1NgWklxM/XSTi
         lZzCSRSrbJmghyX6PUjpzhQqzHk1zMN9HX3YvtUZ+iU4bRtnPANREHeIAPiUZ3UXTN6u
         bN7XnpdVIFuD4hDf/yJnSByNUwxDAfmXV6j6wXMQ7T/+xMfbPFeWzxsuwkQAmQ3AO+jM
         IhEaP9i3+iwXozU4O5gW9O8jYwGN/yyKreIAqfzkxe+ryapyagmH2lXz1rE7cESgj96W
         zVoj4jklusQtKxSFDp90Q35uJF/I53/HujNXshyOBAtoLKY/dCRN8kdw6PdfWa4bCTyO
         YDFw==
X-Gm-Message-State: AOAM530K1J7lQ2Tx+wX7980RyoNr8EY/htsoFgq8sZ3gsocogCLgjQx0
        qOTyeT0h/OvnjBFRLK9be+s=
X-Google-Smtp-Source: ABdhPJzsOXkBhwfr1TmkLRRXWfCd9IStAbkq9v8eVF37jWLr9Az9kmV3sWjW4/TAXnLRPPc+Up7oCQ==
X-Received: by 2002:a17:90a:e386:: with SMTP id b6mr2978528pjz.134.1606539886076;
        Fri, 27 Nov 2020 21:04:46 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id p14sm13192489pjo.53.2020.11.27.21.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:04:44 -0800 (PST)
Date:   Sat, 28 Nov 2020 14:04:42 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
Message-ID: <X8HaalHqzUYiopAn@jagdpanzerIV.localdomain>
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
 <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl>
 <X8ENifLanjYuhF/r@jagdpanzerIV.localdomain>
 <509cc69b-39d7-4b13-f392-ebf25530c8fe@xs4all.nl>
 <X8Eq4V++hRsKuYSF@jagdpanzerIV.localdomain>
 <CAAFQd5D7V8hbdZv_VxAUHUBsbknJsWMaU=h=5j19Z-J8FL27FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5D7V8hbdZv_VxAUHUBsbknJsWMaU=h=5j19Z-J8FL27FQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/28 01:50), Tomasz Figa wrote:
> On Sat, Nov 28, 2020 at 1:35 AM Sergey Senozhatsky
> <sergey.senozhatsky@gmail.com> wrote:
> >
> > On (20/11/27 15:56), Hans Verkuil wrote:
> > > Yes.
> > >
> > > BTW, wouldn't it be sufficient to change this code to:
> > >
> > >       if (!q->allow_cache_hints && q->memory != VB2_MEMORY_DMABUF) {
> > >               vb->need_cache_sync_on_prepare = 1;
> > >               vb->need_cache_sync_on_finish = 1;
> > >       }
> >
> > I think it would be sufficient.
> 
> Does it matter at this point if allow_cache_hints is set or not?

That's a good question. I'd say that it'll probably make sense to set
need_cache_sync for as many buffers as possible, regardless the queue
configuration (except for ->memory type), just to stay on the safe side.
I can spin another patch version.

	-ss
