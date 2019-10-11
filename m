Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE96D3C81
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfJKJg1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 05:36:27 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40853 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfJKJg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:36:27 -0400
Received: by mail-lf1-f66.google.com with SMTP id d17so6561890lfa.7;
        Fri, 11 Oct 2019 02:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qlK9gLf5RoF6ICNJqAb4e5paI/AKdb6mnn7W5mQFGS0=;
        b=ASYBycLtttb85mOEqujHjzNaJ1CBKftLEp8d9y0oEDIEg56PY0AlVEV4Ol+wk1U/Cp
         sWycuGXNr1FiYjukc3Ru2DwLEb2yoA2pun0hPCkOa3a8BBYnLwvx4EQitas/NCsFkD8y
         VBQF1q+kSn09L2HW2g7VWhzaUnjf6ms7MtD59j/LPu2AF8V4OHdjKt7V7rkTC7JLyfiv
         6Xib6TV0vtZXhi6POBowySVhzIRSgRjsgUpPHq83lt1Fc9xicb1av41EK5fcFz6KIuOw
         8lQDihilkl+S5Ox9DVpxGBo9WiGxteli+fT+YyxdahSeWeyOJm8vaSEJ9yFUrgnpFg0Y
         4oGA==
X-Gm-Message-State: APjAAAU6KZOks7h0u718r1E/ud3Qe+V6eR/AvkiSbBVv1J4ZozBOp0Gv
        svMHFBpMFUInmPMrGbwjaLA=
X-Google-Smtp-Source: APXvYqzjdCwjHmD1OUcUAPcjISlrTMTsyvKPvNaG5NGSDzSHzWzFAkSASl1KZH637V4hkoJQOY7nGw==
X-Received: by 2002:a19:23cc:: with SMTP id j195mr8266076lfj.91.1570786584009;
        Fri, 11 Oct 2019 02:36:24 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id c16sm1961403lfj.8.2019.10.11.02.36.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 02:36:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iIrLd-0007T3-Ez; Fri, 11 Oct 2019 11:36:34 +0200
Date:   Fri, 11 Oct 2019 11:36:33 +0200
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
Message-ID: <20191011093633.GD27819@localhost>
References: <20191010131333.23635-1-johan@kernel.org>
 <20191010135043.GA16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010135043.GA16989@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 10, 2019 at 03:50:43PM +0200, Daniel Vetter wrote:
> On Thu, Oct 10, 2019 at 03:13:29PM +0200, Johan Hovold wrote:
> > Two old USB drivers had a bug in them which could lead to memory leaks
> > if an interrupted process raced with a disconnect event.
> > 
> > Turns out we had a few more driver in other subsystems with the same
> > kind of bug in them.

> Random funny idea: Could we do some debug annotations (akin to
> might_sleep) that splats when you might_sleep_interruptible somewhere
> where interruptible sleeps are generally a bad idea? Like in
> fops->release?

There's nothing wrong with interruptible sleep in fops->release per se,
it's just that drivers cannot return -ERESTARTSYS and friends and expect
to be called again later.

The return value from release() is ignored by vfs, and adding a splat in
__fput() to catch these buggy drivers might be overkill.

Johan
