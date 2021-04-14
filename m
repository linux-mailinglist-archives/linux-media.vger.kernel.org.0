Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D6E35F634
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 16:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349704AbhDNObB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 10:31:01 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53014 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348415AbhDNOa7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 10:30:59 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EETLUG165847;
        Wed, 14 Apr 2021 14:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ZLSwH72RjGyG/ruSYBWYRjq6UpSWyIWKtg2qdWALORw=;
 b=elASTvdu58XkYIphcvA+fRFWVyXPyIoCCKHn/JrZnAy35P+vQCQub8rTtfayoHY9tVI7
 ZpABCH8uHkVTNb+ZeGu8AShqtlx1AK37GsyRdTBOIQ0YqXHikfvXG2hm40K7zk0QPU/z
 +MGH7hgwYYxQuLBt3n9SDhFxOzqKmmtP2XNmYrqZR5apmlbHHu79BaBk9EzUZ3bS1tVN
 j+CExStDvs95+Ifxi4C0D31BkhOLB1NQ8eQOtqpYP4vTgU27xFzQuu3TyCJe3ZRI23T1
 E2YTuN1ZoBvZf8F7B9WwS3TNY9nRA/ObZDsPfP6AASyJzIOIoHzsQsvzhlnYSQFRYXN0 yg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 37u4nnjkrd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 14:30:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EEQQ2n072555;
        Wed, 14 Apr 2021 14:30:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 37unxyftgw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 14:30:20 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13EEUJ6s005601;
        Wed, 14 Apr 2021 14:30:19 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 14 Apr 2021 07:30:18 -0700
Date:   Wed, 14 Apr 2021 17:30:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH 1/2] staging: media: atomisp: pci: Correct identation in
 block of conditional statements in file atomisp_v4l2.c
Message-ID: <20210414143011.GV6021@kadam>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
 <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140101
X-Proofpoint-ORIG-GUID: gPngORM0wg1Q-YZKP8iPkQupiFfcSrZp
X-Proofpoint-GUID: gPngORM0wg1Q-YZKP8iPkQupiFfcSrZp
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140101
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 11:06:02AM -0300, Aline Santana Cordeiro wrote:
> Correct identation in block of conditional statements.
> The function "v4l2_device_unregister_subdev()" depends on
> the results of the macro function "list_for_each_entry_safe()".
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 0295e2e..6d853f4 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1178,7 +1178,7 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
>  		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
>  
>  	list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs, list)
> -	v4l2_device_unregister_subdev(sd);
> +		v4l2_device_unregister_subdev(sd);
>  

It's really more common to use curly braces for list_for_each() one
liners.

	list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs, list) {
		v4l2_device_unregister_subdev(sd);
	}

regards,
dan carpenter

