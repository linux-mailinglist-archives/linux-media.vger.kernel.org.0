Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8B62B7E83
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 14:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgKRNqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 08:46:43 -0500
Received: from mga11.intel.com ([192.55.52.93]:29598 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgKRNqn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 08:46:43 -0500
IronPort-SDR: FCK53PYQbzFjETUrd7iAr1WBywEPeFMOoA6np3E5Ij0wOO6JMGD6IbSKsyhaBDsbuj+Dwz3iR8
 y1OiKKRFX6yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="167605742"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="167605742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:46:40 -0800
IronPort-SDR: A+1wPoOqc6VcMKV5ms9FREEMORysJAYEADr2If1LNs6DGudPcPN1ObM69US3HOjjCrARyreXur
 /tjm2R2dVd9A==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="532703525"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:46:38 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C719420808; Wed, 18 Nov 2020 15:46:36 +0200 (EET)
Date:   Wed, 18 Nov 2020 15:46:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH] media: i2c: Add ov9734 image sensor driver
Message-ID: <20201118134636.GI3940@paasikivi.fi.intel.com>
References: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
 <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain>
 <X7OLuFejNyAPJEfB@jagdpanzerIV.localdomain>
 <CAAFQd5AyJz1bcMZXQLjCbUGS_wMxC0WViHynDPA4KowTLK_V0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5AyJz1bcMZXQLjCbUGS_wMxC0WViHynDPA4KowTLK_V0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Wed, Nov 18, 2020 at 09:41:11PM +0900, Tomasz Figa wrote:
> On Tue, Nov 17, 2020 at 5:37 PM Sergey Senozhatsky
> <sergey.senozhatsky@gmail.com> wrote:
> >
> > On (20/11/17 17:07), Sergey Senozhatsky wrote:
> > > > +static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
> > > > +{
> > > > +   struct ov9734 *ov9734 = to_ov9734(sd);
> > > > +   struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > +   int ret = 0;
> > > > +
> > > > +   if (ov9734->streaming == enable)
> > > > +           return 0;
> > > > +
> > > > +   mutex_lock(&ov9734->mutex);
> > > > +   if (enable) {
> > > > +           ret = pm_runtime_get_sync(&client->dev);
> > > > +           if (ret < 0) {
> > > > +                   pm_runtime_put_noidle(&client->dev);
> > > > +                   mutex_unlock(&ov9734->mutex);
> > > > +                   return ret;
> > > > +           }
> > > > +
> > > > +           ret = ov9734_start_streaming(ov9734);
> > > > +           if (ret) {
> > > > +                   enable = 0;
> > > > +                   ov9734_stop_streaming(ov9734);
> > > > +                   pm_runtime_put(&client->dev);
> > > > +           }
> > > > +   } else {
> > > > +           ov9734_stop_streaming(ov9734);
> > > > +           pm_runtime_put(&client->dev);
> > > > +   }
> > >
> > > I assume that we will never see erroneous ->s_stream(0) calls or
> > >  ->s_stream(0) after unsuccessful ->s_stream(1). Otherwise we will
> > > do extra pm_runtime_put(), not matched by pm_runtime_get().
> >
> > Oh, no. There is (unprotected) if (ov9734->streaming) check
> > at the very top, so we are probably fine.
> 
> Hmm, should it be protected?

In principle, yes.

The patch is already in a pull request I've sent to Mauro, so any changes
should be on top.

-- 
Kind regards,

Sakari Ailus
