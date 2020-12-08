Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2800D2D28BF
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 11:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgLHKXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 05:23:05 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54088 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgLHKXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 05:23:04 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8AJxfK077292;
        Tue, 8 Dec 2020 10:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bDpup61JQB7pGAElZJfmkjVjo0h73q1FN5gq4ahyO/4=;
 b=VLd16BYJ53p7OPDvr8SQXQsQ4hvfNq/K6TRt+L0i1Q3Q3uFbZETTFmPyXuHOZemLfACP
 mr+mGohHhdtAG/bWSzDHVnRe9UM0SNXWwGgxmdG/bQ1sSBwWrSUSWpY4IU6Hxuk314bq
 NkYgpPCGXT1w4IklflyC9nUpHj+gsVkVLE1E9pDC9rQ7kvreBFun1r5uEnwwXB88Brfi
 Qduh5khUVYy6vJA+6CNaaNpcQzMidpIZy9RCmVhEDKOONZZULqEZazQ6gjlDCdl6l2BO
 efJCXGPe14rLpZFeKs477LbxICkQ/FQCQib3Y73hhaW7F6YKvbNpnrhQ57MYPIKCGYOZ xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 3581mqt2fb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 08 Dec 2020 10:22:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8AKVX9102150;
        Tue, 8 Dec 2020 10:22:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 358m3xhydg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Dec 2020 10:22:00 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8ALqxs013074;
        Tue, 8 Dec 2020 10:21:52 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 02:21:52 -0800
Date:   Tue, 8 Dec 2020 13:21:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 01/12] media: atomsip: Convert comments to C99
 initializers
Message-ID: <20201208102144.GA2767@kadam>
References: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
 <20201207192638.15219-2-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207192638.15219-2-Philipp.Gerlesberger@fau.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080064
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 07, 2020 at 08:26:27PM +0100, Philipp Gerlesberger wrote:
> The struct initalizers have been changed as recommended on
> https://kernelnewbies.org/KernelJanitors/Todo
> 
> Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
> ---
>  .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> index b4f53be18e7f..af61d05e88d3 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> @@ -31,33 +31,33 @@ static struct ia_css_rmgr_vbuf_handle handle_table[NUM_HANDLES];
>   * @brief VBUF resource pool - refpool
>   */
>  static struct ia_css_rmgr_vbuf_pool refpool = {
> -	false,			/* copy_on_write */
> -	false,			/* recycle */
> -	0,			/* size */
> -	0,			/* index */
> -	NULL,			/* handles */
> +	.copy_on_write	= false,
> +	.recycle	= false,
> +	.size		= 0,
> +	.index		= 0,
> +	.handles	= NULL,

If you're using C99 initializers then you can remove all the false, 0
and NULL members.

regards,
dan carpenter

