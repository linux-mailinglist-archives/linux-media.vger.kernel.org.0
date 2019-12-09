Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80BF51174FD
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 19:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfLIS5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 13:57:35 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53172 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfLIS5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 13:57:35 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB9InAbA174145;
        Mon, 9 Dec 2019 18:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=t4Q3+VCvf0pnJ0ErAbeBt14xGyjINJVueiRTqeprC+0=;
 b=iViU9+wIvq0XjOQvuDTgqpO5R0kHHZRU3WONhCx0brXfWPccbNaz02nP2nbsXlElZ8vY
 Z47vE2RHGh1bikbAYIyAH3aLOTSvDFD/OEqbHIE/CokuJI2GioXzkEvtUkOUnWZWyYOz
 9B5NG5yhtwLbHYF63uAepP/dV+fbxz9RejDcTXCLMcY+YKcMwndnOc47KuY66mmxkuqq
 /PaPyZ9YhL1jspJ3qsLQzdTMK1rN9/SKyklQi01lXFEBRi/248nk7n2cvS4HIUlPQrmX
 iAabKT5DI6ZeS+VDBz0aIzsJ10PqcWpwi0aFZXpGLZ+i5k7JbGr9PDfWU1ZF7zAdnUhX qA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2wr41q1hnr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 Dec 2019 18:57:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB9InDU8056065;
        Mon, 9 Dec 2019 18:55:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2wrnj3n52p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 Dec 2019 18:55:21 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB9ItKx0028094;
        Mon, 9 Dec 2019 18:55:20 GMT
Received: from kadam (/41.210.147.78)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 09 Dec 2019 10:55:14 -0800
Date:   Mon, 9 Dec 2019 21:54:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: allegro: add the missed check for
 v4l2_m2m_ctx_init
Message-ID: <20191209185411.GK1765@kadam>
References: <20191209085807.16126-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209085807.16126-1-hslester96@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9466 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912090151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9466 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912090151
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 09, 2019 at 04:58:07PM +0800, Chuhong Yuan wrote:
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 6f0cd0784786..5f1d454b41bb 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2341,6 +2341,13 @@ static int allegro_open(struct file *file)
>  	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
>  						allegro_queue_init);
>  
> +	if (IS_ERR(channel->fh.m2m_ctx)) {
> +		v4l2_fh_del(&channel->fh);
> +		v4l2_fh_exit(&channel->fh);
> +		kfree(channel);
                      ^^^^^^^
Free

> +		return PTR_ERR(channel->fh.m2m_ctx);
                               ^^^^^^^^^^^^^^^^^^^
Dereferencing freed memory.

regards,
dan carpenter

> +	}
> +

