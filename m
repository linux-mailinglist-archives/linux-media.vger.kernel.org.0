Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CDBF7933
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 17:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKKQxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 11:53:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37887 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKQxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 11:53:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so15429971wrv.4;
        Mon, 11 Nov 2019 08:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cf3kecL//bwT5nVvG9k3HK5qT+71B924Rrnmn4pgmkk=;
        b=sOMD9UlV0mzt2qA/oxZL4b8cKAwNeWF8gZjb9u/JfjzJtqBGNzheTGjHXfcpR3pabH
         lXTBqKZdo7SYNeFPfQbSmZYLFFReWsuQohxRQ6xWw1mUylrXqtapY9Xbfr6BlLB1mUqq
         AbBzj4HpbLZxjjuI5XVwyX67C/sZoL5U2s4v/F8XEu0VczP5UuJ5Z+e0yDTwHJsDZJC7
         WTLD9Uowz5KUFfuEzEfJnn/ap6rUk/gts8vLRn7Jxemkgkt1xFIudSHujGVkoUtw9KC5
         OW6vDzYLnZHvCKt3sIHz7DDNutl9xnB2jJPbdKlm5wFhoJ7BO1ijO3GpJxgbnGayIrHL
         5W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cf3kecL//bwT5nVvG9k3HK5qT+71B924Rrnmn4pgmkk=;
        b=QcxUTiMnoucPMDV1aRAHKltd3kkQKjXToqKfX9eZ31kVUwQG/YfMwpBhlQhR/3rDOl
         RYttL8uzhCC1WT6QZ8n3xOJzaNTaFNAJfIZ7rffvYV8pHQoAXzKFQNOH7gyybkE7ttio
         GZYUORdTUByNzqSm7qxhHUp+dII05s0GaNMrwVueSO8ZFNxm19qvjnLo5Ui03H5CcOv+
         OUZE6GkYyLaFq5ynL0IxJb5oH738KZwt7VeE7dj67V74qBk+GOGt70SU+JRndWoect7w
         /i3i1UjrvwMi2sRNmvfXqvPOpnEeBUF6IzwlwFnYel0Oji/4J1Gt1ElCWQkPu4JMqogk
         pHOw==
X-Gm-Message-State: APjAAAVpu/vQWZ1hk/wn2u1ws34IQtel92BeGLUrybMrTT1ii6moMnGX
        1sYcXKXwmSEpCmttlmFEqWI=
X-Google-Smtp-Source: APXvYqwzXjkVWi0L7NpUlB5Qh2GXcRAKNYsW+Vl8MZYnjYEi4PBhFg1Iffh8MQ1Dea6TK1HXqYl41g==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr22821174wrv.216.1573491214475;
        Mon, 11 Nov 2019 08:53:34 -0800 (PST)
Received: from arch-vook ([77.125.77.116])
        by smtp.gmail.com with ESMTPSA id p4sm19149008wrx.71.2019.11.11.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 08:53:33 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:53:23 +0000
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
Message-ID: <20191111185323.GA22070@arch-vook>
References: <20191108215038.59170-1-omerdeshalev@gmail.com>
 <20191108204949.GA1277001@kroah.com>
 <a1c55e7d-4710-70e9-f4d0-8fc155197f07@xs4all.nl>
 <20191111114615.GA418224@kroah.com>
 <20191111182409.GA20121@arch-vook>
 <20191111162907.GA1017642@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111162907.GA1017642@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 11, 2019 at 05:29:07PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 11, 2019 at 06:24:42PM +0000, Omer Shalev wrote:
> > On Mon, Nov 11, 2019 at 12:46:15PM +0100, Greg Kroah-Hartman wrote:
> > > On Sat, Nov 09, 2019 at 12:39:43PM +0100, Hans Verkuil wrote:
> > > > Hi Greg,
> > > > 
> > > > On 11/8/19 9:49 PM, Greg Kroah-Hartman wrote:
> > > > > On Fri, Nov 08, 2019 at 09:50:36PM +0000, Omer Shalev wrote:
> > > > >> The cpai2 driver's mmap implementation wasn't properly check for all
> > > > >> possible offset values. Given a huge offset value , the calculation
> > > > >> start_offset + size can wrap around to a low value and pass the check
> > > > > 
> > > > > I thought we checked that in the core of the kernel now, to keep all
> > > > > drivers from not having to do this type of thing (as they obviously all
> > > > > forgot to.)  Why is this still needed here as well?
> > > > 
> > > > Where is that checked in the core? I couldn't find anything, but I might
> > > > have been looking in the wrong place.
> > > 
> > > Sorry, took me a while to find it.  Look at be83bbf80682 ("mmap:
> > > introduce sane default mmap limits") as I think this should handle the
> > > problem already.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Thanks Greg. But All other drivers I've seen implement it like that: if(size > total_size || offset >
> > total_size - size). Which I think, is a better way to write this code, and generally more
> > secure. Plus, no extra code is needed (just changing this line).
> 
> The point of the above commit that is in the tree is that no driver has
> to do this check at all, it's already been done before the driver ever
> gets called, right?
> 
> So yes, there's lots of history of drivers doing the check themselves
> (and getting it wrong as you point out), but that should not matter
> anymore.
> 
> Can you verify that your change isn't even needed due to the above
> mentioned core check for valid values?
> 
> thanks,
> 
> greg k-h

Yes I got it , and thanks again. I think that programmatically , its
better to write that this way, And therefore I suggested this patch. 

thanks,

Omer
