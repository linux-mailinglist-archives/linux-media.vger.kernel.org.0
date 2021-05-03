Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE76371301
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 11:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbhECJag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 05:30:36 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51496 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbhECJaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 05:30:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1439Ej47095761;
        Mon, 3 May 2021 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=D9UNFPRmfvogZj9PAB7k6zDOA5DgR66HQyCjzw0gC7g=;
 b=jglg8iSsE9X60e3V3hTwmJTyMyDrs/krt6TPV9Nia+OLRp4xo+UjOQfWGCOJ1pGP/ZqG
 63ZasQzaYquod3AOV5oyQxPUEFDMgTwO54J3NX46yTWMQocU3RSQLi/zpv/UNnI65RsF
 +KPap+anQKgIpjZ/7YlK9O4vPRKo4nNL/3Ks2rpbRjNz2on0TSjGMI2fNALr3oHAMgPL
 kVwCPsYDXoEmok8u2YbSCwQNpHVJGG1jQn8CLAkBaurKrAes6hLcBWlYzhGIC/fyzSwg
 Br1WcvCAcE57n+nGj5MZfXPEf5ptHktyGrV5WP6pEbteAY/ZNGrqGmCaqM/D4NCmo8Fa Qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 389h13syd1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 May 2021 09:29:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1439ABI8116302;
        Mon, 3 May 2021 09:29:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 388xt234rs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 May 2021 09:29:33 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1439TWpE191144;
        Mon, 3 May 2021 09:29:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 388xt234rd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 May 2021 09:29:32 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1439TVNC004813;
        Mon, 3 May 2021 09:29:31 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 May 2021 02:29:31 -0700
Date:   Mon, 3 May 2021 12:29:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Remove unused variable
Message-ID: <20210503092924.GO1981@kadam>
References: <YIyCJoEwdqgqkxYN@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIyCJoEwdqgqkxYN@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 7S3tJumW5rB0_PZXjIny7zHgSmJqKNrg
X-Proofpoint-GUID: 7S3tJumW5rB0_PZXjIny7zHgSmJqKNrg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9972 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030062
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 06:18:14PM -0400, Nigel Christian wrote:
> The variable buflen is being assigned a value that is never read,
> which can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9a791d8ef200..370b086c6e22 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -768,7 +768,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		format->xfer_func = uvc_xfer_func(buffer[4]);
>  		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
>  
> -		buflen -= buffer[0];
>  		buffer += buffer[0];
>  	}

This is a situation where I think that the unused assignment helps
readability because it shows how buflen and buffer are connected.

regards,
dan carpenter

