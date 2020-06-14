Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033A01F8746
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 08:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgFNGfP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 02:35:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:51264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNGfP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 02:35:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0BD12068E;
        Sun, 14 Jun 2020 06:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592116514;
        bh=KzlISDgeRkUj+FzZjCFmCjOm3ZPbmZPai75i047RsCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uD6U20JSZJ99PvNurhBdMyDB0QLYVVxlItfch//Gk8jjZYTPtGKRMaLDte06u2uQL
         N+dwSYQrnBnbyGcAC4YvOmFmRvl3cdsvVFQx9dIFh6IH2kwPIeN7QYypePhkIwm9KW
         A+OmgTfDOP4n28tn11uSsSTBHiOY1qF6e50uh1dI=
Date:   Sun, 14 Jun 2020 08:35:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/3] venus: Add debugfs interface to set firmware log
 level
Message-ID: <20200614063511.GA2611869@kroah.com>
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
 <20200613223919.7038-2-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200613223919.7038-2-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 14, 2020 at 01:39:17AM +0300, Stanimir Varbanov wrote:
> This will be useful when debugging specific issues related to
> firmware HFI interface.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

You didn't cc: any of us on the patchs, like you did on 0/3 :(


> ---
>  drivers/media/platform/qcom/venus/Makefile    |  2 +-
>  drivers/media/platform/qcom/venus/core.c      |  3 +++
>  drivers/media/platform/qcom/venus/core.h      |  3 +++
>  drivers/media/platform/qcom/venus/dbgfs.c     | 21 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/dbgfs.h     | 12 +++++++++++
>  drivers/media/platform/qcom/venus/hfi_venus.c |  7 ++++++-
>  6 files changed, 46 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
>  create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h
> 
> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> index 64af0bc1edae..dfc636865709 100644
> --- a/drivers/media/platform/qcom/venus/Makefile
> +++ b/drivers/media/platform/qcom/venus/Makefile
> @@ -3,7 +3,7 @@
>  
>  venus-core-objs += core.o helpers.o firmware.o \
>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
> -		   hfi_parser.o pm_helpers.o
> +		   hfi_parser.o pm_helpers.o dbgfs.o
>  
>  venus-dec-objs += vdec.o vdec_ctrls.o
>  venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..249141e27fea 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -290,6 +290,8 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_dev_unregister;
>  
> +	venus_dbgfs_init(core);
> +
>  	return 0;
>  
>  err_dev_unregister:
> @@ -337,6 +339,7 @@ static int venus_remove(struct platform_device *pdev)
>  	v4l2_device_unregister(&core->v4l2_dev);
>  	mutex_destroy(&core->pm_lock);
>  	mutex_destroy(&core->lock);
> +	venus_dbgfs_deinit(core);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7118612673c9..b48782f9aa95 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -12,6 +12,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  
> +#include "dbgfs.h"
>  #include "hfi.h"
>  
>  #define VIDC_CLKS_NUM_MAX		4
> @@ -136,6 +137,7 @@ struct venus_caps {
>   * @priv:	a private filed for HFI operations
>   * @ops:		the core HFI operations
>   * @work:	a delayed work for handling system fatal error
> + * @root:	debugfs root directory
>   */
>  struct venus_core {
>  	void __iomem *base;
> @@ -185,6 +187,7 @@ struct venus_core {
>  	unsigned int codecs_count;
>  	unsigned int core0_usage_count;
>  	unsigned int core1_usage_count;
> +	struct dentry *root;
>  };
>  
>  struct vdec_controls {
> diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
> new file mode 100644
> index 000000000000..782d54ac1b8f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/venus/dbgfs.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Linaro Ltd.
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include "core.h"
> +
> +extern int venus_fw_debug;
> +
> +void venus_dbgfs_init(struct venus_core *core)
> +{
> +	core->root = debugfs_create_dir("venus", NULL);
> +	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
> +}
> +
> +void venus_dbgfs_deinit(struct venus_core *core)
> +{
> +	debugfs_remove_recursive(core->root);
> +}
> diff --git a/drivers/media/platform/qcom/venus/dbgfs.h b/drivers/media/platform/qcom/venus/dbgfs.h
> new file mode 100644
> index 000000000000..b7b621a8472f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/venus/dbgfs.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2020 Linaro Ltd. */
> +
> +#ifndef __VENUS_DBGFS_H__
> +#define __VENUS_DBGFS_H__
> +
> +struct venus_core;
> +
> +void venus_dbgfs_init(struct venus_core *core);
> +void venus_dbgfs_deinit(struct venus_core *core);
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 0d8855014ab3..3a04b08ab85a 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -130,7 +130,7 @@ struct venus_hfi_device {
>  };
>  
>  static bool venus_pkt_debug;
> -static int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
> +int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
>  static bool venus_sys_idle_indicator;
>  static bool venus_fw_low_power_mode = true;
>  static int venus_hw_rsp_timeout = 1000;
> @@ -1130,9 +1130,14 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
>  			      u32 codec)
>  {
>  	struct venus_hfi_device *hdev = to_hfi_priv(inst->core);
> +	struct device *dev = hdev->core->dev;
>  	struct hfi_session_init_pkt pkt;
>  	int ret;
>  
> +	ret = venus_sys_set_debug(hdev, venus_fw_debug);
> +	if (ret)
> +		dev_warn(dev, "setting fw debug msg ON failed (%d)\n", ret);

Why do you care about this to tell the user about it?

thanks,

greg k-h
