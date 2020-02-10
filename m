Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7349157DA5
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 15:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgBJOng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 09:43:36 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38570 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbgBJOnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 09:43:35 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01AEYJpr022392;
        Mon, 10 Feb 2020 14:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=d0pIvsq2NeMMD/xcPD4wQXjfRR2ZTQ6xKLPL706LNNg=;
 b=oBauWKjwEiRTM9Fev31Hx0WKOJcntbxzlkOprFDzoXlCn/YzE3fr58NKbJVrFLkkB9DS
 NJNiUIoVF/ANlikNgQrsRU0v8mTt3t7dG2IxCZ27rmeO0l7T/stJoypyw/poFKZUVvkQ
 5C0qi/u+V9MagYiFb5zgy5Dh1UQGnvLqf/4E3LenvlarRikpywxoWXDG8UZVi6apIn3y
 kgkm9dB61wuOAAV4tPvvv53yxCUkRpM7krE4yH1YzOWTS3whocTgiBqFWH8kR1di4Bu4
 sLw0rC89mB5/bBCcEeN1rCQrPrjZLBJOpgjEwMrgd1E7FyWH3jiz4B91Pnte1glygvMn wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2y2k87vvg9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 Feb 2020 14:43:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01AEb4xY100593;
        Mon, 10 Feb 2020 14:41:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2y26ff8rys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 Feb 2020 14:41:26 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01AEfMRa011474;
        Mon, 10 Feb 2020 14:41:22 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 Feb 2020 06:41:21 -0800
Date:   Mon, 10 Feb 2020 17:41:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tda10071: fix unsigned sign extension overflow
Message-ID: <20200210144110.GA1778@kadam>
References: <20200210142646.431957-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210142646.431957-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9526 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002100113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9526 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002100113
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 10, 2020 at 02:26:46PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of buf[3] by 24 bits to the left will be promoted to
> a 32 bit signed int and then sign-extended to an unsigned long. In
> the unlikely event that the the top bit of buf[3] is set then all
> then all the upper bits end up as also being set because of
> the sign-extension and this affect the ev->post_bit_error sum.
> Fix this by using the temporary u32 variable bit_error to avoid
> the sign-extension promotion. This also removes the need to do the
> computation twice.
> 
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: 267897a4708f ("[media] tda10071: implement DVBv5 statistics")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/dvb-frontends/tda10071.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
> index 1953b00b3e48..685c0ac71819 100644
> --- a/drivers/media/dvb-frontends/tda10071.c
> +++ b/drivers/media/dvb-frontends/tda10071.c
> @@ -470,10 +470,11 @@ static int tda10071_read_status(struct dvb_frontend *fe, enum fe_status *status)
>  			goto error;
>  
>  		if (dev->delivery_system == SYS_DVBS) {
> -			dev->dvbv3_ber = buf[0] << 24 | buf[1] << 16 |
> -					 buf[2] << 8 | buf[3] << 0;
> -			dev->post_bit_error += buf[0] << 24 | buf[1] << 16 |
> -					       buf[2] << 8 | buf[3] << 0;
> +			u32 bit_error = buf[0] << 24 | buf[1] << 16 |
> +					buf[2] << 8 | buf[3] << 0;

This driver has a bunch of endian conversions (probably from big endian
to little endian) and so it's probably buggy on big endian CPUs.

regards,
dan carpenter

