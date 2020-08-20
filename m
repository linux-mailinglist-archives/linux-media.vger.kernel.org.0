Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F1024C3E6
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 19:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgHTRAV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 13:00:21 -0400
Received: from cnc.isely.net ([75.149.91.89]:51183 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbgHTRAU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 13:00:20 -0400
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Aug 2020 13:00:20 EDT
Received: from cnc-c.isely.net ([::ffff:75.149.91.89])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-SHA)
  by cnc.isely.net with ESMTPSA; Thu, 20 Aug 2020 11:55:13 -0500
  id 0000000000126070.000000005F3EAAF1.00001768
Date:   Thu, 20 Aug 2020 11:55:13 -0500 (CDT)
From:   Mike Isely <isely@isely.net>
Reply-To: Mike Isely at pobox <isely@pobox.com>
To:     Tong Zhang <ztong0001@gmail.com>
cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Isely at pobox <isely@pobox.com>
Subject: Re: [PATCH v3] media: pvrusb2: fix parsing error
In-Reply-To: <20200820165239.8510-1-ztong0001@gmail.com>
Message-ID: <alpine.DEB.2.11.2008201154460.4428@cnc.isely.net>
References: <aed971ed-bd8e-eaed-b2ee-80e9654f24cd@xs4all.nl> <20200820165239.8510-1-ztong0001@gmail.com>
User-Agent: Alpine 2.11 (DEB 23 2013-08-11)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Acked-by: Mike Isely <isely@pobox.com>

On Thu, 20 Aug 2020, Tong Zhang wrote:

> pvr2_std_str_to_id() returns 0 on failure and 1 on success,
> however the caller is checking failure case using <0
> 
> Co-developed-by: Hans Verkuil<hverkuil@xs4all.nl>
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
> 
> v2: return -EINVAL as suggested by Hans Verkuil<hverkuil@xs4all.nl>.
> I also rebased the code on v5.9-rc1.
> v3: remove unused variable
> 
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index 1cfb7cf64131..f4a727918e35 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -864,10 +864,9 @@ static int ctrl_std_sym_to_val(struct pvr2_ctrl *cptr,
>  			       const char *bufPtr,unsigned int bufSize,
>  			       int *mskp,int *valp)
>  {
> -	int ret;
>  	v4l2_std_id id;
> -	ret = pvr2_std_str_to_id(&id,bufPtr,bufSize);
> -	if (ret < 0) return ret;
> +	if (!pvr2_std_str_to_id(&id, bufPtr, bufSize))
> +		return -EINVAL;
>  	if (mskp) *mskp = id;
>  	if (valp) *valp = id;
>  	return 0;
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
