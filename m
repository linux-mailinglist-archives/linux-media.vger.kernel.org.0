Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2815557CB8
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 09:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfF0HFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 03:05:25 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47264 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfF0HFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 03:05:24 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R74G0p050697;
        Thu, 27 Jun 2019 07:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=hRU06uH8360fbw0mabho66WQvlTQhCWmUo1y/p8qPLs=;
 b=0V9EVW5P9eBAIXvdsepxSm1ALI4xXco/EmqlVFVNg/BzDf86KpH7fW7uad/4f8L4vBbn
 PfYO9yt1YVJ62IYcAnCDL6uGcw5dDJinKrILZpq4plxjz7ipIjVRn/mgOFRoOdSBln5P
 xHx8iwnu5broShhSVSymNSSszw5H4fLCNSpfwEjqHh7i6NuskWXQrJKMqsreADxvEmWB
 2PP1ynq4c3Ock9CcykrKZWdIlJf33/6geDPSP2tofmoEdxAIs+7Pr62OwtaOSmPT8gkw
 /IbRk7aFuuqOKezfc/46FwT/eKTrmQM6gE3++v4X4YX3yPgubCAnnnoz8Pk4psMsnHhW lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2t9cyqpbqh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 07:05:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R73SZ3005637;
        Thu, 27 Jun 2019 07:05:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2tat7d76m0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 07:05:04 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5R751CF021457;
        Thu, 27 Jun 2019 07:05:02 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 00:05:01 -0700
Date:   Thu, 27 Jun 2019 10:04:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: staging/imx: Fix NULL deref in
 find_pipeline_entity()
Message-ID: <20190627070452.GA19308@kadam>
References: <20190626185225.11992-1-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626185225.11992-1-slongerbeam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270081
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 26, 2019 at 11:52:25AM -0700, Steve Longerbeam wrote:
> Fix a cut&paste error in find_pipeline_entity(). The start entity must be
> passed to media_entity_to_video_device() in find_pipeline_entity(), not
> pad->entity. The pad is only put to use later, after determining the start
> entity is not the entity being searched for.
> 
> Fixes: 3ef46bc97ca2 ("media: staging/imx: Improve pipeline searching")
> 
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index b5b8a3b7730a..6fb88c22ee27 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -842,7 +842,7 @@ find_pipeline_entity(struct media_entity *start, u32 grp_id,
>  		if (sd->grp_id & grp_id)
>  			return &sd->entity;
>  	} else if (buftype && is_media_entity_v4l2_video_device(start)) {
> -		vfd = media_entity_to_video_device(pad->entity);
> +		vfd = media_entity_to_video_device(start);

Can we also remove the "pad = NULL" assignment at the start of the
function?  Otherwise static checkers and new versions of GCC will warn
that the assignment isn't used.  Plus removing the initialization will
prevent bugs like this in the future.

regards,
dan carpenter

