Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 799E0252364
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 00:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgHYWLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 18:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgHYWLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 18:11:00 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CE6C061574
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 15:11:00 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id j25so133285ejk.9
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 15:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hMfzJvb3bssyfQ37ul9l9iixA3MkT5QgL2oMa2TRSL0=;
        b=wOuZYuoGCNRPZWHbOUu2+fJA0720LZyvSQZAsvdzHmozYqvx9gqy+y56yhGetak1hY
         0ZpH0AN34afF7sCXBNX1za3bo6VEv3zzifTgXX6NktsIb0KMECsyDGKURfkIGuHDYP7l
         2vNjvK5GRzzMhw930qnNFvFLO4U+OoPZL5m094zS+p1VYWRjrDEHbGSxNNj51Zz6WO1s
         ZiyoZK6bgROAVt3z1Eypl5YBuBJKIuUzkS8dmSmAYl3uXYnqEPUbHwQEx6RaRV+0lQWl
         BFyqbd0cR+wbFcr/X9k1q9CCWjlO/In+tr2E/EZFQcMhKqrQoeKYsWdzeLcVrkf5mvdH
         KzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hMfzJvb3bssyfQ37ul9l9iixA3MkT5QgL2oMa2TRSL0=;
        b=V5SFRqBm+D42H15XRMmVaJzMvPUn8uFrlA9Hx2b0zpZV4XM/DfpT9MyXbyIRF9hLze
         +1x1UMJe+lkHjV830NmI0OSA+ZukbLT+D1Vo92GhwKMNjUkV25H9N1RyYK9vzFtRyv8U
         hjRlJp+qUdr7XUtlPy6Y8Rd6/W2B2DYTSWssNiQ2JysYGcslCqXm9WLBQmjuu2vNGUUK
         Rv6QqjKqtpt4Aa2rQ+nxD1ZSwBAp/1opYHdesM4HOrFH+cueOcvSyytRKH0+e2QXv3Z6
         igcKYU+FHH/Dznkx8ksg3wuJvXgPwjbmFnzEASrZviNDIjLZ51sysbCV9+hTZh4iiHrR
         8exw==
X-Gm-Message-State: AOAM5331ys7QDduHh3jCRq3OPTsu9IT12y4HzwTaQB9mkajPWXqtV28n
        P9akoCnnkQzbMY5sJWcAPGQWfe9TP9n6UY34joLKFA==
X-Google-Smtp-Source: ABdhPJx4LA5bEbVNRkF5QKu0Ea3A4Jn3y6fRrWhFi3M9+6OzYNhiTovXthqJYi2GFnhSh/cNpK6ycu1jKn8rhuKDP48=
X-Received: by 2002:a17:906:813:: with SMTP id e19mr9245378ejd.141.1598393458608;
 Tue, 25 Aug 2020 15:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200825145556.637323-1-gnurou@gmail.com>
In-Reply-To: <20200825145556.637323-1-gnurou@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 25 Aug 2020 19:10:47 -0300
Message-ID: <CAAEAJfBbxExQP7cAQnsAE1_Zh-onBKPt8is3S9qBEpx6MAywRg@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: v4l2-mem2mem: fix poll() bug
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Alex,

Thanks for the patch.

On Tue, Aug 25, 2020, 11:56 AM Alexandre Courbot <gnurou@gmail.com> wrote:
>
> This addresses a very corner case that probably nobody ever encounters,
> but I have hit it when playing with vicoded so here is a tentative fix.
>

I'll try to make a more complete review soon, but meanwhile
I was thinking if it was possible to include a little kselftest program
for this issue, something CIs can pick-up and test corner cases like this,
making sure we don't regress on the issue.

(Or alternatively, v4l2-compliance?)

Thanks!
Ezequiel

> Patch 1/2 addresses the issue that when the last buffer of a m2m device
> has been dequeued, any attempt to poll with EPOLLOUT will result in only
> EPOLLIN being returned, even if OUTPUT buffers are still pending. The
> issue stems from the fact that the last buffer check if done first, and
> returns immediately if true.
>
> Patch 2/2 builds on the first one to (hopefully) clean up the code a bit
> and make the function flow easier to follow. Functionally speaking it is
> supposed to be a no-op and it can safely be dropped if the former code
> is preferred - the actual fix is in 1/2.
>
> Alexandre Courbot (2):
>   media: v4l2-mem2mem: consider OUTPUT queue first when polling
>   media: v4l2-mem2mem: simplify poll logic a bit
>
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 42 +++++++++++---------------
>  1 file changed, 18 insertions(+), 24 deletions(-)
>
> --
> 2.28.0
>
