Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADF927BCE4
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 08:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgI2GOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 02:14:48 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44550 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgI2GOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 02:14:47 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08T691sl176376;
        Tue, 29 Sep 2020 06:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9YKm5YL49JsXLCHT2j8lyX56XnxN9WjhAprzJJapyXA=;
 b=u/ynRmdh1Yjv1unrYYUO3kGxz5npYztE9KiPZlZAlqHqZEMmidIGQcqhs8iaS3omg3K/
 NXPzdsJwi6mapH86xdg5brTgrsEdtv7DT7wHh+JM9XOWHjYOzXn1Fybr9m5Xk/jvBYhN
 aMExOWWchRBDD6tElMBVniSGDjrfEjeuDi8lAPXFddQUuTSettjn9rVYEZdWAKSc7+Xr
 akafsJ/tU4f1ZHmLsFszsNQxg2csBoI64pjz0pH11b9F9wW/Idq5RryzQ5B8C/+FKfyN
 oGQi4mf3c/sB+XFUluWIpKf5dlB5ssM28JJnEyXA3ZsxKPNLqwX9WtN1skODw8Ns5B71 ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 33sx9n0mmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Sep 2020 06:14:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08T6Aq2S022830;
        Tue, 29 Sep 2020 06:14:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33uv2dd32r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Sep 2020 06:14:34 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08T6EXbF031722;
        Tue, 29 Sep 2020 06:14:33 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Sep 2020 23:14:32 -0700
Date:   Tue, 29 Sep 2020 09:14:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
        Michel Lespinasse <walken@google.com>,
        Greg KH <gregkh@linuxfoundation.org>, gustavoars@kernel.org,
        daniel.m.jordan@oracle.com, sakari.ailus@linux.intel.com,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fixed error handling path
Message-ID: <20200929061424.GU4282@kadam>
References: <1601219284-13275-1-git-send-email-jrdr.linux@gmail.com>
 <20200928083757.GA18329@kadam>
 <CAFqt6zZaf=+JcUuxKdoEj1vMs5MOsb1iYKStmwKiKLW8bbcnYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqt6zZaf=+JcUuxKdoEj1vMs5MOsb1iYKStmwKiKLW8bbcnYQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=2 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=2
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290061
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 07:34:39AM +0530, Souptick Joarder wrote:
> Hi Dan,
> 
> 
> On Mon, Sep 28, 2020 at 2:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Sun, Sep 27, 2020 at 08:38:04PM +0530, Souptick Joarder wrote:
> > > Inside alloc_user_pages() based on flag value either pin_user_pages()
> > > or get_user_pages_fast() will be called. However, these API might fail.
> > >
> > > But free_user_pages() called in error handling path doesn't bother
> > > about return value and will try to unpin bo->pgnr pages, which is
> > > incorrect.
> > >
> > > Fix this by passing the page_nr to free_user_pages(). If page_nr > 0
> > > pages will be unpinned based on bo->mem_type. This will also take care
> > > of non error handling path.
> > >
> > > Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory
> > > allocation")
> > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > Cc: John Hubbard <jhubbard@nvidia.com>
> > > Cc: Ira Weiny <ira.weiny@intel.com>
> > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > > index f13af23..0168f98 100644
> > > --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> > > @@ -857,16 +857,17 @@ static void free_private_pages(struct hmm_buffer_object *bo,
> > >       kfree(bo->page_obj);
> > >  }
> > >
> > > -static void free_user_pages(struct hmm_buffer_object *bo)
> > > +static void free_user_pages(struct hmm_buffer_object *bo,
> > > +                         unsigned int page_nr)
> > >  {
> > >       int i;
> > >
> > >       hmm_mem_stat.usr_size -= bo->pgnr;
> >                               ^^^^^^^^^^^
> > This is still a problem.  It needs to be hmm_mem_stat.usr_size -= page_nr.
> 
> In failure path, it is hmm_mem_stat.usr_size += bo->pgnr.
> I think, hmm_mem_stat.usr_size -= bo->pgnr is correct as per existing code.
> Do you think that needs to be changed ?
> 

Yeah.  Crud.  I'm sorry.  You had it right.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

