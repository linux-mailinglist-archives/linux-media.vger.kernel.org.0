Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6169CD7802
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732423AbfJOOHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:07:33 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46678 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732313AbfJOOHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:07:33 -0400
Received: by mail-ed1-f68.google.com with SMTP id r18so6464210eds.13
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=qNZCwssE+agkEqCxaKtKVtylCGvXFSXX5DhiQKaIXpg=;
        b=NPijPlHE9mOZETSF+T0qFTrnynppESRm1hPk8m15z6BtFKp/f35nb6fP0AtxA+vICD
         JOWnOXgGumAnnyCgoxgqcArGuemzJeDfqPdA4LYis0/rmWoNPx8t+Aa38BhPM8yc5J1y
         jTOJ95BLBFELDrUekBUcpVOI1TGYpw9L5o3bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=qNZCwssE+agkEqCxaKtKVtylCGvXFSXX5DhiQKaIXpg=;
        b=BWUNbHyVUDAOjc6OP4brt17akzvHQzsgSG04kg+RAuFOxbefwuxo5SdhHtHGCAAuqI
         jQpikAXGdsgHyHhU/2T+JwVOIiRvBKGeafomAf6Z21S5DB/qViAlECZsWi0T4pw6k1FB
         UoJi0RvlV/mV8odQiTb3mkif66Zyz+GLCpY44qrKEwlhg49C2Ll1KnQP6sEl/6gDdBwX
         rB8QJwhFxUvKsC2EYHFUirJS63fh66d6us3lWDIyG7uEZ1Bc3jMwrbGbVNWMkNsQSGXf
         is3+rKYrPbCD+7FbXfztF0rUMXcgKfekGNfe/ZDNJ/wDqadZ8BHRRmuFTncRWt/lSWtO
         vnUg==
X-Gm-Message-State: APjAAAXcNZD3K7epAF76vvBQc7/8vpDFmji55J2nvgDP8lFIUnUb2gsx
        DxlXaUo7xG/TCWw9yPY6HQx21A==
X-Google-Smtp-Source: APXvYqxwy4bxug6xoJIsFM59wzr8Eu7OLed7aQTfUGOfiWObU9eeM/ertrRHn6MHc5kJuwT0SZQfrw==
X-Received: by 2002:a17:906:6a8e:: with SMTP id p14mr34255737ejr.137.1571148449724;
        Tue, 15 Oct 2019 07:07:29 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id d2sm3745355eda.20.2019.10.15.07.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 07:07:28 -0700 (PDT)
Date:   Tue, 15 Oct 2019 16:07:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Johan Hovold <johan@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
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
Message-ID: <20191015140726.GN11828@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
 <20191011093633.GD27819@localhost>
 <20191014084847.GD11828@phenom.ffwll.local>
 <20191014161326.GO13531@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014161326.GO13531@localhost>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 14, 2019 at 06:13:26PM +0200, Johan Hovold wrote:
> On Mon, Oct 14, 2019 at 10:48:47AM +0200, Daniel Vetter wrote:
> > On Fri, Oct 11, 2019 at 11:36:33AM +0200, Johan Hovold wrote:
> > > On Thu, Oct 10, 2019 at 03:50:43PM +0200, Daniel Vetter wrote:
> > > > On Thu, Oct 10, 2019 at 03:13:29PM +0200, Johan Hovold wrote:
> > > > > Two old USB drivers had a bug in them which could lead to memory leaks
> > > > > if an interrupted process raced with a disconnect event.
> > > > > 
> > > > > Turns out we had a few more driver in other subsystems with the same
> > > > > kind of bug in them.
> > > 
> > > > Random funny idea: Could we do some debug annotations (akin to
> > > > might_sleep) that splats when you might_sleep_interruptible somewhere
> > > > where interruptible sleeps are generally a bad idea? Like in
> > > > fops->release?
> > > 
> > > There's nothing wrong with interruptible sleep in fops->release per se,
> > > it's just that drivers cannot return -ERESTARTSYS and friends and expect
> > > to be called again later.
> > 
> > Do you have a legit usecase for interruptible sleeps in fops->release?
> 
> The tty layer depends on this for example when waiting for buffered
> writes to complete (something which may never happen when using flow
> control).
> 
> > I'm not even sure killable is legit in there, since it's an fd, not a
> > process context ...
> 
> It will be run in process context in many cases, and for ttys we're good
> AFAICT.

Huh, read it a bit, all the ->shutdown callbacks have void return type.
But there's indeed interruptible sleeps in there. Doesn't this break
userspace that expects that a close() actually flushes the tty?

Imo if you're ->release callbacks feels like it should do a wait to
guaranteed something userspace expects, then doing a
wait_interruptible/killable feels like a bug. Or alternatively, the wait
isn't really needed in the first place.

> > > The return value from release() is ignored by vfs, and adding a splat in
> > > __fput() to catch these buggy drivers might be overkill.
> > 
> > Ime once you have a handful of instances of a broken pattern, creating a
> > check for it (under a debug option only ofc) is very much justified.
> > Otherwise they just come back to life like the undead, all the time. And
> > there's a _lot_ of fops->release callbacks in the kernel.
> 
> Yeah, you have a point.
> 
> But take tty again as an example, the close tty operation called from
> release() is declared void so there's no propagated return value for vfs
> to check.
> 
> It may even be better to fix up the 100 or so callbacks potentially
> returning non-zero and make fops->release void so that the compiler
> would help us catch any future bugs and also serve as a hint for
> developers that returning errnos from fops->release is probably not
> what you want to do.
> 
> But that's a lot of churn of course.

Hm indeed ->release has int as return type. I guess that's needed for
file I/O errno and similar stuff ...

Still void return value doesn't catch funny stuff like doing interruptible
waits and occasionally failing if you have a process that likes to use
signals and also uses some library somewhere to do something. In graphics
we have that, with Xorg loving signals for various things.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
