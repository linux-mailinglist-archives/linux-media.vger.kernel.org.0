Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F9C18CF65
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 14:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgCTNt6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 09:49:58 -0400
Received: from gofer.mess.org ([88.97.38.141]:48013 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgCTNt5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 09:49:57 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3337EC635F; Fri, 20 Mar 2020 13:49:56 +0000 (GMT)
Date:   Fri, 20 Mar 2020 13:49:56 +0000
From:   Sean Young <sean@mess.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: Use scnprintf() for avoiding potential buffer
 overflow
Message-ID: <20200320134955.GA21882@gofer.mess.org>
References: <20200311074706.8624-1-tiwai@suse.de>
 <s5h8sjwuykp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h8sjwuykp.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 04:57:42PM +0100, Takashi Iwai wrote:
> On Wed, 11 Mar 2020 08:47:06 +0100,
> Takashi Iwai wrote:
> > 
> > Since snprintf() returns the would-be-output size instead of the
> > actual output size, the succeeding calls may go beyond the given
> > buffer limit.  Fix it by replacing with scnprintf().
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> A gentle reminder for this forgotten patch.
> Let me know if any further changes are needed.

Thank you for your reminder. The changes look good, unfortunately they
missed the deadline for v5.7. I handle them after the next merge window.

Thanks,

Sean

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  drivers/media/rc/nuvoton-cir.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
> > index 5c2cd8d2d155..48a69bf23236 100644
> > --- a/drivers/media/rc/nuvoton-cir.c
> > +++ b/drivers/media/rc/nuvoton-cir.c
> > @@ -230,10 +230,10 @@ static ssize_t wakeup_data_show(struct device *dev,
> >  	for (i = 0; i < fifo_len; i++) {
> >  		duration = nvt_cir_wake_reg_read(nvt, CIR_WAKE_RD_FIFO_ONLY);
> >  		duration = (duration & BUF_LEN_MASK) * SAMPLE_PERIOD;
> > -		buf_len += snprintf(buf + buf_len, PAGE_SIZE - buf_len,
> > +		buf_len += scnprintf(buf + buf_len, PAGE_SIZE - buf_len,
> >  				    "%d ", duration);
> >  	}
> > -	buf_len += snprintf(buf + buf_len, PAGE_SIZE - buf_len, "\n");
> > +	buf_len += scnprintf(buf + buf_len, PAGE_SIZE - buf_len, "\n");
> >  
> >  	spin_unlock_irqrestore(&nvt->lock, flags);
> >  
> > -- 
> > 2.16.4
> > 
