Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B97147EC4
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 11:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgAXKcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 05:32:50 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43388 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgAXKcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 05:32:50 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OAN7oN051293;
        Fri, 24 Jan 2020 10:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=cTEFdVGLCVJOCub3OfHVTFbUrl/g8YMcQ2qqZYlBchc=;
 b=Nt+itTRYsZYomY8P7aEPgOzY6sIFGPM+H7Rm2FNDrngfp5HTBVCrD9XX8SL8ALNRouN4
 Ap5EBRv03a5GBmQbQIGlBcGWLsvFmpu7pu/+lZW28b8SfHjVk1j/YvrmwgQ0ukbge8L9
 Tk2R4P/LGLg6Ykub7UAIXjUqX7KkU9VXgLxgGmeVv+RbYRZ4LYA94nZquXTEEuq74Wo0
 VjpaJ4uIzP6ERnC71btX89vM+F4rXc/b+tMCtjrZ6ULyyxSSenBQXB0c/Ig8fvyDpkSO
 eHGBIoQPcg3xUWnj67eWD00jb2dC3U39N91Ot1iY8DemnV0wW6cZviR7GQTqwxd2bMbP JA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2xksyqr7b9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 10:32:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OAWO3t102935;
        Fri, 24 Jan 2020 10:32:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xqmwe85tq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Jan 2020 10:32:39 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00OAVY4T023294;
        Fri, 24 Jan 2020 10:31:35 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Jan 2020 02:31:33 -0800
Date:   Fri, 24 Jan 2020 13:31:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Sean Paul <seanpaul@chromium.org>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix locking in sync_print_obj()
Message-ID: <20200124103123.GL1847@kadam>
References: <20200124101311.drryaegcdc7d4x7e@kili.mountain>
 <157986125623.2524.13979010293671565726@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157986125623.2524.13979010293671565726@skylake-alporthouse-com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240086
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 24, 2020 at 10:20:56AM +0000, Chris Wilson wrote:
> Quoting Dan Carpenter (2020-01-24 10:13:12)
> > This is always called with IRQs disabled and we don't actually want to
> > enable IRQs at the end.
> > 
> > Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/dma-buf/sync_debug.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> > index 101394f16930..952331344b1c 100644
> > --- a/drivers/dma-buf/sync_debug.c
> > +++ b/drivers/dma-buf/sync_debug.c
> > @@ -107,15 +107,16 @@ static void sync_print_fence(struct seq_file *s,
> >  static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
> >  {
> >         struct list_head *pos;
> > +       unsigned long flags;
> >  
> >         seq_printf(s, "%s: %d\n", obj->name, obj->value);
> >  
> > -       spin_lock_irq(&obj->lock);
> > +       spin_lock_irqsave(&obj->lock, flags);
> 
> Exactly, it can be just spin_lock() as the irq state is known.
> 

I did consider that but I wasn't sure how this is going to be used in
the future so I took a conservative approach.

> Once again I question why this [sync_debug.c] code even exists.

No idea.

regards,
dan carpenter

