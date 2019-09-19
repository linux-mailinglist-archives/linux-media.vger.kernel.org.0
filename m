Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67EB2B758D
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 10:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388439AbfISI6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 04:58:32 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36343 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbfISI62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 04:58:28 -0400
Received: by mail-ot1-f65.google.com with SMTP id 67so2420740oto.3
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 01:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vsvei9Y5VfaEXgSwWw7qKH7EiWeYE55XBf3/hgO9R6k=;
        b=UenyJm4pUHyPXuCn+tJWt5CMm5Sn6DGv0WvGh+ZDR09+0SRijMoGCd/Kz1AQ55PTJo
         TCBaqs6niBxaU3exMcCrIsMEFucgVCbYbKR3PijFv0H5Oga7cOMy888/LrjD+4OWVVcU
         HUwZPc8xDgF8aTDwbLcLwYVc8yNnyMOQIfll7HEBzGCLuO6V8XxvAnW3AuxZqg7Oom7S
         wJSA08TTphvE3GQanz92JvRebYxXOFmbFUJQwDrslghRYozWaPl9T96G7G/hlDZcmcOH
         35NziduYe0vMUekqfXzrMXrfC5JRg3bAP2vteVLt2IZxfoGc9RIWbVsre+pBdAPj99SN
         IA+A==
X-Gm-Message-State: APjAAAVYtUwtZAklRJSBrozk71x2x2PrnW4BDGnM5DfDMKVroUNfkJcp
        8a+OQ0Swoc8ZD8oJfPWGyiVUyEq/gWZ5CR09APk=
X-Google-Smtp-Source: APXvYqy8HAcm68+5cz6nJ8t0MturiUiIqhHMZc4iJeGMKPPIRBLSH1Ab2RIUve8U/4TA6LPhJUIfdjgUY82meIYXld8=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr5887194oth.250.1568883507337;
 Thu, 19 Sep 2019 01:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan>
 <20190919065447.GF2959@kadam> <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com>
 <87o8zgwu0m.fsf@intel.com>
In-Reply-To: <87o8zgwu0m.fsf@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Sep 2019 10:58:15 +0200
Message-ID: <CAMuHMdWGhSNu-5U0B5WN6tMRQRaAeFgcN1b=pAcXZPUpSW-ehA@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jani,

On Thu, Sep 19, 2019 at 10:49 AM Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 19 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Sep 19, 2019 at 8:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >> On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
> >> When I sent a patch, I use get_maintainer.pl then I add whoever the
> >> wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
> >> Cook from the CC list because they worked all over the tree and I know
> >> them.  I also normally remove LKML if there is another mailing list but
> >> at least one subsystem uses LKML for patchwork so this isn't safe.
> >>
> >> So the safest instructions are "Use get_matainer.pl and add the person
> >> who wrote the commit in the Fixes tag".
> >
> > Better: perhaps get_maintainer.pl can be taught to add the author of the
> > commit pointed to by the Fixes tag, if present?
>
> The drm maintainer tools [1] have that, with Cc's and reviewers picked
> up, and appropriate Cc: stable added. On a random commit from v5.3:

Thanks, but that's not scripts/get_maintainer.pl, and restricted to one out
of N subsystems.  Not so dissimilar from what Dan was complaining about.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
