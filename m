Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B8336D5C8
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239397AbhD1K23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:28:29 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60782 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhD1K23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:28:29 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13SAJgHG028469;
        Wed, 28 Apr 2021 10:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/9bdy+kzg4LBC9GOs35QE7gzX2rzLE0q9ZrYqic5tDo=;
 b=OgLS7bCQgAPFUiyCwHu5yDfZ3ERgdb670Eu/+07vdlZZEs1GG1sGux40nTY01MWjfjDL
 SXapLXlJQ7X3pJcLMmycToHbymzCkaITANGVRG32ocini3T5u/ZfzHVsRJQNi2PgzlvC
 mJiwKE7X2QBSpfbiHY+/ZGiWI84G3L9KrZauBDWNG5x54iRwJFc5stTQ8IFu3ayyHLTw
 JIWJT5YYu53hYbM6edt5hyNunkv3j5b/xbGmbfIbEJPxrg4AMhJPVbuUbjCHHgZ2M4Gf
 NmY03XSjvmZrshMSvRV6LiVjCyeR62HHGbiGrJHNJZ7zFzpvincOYZe4/dswChZWwJhX Nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 385aeq0bgk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 10:27:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13SAPpbU103461;
        Wed, 28 Apr 2021 10:27:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 384b588r27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 10:27:27 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13SARQOM109362;
        Wed, 28 Apr 2021 10:27:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 384b588r1m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 10:27:26 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13SARO44030660;
        Wed, 28 Apr 2021 10:27:25 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 28 Apr 2021 03:27:24 -0700
Date:   Wed, 28 Apr 2021 13:27:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/6] staging: media: atomisp: use __func__ over
 function names
Message-ID: <20210428102717.GT1981@kadam>
References: <cover.1619199344.git.drv@mailo.com>
 <2cb42846abb7cab5e64bc29d5e496766f5df169b.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb42846abb7cab5e64bc29d5e496766f5df169b.1619199344.git.drv@mailo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: i1J6sYWtyRlk7DSJCKfE0jF4h4WvARt-
X-Proofpoint-GUID: i1J6sYWtyRlk7DSJCKfE0jF4h4WvARt-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9967 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280068
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 25, 2021 at 02:13:15PM +0530, Deepak R Varma wrote:
> Replace hard coded function names from the debug print strings by
> standard __func__ predefined identifier. This resolves following
> checkpatch script WARNING:
> Prefer using '"%s...", __func__' to using function's name, in a string.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> Changes since v2:
>    - None.
> Changes since v1:
>    - None.
> 
>  .../staging/media/atomisp/i2c/atomisp-gc0310.c   |  2 +-
>  .../staging/media/atomisp/i2c/atomisp-gc2235.c   |  2 +-
>  .../staging/media/atomisp/i2c/atomisp-lm3554.c   |  2 +-
>  .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++++++--------
>  .../staging/media/atomisp/i2c/atomisp-ov2722.c   |  2 +-
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index d68a2bcc9ae1..b572551f1a0d 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -1292,7 +1292,7 @@ static int gc0310_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc0310_device *dev = to_gc0310_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc0310_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);
>  
>  	dev->platform_data->csi_cfg(sd, 0);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index e722c639b60d..548c572d3b57 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -1034,7 +1034,7 @@ static int gc2235_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc2235_device *dev = to_gc2235_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc2235_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);

Just delete printks that only print the function name.  We have ftrace
for that.  There are several others below.

regards,
dan carpenter

