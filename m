Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B89F2ECE17
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbhAGKrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:47:15 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48742 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbhAGKrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:47:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107Ad2RI021237;
        Thu, 7 Jan 2021 10:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=+nXFbYO12FXZYg/zscsbBhBStV646kHBHdEB2nrr0Bc=;
 b=k5KchOdDK0vlluEtl6ogmdaePJBG7UVjzvwqGPCGBJHYf0uw0Ll9kDy1hlDPIi9FTbJ+
 HLkFk8VJbN1NHaqJzptTYneUm4qmpqbi+i/Q8robgbH/G/Ecm0sFTjdG7XZ5CzHAC9Fj
 136uKmTA5kg/dAQLIU+vSbDS/1lUVhKmqQEhvshBgWhA6punKy+i1W8id0I407rjUcKC
 VTVprHXakDrSqORmzo79SIAUDORLM6eqWZZnH1596Oq8s01HeUU5TSkqhwT4t7adEgC1
 ueSuRyNg+QRFKqTH5/L83IOMP0xWeEpwxX/0RR1p2decuSJFCoZIPAKEZqfvBOj/yyN2 nQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 35wepmbuwf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 07 Jan 2021 10:46:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107AeWPL190215;
        Thu, 7 Jan 2021 10:46:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 35v4rdv74f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 07 Jan 2021 10:46:08 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107Ak5XB027722;
        Thu, 7 Jan 2021 10:46:05 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 07 Jan 2021 02:46:04 -0800
Date:   Thu, 7 Jan 2021 13:45:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        mjpeg-users@lists.sourceforge.net, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH -next] media: zoran: use resource_size
Message-ID: <20210107104557.GA5083@kadam>
References: <20210106131702.32507-1-zhengyongjun3@huawei.com>
 <20210106145100.GJ2809@kadam>
 <X/Ybbj6gN2xrhIwP@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X/Ybbj6gN2xrhIwP@Red>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070064
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 09:19:58PM +0100, LABBE Corentin wrote:
> Le Wed, Jan 06, 2021 at 05:51:00PM +0300, Dan Carpenter a écrit :
> > On Wed, Jan 06, 2021 at 09:17:02PM +0800, Zheng Yongjun wrote:
> > > Use resource_size rather than a verbose computation on
> > > the end and start fields.
> > > 
> > > Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> > > ---
> > >  drivers/staging/media/zoran/zoran_driver.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
> > > index 808196ea5b81..d60b4c73ea80 100644
> > > --- a/drivers/staging/media/zoran/zoran_driver.c
> > > +++ b/drivers/staging/media/zoran/zoran_driver.c
> > > @@ -1020,7 +1020,7 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq)
> > >  	vq->buf_struct_size = sizeof(struct zr_buffer);
> > >  	vq->ops = &zr_video_qops;
> > >  	vq->mem_ops = &vb2_dma_contig_memops;
> > > -	vq->gfp_flags = GFP_DMA32,
> > > +	vq->gfp_flags = GFP_DMA32;
> > 
> > The commit doesn't match the patch.  Also this driver is in
> > staging because it's going to be deleted soon so there probably isn't
> > much point doing cleanups.
> > 
> 
> No, the driver just came back in staging since I fixed the videobuf2 conversion.

Ah... Thanks.

regards,
dan carpenter

