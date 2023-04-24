Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652316EC69E
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 08:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjDXG5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 02:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjDXG44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 02:56:56 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE444E41
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682319408; x=1713855408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QrseYilDPePFWy5KFQS5MstrUg9PnAoh15jKXflXf24=;
  b=eyD1CwuAAQYqQY+0mhWv4D98WNHPY5dRbfIa2wVi4XzaH3L+TDPRUd81
   hqfKiCZEwqmYqK4oDc7mH1jaY1EoikJPfR8iuoL1SOMDw+9M5b1bb6NLs
   IgI1a2k8h1xdhH6krp20UuPn3Y91a5OYDDoa59xTxoJIN/Ogyysgdfq7i
   lgv9gceuOofbIiYpSrZIOxYYMO9VR/BtWIWwdCt8YRkRxlgn++9WNUNst
   75/uRwc5B3mNeHtGLg2SgRqnRmHefOgzUFPjg5ZOV6OYOAsVCI8aZLFp3
   hmQ/kuB+IkwsPZU5FB9QADoNGSb7srAwNxAz2VexUUgAlvlmOoSPdStVt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="346402329"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="346402329"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 23:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817146150"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="817146150"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 23:56:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 88228121435;
        Mon, 24 Apr 2023 09:56:42 +0300 (EEST)
Date:   Mon, 24 Apr 2023 09:56:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZEYoKq4yaj0B//0u@kekkonen.localdomain>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
 <ZEVj2Je9sNKDcBXn@kekkonen.localdomain>
 <DM6PR11MB4316D6790B4795647537A2E08D679@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316D6790B4795647537A2E08D679@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Mon, Apr 24, 2023 at 01:38:42AM +0000, Wu, Wentong wrote:
