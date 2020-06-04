Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9571EDC1E
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 06:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgFDENp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 00:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgFDENn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 00:13:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772C3C08C5C0
        for <linux-media@vger.kernel.org>; Wed,  3 Jun 2020 21:13:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c17so5480683lji.11
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2020 21:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+NrqN+0xbQXOWLT6R62mZhI75888x+45r0FZYiQvi4=;
        b=Gsr5lN9LD8WT3djx/WpsXxGUrPz8bH8FVB0oU047nVrriDXWLxousSD6QAE6djVWhp
         87R3f/XeWUBxR1JOs/dxzvYX2IVp0MFK0CUObhFX39bp0Pnswj79PJRrIjHnMOS/gaWX
         +0mM9d0u66/Dew3fTDnMCmjIwdXBg3bbVAXGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+NrqN+0xbQXOWLT6R62mZhI75888x+45r0FZYiQvi4=;
        b=m76djUauhViEDFlWWMqo2E8cBDg0bYFp9pq1gS1CdSutq/pwkQymlrBRzlgLRWOqUh
         IFAOLvIoslZm1iNdYi8ME+rlptmEeKPrf2HhuTIOQZtBXMhyT5eZIHVV1CsxHNQLRe42
         4eKaHEocQ99t7zX7uTuYZA3Ij4LPNqM2MFIT4EARtk2bTksfeiUDfy1kyqA+9JGX1oQ5
         HipC+ds0iN8nn8ZrVf/BbuZe6lJKdzMcKnUKktxwgvf6ahSYi1Misphdu0mpjqnCsBFG
         OmvbXCODqgRkOP8ibyYec//DOwIxg9WAX7H3KhbjbaltyWjYG7I4ZZY1c/XMvlHf35HP
         ysqA==
X-Gm-Message-State: AOAM532rCjYL4G8u0fBSGBrryGcCjv71CS4REIgnW3vBPPokBhRyL3UL
        z2iTak3XRZZCxznIvL1mh4WGGPBBumY=
X-Google-Smtp-Source: ABdhPJwX4yhcDaMqhN9KKTAcB+hWeA962jmmpMXwK6DnpE/FSQVAIW3u32sPAyENP71SAfyM5V+ZEw==
X-Received: by 2002:a2e:8554:: with SMTP id u20mr1117187ljj.188.1591244019137;
        Wed, 03 Jun 2020 21:13:39 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 201sm934108ljf.130.2020.06.03.21.13.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 21:13:37 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id e4so5537484ljn.4
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2020 21:13:37 -0700 (PDT)
X-Received: by 2002:a2e:974e:: with SMTP id f14mr1100137ljj.102.1591244017171;
 Wed, 03 Jun 2020 21:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200603100559.2718efba@coco.lan>
In-Reply-To: <20200603100559.2718efba@coco.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Jun 2020 21:13:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=CTtNrxPeFzkDw053dY3urchiyxevHnUXHhTGbK=9OQ@mail.gmail.com>
Message-ID: <CAHk-=wg=CTtNrxPeFzkDw053dY3urchiyxevHnUXHhTGbK=9OQ@mail.gmail.com>
Subject: Re: [GIT PULL for v5.8-rc1] media updates
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 3, 2020 at 1:06 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> PS.: The diffstat is so big that I almost dropped it, as it is almost
> useless for humans to read. I ended by not doing it just because perhaps
> you could be using some sort of script to check diffstat.

No, but I do compare the basics, and you don't have to more than scan
it to see that "ok, it only touches area xyz".

And it turns out that it is huge for you partly because you have the
default (fairly low) git rename detection limits, in order to avoid
using a lot of CPU or memory for rename detection.

So you get:

>  2181 files changed, 260633 insertions(+), 106012 deletions(-)

while I get

 1698 files changed, 161922 insertions(+), 7301 deletions(-)

which is a noticeable difference. Still a big diffstat, but quite a
bit smaller than yours.

You also get a _lot_ more noise in the form of "create mode xyz" and
"delete mode abc" notices, while for me a lot of them are just "rename
abc => xyz". So there's a double whammy for you.

The reason is that your diff only has renames for the 100% matches like this:

>  rename Documentation/{media/v4l-drivers => admin-guide/media}/au0828-cardlist.rst (100%)

which git can detect purely by seeing "oh, same exact SHA1".

But you don't have any non-100% renames.

In contrast, the diffstat I see also has the inexact renames like

 rename Documentation/{media/v4l-drivers =>
admin-guide/media}/bttv-cardlist.rst (99%)
 rename Documentation/{media/v4l-drivers => admin-guide/media}/bttv.rst (79%)

because I have done

   git config diff.renamelimit 0

to make the rename detection limit be infinite (alternatively, just
edit your ~/.gitconfig file manually - it's often easier than
remembering what the "git config" syntax is).

You want to see

  [diff]
        renamelimit = 0

in your ~/.gitconfig file (or, alternatively, if you want the setting
to be per-repo, in your .git/config file in your repository).

The default git limits for "should I spend CPU time and memory on
detecting inexact renames" are fairly low, because people use git on
fairly low-end machines.

I bet your development machine isn't some kind of low-end toy, and
rename detection is not _that_ expensive.

              Linus
