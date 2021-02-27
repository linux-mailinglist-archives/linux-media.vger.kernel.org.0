Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8B4326CA6
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 11:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhB0KS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Feb 2021 05:18:27 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:49340 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhB0KS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Feb 2021 05:18:26 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11RAErP2011298;
        Sat, 27 Feb 2021 10:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/gDcLLuFl7W4taldCS9TUo6AneEou3aqwRVHC2c8rwY=;
 b=GvUAuK0GRzCYGHao5gNUudLpk97ij0iCX5oK4IL2eXX9vCapcnsR4+uVxtIXOmcVjlMv
 AR9kiotpR8lO/Lq9eKSHNYVvoC55voZ7Wgw8VPffbHXz3pM0hV8NKXn5GocoL7QXYcGe
 IMtTsZbUmWFYPWx3t1OXJgz7Us/tMhgG3ypA6chPL9uQn67POLsokKptlAg2B7qACrRd
 xoqysiYNCn3VjFewRH5DwxJ4tcIyyK6JKWeADVh4qFwskHHCkufX5JpEUWItOrQofhAk
 z2ZPlOTmSHzybWg+AwY7ZxJfhIrTffbKXnbqat+bPedthvEkM69nrme238lZ4u3eQUXa Hg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 36ybkb0h17-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Feb 2021 10:17:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11RAEiV4183440;
        Sat, 27 Feb 2021 10:17:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 36yb6s3vct-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Feb 2021 10:17:34 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11RAHRTx000304;
        Sat, 27 Feb 2021 10:17:27 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 27 Feb 2021 02:17:27 -0800
Date:   Sat, 27 Feb 2021 13:17:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: adp1653: fix error handling from a call to
 adp1653_get_fault
Message-ID: <20210227101719.GG2087@kadam>
References: <20210226232229.1076199-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226232229.1076199-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102270083
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9907 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102270083
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 26, 2021 at 11:22:29PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The error check on rval from the call to adp1653_get_fault currently
> returns if rval is non-zero. This appears to be incorrect as the
> following if statement checks for various bit settings in rval so
> clearly rval is expected to be non-zero at that point. Coverity
> flagged the if statement up as deadcode.  Fix this so the error
> return path only occurs when rval is negative.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 287980e49ffc ("remove lots of IS_ERR_VALUE abuses")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/i2c/adp1653.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
> index 522a0b10e415..1a4878385394 100644
> --- a/drivers/media/i2c/adp1653.c
> +++ b/drivers/media/i2c/adp1653.c
> @@ -170,7 +170,7 @@ static int adp1653_set_ctrl(struct v4l2_ctrl *ctrl)
>  	int rval;
>  
>  	rval = adp1653_get_fault(flash);
> -	if (rval)
> +	if (rval < 0)
>  		return rval;

This is good, but all the other callers need to fixed as well:


   140  static int adp1653_get_ctrl(struct v4l2_ctrl *ctrl)
   141  {
   142          struct adp1653_flash *flash =
   143                  container_of(ctrl->handler, struct adp1653_flash, ctrls);
   144          int rval;
   145  
   146          rval = adp1653_get_fault(flash);
   147          if (rval)
   148                  return rval;
   149  
   150          ctrl->cur.val = 0;
   151  
   152          if (flash->fault & ADP1653_REG_FAULT_FLT_SCP)
                    ^^^^^^^^^^^^
flash->fault is the equivalent of "rval" for non-negative returns so
this condition can never be true.  We should never be returning these
weird firmware ADP1653_REG_FAULT_FLT_SCP fault codes to the v4l2 layers.

   153                  ctrl->cur.val |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
   154          if (flash->fault & ADP1653_REG_FAULT_FLT_OT)
   155                  ctrl->cur.val |= V4L2_FLASH_FAULT_OVER_TEMPERATURE;
   156          if (flash->fault & ADP1653_REG_FAULT_FLT_TMR)
   157                  ctrl->cur.val |= V4L2_FLASH_FAULT_TIMEOUT;
   158          if (flash->fault & ADP1653_REG_FAULT_FLT_OV)
   159                  ctrl->cur.val |= V4L2_FLASH_FAULT_OVER_VOLTAGE;
   160  
   161          flash->fault = 0;
   162  
   163          return 0;
   164  }

regards,
dan carpenter

