Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D226126D99F
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIQKwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:52:16 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:45190 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbgIQKwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:52:11 -0400
X-Greylist: delayed 1995 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:52:09 EDT
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08HAmPgZ173583;
        Thu, 17 Sep 2020 10:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=128JYvB1/lmV8xI78ndvYWC8FeCoUJpVcSljx9SrvpM=;
 b=BgicA9ehoRykkgTkNpjKAwj/XN7TtpnaePV4WmuvWeT2mqC1TRh6WLVaL4T8NkFQQLvt
 oAhaYrwk4G5HijzeIMZKgAPUwxsa8yEASN/XkHzKjdFoDrFXVdEGBdF8Ka0YjHoDflaV
 bWGkroDeTkLZHB66X2EjxXxmXIcs7Z4PeGegZMXYUigmZcH7YTmvjSGMdZ0PNHRdzESg
 DjLdDhR5axaXvG4fM6ZOaiXT6Da5JvJZHvFDVLyM3xqQ9RUfQSnEhiDwxhqdKeHREg89
 K7Zkac9PX+layGgGUWIlkGmma6sR54e/C46HhAbN9FRdIsvb0rxrba9Xlme32YHUefKg rw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 33j91dt402-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Sep 2020 10:51:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08HAinTl095421;
        Thu, 17 Sep 2020 10:49:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 33h893gq3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Sep 2020 10:49:53 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08HAnp23028997;
        Thu, 17 Sep 2020 10:49:51 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Sep 2020 10:49:50 +0000
Date:   Thu, 17 Sep 2020 13:49:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, devel@driverdev.osuosl.org,
        robh@kernel.org, andriy.shevchenko@linux.intel.com,
        jorhand@linux.microsoft.com, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com, kitakar@gmail.com,
        bingbu.cao@intel.com, mchehab@kernel.org, davem@davemloft.net,
        tian.shu.qiu@intel.com, yong.zhi@intel.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200917104941.GP4282@kadam>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917103343.GW26842@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009170082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170083
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 01:33:43PM +0300, Sakari Ailus wrote:
> > +static int connect_supported_devices(void)
> > +{
> > +	struct acpi_device *adev;
> > +	struct device *dev;
> > +	struct sensor_bios_data ssdb;
> > +	struct sensor *sensor;
> > +	struct property_entry *sensor_props;
> > +	struct property_entry *cio2_props;
> > +	struct fwnode_handle *fwnode;
> > +	struct software_node *nodes;
> > +	struct v4l2_subdev *sd;
> > +	int i, ret;
> 
> unsigned int i
> 

Why?

For list iterators then "int i;" is best...  For sizes then unsigned is
sometimes best.  Or if it's part of the hardware spec or network spec
unsigned is best.  Otherwise unsigned variables cause a ton of bugs.
They're not as intuitive as signed variables.  Imagine if there is an
error in this loop and you want to unwind.  With a signed variable you
can do:

	while (--i >= 0)
		cleanup(&bridge.sensors[i]);

There are very few times where raising the type maximum from 2 billion
to 4 billion fixes anything.

regards,
dan carpenter

