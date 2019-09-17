Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1271B4F2B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 15:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbfIQN2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 09:28:24 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45098 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbfIQN2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 09:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=c28OmxOs8KefONzUBio3SVMmoEA18yitb9QmsgbwZ7E=; b=sw9R9sTLS93H5oTvy/30qx1zh
        Sr/smip99lY6V1yEZu3gwC2O4Iu+2mWg6e4ba3+skNRLeIl4RmJ81VxNZNH4VhZmeNuXmRFVnGWrG
        0xc4b05GGd5OnwDKhPNJpM4mPGo9Hbk7nlTwpzKzV+kTsbwKKh4J3ypFwFx5gCDTFo2z4NtfqIbmO
        ivxsX1ZBxARZd2s/MojnH3M6248IJtwF3nUBtR0eJzFfWU+ZFZdebrQk/1+AJyKM44TgsJA2C+rwv
        frVNok7XUpnYKu34Bmg2Dy5i95uRi6iPUhKMnQT3/jA41fvL6uemRrq8I2EWECGWvjhmO1fr9qWs6
        G6K29RgsA==;
Received: from 177.96.192.152.dynamic.adsl.gvt.net.br ([177.96.192.152] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iADWp-0001dG-1H; Tue, 17 Sep 2019 13:28:23 +0000
Date:   Tue, 17 Sep 2019 10:28:17 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: single maintainer profile directory (was Re: [Ksummit-discuss]
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <20190917102817.263517b5@coco.lan>
In-Reply-To: <201909162032.F4462D3@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
        <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
        <201909162032.F4462D3@keescook>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kees,

Em Mon, 16 Sep 2019 20:35:45 -0700
Kees Cook <keescook@chromium.org> escreveu:

> On Fri, Sep 13, 2019 at 01:19:21PM -0300, Mauro Carvalho Chehab wrote:
> > Document the basic policies of the media subsystem profile.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> > 
> > That's basically a modified version of:
> >     https://patchwork.linuxtv.org/patch/52999/
> > 
> > Applied to the new template
> > 
> >  Documentation/media/index.rst                 |   1 +
> >  .../media/maintainer-entry-profile.rst        | 140 ++++++++++++++++++  
> 
> One idea I proposed to Dan at the Maintainer's Summit was to collect all
> the profiles is a single directory in Documentation/, 

No matter where the profiles will physically be stored, its contents belong 
to subsystem-specific documentation, and should be visible at the same index 
file as the kAPI docs is located, as anyone interested on submitting patches
for a subsystem should be aware about the subsystem specific policies and
details.

So, my vote is to store them at Documentation/*/<subsystem> (together
with the kAPI book).

> since there are
> two ways someone would want to read profiles:
> 
> 1) a single profile, based on a MAINTAINERS entry which includes the path

That is the common case. The problem is that the MAINTAINERS file
currently doesn't generate html output. This is not a problem for
"old school" devs, but a newbie wanting to collaborate to a single
specific subsystem may not notice - or understand - the importance
of the MAINTAINERS file[1].

[1] btw, that's why I submitted a RFC, several years ago, a patch
converting it to ReST - and later - another patch that would be parsing
its contents and producing a ReST output.

That's, by far, the most relevant usecase for the profiles, as the
audience is the ~4k Kernel developers.

> 2) all of them, to study for various reasons

I suspect that only core people will have interest on study them.

Those people are more skilled, and can easily find all those files with
a simple grep:

	$ grep  "^P:\s" MAINTAINERS|cut -d':' -f2-

or

	$ git grep "^P:\s" MAINTAINERS|cut -d: -f3-

If, for whatever reason, he would prefer an HTML output [1], he could even
create an index file with all of those with something like:

	$ for i in $(grep  "^P:\s" MAINTAINERS|cut -d':' -f2-); do j=${i/rst/html}; echo "<a href=\"$j\">$j</a><br/>"; done >Documentation/output/index_profiles.html

We might, instead, teach the Documentation/Makefile to create something
like the above, but, IMHO, that would just add more complexity to the
build without a good reason.

[1] I doubt that core devs would prefer seeing this in html form, but some
variant of the above could be used, for example, to create symlinks for
all profile docs into a "study" directory.

> The #2 case is helped by having them all in one directory with a single
> index.rst, etc. Then similar profiles are able to merge, etc.


Thanks,
Mauro
