Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B033959F2
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhEaL7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:59:14 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:35542 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbhEaL7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:59:13 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14VBtNf3167721;
        Mon, 31 May 2021 11:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Qa7OB0joVIbsqEBqQrEqTWmxDwJ6EILjSJNqOz1k7ag=;
 b=eSbixdL0JIpRPRZKh/4i9HsZrkmv4TIXiD+xxEMKRyG734RMV+4/Y7ELGFN5GkTmHvP+
 tHjw0pcEzmyiRoPk0L4nPpKjR7Nwthj+e7wDp55UHpC8Z7UfwvpY+Z3ddZDZeauQvrg/
 VTbdiamjrfxhipPNTMLQ0fi+HAuBQKY/2TdMNAfbnmtrcPKR9nz2PYN6ZiHon2jD+unC
 X+QoKIGqEup1rVLUwrcfhaNF03lpfxVb271c8JdhTG5EQuHn5ise4e3djiITj38Ocmn6
 o+PXW+s0Lfo07PZNwt65wVjLJf6gaYpjs8AVNah6ACfFg28VzP1w0MZJE74+oBwHr+jI hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 38ub4ck241-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 May 2021 11:57:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14VBt59Z058899;
        Mon, 31 May 2021 11:57:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38ude65r6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 May 2021 11:57:24 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14VBvNlo069604;
        Mon, 31 May 2021 11:57:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 38ude65r6a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 May 2021 11:57:23 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14VBvMEm025098;
        Mon, 31 May 2021 11:57:22 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 31 May 2021 04:57:21 -0700
Date:   Mon, 31 May 2021 14:57:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Young <sean@mess.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yasunari.Takiguchi@sony.com, mchehab@kernel.org,
        narmstrong@baylibre.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cxd2880-spi: Fix an error handling path
Message-ID: <20210531115713.GW1955@kadam>
References: <28a115d7207b258715a029f822ab88f7a4ee05e6.1621599392.git.christophe.jaillet@wanadoo.fr>
 <20210531101725.GB30390@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531101725.GB30390@gofer.mess.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 5u8xatuf7NrMIrTDzNMobpelYbbTHkNn
X-Proofpoint-ORIG-GUID: 5u8xatuf7NrMIrTDzNMobpelYbbTHkNn
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10000 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105310086
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 31, 2021 at 11:17:25AM +0100, Sean Young wrote:
> On Fri, May 21, 2021 at 02:18:14PM +0200, Christophe JAILLET wrote:
> > If an error occurs after a successful 'regulator_enable()' call,
> > 'regulator_disable()' must be called.
> > 
> > Fix the error handling path of the probe accordingly.
> > 
> > Fixes: cb496cd472af ("media: cxd2880-spi: Add optional vcc regulator")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/media/spi/cxd2880-spi.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
> > index 931ec0727cd3..df1335e7061c 100644
> > --- a/drivers/media/spi/cxd2880-spi.c
> > +++ b/drivers/media/spi/cxd2880-spi.c
> > @@ -524,13 +524,13 @@ cxd2880_spi_probe(struct spi_device *spi)
> >  	if (IS_ERR(dvb_spi->vcc_supply)) {
> >  		if (PTR_ERR(dvb_spi->vcc_supply) == -EPROBE_DEFER) {
> >  			ret = -EPROBE_DEFER;
> > -			goto fail_adapter;
> > +			goto fail_regulator;
> >  		}
> >  		dvb_spi->vcc_supply = NULL;
> 
> vcc_supply is set to null in this path.
> 

The regulator_enable()/disable() functions should be modified to handle
NULL pointers.

Btw, the regulator_get_optional() is a very annoying function...
Normally when there is an optional feature then it returns NULL if the
option was to have the feature disabled and error pointers if there
is an error.  Then the surrounding code is expected to check for and
work with NULL pointers.  The error handling is very simple:

	p = get_feature();
	if (IS_ERR(p))
		return PTR_ERR(p);

Or if the function doesn't make sense when the feature is disabled we
do:

	p = get_feature();
	if (IS_ERR_OR_NULL(p))
		return PTR_ERR(p);  // <-- this will return success if
				    // get_feature() returns NULL

Users want to see errors and be able to fix them.  We shouldn't just
disable stuff.

It sort of seems like the idea with regulator_get_optional() was to
return -ENODEV if the user deliberately has the feature off.  That's
how I would read the code but it doesn't really work because other
errors can also lead to -ENODEV.

I have examined seven call sites and there are four which treat
everthing except -ENODEV as a failure and three which only treat
-EPROBE_DEFER as a failure.

I don't know how to fix it at this point, without introducing a new
wrapper:

struct regulator *devm_regulator_get_optional_v2(struct device *dev,
						 const char *id)
{
	struct regulator *r;

	r = _devm_regulator_get(dev, id, OPTIONAL_GET);
	if (IS_ERR(r) == -ENODEV)
		return NULL;
	return r;
}

regards,
dan carpenter
