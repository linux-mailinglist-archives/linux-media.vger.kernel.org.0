Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206A99DA32
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 01:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfHZX4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 19:56:49 -0400
Received: from cnc.isely.net ([75.149.91.89]:51513 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbfHZX4t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 19:56:49 -0400
Received: from lochley (lochley-lan.isely.net [::ffff:192.168.23.74])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-GCM-SHA384)
  by cnc.isely.net with ESMTPSA; Mon, 26 Aug 2019 18:56:47 -0500
  id 0000000000142089.000000005D6471BF.00006FA1
Date:   Mon, 26 Aug 2019 18:56:47 -0500 (CDT)
From:   isely@isely.net
To:     Yizhuo <yzhai003@ucr.edu>
cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Isely <isely@isely.net>
Subject: Re: [PATCH] [media] pvrusb2: qctrl.flag will be uninitlaized if
 cx2341x_ctrl_query() returns error code
In-Reply-To: <20190826235528.9923-1-yzhai003@ucr.edu>
Message-ID: <alpine.DEB.2.20.1908261856340.22242@lochley.isely.net>
References: <20190826235528.9923-1-yzhai003@ucr.edu>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Acked-by: Mike Isely <isely@pobox.com>

On Mon, 26 Aug 2019, Yizhuo wrote:

> Inside function ctrl_cx2341x_getv4lflags(), qctrl.flag
> will be uninitlaized if cx2341x_ctrl_query() returns -EINVAL.
> However, it will be used in the later if statement, which is
> potentially unsafe.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index ad5b25b89699..66a34fb9e6b2 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -790,7 +790,7 @@ static int ctrl_cx2341x_set(struct pvr2_ctrl *cptr,int m,int v)
>  
>  static unsigned int ctrl_cx2341x_getv4lflags(struct pvr2_ctrl *cptr)
>  {
> -	struct v4l2_queryctrl qctrl;
> +	struct v4l2_queryctrl qctrl = {};
>  	struct pvr2_ctl_info *info;
>  	qctrl.id = cptr->info->v4l_id;
>  	cx2341x_ctrl_query(&cptr->hdw->enc_ctl_state,&qctrl);
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
