Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD10173F3E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 19:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgB1SNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 13:13:24 -0500
Received: from mail-co1nam11on2052.outbound.protection.outlook.com ([40.107.220.52]:6099
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725805AbgB1SNX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 13:13:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9d3MM+TOUD/9bAWAF5gqKz0gFWEXxxWG/8Zm7TwQZJny0w8bltnkpUvnvJYKdgc7ykqe23T1uqsKNc2w4T7ytBeuenMOa7dVVNeSOlurw6C2uAcESRYZEGxbgFB13CViW7k9BVLpQr5fhgcy/zJwUaYAdPH+OdHUT0bStMwGy7VkIqM/eTPvXgJzCzC9jd53tQURKvT0VVmYuvhe6xODETQZbUyPdAEmwsgP3fz2DzAj+HtEbRaEZtpoSl3k7ziKFlU7RT6dKk1zA+v+Z5b5X3duJE/UhSM5ou0Yb7+OgneU5YLdpE3pWAoD5VVJjXfh0u7xQxRIzfjeJCgDqBiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJaFno8ATSvm16ArM0B+Y5JCAjjO1bDUMImlnpBbqJY=;
 b=Z+WEhuf8SGQLaXHnPVNv88bETNx66/vvazU+Cb3tEzjxcOEnFeUXB70xhwToqE1B+mtQTTDAXJJ4a2JCh5sfrgrvRm4yYbxrYTAk/QLtuyiV0Xy3MgGN9QgsJIc4yeEQbQJFzZDft7iWGQpC428RYN4mGJIfNsCpJSVpSjd7SY7152/hXGIbrszkGr9uzYfg/2FxMwIFpRpLZ8EAtMlkFqDEvllxhWaxUAmczhjijFt/KNFVr+4hyD/7iOKstwj8t6eKb1YmXMPqUUssOgLA7EO3XyZWP1xjCO8WZ4GHgCYF1Dibhzi8CCArFoTy7w8ZAOWEc86lCi04eUQ4MRiaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ragnatech.se smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJaFno8ATSvm16ArM0B+Y5JCAjjO1bDUMImlnpBbqJY=;
 b=Z1UHaXbtMnPK7CmPPOpVfVs7meXMplykmFghkOUnmtQv9x3de3+dJQLGdOzQswxnUbqSl2G7jLqAiU/2C1cU0BuG6dV8SNFqwr7ipfI6D47Q1X+SZmntp2Kkasq0UkU8jh4U9D9c+5+RI2C5whcwSSS4MijM1itDXjBBB/PNF5o=
Received: from SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) by BL0PR02MB4722.namprd02.prod.outlook.com
 (2603:10b6:208:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 28 Feb
 2020 18:13:14 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::c6) by SN6PR2101CA0012.outlook.office365.com
 (2603:10b6:805:106::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.5 via Frontend
 Transport; Fri, 28 Feb 2020 18:13:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.19
 via Frontend Transport; Fri, 28 Feb 2020 18:13:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1j7k8P-0005vu-W7; Fri, 28 Feb 2020 10:13:14 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1j7k8K-0005kd-TL; Fri, 28 Feb 2020 10:13:08 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01SID44R017716;
        Fri, 28 Feb 2020 10:13:04 -0800
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1j7k8G-0005kB-K9; Fri, 28 Feb 2020 10:13:04 -0800
Date:   Fri, 28 Feb 2020 10:13:04 -0800
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v7 2/2] media: i2c: Add MAX9286 driver
Message-ID: <20200228181303.GA21745@smtp.xilinx.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(199004)(189003)(70206006)(33656002)(4326008)(70586007)(426003)(316002)(54906003)(9786002)(1076003)(66574012)(44832011)(81156014)(26005)(8676002)(81166006)(7416002)(53546011)(30864003)(5660300002)(336012)(8936002)(966005)(356004)(2906002)(186003)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR02MB4722;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 458af691-35f4-4f98-0482-08d7bc79e0e4
X-MS-TrafficTypeDiagnostic: BL0PR02MB4722:
X-Microsoft-Antispam-PRVS: <BL0PR02MB47220B66B85A435154228748D6E80@BL0PR02MB4722.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 0327618309
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SzZbUJpJYJVBPkKnE1qUJUWLcpXekxYUv+6nGKfSgZGUNchjBeor6RgX3TeL6LVLw3YjFpQjZUjT/GeE04t4o5to9iBOlzcXbC/jZ0rvJJSWa3NzfejQ0WJ9i7q00fV+kyUfDx4AuyO3UStV6hyuJlCO8NtwgOS55Tmk62kELJ4yVcrwuob6piu73dH/pV/GbqmnrjCg0feNH9nSv3EJBr5MgZPKX8oQPMyWZGu3sovt0ekk+OuZxGFNhJMK50+prHfX5Igq0mAos/8mhfyJ0S51SrZXeOSnFe1Yij/wDv3l/4AeMCIAxtNhY+UsY1sJ8KJaF1qVTTDDj1r+O4+8xXdEQPdR/WqMUfCw5+kbStPa6aBk1Ap8PjxjQGOF0UKqbW6hnEne+OzkE8jg1Frx1700c2kM3zRbjHPPW/W29qBuzioDKF+BAI1GaQqEB7THUzmOctz6xL3QQuVSBQ56ggUv2apEsZ6YHSYH6nwD94ZAytV10Ffezv60xIOFE2EzH0N8x0Sjtn2u5PONKVByg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2020 18:13:14.4137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 458af691-35f4-4f98-0482-08d7bc79e0e4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4722
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for sharing a patch.

