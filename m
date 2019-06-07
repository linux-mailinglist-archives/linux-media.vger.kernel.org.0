Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8966638A10
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 14:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbfFGMVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 08:21:04 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41266 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbfFGMVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 08:21:04 -0400
Received: by mail-ed1-f68.google.com with SMTP id p15so2746453eds.8
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et66kuYJtdWkXN7itoFMJhzhVrf8MDUbX5DkuPDQ9Sw=;
        b=lpDWmaz9yrSzgPwwJqKLjY6ODVocmY/1CLpbER80CSmkcX7DaYeIZOwmtMrIWKL2gZ
         HZL1UAVoJGQF7vYz+13pb3XgvZSXLRI5+CMIqlFL+AOmV/WjNoSqznXP2x9o3PUoajpQ
         YSgB5jbX3dSm5R+HX25lPMqffvh929tLsz54Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et66kuYJtdWkXN7itoFMJhzhVrf8MDUbX5DkuPDQ9Sw=;
        b=mRgUmOQ7XAU0xNyX6PAf44yFVnE0NSiCTigi2FB0AV5HEVe/rXifTQ5TMmuku74reF
         iBItdP4tweRPinS4+cXozFW0lvqyxvOIN5FOvG11jLLoJs+56u0Jj3WipAqUPqzeGRnC
         ivXwrnZVUEFVqbzKYTLwk3EUqSGCGeEkQpqqk3ZnCxUtvCVpKEuQUqA92yZcl48yYJTL
         /c12W5EPY+kMCLbloOzKHevPHrZBgIMfEvzeBUT6QAvNooDS5kqODUS+aJvutfjm2/vn
         9LBdS6xmkdJ2lsFLjJw7GBJFfZBciHFf6Xq6dwRzvPdYMHS9ehCB8R2PhjDLrQqQ9s6j
         tM2Q==
X-Gm-Message-State: APjAAAU5WBfwpCUPrJbj8dsqLYB4eASG+biP0KMppsH8lFmH7wmL+p0e
        wQMm2YpAg7w5mD9bptO3/QHAiXp0yhxU1w==
X-Google-Smtp-Source: APXvYqw9b59uiXRzWRyxIOn8q/a58qoyY0aFqi+LLi6rseLS44WBUJK1qnodISm1TDfvxCssMiXyHA==
X-Received: by 2002:a17:906:892:: with SMTP id n18mr20170173eje.10.1559910062154;
        Fri, 07 Jun 2019 05:21:02 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id m6sm477153ede.2.2019.06.07.05.21.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:21:01 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id x15so1855883wmj.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 05:21:01 -0700 (PDT)
X-Received: by 2002:a1c:407:: with SMTP id 7mr3750531wme.113.1559910060761;
 Fri, 07 Jun 2019 05:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
 <20190607111634.GA7593@pendragon.ideasonboard.com> <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
In-Reply-To: <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 7 Jun 2019 21:20:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CTgm0bimJOzdFUdM35Bro4xsLwa698E7pR_hQ=ebaM3g@mail.gmail.com>
Message-ID: <CAAFQd5CTgm0bimJOzdFUdM35Bro4xsLwa698E7pR_hQ=ebaM3g@mail.gmail.com>
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR memory
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 7, 2019 at 9:01 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
> > Hi Hans,
> >
> > Thank you for the patch.
> >
> > On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
> >> The __prepare_userptr() function made the incorrect assumption that if the
> >> same user pointer was used as the last one for which memory was acquired, then
> >> there was no need to re-acquire the memory. This assumption was never properly
> >> tested, and after doing that it became clear that this was in fact wrong.
> >
> > Could you explain in the commit message why the assumption is not
> > correct ?
>
> You can free the memory, then allocate it again and you can get the same pointer,
> even though it is not necessarily using the same physical pages for the memory
> that the kernel is still using for it.
>
> Worse, you can free the memory, then allocate only half the memory you need and
> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
> the original mapping still remains), but this can corrupt userspace memory
> causing the application to crash. It's not quite clear to me how the memory can
> get corrupted. I don't know enough of those low-level mm internals to understand
> the sequence of events.

Chrome specifically didn't keep the mapping between user pointers and
indexes, so it the cache just missed every time. What we noticed was
the put_userptr on the previous userptr at the index being unmapped
apparently caused that memory (often already returned back to the
application) to be corrupted... But we didn't get to the bottom of it
either, as we didn't have any MM expert look at the issue.

The free and realloc scenario just came to my mind when trying to
recall our original problem earlier today.

Best regards,
Tomasz
