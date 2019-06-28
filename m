Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E16E594DA
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 09:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfF1H3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 03:29:13 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:46974 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbfF1H3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 03:29:13 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5S7NpPT082922;
        Fri, 28 Jun 2019 07:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=eVp0fj2a3CahJv1vtl/9w4CV52CUJKAT7WbuznAHrjU=;
 b=z0NzqCAF+XcgQrMDawTZaxENcIXaVUAtO8SuL0lJ/LsoodFnFt2SmvAgpr9d0Rq12nC2
 tV3XDOuHZ5iG4wte5EcWSB9D9wnsP8CRP1vNTD3/vuFCyaehSlwGkCNNxnVLKNNm9Yyt
 n+zMBdhsAWbY9TvojHNUmSynRqWBoMSCUL8ejzMUwK4pdW5p4eSlCYjFGIkRQpt7kq3G
 JvvKEfCewVrExB9qjLRsx49eupODpFNjS+zI3fSBZEWgjQpi4uHhW6prheNd/YO5MJBy
 yj4St6qLV9/8aI3QE45Dm324IrksfJycOG3PwwlnC2mCduMM3Mzfs6wnzKSVzgh5w+dm KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2t9c9q436f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Jun 2019 07:28:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5S7Rlxp161109;
        Fri, 28 Jun 2019 07:28:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2tat7dt0n2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Jun 2019 07:28:45 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5S7ShQB015527;
        Fri, 28 Jun 2019 07:28:44 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 28 Jun 2019 00:28:43 -0700
Date:   Fri, 28 Jun 2019 10:28:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/31] staging: bcm2835-camera: Ensure H264 header bytes
 get a sensible timestamp
Message-ID: <20190628072834.GE19015@kadam>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <1561661788-22744-2-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561661788-22744-2-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9301 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=863
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906280085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9301 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=915 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906280084
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 27, 2019 at 08:55:58PM +0200, Stefan Wahren wrote:
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> index 2b5679e..09273b0 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> @@ -90,6 +90,8 @@ struct bm2835_mmal_dev {
>  		s64         vc_start_timestamp;
>  		/* Kernel start timestamp for streaming */
>  		ktime_t kernel_start_ts;
> +		/* Timestamp of last frame */
> +		u64		last_timestamp;

Not directly related to this patch but the indenting in this .h file is
all higgle-piggledy.

regards,
dan carpenter

