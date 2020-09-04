Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697A525D17C
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 08:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgIDGf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 02:35:28 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:56980 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgIDGf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 02:35:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0846YLib093171;
        Fri, 4 Sep 2020 06:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/nEvMcYcQDU1SKp7DuIR7lsg8jaYz/VuKkA3WV3EDT8=;
 b=p4391RoVK+UFuMMBCRTMMxJEX+uWNb1T2I8FsdceBrSbeL/PuwbIruCdw6+XxofjYboS
 NWOW8KR4EDDSsq3wMNFqZqb4zxY3CvSGDLu7SRuK8PIbR+Ss4zGKVDwaqbKCq852YSE8
 23P/jweDHvIyxKC6JUktcjLGxQpJQhRAZNAv5pq1U2kc4H3fXZtMAsx304Hs51TBetUT
 plmoIlem1MdZ4gIDh6lov39y/XoM6Vtca8t31E5aHDNQJvYTzWbGoAnJhshAc9k7B8bf
 6KQ0vsvr3HuABh+/j0TtnbppYhVxeL2S342asqSk6GefliY0Cf4VqorhXPKdUIz+UA73 nQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 337eymmqn7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 04 Sep 2020 06:35:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0846ZJgt053408;
        Fri, 4 Sep 2020 06:35:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 3380kt0ay5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Sep 2020 06:35:21 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0846ZEJr007484;
        Fri, 4 Sep 2020 06:35:16 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Sep 2020 23:35:14 -0700
Date:   Fri, 4 Sep 2020 09:35:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Fix error path in
 lm3554_probe()
Message-ID: <20200904063506.GJ8321@kadam>
References: <20200903173843.GF8299@kadam>
 <20200903182502.709300-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903182502.709300-1-alex.dewar90@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9733 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009040059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9733 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009040059
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 03, 2020 at 07:24:51PM +0100, Alex Dewar wrote:
> +
> +	ret = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
> +	if (!ret)
> +		return 0;

Ugh!!!  This is a a special case of the "success handling instead of
failure handling" anti-pattern where the last condition in the function
is different.  I just fixed a bug caused by this on Wed.

https://www.spinics.net/lists/netdev/msg680226.html

But it doesn't cause any problems here so whatever...

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

