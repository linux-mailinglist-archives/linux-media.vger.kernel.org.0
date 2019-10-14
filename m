Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0D0CD66F8
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 18:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387977AbfJNQNT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 12:13:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34974 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbfJNQNT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 12:13:19 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so12224397lfl.2;
        Mon, 14 Oct 2019 09:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YHnMAZs14fJi1NNz2NtD+GzNSsWEq3noMLIQejJbPKU=;
        b=toH9VV3wIiWhb/2qHvQHVe+jWgxZmwSsmZS57GensCyN++iU9E+LykRN0Ln+cTA3KY
         dwzm5i6h6jXjiL6dp2lKbQtTVPEBGYvaqWG+zX3yKSTluqFm3BrklQT2G+q1b2iXIO7I
         p9l312WUWBvjU9wLMG9MLJtlNJXqxKKiECobN92aIMmY5yoPduxzxXHgNpUGwDvKEpRu
         VWq4U5dEOzbevlOoYQgfTJkAkeAJ2kKO8+U4Jy01yz9cmKjtVjYZ4BXLoHyx6GUzUs7n
         DQy/qbWucgwNONBbD10gdcSN1fKeUvtgNZtv4JOEhDHWCDRMamEjq8OKl/dfc6Kmu5xl
         qDBw==
X-Gm-Message-State: APjAAAUSPIzgN3OCpX5H+rlkAte+JKd7NKhZnU1b0TxXrLgxBPtVne/y
        G39hULvg8/BJZXR8PyCNvdw=
X-Google-Smtp-Source: APXvYqwDP0lRYsp3cJGX83F+AoNpiKoRwb/MliBNk6cC6YR1rKI1uNyUAt7eBJo+pCIcoF5AbQU7Mg==
X-Received: by 2002:ac2:5a06:: with SMTP id q6mr16772533lfn.59.1571069596454;
        Mon, 14 Oct 2019 09:13:16 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 126sm5526559lfh.45.2019.10.14.09.13.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:13:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iK2yM-00051m-6W; Mon, 14 Oct 2019 18:13:26 +0200
Date:   Mon, 14 Oct 2019 18:13:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Johan Hovold <johan@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        David Airlie <airlied@linux.ie>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 0/4] treewide: fix interrupted release
Message-ID: <20191014161326.GO13531@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
 <20191011093633.GD27819@localhost>
 <20191014084847.GD11828@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014084847.GD11828@phenom.ffwll.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 14, 2019 at 10:48:47AM +0200, Daniel Vetter wrote:
> On Fri, Oct 11, 2019 at 11:36:33AM +0200, Johan Hovold wrote:
> > On Thu, Oct 10, 2019 at 03:50:43PM +0200, Daniel Vetter wrote:
> > > On Thu, Oct 10, 2019 at 03:13:29PM +0200, Johan Hovold wrote:
> > > > Two old USB drivers had a bug in them which could lead to memory leaks
> > > > if an interrupted process raced with a disconnect event.
> > > > 
> > > > Turns out we had a few more driver in other subsystems with the same
> > > > kind of bug in them.
> > 
> > > Random funny idea: Could we do some debug annotations (akin to
> > > might_sleep) that splats when you might_sleep_interruptible somewhere
> > > where interruptible sleeps are generally a bad idea? Like in
> > > fops->release?
> > 
> > There's nothing wrong with interruptible sleep in fops->release per se,
> > it's just that drivers cannot return -ERESTARTSYS and friends and expect
> > to be called again later.
> 
> Do you have a legit usecase for interruptible sleeps in fops->release?

The tty layer depends on this for example when waiting for buffered
writes to complete (something which may never happen when using flow
control).

> I'm not even sure killable is legit in there, since it's an fd, not a
> process context ...

It will be run in process context in many cases, and for ttys we're good
AFAICT.

> > The return value from release() is ignored by vfs, and adding a splat in
> > __fput() to catch these buggy drivers might be overkill.
> 
> Ime once you have a handful of instances of a broken pattern, creating a
> check for it (under a debug option only ofc) is very much justified.
> Otherwise they just come back to life like the undead, all the time. And
> there's a _lot_ of fops->release callbacks in the kernel.

Yeah, you have a point.

But take tty again as an example, the close tty operation called from
release() is declared void so there's no propagated return value for vfs
to check.

It may even be better to fix up the 100 or so callbacks potentially
returning non-zero and make fops->release void so that the compiler
would help us catch any future bugs and also serve as a hint for
developers that returning errnos from fops->release is probably not
what you want to do.

But that's a lot of churn of course.

Johan
