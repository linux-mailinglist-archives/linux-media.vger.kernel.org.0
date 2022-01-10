Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2534C489787
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 12:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244740AbiAJLcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 06:32:48 -0500
Received: from mga12.intel.com ([192.55.52.136]:13228 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244768AbiAJLck (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 06:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641814359; x=1673350359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=evoguys23ZwUlcMQh2P7qtEhP0idRPkbItUq9JkHZWk=;
  b=WFLTweBMxtR2VjYDjXd9Voi7f6647j8wiiYdtMfqIv+aznz4MBtnPiIQ
   lT4JwWENuA7cLjIn6TQ+QRf7Hv2PkbPiMZhFlMd4QiWoTEzZRNoMSbdor
   Z4Refv7OaKoIXN/7O5LiwvMnbvjBWs+n0RZtvpEpNgz6CwLuxnjrhoslK
   NI446qCiUbJHvq2o1oZxVWK6mnaUr0LGbFCq8adOYqQumJOqIKDthWspT
   uqs/FPCi9Ff7h5O2h/Bv6f8AnNV60jnXn+nZS5KVqbKGYklf2sN8G2rHz
   ZGj6ftTsjFwg2bdJ8Wpv3rPri4U77nLpFlDcp5s7QOG68MSCBalo6bUcx
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="223187807"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="223187807"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 03:32:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="690546947"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 03:32:36 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0C447202B9;
        Mon, 10 Jan 2022 13:32:34 +0200 (EET)
Date:   Mon, 10 Jan 2022 13:32:34 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>
Subject: Re: [PATCH] media: ov5675: use group write to update digital gain
Message-ID: <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
 <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
 <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 29, 2021 at 10:00:43AM +0000, Cao, Bingbu wrote:
> Hi Sakari, 
> 
> Thanks for your review.
> 
> ________________________
> BRs,  
> Bingbu Cao 
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Wednesday, December 29, 2021 5:42 PM
> > To: Cao, Bingbu <bingbu.cao@intel.com>
> > Cc: linux-media@vger.kernel.org; Tu, ShawnX <shawnx.tu@intel.com>;
> > senozhatsky@chromium.org; tfiga@chromium.org; bingbu.cao@linux.intel.com;
> > Yeh, Andy <andy.yeh@intel.com>
> > Subject: Re: [PATCH] media: ov5675: use group write to update digital
> > gain
> > 
> > Hi Bingbu,
> > 
> > On Wed, Dec 29, 2021 at 04:57:39PM +0800, Bingbu Cao wrote:
> > > MWB gain register are used to set gain for each mwb channel mannually.
> > > However, it will involve some artifacts at low light environment as
> > > gain cannot be applied to each channel synchronously. Update the
> > > driver to use group write for digital gain to make the sure RGB
> > > digital gain be applied together at frame boundary.
> > 
> > How about the analogue gain and exposure time?
> > 
> > Shouldn't they be applied similarly as well? Adding two more writes
> > increases the probability of missing a frame there.
> 
> We did not meet issue related to analog gain as the it was applied by only
> 1 reg write, it looks like same issue we found on ov8856, changing to set
> digital gain by only 1 global gain write will fix the problem.

That device is different in its support for global digital gain. This patch
sets the gain for each component separately.

Adding more writes on a given frame increases the probability of slipping
to the following frame. Doing the exposure and gain updates in the same 
group write would alleviate that a little.

> 
> > 
> > This is of course a trick since the control framework doesn't really
> > support this, but I think this support should be added.
> > 
> > --
> > Regards,
> > 
> > Sakari Ailus

-- 
Sakari Ailus
