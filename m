Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FBE6CFE2A
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 10:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbjC3IXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 04:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjC3IXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 04:23:37 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EACE19A6
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680164614; x=1711700614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kS5kdOycLsTtdaPyTXDDmbbOXprn0uFPVCwrFePjBv0=;
  b=D9EuutLJQLWiLCyDaSjGf0clWJPaFop7tN7RFGJjB8tIiyJHKtbDs9nB
   9kErfg6p6tlRxfMAlDE81Ao3qVlAmoRqNRUnB/Rfx557keOEBrDenvb37
   nFfmWFRl0SDFA4ZvgHXIAh0aTuc1xrog0gQMoCC/qD5F7vMmZHlgczacl
   ZTcnYyPGJcsCK8bbpA77PTrlAk0GvERlU6/rzVBCehZNVD5CkeIJzBCuF
   T5OjZrwI/7DTGUJ4tMz2KwSJtnnuCQk8jV0YG9/GkjYOeiW/DjHqLjDib
   yEFR1ZenbuSSiIfhr3pDJnb+D4nSmoV9LGrlfa8u0GHhxmH/eNsUGdk4l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343554269"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343554269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="749099222"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="749099222"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:23:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B58D711FAD0;
        Thu, 30 Mar 2023 11:23:28 +0300 (EEST)
Date:   Thu, 30 Mar 2023 11:23:28 +0300
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
Subject: Re: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZCVHABQCqBxjcLpG@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
 <ZCP7an1Kclm95hnL@kekkonen.localdomain>
 <DM6PR11MB431638656606F40EB8B1DC468D8E9@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB431638656606F40EB8B1DC468D8E9@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Thu, Mar 30, 2023 at 03:58:10AM +0000, Wu, Wentong wrote:
> Hi Sakari,
> 
> Thanks
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Wednesday, March 29, 2023 4:49 PM
> > 
> > Hi Wentong,
> > 
> > On Mon, Mar 27, 2023 at 02:23:06PM +0800, Wentong Wu wrote:
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
> > > turned on, host Image Processing Unit(IPU) driver is informed via v4l2
> > > control callback, so that user can be notified.
> > >
> > > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > > ---
> > >  drivers/media/pci/Kconfig                 |   1 +
> > >  drivers/media/pci/intel/Makefile          |   2 +
> > >  drivers/media/pci/intel/ivsc/Kconfig      |  12 +
> > >  drivers/media/pci/intel/ivsc/Makefile     |   7 +
> > >  drivers/media/pci/intel/ivsc/csi_bridge.c | 332 +++++++++++++
> > > drivers/media/pci/intel/ivsc/csi_bridge.h | 122 +++++
> > >  drivers/media/pci/intel/ivsc/mei_csi.c    | 775
> > ++++++++++++++++++++++++++++++
> > >  7 files changed, 1251 insertions(+)
> > >  create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
> > >  create mode 100644 drivers/media/pci/intel/ivsc/Makefile
> > >  create mode 100644 drivers/media/pci/intel/ivsc/csi_bridge.c
> > >  create mode 100644 drivers/media/pci/intel/ivsc/csi_bridge.h
> > >  create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
> > 
> > I'm commenting just mei_csi this time...
> > 
> > > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > > new file mode 100644
> > > index 0000000..6a01537
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > > @@ -0,0 +1,775 @@
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
> > > +int csi_bridge_init(struct mei_cl_device *csi_dev);
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
> > 
> > In some cases you're using memset and in others not. If you don't need memset,
> > I'd prefer assigning the fields in variable declaration instead.
> 
> The declaration will be like below, but it will break reverse x-mas tree style.

Have I asked to change your e-mail client settings?

> 
> struct csi_cmd cmd = { 0 };
> size_t cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
> int ret;

It's not a problem if you have a dependency.

> 
> 
> > 
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
> > Ditto.
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
> > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +	struct v4l2_ctrl *ctrl;
> > > +	int ret = 0;
> > > +
> > > +	if (!csi->remote)
> > > +		return -ENODEV;
> > > +
> > > +	ret = v4l2_subdev_call(csi->remote, pad, get_mbus_config,
> > > +			       csi->remote_pad, &mbus_config);
> > > +	if (ret)
> > > +		return ret;
> > 
> > You're already parsing the endpoint in probe(). Do you need this, assuming the
> > sensor has a static lane configuration? Virtually all do.
> 
> When parsing remote endpoint, just get num_data_lanes by
> v4l2_fwnode_endpoint_alloc_parse?

Yes.

> 
> > 
> > Could this all be done via the s_stream() op instead?
> 
> We don't need csi2 link freq and lane number when s_steam(0)

You can set the VOLATILE flag on the control and then query the upstream
sub-device in the g_ctrl callback.

> 
> > 
> > > +
> > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY)
> > > +		return -EINVAL;
> > > +
> > > +	csi->nr_of_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > > +
> > > +	ctrl = v4l2_ctrl_find(csi->remote->ctrl_handler, V4L2_CID_LINK_FREQ);
> > > +	if (!ctrl)
> > > +		return -EINVAL;
> > > +	qm.index = v4l2_ctrl_g_ctrl(ctrl);
> > > +
> > > +	ret = v4l2_querymenu(csi->remote->ctrl_handler, &qm);
> > > +	if (ret)
> > > +		return ret;
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
> > > +		if (ret < 0)
> > > +			goto err;
> > 
> > I'd complain (e.g. dev_warn()) but return zero in this case. There's not much if
> > anything the caller can do with this.
> 
> ack
> > 
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
> > 
> > It'd be nice to have also enum_mbus_code support. Video mux of course didn't
> > have this either. Something that could be done in the framework, including
> > validating the mbus format.
> 
> Sorry, you mean the default MEDIA_BUS_FMT_Y8_1X8?

