Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A861E8D3F
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 04:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgE3Ctq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 22:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbgE3Ctp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 22:49:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A928C03E969;
        Fri, 29 May 2020 19:49:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s88so1633296pjb.5;
        Fri, 29 May 2020 19:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jje/5IhObPA+c/Zlgq/cyu1iClYpt6YXbC2KMGtWJ1c=;
        b=QUyCXkd6w4TSACol46z3Gx6W2n3kUCK+8h+LbabWwqqVD4q+NDYDlx+XuZz9SMeV+H
         RK4Ic4L+HC/nL8X+xf1LbOxaf2Z5Ij7qpnJb1QEpWMzi2y7IcArbWXq8CaLFavl8twNf
         XrGY6ZtISspjuPqv+1FQ1MnyBFw4D2lKsT2So2PWms/wt56Wdax+r/vjX88jXdAgKYyz
         toJfO5F06w8IaKELpseQUTbUHFBVhVlemU2XVha/ikPdBLGmjxfI0lmh8A03glHK1Pmt
         VGztEC/L4lR+sY2rKnVw50NyZiQREMHx/5dlS82ighK1UG04GScb3dKgRf+TVkGjhm4Q
         VDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jje/5IhObPA+c/Zlgq/cyu1iClYpt6YXbC2KMGtWJ1c=;
        b=rDbqq6kBGmcbOOlyNb1xOH+45ir9tYtaMy/1FGt6B3kc1+S/St5L8mjC5H9Hua78qo
         9OPKE327Q6OMRE3TfGo1Xl/RtklHgSvM9sGmKartQHPwZztEPY+532AEplmHQFjC/smm
         APCCbGdaM5TH9ENb+1Laa8kOTR8VOK2jkRySvV52JDP0lBwjj5W/u4fh1NCJaRZVOu+c
         MAeYec1vW9+TL178609an+dGu5iV5NlI97Z7wiJ9H051BhY/yPviSyD38ISgixgAj4mJ
         jg6hRcDiWN/T2a2Hvcg9SnhP2zaIYsfHpUNNySPXQiqrBGjAU2+txFmagNOdPn/tc54h
         J3+A==
X-Gm-Message-State: AOAM533lkJ2Gtk3GHzpm1eZukXksRzk8ORsNg4/lChxnIEGBJDxYLJ6a
        nc7FghfX2Oa0RFgOK4GhniM=
X-Google-Smtp-Source: ABdhPJxTeWn0FvpILXqo3qkIDS/w90I1CeZQxKUvYGbAScVlB0GHDDPiBWH3nr72JkpLJ1+zCBz+Cw==
X-Received: by 2002:a17:902:70c3:: with SMTP id l3mr11275860plt.70.1590806984520;
        Fri, 29 May 2020 19:49:44 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id fa19sm672964pjb.18.2020.05.29.19.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 19:49:43 -0700 (PDT)
Date:   Fri, 29 May 2020 19:49:41 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 1/9] staging: media: atomisp: fix incorrect NULL pointer
 check
Message-ID: <20200530024941.GA1287405@ubuntu-s3-xlarge-x86>
References: <20200529200031.4117841-1-arnd@arndb.de>
 <CAKwvOdnND7XFgr7W9PvZAikJB1nKxB4K5N-oP0YrBT74oX_C9g@mail.gmail.com>
 <CAK8P3a2UKC=s7re2P+qfxz8eqeC+yCcPGuYKkgji9N_ugdgWhg@mail.gmail.com>
 <CAK8P3a3u9fs9pSOXSkrmO=xNWUZ5fxZnL_O=f=0BDZ8DkHNYWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3u9fs9pSOXSkrmO=xNWUZ5fxZnL_O=f=0BDZ8DkHNYWQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:31:44PM +0200, Arnd Bergmann wrote:
> On Fri, May 29, 2020 at 10:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, May 29, 2020 at 10:04 PM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > > See also Nathan's 7 patch series.
> > > https://lore.kernel.org/lkml/20200527071150.3381228-1-natechancellor@gmail.com/
> > >
> > > Might be some overlap between series?
> > >
> >
> > Probably. I really should have checked when I saw the number of warnings.
> >
> > At least this gives Mauro a chance to double-check the changes and see if
> > Nathan and I came to different conclusions on any of them.
> 
> I checked now and found that the overlap is smaller than I expected.
> In each case, Nathans' solution seems more complete than mine,
> so this patch ("staging: media: atomisp: fix incorrect NULL pointer check")
> and also "staging: media: atomisp: fix a type conversion warning" can be
> dropped, but I think the others are still needed.
> 
>         Arnd

Thanks for double checking! I will read through the rest of the series
and review as I can.

Cheers,
Nathan
