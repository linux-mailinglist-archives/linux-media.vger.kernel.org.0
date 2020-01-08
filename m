Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF27134616
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 16:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgAHPYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 10:24:36 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:44132 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgAHPYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 10:24:36 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 008F9xWt159803;
        Wed, 8 Jan 2020 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=OlgYEcq3FlsS4ZFGG5PlJ0Gf0bxFSWE6Vx1/vHMVE6s=;
 b=cic+ZN8r6FOx5i8acTnJbILtV8gW8mvRdoRvZFBiywm3QWkVMA2j/NQ5DVJGikAlBRjl
 2YnRZ20NCPLLs1OCCLh2ogRLMlUPJTHpR4U0j9RVrc2+6yQTYpDBL2z+PC2ArJRtdAYu
 sq5ORMSDIoKlQs6KBt7WOJ1de3e8C3zqhrRyDF++uvIJbuR1wLSIbgunSE3Lm41VjPG8
 jhs7zXgISR7BY4Om7pxZNph59mtYDbzi805DjrNXUNJNlQ6f4Lw4h6DlmTCegsHfvaty
 bB4wf1i0QBMf8B8cHRKoUFcPMfzwLYgNFtivaWd0xTC7F8sUcmULb4miD+8F0K46Y/0G ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2xakbqvgb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 15:24:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 008F9wE8175344;
        Wed, 8 Jan 2020 15:24:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2xcqbp8r0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jan 2020 15:24:29 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 008FORdq011993;
        Wed, 8 Jan 2020 15:24:27 GMT
Received: from kadam (/10.175.168.130)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 Jan 2020 07:24:26 -0800
Date:   Wed, 8 Jan 2020 18:24:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: hantro: remove a pointless NULL check
Message-ID: <20200108152418.GH27042@kadam>
References: <20200108053534.6rwxk2httwoflbgv@kili.mountain>
 <1118f946572b3da0562fa1c0347fceaeda93f38f.camel@collabora.com>
 <20200108151809.GG27042@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108151809.GG27042@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001080128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001080128
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 08, 2020 at 06:18:09PM +0300, Dan Carpenter wrote:
> On Wed, Jan 08, 2020 at 12:08:21PM -0300, Ezequiel Garcia wrote:
> > Hi Dan,
> > 
> > Thanks for the patch.
> > 
> > On Wed, 2020-01-08 at 08:35 +0300, Dan Carpenter wrote:
> > > This can't be NULL and we've already dereferenced it so let's remove
> > > the check.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > index 85af1b96fd34..0198bcda26b7 100644
> > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > @@ -688,7 +688,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
> > >  	return ret;
> > >  
> > >  err_codec_exit:
> > > -	if (ctx->codec_ops && ctx->codec_ops->exit)
> > > +	if (ctx->codec_ops->exit)
> > 
> > Since you are here, can you remove the other unneeded
> > checks in the driver?
> > 
> 
> There is only one more, but yes, I should remove it as well.

Actually the other check is required.

Let's just leave this one as well.  It doesn't hurt anything and it
makes the code more future proof.

regards,
dan carpenter


