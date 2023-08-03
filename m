Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C34176F579
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 00:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjHCWIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 18:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjHCWIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 18:08:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136EFDF
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 15:08:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38E7F7F5;
        Fri,  4 Aug 2023 00:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691100449;
        bh=nt3scxIdscrp96ujG2ga3y5wsKHAlLPrhvhLFYeTObY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ix7m0J7CdmOx2TmvIMZnLvoA9LKGdLzJA9cU8jv5m83hqZta9CdOrHjpkCdDAeSxg
         DmdCgTv3rkVEGhYwrt1e0EsFk4o2VQbASeatbEcgJmtLq3X43CcXpp81wGLBHPcUPC
         kFwGhndujILwHs0PCz44Ex4HTEq6k5CkIQ3Jpk/I=
Date:   Fri, 4 Aug 2023 01:08:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wentong Wu <wentong.wu@intel.com>, hdegoede@redhat.com,
        djrscally@gmail.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        tian.shu.qiu@intel.com
Subject: Re: [PATCH v11 1/2] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <20230803220840.GE9722@pendragon.ideasonboard.com>
References: <20230803115550.1601965-1-sakari.ailus@linux.intel.com>
 <20230803115550.1601965-2-sakari.ailus@linux.intel.com>
 <20230803215842.GJ27752@pendragon.ideasonboard.com>
 <ZMwkMP/QlaKiFhsp@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZMwkMP/QlaKiFhsp@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 03, 2023 at 10:03:28PM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> (Dropping Xiang, his e-mail doesn't seem to work.)
> 
> On Fri, Aug 04, 2023 at 12:58:42AM +0300, Laurent Pinchart wrote:
> > Hi Sakari and Wentong,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Aug 03, 2023 at 02:55:49PM +0300, Sakari Ailus wrote:
> > > From: Wentong Wu <wentong.wu@intel.com>
> > > 
> > > CSI is a submodule of IVSC which can route camera sensor data
> > > to the outbound MIPI CSI-2 interface.
> > > 
> > > The interface communicating with firmware is via MEI. There is
> > > a separate MEI UUID, which this driver uses to enumerate.
> > > 
> > > To route camera sensor data to host, the information of link
> > > frequency and number of data lanes is sent to firmware by
> > > sending MEI command when starting stream.
> > > 
> > > CSI also provides a privacy mode. When privacy mode is turned
> > > on, camera sensor can't be used. This means that both IVSC and
> > > host Image Processing Unit(IPU) can't get image data. And when
> > 
> > s/Unit/Unit /
> > 
> > I'd like to see a proof of that statement though :-) Handling camera
> > privacy in a closed-source firmware known to have backdoors doesn't seem
> > very private to me.
> > 
> > Is the IVSC found in lots of IPU6-based machines ?
> 
> I think it's found in most of what I'm aware of, not all though.
> 
> > 
> > > this mode is turned on, user is notified via v4l2 control
> > > callback.
> > > 
> > > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/pci/intel/Kconfig        |   1 +
> > >  drivers/media/pci/intel/Makefile       |   1 +
> > >  drivers/media/pci/intel/ivsc/Kconfig   |  12 +
> > >  drivers/media/pci/intel/ivsc/Makefile  |   6 +
> > >  drivers/media/pci/intel/ivsc/mei_csi.c | 825 +++++++++++++++++++++++++
> > >  5 files changed, 845 insertions(+)
> > >  create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
> > >  create mode 100644 drivers/media/pci/intel/ivsc/Makefile
> > >  create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
> > > 
> > > diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
> > > index 51b18fce6a1d..e113902fa806 100644
> > > --- a/drivers/media/pci/intel/Kconfig
> > > +++ b/drivers/media/pci/intel/Kconfig
> > > @@ -8,3 +8,4 @@ config IPU_BRIDGE
> > >  	  dependencies, this is selected by each driver that needs it.
> > >  
> > >  source "drivers/media/pci/intel/ipu3/Kconfig"
> > > +source "drivers/media/pci/intel/ivsc/Kconfig"
> > > diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
> > > index 951191a7e401..f199a97e1d78 100644
> > > --- a/drivers/media/pci/intel/Makefile
> > > +++ b/drivers/media/pci/intel/Makefile
> > > @@ -4,3 +4,4 @@
> > >  #
> > >  obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
> > >  obj-y	+= ipu3/
> > > +obj-y	+= ivsc/
> > > diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> > > new file mode 100644
> > > index 000000000000..9535ac10f4f7
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/Kconfig
> > > @@ -0,0 +1,12 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +# Copyright (C) 2023, Intel Corporation. All rights reserved.
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
> > 
> > s/Unit/Unit /
> > 
> > This would benefit from being reworded, it's not very clear.
> 
> I'll post a patch to improve the text, this patch is already in a PR.
> 
> > 
> > > diff --git a/drivers/media/pci/intel/ivsc/Makefile b/drivers/media/pci/intel/ivsc/Makefile
> > > new file mode 100644
> > > index 000000000000..cbd194a26f03
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/Makefile
> > > @@ -0,0 +1,6 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Copyright (C) 2023, Intel Corporation. All rights reserved.
> > > +
> > > +obj-$(CONFIG_INTEL_VSC) += ivsc-csi.o
> > > +ivsc-csi-y += mei_csi.o
> > > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> > > new file mode 100644
> > > index 000000000000..00ba611e0f68
> > > --- /dev/null
> > > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > > @@ -0,0 +1,825 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) 2023 Intel Corporation. All rights reserved.
> > > + * Intel Visual Sensing Controller CSI Linux driver
> > > + */
> > > +
> > > +/*
> > > + * To set ownership of CSI-2 link and to configure CSI-2 link, there
> > > + * are specific commands, which are sent via MEI protocol. The send
> > > + * command function uses "completion" as a synchronization mechanism.
> > > + * The response for command is received via a mei callback which wakes
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
> > > +#define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
> > > +
> > > +#define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
> > > +
> > > +/* the 5s used here is based on experiment */
> > > +#define CSI_CMD_TIMEOUT (5 * HZ)
> > > +/* to setup CSI-2 link an extra delay needed and determined experimentally */
> > > +#define CSI_FW_READY_DELAY_MS 100
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
> > > +/* CSI-2 link ownership definition */
> > > +enum csi_link_owner {
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
> > > +/* configuration of the CSI-2 link between host and IVSC */
> > > +struct csi_link_cfg {
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
> > > +	struct v4l2_ctrl *freq_ctrl;
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
> > > +static s64 link_freq_menu_items[] = {
> > > +	MEI_CSI_LINK_FREQ_400MHZ
> > > +};
> > > +
> > > +static inline struct mei_csi *notifier_to_csi(struct v4l2_async_notifier *n)
> > > +{
> > > +	return container_of(n, struct mei_csi, notifier);
> > > +}
> > > +
> > > +static inline struct mei_csi *sd_to_csi(struct v4l2_subdev *sd)
> > > +{
> > > +	return container_of(sd, struct mei_csi, subdev);
> > > +}
> > > +
> > > +static inline struct mei_csi *ctrl_to_csi(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	return container_of(ctrl->handler, struct mei_csi, ctrl_handler);
> > > +}
> > > +
> > > +/* send a command to firmware and mutex must be held by caller */
> > > +static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len)
> > > +{
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
> > > +static int csi_set_link_owner(struct mei_csi *csi, enum csi_link_owner owner)
> > > +{
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
> > > +/* configure CSI-2 link between host and IVSC */
> > > +static int csi_set_link_cfg(struct mei_csi *csi)
> > > +{
> > > +	struct csi_cmd cmd = { 0 };
> > > +	size_t cmd_size;
> > > +	int ret;
> > > +
> > > +	cmd.cmd_id = CSI_SET_CONF;
> > > +	cmd.param.conf.nr_of_lanes = csi->nr_of_lanes;
> > > +	cmd.param.conf.link_freq = CSI_LINK_FREQ(csi->link_freq);
> > > +	cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
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
> > > +static void mei_csi_rx(struct mei_cl_device *cldev)
> > > +{
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
> > > +static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable)
> > > +{
> > > +	struct mei_csi *csi = sd_to_csi(sd);
> > > +	s64 freq;
> > > +	int ret;
> > > +
> > > +	if (enable && csi->streaming == 0) {
> > > +		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
> > > +		if (freq < 0) {
> > > +			dev_err(&csi->cldev->dev,
> > > +				"error %lld, invalid link_freq\n", freq);
> > > +			ret = freq;
> > > +			goto err;
> > > +		}
> > > +		csi->link_freq = freq;
> > > +
> > > +		/* switch CSI-2 link to host */
> > > +		ret = csi_set_link_owner(csi, CSI_LINK_HOST);
> > > +		if (ret < 0)
> > > +			goto err;
> > > +
> > > +		/* configure CSI-2 link */
> > > +		ret = csi_set_link_cfg(csi);
> > > +		if (ret < 0)
> > > +			goto err_switch;
> > > +
> > > +		ret = v4l2_subdev_call(csi->remote, video, s_stream, 1);
> > > +		if (ret)
> > > +			goto err_switch;
> > > +	} else if (!enable && csi->streaming == 1) {
> > > +		v4l2_subdev_call(csi->remote, video, s_stream, 0);
> > > +
> > > +		/* switch CSI-2 link to IVSC */
> > > +		ret = csi_set_link_owner(csi, CSI_LINK_IVSC);
> > > +		if (ret < 0)
> > > +			dev_warn(&csi->cldev->dev,
> > > +				 "failed to switch CSI2 link: %d\n", ret);
> > > +	}
> > > +
> > > +	csi->streaming = enable;
> > > +
> > > +	return 0;
> > > +
> > > +err_switch:
> > > +	csi_set_link_owner(csi, CSI_LINK_IVSC);
> > > +
> > > +err:
> > > +	return ret;
> > > +}
> > > +
> > > +static struct v4l2_mbus_framefmt *
> > > +mei_csi_get_pad_format(struct v4l2_subdev *sd,
> > > +		       struct v4l2_subdev_state *sd_state,
> > > +		       unsigned int pad, u32 which)
> > > +{
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
> > > +			    struct v4l2_subdev_state *sd_state)
> > > +{
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
> > > +			   struct v4l2_subdev_format *format)
> > > +{
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
> > > +			   struct v4l2_subdev_format *format)
> > > +{
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
> > > +	source_mbusformat = mei_csi_get_pad_format(sd, sd_state, CSI_PAD_SOURCE,
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
> > I wonder if we should simply accept all formats. The IVSC doesn't seem
> > to cara.
> 
> The video mux needs something similar. I was thinking of adding a generic
> helper for such functions, perhaps with flags to suggest which formats to
> accept.

What would be the drawbacks of accepting all formats ?

> > > +
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
> > > +static int mei_csi_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct mei_csi *csi = ctrl_to_csi(ctrl);
> > > +	s64 freq;
> > > +
> > > +	if (ctrl->id == V4L2_CID_LINK_FREQ) {
> > > +		if (!csi->remote)
> > > +			return -EINVAL;
> > > +
> > > +		freq = v4l2_get_link_freq(csi->remote->ctrl_handler, 0, 0);
> > > +		if (freq < 0) {
> > > +			dev_err(&csi->cldev->dev,
> > > +				"error %lld, invalid link_freq\n", freq);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		link_freq_menu_items[0] = freq;
> > > +		ctrl->val = 0;
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_ops mei_csi_ctrl_ops = {
> > > +	.g_volatile_ctrl = mei_csi_g_volatile_ctrl,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_video_ops mei_csi_video_ops = {
> > > +	.s_stream = mei_csi_set_stream,
> > > +};
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
> > > +	.link_validate = v4l2_subdev_link_validate,
> > > +};
> > > +
> > > +static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
> > > +				struct v4l2_subdev *subdev,
> > > +				struct v4l2_async_connection *asd)
> > > +{
> > > +	struct mei_csi *csi = notifier_to_csi(notifier);
> > > +	int pad;
> > > +
> > > +	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
> > > +					  MEDIA_PAD_FL_SOURCE);
> > > +	if (pad < 0)
> > > +		return pad;
> > > +
> > > +	csi->remote = subdev;
> > > +	csi->remote_pad = pad;
> > > +
> > > +	return media_create_pad_link(&subdev->entity, pad,
> > > +				     &csi->subdev.entity, 1,
> > > +				     MEDIA_LNK_FL_ENABLED |
> > > +				     MEDIA_LNK_FL_IMMUTABLE);
> > > +}
> > > +
> > > +static void mei_csi_notify_unbind(struct v4l2_async_notifier *notifier,
> > > +				  struct v4l2_subdev *subdev,
> > > +				  struct v4l2_async_connection *asd)
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
> > > +static int mei_csi_init_controls(struct mei_csi *csi)
> > > +{
> > > +	u32 max;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	csi->ctrl_handler.lock = &csi->lock;
> > > +
> > > +	max = ARRAY_SIZE(link_freq_menu_items) - 1;
> > > +	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
> > > +						&mei_csi_ctrl_ops,
> > > +						V4L2_CID_LINK_FREQ,
> > > +						max,
> > > +						0,
> > > +						link_freq_menu_items);
> > > +	if (csi->freq_ctrl)
> > > +		csi->freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY |
> > > +					 V4L2_CTRL_FLAG_VOLATILE;
> > > +
> > > +	csi->privacy_ctrl = v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
> > > +					      V4L2_CID_PRIVACY, 0, 1, 1, 0);
> > > +	if (csi->privacy_ctrl)
> > > +		csi->privacy_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	if (csi->ctrl_handler.error)
> > > +		return csi->ctrl_handler.error;
> > > +
> > > +	csi->subdev.ctrl_handler = &csi->ctrl_handler;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mei_csi_parse_firmware(struct mei_csi *csi)
> > > +{
> > > +	struct v4l2_fwnode_endpoint v4l2_ep = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > > +	};
> > > +	struct device *dev = &csi->cldev->dev;
> > > +	struct v4l2_async_connection *asd;
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
> > > +	v4l2_async_subdev_nf_init(&csi->notifier, &csi->subdev);
> > > +	csi->notifier.ops = &mei_csi_notify_ops;
> > > +
> > > +	asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
> > > +				       struct v4l2_async_connection);
> > > +	if (IS_ERR(asd)) {
> > > +		fwnode_handle_put(fwnode);
> > > +		return PTR_ERR(asd);
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
> > > +	fwnode_handle_put(fwnode);
> > > +	if (ret)
> > > +		return ret;
> > > +	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
> > > +
> > > +	ret = v4l2_async_nf_register(&csi->notifier);
> > > +	if (ret)
> > > +		v4l2_async_nf_cleanup(&csi->notifier);
> > > +
> > > +	v4l2_fwnode_endpoint_free(&v4l2_ep);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int mei_csi_probe(struct mei_cl_device *cldev,
> > > +			 const struct mei_cl_device_id *id)
> > > +{
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
> > > +	csi->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> > > +	csi->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > > +	csi->subdev.entity.ops = &mei_csi_entity_ops;
> > > +
> > > +	snprintf(csi->subdev.name, sizeof(csi->subdev.name),
> > > +		 MEI_CSI_ENTITY_NAME);
> > > +
> > > +	ret = mei_csi_init_controls(csi);
> > > +	if (ret)
> > > +		goto err_ctrl_handler;
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
> > > +
> > > +err_entity:
> > > +	media_entity_cleanup(&csi->subdev.entity);
> > > +
> > > +err_ctrl_handler:
> > > +	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > > +	v4l2_async_nf_unregister(&csi->notifier);
> > > +	v4l2_async_nf_cleanup(&csi->notifier);
> > > +
> > > +err_disable:
> > > +	mei_cldev_disable(cldev);
> > > +
> > > +destroy_mutex:
> > > +	mutex_destroy(&csi->lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void mei_csi_remove(struct mei_cl_device *cldev)
> > > +{
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
> > > +	{ /* sentinel */ }
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

-- 
Regards,

Laurent Pinchart
