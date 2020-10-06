Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27BC285158
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 20:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgJFSE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 14:04:27 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58310 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgJFSE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 14:04:27 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 096I3oNb174234;
        Tue, 6 Oct 2020 18:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=f5rjVfTDVP3MQlOMoVnck8eGw480j7JEUZw/oFMWa8Q=;
 b=alYozzxTXUk3ny1uipjt6jMJ9ZcRvJJE55hKOStixZuAh8kvkTzUWrGhsSXEmm36giMk
 8/ku5B6yRzU85K65aqX8m0KRMZzQ14puNveevCsFLrMKt2hdecBuYxoFoqRNyGd8KTeI
 qC6ujtwgQd1slBElZoA1LxCYKie0Liir+cJvwQDg1AamkgJcCrycAmOI2UZ3lz+ZOi29
 QpOOHXFS5tFyoSkyju4Eh24aG3yvpB9to2FpN5420sAiZyk83gAaI2JxaQrn561vaLdM
 /MH042qB5PxjoTJv4LmmoQEkWXTi+FetjBP96WUh87RPC8HCkqrb8IeP5z7OiOKEDv8t 8Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 33xhxmwfuv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 06 Oct 2020 18:04:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 096I0pKR125555;
        Tue, 6 Oct 2020 18:04:19 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 33y36ycjm3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Oct 2020 18:04:19 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 096I4Hej002415;
        Tue, 6 Oct 2020 18:04:17 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 06 Oct 2020 11:04:16 -0700
Date:   Tue, 6 Oct 2020 21:04:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Leonid Kushnir <leonf008@gmail.com>
Cc:     devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: staging: atomisp: Removed else branch in
 function
Message-ID: <20201006180410.GH4282@kadam>
References: <20201006081721.GA35979@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006081721.GA35979@linux>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9765 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9765 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010060117
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 06, 2020 at 10:17:21AM +0200, Leonid Kushnir wrote:
> This patch fixes the checkpatch.pl warning :
> 
> WARNING: else is not generally useful after a break or return
> 
> Expressions under 'else' branch in function 'gc0310_s_power' are
> executed whenever the exppression in 'if' is False. Otherwise, return
> from function occurs. Therefore, there is no need in 'else', and it has
> been removed.
> 
> Signed-off-by: Leonid Kushnir <leonf008@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 6be3ee1d93a5..8201c15b5769 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -874,11 +874,10 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
>  
>  	if (on == 0)
>  		return power_down(sd);
> -	else {
> -		ret = power_up(sd);
> -		if (!ret)
> -			return gc0310_init(sd);
> -	}
> +	ret = power_up(sd);
> +	if (!ret)

Flip this check around as well.

> +		return gc0310_init(sd);
> +
>  	return ret;

Code should generally do "error handling" instead of "success handling".
That way the success path is always indented one tab and the error path
is indented two tabs.  I like to say that the call and the error handling
are part of the same thing, but with success handling, it's like
do the call, do more stuff, go back to the error handling from the
earlier call.

Anyway, TLDR, please write it like this:

	if (on == 0)
 		return power_down(sd);

	ret = power_up(sd);
	if (ret)
		return ret;

	return gc0310_init(sd);

regards,
dan carpenter
