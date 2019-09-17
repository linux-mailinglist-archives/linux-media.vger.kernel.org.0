Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D26B52FF
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 18:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbfIQQdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 12:33:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34344 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbfIQQdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 12:33:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so2496049pfa.1
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c+PTSCzGjCSex5vMxl5qRR8PkMLygl/K8peAQu3SOZM=;
        b=FkMj/GJY5ixm4XxNsnmw9paiRJ2ZNgelNLfWZix1SH0rxaC5o+aLi2Tfe5SwOzb+Jz
         FOwDqA1m05sNWGWpuPcukBlhWb1N3t/TvgcQzjFdAtvfARAWJkxaJnbTK764SKzk4Z5v
         c4+5X8oPZlCWBPbbQtbVA5zdN4XLPXK/kFL0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c+PTSCzGjCSex5vMxl5qRR8PkMLygl/K8peAQu3SOZM=;
        b=SmHllCreXjAVD331KFjYtCyv0G/zzhIk0jmXca+BC+ILf5oIQAybCedZbgvgHS7OxM
         ihZRB5D9m2xXS2qGvj7+nXZ/NWYmLf8xgXnqykBxq8VaCjXqTBBvoIGMxuw5plzFBsBu
         k2B70i50pPdIDBPK5UrdG9/KKIe0lxZfureSqcHaXrCLeZmjvHhYnttPBhOso8Vw47TM
         zfkvNE6pQdv8CWH7Qe++9Ld9pJ4P+0/fsxEX4cYY4ZNLN2uW/C+m7oNHqZhQEAgNFdkE
         Ui6ZzXAIk4jH6AYLugTRR2QaSwTiZDcSdJsI7EOG5d22ziKkHCCK4AuZ7lCpFNiQGNhK
         gBsg==
X-Gm-Message-State: APjAAAUWmHGkFPrc2l6Ods7ehm0IhWIOjOr9dEGGZ9HKmqgKqpZAYaQm
        uqeeRgPLX0Q064Yd4KUs9sO3zw==
X-Google-Smtp-Source: APXvYqwtuaUAgzzoeQraSuZ738yvmojRxlIIqMFc1O8f5z8cANqLJaYQmv8KDst/GutoMAHmzKt91A==
X-Received: by 2002:a63:1d52:: with SMTP id d18mr4244378pgm.315.1568737993373;
        Tue, 17 Sep 2019 09:33:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c128sm3219182pfc.166.2019.09.17.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:33:12 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:33:11 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: single maintainer profile directory (was Re: [Ksummit-discuss]
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <201909170930.B8AD840@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <201909162032.F4462D3@keescook>
 <20190917102817.263517b5@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917102817.263517b5@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 17, 2019 at 10:28:17AM -0300, Mauro Carvalho Chehab wrote:
> No matter where the profiles will physically be stored, its contents belong 
> to subsystem-specific documentation, and should be visible at the same index 
> file as the kAPI docs is located, as anyone interested on submitting patches
> for a subsystem should be aware about the subsystem specific policies and
> details.

That's a good point. I think your other suggestions below address my
"find them all" case...

> So, my vote is to store them at Documentation/*/<subsystem> (together
> with the kAPI book).
> 
> > since there are
> > two ways someone would want to read profiles:
> > 
> > 1) a single profile, based on a MAINTAINERS entry which includes the path
> 
> That is the common case. The problem is that the MAINTAINERS file
> currently doesn't generate html output. This is not a problem for
> "old school" devs, but a newbie wanting to collaborate to a single
> specific subsystem may not notice - or understand - the importance
> of the MAINTAINERS file[1].
> 
> [1] btw, that's why I submitted a RFC, several years ago, a patch
> converting it to ReST - and later - another patch that would be parsing
> its contents and producing a ReST output.
> 
> That's, by far, the most relevant usecase for the profiles, as the
> audience is the ~4k Kernel developers.

Oh yes, having a .rst of the MAINTAINERS file would be pretty great.
Seems like it could just be a build target (and then dependency) for the
sphinx targets?

> > 2) all of them, to study for various reasons
> 
> I suspect that only core people will have interest on study them.
> 
> Those people are more skilled, and can easily find all those files with
> a simple grep:
> 
> 	$ grep  "^P:\s" MAINTAINERS|cut -d':' -f2-
> 
> or
> 
> 	$ git grep "^P:\s" MAINTAINERS|cut -d: -f3-
> 
> If, for whatever reason, he would prefer an HTML output [1], he could even
> create an index file with all of those with something like:
> 
> 	$ for i in $(grep  "^P:\s" MAINTAINERS|cut -d':' -f2-); do j=${i/rst/html}; echo "<a href=\"$j\">$j</a><br/>"; done >Documentation/output/index_profiles.html
> 
> We might, instead, teach the Documentation/Makefile to create something
> like the above, but, IMHO, that would just add more complexity to the
> build without a good reason.
> 
> [1] I doubt that core devs would prefer seeing this in html form, but some
> variant of the above could be used, for example, to create symlinks for
> all profile docs into a "study" directory.
> 
> > The #2 case is helped by having them all in one directory with a single
> > index.rst, etc. Then similar profiles are able to merge, etc.

Whatever the case, please don't let me distract from the actual content
of these profiles: I think it's awesome to capture these details and
makes my life so much easier. :)

-- 
Kees Cook
