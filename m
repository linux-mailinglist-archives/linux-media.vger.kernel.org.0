Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE6A2F76C3
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 11:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbhAOKfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 05:35:07 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36361 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbhAOKfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 05:35:03 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0MQqlLd9aaiWp0MQtlU1dy; Fri, 15 Jan 2021 11:34:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610706860; bh=JlCoXB/fX7TuKMOabYNaoL4bUZScH8LVuM7FGvd3m5g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=R8kPpsjCU2GTYGpxAPWxMDQr5tvHR2whnQu7GeSzLP3Av6nBdK80Sx5kDPl/yMm0Z
         /McQXXSmduT+3JMwNNC//jZRHmGaY8DLhw3YyR3W/IZkGjZE2ltul8n37MM+YHWgEW
         zj+qmeX6CQTatXg4QXMF8bynUT3hdt4z8KWGTa6GPUfqAd+1mhRifLxUsaqWWEcEb1
         gQDQttb5UHrmFpy6l8PWpmasPty2hdF/A12s+bVerpmXJyjvCA/bZTaXXRdFPX2cNF
         cqYE7D9UhW/V+5tfNOalQww8FsdyNDr55k8PdmqzZvaKVaSe2/lOQ2XhqeP+Ero8bR
         6376EIMf7wvew==
Subject: Re: [PATCH v3] media: v4l2-async: Add waiting subdevices debugfs
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210108171728.39434-1-ezequiel@collabora.com>
 <20210108171728.39434-2-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b7713571-d046-6e8a-ce64-cccd0f16642a@xs4all.nl>
Date:   Fri, 15 Jan 2021 11:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108171728.39434-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGyOXBhIHpf6+Yli65QXGtVG0YmDFNyDeH2U6bx7lIdWXsp1c9dxnafxI6dO06M4mttw//hT4UPdBzW18QnBsyoL+A99CBBzN6oN9SjwUui63wQRjzJ2
 In1XFPpYGNMEISZ2nAx++v51SMdlnSke3zBHAdOnrhSjBH8Hf8EhwEY4pJH7RrZJducJ61QQuEreLnuX1K2BAbPrbj+CChRXvjboqgzuSP/9idUpEAVXV4ir
 EWphMRHBWtcALpGmLlj08O383C6+O8xczEz/EZKILzRt/unnJYnr/rl2WTY8AxpppnK8MzY9mRGgttcQ4WW2uLcjWy9rgYcdeZBOWalisJCXW0I0Iq9m+bAe
 I1G+aTcO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/01/2021 18:17, Ezequiel Garcia wrote:
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
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Nice, this should be quite useful.

Regards,

	Hans

> --
> v3:
> * Drop MATCH_CUSTOM
> * Use the actual fwnode, to print the real full path. endpoint name.
> * Fix refcounted handle leak.
> v2:
> * Print fwnode path, as suggested by Sakari.
> * Print the subdevices under their corresponding notifier.
> * Rename the file as suggested by Laurent.
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 66 ++++++++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
>  include/media/v4l2-async.h           |  8 ++++
>  3 files changed, 79 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 3faf1d12d49d..7c8a97205b3e 100644
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
> @@ -823,3 +825,67 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	mutex_unlock(&list_lock);
>  }
>  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> +
> +static void print_waiting_subdev(struct seq_file *s,
> +				 struct v4l2_async_subdev *asd)
> +{
> +	switch (asd->match_type) {
> +	case V4L2_ASYNC_MATCH_DEVNAME:
> +		seq_printf(s, " [devname] dev=%s\n", asd->match.device_name);
> +		break;
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
> index a593ea0598b5..8d3813e6ab56 100644
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
> @@ -37,6 +38,7 @@
>  		       __func__, ##arg);				\
>  } while (0)
>  
> +static struct dentry *v4l2_debugfs_dir;
>  
>  /*
>   *	sysfs stuff
> @@ -1113,6 +1115,8 @@ static int __init videodev_init(void)
>  		return -EIO;
>  	}
>  
> +	v4l2_debugfs_dir = debugfs_create_dir("video4linux", NULL);
> +	v4l2_async_debug_init(v4l2_debugfs_dir);
>  	return 0;
>  }
>  
> @@ -1120,6 +1124,7 @@ static void __exit videodev_exit(void)
>  {
>  	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
>  
> +	debugfs_remove_recursive(v4l2_debugfs_dir);
>  	class_unregister(&video_class);
>  	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
>  }
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 8ed42188e7c9..26296d4cb660 100644
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
> @@ -120,6 +121,13 @@ struct v4l2_async_notifier {
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

