Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C860537513D
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 11:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbhEFJId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 05:08:33 -0400
Received: from gofer.mess.org ([88.97.38.141]:38089 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233686AbhEFJIc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 05:08:32 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 45ECCC63B7; Thu,  6 May 2021 10:07:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620292053; bh=Qb5rONUj5xilaDL0pP/60GU6mHdZes+ifm2stwTpE3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t6RAGCbKkeZ7OHrNUIqZR7Bums3PZi1YiZZZheRRBSNRsTrTDtECZ+n/CiRMqtstc
         Ld8cFTdysFQoUIviltlVQwCmRQk4LmteZyrmDKL7M3xHHdsZ8zI7fUBYyTARsNerDf
         0yvx7fp7CgOcoMhBRBH6EVdJCSCTUHVtrw0eU0NnOC6JKe35IyedJUjhlOuXVhey+S
         n39ROk+tF7NCLuGB7z+3qbero2T8u++aO1XbFFPobYO3GWm3G+j4E6jcKNFiTlYwv1
         PCzopODqMs+J4R8iVQ/3ATlSW6RAAq8JWQAKF5uDbdiKdjVsJveLBSMQ08SHKwoz9g
         /7mV+Bk+xoiKw==
Date:   Thu, 6 May 2021 10:07:33 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: Re: [PATCH v2 2/3] media: rc: new driver for USB-UIRT device
Message-ID: <20210506090733.GA1483@gofer.mess.org>
References: <cover.1620251141.git.sean@mess.org>
 <497d6ecc0f020b35be1f1e06b33a955574f433ed.1620251141.git.sean@mess.org>
 <72f835c84c16b455222fece3bb3527f16ad965be.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72f835c84c16b455222fece3bb3527f16ad965be.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

On Thu, May 06, 2021 at 10:27:21AM +0200, Oliver Neukum wrote:
> Am Mittwoch, den 05.05.2021, 22:57 +0100 schrieb Sean Young:
> > +static void uirt_disconnect(struct usb_interface *intf)
> > +{
> > +       struct uirt *ir = usb_get_intfdata(intf);
> > +
> > +       rc_unregister_device(ir->rc);
> > +       usb_set_intfdata(intf, NULL);
> > +       usb_kill_urb(ir->urb_out);
> > +       usb_free_urb(ir->urb_out);
> > +       usb_kill_urb(ir->urb_in);
> > +       usb_free_urb(ir->urb_in);
> > +       kfree(ir->in);
> > +       kfree(ir->out);
> > +       kfree(ir);
> > +}
> 
> Hi,
> 
> almost. Going through this again, it looks like you have a race
> condition here.
> 
> CPU A					CPU B
> 
> usb_kill_urb(ir->urb_out);
> usb_free_urb(ir->urb_out);
> 
> 					uirt_in_callback()
> 					uirt_response(struct uirt *uirt, u32 len)
> 					err = usb_submit_urb(uirt->urb_out, GFP_ATOMIC);
> 
> 					BANG, you are using freeed memory

Nice catch, I had missed this. I'll send out a v3 with this fixed. 

This needs fixing, for sure. Having said that, once we are in the disconnect
handler aren't all urbs/endpoints disabled in usb_disable_interface()? Does
this mean the usb_kill_urb() are superfluous?

Thanks,

Sean