Sorry for late response. I'm trying this driver along with Xilinx MIPI
pipeline and GMSL sensors with max96705. I wanted to confirm a few things
before replying. It's still on going, but replying before it gets too late.
Mostly it's questions and looking for some input.

On Fri, 2020-02-14 at 03:54:19 -0800, Kieran Bingham wrote:
> Small update,
> 
> On 14/02/2020 10:31, Kieran Bingham wrote:
> > The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
> > CSI-2 output. The device supports multicamera streaming applications,
> > and features the ability to synchronise the attached cameras.
> > 
> > CSI-2 output can be configured with 1 to 4 lanes, and a control channel
> > is supported over I2C, which implements an I2C mux to facilitate
> > communications with connected cameras across the reverse control
> > channel.
> 
> This is missing the Co-developed-by: tags ...
> 
> Co-developed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Co-developed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Co-developed-by: Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Co-developed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> --
> Kieran
> 
> 
> 
> > 
> > --
> > v2:
> >  - Fix MAINTAINERS entry
> > 
> > This posting is released with the following modifications to work
> > without Sakari's VC developments:
> >  - max9286_g_mbus_config() re-instated
> >  - max9286_get_frame_desc() is not bus/csi aware
> >  - max9286_{get,set}_routing() removed
> > 
> > v3:
> >  - Initialise notifier with v4l2_async_notifier_init
> >  - Update for new mbus csi2 format V4L2_MBUS_CSI2_DPHY
> > 
> > v4: - Re-introduce required code to function with the VC series.
> > 
> >  - Implement max9286_get_routing, max9286_set_routing
> >  - Remove max9286_g_mbus_config
> > 
> > v5: (internal release)
> >  - Fix printk formatting for hex value
> >  - max9286->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE (add |)
> >  - MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER -> MEDIA_ENT_F_VID_IF_BRIDGE
> >  - Remove 'device is bound' workaround
> > 
> > v6:
> >  - v4l2_subdev_krouting instead of v4l2_subdev_routing separated
> >    to allow integration without the VC/V4L2-Mux series.
> >  - convert sd_to_max9286 to inline function
> >  - rename max9286_device to max9286_priv
> >  - Cleanup the v4l2_async_notifier
> >  - Extend MODULE_AUTHOR
> >  - Replace of_graph_get_endpoint_by_regs with fwnode_graph_get_endpoint_by_id
> >  - Pass default bus type when parsing fwnode endpoint (Manivannan Sadhasivam)
> >  - Use new YAML file reference in MAINTAINERS
> >  - Parse new i2c-mux node in max9286_get_i2c_by_id
> >    (This could/should be refactored to parse these separately first)
> >  - Spelling and calculation fixes in the FSYNC_LOCKED check comments
> >  - Identify each enabled i2c-mux channel in a single pass
> >  - max9286: Improve mux-state readbility [v2]
> >  - Fix frame sync lock durations
> >  - Add comment to describe /why/ we must open the mux in s_stream
> >  - use -EXDEV as return code for failed link synchronisation.
> >  - Fix reference counting of the dt nodeS
> >  - Convert to probe_new for I2C
> >  - Remove redundant max9286_i2c_mux_state
> >  - Provide optional enable-gpio (max9286-pwdn)
> > 
> > v7:
> >  [Kieran]
> >  - Ensure powerdown lines are optional
> >  - Add a 4ms power-up delay
> >  - Add max9286_check_config_link() to core
> >  - Add GPIO chip controller for GPIO0OUT and GPIO1OUT
> >  - Fix GPIO registration
> >  - max9286: Split out async registration
> >    (fixes regulator -EPROBE_DEFERs failures)
> >  - Collect all V4L2 registrations
> >  - balance v4l2_async refcnting
> >  - Rename max9286_v4l2_async_ => max9286_v4l2_notifier_
> > 
> >  [Jacopo]
> >  - Remove redundanct MAXIM_I2C_SPEED macros
> >  - Move notifiers operations
> >  - Add delay after reverse channel reconfiguration
> >  - Move link setup to completion
> >  - Fix up max9286_check_config_link() implementation
> >  - Remove redundant dual configuration of reverse channel
> > 
> >  MAINTAINERS                 |   10 +
> >  drivers/media/i2c/Kconfig   |   11 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/max9286.c | 1278 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 1300 insertions(+)
> >  create mode 100644 drivers/media/i2c/max9286.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 983d3c97edd1..148706353d25 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10033,6 +10033,16 @@ F:	Documentation/devicetree/bindings/hwmon/max6697.txt
> >  F:	drivers/hwmon/max6697.c
> >  F:	include/linux/platform_data/max6697.h
> >  
> > +MAX9286 QUAD GMSL DESERIALIZER DRIVER
> > +M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
> > +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +F:	drivers/media/i2c/max9286.c
> > +
> >  MAX9860 MONO AUDIO VOICE CODEC DRIVER
> >  M:	Peter Rosin <peda@axentia.se>
> >  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index c68e002d26ea..32a4deb90617 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -442,6 +442,17 @@ config VIDEO_VPX3220
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called vpx3220.
> >  
> > +config VIDEO_MAX9286
> > +	tristate "Maxim MAX9286 GMSL deserializer support"
> > +	depends on I2C && I2C_MUX
> > +	depends on VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
> > +	select V4L2_FWNODE
> > +	help
> > +	  This driver supports the Maxim MAX9286 GMSL deserializer.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called max9286.
> > +
> >  comment "Video and audio decoders"
> >  
> >  config VIDEO_SAA717X
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index c147bb9d28db..8896cf8bfc4f 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -117,5 +117,6 @@ obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
> >  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> >  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> >  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> > +obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
> >  
> >  obj-$(CONFIG_SDR_MAX2175) += max2175.o
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > new file mode 100644
> > index 000000000000..a20829297ef6
> > --- /dev/null
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -0,0 +1,1278 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Maxim MAX9286 GMSL Deserializer Driver
> > + *

