Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E643991F
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 00:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730348AbfFGWtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 18:49:47 -0400
Received: from cnc.isely.net ([75.149.91.89]:34063 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728756AbfFGWtr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 18:49:47 -0400
X-Greylist: delayed 307 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jun 2019 18:49:47 EDT
Received: from lochley (lochley-lan.isely.net [::ffff:192.168.23.74])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-GCM-SHA384)
  by cnc.isely.net with ESMTPSA; Fri, 07 Jun 2019 17:44:39 -0500
  id 000000000014219D.000000005CFAE8D7.00001816
Date:   Fri, 7 Jun 2019 17:44:39 -0500 (CDT)
From:   isely@isely.net
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] media: pvrusb2: fix null-ptr-deref in
 class_unregister()
In-Reply-To: <20190605130820.19306-1-wangkefeng.wang@huawei.com>
Message-ID: <alpine.DEB.2.20.1906071744200.5503@lochley.isely.net>
References: <20190605130820.19306-1-wangkefeng.wang@huawei.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Acked-By: Mike Isely <isely@pobox.com>

On Wed, 5 Jun 2019, Kefeng Wang wrote:

> The class_ptr will be NULL if pvr2_sysfs_class_create() fails
> in pvr_init(), when call pvr2_sysfs_class_destroy(), it will
> lead to null-ptr-deref, fix it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c b/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c
> index 7bc6d090358e..b6c6b314fadc 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-sysfs.c
> @@ -802,7 +802,8 @@ struct pvr2_sysfs_class *pvr2_sysfs_class_create(void)
>  void pvr2_sysfs_class_destroy(struct pvr2_sysfs_class *clp)
>  {
>  	pvr2_sysfs_trace("Unregistering pvr2_sysfs_class id=%p", clp);
> -	class_unregister(&clp->class);
> +	if (clp)
> +		class_unregister(&clp->class);
>  }
>  
>  
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
