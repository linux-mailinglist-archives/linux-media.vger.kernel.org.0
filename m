Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D352935DCA7
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343819AbhDMKo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:44:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:25467 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343814AbhDMKo4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:44:56 -0400
IronPort-SDR: Vat1+OsWf+6SDcq6Pu0Qe31iWmiMNqJpkiSQv1WiD07iGLHN0zhcwmf/F82jPvytSz2QgyYa6g
 jHu2uVMz6G6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="192257608"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="192257608"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 03:44:37 -0700
IronPort-SDR: 3PUF6PcGRPMdE3KsQleHMqmiukVuS53w9Xkb0qf1ik57NY6VgzQK+P0yyVBLftq4K/KDjGywbN
 MpgQ0qsyh78A==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="417813705"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 03:44:34 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B0B5E200E8;
        Tue, 13 Apr 2021 13:44:32 +0300 (EEST)
Date:   Tue, 13 Apr 2021 13:44:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <20210413104432.GU3@paasikivi.fi.intel.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
 <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
 <20210413100134.GR3@paasikivi.fi.intel.com>
 <YHV1uOq9pXmGUD+x@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHV1uOq9pXmGUD+x@kali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 04:13:04PM +0530, Mitali Borkar wrote:
> On Tue, Apr 13, 2021 at 01:01:34PM +0300, Sakari Ailus wrote:
> > Hi Mitali,
> > 
> > Thanks for the update.
> > 
> > On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> > > Reduced length of the line under 80 characters to meet linux-kernel
> > > coding style.
> > > 
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > > 
> > > Changes from v1:- Reduced length of the line under 80 characters
> > > 
> > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > index 6a72c81d2b67..52dcc6cdcffc 100644
> > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
> > >   */
> > >  struct ipu3_uapi_ae_config {
> > >  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> > > -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> > > +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> > > +							__aligned(32);
> > 
> > Do you still have the other two patches in your tree? This doesn't apply
> > here due to the different attribute syntax.
> >
> I have patch 1/6 and 2/6 in my tree which you asked me to drop.

Could you drop them and then submit v3?

Thanks.

-- 
Sakari Ailus
