Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7527D30B25F
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 22:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhBAVzp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 16:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37336 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229515AbhBAVzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 16:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612216456;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k1y8GmyBWVCl6Pbg+0+AjclhMsvzhPPIsTiKTMZg/W8=;
        b=TlCl3jwLi0cHEMhszOqJjXaPIaW3BA2VtJTEz5zMCOfcJZybB+GfkIRmv+pVTvs5uWX9ue
        tIGS5LG1nfifbQA7iGXwUZd+003znXWAvVLj8BxgT6FPc2CwO4K5rIf1enDSgaY8DWGg/+
        bXxndcv1JRq5wWrZJSPUB4Azkl3DCsw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-DZq6DEZ-NZWTeMd9sY9IQg-1; Mon, 01 Feb 2021 16:54:12 -0500
X-MC-Unique: DZq6DEZ-NZWTeMd9sY9IQg-1
Received: by mail-qk1-f198.google.com with SMTP id a75so14356024qkg.16
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 13:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=k1y8GmyBWVCl6Pbg+0+AjclhMsvzhPPIsTiKTMZg/W8=;
        b=U1FTtAU9pYyTU00jFwXQfioQGwXy/GSgjhSNodLG9rehIduOj881TQ8Djpbf6k0efz
         f3FaWJNaPP5OkWn5BWc+203z8UucXd/JQ3OF5t7MLy6q9SYJ9/rqwYa1wsjHh3xs0dn/
         oP2K3l9N0IZ0PAdgYbK+iDhLMHmczW9/WME3FVg7FZfGo37Koh+JX/g5JiO4bf9bnkPz
         e88tZigf9xI6TiOdCtVfO9IkoZgb/qDGi+m13xS3T8KgZ9iuSb4OqUaUuXuJjZLwCIkq
         m49KMEl78P/Ngzob0p/h9hwuSQn8Og4JJcbxwr+f3QfpnRCN2VuSJyA6aZgZOEaSJX2r
         P7Kg==
X-Gm-Message-State: AOAM532FkFqDEiqchuJQx3Bk/faKmU++M0BnTRpJk39tJQ5l8LdegL6P
        Gq1aXGTf1Wh2EzKvjFvzNg47LTlwG7+/eEkUH9u3ss9BwgIC6nOE0YwBTC5NvbwTCS5okxuykBZ
        16lNzoWY/yE8U6pOmNJyM0nk=
X-Received: by 2002:ac8:7c82:: with SMTP id y2mr17011496qtv.67.1612216452074;
        Mon, 01 Feb 2021 13:54:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5ooeTglnEBcbFwXF8LDaJXBhwXBklXKKqPeeM2J3NXPjrz+y63QFGy+CKyScLNX3h+7tlpQ==
X-Received: by 2002:ac8:7c82:: with SMTP id y2mr17011488qtv.67.1612216451917;
        Mon, 01 Feb 2021 13:54:11 -0800 (PST)
Received: from Whitewolf.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id b13sm12085730qtj.97.2021.02.01.13.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 13:54:11 -0800 (PST)
Message-ID: <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
From:   Lyude Paul <lyude@redhat.com>
Reply-To: lyude@redhat.com
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Joe Perches <joe@perches.com>,
        Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Date:   Mon, 01 Feb 2021 16:54:10 -0500
In-Reply-To: <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
References: <cover.1598331148.git.joe@perches.com>
         <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
         <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
         <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is entirely unrelated to this thread, but I noticed when going through dri-
devel that this email is somehow dated two days in the future from now.

On Wed, 2021-02-03 at 14:26 +0100, Christian König wrote:
> Am 30.01.21 um 19:47 schrieb Joe Perches:
> > On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> > > Use semicolons and braces.
> > Ping?
> >   
> > > Signed-off-by: Joe Perches <joe@perches.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Do you have commit rights to drm-misc-next?
> 
> > > ---
> > >   drivers/dma-buf/st-dma-fence.c | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-
> > > fence.c
> > > index e593064341c8..c8a12d7ad71a 100644
> > > --- a/drivers/dma-buf/st-dma-fence.c
> > > +++ b/drivers/dma-buf/st-dma-fence.c
> > > @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
> > >                         dma_fence_signal(f1);
> > >   
> > > 
> > >                 smp_store_mb(cb.seen, false);
> > > -               if (!f2 || dma_fence_add_callback(f2, &cb.cb,
> > > simple_callback))
> > > -                       miss++, cb.seen = true;
> > > +               if (!f2 ||
> > > +                   dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
> > > +                       miss++;
> > > +                       cb.seen = true;
> > > +               }
> > >   
> > > 
> > >                 if (!t->before)
> > >                         dma_fence_signal(f1);
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

