Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E1322ED0E
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 15:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgG0NU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 09:20:58 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:39458 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0NU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 09:20:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RDGwXU093400;
        Mon, 27 Jul 2020 13:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=tBfbienhVFSWot4M/N0o6k7I0q1neTC6ZRkO3jt9YxE=;
 b=EJiZs3gmYFJSMJ8cxvB5Xmb/2h5Yxym0yaAVmJs55bYeNyjJkPMOTszpivd1/fx43EP5
 U3pnkTFxnsjk28H+0OErX1xacdpOWcaTPGDG72gTSzxJ0cm1Bhp75YfJMNNkuOH+5r2o
 F/rDEPMIfaQNjY/bgz1XHRdZySJRU+u06h2luoOyGa0VN2agNy9aaxn59M5FRHA9BNls
 jPLFaChGMkZalETtsw+lxurGpSOktjer19NnqQ2Xw4+8EZLG+0xPBNfPxCEZLyu4jYN1
 Ni2/6eSZg+l+2bGA3Mk/7E4K2E710UrIsCXChrbx1HNw7g0nDeCtDF4+4YHdimio2FZE wg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 32hu1j1f9b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 13:20:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06RDIXhU147258;
        Mon, 27 Jul 2020 13:20:52 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 32hu5qvwd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 13:20:52 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06RDKpbg023514;
        Mon, 27 Jul 2020 13:20:51 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jul 2020 06:20:50 -0700
Date:   Mon, 27 Jul 2020 16:20:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: atomisp-mt9m114: replace fixed function names
Message-ID: <20200727132042.GE1913@kadam>
References: <20200725081108.272643-1-juant.aldea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725081108.272643-1-juant.aldea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270097
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 25, 2020 at 10:11:08AM +0200, Juan Antonio Aldea-Armenteros wrote:
> There are a couple of debug messages using hardcoded function names
> instead of the preferred __func__ magic constant.
> 
> Replace them:
> 
> WARNING: Prefer using '"%s...", __func__' to using 'misensor_rmw_reg', this function's name, in a string
> 215: FILE: ./media/atomisp/i2c/atomisp-mt9m114.c:215:
> +       v4l2_err(client, "misensor_rmw_reg error exit, read failed\n");
> 
> WARNING: Prefer using '"%s...", __func__' to using 'misensor_rmw_reg', this function's name, in a string
> 236: FILE: ./media/atomisp/i2c/atomisp-mt9m114.c:236:
> +       v4l2_err(client, "misensor_rmw_reg error exit, write failed\n");
> 
> Signed-off-by: Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 0d60918a9b19..54c24bc2061d 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -212,7 +212,7 @@ misensor_rmw_reg(struct i2c_client *client, u16 data_length, u16 reg,
>  
>  	err = mt9m114_read_reg(client, data_length, reg, &val);
>  	if (err) {
> -		v4l2_err(client, "misensor_rmw_reg error exit, read failed\n");
> +		v4l2_err(client, "%s exit, read failed\n", __func__);

Did you intend to delete the word "error"?

regards,
dan carpenter


