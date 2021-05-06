Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2235375D30
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 00:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhEFWcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 18:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhEFWcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 18:32:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4708C061574
        for <linux-media@vger.kernel.org>; Thu,  6 May 2021 15:31:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2so10068698lft.4
        for <linux-media@vger.kernel.org>; Thu, 06 May 2021 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=htNAnGunm2mFYSv2XzhlQsCDD0LeBwjAb0MYMtun6cM=;
        b=BORPcZuE9+rrQQNFUoJnt6f4FpTDIRpdNZeTdxMdbIECzBdY5oiwCD0JpZedlSNZ+7
         bix+fDrgKkNKxnNlizSFTjxEzgqSzLtT6D02CJDWAGt9oBFGQ4VHrgxc6tYB6CmAeE2+
         8YQ9a8BVm4oo8k7TJnGL+6WsOCsGhg6VQJj04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=htNAnGunm2mFYSv2XzhlQsCDD0LeBwjAb0MYMtun6cM=;
        b=T85KFws9q0bBYEclny1b+MmL8RZGbrLRc+QQSgnrvODJQ1OzmXIg63U/swDMpw1p/2
         OMAARN6mRL37L5RKKci0B4tDgdJgcQZrLmNT/SSGkvJ9PO7T68ZTJyMgYdCIul7zXS78
         R2B6OUcZ2asgHhU/T1rHwbH3bSacJJhdIPPlJXQtjm/PMXqpKB++SppmVk81U8t8wj9A
         ELvvU7KZK283AyJ/m0NAcJ5IFWBbeb1r4eAIKEgRsQZfwLimqpsG9p20z1yVZ3S9lKv+
         hPMSm/d52qPi4BREe/Js0lhl8IogXqnmCYb0V6fXgcmIA+Mqxms6n5RMFu84GkY/ZojZ
         3PmQ==
X-Gm-Message-State: AOAM531W7eqAab+xbCSEslDBc9UEN9rjbDVp3tfbipoMXZTO2/brij6Y
        4p5yLWhe4moKEpU9Xp1NiH3/MaXrXN0iPDaS
X-Google-Smtp-Source: ABdhPJwEpLjTfZcVU89N7YRonF1AAzyyw7I9PpdfbEzYaAICeCQq0Md1IAVXzyeNXLFpx50LeR4LbA==
X-Received: by 2002:a05:6512:104d:: with SMTP id c13mr4487077lfb.59.1620340263837;
        Thu, 06 May 2021 15:31:03 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id t17sm975560lff.25.2021.05.06.15.31.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 15:31:02 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id n138so10059204lfa.3
        for <linux-media@vger.kernel.org>; Thu, 06 May 2021 15:31:02 -0700 (PDT)
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr4272160lfg.40.1620340261797;
 Thu, 06 May 2021 15:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
In-Reply-To: <YJBHiRiCGzojk25U@phenom.ffwll.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 6 May 2021 15:30:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
Message-ID: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[ You had a really odd Reply-to on this one ]

On Mon, May 3, 2021 at 12:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Anyway here's a small pull for you to ponder, now that the big ones are
> all through.

Well, _now_ I'm all caught up. Knock wood. Anyway, time to look at it:

> Follow-up to my pull from last merge window: kvm and vfio lost their
> very unsafe use of follow_pfn, this appropriately marks up the very
> last user for some userptr-as-buffer use-cases in media. There was
> some resistance to outright removing it, maybe we can do this in a few
> releases.

Hmm. So this looks mostly ok to me, although I think the change to the
nommu case is pretty ridiculous.

On nommu, unsafe_follow_pfn() should just be a wrapper around
follow_pfn(). There's no races when you can't remap anything. No?

Do the two media cases even work on nommu?

Finally - did you intend fo this to be a real pull request? Because
the email read to me like "think about this and tell me what you
think" rather than "please pull"..

And I have now fulfilled that "think about and tell me" part ;)

              Linus
