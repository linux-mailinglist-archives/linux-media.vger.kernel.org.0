Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BC8375FA4
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 07:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhEGFPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 01:15:05 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:34926 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhEGFPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 01:15:05 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1475Dm3E123155;
        Fri, 7 May 2021 05:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=rZzXsWAp82UhBV/cokkkVpE7UbqBBMYmOiymy5YiT88=;
 b=NZCHB4ER1d7tCmdyBNmnlZaokeLVMXDXMhzbTttoTIO2F6G5e0Di4+rVq/c407EHvQMW
 wSKyki6XtDEHFFVp8hDtDNIDxCXH7m0t98J2pex3qJaDCrzb7oDsYXe7uY8Ea1oZ3put
 1pFj10Zgtm1KVYOjYWIpBVUTV+qJLy7MpS809/v3sJyBlDKT6ES+xPUAWnz0MRyjpmWY
 JdsJ+bqX7WUAmduTfQdeuCoS08L6xOPx38MkBXOLXIHd18gPomUayRqQ49Zq4r6R0nMG
 EcLmbNtTA2Dvz9DyzTo8DCWLC9vzToeas5W/z7e0wpjtiZyD7FnesIB5gdzmEupIC7Jb DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 38csrd8d4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 05:13:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14759hms174669;
        Fri, 7 May 2021 05:13:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38csrgd545-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 05:13:47 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1475DkAZ002799;
        Fri, 7 May 2021 05:13:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 38csrgd53x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 05:13:46 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1475DibK031033;
        Fri, 7 May 2021 05:13:44 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 May 2021 22:13:43 -0700
Date:   Fri, 7 May 2021 08:13:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 05/25] staging: media: tegra-vde: use
 pm_runtime_resume_and_get()
Message-ID: <20210507051333.GE1955@kadam>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <a1230241a83a6abcd27b91edcafee1685232f81e.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1230241a83a6abcd27b91edcafee1685232f81e.1620314616.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: DEXyVdiDsR6x8uVn6eHnJuSxhy2rmyHO
X-Proofpoint-GUID: DEXyVdiDsR6x8uVn6eHnJuSxhy2rmyHO
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070037
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 05:25:43PM +0200, Mauro Carvalho Chehab wrote:
> @@ -1069,11 +1071,19 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	 * power-cycle it in order to put hardware into a predictable lower
>  	 * power state.
>  	 */
> -	pm_runtime_get_sync(dev);
> +	if (pm_runtime_resume_and_get(dev) < 0)
> +		goto err_pm_runtime;

Needs an error code on this path.  These days the kbuild bot will send
a warning for this eventually.

> +
>  	pm_runtime_put(dev);
>  
>  	return 0;
>  
> +err_pm_runtime:
> +	misc_deregister(&vde->miscdev);
> +
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +
>  err_deinit_iommu:
>  	tegra_vde_iommu_deinit(vde);
>  

regards,
dan carpenter
