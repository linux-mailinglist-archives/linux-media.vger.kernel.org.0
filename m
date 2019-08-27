Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5B19E8CD
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 15:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfH0NMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 09:12:45 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54436 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfH0NMp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 09:12:45 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RD9CAZ001945;
        Tue, 27 Aug 2019 13:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ASUUUkYHWUhwFKzNS2t3x+k/4UsOO6plVu7exCkK5XU=;
 b=MPLf+vxxOSe561irWHaSHSyCBYCGV8jpbtY0kHQ/vYVoT9nwJa1pIoMwKod4LgVOkvXh
 etEcI++34RwpM/Fj7kR2LEtjRZk1P0MRZN4JulOvdVulL+MLOViEAicllqIgO37Mcfri
 kj5HC2v6F5ppcF1hW+0IfC9HMRgaG6HUnLvE6qXnvljivORFrATxcFogyobn7JPQxILo
 RwXIhzaX0kSMIMoa7ltyW+Peizl29tUfi8V9RugEs6a64GQfexR91qFOYXYyaMOodxOa
 Zz9JWtNgbx7hbkB+z7mYYe2VBJW9ubHe3ZRFVh5AuR2cYMC+DckQbPh4dJ+zuQK3Dl7B Rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2un4n9ra2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Aug 2019 13:12:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RD98T9051233;
        Tue, 27 Aug 2019 13:10:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2umhu8qtpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Aug 2019 13:10:40 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7RDAevg015866;
        Tue, 27 Aug 2019 13:10:40 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 27 Aug 2019 06:10:39 -0700
Date:   Tue, 27 Aug 2019 16:10:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb: redundant assignment to variable tmp
Message-ID: <20190827131033.GD23584@kadam>
References: <20190827111527.26337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827111527.26337-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908270142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9361 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908270142
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 27, 2019 at 12:15:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable tmp is being assigned a value that is never read and tmp
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
> 
> Addresses-Coverity: ("Ununsed value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/dvb-frontends/sp8870.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/sp8870.c b/drivers/media/dvb-frontends/sp8870.c
> index 655db8272268..f6793c9c2dc3 100644
> --- a/drivers/media/dvb-frontends/sp8870.c
> +++ b/drivers/media/dvb-frontends/sp8870.c
> @@ -378,8 +378,6 @@ static int sp8870_read_ber (struct dvb_frontend* fe, u32 * ber)
>  	if (ret < 0)
>  		return -EIO;
>  
> -	tmp = ret & 0x3F;
> -

This is pre git code.  It's not clear if the tmp is supposed to be used
or if we can remove the sp8870_readreg() call also...  The problem is
that we're disabling the warning without necessarily writing the best
fix.  It's better to leave the warning there until we are more sure of
the correct fix.  The warning has useful information and it's not
hurting anyone.

regards,
dan carpenter

