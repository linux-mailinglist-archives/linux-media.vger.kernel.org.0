Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDA93CB414
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 10:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237208AbhGPI1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 04:27:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:34181 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231851AbhGPI1C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 04:27:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0894EC65B9; Fri, 16 Jul 2021 09:24:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1626423846; bh=k4GV0GyL3ss27o/H8GNejAFIH+XbYUndAcIjCC5L3s4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P3O4/mlSQPw+CSbX13SWksOS8UAwp1Lh+QLjaMXCjvYFKitLQQSNAqSO20WtJHPPe
         aiydCsjegm81mLgM84FLrRBk/hnymcloU1EUeRcRs+4s9fC3xB/x9sZuPk+JITlR1f
         J82igZN51I+16tN0UtumrXDfkbn9cAcU4bVqVgwS5N4KGz+uUDTJYRbhDIB8wfwOB6
         DvnP4ABtNJ2ST682LTafKe4pQEMhtufXC831QFu3RwfHKc2/7aLYw4kOSl8PEqBE0U
         nzXZl42EpJRk7ZBW6FW/JJgu3z/UjKuWDR7VrehEP90Lco3uEqNTF9AJo1aSx/ozf2
         WF3YnLyyzpzzA==
Date:   Fri, 16 Jul 2021 09:24:05 +0100
From:   Sean Young <sean@mess.org>
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, khilman@baylibre.com,
        narmstrong@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Subject: Re: [PATCH v5 2/2] media: rc: introduce Meson IR TX driver
Message-ID: <20210716082405.GA30719@gofer.mess.org>
References: <20210714212706.24945-1-viktor.prutyanov@phystech.edu>
 <20210714212706.24945-3-viktor.prutyanov@phystech.edu>
 <20210715214001.GA25809@gofer.mess.org>
 <20210716013652.248bce6f@192.168.1.3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716013652.248bce6f@192.168.1.3>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Viktor,

On Fri, Jul 16, 2021 at 01:36:52AM +0300, Viktor Prutyanov wrote:
> Hi Sean,
> 
> On Thu, 15 Jul 2021 22:40:01 +0100
> Sean Young <sean@mess.org> wrote:
> 
> > On Thu, Jul 15, 2021 at 12:27:06AM +0300, Viktor Prutyanov wrote:
 > > +	meson_irtx_fill_buf(ir, tx_buf, buf, len);
> > > +	dev_dbg(ir->dev, "TX buffer filled, length = %u\n", len);
> > > +
> > > +	spin_lock_irqsave(&ir->lock, flags);
> > > +	meson_irtx_update_buf(ir, tx_buf, len, 0);
> > > +	reinit_completion(&ir->completion);
> > > +	meson_irtx_send_buffer(ir);
> > > +	spin_unlock_irqrestore(&ir->lock, flags);
> > > +
> > > +	ret = wait_for_completion_interruptible(&ir->completion);
> > > +	dev_dbg(ir->dev, "TX %s\n", ret ? "interrupted" :
> > > "completed");  
> > 
> > Here two things can happen. One is, the process received a signal
> > (e.g. ^C). The other is that the hardware didn't issue any interrupts
> > due some problem somewhere. In the latter case, we only escape this
> > wait_for_completion_interruptable() when the user gets fed up and
> > presses ^C or something like that.
> > 
> > > +
> > > +	spin_lock_irqsave(&ir->lock, flags);
> > > +	kfree(ir->buf);
> > > +	meson_irtx_update_buf(ir, NULL, 0, 0);
> > > +	spin_unlock_irqrestore(&ir->lock, flags);  
> > 
> > Now it is possible that the buffer gets cleared before that IR was
> > sent, if the signal was received early enough. This means not all the
> > Tx was completed.
> > 
> > > +
> > > +	return len;  
> > 
> > Yet, we always return success.
> > 
> > In case no interrupts were generated we should return an error in a
> > timely manner, so the wait_for_completion() needs the timeout. You
> > can use the fact that the IR is never longer IR_MAX_DURATION (half a
> > second currently). Not sure what the returned error should be, maybe
> > -ETIMEDOUT?
> 
> As for me, ETIMEDOUT is OK.
> > 
> > The problem with the interruptable wait is that a process can receive
> > a signal at any time, and now when this happens your IR gets
> > truncated. I don't think this is what you want.
> 
> Should I replace wait_for_completion_interruptible by
> wait_for_completion_timeout in order to wait in uninterruptible way?

Yes, the process can receive a signal if the terminal is resized
(SIGWINCH) or if the process is backgrounded and then foregrounded with
^Z and fg (SIGCONT). If this happens during tx then the tx might be
incomplete.

Thanks,

Sean
