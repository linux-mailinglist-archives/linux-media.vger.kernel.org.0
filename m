Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB4631887F
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 11:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhBKKp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 05:45:29 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38596 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhBKKnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 05:43:14 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11BAe4iX133188;
        Thu, 11 Feb 2021 10:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Xe9sB7Qk1qSAsU9VhnDn4Awkf7iQtl1Nfir7ipFy1F4=;
 b=RtGqtXNqnkDyIi+QLEsTU1j9zOqL7rih946dYG1W2hl+WFgHBjQT6Jy2M+41Smv5bHXE
 ptRaRzQA/Wj4T1CQxqaj8mFjJC/aBpgIhZn0cDT691xgrPf0I09Iy6hNDsUnXjCV9JXT
 30Di0LOlnOW0LEaX4RbHcdkDlZz4Wez8HJK1ulANTjPbFmv14oIZoU7bnCxOH73CpgHg
 sQS9w2zynWgUL7HpgmoKpA0alXWDgKwomZ/O9KvVw35CYTwNRgSSjGSb6o/269cUOj5u
 o/s52183cRazEFUcUSaowO0h6vckCPje6C2GYv2OzOINuhkB7LWwMBWoBLVBt175j6qE /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 36hgmaq3a9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 10:42:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11BAfXM2141389;
        Thu, 11 Feb 2021 10:41:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 36j513wf9g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 10:41:59 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11BAfvsB006111;
        Thu, 11 Feb 2021 10:41:58 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 11 Feb 2021 02:41:57 -0800
Date:   Thu, 11 Feb 2021 13:41:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Colin King <colin.king@canonical.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: imx334: Fix a read of the
 uninitialized variable ret
Message-ID: <20210211104148.GE2696@kadam>
References: <20210210190752.146631-1-colin.king@canonical.com>
 <20210210210303.GE3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210210303.GE3@paasikivi.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102110095
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102110095
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 10, 2021 at 11:03:03PM +0200, Sakari Ailus wrote:
> Hi Colin,
> 
> On Wed, Feb 10, 2021 at 07:07:52PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently there is a dev_err error message that is printing the
> > error status in variable ret (that has not been set) instead of
> > the correct error status from imx334->reset_gpio.  Fix this.
> > 
> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/media/i2c/imx334.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index 07e31bc2ef18..f8b1caf26c9b 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> >  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
> >  						     GPIOD_OUT_LOW);
> >  	if (IS_ERR(imx334->reset_gpio)) {
> > -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
> > +		dev_err(imx334->dev, "failed to get reset gpio %ld",
> > +			IS_ERR_VALUE(imx334->reset_gpio));

IS_ERR_VALUE() isn't right.  It would always print 1 here.  It should
just be PTR_ERR().

IS_ERR_VALUE() is like IS_ERR() but for when you're storing memory
addresses in an unsigned long variable.  get_unmapped_area(), for
example, returns unsigned longs.

regards,
dan carpenter
