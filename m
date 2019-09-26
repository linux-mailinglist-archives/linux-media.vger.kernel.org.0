Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC52BF641
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 17:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfIZPxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 11:53:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44923 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfIZPxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 11:53:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so2053729pfn.11
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x2ZtsiLZ+kw3/v3oYhsQVM4bKUJxpQ2h0TdonjKHc1k=;
        b=EOV9nbdXnQCKPBtCCBZmtnBDRzrPIfa5lsb1/TMYl39MUoQbGoSV446jt7o+yIgbSr
         IO8fnJ7V85D4cMjuINTd+MMR3Zb9XBlf8mBo66HWYmspjadLf3AffJnKpBan0E4iwuI3
         H5FXmF3ulhqsAGrTVrL6eSIjZGWk1o1zBRl+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x2ZtsiLZ+kw3/v3oYhsQVM4bKUJxpQ2h0TdonjKHc1k=;
        b=frQIjg6Z2UN4UH0wqtUqWoercrujjWuJRBHDF2J3jGIWQ/MuQonKgnR/MDeizrJCix
         TQXbRiQh5EfpKc81WjJUNkGo5TC8wOMY5Qck3AxJ1BcmJOa8ohRqq8FtytYPVZ1v4Ikn
         0XiPr97IiGBfmr5GrLtR6SywCcESYuKI83pwkjmjpaxDm/7+eGBIwzWUXOLxTuJ9CzuH
         Mmu/gyF6Bz8yOauRT4XTXRz/tg228FhXGpox07p1qvwjZcGyvpF71MN3pjDL5KvHfV+k
         LwtmAPSQnFC9+yY/311+kXIhvyBnGi++xHK24+Wg/d7NE7K0o5ov48nQ5NlpNKx388+n
         40AA==
X-Gm-Message-State: APjAAAVo1x+/LGbd08WLb9unlc+aV6L0XgOaR/RDG2xl/NTKi85mbHKQ
        BPCOfYAX5/VWKt1emgjP8yUepLnjhUk=
X-Google-Smtp-Source: APXvYqwbQdqxbvH0rRx4Ow/CbsOjuecD+mffAid+26LrGXvPQ5t5wv4MXwXa+V0zJfK5dso7v7G32Q==
X-Received: by 2002:aa7:8bcc:: with SMTP id s12mr4417785pfd.93.1569513192061;
        Thu, 26 Sep 2019 08:53:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 22sm2655117pfo.131.2019.09.26.08.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:53:11 -0700 (PDT)
Date:   Thu, 26 Sep 2019 08:53:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
Message-ID: <201909260848.B429B7DF@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com>
 <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam>
 <5d71311232fd6d4aa0fab038512eab933c13a722.camel@perches.com>
 <201909251127.D0C517171E@keescook>
 <4eca5297a213357995c05b90c74a8bc638f54f02.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eca5297a213357995c05b90c74a8bc638f54f02.camel@perches.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 26, 2019 at 08:14:03AM -0700, Joe Perches wrote:
> On Wed, 2019-09-25 at 11:40 -0700, Kees Cook wrote:
> > Is "6" a safe lower bound here? I thought 12 was the way to go?
> []
> > $ git log | egrep 'Fixes: [a-f0-9]{1,40}' | col2 | awk '{print length }' | sort | uniq -c | sort -n | tail
> >     238 8
> >     300 7
> >     330 14
> >     344 6
> >     352 11
> >     408 40
> >     425 10
> >     735 16
> >    1866 13
> >   31446 12
> > 
> > Hmpf, 6 is pretty high up there...
> 
> Yes, but your grep then col2 isn't right.
> You are counting all the 'Fixes: commit <foo>' output
> as 6 because that's the length of 'commit'.

the [a-f0-9]{1,40} already excludes "commit".

> I also think the length of the hex commit value doesn't
> matter much as it's got to be a specific single commit
> SHA1 anyway, otherwise the commit id lookup will fail.

Fail enough. We do already have 6-digit SHA1 collisions, so it seemed
like using more than 6 would be nicer? *shrug* I don't have a strong
opinion. :)

> 
> > > > @@ -1031,6 +1040,7 @@ MAINTAINER field selection options:
> > >      --roles => show roles (status:subsystem, git-signer, list, etc...)
> > >      --rolestats => show roles and statistics (commits/total_commits, %)
> > >      --file-emails => add email addresses found in -f file (default: 0 (off))
> > > +    --fixes => for patches, add signatures of commits with 'Fixes: <commit>' (default: 1 (on))
> > 
> > Should "Tested-by" and "Co-developed-by" get added to @signature_tags ?
> 
> All "<foo>-by:" signatures are added.

Ah, I'd missed where that happened. I do note that's only when
git-all-signature-types is set, which is default 0. (/me goes to add
this to his invocations...)

my $email_git_all_signature_types = 0;
...
    if ($email_git_all_signature_types) {
        $signature_pattern = "(.+?)[Bb][Yy]:";
    } else {
        $signature_pattern = "\(" . join("|", @signature_tags) . "\)";
    }

> > @commit_authors is unused?
> 
> Yes, authors are already required to sign-off so
> it's just duplicating already existing signatures.

Sure, it just seemed odd to populate it if it wasn't going to be used.

-- 
Kees Cook
