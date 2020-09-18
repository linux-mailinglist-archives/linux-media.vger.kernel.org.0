Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CFB26F601
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 08:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRGkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 02:40:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:30753 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgIRGku (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 02:40:50 -0400
IronPort-SDR: TGq/yEMe3kL4dwKTfg9urBP3+sG2Hu79wwhciY9OjO7KtoH0HzLtFs+tfAAFRwCG8Taif3fmqu
 6W/liCuD6C8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147555658"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="147555658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 23:40:49 -0700
IronPort-SDR: /eF7IF2j1x7n1JHSe18rHooFEKh3iBpe6c6o7ZFey4vATigNWf85BIqU9ZIQAdLQ+RY6897kLT
 EThJEbfk+/aA==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="307770713"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 23:40:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 25BDB20815; Fri, 18 Sep 2020 09:40:43 +0300 (EEST)
Date:   Fri, 18 Sep 2020 09:40:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Daniel Scally <djrscally@gmail.com>, devel@driverdev.osuosl.org,
        robh@kernel.org, andriy.shevchenko@linux.intel.com,
        jorhand@linux.microsoft.com, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com, kitakar@gmail.com,
        bingbu.cao@intel.com, mchehab@kernel.org, davem@davemloft.net,
        tian.shu.qiu@intel.com, yong.zhi@intel.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200918064043.GE26842@paasikivi.fi.intel.com>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <20200917104941.GP4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917104941.GP4282@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Thu, Sep 17, 2020 at 01:49:41PM +0300, Dan Carpenter wrote:
> On Thu, Sep 17, 2020 at 01:33:43PM +0300, Sakari Ailus wrote:
> > > +static int connect_supported_devices(void)
> > > +{
> > > +	struct acpi_device *adev;
> > > +	struct device *dev;
> > > +	struct sensor_bios_data ssdb;
> > > +	struct sensor *sensor;
> > > +	struct property_entry *sensor_props;
> > > +	struct property_entry *cio2_props;
> > > +	struct fwnode_handle *fwnode;
> > > +	struct software_node *nodes;
> > > +	struct v4l2_subdev *sd;
> > > +	int i, ret;
> > 
> > unsigned int i
> > 
> 
> Why?
> 
> For list iterators then "int i;" is best...  For sizes then unsigned is
> sometimes best.  Or if it's part of the hardware spec or network spec
> unsigned is best.  Otherwise unsigned variables cause a ton of bugs.
> They're not as intuitive as signed variables.  Imagine if there is an
> error in this loop and you want to unwind.  With a signed variable you
> can do:
> 
> 	while (--i >= 0)
> 		cleanup(&bridge.sensors[i]);
> 
> There are very few times where raising the type maximum from 2 billion
> to 4 billion fixes anything.

There's simply no need for the negative integers here. Sizes (as it's a
size here) are unsigned, too, so you'd be comparing signed and unsigned
numbers later in the function.

-- 
Regards,

Sakari Ailus
