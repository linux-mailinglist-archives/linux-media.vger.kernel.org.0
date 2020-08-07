Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C89123E752
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 08:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgHGG2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 02:28:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgHGG2N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Aug 2020 02:28:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99F7122CF6;
        Fri,  7 Aug 2020 06:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596781693;
        bh=AUsPBLdLKr44ZCkwsOyeqG6DjOnWpE+YwbGA9SXtmY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uryiJWLz3T58vNpTVTIHn2na9ql+ZIfe33Ev8pSL5Tf/r3KgU4nLBlc39QdeITvk6
         eiuSb/KWb3rvFhTkJvGndJyoOkLgHxZdOM2hEIRk66CcvdbC6ZaYz4PO/CR5JChFav
         O7agK8ajitCEb70RbAM9kh/QSDqyvAxmYs4VUgRQ=
Date:   Fri, 7 Aug 2020 08:28:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, lkml <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RESEND PATCH] media: atomisp: Replace trace_printk by pr_info
Message-ID: <20200807062809.GB979264@kroah.com>
References: <20200710144520.RESEND.1.Id0f52f486e277b5af30babac8ba6b09589962a68@changeid>
 <20200710070332.GA1175842@kroah.com>
 <CANMq1KDcKWgyYYP_m0-WV7602g7zUbU0PPkvwXxbSTF5vFfKGQ@mail.gmail.com>
 <CANMq1KC7CgUT+neoOUZbnr8MbDgqEikqt2vn8dxAS1rpX=C2aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANMq1KC7CgUT+neoOUZbnr8MbDgqEikqt2vn8dxAS1rpX=C2aA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 07, 2020 at 09:50:23AM +0800, Nicolas Boichat wrote:
> On Fri, Jul 24, 2020 at 8:41 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Fri, Jul 10, 2020 at 3:03 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jul 10, 2020 at 02:45:29PM +0800, Nicolas Boichat wrote:
> > > > trace_printk should not be used in production code, replace it
> > > > call with pr_info.
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > ---
> > > > Sent this before as part of a series (whose 4th patch was a
> > > > change that allows to detect such trace_printk), but maybe it's
> > > > easier to get individual maintainer attention by splitting it.
> > >
> > > Mauro should take this soon:
> > >
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > Mauro: did you get a chance to look at this? (and the other similar
> > patch "media: camss: vfe: Use trace_printk for debugging only")
> 
> Mauro: Another gentle ping. Thanks.

It's the middle of the merge window, maintainers can't do anything until
after 5.9-rc1 is out, sorry.

greg k-h
