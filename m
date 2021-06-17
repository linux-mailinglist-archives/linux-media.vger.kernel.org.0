Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E8E3AAFC7
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 11:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhFQJeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 05:34:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54280 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229714AbhFQJet (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 05:34:49 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15H9GU9I031867;
        Thu, 17 Jun 2021 09:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=EwDW3tcCDOJ8sxOlHzo/AyAYmfy6S8XQjsSaQH2N7oo=;
 b=QJlytlTlL5/LoF6YCbogFmmr1jJ727Lm6KsFiNHYIPIziKAsyJVNdJyp//cK5V0dVc5S
 IxpYwXJgLVqSFqIjdzIrAnCXhMkmOggbR+BJay6IMG8VnE5qzc1RYZ+0mdYTwRonD6cN
 uHcE6YaB0Z8divES4CmQXlRMB5+QTUaZHLAHhIpb2VwJ/pUGoG6ualA0bde6DT/rekoT
 8JLQj/98lF63XRWttqJYlke/rT4BMMpesLCIsXj+09MGJZt/4UNompdlzukl708zOY3K
 gr3Yp1gW2+5iytB1GsdKUBPSJ5i3289sl9rLfLR59wyCNQuYztbRIM05750LvRYZW9sf yQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 397h4bhwy0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 09:32:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15H9FLhe106759;
        Thu, 17 Jun 2021 09:32:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 396wavddwv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 09:32:28 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15H9WR0V146672;
        Thu, 17 Jun 2021 09:32:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 396wavddwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 09:32:27 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15H9WQlN023146;
        Thu, 17 Jun 2021 09:32:26 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 02:32:25 -0700
Date:   Thu, 17 Jun 2021 12:32:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH -next] media: staging: media: atomisp: pci: fix error
 return code in atomisp_pci_probe()
Message-ID: <20210617093219.GE1861@kadam>
References: <20210617072329.1233662-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617072329.1233662-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: HJ7O1UkEWpUXRPhTPQnHYpHIMMOqEfNA
X-Proofpoint-GUID: HJ7O1UkEWpUXRPhTPQnHYpHIMMOqEfNA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 03:23:29PM +0800, Yang Yingliang wrote:
> If init_atomisp_wdts() fails, atomisp_pci_probe() need return
> error code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 948769ca6539..5de878fe798b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1763,7 +1763,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	if (err < 0)
>  		goto register_entities_fail;
>  	/* init atomisp wdts */
> -	if (init_atomisp_wdts(isp) != 0)
> +	err = init_atomisp_wdts(isp);
> +	if (err != 0)

Change this to: if (err).

Only use != 0 when you are talking about numbers or for strcmp().

	if (num != 0) // it's fine because we are talking about zero as
		      // number zero.

	if (len == 0) // fine, length is measured in numbers.

	if (err != 0) // In this case, error is not a number but either
		      // an error code or success.  It's not like -3 is
		      // worse than -2 or anything like that.  It's not
		      // a count or a measurement.

For (strcmp(a, b) != 0), the != means "a != b".

regards,
dan carpenter

