Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98F5225A42
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 10:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgGTIlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 04:41:15 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60430 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGTIlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 04:41:14 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K8bDkh146748;
        Mon, 20 Jul 2020 08:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=N1tmgU/JSypAmYPQOpiVBV41mTd9aIjyYmi1clORZkI=;
 b=zhu8psgYhcnhxl1nzSkjx+NbGtep1wyuGT0v7k1NwC9iIP/a76UTjfXKgpwJgzTaLTTK
 9PHMrTjf8orCRaediSHaDSMNp31j4lmIvjvUpUfyVqjT6GGqrXhvAy+OfHh2K+AF9FML
 S9pOlx8mpmAMwo2P9deBMLdVllD3RbMZWvJJBi9aizHAH2x70bAVcdg3w5s2kI5lkdJW
 mZ6TYnCtTDDMDiqQ0e5/T89vm3Jtlwm6ZsypOgugXMiN0YZZXDpVfq1Su8Jje6uJlOE+
 3bRGMTzde/ExPVqyotblGq2sny4/a2gYFn3vlxEbVcEBbs4+X6ZEyhUd4wNjbyecIyuu tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 32bs1m5hhd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 08:41:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K8cuXu020485;
        Mon, 20 Jul 2020 08:41:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 32d68g7swv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jul 2020 08:41:07 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06K8f5gj007426;
        Mon, 20 Jul 2020 08:41:05 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jul 2020 01:41:05 -0700
Date:   Mon, 20 Jul 2020 11:40:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Suraj Upadhyay <usuraj35@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Replace depracated MSI APIs
Message-ID: <20200720084058.GG2549@kadam>
References: <20200719142623.GA31565@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719142623.GA31565@blackclown>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 suspectscore=2 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=993 malwarescore=0 clxscore=1015
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200065
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 19, 2020 at 07:56:23PM +0530, Suraj Upadhyay wrote:
> Replace depracated MSI IRQ enabler and disabler
> with pci_alloc_irq_vectors and pci_free_irq_vectors respectively.
> And as a result handle the returned error as appropriate.
> Compile tested.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
> Change:
> 	v2: Replace the MSI IRQ disabler too.
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index d36809a0182c..a5dea5521b36 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1735,8 +1735,8 @@ static int atomisp_pci_probe(struct pci_dev *dev,
>  	pci_set_master(dev);
>  	pci_set_drvdata(dev, isp);
>  
> -	err = pci_enable_msi(dev);
> -	if (err) {
> +	err = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
> +	if (err < 0) {
>  		dev_err(&dev->dev, "Failed to enable msi (%d)\n", err);
>  		goto enable_msi_fail;
>  	}
> @@ -1857,7 +1857,7 @@ static int atomisp_pci_probe(struct pci_dev *dev,
>  initialize_modules_fail:
>  	cpu_latency_qos_remove_request(&isp->pm_qos);
>  	atomisp_msi_irq_uninit(isp, dev);
> -	pci_disable_msi(dev);
> +	pci_free_irq_vectors(dev);

Actually, my initial complaint was that I was just looking for to see if
the remove function was updated...  It turns out the remove function
never freed the IRQs to begin with so it was buggy from square one.

Anyway, the remove function should call pci_free_irq_vectors().  We may
as well fix it now that we have seen the bug.

regards,
dan carpenter