Any format that can be supported by the device.

The video mux should have that, too. I'll see if this would fit to the
framework neatly somehow.

> 
> > 
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
> > 
> > The control should be made volatile here (flags |=

Read-only, I meant. Volatile is for controls that are not driven by
hardware events somehow.

> > V4L2_CTRL_FLAG_READ_ONLY) as it can't be changed by the user.
> 
> ack
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
> > > +	fwnode_handle_put(fwnode);
> > > +	if (IS_ERR(asd))
> > > +		return PTR_ERR(asd);
> > > +
> > > +	ret = v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
> > > +	if (ret)
> > > +		v4l2_async_nf_cleanup(&csi->notifier);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int mei_csi_probe(struct mei_cl_device *cldev,
> > > +			 const struct mei_cl_device_id *id) {
> > > +	struct mei_csi *csi;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * no connections to sensor are defined in firmware, try to
> > > +	 * build connections as software_nodes parsed from SSDB.
> > > +	 */
> > > +	ret = csi_bridge_init(cldev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	csi = devm_kzalloc(&cldev->dev, sizeof(struct mei_csi), GFP_KERNEL);
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
> > > +		dev_err(&cldev->dev, "mei_cldev_enable failed: %d\n", ret);
> > > +		goto destroy_mutex;
> > > +	}
> > > +
> > > +	ret = mei_cldev_register_rx_cb(cldev, mei_csi_rx);
> > > +	if (ret) {
> > > +		dev_err(&cldev->dev, "event cb registration failed: %d\n", ret);
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
> > > +	csi->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > > +	csi->subdev.entity.ops = &mei_csi_entity_ops;
> > > +
> > > +	ret = mei_csi_init_control(csi);
> > > +	if (ret)
> > > +		goto err_async;
> > 
> > You'll also need to call v4l2_ctrl_handler_free() if setting up the handler failed.
> > I.e. just change the label here and remove err_async label below.
> Thanks
> > 
> > > +
> > > +	csi->format_mbus[CSI_PAD_SOURCE] = mei_csi_format_mbus_default;
> > > +	csi->format_mbus[CSI_PAD_SINK] = mei_csi_format_mbus_default;
> > > +
> > > +	csi->pads[CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> > > +	csi->pads[CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> > > +	ret = media_entity_pads_init(&csi->subdev.entity, CSI_NUM_PADS,
> > > +				     csi->pads);
> > > +	if (ret)
> > > +		goto err_ctrl_handler;
> > > +
> > > +	ret = v4l2_subdev_init_finalize(&csi->subdev);
> > > +	if (ret < 0)
> > > +		goto err_entity;
> > > +
> > > +	ret = v4l2_async_register_subdev(&csi->subdev);
> > > +	if (ret < 0)
> > > +		goto err_subdev;
> > > +
> > > +	pm_runtime_enable(&cldev->dev);
> > > +
> > > +	return 0;
> > > +
> > > +err_subdev:
> > > +	v4l2_subdev_cleanup(&csi->subdev);
> > > +err_entity:
> > > +	media_entity_cleanup(&csi->subdev.entity);
> > > +err_ctrl_handler:
> > > +	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > > +err_async:
> > > +	v4l2_async_nf_unregister(&csi->notifier);
> > > +	v4l2_async_nf_cleanup(&csi->notifier);
> > > +err_disable:
> > > +	mei_cldev_disable(cldev);
> > 
> > It'd be nice to have an additional newline before the label. Elsewhere, too.
> ack
> > 
> > > +destroy_mutex:
> > > +	mutex_destroy(&csi->lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void mei_csi_remove(struct mei_cl_device *cldev) {
> > > +	struct mei_csi *csi = mei_cldev_get_drvdata(cldev);
> > > +
> > > +	v4l2_async_nf_unregister(&csi->notifier);
> > > +	v4l2_async_nf_cleanup(&csi->notifier);
> > > +	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > > +	v4l2_async_unregister_subdev(&csi->subdev);
> > > +	v4l2_subdev_cleanup(&csi->subdev);
> > > +	media_entity_cleanup(&csi->subdev.entity);
> > > +
> > > +	pm_runtime_disable(&cldev->dev);
> > > +
> > > +	mutex_destroy(&csi->lock);
> > > +}
> > > +
> > > +#define MEI_CSI_UUID UUID_LE(0x92335FCF, 0x3203, 0x4472, \
> > > +			     0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
> > > +
> > > +static const struct mei_cl_device_id mei_csi_tbl[] = {
> > > +	{ MEI_CSI_DRIVER_NAME, MEI_CSI_UUID, MEI_CL_VERSION_ANY },
> > > +
> > 
> > Extra newline.
> > 
> > > +	/* required last entry */
> > 
> > The comment could be on the same line below. E.g. "Sentinel" is appropriate, as
> > this isn't just any last entry.
> thanks
> > 
> > > +	{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(mei, mei_csi_tbl);
> > > +
> > > +static struct mei_cl_driver mei_csi_driver = {
> > > +	.id_table = mei_csi_tbl,
> > > +	.name = MEI_CSI_DRIVER_NAME,
> > > +
> > > +	.probe = mei_csi_probe,
> > > +	.remove = mei_csi_remove,
> > > +};
> > > +
> > > +module_mei_cl_driver(mei_csi_driver);
> > > +
> > > +MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > > +MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
> > > +MODULE_DESCRIPTION("Device driver for IVSC CSI");
> > > +MODULE_LICENSE("GPL");
> > 

-- 
Kind regards,

Sakari Ailus
