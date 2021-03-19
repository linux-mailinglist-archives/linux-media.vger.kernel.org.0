Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5D234208A
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 16:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhCSPHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 11:07:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37980 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhCSPHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 11:07:21 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEtSjN152543;
        Fri, 19 Mar 2021 15:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=xZv2sgU3JpKBRV6q+XFwQ/3xh6eIohSkj5YX7kUD0wk=;
 b=pnL7K/u+aoxKwgmzJGD6GYq6jzg4G6xnQu90W+jhKsDBFITyz1sVlkquKPGweH7djvgu
 crwSmW18VdSfO2NRS4ycJwjFWQNFhIRThzOMeuXqwZiml+AL7SvwLDXFpemztOIJ6mjQ
 OM/hxCZKPUVFLmPOGbRPjPInBx5pMYSgLVMzNY/rMG1KDYEkLle1etljtWSS3Cr1CSM8
 lJiYBMv2CVAY4OHI+9rMhoiwIDW+GDu5WLSpBZa7TMG3wkcEfv3XsUa2VpiXy/XEEuup
 9BeIyeWVXx0gYtZbo9Wn23d1a3+Iyfo22G/jVu+ioXouIe5qGrUlHGEELLCrosNb2wG8 Eg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 378nbmkbjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 15:07:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12JEuD5d136976;
        Fri, 19 Mar 2021 15:07:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 3797b4c97f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Mar 2021 15:07:13 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12JF7Bgr008971;
        Fri, 19 Mar 2021 15:07:11 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Mar 2021 15:07:11 +0000
Date:   Fri, 19 Mar 2021 18:07:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix GFP_ flags in uvc_submit_urb()
Message-ID: <20210319150702.GJ2087@kadam>
References: <YFS5axzOQEJN6fHI@mwanda>
 <CAPybu_1tZgCY6NKnbH+MovHGNEUzGeN=4oF-dG407H0wQ7oSWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_1tZgCY6NKnbH+MovHGNEUzGeN=4oF-dG407H0wQ7oSWA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190107
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9928 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190107
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 19, 2021 at 03:57:44PM +0100, Ricardo Ribalda Delgado wrote:
> Hi Dan
> 
> On Fri, Mar 19, 2021 at 3:48 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The uvc_submit_urb() function is supposed to use the passed in GFP_
> > flags but this code accidentally uses GFP_KERNEL instead.  Some of
> > the callers are passing GFP_ATOMIC so presumably this can lead to
> > sleeping in atomic context.
> >
> > Fixes: b20f917f84e6 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I reported the same issue just some minutes ago. Christoph has already
> fixed the patch in his tree.
> 
> Where did you get the patchset? from next? from linus? or directly
> from Chirstoph tree?

From linux-next.  I'm not sure if it was from yesterday's linux-next or
from a couple days ago.

regards,
dan carpenter

