Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1197C19E1DE
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 02:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgDDAOb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 20:14:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:12367 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgDDAOb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 20:14:31 -0400
IronPort-SDR: 9LhhzJvHVTg11Yfk816ulHupLmZr7jF/Z4aqdm83hpg3GOHtMxnBijd+Ebai6udthDrzC6Xr59
 113T8aFJHqyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2020 17:14:31 -0700
IronPort-SDR: vNTE6kG94xEdJpAMmYzLYjHT8XhM3nuEGMCKNJv9hVOTYfPPg2+D+uzm4+hYiF0tVoUM69A3Eb
 TKIV2PDaB4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; 
   d="scan'208";a="451471764"
Received: from lskarbek-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.39.121])
  by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 17:14:27 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 0776221E34; Sat,  4 Apr 2020 03:14:25 +0300 (EEST)
Date:   Sat, 4 Apr 2020 03:14:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200404001425.GC4394@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Apr 03, 2020 at 09:32:42PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > Joe Perches <joe@perches.com> escreveu:
> 
> > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > in lib/vsprintf for this.
> 
> No need. FourCC, if Sakari makes it more generic, can be used for
> other purposes, e.g. printing component names from the chips (not
> related to media at all).

Could you elaborate?

This could be already used on DRM, presumably, and that does not depend on
CONFIG_MEDIA_SUPPORT. I don't know how much there would be a need for that,
though, but this remains a possibility.

-- 
Sakari Ailus
