Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68E2C9C54C
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2019 19:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbfHYRwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Aug 2019 13:52:25 -0400
Received: from cnc.isely.net ([75.149.91.89]:46025 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbfHYRwY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Aug 2019 13:52:24 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Aug 2019 13:52:24 EDT
Received: from lochley (lochley-lan.isely.net [::ffff:192.168.23.74])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-GCM-SHA384)
  by cnc.isely.net with ESMTPSA; Sun, 25 Aug 2019 12:47:20 -0500
  id 000000000014205E.000000005D62C9A8.00004CB9
Date:   Sun, 25 Aug 2019 12:47:20 -0500 (CDT)
From:   isely@isely.net
To:     Yizhuo <yzhai003@ucr.edu>
cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Isely at pobox <isely@pobox.com>
Subject: Re: [PATCH] [media] pvrusb2: qctrl.flag will be uninitlaized if
 cx2341x_ctrl_query() returns error code
In-Reply-To: <20190821210931.9621-1-yzhai003@ucr.edu>
Message-ID: <alpine.DEB.2.20.1908251247040.22242@lochley.isely.net>
References: <20190821210931.9621-1-yzhai003@ucr.edu>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Acked-by: Mike Isely <isely@pobox.com>

On Wed, 21 Aug 2019, Yizhuo wrote:

> Inside function ctrl_cx2341x_getv4lflags(), qctrl.flag
> will be uninitlaized if cx2341x_ctrl_query() returns -EINVAL.
> However, it will be used in the later if statement, which is
> potentially unsafe.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index ad5b25b89699..1fa05971316a 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -793,6 +793,7 @@ static unsigned int ctrl_cx2341x_getv4lflags(struct pvr2_ctrl *cptr)
>  	struct v4l2_queryctrl qctrl;
>  	struct pvr2_ctl_info *info;
>  	qctrl.id = cptr->info->v4l_id;
> +	memset(&qctr, 0, sizeof(qctrl))
>  	cx2341x_ctrl_query(&cptr->hdw->enc_ctl_state,&qctrl);
>  	/* Strip out the const so we can adjust a function pointer.  It's
>  	   OK to do this here because we know this is a dynamically created
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
