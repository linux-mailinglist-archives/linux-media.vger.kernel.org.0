Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAEE2F85B5
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 20:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387856AbhAOTr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 14:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733262AbhAOTru (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 14:47:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B75CC0613C1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 11:47:10 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60FF058B;
        Fri, 15 Jan 2021 20:47:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610740028;
        bh=cfp897znM/zemYdOdvSFX6aQgH7BN52N3aDpYW8edXs=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=dzjWRCnY8ucvflEIPtmwFXNP4JMbTXrmpNEFOjc6hIq7bA//dT0b6+vJvUHmCwA/2
         dzihIctNxLbq//+6Sye2sAJKF2Xm17vL1HQoEzakV36FGfhtqRVuK4vfOoFoDHEww2
         g8KRmLLVid1QntK33YYx1Zeouzv9gsGctYPrMMUs=
Subject: Re: [PATCH v4] media: v4l2-async: Add waiting subdevices debugfs
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210108171728.39434-2-ezequiel@collabora.com>
 <20210115191415.164127-1-ezequiel@collabora.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <fc13f536-c107-a097-9012-06d4184afa9c@ideasonboard.com>
Date:   Fri, 15 Jan 2021 19:47:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115191415.164127-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 15/01/2021 19:14, Ezequiel Garcia wrote:
> There is currently little to no information available
> about the reasons why a v4l2-async device hasn't
> probed completely.
> 
> Inspired by the "devices_deferred" debugfs file,
> add a file to list information about the subdevices
> that are on waiting lists, for each notifier.
> 
> This is useful to debug v4l2-async subdevices
> and notifiers, for instance when doing device bring-up.
> 
> For instance, a typical output would be:
> 
> $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> ipu1_csi1:
>  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> ipu1_csi0:
>  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> imx6-mipi-csi2:
>  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> imx-media:

Oh this is very exciting. I started looking at something like this
recently, hitting async failures, and this already looks better.

In other words, - Thank you!

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 63 ++++++++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
>  include/media/v4l2-async.h           |  8 ++++
>  3 files changed, 76 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index e3ab003a6c85..e35f18706792 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> @@ -14,6 +15,7 @@
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> @@ -837,3 +839,64 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	mutex_unlock(&list_lock);
>  }
>  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> +
> +static void print_waiting_subdev(struct seq_file *s,
> +				 struct v4l2_async_subdev *asd)
> +{
> +	switch (asd->match_type) {
> +	case V4L2_ASYNC_MATCH_I2C:
> +		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
> +			   asd->match.i2c.address);
> +		break;
> +	case V4L2_ASYNC_MATCH_FWNODE: {
> +		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
> +
> +		devnode = fwnode_graph_is_endpoint(fwnode) ?
> +			  fwnode_graph_get_port_parent(fwnode) :
> +			  fwnode_handle_get(fwnode);
> +
> +		seq_printf(s, " [fwnode] dev=%s, node=%pfw\n",
> +			   devnode->dev ? dev_name(devnode->dev) : "nil",
> +			   fwnode);
> +
> +		fwnode_handle_put(devnode);
> +		break;
> +	}
> +	}
> +}
> +
> +static const char *
> +v4l2_async_notifier_name(struct v4l2_async_notifier *notifier)
> +{
> +	if (notifier->v4l2_dev)
> +		return notifier->v4l2_dev->name;
> +	else if (notifier->sd)
> +		return notifier->sd->name;
> +	else
> +		return "nil";
> +}
> +
> +static int pending_subdevs_show(struct seq_file *s, void *data)
> +{
> +	struct v4l2_async_notifier *notif;
> +	struct v4l2_async_subdev *asd;
> +
> +	mutex_lock(&list_lock);
> +
> +	list_for_each_entry(notif, &notifier_list, list) {
> +		seq_printf(s, "%s:\n", v4l2_async_notifier_name(notif));
> +		list_for_each_entry(asd, &notif->waiting, list)
> +			print_waiting_subdev(s, asd);
> +	}
> +
> +	mutex_unlock(&list_lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
> +
> +void v4l2_async_debug_init(struct dentry *debugfs_dir)
> +{
> +	debugfs_create_file("pending_async_subdevices", 0444, debugfs_dir, NULL,
> +			    &pending_subdevs_fops);
> +}
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index f9cff033d0dc..b6a72d297775 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -14,6 +14,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
>  #include <linux/kernel.h>
> @@ -38,6 +39,7 @@
>  		       __func__, ##arg);				\
>  } while (0)
>  
> +static struct dentry *v4l2_debugfs_dir;
>  
>  /*
>   *	sysfs stuff
> @@ -1118,6 +1120,8 @@ static int __init videodev_init(void)
>  		return -EIO;
>  	}
>  
> +	v4l2_debugfs_dir = debugfs_create_dir("video4linux", NULL);
> +	v4l2_async_debug_init(v4l2_debugfs_dir);
>  	return 0;
>  }
>  
> @@ -1125,6 +1129,7 @@ static void __exit videodev_exit(void)
>  {
>  	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
>  
> +	debugfs_remove_recursive(v4l2_debugfs_dir);
>  	class_unregister(&video_class);
>  	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
>  }
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 0e04b5b2ebb0..243ac10a53c6 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -11,6 +11,7 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  
> +struct dentry;
>  struct device;
>  struct device_node;
>  struct v4l2_device;
> @@ -137,6 +138,13 @@ struct v4l2_async_notifier {
>  	struct list_head list;
>  };
>  
> +/**
> + * v4l2_async_debug_init - Initialize debugging tools.
> + *
> + * @debugfs_dir: pointer to the parent debugfs &struct dentry
> + */
> +void v4l2_async_debug_init(struct dentry *debugfs_dir);
> +
>  /**
>   * v4l2_async_notifier_init - Initialize a notifier.
>   *
> 

