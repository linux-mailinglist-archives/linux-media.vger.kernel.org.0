Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BDA3AB548
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhFQOBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 10:01:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53108 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231843AbhFQOBD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 10:01:03 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HDqi6C010624;
        Thu, 17 Jun 2021 13:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=VX31teF+koyDYOcsIQloz16k2tTpGxd1spdkC3BfdDw=;
 b=cZtk6rSvhjmpuVhNH3U5jFFh7qz7fgSOouVeFXvwGxF7LWnIHxrYsxe3NbLStBcVBipp
 51D5nndIpoRghEUnc86Qk264TeyhK08MCm0aupLfOYCecNBgOXWg5/A5d+wJoeGRGHdw
 ejOiUusHP9PwEdLACc6UGJACVeVD1rNC7rmfgrpGhbhcV9tk6eF4G7pEFBe8buKkNPWK
 FgaBdORPwYsMkIPUd/cDJ4HuFdBKmTqB0NfIE9edfZlN/47edb06v8LKVmuOYoPa73j9
 in7tRtl/5M+pBzxemsChbQVZkHNqBiC5+YElWW6Dsc/lxJaCRAFc1su1jd7Zkfk4Km2I MQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39770hbcrm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:58:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HDpDJQ047777;
        Thu, 17 Jun 2021 13:58:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 396wavmaw9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:58:35 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HDwZor081654;
        Thu, 17 Jun 2021 13:58:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 396wavmav4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:58:35 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15HDwWBu018758;
        Thu, 17 Jun 2021 13:58:32 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 13:58:31 +0000
Date:   Thu, 17 Jun 2021 16:58:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH -next resend] media: staging: media: atomisp: pci: fix
 error return code in atomisp_pci_probe()
Message-ID: <20210617135824.GO1901@kadam>
References: <20210617135500.2158302-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617135500.2158302-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: kjBdQJ2afXYCotmgI3nGnAbwCcYpJLSS
X-Proofpoint-ORIG-GUID: kjBdQJ2afXYCotmgI3nGnAbwCcYpJLSS
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

But next time please use v2 in the subject instead of "resend".  "resend"
means that the process broke down somehow and we ignored your first
patch.

On Thu, Jun 17, 2021 at 09:55:00PM +0800, Yang Yingliang wrote:
> If init_atomisp_wdts() fails, atomisp_pci_probe() need return
> error code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
Put a note here under the --- cut off line to say what happened since
the last version.

v2: style change


>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

regards,
dan carpenter

