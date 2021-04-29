Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A1936E9B8
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 13:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhD2LoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 07:44:14 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:48282 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2LoN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 07:44:13 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TBcjmt082930;
        Thu, 29 Apr 2021 11:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=l9paM8Sw26fpexoC/EnBzpLilcBGWGzN9ia2QZD4Amc=;
 b=y6v92FQfduysPPZYd19YGHWDnYvjbZ1LP0NJvh2Dssu98G29di71pKF4ZR+E4vBJS/1B
 7Zxjhi+EFdIXpPdQken01brewrB2+KzBSgx6wl5JLlmrN6ehYF1ZdmOzqBREstoMQhS4
 EsK9krJk0y/cINKXlEADpOZSkvJQJk/6UzyDouDEo0TmzOIHPTtQk4nDwW3qsbPy5J0o
 nS/IM+pyuNmEMsGCVGVROcstbKBslXAkTYpnMUXc3tqmtXTxZfuSUseeIzUUIuVnDsTt
 E3HyIoLkUCS0x2XEydFoM0papsOf0ERxoWCAIgk0++iyTqYpvI1Flm3gq6d1ArPckd87 TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 385afq44cu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 11:43:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TBesH7031945;
        Thu, 29 Apr 2021 11:43:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 3848f0xhme-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 11:43:15 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13TBhETP042674;
        Thu, 29 Apr 2021 11:43:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 3848f0xhks-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 11:43:14 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13TBhCKb001721;
        Thu, 29 Apr 2021 11:43:12 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 29 Apr 2021 04:43:12 -0700
Date:   Thu, 29 Apr 2021 14:43:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210429114304.GC21598@kadam>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
 <20210429100808.GZ1981@kadam>
 <YIqZHWkHi8HWnF0C@192.168.1.8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIqZHWkHi8HWnF0C@192.168.1.8>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: ag1sDwXR2LCzP4n4viOwz5Kl6tbQ9qNP
X-Proofpoint-GUID: ag1sDwXR2LCzP4n4viOwz5Kl6tbQ9qNP
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290080
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 05:01:41PM +0530, Deepak R Varma wrote:
> On Thu, Apr 29, 2021 at 01:08:09PM +0300, Dan Carpenter wrote:
> > On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> > > @@ -1044,7 +1048,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > >  	}
> > >  
> > >  	/*
> > > -	// set analog/digital gain
> > > +	 * set analog/digital gain
> > >  	switch(AnalogGain)
> > >  	{
> > >  	case 0:
> > 
> > How on earth does this compile?
> 
> There is a closing */ down under after the entire switch block. The
> change I made is within the comment block. I have compiled the built the
> driver successfully.

Oh...  Duh.  I thought you converted the // to /*.  This patch doesn't
make any sense though because originally it was commented out code, but
now it's a commented out ball of code and notes.

Just delete any commented out code.

regards,
dan carpenter

