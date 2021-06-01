Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A433975BD
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 16:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhFAOsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 10:48:53 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52146 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhFAOsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 10:48:53 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 151EjOXC185494;
        Tue, 1 Jun 2021 14:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=NzPYCRnwavId3swqe43Sh4YoNVz7T0kuF+uL9OiFttI=;
 b=aszaS9sfNff08KM7+lVhOHe1hxaeqXusGjZeJl8Qn6P4gsrYo/WEen47yLZnschRBvW7
 CQQVok2mYUjbA1eZ6QtcJ2yUy7dhccJ7ajq4LdBvvyH1E8KhRAWVu9ZP0vm/rAX+t4kf
 +L+rx8UxfDxyooaN9Y3Nia7GF+hSD7ru8PPMQO6HSVTqvUSMHeQvvqJttTgZGSA3e+Gz
 KKXe/d1UytDErlPWQL+2ZSLO5HnucV2mvwDT2rwx4s32T8I48nTirZ47D234pWBePRfs
 0/2FFNykt2UnwrU9hItebJON1ClIMQy8PiaGJDLX+tdrIoL823qbD+2700MaUWWUbgS9 Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 38ub4cntws-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 14:46:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 151EkSLx167489;
        Tue, 1 Jun 2021 14:46:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38ubnd8679-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 14:46:56 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151Ekuw1168071;
        Tue, 1 Jun 2021 14:46:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 38ubnd866t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 14:46:56 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 151Ekq1m028325;
        Tue, 1 Jun 2021 14:46:52 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Jun 2021 14:46:51 +0000
Date:   Tue, 1 Jun 2021 17:46:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] media: atomisp: Remove unneeded if-null-free check
Message-ID: <20210601144644.GB1955@kadam>
References: <20210601142005.4132018-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601142005.4132018-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 4laRrVAYnDnxliylLSPvZFBHd1nhqE9Z
X-Proofpoint-ORIG-GUID: 4laRrVAYnDnxliylLSPvZFBHd1nhqE9Z
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10002 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010100
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 01, 2021 at 10:20:05PM +0800, Zheng Yongjun wrote:
> Eliminate the following coccicheck warning:
> 
> drivers/staging/media/atomisp/pci/sh_css_firmware.c:369:4-10: WARNING:
> NULL check before some freeing functions is not needed.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_firmware.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> index f4ce8ace9d50..980fc09fcc8b 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -365,8 +365,7 @@ void sh_css_unload_firmware(void)
>  		for (i = 0; i < sh_css_num_binaries; i++) {
>  			if (fw_minibuffer[i].name)
>  				kfree((void *)fw_minibuffer[i].name);

Change this too.

> -			if (fw_minibuffer[i].buffer)
> -				kvfree(fw_minibuffer[i].buffer);
> +			kvfree(fw_minibuffer[i].buffer);
>  		}
>  		kfree(fw_minibuffer);
>  		fw_minibuffer = NULL;

regards,
dan carpenter
