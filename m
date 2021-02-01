Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D795D30A450
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhBAJYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbhBAJYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 04:24:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5ECC061573
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 01:23:26 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l6VQU-0002Sl-BI; Mon, 01 Feb 2021 10:23:18 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l6VQT-0006zv-0x; Mon, 01 Feb 2021 10:23:17 +0100
Date:   Mon, 1 Feb 2021 10:23:17 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Emmanuel Arias' <eamanu@yaerobi.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: allegro-dvt: Use __packed sentence
Message-ID: <20210201092317.GB6717@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        David Laight <David.Laight@ACULAB.COM>,
        'Emmanuel Arias' <eamanu@yaerobi.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <YBRpstkOi685uHef@debian>
 <63a4ed5c2ef54c09b2df9d6234b68711@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63a4ed5c2ef54c09b2df9d6234b68711@AcuMS.aculab.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:09:54 up 60 days, 21:36, 100 users,  load average: 0.07, 0.20,
 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 29 Jan 2021 23:54:41 +0000, David Laight wrote:
> From: Emmanuel Arias
> > Sent: 29 January 2021 20:02
> > 
> > Fix coding style using __packed sentece instead of
> > __attribute__((__packed__)).
> > 
> > Signed-off-by: Emmanuel Arias <eamanu@yaerobi.com>
> > ---
> >  drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-
> > dvt/allegro-core.c
> > index 9f718f43282b..cee624dac61a 100644
> > --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> > +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> > @@ -670,7 +670,7 @@ static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
> >  	struct {
> >  		u16 length;
> >  		u16 type;
> > -	} __attribute__ ((__packed__)) *header;
> > +	} __packed *header;
> >  	struct regmap *sram = mbox->dev->sram;
> 
> Does this actually need to be packed?
> The only reason would be if the structure could exist on a 2n+1
> boundary.

Not sure, what you mean by this.

> But that is only likely if part of some binary sequence.
> In which case I'd expect it to be marked __be or __le.

It is part of a binary sequence. It is the header of messages in a mailbox
that is used to exchange data with a co-processor (video encoder). In fact, it
should be marked as __le.

Michael
