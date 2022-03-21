Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA7A4E2614
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 13:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240603AbiCUMLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 08:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbiCUMLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 08:11:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0021B91ACC
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 05:10:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D50291;
        Mon, 21 Mar 2022 13:10:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647864610;
        bh=3Wjm8UPfl5SVvEZM7H5WegTH9NzoTK+6Lr3a/+CdF+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y9fLuoVXvmFfmIgZ+6GwCPsLeez2cWTMtAECqVHbS2+x5otNReUoiQO4xdnX4UIla
         K3Rp8IMYm3FJ0+OXVj0HjLnFbndRMuHE3SKz3Vaqazi1vL/7peusdNOFuduq9rTMV2
         gA4HhjccCaPFUlJQCWJqFhlXE8kQcKvm8G/TA35E=
Date:   Mon, 21 Mar 2022 14:09:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH for v5.18] v4l2-ctrls: unlink all subscribed events
Message-ID: <YjhrEHUaFftJOMHq@pendragon.ideasonboard.com>
References: <66246ea5-2bd7-6c9e-56c8-9d683ec58ffc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66246ea5-2bd7-6c9e-56c8-9d683ec58ffc@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Mar 17, 2022 at 01:56:08PM +0100, Hans Verkuil wrote:
> The v4l2_ctrl_handler_free() function must unlink all subscribed events
> of the control handler that is being freed, but it only did so for the
> controls owned by that control handler and not for the controls referred
> to by that control handler. This leaves stale data in the ev_subs list
> of those controls.
> 
> The node list header is also properly initialized and list_del_init is
> called instead of list_del to ensure that list_empty() can be used
> to detect whether a v4l2_subscribed_event is part of a list or not.
> 
> This makes v4l2_ctrl_del_event() more robust since it will not attempt
> to find the control if the v4l2_subscribed_event has already been unlinked
> from the control.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  | 7 +++++--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 6 +++++-
>  drivers/media/v4l2-core/v4l2-event.c      | 1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index db9baa0bd05f..d64b22cb182c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -1159,13 +1159,16 @@ static int v4l2_ctrl_add_event(struct v4l2_subscribed_event *sev,
>  
>  static void v4l2_ctrl_del_event(struct v4l2_subscribed_event *sev)
>  {
> -	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(sev->fh->ctrl_handler, sev->id);
> +	struct v4l2_ctrl *ctrl = NULL;
> +
> +	if (!list_empty(&sev->node))
> +		ctrl = v4l2_ctrl_find(sev->fh->ctrl_handler, sev->id);
>  
>  	if (!ctrl)
>  		return;

I'd go for

	if (list_empty(&sdev->node))
		return;

	ctrl = v4l2_ctrl_find(sev->fh->ctrl_handler, sev->id);
	if (!ctrl)
		return;

and drop the initialization of ctrl to NULL, it's easier to read.

>  
>  	v4l2_ctrl_lock(ctrl);

v4l2_ctrl_lock() simply calls

	mutex_lock(ctrl->handler->lock);

Is there any case where ctrl->handler != sev->fh->ctrl_handler ? If not
this could be simplified to drop the v4l2_ctrl_find() call.

> -	list_del(&sev->node);
> +	list_del_init(&sev->node);
>  	v4l2_ctrl_unlock(ctrl);
>  }
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 8968cec8454e..1a9d60cb119c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -10,6 +10,7 @@
>  #include <linux/slab.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
>  #include <media/v4l2-fwnode.h>
>  
>  #include "v4l2-ctrls-priv.h"
> @@ -1165,13 +1166,16 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	/* Free all nodes */
>  	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
>  		list_del(&ref->node);
> +		list_for_each_entry_safe(sev, next_sev, &ref->ctrl->ev_subs, node)
> +			if (sev->fh->ctrl_handler == hdl)
> +				list_del_init(&sev->node);

I have no idea how control reference works or what they're used for, so
I can't tell if this is safe without locking ref->ctrl.

>  		kfree(ref);
>  	}
>  	/* Free all controls owned by the handler */
>  	list_for_each_entry_safe(ctrl, next_ctrl, &hdl->ctrls, node) {
>  		list_del(&ctrl->node);
>  		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
> -			list_del(&sev->node);
> +			list_del_init(&sev->node);
>  		kvfree(ctrl);
>  	}
>  	kvfree(hdl->buckets);
> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
> index c5ce9f11ad7b..2fd9f7187c04 100644
> --- a/drivers/media/v4l2-core/v4l2-event.c
> +++ b/drivers/media/v4l2-core/v4l2-event.c
> @@ -246,6 +246,7 @@ int v4l2_event_subscribe(struct v4l2_fh *fh,
>  	sev->fh = fh;
>  	sev->ops = ops;
>  	sev->elems = elems;
> +	INIT_LIST_HEAD(&sev->node);
>  
>  	mutex_lock(&fh->subscribe_lock);

-- 
Regards,

Laurent Pinchart
