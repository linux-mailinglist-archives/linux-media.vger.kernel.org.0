Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F021184A
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 13:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfEBLoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 07:44:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEBLoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 07:44:00 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A77C2DF;
        Thu,  2 May 2019 13:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1556797437;
        bh=eQ0yhM/XHZy+PnHY0g8qUvumXyUQTnDCpyfMpvVR35w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCuJ93bFomJrT8vv0gdmCYfPqcmVCnvW94RPK7YthrMXlFAXORJX05vCkTxJ88Dfm
         rd6l58IX9tNna4xpC8OjI1DJpOzYUsTaOqFD5tF/HDSQx7TB4TdchiCQa6eXEzGS5L
         wOP/set2bG/weOLb7bY7aTvWPo5q00KARawTyxs8=
Date:   Thu, 2 May 2019 14:43:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] uvc: fix access to uninitialized fields on probe error
Message-ID: <20190502114344.GP4888@pendragon.ideasonboard.com>
References: <20190430122814.24986-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190430122814.24986-1-oneukum@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

Thank you for the patch.

On Tue, Apr 30, 2019 at 02:28:14PM +0200, Oliver Neukum wrote:
> We need to check whether this work we are canceling actually is
> initialized.

I think we should add

Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: syzbot+2e1ef9188251d9cc7944@syzkaller.appspotmail.com
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 14cff91b7aea..2b510c56cf91 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2350,7 +2350,9 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
>  	struct uvc_entity *entity;
>  	unsigned int i;
>  
> -	cancel_work_sync(&dev->async_ctrl.work);
> +	/* can be uninitialized if we are aborting on probe error */

Let's capitalise the comment and end it with a period to match the rest
of the driver. With these small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you agree with the changes there's no need to resubmit, I'll fix when
applying.

> +	if (dev->async_ctrl.work.func)
> +		cancel_work_sync(&dev->async_ctrl.work);
>  
>  	/* Free controls and control mappings for all entities. */
>  	list_for_each_entry(entity, &dev->entities, list) {

-- 
Regards,

Laurent Pinchart
