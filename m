Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE47C8C4D
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 17:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfJBPGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 11:06:52 -0400
Received: from gofer.mess.org ([88.97.38.141]:47667 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbfJBPGw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 11:06:52 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 01118C63B4; Wed,  2 Oct 2019 16:06:50 +0100 (BST)
Date:   Wed, 2 Oct 2019 16:06:50 +0100
From:   Sean Young <sean@mess.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     mchehab+samsung@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191002150650.GA4227@gofer.mess.org>
References: <20191001205203.4b1a5fb6@coco.lan>
 <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com>
 <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 02, 2019 at 04:44:24PM +0200, Gonsolo wrote:
> Hi!
> 
> > You need a message and a Signed-off-by: here.
> 
> Ok, I'll try to get that right the next time.
> 
> > > +     ret = si2157_power_up(dev, client);
> > > +     if (ret)
> > > +             goto err;
> > > +     /* query chip revision */
> > > +     /* hack: do it here because after the si2168 gets 0101, commands will
> > > +      * still be executed here but no result
> >
> > I don't understand. What problem are you seeing here? Why can't you do a
> > query chip revision first?
> 
> This was explained here: https://lkml.org/lkml/2017/3/15/778. To quote:

Antti has some great suggestions in that thread:
	https://lkml.org/lkml/2017/5/24/245

Also note https://lkml.org/lkml/2017/5/26/357 if you have access to a 
logic analyser.


Sean
