Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98EF735E
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 12:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfKKLqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 06:46:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:45884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbfKKLqS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 06:46:18 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F2832184C;
        Mon, 11 Nov 2019 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573472778;
        bh=Mngmwt5ehNfydvH5+MyDl+bMhJj5Sa8XVoQfZL7Muq8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aLnN84N3ez2marIBm1OMVpyOO6edGWJRaY81Rhak9oiqx87FWhAhHXJGFRRVylekl
         Sb/+i9uk969oKTPUQJxNu2v/EFBDq06xIMJ+EL9d6S4R4bRJcoT+izJHCh2wumze/x
         lbuwZaiy9h4VW6PRokkOouT/7h20pJSuzNldvQAg=
Date:   Mon, 11 Nov 2019 12:46:15 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Omer Shalev <omerdeshalev@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media:usb:cpia2: Properly check framebuffer mmap offsets
Message-ID: <20191111114615.GA418224@kroah.com>
References: <20191108215038.59170-1-omerdeshalev@gmail.com>
 <20191108204949.GA1277001@kroah.com>
 <a1c55e7d-4710-70e9-f4d0-8fc155197f07@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1c55e7d-4710-70e9-f4d0-8fc155197f07@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 09, 2019 at 12:39:43PM +0100, Hans Verkuil wrote:
> Hi Greg,
> 
> On 11/8/19 9:49 PM, Greg Kroah-Hartman wrote:
> > On Fri, Nov 08, 2019 at 09:50:36PM +0000, Omer Shalev wrote:
> >> The cpai2 driver's mmap implementation wasn't properly check for all
> >> possible offset values. Given a huge offset value , the calculation
> >> start_offset + size can wrap around to a low value and pass the check
> > 
> > I thought we checked that in the core of the kernel now, to keep all
> > drivers from not having to do this type of thing (as they obviously all
> > forgot to.)  Why is this still needed here as well?
> 
> Where is that checked in the core? I couldn't find anything, but I might
> have been looking in the wrong place.

Sorry, took me a while to find it.  Look at be83bbf80682 ("mmap:
introduce sane default mmap limits") as I think this should handle the
problem already.

thanks,

greg k-h
