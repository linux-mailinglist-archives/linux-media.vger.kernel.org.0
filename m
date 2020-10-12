Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF0828AFCD
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 10:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgJLINd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 04:13:33 -0400
Received: from mga12.intel.com ([192.55.52.136]:30765 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728956AbgJLINd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 04:13:33 -0400
IronPort-SDR: rYJyCBwycF/OCgMBxs1kZkcRWH9I2REcmQL5lJAt5rA8MYZG3TTPGzAhXHmnom7Ummgptwy+kH
 1/PkkGREkG0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="145026550"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="145026550"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 01:13:32 -0700
IronPort-SDR: M/aMtwvRDEM8VSCWfFnOkhoAJs2IJITuJ7Sb8vwZFSXe4Vo0HIeyW8NiCtLzgWeEn1iQjtbUVs
 AJ/tHcJ7d0uA==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="355718980"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 01:13:30 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 43ED520878; Mon, 12 Oct 2020 11:13:28 +0300 (EEST)
Date:   Mon, 12 Oct 2020 11:13:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] ipu3-cio2 format fixes
Message-ID: <20201012081328.GU26842@paasikivi.fi.intel.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150827.GJ6413@valkosipuli.retiisi.org.uk>
 <CAHp75VeK9O4OMaeBHU04LrMq06oKe-UppYsd4OZHNvDwp5S5fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeK9O4OMaeBHU04LrMq06oKe-UppYsd4OZHNvDwp5S5fQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Oct 09, 2020 at 07:23:57PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 9, 2020 at 6:11 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > On Fri, Oct 09, 2020 at 06:07:51PM +0300, Sakari Ailus wrote:
> > > Hello all,
> > >
> > > This set addresses most notable subdev format related issues, namely the
> > > sub-device sink format being unaccessible. The result of accessing it
> > > varied from oopses to crashes.
> > >
> > > since v1:
> > >
> > > - Validate try format, too
> > >
> > > - Set field in subdev format to V4L2_FIELD_NONE
> > >
> > > - Add a comment explaining the lock
> > >
> > > - Make values that should be unsigned, unsigned
> >
> > This is obviously v2. v1 is here:
> 
> v2 is good enough, but few nit-picks here and there. In any case
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks!

-- 
Sakari Ailus