[snip]

> > +
> > +static const struct v4l2_async_notifier_operations max9286_notify_ops = {
> > +	.bound = max9286_notify_bound,
> > +	.unbind = max9286_notify_unbind,
> > +};
> > +
> > +static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
> > +{
> > +	struct device *dev = &priv->client->dev;
> > +	struct max9286_source *source = NULL;
> > +	int ret;
> > +
> > +	if (!priv->nsources)
> > +		return 0;
> > +
> > +	v4l2_async_notifier_init(&priv->notifier);
> > +
> > +	for_each_source(priv, source) {
> > +		unsigned int i = to_index(priv, source);
> > +
> > +		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> > +		source->asd.match.fwnode = source->fwnode;
> > +
> > +		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
> > +						     &source->asd);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to add subdev for source %d", i);
> > +			v4l2_async_notifier_cleanup(&priv->notifier);
> > +			return ret;
> > +		}
> > +
> > +		/*
> > +		 * Balance the reference counting handled through
> > +		 * v4l2_async_notifier_cleanup()
> > +		 */
> > +		fwnode_handle_get(source->fwnode);
> > +	}
> > +
> > +	priv->notifier.ops = &max9286_notify_ops;
> > +
> > +	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to register subdev_notifier");
> > +		v4l2_async_notifier_cleanup(&priv->notifier);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}

