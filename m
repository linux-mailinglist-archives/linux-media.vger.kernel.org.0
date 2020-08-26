Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940FE252ABC
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 11:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgHZJwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 05:52:16 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37998 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgHZJwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 05:52:15 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07Q9malW168699;
        Wed, 26 Aug 2020 09:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=puG6dn/0ZJ/S9eYVShDLSjSPKteNXnTDwq9+go1akjA=;
 b=wz3K0+h++jsK1mSFm80F42A8wKBHb/1KQIqOGgwGSfnKYECH26biQ3pFDGAS55vS4Xf3
 RM7QuvSza1jG41Z7CMlMx8ULnxzPOaZeSQIEjZFdiwvPhf0oSD63jesA2Ponpu5y4NXO
 tFR4CMbj++gRzz8ZhugnxdLtVU+ym/1LJcUXsWRzE0RxF6m1CFIUpRnJlk7e/0Xno4n9
 Nu/2Vt35D+QE4YxjTzlQV+xqTHeq/EE3a5+FzjiX/3IXF5JfODJU2RTuBijkXi4z/NR+
 W4wYdgqXNx9sEERAVC9PBQtrjSAvR/mAxZffqeLel7F7nIEwI+9am4zdeXET1YdQ9x1D Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 335gw819ft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Aug 2020 09:52:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07Q9ko6O101234;
        Wed, 26 Aug 2020 09:50:09 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 333r9kxw1r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Aug 2020 09:50:09 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07Q9o7ql023582;
        Wed, 26 Aug 2020 09:50:08 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 26 Aug 2020 02:50:07 -0700
Date:   Wed, 26 Aug 2020 12:50:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media-atomisp : fix "dubious: !x | !y" sparse
 warning
Message-ID: <20200826095000.GW1793@kadam>
References: <20200825220437.11214-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825220437.11214-1-anant.thazhemadam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9724 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9724 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260078
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 26, 2020 at 03:34:26AM +0530, Anant Thazhemadam wrote:
> Upon running sparse, "warning: dubious: !x | !y" is brought to notice
> for this file. This patch fixes that warning.
> 
> If there's a specific reason that this change is considered undesirable, 
> please do let me know why.
> Thanks.

Please don't put this sort of comments in the commit message.  You can
put it under the --- cut off

> 
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
  ^^^
here.  Then it will be removed instead of going into the permanent git
log.

Please always say int the commit message how the patch will affect the
runtime behavior of the kernel.  In this case it will not affect it at
all.  It's just a clean up.  Her is my proposed commit message if you
want:

Subject: [PATCH] staging: media-atomisp : silence "dubious: !x | !y" warning

Upon running sparse, "warning: dubious: !x | !y" is brought to notice
for this file.  Logical and bitwise OR are basically the same in this
context so it doesn't cause a runtime bug.  But let's change it to
logical OR to make it cleaner and silence the Sparse warning.

regards,
dan carpenter





>  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> index 358cb7d2cd4c..3b850bb2d39d 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> @@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
>  	unsigned int ds_log2 = 0;
>  	unsigned int out_width;
>  
> -	if ((!out_info) | (!vf_info))
> +	if ((!out_info) || (!vf_info))
>  		return -EINVAL;
>  
>  	out_width = out_info->res.width;
> -- 
> 2.25.1
> 
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
