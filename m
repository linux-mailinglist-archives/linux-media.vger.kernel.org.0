Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F2319C33C
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 15:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731842AbgDBNxa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 09:53:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbgDBNxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 09:53:30 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2767E2073B;
        Thu,  2 Apr 2020 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585835610;
        bh=e2mD8+QaUawKZUIdArDDRCxzyP8fJnIv/2Fv/9jRSbc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aFK8PuE53AAEurbQ6VeYnOyh1G1pTUhbgyXsdRg2MbipOPO+gI+JyCrvqROJ7R9rS
         zV8JP+Cg4wd7in8MVjarXIHfQ+KYx9XwXc/A/QoFB+R6f4ATHc5wTAdHiWi5Uz7zjx
         Vb0Bim6QH05Wpi4bYe/MGDPagBZszEj1kfYIgaQ4=
Date:   Thu, 2 Apr 2020 15:53:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200402155323.6866b5c9@coco.lan>
In-Reply-To: <87eet6mgk7.fsf@intel.com>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
        <87eet6mgk7.fsf@intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 02 Apr 2020 11:34:48 +0300
Jani Nikula <jani.nikula@linux.intel.com> escreveu:

> On Wed, 01 Apr 2020, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.  
> 
> I'm not going to take a strong stand in one way or the other regarding
> the patch at hand, but I do think at some point we have to draw a line
> what should be included in printk formats. Arguably they should be
> reserved to things that are generally useful across large parts of the
> kernel, right?
> 
> I think the more specialized you get, the more you should think about
> just using the plain old %s, and your own helpers.

As I suggested it, from my side, I'd like to have it inside printk :-)

There is a subset of formats that are subsystem-specific anyway at
printk, like the network ones. We use extensively fourcc along the
media subsystem (and you probably also use fourcc at DRM). Even some input
devices nowadays may be using V4L2 core (some multi-sensor touching
devices), with depends on it.

So, those fourcc codes are pretty common. Having it at the printk
infra makes a lot easier for people to use them.

> Because frankly, the
> kernel printk specifiers also start getting more than a little obscure.

I liked one of the suggestions of using "%p4cc" (or maybe something
similar, if having a number there is a problem, like "%pAcc" or "%pfcc")
for this printk. This would be very easy for people to identify and 
remember about its meaning.

> Or could we conceive of a way to make this locally extensible yet safe,
> letting callers use something like %{foo}, as well as providing a
> locally relevant function to do the conversion?

That's something that it makes sense to be implemented in the future,
for things that would be self-contained inside an specific subsystem.

Thanks,
Mauro
