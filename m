Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CDE2E6A08
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 19:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgL1ShK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 13:37:10 -0500
Received: from mga04.intel.com ([192.55.52.120]:65156 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727803AbgL1ShK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 13:37:10 -0500
IronPort-SDR: l3hyhcJ3ncblzdwEFpewfsdsaW2PhnRjtcJnekRzokqchsQ13ui1El4S5H9hDCZ1WgDBgAMVEM
 0uGgbuEjNNgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="173835367"
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; 
   d="scan'208";a="173835367"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 10:35:24 -0800
IronPort-SDR: TQniySVsNlhRodUnD1r08/zqAV7Xd0G2CY/nuSfJ7f+YXq8muzVI3zVPwl/1wxgJp/0Ja6dMgE
 sL0IBWzHtlEg==
X-IronPort-AV: E=Sophos;i="5.78,455,1599548400"; 
   d="scan'208";a="375742402"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 10:35:22 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DE993207BF; Mon, 28 Dec 2020 20:35:20 +0200 (EET)
Date:   Mon, 28 Dec 2020 20:35:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20201228183520.GB26370@paasikivi.fi.intel.com>
References: <20201228180511.43486-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228180511.43486-1-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thanks for the patch.

On Mon, Dec 28, 2020 at 03:05:11PM -0300, Ezequiel Garcia wrote:
> There is currently little to none information available
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
> $ cat /sys/kernel/debug/video4linux/waiting_subdevices
> [fwnode] 1-003c
> [fwnode] 20e0000.iomuxc-gpr:ipu1_csi1_mux
> [fwnode] 20e0000.iomuxc-gpr:ipu1_csi0_mux
> 
> It's possible to provide some more information, detecting
> the type of fwnode and printing of-specific or acpi-specific
> details. For now, the implementation is kept simple.

The rest of the debug information we're effectively providing through
kernel messages on DEBUG level (pr_debug/dev_dbg). Could we do the same
here?

Would just printing the names of the pending sub-devices at notifier
register and async subdevice register time be sufficient? That way you'd
also be fine with just dmesg output if you're asking someone to provide you
information from another system.

> 
> Also, note that match-type "custom" prints no information.
> Since there are no in-tree users of this match-type,
> the implementation doesn't bother.

Lines up to 74 characters are fine. Only in Gerrit it's 60 or 40 or
whatever characters. ;-)

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 54 ++++++++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
>  include/media/v4l2-async.h           |  7 ++++
>  3 files changed, 66 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index e3ab003a6c85..32cd1ecced97 100644
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
> @@ -837,3 +839,55 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	mutex_unlock(&list_lock);
>  }
>  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> +
> +static void print_waiting_subdev(struct seq_file *s,
> +				 struct v4l2_async_subdev *asd)
> +{
> +	switch (asd->match_type) {
> +	case V4L2_ASYNC_MATCH_CUSTOM:
> +		seq_puts(s, "[custom]\n");
> +		break;
> +	case V4L2_ASYNC_MATCH_DEVNAME:
> +		seq_printf(s, "[devname] %s\n",
> +			   asd->match.device_name);
> +		break;
> +	case V4L2_ASYNC_MATCH_I2C:
> +		seq_printf(s, "[i2c] %d-%04x\n",
> +			   asd->match.i2c.adapter_id,
> +			   asd->match.i2c.address);
> +		break;
> +	case V4L2_ASYNC_MATCH_FWNODE: {
> +		struct fwnode_handle *fwnode = asd->match.fwnode;
> +
> +		if (fwnode_graph_is_endpoint(fwnode))
> +			fwnode = fwnode_graph_get_port_parent(fwnode);
> +
> +		seq_printf(s, "[fwnode] %s\n",
> +			   fwnode->dev ? dev_name(fwnode->dev) : "nil");
> +		break;
> +	}
> +	}
> +}
> +
> +static int waiting_subdevs_show(struct seq_file *s, void *data)
> +{
> +	struct v4l2_async_notifier *notifier;
> +	struct v4l2_async_subdev *asd;
> +
> +	mutex_lock(&list_lock);
> +
> +	list_for_each_entry(notifier, &notifier_list, list)
> +		list_for_each_entry(asd, &notifier->waiting, list)
> +			print_waiting_subdev(s, asd);
> +
> +	mutex_unlock(&list_lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(waiting_subdevs);
> +
> +void v4l2_async_debug_init(struct dentry *debugfs_dir)
> +{
> +	debugfs_create_file("waiting_subdevices", 0444, debugfs_dir, NULL,
> +			    &waiting_subdevs_fops);
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
> index d6e31234826f..312ab421aa40 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -137,6 +137,13 @@ struct v4l2_async_notifier {
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

-- 
Kind regards,

Sakari Ailus
