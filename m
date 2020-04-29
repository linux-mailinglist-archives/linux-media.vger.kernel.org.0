Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B75A1BD742
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 10:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgD2I1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 04:27:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:24506 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgD2I1l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 04:27:41 -0400
IronPort-SDR: LjYX+DaSn2hMaE1Ks9s9IlyPRP7G5k9ewrb2xPc4PkcjbUL9Wf8pw6ggOFesAm4qKlxB3xxEOq
 91Z/FV4xjZCw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 01:27:41 -0700
IronPort-SDR: W/4msyKdb9V+98MIMYKss3DorlLQxeoO0zaHiX4tmZRrDLXQEG8oP2kR2ClkWDEZ1lsCVNkEsI
 27mnvlVHAcBA==
X-IronPort-AV: E=Sophos;i="5.73,330,1583222400"; 
   d="scan'208";a="459510757"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 01:27:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5DE1F202AE; Wed, 29 Apr 2020 11:27:37 +0300 (EEST)
Date:   Wed, 29 Apr 2020 11:27:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 4/6] media: v4l2-subdev: Assume V4L2_SUBDEV_API is
 selected
Message-ID: <20200429082737.GB9190@paasikivi.fi.intel.com>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-5-jacopo@jmondi.org>
 <20200428212643.GB5381@paasikivi.fi.intel.com>
 <20200429070215.gh3757q455ky6bkq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429070215.gh3757q455ky6bkq@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Apr 29, 2020 at 09:02:15AM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Wed, Apr 29, 2020 at 12:26:43AM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Apr 28, 2020 at 11:06:07PM +0200, Jacopo Mondi wrote:
> > > A sub-device device node can be registered in user space only if the
> > > CONFIG_V4L2_SUBDEV_API Kconfig option is selected.
> > >
> > > Remove checks from the v4l2-subdev file handle open/close functions and
> > > ioctl handler as they are only accessible if a device node was registered
> > > to user space in first place.
> >
> > Is there other motivation with this than clean up things a little?
> >
> 
> I had to add yet-another #if defined and I got fed up. If you don't
> have a device node registered you won't be able to access any of the
> functions where the existing #if defined() where placed.
> 
> > The change increases the binary size marginally if the Kconfig option is
> > disabled.
> >
> 
> I see. Should we instead guard the whole file handle operations and
> ioctl handler instead of having #if defined() spread inside them ? I
> assume they where there as leftover, as I'm still missing the point,
> give that, as said, without V4L2_SUBDEV_API, you can't register any
> device node to userspace..

I think that's why those #ifdefs have been originally put there --- it's
just dead code without the subdev nodes, and the compiler won't be able to
figure this out.

But it seems, later on, when people have added code that supports
sub-device nodes, no #ifdefs have been added.

I think I'd make sense to remove the current #ifdefs and add dummy ops for
everything where needed that truly depends on that Kconfig option (i.e.
sub-device nodes). Or just to remove these, as your patch does. It's not a
lot of code.

-- 
Kind regards,

Sakari Ailus
