Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8141E42D6
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 15:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbgE0NAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 09:00:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:56766 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730045AbgE0NAe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 09:00:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 14632ACFE;
        Wed, 27 May 2020 13:00:35 +0000 (UTC)
Message-ID: <1590584422.2838.76.camel@suse.com>
Subject: Re: [PATCH v2 1/3] media: rc: add support for Infrared Toy and IR
 Droid devices
From:   Oliver Neukum <oneukum@suse.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Date:   Wed, 27 May 2020 15:00:22 +0200
In-Reply-To: <20200527122822.GA14488@gofer.mess.org>
References: <20200527094107.11936-1-sean@mess.org>
         <20200527094107.11936-2-sean@mess.org> <1590578201.2838.69.camel@suse.com>
         <20200527122822.GA14488@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, den 27.05.2020, 13:28 +0100 schrieb Sean Young:

Hi,

> > This violates the DMA coherency rules. The buffers must be
> > allocated separately with kmalloc().
> 
> Right, I'll fix this and send out a v3. There are other usb drivers in
> drivers/media/rc/.. that break this rule too.

Unfortunately.

> > > +	case STATE_IRDATA: {
> > > +		struct ir_raw_event rawir = { .pulse = irtoy->pulse };
> > > +		__be16 *in = (__be16 *)irtoy->in;
> > > +		int i;
> > > +
> > > +		for (i = 0; i < len / sizeof(__be16); i++) {
> > > +			u32 v = be16_to_cpup(in + i);
> > 
> > Is this 16 or 32 bit?
> 
> It's 16 bit but I would like it up-cast so that v * UNIT_NS is a 32 bit
> multiply. This could do with a comment. Also could be be16_to_cpu(in[i]).

That is nasty. I'd say if you need a larger size, cast explicitly.


> > > +static int irtoy_suspend(struct usb_interface *intf, pm_message_t message)
> > > +{
> > > +	struct irtoy *irtoy = usb_get_intfdata(intf);
> > > +
> > > +	usb_kill_urb(irtoy->urb_in);
> > > +	usb_kill_urb(irtoy->urb_out);
> > 
> > That is brutal. It could fail commands. Do you really want to
> > do that?
> 
> Commands can only be sent during 1) device probe and 2) ir transmit. During
> ir transmit we are non-interruptable process context, so we should not end up
> here unless I'm mistaken.

Well. then the kill is redundant. The freezer will save you if the
system sleeps. If somebody switches on runtime PM. you are potentially
in trouble.

> When we're not issuing commands we're waiting for ir receive; should that
> urb be killed for the duration of suspend?

No IO to a suspended device.

	Regards
		Oliver


