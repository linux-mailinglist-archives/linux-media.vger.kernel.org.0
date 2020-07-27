Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF06622E70D
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 09:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgG0H4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 03:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgG0H4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 03:56:41 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FEBC0619D2;
        Mon, 27 Jul 2020 00:56:40 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id u64so14426315qka.12;
        Mon, 27 Jul 2020 00:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N6upqxCfyW0GVZHe453idrIKQhFzkY5bo/oAq5M3uGE=;
        b=MG5CBLtyWpDp74hy9XAMKqGEpWa8mR8mZm6FLz3EmFUhHuNS6Cc+ucxF/8J3Kwilww
         ctoLd7ZrsXx6WGMNMV4rJbnd27tJ1/e4rtMyJBuCTqpVNAAoNo99DbKA44lj0OjjfjF3
         SNqKyxqlob+pKDiCPnI21KXkXmZNE53JjrZ3oENbp1qhQTFUoABDRLmgacaHzT4HdKI4
         tBXnGOlWKicNc5GHjatI5XupCQPIIbGS5yKAF0NRmIBtDgzck+d0RDxmQyQh1BrnGohf
         L7vVZJdawFwAO9/0fnkuLd6z7+8TZ0QuPIM0GgkOvt+scBTGTnMDfHPP4eA37TtOMW0V
         Z1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N6upqxCfyW0GVZHe453idrIKQhFzkY5bo/oAq5M3uGE=;
        b=n5lKm0aelthxd5acWViGEO+Na3KO2FzDa5aLiOrytn+EOrtg119YeVO9LSxLBQkEep
         3IY3wrDnm107wRbB24p9Q6Qu7A9YKYRf2ebO+9Pkmwm4mF96IDDN1DB+R9TAqTthuAAS
         bSmn6ncI+2YkIBSAlXgmdz8qGNpdA09hKJufwu3sSLnW6u7MJ4mTvKItoAreP8RP/cET
         QGYaK3HMDWhShlCMW/dJgIu3sEaWqEPaYulqbZEjsZQd8LF/DaHA2rxKXDLN7tmSs9IY
         0sfyXdTMFNJf2cMEFXWFGL1jInsRELnQbkOcSfkmHstEHTO38rlTK+wVp34Z5BANluLF
         BtbQ==
X-Gm-Message-State: AOAM531F4Z5Up/cTUGtg9P2IB2tkHgUU08OXmRSIPyprF87g5hF2FlMN
        HVL8iIc0Y4pCHvefxqBi3A==
X-Google-Smtp-Source: ABdhPJxAQQcavuqSCw162hVKCvTa60uFZJYYJ8f5F0oIw3F8nSrx6KfVDkWkp/ov+7P3mP9y4r3j/A==
X-Received: by 2002:a37:61ce:: with SMTP id v197mr2776425qkb.44.1595836600043;
        Mon, 27 Jul 2020 00:56:40 -0700 (PDT)
Received: from PWN ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id p4sm17340859qkj.135.2020.07.27.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 00:56:39 -0700 (PDT)
Date:   Mon, 27 Jul 2020 03:56:37 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200727075637.GA205716@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > video_put_user() is copying uninitialized stack memory to userspace due
> > to the compiler not initializing holes in the structures declared on the
> > stack. Fix it by initializing `ev32` and `vb32` using memset().
> >
> > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Thanks a lot for addressing this! I now see that I actually created a similar
> bugfix for it back in January, but for some reason that got stuck in my
> backlog and I never wrote a proper description for it or sent it out to the
> list, sorry about that. I would hope we could find a way to have either
> the compiler or sparse warn if we copy uninitialized data to user space,
> but we now don't even check for that within the kernel any more.

I am glad to be of help!

> I would suggest adding these tags to the patch, to ensure it gets backported
> to stable kernels as needed:
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
> Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for
> time64 ABI")
> 
> In addition to
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Sure, I will send a v4 soon. Thank you for reviewing the patch.

Peilin Ye
