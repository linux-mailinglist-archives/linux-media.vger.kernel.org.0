Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05223257AA2
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 15:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgHaNkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 09:40:43 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46666 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgHaNkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 09:40:42 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VDZXad170145;
        Mon, 31 Aug 2020 13:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UcZelzQz1egJztiC3oTDk5ObhFphp8EDAemUUbgfzx0=;
 b=EzcrI3fl/j7LAYCVchRSS8yiMf1hxzALf1nC45FgeNVpJUpwmh/VXDoGRYlvnvUgG/cW
 Ei3UwfEhAuhwXJuUVo6OSoNN1Z5pgkWq+rpXR4eb42haH0FLjfEDlGHujPz5F6FXhujp
 BsBolisY6mRw3h0OUKxUBJap/rEXh7hUhyXuNOMw2LeujcMekBpYKRRHGWbUJ+i8ba1o
 mT6E0YSKRguPWDqiplkM4ZHXJ9YL7MVnuVzPS5g7EaMxED9DH+hOcCCRJeQ4vKE8dHrg
 l1DYrmUW8QtTEKZh60OMQ800A2N4fyyimqdc32qjLeuONNgcYgruTVV/MG05tPNXWCnl MQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 337qrhdb27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 31 Aug 2020 13:40:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VDYujg030703;
        Mon, 31 Aug 2020 13:40:33 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 3380sq0y92-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 Aug 2020 13:40:33 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07VDeS4Y015193;
        Mon, 31 Aug 2020 13:40:29 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 31 Aug 2020 06:40:28 -0700
Date:   Mon, 31 Aug 2020 16:40:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: Fix fallthrough keyword warning
Message-ID: <20200831134021.GV8299@kadam>
References: <20200831133011.91258-1-cengiz@kernel.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831133011.91258-1-cengiz@kernel.wtf>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310079
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 31, 2020 at 04:30:12PM +0300, Cengiz Can wrote:
> commit df561f6688fe ("treewide: Use fallthrough pseudo-keyword") from
> Gustavo A. R. Silva replaced and standardized /* fallthrough */ comments
> with 'fallthrough' pseudo-keyword.
> 
> However, in one of the switch-case statements, Coverity Static Analyzer
> throws a warning that 'fallthrough' is unreachable due to the adjacent
> 'return false' statement.
> 
> Since 'fallthrough' is actually an empty "do {} while(0)" this might be
> due to compiler optimizations. But that needs further investigation.
> 
> In order to fix the unreachable code warning, make adjacent 'return
> false' a part of the previous if statement's else clause.
> 
> Reported-by: Coverity Static Analyzer CID 1466511
> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index 1b2b2c68025b..aaa2d0e0851b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -709,8 +709,8 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
>  		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
>  		    pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>  			return true;
> -
> -		return false;
> +		else
> +			return false;
>  		fallthrough;

Heh...  Still unreachable, but now it has a checkpatch.pl warning as
well.  Just get rid of the bogus fallthrough annotation.

>  	case ATOMISP_RUN_MODE_VIDEO:
>  		if (!asd->continuous_mode->val) {

regards,
dan carpenter

