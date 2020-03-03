Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91CB178349
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 20:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731042AbgCCTnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 14:43:51 -0500
Received: from mail-bn8nam12on2080.outbound.protection.outlook.com ([40.107.237.80]:35875
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728180AbgCCTnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 14:43:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoP7/ctav9wy3jvn8qYqvx5gll3s3da/PgnqTH9bgDsesoEa3wiuioeo/oGphMwFEmweaTD+kGRPE+9x/MvhQQwPqU4mCW9w8XzZc10CypXNEyguxoG6IV2MPFNXdxbZj2p7ygjvr4TisfZfmDA6ly/6d8iKY5u22xzQk6UHJ5eaJePcacWpVgPSs3fl01UWowmcZSwjrBCAjuGQyJNJm3DLjWw1xhiO1k1v5X9DLLWRKjwkGGDLIycZm83PdhWz8SJkQmIeYnE8nMlismg48OKMZz6g/F2Y0hJOTiO+9Y4TjCmqLg2wz3z2fLr8tM2wMAz3YC90FXrV+7saHbe+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS8PN1kdCGwmuj5rbPlZxhfcgL8W0jqTlHg8eTTJq4g=;
 b=HZPqdPjbhuoUm8cJwgEuru6I8QLPj1B9F3/wjWfoI6OdbNF9EzARhlnSkVkJuEjeLUsrgYj1oZASZbaHHz+cBXDnPOdFcoimrB960jbQPKuxq6jO5s6u095N2XFsLsy91WBjiu6yxx9cRMyUKb2SU/sci82FjXkHdnNc9dqGar025T5ZN8YOltOkedsKRsOCuhEstBMQPPNfUd9SlyWV7Frtj1omaDTPlV413AGH6nQldPXRhqQ+fYDyZOeqjrx0r4RatKxfmIOH1cuTU0gBwEMAHtuu1Wr9cy+/CaAGmR9NzEfRIVyzqst3V6HxRv0opsYVKAh7/VTd2kemB2a7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS8PN1kdCGwmuj5rbPlZxhfcgL8W0jqTlHg8eTTJq4g=;
 b=UQqOsN9q1Onubj1Jx94+87vpZmEycbq41FLVSOBXhjKG47T7O8AAdX9m5Fi0MxfruN/M4nQTWShcXC8IYAviiu+XVGQCaJyqgiDNGBcuvhi2amYNpL6NV6P+P9pIDzX7kC/LxUuai1YVUdX1FHM9u6aqCZdm3gihHVD0hCMS1F4=
Received: from DM6PR06CA0036.namprd06.prod.outlook.com (2603:10b6:5:120::49)
 by DM6PR02MB5932.namprd02.prod.outlook.com (2603:10b6:5:157::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Tue, 3 Mar
 2020 19:43:44 +0000
Received: from SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::45) by DM6PR06CA0036.outlook.office365.com
 (2603:10b6:5:120::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18 via Frontend
 Transport; Tue, 3 Mar 2020 19:43:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT029.mail.protection.outlook.com (10.152.72.110) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2772.15
 via Frontend Transport; Tue, 3 Mar 2020 19:43:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1j9DSA-0008Ln-Cx; Tue, 03 Mar 2020 11:43:42 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1j9DS5-0001Rv-9d; Tue, 03 Mar 2020 11:43:37 -0800
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1j9DRy-0001RC-0X; Tue, 03 Mar 2020 11:43:30 -0800
Date:   Tue, 3 Mar 2020 11:43:30 -0800
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v7 2/2] media: i2c: Add MAX9286 driver
Message-ID: <20200303194328.GA21248@smtp.xilinx.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <295da145-040c-b792-6536-5ba38e5f8aca@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <295da145-040c-b792-6536-5ba38e5f8aca@ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(26005)(44832011)(70586007)(9786002)(186003)(336012)(966005)(7416002)(70206006)(4326008)(478600001)(356004)(81156014)(81166006)(316002)(8676002)(53546011)(1076003)(2906002)(426003)(5660300002)(33656002)(8936002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB5932;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83d61331-fe82-4e2f-d10f-08d7bfab2f09
X-MS-TrafficTypeDiagnostic: DM6PR02MB5932:
X-Microsoft-Antispam-PRVS: <DM6PR02MB593251C46A914B84D2602319D6E40@DM6PR02MB5932.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03319F6FEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SMaEVcFa8z20GSXqmRuilzqynVDPWDc9hllF3oy8o/IeQlEMj26mJ2ZDm3MKsI9vWg8V2J1wM87FuAiu/AJ4pz6aDjnor8II5UM05rjcINXI4MMnEDnGhJmsLgMfWUvh+ikdTcfAK2FaJW1MOE3FxI1k+ztx2zm/ATo3siJiMK7VidB1r9tScoCXX8PD65wEWRNqxrNwj4+QJOFoKikGDVovSrwtmRqM1y3EhJxkW/Iuvi9VWrfEc718EI6GDTZcmrPLeJDSXS5V/Mg9p8z0pmfLOM/Vz557R42alBE66XrDEFN3C32yDhC9R48LW0PfEKhBop/6pHgXIWekx9AE2eoBN52YSWGwik1RZTYbd/V6I/bxfveAloswWB7Op526ruba5LVAcvAucdin+sL51U9RluFFAOLS9ToQGLXuniVpxNCghvGOi29IHqpuETmknIBr3rlTdey80yal+71suaY3haud13h3Y14ZvfptOj6RPDb6W8YiDEnFK4XlC1WzjwfWyBL53snDhttSnH/kw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2020 19:43:44.3858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d61331-fe82-4e2f-d10f-08d7bfab2f09
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5932
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, 2020-03-02 at 02:33:18 -0800, Kieran Bingham wrote:
> Hi Hyun,
> 
> On 28/02/2020 18:13, Hyun Kwon wrote:
> > Hi Kieran,
> > 
> > Thanks for sharing a patch.
> > 
> > Sorry for late response. I'm trying this driver along with Xilinx MIPI
> > pipeline and GMSL sensors with max96705. I wanted to confirm a few things
> > before replying. It's still on going, but replying before it gets too late.
> > Mostly it's questions and looking for some input.
> 
> Not too late at all.
> 
> We're very pleased to get input from other users and system configurations!
> 
> 
> > On Fri, 2020-02-14 at 03:54:19 -0800, Kieran Bingham wrote:
> >> Small update,
> >>
> >> On 14/02/2020 10:31, Kieran Bingham wrote:
> >>> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
> >>> CSI-2 output. The device supports multicamera streaming applications,
> >>> and features the ability to synchronise the attached cameras.
> >>>

[snip]

> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * Maxim MAX9286 GMSL Deserializer Driver
> >>> + *
> > 
> > [snip]
> > 
> >>> +
> >>> +static const struct v4l2_async_notifier_operations max9286_notify_ops = {
> >>> +	.bound = max9286_notify_bound,
> >>> +	.unbind = max9286_notify_unbind,
> >>> +};
> >>> +
> >>> +static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
> >>> +{
> >>> +	struct device *dev = &priv->client->dev;
> >>> +	struct max9286_source *source = NULL;
> >>> +	int ret;
> >>> +
> >>> +	if (!priv->nsources)
> >>> +		return 0;
> >>> +
> >>> +	v4l2_async_notifier_init(&priv->notifier);
> >>> +
> >>> +	for_each_source(priv, source) {
> >>> +		unsigned int i = to_index(priv, source);
> >>> +
> >>> +		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> >>> +		source->asd.match.fwnode = source->fwnode;
> >>> +
> >>> +		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
> >>> +						     &source->asd);
> >>> +		if (ret) {
> >>> +			dev_err(dev, "Failed to add subdev for source %d", i);
> >>> +			v4l2_async_notifier_cleanup(&priv->notifier);
> >>> +			return ret;
> >>> +		}
> >>> +
> >>> +		/*
> >>> +		 * Balance the reference counting handled through
> >>> +		 * v4l2_async_notifier_cleanup()
> >>> +		 */
> >>> +		fwnode_handle_get(source->fwnode);
> >>> +	}
> >>> +
> >>> +	priv->notifier.ops = &max9286_notify_ops;
> >>> +
> >>> +	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "Failed to register subdev_notifier");
> >>> +		v4l2_async_notifier_cleanup(&priv->notifier);
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> > 
> > This was giving me some touble because this subdev notifier chain is a part
> > of a bigger graph (Xilinx Video pipeline graph). Those are defined using
> > same graph bindings, hence conflicting each other. For now, in order to 
> > work around, I'm calling bound of subdev notifier if there's any match 
> > already in parent's done list [1]. Do you have any input how this should be
> > handled properly?
> 
> I suspect that it is likely your existing framework is matching at the
> device level instead of the endpoint level, as it sounds like a topic we
> hit on both this GMSL implementation and the ADV748x, but I'll have to
> take a deeper look to be sure.
> 

The problem with subdev notifier is, for example, the Xilinx platform parses
and registers a notifier for the entire pipeline. The current single stream
(to be simpler for problem description) pipeline looks like,

	sensor -> serializer -> deserializer -> mipi -> scaler -> dma

If the max9286 registers the subdev notifier within the video dev notifier,
it never gets to match and notified because the bound subdev is already
moved out of subdev list to the notifier done list. I feel v4l2-async should
be able to identify this and complete the subdev notifier if it's already
a part of bigger one. Let me see if I can figure out any sensible fix.

> Matching should be done on endpoints, not devices as there could now be
> multiple 'endpoints' connected to a single device.
> 
> 
> The RCar-VIN platform now solely uses endpoint matching, and I believe
> we may have to work through other platforms to update to the same approach.
> 
> 
> A 'temporary' solution may be in the form of this patch:
> 
> https://git.linuxtv.org/sailus/media_tree.git/commit/?h=fwnode-const&id=35c32d99b2c3f5086b911ec817926de9b7bc3b41
> 
> Which I had mistakenly thought was already accepted for upstream but
> appears to have stalled.
> 
> I'll follow this up separately to see what we need to do here.
> 

This doesn't fix the issue completely, because the Xilinx platform layer uses
the asd match node assuming it's device node. I can fix the Xilinx platform
part. I'm going through some previous email threads / patches, trying to get
better context.

> 
> >>> +
> >>> +static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
> >>> +{
> >>> +	if (!priv->nsources)
> >>> +		return;
> >>> +
> >>> +	v4l2_async_notifier_unregister(&priv->notifier);
> >>> +	v4l2_async_notifier_cleanup(&priv->notifier);
> >>> +}
> >>> +
> > 
> > [snip]
> > 
> >>> +};
> >>> +