> Hi Sakari,
> 
> Thanks for your review
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Monday, April 24, 2023 12:59 AM
> > To: Wu, Wentong <wentong.wu@intel.com>
> > 
> > Hi Wentong,
> > 
> > Thank you for the update.
> > 
> > On Mon, Apr 10, 2023 at 11:14:23AM +0800, Wentong Wu wrote:
> > > CSI is a submodule of IVSC which can route camera sensor data to the
> > > outbound MIPI CSI-2 interface.
> > >
> > > The interface communicating with firmware is via MEI. There is a
> > > separate MEI UUID, which this driver uses to enumerate.
> > >
> > > To route camera sensor data to host, the information of link frequency
> > > and number of data lanes is sent to firmware by sending MEI command
> > > when starting stream.
> > >
> > > CSI also provides a privacy mode. When privacy mode is turned on,
> > > camera sensor can't be used. This means that both IVSC and host Image
> > > Processing Unit(IPU) can't get image data. And when this mode is
> > > turned on, user is notified via v4l2 control callback.
> > >
> > > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > > ---
> > >  drivers/media/pci/Kconfig              |   1 +
> > >  drivers/media/pci/intel/Makefile       |   2 +
> > >  drivers/media/pci/intel/ivsc/Kconfig   |  12 +
> > >  drivers/media/pci/intel/ivsc/Makefile  |   6 +
> > >  drivers/media/pci/intel/ivsc/mei_csi.c | 772
> > > +++++++++++++++++++++++++++++++++
> > >  5 files changed, 793 insertions(+)
> > >  create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
> > >  create mode 100644 drivers/media/pci/intel/ivsc/Makefile
> > >  create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
> > >
> > > diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> > > index dff0b45..c157f7c 100644
> > > --- a/drivers/media/pci/Kconfig
> > > +++ b/drivers/media/pci/Kconfig
> > > @@ -72,6 +72,7 @@ config VIDEO_PCI_SKELETON
> > >  	  when developing new drivers.
> > >
> > >  source "drivers/media/pci/intel/ipu3/Kconfig"
> > > +source "drivers/media/pci/intel/ivsc/Kconfig"
> > >
> > >  endif #MEDIA_PCI_SUPPORT
> > >  endif #PCI
> > > diff --git a/drivers/media/pci/intel/Makefile
> > > b/drivers/media/pci/intel/Makefile
> > > index 0b4236c..d27ca63 100644
> > > --- a/drivers/media/pci/intel/Makefile
> > > +++ b/drivers/media/pci/intel/Makefile
> > > @@ -4,3 +4,5 @@
> > >  #
> > >
> > >  obj-y	+= ipu3/
> > > +
> > > +obj-$(CONFIG_INTEL_VSC) += ivsc/
> > > diff --git a/drivers/media/pci/intel/ivsc/Kconfig
> > > b/drivers/media/pci/intel/ivsc/Kconfig
> > > new file mode 100644
> > > index 0000000..9535ac1
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/Kconfig
> > > @@ -0,0 +1,12 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only # Copyright (C) 2023, Intel
> > > +Corporation. All rights reserved.
> > > +
> > > +config INTEL_VSC
> > > +	tristate "Intel Visual Sensing Controller"
> > > +	depends on INTEL_MEI
> > > +	help
> > > +	  This adds support for Intel Visual Sensing Controller (IVSC).
> > > +
> > > +	  Enables the IVSC firmware services required for controlling
> > > +	  camera sensor ownership and CSI-2 link through Image Processing
> > > +	  Unit(IPU) driver of Intel.
> > > diff --git a/drivers/media/pci/intel/ivsc/Makefile
> > > b/drivers/media/pci/intel/ivsc/Makefile
> > > new file mode 100644
> > > index 0000000..cbd194a
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/Makefile
> > > @@ -0,0 +1,6 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only # # Copyright (C) 2023, Intel
> > > +Corporation. All rights reserved.
> > > +
> > > +obj-$(CONFIG_INTEL_VSC) += ivsc-csi.o ivsc-csi-y += mei_csi.o
> > > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > > new file mode 100644
> > > index 0000000..a0b06a3
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > > @@ -0,0 +1,772 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2023 Intel Corporation. All rights reserved.
> > > + * Intel Visual Sensing Controller CSI Linux driver  */
> > > +
> > > +/*
> > > + * To set ownership of CSI-2 link and to configure CSI-2 link, there
> > > + * are specific commands, which are sent via MEI protocol. The send
> > > + * command function uses "completion" as a synchronization mechanism.
> > > + * The response for command is received via a mei callback which
> > > +wakes
> > > + * up the caller. There can be only one outstanding command at a time.
> > > + */
> > > +
> > > +#include <linux/completion.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/math64.h>
> > > +#include <linux/mei_cl_bus.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/units.h>
> > > +#include <linux/uuid.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +#include <media/v4l2-async.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +#define MEI_CSI_DRIVER_NAME "ivsc_csi"
> > > +
> > > +/* the 5s used here is based on experiment */ #define CSI_CMD_TIMEOUT
> > > +(5 * HZ)
> > > +/* to setup CSI-2 link an extra delay needed and determined
> > > +experimentally */ #define CSI_FW_READY_DELAY_MS 100
> > > +/* link frequency unit is 100kHz */
> > > +#define CSI_LINK_FREQ(x) ((u32)(div_u64(x, 100 * HZ_PER_KHZ)))
> > > +
> > > +/*
> > > + * identify the command id supported by firmware
> > > + * IPC, as well as the privacy notification id
> > > + * used when processing privacy event.
> > > + */
> > > +enum csi_cmd_id {
> > > +	/* used to set csi ownership */
> > > +	CSI_SET_OWNER = 0,
> > > +
> > > +	/* used to configure CSI-2 link */
> > > +	CSI_SET_CONF = 2,
> > > +
> > > +	/* privacy notification id used when privacy state changes */
> > > +	CSI_PRIVACY_NOTIF = 6,
> > > +};
> > > +
> > > +/* CSI-2 link ownership definition */ enum csi_link_owner {
> > > +	CSI_LINK_IVSC,
> > > +	CSI_LINK_HOST,
> > > +};
> > > +
> > > +/* privacy status definition */
> > > +enum ivsc_privacy_status {
> > > +	CSI_PRIVACY_OFF,
> > > +	CSI_PRIVACY_ON,
> > > +	CSI_PRIVACY_MAX,
> > > +};
> > > +
> > > +enum csi_pads {
> > > +	CSI_PAD_SOURCE,
> > > +	CSI_PAD_SINK,
> > > +	CSI_NUM_PADS
> > > +};
> > > +
> > > +/* configuration of the CSI-2 link between host and IVSC */ struct
> > > +csi_link_cfg {
> > > +	/* number of data lanes used on the CSI-2 link */
> > > +	u32 nr_of_lanes;
> > > +
> > > +	/* frequency of the CSI-2 link */
> > > +	u32 link_freq;
> > > +
> > > +	/* for future use */
> > > +	u32 rsvd[2];
> > > +} __packed;
> > > +
> > > +/* CSI command structure */
> > > +struct csi_cmd {
> > > +	u32 cmd_id;
> > > +	union _cmd_param {
> > > +		u32 param;
> > > +		struct csi_link_cfg conf;
> > > +	} param;
> > > +} __packed;
> > > +
> > > +/* CSI notification structure */
> > > +struct csi_notif {
> > > +	u32 cmd_id;
> > > +	int status;
> > > +	union _resp_cont {
> > > +		u32 cont;
> > > +		struct csi_link_cfg conf;
> > > +	} cont;
> > > +} __packed;
> > > +
> > > +struct mei_csi {
> > > +	struct mei_cl_device *cldev;
> > > +
> > > +	/* command response */
> > > +	struct csi_notif cmd_response;
> > > +	/* used to wait for command response from firmware */
> > > +	struct completion cmd_completion;
> > > +	/* protect command download */
> > > +	struct mutex lock;
> > > +
> > > +	struct v4l2_subdev subdev;
> > > +	struct v4l2_subdev *remote;
> > > +	struct v4l2_async_notifier notifier;
> > > +	struct v4l2_ctrl_handler ctrl_handler;
> > > +	struct v4l2_ctrl *privacy_ctrl;
> > > +	unsigned int remote_pad;
> > > +	/* start streaming or not */
> > > +	int streaming;
> > > +
> > > +	struct media_pad pads[CSI_NUM_PADS];
> > > +	struct v4l2_mbus_framefmt format_mbus[CSI_NUM_PADS];
> > > +
> > > +	/* number of data lanes used on the CSI-2 link */
> > > +	u32 nr_of_lanes;
> > > +	/* frequency of the CSI-2 link */
> > > +	u64 link_freq;
> > > +
> > > +	/* privacy status */
> > > +	enum ivsc_privacy_status status;
> > > +};
> > > +
> > > +static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
> > > +	.width = 1,
> > > +	.height = 1,
> > > +	.code = MEDIA_BUS_FMT_Y8_1X8,
> > > +	.field = V4L2_FIELD_NONE,
> > > +};
> > > +
> > > +static inline struct mei_csi *notifier_to_csi(struct
> > > +v4l2_async_notifier *n) {
> > > +	return container_of(n, struct mei_csi, notifier); }
> > > +
> > > +static inline struct mei_csi *sd_to_csi(struct v4l2_subdev *sd) {
> > > +	return container_of(sd, struct mei_csi, subdev); }
> > > +
> > > +/* send a command to firmware and mutex must be held by caller */
> > > +static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len) {
> > > +	struct csi_cmd *cmd = (struct csi_cmd *)buf;
> > > +	int ret;
> > > +
> > > +	reinit_completion(&csi->cmd_completion);
> > > +
> > > +	ret = mei_cldev_send(csi->cldev, buf, len);
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	ret = wait_for_completion_killable_timeout(&csi->cmd_completion,
> > > +						   CSI_CMD_TIMEOUT);
> > > +	if (ret < 0) {
> > > +		goto out;
> > > +	} else if (!ret) {
> > > +		ret = -ETIMEDOUT;
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* command response status */
> > > +	ret = csi->cmd_response.status;
> > > +	if (ret) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (csi->cmd_response.cmd_id != cmd->cmd_id)
> > > +		ret = -EINVAL;
> > > +
> > > +out:
> > > +	return ret;
> > > +}
> > > +
> > > +/* set CSI-2 link ownership */
> > > +static int csi_set_link_owner(struct mei_csi *csi, enum
> > > +csi_link_owner owner) {
> > > +	struct csi_cmd cmd = { 0 };
> > > +	size_t cmd_size;
> > > +	int ret;
> > > +
> > > +	cmd.cmd_id = CSI_SET_OWNER;
> > > +	cmd.param.param = owner;
> > > +	cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
> > > +
> > > +	mutex_lock(&csi->lock);
> > > +
> > > +	ret = mei_csi_send(csi, (u8 *)&cmd, cmd_size);
> > > +
> > > +	mutex_unlock(&csi->lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/* configure CSI-2 link between host and IVSC */ static int
> > > +csi_set_link_cfg(struct mei_csi *csi) {
> > > +	struct csi_cmd cmd = { 0 };
> > > +	size_t cmd_size;
> > > +	int ret;
> > > +
> > > +	cmd.cmd_id = CSI_SET_CONF;
> > > +	cmd.param.conf.nr_of_lanes = csi->nr_of_lanes;
> > > +	cmd.param.conf.link_freq = CSI_LINK_FREQ(csi->link_freq);
> > > +	cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
> > 
> > Could you initialise this in variable declaration as I requested earlier?
> > The same for other similar cases.
> 
> I believe we have discussed this on v3 patch set as below:
> 
> 	> > > In some cases you're using memset and in others not. If you don't need memset,
> 	> > > I'd prefer assigning the fields in variable declaration instead.
> 	> > 
> 	> > The declaration will be like below, but it will break reverse x-mas tree style.
> 	> > 
> 	> > struct csi_cmd cmd = { 0 };
> 	> > size_t cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
> 	> > int ret;
> 
> 	> It's not a problem if you have a dependency.

Yes, I meant the non-Christmas tree (reverse or not) ordering is not an
issue. Dependencies of course are of higher priority.

> 
> > 
> > > +
> > > +	mutex_lock(&csi->lock);
> > > +
> > > +	ret = mei_csi_send(csi, (u8 *)&cmd, cmd_size);
> > > +	/*
> > > +	 * wait configuration ready if download success. placing
> > > +	 * delay under mutex is to make sure current command flow
> > > +	 * completed before starting a possible new one.
> > > +	 */
> > > +	if (!ret)
> > > +		msleep(CSI_FW_READY_DELAY_MS);
> > > +
> > > +	mutex_unlock(&csi->lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/* callback for receive */
> > > +static void mei_csi_rx(struct mei_cl_device *cldev) {
> > > +	struct mei_csi *csi = mei_cldev_get_drvdata(cldev);
> > > +	struct csi_notif notif = { 0 };
> > > +	int ret;
> > > +
> > > +	ret = mei_cldev_recv(cldev, (u8 *)&notif, sizeof(notif));
> > > +	if (ret < 0) {
> > > +		dev_err(&cldev->dev, "recv error: %d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	switch (notif.cmd_id) {
> > > +	case CSI_PRIVACY_NOTIF:
> > > +		if (notif.cont.cont < CSI_PRIVACY_MAX) {
> > > +			csi->status = notif.cont.cont;
> > > +			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, csi->status);
> > > +		}
> > > +		break;
> > > +	case CSI_SET_OWNER:
> > > +	case CSI_SET_CONF:
> > > +		memcpy(&csi->cmd_response, &notif, ret);
> > > +
> > > +		complete(&csi->cmd_completion);
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static int mei_csi_pre_streamon(struct v4l2_subdev *sd, u32 flags) {
> > > +	struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ, };
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +	struct v4l2_ctrl *ctrl;
> > > +	int ret = 0;
> > 
> > No need to initialise this, it is always set.
> 
> ack, thanks
> 
> > 
> > > +
> > > +	if (!csi->remote)
> > > +		return -ENODEV;
> > > +
> > > +	ctrl = v4l2_ctrl_find(csi->remote->ctrl_handler, V4L2_CID_LINK_FREQ);
> > > +	if (!ctrl)
> > > +		return -EINVAL;
> > > +	qm.index = v4l2_ctrl_g_ctrl(ctrl);
> > > +
> > > +	ret = v4l2_querymenu(csi->remote->ctrl_handler, &qm);
> > > +	if (ret)
> > > +		return ret;
> > 
> > Please use v4l2_get_link_freq() as already discussed.
> 
> ack, thanks,
> 
> > 
> > Didn't we also discuss that you could do this in the s_stream() callback?
> 
> We don't need configure CSI2 link if call s_stream with enable = 0,
> 
> But I'm ok to get this in s_stream, thanks

Yes, you should only query this if streaming is being enabled.

> 
> > 
> > > +
> > > +	csi->link_freq = qm.value;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable) {
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +	int ret = 0;
> > > +
> > > +	if (enable && csi->streaming == 0) {
> > > +		/* switch CSI-2 link to host */
> > > +		ret = csi_set_link_owner(csi, CSI_LINK_HOST);
> > > +		if (ret < 0)
> > > +			goto err;
> > > +
> > > +		/* configure CSI-2 link */
> > > +		ret = csi_set_link_cfg(csi);
> > > +		if (ret < 0)
> > > +			goto err;
> > > +
> > > +		ret = v4l2_subdev_call(csi->remote, video, s_stream, 1);
> > > +		if (ret)
> > > +			goto err;
> > > +	} else if (!enable && csi->streaming == 1) {
> > > +		v4l2_subdev_call(csi->remote, video, s_stream, 0);
> > > +
> > > +		/* switch CSI-2 link to IVSC */
> > > +		ret = csi_set_link_owner(csi, CSI_LINK_IVSC);
> > > +		if (ret < 0) {
> > > +			dev_warn(&csi->cldev->dev,
> > > +				 "failed to switch CSI2 link: %d\n", ret);
> > > +			ret = 0;
> > > +		}
> > > +	}
> > > +
> > > +	csi->streaming = enable;
> > > +
> > > +err:
> > > +	return ret;
> > > +}
> > > +
> > > +static struct v4l2_mbus_framefmt *
> > > +mei_csi_get_pad_format(struct v4l2_subdev *sd,
> > > +		       struct v4l2_subdev_state *sd_state,
> > > +		       unsigned int pad, u32 which) {
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +
> > > +	switch (which) {
> > > +	case V4L2_SUBDEV_FORMAT_TRY:
> > > +		return v4l2_subdev_get_try_format(sd, sd_state, pad);
> > > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > > +		return &csi->format_mbus[pad];
> > > +	default:
> > > +		return NULL;
> > > +	}
> > > +}
> > > +
> > > +static int mei_csi_init_cfg(struct v4l2_subdev *sd,
> > > +			    struct v4l2_subdev_state *sd_state) {
> > > +	struct v4l2_mbus_framefmt *mbusformat;
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +	unsigned int i;
> > > +
> > > +	mutex_lock(&csi->lock);
> > > +
> > > +	for (i = 0; i < sd->entity.num_pads; i++) {
> > > +		mbusformat = v4l2_subdev_get_try_format(sd, sd_state, i);
> > > +		*mbusformat = mei_csi_format_mbus_default;
> > > +	}
> > > +
> > > +	mutex_unlock(&csi->lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mei_csi_get_fmt(struct v4l2_subdev *sd,
> > > +			   struct v4l2_subdev_state *sd_state,
> > > +			   struct v4l2_subdev_format *format) {
> > > +	struct v4l2_mbus_framefmt *mbusformat;
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +
> > > +	mutex_lock(&csi->lock);
> > > +
> > > +	mbusformat = mei_csi_get_pad_format(sd, sd_state, format->pad,
> > > +					    format->which);
> > > +	if (mbusformat)
> > > +		format->format = *mbusformat;
> > > +
> > > +	mutex_unlock(&csi->lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mei_csi_set_fmt(struct v4l2_subdev *sd,
> > > +			   struct v4l2_subdev_state *sd_state,
> > > +			   struct v4l2_subdev_format *format) {
> > > +	struct v4l2_mbus_framefmt *source_mbusformat;
> > > +	struct v4l2_mbus_framefmt *mbusformat;
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +	struct media_pad *pad;
> > > +
> > > +	mbusformat = mei_csi_get_pad_format(sd, sd_state, format->pad,
> > > +					    format->which);
> > > +	if (!mbusformat)
> > > +		return -EINVAL;
> > > +
> > > +	source_mbusformat = mei_csi_get_pad_format(sd, sd_state,
> > > +						   CSI_PAD_SOURCE,
> > 
> > Fits on previous line.
> 
> ack, thanks
> 
> > 
> > > +						   format->which);
> > > +	if (!source_mbusformat)
> > > +		return -EINVAL;
> > > +
> > > +	v4l_bound_align_image(&format->format.width, 1, 65536, 0,
> > > +			      &format->format.height, 1, 65536, 0, 0);
> > > +
> > > +	switch (format->format.code) {
> > > +	case MEDIA_BUS_FMT_RGB444_1X12:
> > > +	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
> > > +	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
> > > +	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
> > > +	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
> > > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > > +	case MEDIA_BUS_FMT_BGR565_2X8_BE:
> > > +	case MEDIA_BUS_FMT_BGR565_2X8_LE:
> > > +	case MEDIA_BUS_FMT_RGB565_2X8_BE:
> > > +	case MEDIA_BUS_FMT_RGB565_2X8_LE:
> > > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > > +	case MEDIA_BUS_FMT_RBG888_1X24:
> > > +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> > > +	case MEDIA_BUS_FMT_BGR888_1X24:
> > > +	case MEDIA_BUS_FMT_GBR888_1X24:
> > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > +	case MEDIA_BUS_FMT_RGB888_2X12_BE:
> > > +	case MEDIA_BUS_FMT_RGB888_2X12_LE:
> > > +	case MEDIA_BUS_FMT_ARGB8888_1X32:
> > > +	case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
> > > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > > +	case MEDIA_BUS_FMT_Y8_1X8:
> > > +	case MEDIA_BUS_FMT_UV8_1X8:
> > > +	case MEDIA_BUS_FMT_UYVY8_1_5X8:
> > > +	case MEDIA_BUS_FMT_VYUY8_1_5X8:
> > > +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> > > +	case MEDIA_BUS_FMT_YVYU8_1_5X8:
> > > +	case MEDIA_BUS_FMT_UYVY8_2X8:
> > > +	case MEDIA_BUS_FMT_VYUY8_2X8:
> > > +	case MEDIA_BUS_FMT_YUYV8_2X8:
> > > +	case MEDIA_BUS_FMT_YVYU8_2X8:
> > > +	case MEDIA_BUS_FMT_Y10_1X10:
> > > +	case MEDIA_BUS_FMT_UYVY10_2X10:
> > > +	case MEDIA_BUS_FMT_VYUY10_2X10:
> > > +	case MEDIA_BUS_FMT_YUYV10_2X10:
> > > +	case MEDIA_BUS_FMT_YVYU10_2X10:
> > > +	case MEDIA_BUS_FMT_Y12_1X12:
> > > +	case MEDIA_BUS_FMT_UYVY12_2X12:
> > > +	case MEDIA_BUS_FMT_VYUY12_2X12:
> > > +	case MEDIA_BUS_FMT_YUYV12_2X12:
> > > +	case MEDIA_BUS_FMT_YVYU12_2X12:
> > > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > > +	case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
> > > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > > +	case MEDIA_BUS_FMT_VUY8_1X24:
> > > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > > +	case MEDIA_BUS_FMT_AYUV8_1X32:
> > > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > > +	case MEDIA_BUS_FMT_JPEG_1X8:
> > > +	case MEDIA_BUS_FMT_AHSV8888_1X32:
> > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > > +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> > > +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> > > +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> > > +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > > +		break;
> > > +	default:
> > > +		format->format.code = MEDIA_BUS_FMT_Y8_1X8;
> > > +		break;
> > > +	}
> > 
> > A newline here would be nice.
> 
> ack, thanks
> 
> > 
> > > +	if (format->format.field == V4L2_FIELD_ANY)
> > > +		format->format.field = V4L2_FIELD_NONE;
> > > +
> > > +	mutex_lock(&csi->lock);
> > > +
> > > +	pad = &csi->pads[format->pad];
> > > +	if (pad->flags & MEDIA_PAD_FL_SOURCE)
> > > +		format->format = csi->format_mbus[CSI_PAD_SINK];
> > > +
> > > +	*mbusformat = format->format;
> > > +
> > > +	if (pad->flags & MEDIA_PAD_FL_SINK)
> > > +		*source_mbusformat = format->format;
> > > +
> > > +	mutex_unlock(&csi->lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
> > > +	.s_stream = mei_csi_set_stream,
> > > +	.pre_streamon = mei_csi_pre_streamon, };
> > > +
> > > +static const struct v4l2_subdev_pad_ops mei_csi_pad_ops = {
> > > +	.init_cfg = mei_csi_init_cfg,
> > > +	.get_fmt = mei_csi_get_fmt,
> > > +	.set_fmt = mei_csi_set_fmt,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_ops mei_csi_subdev_ops = {
> > > +	.video = &mei_csi_video_ops,
> > > +	.pad = &mei_csi_pad_ops,
> > > +};
> > > +
> > > +static const struct media_entity_operations mei_csi_entity_ops = {
> > > +	.link_validate = v4l2_subdev_link_validate, };
> > > +
> > > +static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
> > > +				struct v4l2_subdev *subdev,
> > > +				struct v4l2_async_subdev *asd)
> > > +{
> > > +	struct mei_csi *csi = notifier_to_csi(notifier);
> > > +	int pad;
> > > +
> > > +	pad = media_entity_get_fwnode_pad(&subdev->entity, asd-
> > >match.fwnode,
> > > +					  MEDIA_PAD_FL_SOURCE);
> > > +	if (pad < 0)
> > > +		return pad;
> > > +
> > > +	csi->remote = subdev;
> > > +	csi->remote_pad = pad;
> > > +
> > > +	return media_create_pad_link(&subdev->entity, pad,
> > > +				     &csi->subdev.entity, 0,
> > > +				     MEDIA_LNK_FL_ENABLED |
> > > +				     MEDIA_LNK_FL_IMMUTABLE);
> > > +}
> > > +
> > > +static void mei_csi_notify_unbind(struct v4l2_async_notifier *notifier,
> > > +				  struct v4l2_subdev *subdev,
> > > +				  struct v4l2_async_subdev *asd)
> > > +{
> > > +	struct mei_csi *csi = notifier_to_csi(notifier);
> > > +
> > > +	csi->remote = NULL;
> > > +}
> > > +
> > > +static const struct v4l2_async_notifier_operations mei_csi_notify_ops = {
> > > +	.bound = mei_csi_notify_bound,
> > > +	.unbind = mei_csi_notify_unbind,
> > > +};
> > > +
> > > +static int mei_csi_init_control(struct mei_csi *csi) {
> > > +	v4l2_ctrl_handler_init(&csi->ctrl_handler, 1);
> > > +	csi->ctrl_handler.lock = &csi->lock;
> > > +
> > > +	csi->privacy_ctrl = v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
> > > +					      V4L2_CID_PRIVACY, 0, 1, 1, 0);
> > > +	if (csi->ctrl_handler.error)
> > > +		return csi->ctrl_handler.error;
> > > +	csi->privacy_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > 
> > You should also add the LINK_FREQUENCY control. Make it U64 and and
> > VOLATILE, too. This way the driver's g_volatile_ctrl() gets called when the
> > control value is read.
> 
> ack, thanks
> 
> > 
> > > +
> > > +	csi->subdev.ctrl_handler = &csi->ctrl_handler;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mei_csi_parse_firmware(struct mei_csi *csi) {
> > > +	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > > +	};
> > > +	struct device *dev = &csi->cldev->dev;
> > > +	struct v4l2_async_subdev *asd;
> > > +	struct fwnode_handle *fwnode;
> > > +	struct fwnode_handle *ep;
> > > +	int ret;
> > > +
> > > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > +	if (!ep) {
> > > +		dev_err(dev, "not connected to subdevice\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> > > +	if (ret) {
> > > +		dev_err(dev, "could not parse v4l2 endpoint\n");
> > > +		fwnode_handle_put(ep);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > > +	fwnode_handle_put(ep);
> > > +
> > > +	v4l2_async_nf_init(&csi->notifier);
> > > +	csi->notifier.ops = &mei_csi_notify_ops;
> > > +
> > > +	asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
> > > +				       struct v4l2_async_subdev);
> > > +	if (IS_ERR(asd)) {
> > > +		fwnode_handle_put(fwnode);
> > > +		return PTR_ERR(asd);
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
> > 
> > It seems you're parsing the remote endpoint properties here. This shouldn't be
> > needed for any reason.
> 
> We need sensor's lane number to configure IVSC's CSI2
> 
> > 
> > > +	fwnode_handle_put(fwnode);
> > > +	if (ret)
> > > +		return ret;
> > > +	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
> > 
> > Instead the number of lanes comes from the local endpoint.
> 
> The lane number of IVSC follows sensor's lane number, why local endpoint?

Because you shouldn't access other devices' endpoint properties in drivers.
They are outside of the scope of the device's bindings.

> 
> > 
> > > +
> > > +	ret = v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
> > > +	if (ret)
> > > +		v4l2_async_nf_cleanup(&csi->notifier);
> > > +
> > > +	v4l2_fwnode_endpoint_free(&v4l2_ep);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int mei_csi_probe(struct mei_cl_device *cldev,
> > > +			 const struct mei_cl_device_id *id) {
> > > +	struct device *dev = &cldev->dev;
> > > +	struct mei_csi *csi;
> > > +	int ret;
> > > +
> > > +	if (!dev_fwnode(dev))
> > > +		return -EPROBE_DEFER;
> > > +
> > > +	csi = devm_kzalloc(dev, sizeof(struct mei_csi), GFP_KERNEL);
> > > +	if (!csi)
> > > +		return -ENOMEM;
> > > +
> > > +	csi->cldev = cldev;
> > > +	mutex_init(&csi->lock);
> > > +	init_completion(&csi->cmd_completion);
> > > +
> > > +	mei_cldev_set_drvdata(cldev, csi);
> > > +
> > > +	ret = mei_cldev_enable(cldev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "mei_cldev_enable failed: %d\n", ret);
> > > +		goto destroy_mutex;
> > > +	}
> > > +
> > > +	ret = mei_cldev_register_rx_cb(cldev, mei_csi_rx);
> > > +	if (ret) {
> > > +		dev_err(dev, "event cb registration failed: %d\n", ret);
> > > +		goto err_disable;
> > > +	}
> > > +
> > > +	ret = mei_csi_parse_firmware(csi);
> > > +	if (ret)
> > > +		goto err_disable;
> > > +
> > > +	csi->subdev.dev = &cldev->dev;
> > > +	v4l2_subdev_init(&csi->subdev, &mei_csi_subdev_ops);
> > > +	v4l2_set_subdevdata(&csi->subdev, csi);
> > > +	csi->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> > 
> > Please add V4L2_SUBDEV_FL_HAS_EVENTS for control events.
> 
> ack, thanks

-- 
Kind regards,

Sakari Ailus
