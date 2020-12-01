Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BFA2CA59C
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 15:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbgLAO3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 09:29:00 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47932 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387713AbgLAO27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 09:28:59 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1EPbKc066438;
        Tue, 1 Dec 2020 14:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lSDu8t/HORP5DGvOJVpdFSL55t/SXzgnV5nxwvWbtpM=;
 b=fBDLhHqSvpikoiRVAKewNM5lZ+BAmcHZ8lrgKB2KDaoRrk7/JSKt7+qNVsJDYIFpWpee
 +ZqheuWD/Uz1PIcDSzNguIfirqyu2GwVUFRhBqFg4xfEb9S51jtt8tk/2zWKysOx+RXn
 rVJVZnUx3u+X7jKDFY/ZUBirXtCfh3tH3LiG8OpqzsBhaA80ltrvannqaq1EezII5mY4
 pHI00AvViLwQ37Po/0LtAT97Ay/DloKvmhISctvTlWFaJRStLj9BcmFlpPPmdiFF6JNN
 lkzj4PLZ5q5xTPjta595lPHEXQgpRGvIOpTsWot0ZnFvD37+F3BSiLhfRyvmGq4q8+yk TQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 353dyqjsqc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 14:28:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1ELKc0118032;
        Tue, 1 Dec 2020 14:28:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3540fx0x2f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 14:28:05 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1ES2Rs023619;
        Tue, 1 Dec 2020 14:28:03 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Dec 2020 06:28:01 -0800
Date:   Tue, 1 Dec 2020 17:27:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkisp1: remove some dead code
Message-ID: <20201201142754.GI2767@kadam>
References: <X8TrSj3PbqVtN5XQ@mwanda>
 <a6d9660f-84ec-317d-c3aa-9b3bda595d49@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6d9660f-84ec-317d-c3aa-9b3bda595d49@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010092
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 30, 2020 at 11:20:05AM -0300, Helen Koike wrote:
> Hi Dan,
> 
> Thank you for your patch.
> 
> On 11/30/20 9:53 AM, Dan Carpenter wrote:
> > The debugfs_create_dir() function never returns NULLs.  It's not supposed
> > to checked for errors in the normal case and there is no need to check
> > in this function so let's just delete this dead code.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 9af137e4967f..68da1eed753d 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -430,10 +430,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >  	struct rkisp1_debug *debug = &rkisp1->debug;
> >  
> >  	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
> > -	if (!debug->debugfs_dir) {
> > -		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
> > -		return;
> > -	}
> 
> I was taking a look at the debugfs_create_dir() code, and I saw it can
> return ERR_PTR(), so ideally we should check for errors with IS_ERR() / PTR_ERR().

Debugfs functions aren't meant to be error checked in the normal case.
There are some drivers which dereference the dentry pointer so those
need to check it but that's not very common and isn't the case here.

I'm really sure this must be documented somewhere but I can't find it
at all.  :P  But look at commit 057e212eae72 ("media: usb: uvc: no need
to check return value of debugfs_create functions") for example.

regards,
dan carpenter
