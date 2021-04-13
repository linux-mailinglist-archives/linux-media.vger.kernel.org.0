Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8328F35DD7F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245103AbhDMLMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:12:10 -0400
Received: from mga14.intel.com ([192.55.52.115]:56349 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244449AbhDMLMJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:12:09 -0400
IronPort-SDR: UaKPU4vLPxoCYsBaFuab69+JWKtu0RtLMxgeBoxgLVkpppfIAd1ICjK9Be8shNIKryfpZscTYY
 oR9RA3OKuTuw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="193951071"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="193951071"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 04:11:45 -0700
IronPort-SDR: 1IkuPvPYrc3t8CU6+XciUlWKhD+O/HFxILxn3xoyhU2kBYk6kSu2Zbgd2JTqL0CkYOx9I7RYw8
 1z1vNPio0Oxg==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="532247488"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 04:11:42 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D8E38200E8;
        Tue, 13 Apr 2021 14:11:40 +0300 (EEST)
Date:   Tue, 13 Apr 2021 14:11:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <20210413111140.GV3@paasikivi.fi.intel.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
 <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
 <20210413100134.GR3@paasikivi.fi.intel.com>
 <YHV1uOq9pXmGUD+x@kali>
 <20210413104432.GU3@paasikivi.fi.intel.com>
 <YHV45I6ZDsXNwdiG@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHV45I6ZDsXNwdiG@kali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 04:26:36PM +0530, Mitali Borkar wrote:
> On Tue, Apr 13, 2021 at 01:44:32PM +0300, Sakari Ailus wrote:
> > On Tue, Apr 13, 2021 at 04:13:04PM +0530, Mitali Borkar wrote:
> > > On Tue, Apr 13, 2021 at 01:01:34PM +0300, Sakari Ailus wrote:
> > > > Hi Mitali,
> > > > 
> > > > Thanks for the update.
> > > > 
> > > > On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> > > > > Reduced length of the line under 80 characters to meet linux-kernel
> > > > > coding style.
> > > > > 
> > > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > > ---
> > > > > 
> > > > > Changes from v1:- Reduced length of the line under 80 characters
> > > > > 
> > > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > index 6a72c81d2b67..52dcc6cdcffc 100644
> > > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > > @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
> > > > >   */
> > > > >  struct ipu3_uapi_ae_config {
> > > > >  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> > > > > -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> > > > > +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> > > > > +							__aligned(32);
> > > > 
> > > > Do you still have the other two patches in your tree? This doesn't apply
> > > > here due to the different attribute syntax.
> > > >
> > > I have patch 1/6 and 2/6 in my tree which you asked me to drop.
> > 
> > Could you drop them and then submit v3?
> >
> I am extremely sorry Sir, but I am still learning to use git, drop them
> means to delete those commits? Even if I delete those, this patch was
> made after those, so the changes I made then will remain as it is, so
> what to do now? 

No worries.

Yes, please remove the two commits, as you need to use the same (or at
least non-conflicting) baseline for the patches compared to the tree where
the patches will be applied.

So in practice what you need to do is to rebase these four patches on
linux-media tree's master branch and resolve the resulting conflict in this
patch (as the preceding patches no longer have the attribute changes).

The -i option for git rebase in particular is useful.

-- 
Sakari Ailus
