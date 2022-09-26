Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4DA5E9CB4
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 11:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbiIZJAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 05:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbiIZI7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 04:59:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AEBDC4;
        Mon, 26 Sep 2022 01:59:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1632F60918;
        Mon, 26 Sep 2022 08:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE62C433D6;
        Mon, 26 Sep 2022 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664182787;
        bh=+28qcCzIMz/Gaw8Kst2Zj3gwvYJ9LcyT/RtE49WdY/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XyzYWwdYmkQApQYxM754SgE+A2RbMtN6y53TbjfHLcsvFnKeUTmIQ7jYnx1MzzFri
         uRwQfgiXKDewbjffLmDyKrjVathFv3xniBUffYr4Z0rdUdyzoMulHe8+EQ4YGhnb5v
         Fw12ojfqQeuImLDnH1jwi2ZHywpVKep5BsyHejqU=
Date:   Mon, 26 Sep 2022 10:59:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>, stable@vger.kernel.org,
        Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH RESEND] media: flexcop-usb: fix endpoint type check
Message-ID: <YzFqARJe+Msvm/QI@kroah.com>
References: <20220822151027.27026-1-johan@kernel.org>
 <YymBM1wJLAsBDU4E@hovoldconsulting.com>
 <YywfxwBmdmvQ0i21@kroah.com>
 <Yyws4Pd4bAl3iq2e@hovoldconsulting.com>
 <Yyw1CJgv6nreCtB9@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyw1CJgv6nreCtB9@kroah.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 22, 2022 at 12:12:24PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 22, 2022 at 11:37:36AM +0200, Johan Hovold wrote:
> > On Thu, Sep 22, 2022 at 10:41:43AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Sep 20, 2022 at 11:00:35AM +0200, Johan Hovold wrote:
> > > > Mauro and Hans,
> > > > 
> > > > On Mon, Aug 22, 2022 at 05:10:27PM +0200, Johan Hovold wrote:
> > > > > Commit d725d20e81c2 ("media: flexcop-usb: sanity checking of endpoint
> > > > > type") tried to add an endpoint type sanity check for the single
> > > > > isochronous endpoint but instead broke the driver by checking the wrong
> > > > > descriptor or random data beyond the last endpoint descriptor.
> > > > > 
> > > > > Make sure to check the right endpoint descriptor.
> > > > > 
> > > > > Fixes: d725d20e81c2 ("media: flexcop-usb: sanity checking of endpoint type")
> > > > > Cc: Oliver Neukum <oneukum@suse.com>
> > > > > Cc: stable@vger.kernel.org	# 5.9
> > > > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > ---
> > > > > 
> > > > > It's been two months and two completely ignored reminders so resending.
> > > > > 
> > > > > Can someone please pick this fix up and let me know when that has been
> > > > > done?
> > > > 
> > > > It's been another month so sending yet another reminder. This driver as
> > > > been broken since 5.9 and I posted this fix almost four months ago and
> > > > have sent multiple reminders since.
> > > > 
> > > > Can someone please pick this one and the follow-up cleanups up?
> > > 
> > > I've taken this one in my tree now.  Which one were the "follow-up"
> > > cleanups?
> > 
> > Thanks. These are the follow-up cleanups:
> > 
> > 	https://lore.kernel.org/lkml/20220822151456.27178-1-johan@kernel.org/
> 
> Thanks, I'll take them after the first one was merged into Linus's tree.

All now queued up, thanks.

greg k-h
