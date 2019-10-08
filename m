Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7527CCF31A
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 08:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbfJHG6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 02:58:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:41205 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730111AbfJHG6V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 02:58:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 23:58:21 -0700
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; 
   d="scan'208";a="344954697"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 23:58:19 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 05F8820976; Tue,  8 Oct 2019 09:58:16 +0300 (EEST)
Date:   Tue, 8 Oct 2019 09:58:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191008065816.GA24435@paasikivi.fi.intel.com>
References: <20191004172418.2339-1-bparrot@ti.com>
 <20191004172418.2339-2-bparrot@ti.com>
 <20191007080320.GG14917@paasikivi.fi.intel.com>
 <20191007151703.z3eejxuujzt5ruth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007151703.z3eejxuujzt5ruth@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 07, 2019 at 10:17:03AM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Oct-07 11:03:20 +0300]:
> > On Fri, Oct 04, 2019 at 12:24:16PM -0500, Benoit Parrot wrote:
> > > @@ -2657,6 +2669,12 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  	/* we can use our own mutex for the ctrl lock */
> > >  	hdl->lock = &sensor->lock;
> > >  
> > > +	/* Clock related controls */
> > > +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > > +					      0, INT_MAX, 1,
> > > +					      ov5640_calc_pixel_rate(sensor));
> > > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > 
> > Please check ctrls->pixel_rate first; it may be NULL here.
> 
> How about I just move this line below "if (hdl->error)" instead?

That's fine, too. As long as it won't oops if memory allocation fails...
:-)

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
