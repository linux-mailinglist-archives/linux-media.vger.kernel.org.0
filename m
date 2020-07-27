Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BD422F1C9
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730522AbgG0OOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730516AbgG0OOV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:14:21 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E279C061794;
        Mon, 27 Jul 2020 07:14:21 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id k18so12242503qtm.10;
        Mon, 27 Jul 2020 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y9lbwhpNkXDEPrCqs4m21x/DyaLmLEGxvTObYoYswfg=;
        b=nuZF0Mj0owgt6tEsiTXfnJ2eI2ujMyxvOF5pbIRSQUbOvAb/wtVocAFwgKr/er65gC
         C+d5tZT5DB2J9mjk94BGMWgb/W/f0Vh23B440hN+Aq88n/FP8GewmdyNeyXWAY21tTmJ
         t7bpomd1mNoPFxL9K6XpFtfMGuNmL1KfpMUHbjJnOUwLskuli1JzIReFdu0ImyICn0Pc
         bHqtCJKDiGzoWZQxs7GdkkLzBpuZN00UJrdoU41KBPiXmuQleavSAW/ACB/IMRJoGSNs
         v70CMNmIuhXeq/Q/fMM7fndWFHAhGhxWyS0imUpzLXQpQyOWhMwb6GXeQ/hKgLZ0w5gb
         t6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y9lbwhpNkXDEPrCqs4m21x/DyaLmLEGxvTObYoYswfg=;
        b=iXBe/RGVofqzH9NOaPZg5Yo7QbBjIfcH5mA+Cmvnq1QR6p1lK7WzNNZhwKafyI6CjF
         +ymPgllF9FJHO0FX8Qb4bWEPqFG9ZBuOV4z9TyEFKiQIlabzT00y/1Q9KwlAO32KgCNz
         c2pdasyUG+e+NprBIcj5z9AIcbzxG5+fe+8EfaLz7tqbmOANsUwC0Tu3UM+lQ1I8+Wpu
         mYv4u+Q5R/p+jKvLNQvQ64mmgVLdWBdiwLJgHY27Tkm11JmVX1TTM0ES+s0Cc9JmvtuA
         x/Tri6jFU3Y4KU9qE3e+/en270xWm3CeS+MO5n955b7GVLU+1K5Vcmn+ybhKNMsMf9M3
         Lh0w==
X-Gm-Message-State: AOAM532hqKhJoBH5V9yoILZwb7wfLkbOWEmxVweiTNRmlnZHOnFhS/8X
        ckg29mBs2mJJJW0cfIFBjA==
X-Google-Smtp-Source: ABdhPJy1E319z1D33SixUBWRgVTxX65uy8ONSuGjV3Q4iaZunOwRcDqmSGKsYBSkw3Ql8PSuJxAW0g==
X-Received: by 2002:ac8:5207:: with SMTP id r7mr22026332qtn.191.1595859259370;
        Mon, 27 Jul 2020 07:14:19 -0700 (PDT)
Received: from PWN ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id y24sm2422196qtv.71.2020.07.27.07.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 07:14:18 -0700 (PDT)
Date:   Mon, 27 Jul 2020 10:14:16 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200727141416.GA306745@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > >
> > > > video_put_user() is copying uninitialized stack memory to userspace due
> > > > to the compiler not initializing holes in the structures declared on the
> > > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > > >
> > > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > >
> > > Thanks a lot for addressing this! I now see that I actually created a similar
> > > bugfix for it back in January, but for some reason that got stuck in my
> > > backlog and I never wrote a proper description for it or sent it out to the
> > > list, sorry about that. I would hope we could find a way to have either
> > > the compiler or sparse warn if we copy uninitialized data to user space,
> > > but we now don't even check for that within the kernel any more.
> >
> > Here are my latest warnings on linux-next from Friday.
> 
> Ah, I forgot you had that kind of list already, thanks for checking!
> 
> > block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> 
> I see no padding in this one, should be fine AFAICT. Any idea why you
> get a warning
> for this instance?
> 
> > drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')
> 
> This one hs padding in it and looks broken.
> 
> > drivers/input/misc/uinput.c:958 uinput_ioctl_handler() warn: check that 'ff_up' doesn't leak information (struct has a hole after 'replay')
> 
> hard to tell.
> 
> > drivers/firewire/core-cdev.c:463 ioctl_get_info() warn: check that 'bus_reset' doesn't leak information (struct has a hole after 'generation')
> 
> broken, trivial to fix
> 
> > drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information
> 
> Seems fine due to __packed annotation.
> 
> > drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
> 
> The driver seems to initialize the elements correctly before putting
> them into the kfifo, so there is no infoleak. However the structure layout
> of "struct gpioevent_data" is incompatible between x86-32 and x86-64
> calling conventions, so this is likely broken in x86 compat mode,
> unless user space can explicitly deal with the difference.
> 
> > drivers/gpu/drm/i915/i915_query.c:136 query_engine_info() warn: check that 'query.num_engines' doesn't leak information
> 
> I don't think this leaks any state, as it just copies data to user space that
> it copied from there originally.
> 
> Stopping here for now.
> 
> Peilin Ye, is this something you are interested in fixing for the other drivers
> as well? I'd be happy to help review any further patches if you Cc me.

Yes, I would like to! I will start from:

	drivers/firewire/core-cdev.c:463
	drivers/input/misc/uinput.c:743

...as you mentioned above.

Thank you!
Peilin Ye