This was giving me some touble because this subdev notifier chain is a part
of a bigger graph (Xilinx Video pipeline graph). Those are defined using
same graph bindings, hence conflicting each other. For now, in order to 
work around, I'm calling bound of subdev notifier if there's any match 
already in parent's done list [1]. Do you have any input how this should be
handled properly?


> > +
> > +static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
> > +{
> > +	if (!priv->nsources)
> > +		return;
> > +
> > +	v4l2_async_notifier_unregister(&priv->notifier);
> > +	v4l2_async_notifier_cleanup(&priv->notifier);
> > +}
> > +

[snip]

> > +};
> > +
> > +static int max9286_v4l2_register(struct max9286_priv *priv)
> > +{
> > +	struct device *dev = &priv->client->dev;
> > +	struct fwnode_handle *ep;
> > +	int ret;
> > +	int i;
> > +
> > +	/* Register v4l2 async notifiers for connected Camera subdevices */
> > +	ret = max9286_v4l2_notifier_register(priv);
> > +	if (ret) {
> > +		dev_err(dev, "Unable to register V4L2 async notifiers\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Configure V4L2 for the MAX9286 itself */
> > +
> > +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
> > +	priv->sd.internal_ops = &max9286_subdev_internal_ops;
> > +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +	v4l2_ctrl_handler_init(&priv->ctrls, 1);
> > +	/*
> > +	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
> > +	 * hardcoded frequency in the BSP CSI-2 receiver driver.
> > +	 */
> > +	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> > +			  50000000, 50000000, 1, 50000000);
> > +	priv->sd.ctrl_handler = &priv->ctrls;
> > +	ret = priv->ctrls.error;
> > +	if (ret)
> > +		goto err_async;
> > +
> > +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > +
> > +	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
> > +	for (i = 0; i < MAX9286_SRC_PAD; i++)
> > +		priv->pads[i].flags = MEDIA_PAD_FL_SINK;
> > +	ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
> > +				     priv->pads);
> > +	if (ret)
> > +		goto err_async;
> > +
> > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
> > +					     0, 0);
> > +	if (!ep) {
> > +		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
> > +		ret = -ENOENT;
> > +		goto err_async;
> > +	}
> > +	priv->sd.fwnode = ep;

I learned that an endpoint node is used for match in some drivers, including
this one [2], while a device node is used in others including Xilinx one. :-)
Hence they don't work with each other. I feel like this better be unified for
interoperability. I understand it's not a problem of this patch, but maybe good
to discuss?

