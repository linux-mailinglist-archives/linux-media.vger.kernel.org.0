Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717F73980FA
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 08:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhFBGQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 02:16:45 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:51344 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhFBGQo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 02:16:44 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1526968N009246;
        Wed, 2 Jun 2021 06:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=eDBiG4/wt/rox7qJOomfFC+kqVrYBXZZId5X5gfvXNk=;
 b=BplS766nLbC+xuzQ/4/xHwVQI6naSjUPT/RD0JEPqXGI4d+fTE+VAaE37PvAFccqBL8x
 ADFWqa1cWpFdd8xLtzw21ie5cpVT6KgAe0gcDdmM/ouLqrMIkV1fnU8epuLwelbMu/C3
 adaChhNaB7QQhafxWCsYzg2KP39wVmp46nkE1VJQ2cXofpxWeU3lcq3FSYOe18RjrEXK
 Jv7ccJlrOxredRsl8CzPufZIVBq7e5s+79fuNCydZP9KmM7HXr/8AzMF8RqkX4MT1fUP
 6IpCS9EcOS4O173PoBPNsA8R6BW8ZBczk2zQ7MYw8tiYMclRBRJ/wPTZTcK+uCPy41Y1 pg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 38ub4cqgwc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 06:13:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15269vMO073427;
        Wed, 2 Jun 2021 06:13:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38uaqwy80p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 06:13:17 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1526DH8t082882;
        Wed, 2 Jun 2021 06:13:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 38uaqwy80f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Jun 2021 06:13:17 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1526DFBH008351;
        Wed, 2 Jun 2021 06:13:15 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Jun 2021 23:13:15 -0700
Date:   Wed, 2 Jun 2021 09:13:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 -next] media: atomisp: Remove unneeded if-null-free
 check
Message-ID: <20210602061308.GE1955@kadam>
References: <20210602014547.4135423-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602014547.4135423-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 191ClavN1McdP1dAQ-3waxzutZ6BB2ue
X-Proofpoint-ORIG-GUID: 191ClavN1McdP1dAQ-3waxzutZ6BB2ue
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10002 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106020040
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 02, 2021 at 09:45:47AM +0800, Zheng Yongjun wrote:
> Eliminate the following coccicheck warning:
> 
> drivers/staging/media/atomisp/pci/sh_css_firmware.c:367:4-10: WARNING:
> NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_firmware.c:369:4-10: WARNING:
> NULL check before some freeing functions is not needed.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> index f4ce8ace9d50..5301cc014c7e 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
>  		unsigned int i = 0;
>  
>  		for (i = 0; i < sh_css_num_binaries; i++) {
> -			if (fw_minibuffer[i].name)
> -				kfree((void *)fw_minibuffer[i].name);
> -			if (fw_minibuffer[i].buffer)
> -				kvfree(fw_minibuffer[i].buffer);
> +			kfree((void *)fw_minibuffer[i].name);

Sorry, I should have mentioned this.  Remove the cast as well.

			kfree(fw_minibuffer[i].name);

regards,
dan carpenter

> +			kvfree(fw_minibuffer[i].buffer);
>  		}

