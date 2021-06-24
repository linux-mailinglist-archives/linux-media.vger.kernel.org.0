Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1303B315F
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 16:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhFXOdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 10:33:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhFXOdj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 10:33:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E450613EA;
        Thu, 24 Jun 2021 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624545080;
        bh=YuKvzoqQ0pg7Fd3BtZPR9z3sHfNqO21gKPJzQWCRgMo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MKDqBY6vT+4uvj7pz3eRcWvQCoDKAl8pmFUJSUOXkfdlZUDliG9uiaIb7mj7ITMjP
         hQK6Hr5Ikc59AilZ6fjMavq8r9jFywPEkxbV1XxS/Ds2efSgdmbOuI5iUdNzLxrQXc
         oUB/zUtNrpP/1VE+bsleILVHjoK7ag7pWI1wOHNc=
Date:   Thu, 24 Jun 2021 16:31:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
Message-ID: <YNSXNPLKwbb+5vS8@kroah.com>
References: <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
 <m3mtrh5evo.fsf@t19.piap.pl>
 <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
 <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
 <m3bl7v6er0.fsf@t19.piap.pl>
 <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
 <YNR9CS/PfG7s1e71@kroah.com>
 <m3wnqj4ct3.fsf@t19.piap.pl>
 <YNSIqSQeefzai4fW@kroah.com>
 <m3o8bv4a9z.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3o8bv4a9z.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 04:17:28PM +0200, Krzysztof Hałasa wrote:
> Greg,
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> >> How about a book, e.g. describing a patch submission process (but not
> >> a copy of kernel's Documentation). The same?
> >
> > That does not make sense, please explain.
> 
> Why not? I can put such a text on a book (say, an e-book) as well.

Where would that text be and what would it mean?

> I'd say you're right with the absence of indication to the contrary -
> but if someone explicitly states something is not (e.g. yet) under GPL,
> then how one could say SPDX-something has legal precedence is beyound
> me.

It is identical to saying "this file is licensed under this specific
license".  That is what a spdx line means, please read up on them if you
are curious.

> > S-o-b is a DIFFERENT thing entirely.   Please go read the DCO for what
> > you are agreeing to there, it is a declaration for what you are doing.
> 
> Well, that's my position.

That's not what a signed-off-by means, please do not try to make it
something it is not.

thanks,

greg k-h
