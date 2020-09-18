Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416A926F7CF
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 10:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRIQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 04:16:38 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:39958 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIRIQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 04:16:38 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08I8F2p2070722;
        Fri, 18 Sep 2020 08:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=XZIYm24yndlWZXI5R5Yn+Q8BksLATNq+z3yjFm3AtHA=;
 b=YUz17olhIiyfVpmLPeUEvUXXTHm+DPpH6IRUD1lcgVzol0cilLunRafThRgfumbumdr+
 UiXy6Pi95Gwx1Yi7zv2j0JpOcOEf8NGzOYpgMIw6vBlNVTWMVDJAGi1lvGlHfbJUNz3n
 UAlmcADOI/wYQisZZ6qCEB5GLixnD+KFuxSzCsOdXtPOOe2XM3WNBN/QxL5vCeSn8fmx
 Bby4JNT3jKL4c2RbapJdgyvyPpilx7G17FlXjK3f+a+dSvXO+CfMkaCETdUTJ+O26t0+
 e0o5D8nGnkuApKk6njKVp4FhSD0rQuxG2Z0PnjfutDkIRkimakPLLNcrvdZrTIlfmpGc pQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 33gp9mnn63-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Sep 2020 08:16:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08I8G1hN106137;
        Fri, 18 Sep 2020 08:16:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 33hm36dvus-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Sep 2020 08:16:24 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08I8GKxn007685;
        Fri, 18 Sep 2020 08:16:20 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Sep 2020 08:16:20 +0000
Date:   Fri, 18 Sep 2020 11:16:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devel@driverdev.osuosl.org, robh@kernel.org, mchehab@kernel.org,
        jorhand@linux.microsoft.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Daniel Scally <djrscally@gmail.com>, kitakar@gmail.com,
        yong.zhi@intel.com, bingbu.cao@intel.com,
        andriy.shevchenko@linux.intel.com, davem@davemloft.net,
        tian.shu.qiu@intel.com, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200918081609.GR18329@kadam>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <20200917104941.GP4282@kadam>
 <20200918064043.GE26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918064043.GE26842@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9747 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180069
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 18, 2020 at 09:40:43AM +0300, Sakari Ailus wrote:
> Hi Dan,
> 
> On Thu, Sep 17, 2020 at 01:49:41PM +0300, Dan Carpenter wrote:
> > On Thu, Sep 17, 2020 at 01:33:43PM +0300, Sakari Ailus wrote:
> > > > +static int connect_supported_devices(void)
> > > > +{
> > > > +	struct acpi_device *adev;
> > > > +	struct device *dev;
> > > > +	struct sensor_bios_data ssdb;
> > > > +	struct sensor *sensor;
> > > > +	struct property_entry *sensor_props;
> > > > +	struct property_entry *cio2_props;
> > > > +	struct fwnode_handle *fwnode;
> > > > +	struct software_node *nodes;
> > > > +	struct v4l2_subdev *sd;
> > > > +	int i, ret;
> > > 
> > > unsigned int i
> > > 
> > 
> > Why?
> > 
> > For list iterators then "int i;" is best...  For sizes then unsigned is
> > sometimes best.  Or if it's part of the hardware spec or network spec
> > unsigned is best.  Otherwise unsigned variables cause a ton of bugs.
> > They're not as intuitive as signed variables.  Imagine if there is an
> > error in this loop and you want to unwind.  With a signed variable you
> > can do:
> > 
> > 	while (--i >= 0)
> > 		cleanup(&bridge.sensors[i]);
> > 
> > There are very few times where raising the type maximum from 2 billion
> > to 4 billion fixes anything.
> 
> There's simply no need for the negative integers here. Sizes (as it's a
> size here) are unsigned, too, so you'd be comparing signed and unsigned
> numbers later in the function.

I'm not trying to be rude, I'm honestly puzzled by this...

The "i" variable is not a size, it's an iterator...  Comparing signed
and unsigned isn't necessarily a problem, but the only comparison in
this case is here:

   253          struct property_entry *cio2_props;
   254          struct fwnode_handle *fwnode;
   255          struct software_node *nodes;
   256          struct v4l2_subdev *sd;
   257          int i, ret;
   258  
   259          for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
That's obviously fine.  The compiler knows at compile time the value of
ARRAY_SIZE().  I feel like there must be a static checker which
complains about this?  ARRAY_SIZE() is size_t.

   260                  adev = acpi_dev_get_first_match_dev(supported_devices[i],
   261                                                      NULL, -1);
   262  
   263                  if (!adev)
   264                          continue;
   265  

regards,
dan carpenter

