Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8305C36E868
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 12:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhD2KJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 06:09:23 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35790 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhD2KJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 06:09:22 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T9rjSf187179;
        Thu, 29 Apr 2021 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RhR1xbKgQZabcBpM0ZPa86+NpTyKGU7t9CqRoOe65cY=;
 b=m9u0elMcbxEn5/HarR5N9RBuP4G9vJEmSWrfGgChCe8nBzJY0mQ4yUiJU4WZ+RsKeTbU
 3sVrrFtEdQXHMQ7U/bWHSnavtxAYeeWg2ESPWRf8poanZqH0lMulpHzgwkJDk6nwxFVW
 0c/gqzwbWsh+0BIw5E+CERHuC/ynpX0EuU0IFK63TiobwhsmjfU4gHTSx6haBIlgiOJh
 QWrcabygV8zP21zaI/N51rPSwK8rh3wZWPrxJqXIV8vZbS27iHOWgtjrxoiCHc5Sxdpl
 wVQlPNwwqqDXPr9e3oMWgD8CnmJ2HQLBN9yLnXf6Ckg4KjqfKu2V7zE15Sb7wzDjQ+oH +g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 385ahbuty4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 10:08:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13T9tsww124394;
        Thu, 29 Apr 2021 10:08:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 384b5a238q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 10:08:19 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13TA62mT176918;
        Thu, 29 Apr 2021 10:08:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 384b5a237u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 10:08:18 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13TA8G6M020884;
        Thu, 29 Apr 2021 10:08:16 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 29 Apr 2021 03:08:15 -0700
Date:   Thu, 29 Apr 2021 13:08:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210429100808.GZ1981@kadam>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: EK4M0k6gYkIgZwQ5Z98dreIdNf-IHnuO
X-Proofpoint-ORIG-GUID: EK4M0k6gYkIgZwQ5Z98dreIdNf-IHnuO
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290068
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> @@ -1044,7 +1048,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>  	}
>  
>  	/*
> -	// set analog/digital gain
> +	 * set analog/digital gain
>  	switch(AnalogGain)
>  	{
>  	case 0:

How on earth does this compile?

> @@ -1069,8 +1073,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,


regards,
dan carpenter