[snip]

> >>> +	/*
> >>> +	 * Reverse channel setup.
> >>> +	 *
> >>> +	 * - Enable custom reverse channel configuration (through register 0x3f)
> >>> +	 *   and set the first pulse length to 35 clock cycles.
> >>> +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> >>> +	 *   high threshold enabled by the serializer driver.
> >>> +	 */
> >>> +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> >>> +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> >>> +		      MAX9286_REV_AMP_X);
> >>> +	usleep_range(2000, 2500);
> >>> +
> >>> +	/*
> >>> +	 * Enable GMSL links, mask unused ones and autodetect link
> >>> +	 * used as CSI clock source.
> >>> +	 */
> >>> +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> >>> +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> >>> +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> >>> +
> >>> +	/*
> >>> +	 * Video format setup:
> >>> +	 * Disable CSI output, VC is set according to Link number.
> >>> +	 */
> >>> +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> >>> +
> >>> +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> >>> +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> >>> +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> >>> +		      MAX9286_DATATYPE_YUV422_8BIT);
> >>> +
> >>> +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> >>> +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> >>> +		      MAX9286_FSYNCMETH_AUTO);
> >>> +
> >>> +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> >>> +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> >>> +		      MAX9286_HVSRC_D14);
> > 
> > Some of these configs in fact need some handshake between serializer and
> > de-serializer. For example, I had to invert vsync in serializer [3] to make
> > it work with this patch.
> > 
> > In addition to that, I need a couple of additional programmings on max9286
> > (registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
> > oddly change reserved bits) to get frames. The datasheet doesn't explain
> > enough for me to understand. I'm talking to Maxim to get more details and
> > see if those can be handled by serilizer driver.
> 
> It seems Jacopo also had to disable the overlap window for the RDACM21:
> 
> https://jmondi.org/cgit/linux/commit/?h=gmsl/jmondi/platform/rdacm21&id=576bbaee7cc707869a0c5e90befd99c9e2cf754e
> 
> Please let us know if you hear back from Maxim.
> 
> 
> > In a longer term, it'd be nice if such alignment between serializer and
> > de-serializer is handled in more scalable way.
> 
> I agree, We are currently trying to tackle similar issues between our
> two current cameras "RDACM20" and "RDACM21" which have different
> requirements for the two configurations so we are trying to look at ways
> to handle that too.
> 
> In particular we also need to handle:
>  - Pixelrate control to determine CSI2 bus speed.
>  - Link amplitude and threshold levels
>  - Format differences
> 
> Are you still using the 'Sensing/Vision' (AR0231?) camera module that
> Linaro were working with? (I currently have one, so let me know if you'd
> like me to do any testing)
> 
> 
> If they are of any use/reference to you, here are our current WIP
> drivers for the RDACM20 [0] and RDACM21 [1] which Jacopo has been
> developing which show how we currently separate the max9271 and sensor
> packaging:

Thanks for pointers. I was able to google-search some of those drivers already,
but maybe this is latest.. :-) I also checked to get same sensors (vendor,
distributor,,, and IdeasOnBoard as well :-)), but it's not available anymore.

So the setup that I have now,

	AR0231 -> AP0202 ISP -> MAX96705 -> MAX9286 -> Xilinx MIPI -> Xilinx pipeline / DMA

Yesterday I was able to get correct frames, with some hacks and workarounds.
Only missing things from this max9286 driver for my setup are,
- disabling the overlap window
- programming 0x1c register. I believe lower bits have something to do with
three level BWS config, so changing from 0xf6 to 0xf4 changes from high
bandwidth mode to 24 bit mode. But I couldn't get it working with high bandwidth
mode (27 bit) yet.

I got some response from Maxim, but haven't found clarifications yet.
As mentioned above, what is the proposed way that is being looked for
this ser-des config, if any? I can try and align max96705 driver implementation
with it.

Thanks,
-hyun

