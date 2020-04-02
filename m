Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4C419BE17
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 10:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387813AbgDBIw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 04:52:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:5611 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387749AbgDBIw0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 04:52:26 -0400
IronPort-SDR: Rl8ESYf2lQ8qr7XvpzESBeZZahccIWieKjsW4IDiZPdePh3xZ14iAzHBWqrmyUFN6BroJYcPhD
 rrU86zxcG/iA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 01:52:26 -0700
IronPort-SDR: lSTxC31/lHPveE8rO2r7/yKYE2gQkKeyi8aH5qvCKS22HS/1Hd4IKGn+ruHLVGhkTUBclS8gPv
 35cNGLbs1wsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="240768676"
Received: from tronach-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.38.191])
  by fmsmga007.fm.intel.com with ESMTP; 02 Apr 2020 01:52:22 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 0668121F19; Thu,  2 Apr 2020 11:52:16 +0300 (EEST)
Date:   Thu, 2 Apr 2020 11:52:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200402085216.GC1522@kekkonen.localdomain>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <87eet6mgk7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eet6mgk7.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Thu, Apr 02, 2020 at 11:34:48AM +0300, Jani Nikula wrote:
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
> just using the plain old %s, and your own helpers. Because frankly, the
> kernel printk specifiers also start getting more than a little obscure.

I don't really disagree... While this is functionality very commonly needed
in drivers, there are alternatives such as posted here:

<URL:https://lore.kernel.org/linux-media/20190916100433.24367-1-hverkuil-cisco@xs4all.nl/>

The 4cc codes added by this set is still relatively generic (while still
Linux subsystem specific and not related to e.g. hardware standards), but I
wonder how many other, possibly similar cases there could be in the kernel,
and how many new specifiers we might get with those all added.

For what it's worth, even C99 defines macros for printing some formats
such as PRIu64 for uint64_t.

-- 
Terveisin,

Sakari Ailus
