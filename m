Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6BDF78A9
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 17:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfKKQY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 11:24:56 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38723 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKQY4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 11:24:56 -0500
Received: by mail-wr1-f67.google.com with SMTP id i12so8400612wro.5;
        Mon, 11 Nov 2019 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pwaa9sLhBORID/RCUQM/P5FIVmYbuKhw4bg4GhpXrpw=;
        b=nM5r4shUfZNP0YLlxxQkulRrBWevasGMJYQwRuqOkc9jDEDJR0HMbskzY/iLrggnDh
         gWRNwav1tSipKGccdQoPFX8tErdbhyILjKZeqV9aIX5dL2hvhwA7sCSBdfZUxXj/lPvU
         rBZ16q2ubHm9S5J2F/S9b+xxBXAADF5nEwqOIh12nzZUNmj1jtYLd5dABdaBnMoHcRej
         /x/1joXuL3NNcTbl/q77HB5V046HvnZGadMbsCVfuGB5ogjz+3LfC5h+dkwMNlYU1qz3
         eWmug7hjC8uFw0qoKbBhPk/yf71GgVl/8CVasIYnxQCaxxUhBXBgZcwmXm9tFZcfREFj
         7ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pwaa9sLhBORID/RCUQM/P5FIVmYbuKhw4bg4GhpXrpw=;
        b=L7hb/sErwT9lxQDxZzk19/O++Het1/A76pVCLO9ItWZJLLi/RZvUvBTrvzQVlR3D1c
         owDOn96JeIhUgknj4Ab9d8aFqwWb+F6qSq1RvlMHjzn1nNPrhlCFI8K2Yi/7CWU+rXIk
         0H8pDtJiFMTE1IjSIe3ApwdqIIcDHbpOxJyI/3gMu7o0AgA4l9XVl7AOmaoYyoC10xkj
         3PuDOGUJi0E+aR2r3zH7/5W8HKChP2+LAg7+JsmwYmmNdo1wB2EHiKtp5Zbx2WUfsmh6
         0ViCJI1ZLvoB6v8jCTchOIT5f9Py5K0ipiOlJF0GbfxaC7FIohYrpw6aJSHIZYSCs63B
         WMzA==
X-Gm-Message-State: APjAAAVhJgvekbjQWnJ7jBMRBWS8kTOHl/uH6OlJiDR4p9CqOhV9uGDb
        zTwPyPfv19LKzyqgzaCS6ns=
X-Google-Smtp-Source: APXvYqxwFAX9Lsonp+jsKJLuEmqfTuYnHimU5q/alG8pDYS6BX+Ge7PvY5a/QnEehdM9Snv3GIUH9A==
X-Received: by 2002:adf:979a:: with SMTP id s26mr16955243wrb.92.1573489493672;
        Mon, 11 Nov 2019 08:24:53 -0800 (PST)
Received: from arch-vook ([77.125.77.116])
        by smtp.gmail.com with ESMTPSA id a206sm18717606wmf.15.2019.11.11.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 08:24:52 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:24:42 +0000
From:   Omer Shalev <omerdeshalev@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media:usb:cpia2: Properly check framebuffer mmap offsets
Message-ID: <20191111182409.GA20121@arch-vook>
References: <20191108215038.59170-1-omerdeshalev@gmail.com>
 <20191108204949.GA1277001@kroah.com>
 <a1c55e7d-4710-70e9-f4d0-8fc155197f07@xs4all.nl>
 <20191111114615.GA418224@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111114615.GA418224@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 11, 2019 at 12:46:15PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Nov 09, 2019 at 12:39:43PM +0100, Hans Verkuil wrote:
> > Hi Greg,
> > 
> > On 11/8/19 9:49 PM, Greg Kroah-Hartman wrote:
> > > On Fri, Nov 08, 2019 at 09:50:36PM +0000, Omer Shalev wrote:
> > >> The cpai2 driver's mmap implementation wasn't properly check for all
> > >> possible offset values. Given a huge offset value , the calculation
> > >> start_offset + size can wrap around to a low value and pass the check
> > > 
> > > I thought we checked that in the core of the kernel now, to keep all
> > > drivers from not having to do this type of thing (as they obviously all
> > > forgot to.)  Why is this still needed here as well?
> > 
> > Where is that checked in the core? I couldn't find anything, but I might
> > have been looking in the wrong place.
> 
> Sorry, took me a while to find it.  Look at be83bbf80682 ("mmap:
> introduce sane default mmap limits") as I think this should handle the
> problem already.
> 
> thanks,
> 
> greg k-h

Thanks Greg. But All other drivers I've seen implement it like that: if(size > total_size || offset >
total_size - size). Which I think, is a better way to write this code, and generally more
secure. Plus, no extra code is needed (just changing this line).

Please let me know what you think.

Best regards,

Omer
