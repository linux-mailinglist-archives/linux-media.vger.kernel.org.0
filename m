Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C3E38C545
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 12:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhEUKyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 06:54:10 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47224 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbhEUKyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 06:54:08 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LAnODi086105;
        Fri, 21 May 2021 10:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0Jjud9746+KvN80q/qs8axWUfdliXQL13Z5+q/QBesE=;
 b=fMAYwqkTld88VUACoDCt6CAe1Mo1goQIN5DkESnWtCNNBwe9cLh5/iTD7n6GpBBWmcqn
 iO1rxeEiHVHP9U+OnWnmPQJh9m91rzkW8kvdZvswtYFUSxi7yoBqv5xDnJx0Vifj/kUC
 VWv46yTBt4zDipp5JTi/qE9ls8Ds9/gY1j+mxyblo0QHKiIt81AlvMFg8miLXUCeVp4e
 heBdQdkYwb4VWUXcM4Wz0wX6O+a1MnPhyy5nFDQt19g0hM1y5F3bme2c10N3EQbVFju1
 JreHY5RCMRUaSbR31xVExoMeLVuFj45DMeNwk+Z5ZhKpF4q6yE7gCfgv+pcFV2WyKuUe ZQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 38j6xnq9mm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 May 2021 10:52:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LAoYF0188999;
        Fri, 21 May 2021 10:52:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38megnes9r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 May 2021 10:52:33 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14LAqXH8191697;
        Fri, 21 May 2021 10:52:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 38megnes9b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 May 2021 10:52:33 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14LAqTus029316;
        Fri, 21 May 2021 10:52:30 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 21 May 2021 03:52:29 -0700
Date:   Fri, 21 May 2021 13:52:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: media: atomisp: code formatting changes
 sh_css_params.c
Message-ID: <20210521105222.GJ1955@kadam>
References: <cover.1619850663.git.drv@mailo.com>
 <6bc123d66150ccaa6dc6fdf2f11c8669e2f493e2.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bc123d66150ccaa6dc6fdf2f11c8669e2f493e2.1619850663.git.drv@mailo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: uZkRzXC1QhBSiVaXVRV9daKOqDwUwBoP
X-Proofpoint-ORIG-GUID: uZkRzXC1QhBSiVaXVRV9daKOqDwUwBoP
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210067
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 01, 2021 at 12:16:07PM +0530, Deepak R Varma wrote:
> @@ -1562,8 +1544,10 @@ ia_css_isp_3a_statistics_map_allocate(
>  	base_ptr = me->data_ptr;
>  
>  	me->size = isp_stats->size;
> -	/* GCC complains when we assign a char * to a void *, so these
> -	 * casts are necessary unfortunately. */
> +	/*
> +	 * GCC complains when we assign a char * to a void *, so these
> +	 * casts are necessary unfortunately.
> +	 */

Not related to your patch, but assigning a char pointer to a void
pointer is fine and GCC will not complain.  The problem is that
me->dmem_stats is not a void pointer.  Someone should delete that
nonsense comment.

>  	me->dmem_stats    = (void *)base_ptr;
>  	me->vmem_stats_hi = (void *)(base_ptr + isp_stats->dmem_size);
>  	me->vmem_stats_lo = (void *)(base_ptr + isp_stats->dmem_size +

regards,
dan carpenter