> > +
> > +	ret = v4l2_async_register_subdev(&priv->sd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Unable to register subdevice\n");
> > +		goto err_put_node;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_put_node:
> > +	fwnode_handle_put(ep);
> > +err_async:
> > +	max9286_v4l2_notifier_unregister(priv);
> > +
> > +	return ret;
> > +}
> > +
> > +static void max9286_v4l2_unregister(struct max9286_priv *priv)
> > +{
> > +	fwnode_handle_put(priv->sd.fwnode);
> > +	v4l2_async_unregister_subdev(&priv->sd);
> > +	max9286_v4l2_notifier_unregister(priv);
> > +}
> > +
> > +/* -----------------------------------------------------------------------------
> > + * Probe/Remove
> > + */
> > +
> > +static int max9286_setup(struct max9286_priv *priv)
> > +{
> > +	/*
> > +	 * Link ordering values for all enabled links combinations. Orders must
> > +	 * be assigned sequentially from 0 to the number of enabled links
> > +	 * without leaving any hole for disabled links. We thus assign orders to
> > +	 * enabled links first, and use the remaining order values for disabled
> > +	 * links are all links must have a different order value;
> > +	 */
> > +	static const u8 link_order[] = {
> > +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxxx */
> > +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxx0 */
> > +		(3 << 6) | (2 << 4) | (0 << 2) | (1 << 0), /* xx0x */
> > +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xx10 */
> > +		(3 << 6) | (0 << 4) | (2 << 2) | (1 << 0), /* x0xx */
> > +		(3 << 6) | (1 << 4) | (2 << 2) | (0 << 0), /* x1x0 */
> > +		(3 << 6) | (1 << 4) | (0 << 2) | (2 << 0), /* x10x */
> > +		(3 << 6) | (1 << 4) | (1 << 2) | (0 << 0), /* x210 */
> > +		(0 << 6) | (3 << 4) | (2 << 2) | (1 << 0), /* 0xxx */
> > +		(1 << 6) | (3 << 4) | (2 << 2) | (0 << 0), /* 1xx0 */
> > +		(1 << 6) | (3 << 4) | (0 << 2) | (2 << 0), /* 1x0x */
> > +		(2 << 6) | (3 << 4) | (1 << 2) | (0 << 0), /* 2x10 */
> > +		(1 << 6) | (0 << 4) | (3 << 2) | (2 << 0), /* 10xx */
> > +		(2 << 6) | (1 << 4) | (3 << 2) | (0 << 0), /* 21x0 */
> > +		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
> > +		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
> > +	};
> > +
> > +	/*
> > +	 * Set the I2C bus speed.
> > +	 *
> > +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
> > +	 * only. This should be disabled after the mux is initialised.
> > +	 */
> > +	max9286_configure_i2c(priv, true);
> > +
> > +	/*
> > +	 * Reverse channel setup.
> > +	 *
> > +	 * - Enable custom reverse channel configuration (through register 0x3f)
> > +	 *   and set the first pulse length to 35 clock cycles.
> > +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> > +	 *   high threshold enabled by the serializer driver.
> > +	 */
> > +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> > +		      MAX9286_REV_AMP_X);
> > +	usleep_range(2000, 2500);
> > +
> > +	/*
> > +	 * Enable GMSL links, mask unused ones and autodetect link
> > +	 * used as CSI clock source.
> > +	 */
> > +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> > +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> > +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> > +
> > +	/*
> > +	 * Video format setup:
> > +	 * Disable CSI output, VC is set according to Link number.
> > +	 */
> > +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> > +
> > +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> > +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> > +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> > +		      MAX9286_DATATYPE_YUV422_8BIT);
> > +
> > +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> > +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> > +		      MAX9286_FSYNCMETH_AUTO);
> > +
> > +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> > +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> > +		      MAX9286_HVSRC_D14);

Some of these configs in fact need some handshake between serializer and
de-serializer. For example, I had to invert vsync in serializer [3] to make
it work with this patch.

In addition to that, I need a couple of additional programmings on max9286
(registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
oddly change reserved bits) to get frames. The datasheet doesn't explain
enough for me to understand. I'm talking to Maxim to get more details and
see if those can be handled by serilizer driver.

In a longer term, it'd be nice if such alignment between serializer and
de-serializer is handled in more scalable way.

Thanks,
-hyun

[1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/3bd2dded834492f4ee89e370c22877b97c2e106e
[2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fb0ad7fd699d90d6bbc78fc55dd98639389cfc5b
[3] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fe0b33b174b2850bf0bb25b3a367319127ae12ee

