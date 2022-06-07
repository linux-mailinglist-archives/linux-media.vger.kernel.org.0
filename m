Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 315EE53F6D5
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 09:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237475AbiFGHF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 03:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237489AbiFGHF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 03:05:57 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C94E278D
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 00:05:54 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6374FE0003;
        Tue,  7 Jun 2022 07:05:51 +0000 (UTC)
Date:   Tue, 7 Jun 2022 09:05:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Daniel Scally <djrscally@gmail.com>,
        kieran bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: ipu3-cio2: Move functionality from .complete() to
 .bound()
Message-ID: <20220607070549.h7gtwgvjw4wj5vkr@uno.localdomain>
References: <20220506211555.1364864-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220506211555.1364864-1-djrscally@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,
   cc-ing Kieran which has proposed to discuss about this during media
summit

On Fri, May 06, 2022 at 10:15:55PM +0100, Daniel Scally wrote:
> Creating links and registering subdev nodes during the .complete()
> callback has the unfortunate effect of preventing all cameras that
> connect to a notifier from working if any one of their drivers fails
> to probe. Moving the functionality from .complete() to .bound() allows
> those camera sensor drivers that did probe correctly to work regardless.
>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>
> This results in v4l2_device_register_subdev_nodes() being called multiple times
> but since it's a no-op where the devnode exists already, I think that it's ok.
>
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 65 +++++++------------
>  1 file changed, 23 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 93cc0577b6db..6a1bcb20725d 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1387,7 +1387,10 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>  {
>  	struct cio2_device *cio2 = to_cio2_device(notifier);
>  	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
> +	struct device *dev = &cio2->pci_dev->dev;
>  	struct cio2_queue *q;
> +	unsigned int pad;
> +	int ret;
>
>  	if (cio2->queue[s_asd->csi2.port].sensor)
>  		return -EBUSY;
> @@ -1398,7 +1401,26 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>  	q->sensor = sd;
>  	q->csi_rx_base = cio2->base + CIO2_REG_PIPE_BASE(q->csi2.port);
>
> -	return 0;
> +	for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> +		if (q->sensor->entity.pads[pad].flags &
> +					MEDIA_PAD_FL_SOURCE)
> +			break;
> +
> +	if (pad == q->sensor->entity.num_pads) {
> +		dev_err(dev, "failed to find src pad for %s\n",
> +			q->sensor->name);
> +		return -ENXIO;
> +	}
> +
> +	ret = media_create_pad_link(&q->sensor->entity, pad, &q->subdev.entity,
> +				    CIO2_PAD_SINK, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to create link for %s\n",
> +			q->sensor->name);
> +		return ret;
> +	}
> +
> +	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
>  }
>
>  /* The .unbind callback */
> @@ -1412,50 +1434,9 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
>  	cio2->queue[s_asd->csi2.port].sensor = NULL;
>  }
>
> -/* .complete() is called after all subdevices have been located */
> -static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
> -{
> -	struct cio2_device *cio2 = to_cio2_device(notifier);
> -	struct device *dev = &cio2->pci_dev->dev;
> -	struct sensor_async_subdev *s_asd;
> -	struct v4l2_async_subdev *asd;
> -	struct cio2_queue *q;
> -	unsigned int pad;
> -	int ret;
> -
> -	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
> -		s_asd = to_sensor_asd(asd);
> -		q = &cio2->queue[s_asd->csi2.port];
> -
> -		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> -			if (q->sensor->entity.pads[pad].flags &
> -						MEDIA_PAD_FL_SOURCE)
> -				break;
> -
> -		if (pad == q->sensor->entity.num_pads) {
> -			dev_err(dev, "failed to find src pad for %s\n",
> -				q->sensor->name);
> -			return -ENXIO;
> -		}
> -
> -		ret = media_create_pad_link(
> -				&q->sensor->entity, pad,
> -				&q->subdev.entity, CIO2_PAD_SINK,
> -				0);
> -		if (ret) {
> -			dev_err(dev, "failed to create link for %s\n",
> -				q->sensor->name);
> -			return ret;
> -		}
> -	}
> -
> -	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
> -}
> -
>  static const struct v4l2_async_notifier_operations cio2_async_ops = {
>  	.bound = cio2_notifier_bound,
>  	.unbind = cio2_notifier_unbind,
> -	.complete = cio2_notifier_complete,
>  };
>
>  static int cio2_parse_firmware(struct cio2_device *cio2)
> --
> 2.25.1
>
