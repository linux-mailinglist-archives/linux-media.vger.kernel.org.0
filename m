Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66513F6D91
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 04:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237089AbhHYC4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 22:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhHYC4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 22:56:52 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BABDC061757;
        Tue, 24 Aug 2021 19:56:07 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id f15so16717597ybg.3;
        Tue, 24 Aug 2021 19:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pxKw4tRuZtKuPCdNSY/EysbIdH1gs3HBF9BpV8F9Ogk=;
        b=uehHByBLfMYSppbrT9JQ0EwN0xsr9EgnNqtXsWJh3aLa9jBY5ujxZPtkifnmn9E0Zv
         HqsVTK4+yq+OZFCkN4gfmZKCqObAeSNuf+iwltqG64kNLM8SZdE4TEl1gQgXBklysRVo
         E5jQNY1blHfLIJUoocRLbbyhV3L1BW5ZBmig2d6n+qnvGvSCXgqQbChh8p6xicVqqlYS
         3Wazq/nHOPZAqNcYkEzs2dqAR3XYMk0X3WU8zQYBaHW8MuhPteP1BacykT8h/0fZgo3d
         7W3iof1VMY1lOsqYYF9bU/+3DvY17ZM3+F8h3CDz5QH1UCB8qm/aabof0ELAagNhUNUm
         cICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pxKw4tRuZtKuPCdNSY/EysbIdH1gs3HBF9BpV8F9Ogk=;
        b=dJP/REluS6Wrvld1iIJHlXwE4VMGkKtCARX7gg2XdFKg2yPlRxHXOiXnW928JEIMzg
         tK0RGj2yFU+95U91gOWyn/a3iWpQ83U8GoF7yx1/Ov8+8KehrlZPR+RqsEyroGk4P1+7
         nBR+R2LfT3EnQvA9TwamXf3yeV4Sqr/Nj0iGB8AXDrBnkRYF6iGVID60S2P/l1K88lnU
         66PpBMEojKd2P4t/+UI/gzX+NqAZ1B8+Ngbr0b1FHiOEVVu8n39VFmCecKFOQQWe8yYp
         9bf/vvVy5ZGdeM9Hv0iGXOJL6VOHQ2Kpj2mO0JwoFRS9Y5e2PhJ4strW/f/b9PGePjLW
         W5yA==
X-Gm-Message-State: AOAM532H3/kr+9+H7eER40KKgx2jW9AdpCtBoL31mkgbIYtzvka8iWB9
        QOy/uOy5VsU3oXcoP3huD5zEP9udT4gjhSRJga4=
X-Google-Smtp-Source: ABdhPJxttWTWhhNXOIbqVzytpGheVCCSEsWFn7/PRD/Jddj1cGxqcjzcvdDAGEM5a3XBv7NjRt7J6cgkEvbpasBjXHk=
X-Received: by 2002:a25:b991:: with SMTP id r17mr27740903ybg.92.1629860166328;
 Tue, 24 Aug 2021 19:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de> <20210819133128.45ef4353@coco.lan>
 <c56ec571-2278-95e9-2028-990e03159c3f@web.de> <20210822194709.4b9d33d4@coco.lan>
 <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de> <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
In-Reply-To: <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
From:   Manu Abraham <abraham.manu@gmail.com>
Date:   Wed, 25 Aug 2021 08:25:57 +0530
Message-ID: <CAHFNz9L29LK+L8LjqyTyqq3LsvzeA6iYFHwP9n3uNBbqbbm1bg@mail.gmail.com>
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 23, 2021 at 10:30 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I have reverted the header file move. But I would also heartily
> recommend that whatever user program includes those headers (VDR -
> anything else?) should take snapshots of these specific kernel
> headers.
>
> I'm not convinced that it makes sense to move the av7110 driver back
> from staging - it may continue to work, but it _is_ old and there is
> no maintenance - and I would certainly suggest that any other
> out-of-tree driver that uses these old interfaces that nothing else
> implements shouldn't do so, considering that nothing else implements
> them.

Sorry for barging in between your discussion, but it seemed like you really
missed some perspective and hence.

My 2 cents worth:
* Revert the header changes.

* Let someone else with knowledge of it take over the maintenance
of the av7110 driver.

  - This would allow other hardware also to be easily accommodated
in a similar manner.

* Pull the out of tree drivers and allocate maintenance of those, to
someone who understands them. Don't you want more hardware to be
supported out of the box ?

Should there be no driver for those DVB output hardware, but only for
V4L2 output devices ?

There exists other hardware which As a person who worked on another
av7110 like driver (saa716x based s2 6400), which I can confirm.
The API is supposed to simplify life, not make it even more complex.
These devices would need lot of workarounds to work with the API that
which Mauro advocates, which might even break those drivers given
their complexity and size.

It would make life a lot easier for the users, Mauro himself and
this long never ending discussion can be put to rest.

Thanks,
MA
