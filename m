Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411044438C4
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 23:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhKBWz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 18:55:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:59538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229685AbhKBWz3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 18:55:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40DBB6044F;
        Tue,  2 Nov 2021 22:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635893573;
        bh=cTstKgx9m0Sh1q6mCiNjCpoALRcGk8ifU4/m88M8cv0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kMLW3mbMG6pyMU10wApwwn7boni9kbp57SJkk9BNGgTbRqONhOKuWKXvCx5koC2zb
         9HvNwjmFE0DLzx5f7UarSFvBTm8OxvU9IPmxYPSaJIGR+uHszclrrmq9p4mQfuGPFO
         Q5a1S1Y8RRYTU9iVi/0kp6VmYNEdAQTfErCBAvQrjkYgnaXnCE52GFhjWv5ypQrxrT
         sVGcQFGvn/kZ8CO2Pc4DCA2nBMxGB/atSRNcGa5ilTScBjJRlbTtJkSK7fzrSrNR3t
         gP/o1PPUKkRJJpJtFCj8Y7TxxQouYiTxaX4uj7CF6aSUDgaZCz/01C8O3tIOpcRQ93
         6bgJ8ebt8Ae9A==
Date:   Tue, 2 Nov 2021 22:52:45 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
Message-ID: <20211102225245.0cd3bd20@sal.lan>
In-Reply-To: <YYFd/Zb4aT3Qfjpi@smile.fi.intel.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
        <20211017162337.44860-4-kitakar@gmail.com>
        <20211102130245.GE2794@kadam>
        <CAHp75VeThcCywYZsrUNYSA3Yc3MjJwfiCBCGep1DpWFFUg71cw@mail.gmail.com>
        <CAHp75VdnvxCWYrdrBqtSDP0A2PCT6dYvHAhszY9iH9ooWKT49g@mail.gmail.com>
        <20211102150523.GJ2794@kadam>
        <YYFd/Zb4aT3Qfjpi@smile.fi.intel.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 2 Nov 2021 17:49:17 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Tue, Nov 02, 2021 at 06:05:23PM +0300, Dan Carpenter wrote:
> > On Tue, Nov 02, 2021 at 04:45:20PM +0200, Andy Shevchenko wrote:  
> > > On Tue, Nov 2, 2021 at 4:44 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:  
> > > > On Tue, Nov 2, 2021 at 3:10 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:  
> > > > > On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:  
> 
> ...
> 
> > > > > Run your patches through scripts/checkpatch.pl.  
> > > >
> > > > While it's good advice, we are dealing with quite a bad code under
> > > > staging, so the requirements may be relaxed.  

FYI, I fixed the checkpatch issue when I applied at media_stage:

	https://git.linuxtv.org/media_stage.git/commit/?id=8a5457b7c7c3b6aa1789b18bbaff9b6a99d74caa

Ok, I could have instead replied to Tsuchiya instead, but, as Andy
pointed, those patches solved longstanding issues at the atomisp
driver. So, I just went ahead and cleaned up the issue ;-)

> > > 
> > > To be more clear: the goal now is getting it _working_. That's why
> > > this kind of noise is not important _for now_.  
> > 
> > If it's a new driver, then we accept all sorts of garbage, that's true.  
> 
> It was in kernel for a while, but never worked (hence anyhow tested)
> up to the recent effort made by Tsuchiya.
> 
> In any case, as I said, we shall run checkpatch in the future when
> we have something working.

Yeah, agreed. The best is to run checkpatch and save some time from
the maintainers.

In any case, as Andy pointed out, this driver still requires major
cleanups everywhere. Yet, our current focus is to make it work with
standard V4L2 apps.

Regards,
Mauro
