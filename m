Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B868B11CC96
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 12:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbfLLLwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 06:52:09 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:42258 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfLLLwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 06:52:09 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBCBk7d0092536;
        Thu, 12 Dec 2019 11:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=QYEt3ZHHvwyo7hQcDmCsE+2gnaQbCn7M898TjPIxqIY=;
 b=VxL13QJJ9Of4N03WEBOiXN7ilSvi6qi6PSIqU3S7oZ30BCKJzeXcjF+x7JwDl0a8+Ycc
 O7ZrrIzcCA4TBPFXa1fJpuDVUPtkHwCLVKDe55yi93nrYYf1t4/SS3+TdDBzURQ7Q1Mn
 gpsu0BL1YSMUCjPPLnLDuauwG1/PFXgEsOzo821C6qDPij+YrHGsBIq5H3I8XZcVFTaV
 t6sHGaU/syEJVTXAXRo5NpETL4woyC7vxMd76uzIYK8AezMPk1LdzvmQITAa5097xgzN
 Sik1lO6nz7wmtcd4D//EFSgE3jCvQDS2sC4MRjwbxVlz5YHDbhCL3XcuZWnOvnELZAIi bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2wr4qrte1k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Dec 2019 11:51:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBCBnDlu054722;
        Thu, 12 Dec 2019 11:51:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2wums91y16-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Dec 2019 11:51:48 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBCBpiHo024067;
        Thu, 12 Dec 2019 11:51:44 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 12 Dec 2019 03:51:43 -0800
Date:   Thu, 12 Dec 2019 14:51:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     devel@driverdev.osuosl.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx7-mipi-csis: Add the missed
 v4l2_async_notifier_cleanup in remove
Message-ID: <20191212115134.GA1895@kadam>
References: <20191209085828.16183-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209085828.16183-1-hslester96@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9468 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912120089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9468 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912120089
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 09, 2019 at 04:58:28PM +0800, Chuhong Yuan wrote:
> All drivers in imx call v4l2_async_notifier_cleanup() after unregistering
> the notifier except this driver.
> This should be a miss and we need to add the call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 99166afca071..2bfa85bb84e7 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1105,6 +1105,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
>  	mipi_csis_debugfs_exit(state);
>  	v4l2_async_unregister_subdev(&state->mipi_sd);
>  	v4l2_async_notifier_unregister(&state->subdev_notifier);
> +	v4l2_async_notifier_cleanup(&state->subdev_notifier);
>  

In this case the "state->subdev_notifier" was never initialized or used
so both v4l2_async_notifier_unregister() and v4l2_async_notifier_cleanup()
are no-ops.

We should just delete "subdev_notifier".

regards,
dan carpenter

