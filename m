Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBAE3150DA
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 14:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhBINwX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 08:52:23 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56982 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbhBINuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 08:50:50 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119Dhtw8165157;
        Tue, 9 Feb 2021 13:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=d1jjadXMBwzrdg7nO1YU2bytlbDpho1QhHt2OrlPiP4=;
 b=Ly7Jo6vxjsJTxqoDenLAtR6VGz6j1oQEwntIA2A+zt5/eo2c+DNuxTuV6vYbA5qAEaIg
 3rF71XRkSccftnGX2j/j6wwOu5uIwYWH5sjdCihTo4jRRojrOyGHU1zEaYXbrf1G0qMR
 U8VabPP+PDnW1EGYrwssD+PAfmfItFdQR5Qj4VNB85GNY6LwAvORyOAYAQiZpj0P1fdp
 7sCeKB6CdO9Lc1TCTBdVZeYrMQXZquQ8+H/4veiTcmGi+6fl6Ju36+t7yo+8t0xqzphY
 bPH/we6g/XKX1kWNe/fRg6OAyyVMVkUUHA4nCdvvkEo+WnkWiNzNeMz6fwQbldO1SPdM HQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 36hgmafmk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Feb 2021 13:49:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 119DnteM079481;
        Tue, 9 Feb 2021 13:49:57 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 36j4pnqbgx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Feb 2021 13:49:56 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 119DnnZn019201;
        Tue, 9 Feb 2021 13:49:49 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 09 Feb 2021 05:49:48 -0800
Date:   Tue, 9 Feb 2021 16:49:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx334: Fix an error message
Message-ID: <20210209134938.GP2696@kadam>
References: <YCJsUCngklBkJMgw@mwanda>
 <20210209120804.GD32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209120804.GD32460@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090071
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090070
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 09, 2021 at 02:08:04PM +0200, Sakari Ailus wrote:
> Hi Dan,
> 
> On Tue, Feb 09, 2021 at 02:04:48PM +0300, Dan Carpenter wrote:
> > The "ret" variable is uninitialized in this error message.
> > 
> > Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for the patch. This has been already addressed by a patch from Hans
> (but not merged yet):
> 
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl/>
> 
> > ---
> > When new drivers are merged into the kernel, then could we use the
> > driver prefix?  In other words something like this:
> > 
> > media: i2c/imx334: Add imx334 camera sensor driver
> 
> We've usually had driver's name and Mauro's scripts add media: prefix ---
> unless it's already there. Are you suggesting also the bus should be part
> of it?

No, what I'm saying is when people add a new driver they do:

[PATCH] subsystem: Add new driver for foo345

But it would be better if they added "foo345" to the prefix.

[PATCH] subsystem: foo345: Add new driver for foo345

Doing it the way that I'm suggesting has become more common for the past
four years.  Four years ago was when I started complaining that I can't
guess the correct prefix for new drivers.  That was also the last time
that someone complained to me that I had used the incorrect patch prefix.
I would argue that Hans used the wrong patch prefix for his patch so
maybe we have just become more mellow these days.

And also I'm surprised that Mauro adds the media: prefix for you instead
of making everyone do it themselves...  He's the only person who does
this that I know of.

regards,
dan carpenter
