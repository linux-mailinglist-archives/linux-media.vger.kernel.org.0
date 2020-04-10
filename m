Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E5E1A4A5D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 21:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgDJT0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 15:26:42 -0400
Received: from mail-mw2nam12on2060.outbound.protection.outlook.com ([40.107.244.60]:33803
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726203AbgDJT0m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 15:26:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmWdOTI/BbIrUEYLvi+QyXeV0rmtIVeAA7bh7wOuvNXs61yfXf5P01JKTojsEet1Ap8/dw2xvYCz+FxRuCAM3m4b+iaGW1qDrCfEIoGKCD2olv80o+lTIIDhRyHIdBnIEKZlbhpnrnvItF4OBILf3A799L0A9kJypOaEgnHLERCdCRWcti4OiEBtLsMVTmq+UlkRNfZMs/nLEvcdEXltJ2k/7kyNBmzVd+j/CCrJDwGPYZZFtMt1N9MjyATvcF4GByJpBAEGtG72i0Lqz6ai2jwl5J0+lNtuS3kuOZ1G+qyp1QJpu4I+HTfjMm3qXE0a3divszFZHFeWFOyyda59Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnn9lilyYZOCR6rcIDlZ4/9BIOHeA8vUv2VhG6PAzNg=;
 b=kjhOUfTZBq0WfcVC2aAGx2aa1Ym+f88fKF+szOU3fWlz+ghp54tW1E4BQw5+LoKHIi1iz6uHGH8HVwVtTcn96ro+rYzZLNK2pA0dukSs6CwCpDiHMqM6doPYHpt04+DmbuvFjJIba44PEY9EvliiOkmsa2w/3z/XYJGOEP4lX31y4rjf6SS4B30ayqnFoKo1Te75e4XSFApZaNbE6GEN6Aef+VkaK9s9Qb7upKqeCGvhGbuhIREpOhsI7WmuYNvr6H7Bvr28McHPINi/jCMrs8DePEEEWxFpb9+v/XCEhjC0Ll5aNWs/T/pWl3SCEgKfVrCZ6d+NOdaIJXS39t1LLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnn9lilyYZOCR6rcIDlZ4/9BIOHeA8vUv2VhG6PAzNg=;
 b=S9k7mAHgh+u53+Egq75GQqnDe6oYQanqMTcinNHD+WJTgy2+QqBrM/wP3CpHaoEpU3N3y/liN0s4Oe4RU7vZzgJ7wNtCh6aXWYANN+pWpiNfLYMsVfxaQeT3lWki8W1rBLuAhuJXDKJdkHoa976g4Zfc6CO4yHjMzZbYmKV4Dis=
Received: from MN2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:23a::9)
 by DM6PR02MB4586.namprd02.prod.outlook.com (2603:10b6:5:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 10 Apr
 2020 19:26:32 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23a:cafe::b4) by MN2PR03CA0004.outlook.office365.com
 (2603:10b6:208:23a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Fri, 10 Apr 2020 19:26:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 19:26:31
 +0000
Received: from [149.199.38.66] (port=43196 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMzHu-0007AO-3y; Fri, 10 Apr 2020 12:26:02 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMzIN-0007Qo-H2; Fri, 10 Apr 2020 12:26:31 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03AJQQfe027162;
        Fri, 10 Apr 2020 12:26:26 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMzII-0007Po-LA; Fri, 10 Apr 2020 12:26:26 -0700
Date:   Fri, 10 Apr 2020 12:26:26 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hyun Kwon <hyunk@xilinx.com>, Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Message-ID: <20200410192625.GA1259@smtp.xilinx.com>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
 <20200401223037.GB583@smtp.xilinx.com>
 <20200407222255.GS1716317@oden.dyn.berto.se>
 <20200409073507.yes2rnvqhbj3k3ya@uno.localdomain>
 <20200410003028.GB3396@smtp.xilinx.com>
 <20200410102406.GB2798828@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200410102406.GB2798828@oden.dyn.berto.se>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(8676002)(82740400003)(53546011)(7416002)(81166007)(26005)(4326008)(336012)(8936002)(81156014)(33656002)(186003)(316002)(9786002)(2906002)(54906003)(70586007)(478600001)(1076003)(356005)(5660300002)(47076004)(44832011)(70206006)(426003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 336e56b8-e1d9-42cf-062c-08d7dd85133b
X-MS-TrafficTypeDiagnostic: DM6PR02MB4586:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4586370D68C665B693D0EBC4D6DE0@DM6PR02MB4586.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0369E8196C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJciCR/ZXO3cO5wjwuADEzhm5cDm5O0Y3/pEapAUUpu/V7NqrJ+H1JepOaYMMuHuO4zarlDXbwZOf8IeuS+qQ2KymJiAxrrVT0YzPXQHWElOQFiCV422mEKrQYpT6ceoNZRzG7XEkKi/CGWa2eJTxgtx0Al3FUqQ0ujp1uyCaHb+Oy9BzTDUUTeGKA54i9g5q/JBaoa1czn7Qcz2JUq7UXoQ+2G1NW1/mkQrxr7F+cKjQyVCZRVnltOwRg6TNtjJHC6jorzTXaOSVVWHt2oaDNsN8Jr9jK9cEYJdcKQHu8TlZsAp6feWjuep80B5bENSnJIb/sM86kKr2TLSKaCBGIlrBcp1vNhEvI606u+TUUwfkSX8PE8KKmQNF1watucf46vD3axB68MRcRrQ24aXnL2jzBA/9u76B5VdQn99HxqF8q0pgBTOaVaopo6plXjKQJOXUTBa2WkjiPCO32Z9rhDjN9AixFbEudRTmpWmYshGv35AT13fa8o0Z60BuV8oJ0e3ZQ4fvEJrR3uFzb6ewQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 19:26:31.9068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 336e56b8-e1d9-42cf-062c-08d7dd85133b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4586
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas!

On Fri, 2020-04-10 at 03:24:06 -0700, niklas.soderlund+renesas@ragnatech.se wrote:
> Hi Huyn,
> 
> On 2020-04-09 17:30:28 -0700, Hyun Kwon wrote:
> > Hi Niklas and Jacop,
> > 
> > On Thu, 2020-04-09 at 00:35:07 -0700, Jacopo Mondi wrote:
> > > Hi Niklas, Huyn,
> > > On Wed, Apr 08, 2020 at 12:22:55AM +0200, niklas.soderlund+renesas@ragnatech.se wrote:
> > > > Hi Hyun and Jacopo,
> > > >
> > > > On 2020-04-01 15:30:38 -0700, Hyun Kwon wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > On Fri, 2020-03-13 at 07:40:33 -0700, Jacopo Mondi wrote:
> > > > > > Introduce a new pad operation to allow retrieving the media bus
> > > > > > configuration on a subdevice pad.
> > > > > >
> > > > > > The newly introduced operation reassembles the s/g_mbus_config video
> > > > > > operation, which have been on their way to be deprecated since a long
> > > > > > time.
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > > ---
> > > > > >  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 67 insertions(+)
> > > > > >
> > > > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > > > index 761aa83a3f3c..3a1afc00e094 100644
> > > > > > --- a/include/media/v4l2-subdev.h
> > > > > > +++ b/include/media/v4l2-subdev.h
> > > > > > @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
> > > > > >  	unsigned short num_entries;
> > > > > >  };
> > > > > >
> > > > > > +/**
> > > > > > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > > > > > + * @hsync_active: hsync active state: true for high, false for low
> > > > > > + * @vsync_active: vsync active state: true for high, false for low
> > > > > > + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> > > > > > + * @data_active: data lines active state: true for high, false for low
> > > > > > + */
> > > > > > +struct v4l2_mbus_parallel_config {
> > > > > > +	bool hsync_active : 1;
> > > > > > +	bool vsync_active : 1;
> > > > > > +	bool pclk_rising : 1;
> > > > > > +	bool data_active : 1;
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> > > > > > + * @data_lanes: number of data lanes in use
> > > > > > + * @clock_noncontinuous: non continuous clock enable flag
> > > > > > + */
> > > > > > +struct v4l2_mbus_csi2_dphy_config {
> > > > > > +	unsigned int data_lanes : 3;
> > > > > > +	bool clock_noncontinuous : 1;
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> > > > > > + *
> > > > > > + * TODO
> > > > > > + */
> > > > > > +struct v4l2_mbus_csi2_cphy_config {
> > > > > > +	/* TODO */
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct v4l2_mbus_pad_config - media bus configuration
> > > > > > + *
> > > > > > + * Report the subdevice media bus information to inform the caller of the
> > > > > > + * current bus configuration. The structure describes bus configuration
> > > > > > + * parameters that might change in-between streaming sessions, in order to allow
> > > > > > + * the caller to adjust its media bus configuration to match what is reported
> > > > > > + * here.
> > > > > > + *
> > > > > > + * TODO: add '_pad_' to the name to distinguish this from the structure
> > > > > > + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> > > > > > + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> > > > > > + * the bus type.
> > > > > > + *
> > > > > > + * @type: mbus type. See &enum v4l2_mbus_type
> > > > > > + * @parallel: parallel bus configuration parameters.
> > > > > > + *	      See &struct v4l2_mbus_parallel_config
> > > > > > + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> > > > > > + *	       See &struct v4l2_mbus_csi2_dphy_config
> > > > > > + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> > > > > > + *	       See &struct v4l2_mbus_csi2_cphy_config
> > > > > > + */
> > > > > > +struct v4l2_mbus_pad_config {
> > > > > > +	enum v4l2_mbus_type type;
> > > > > > +	union {
> > > > > > +		struct v4l2_mbus_parallel_config parallel;
> > > > > > +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> > > > > > +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> > > > > > +	};
> > > > > > +};
> > > > > > +
> > > > > >  /**
> > > > > >   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
> > > > > >   *				  in video mode.
> > > > > > @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
> > > > > >   *
> > > > > >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> > > > > >   *                  may be adjusted by the subdev driver to device capabilities.
> > > > > > + * @get_mbus_config: get the current mbus configuration
> > > > > >   */
> > > > > >  struct v4l2_subdev_pad_ops {
> > > > > >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > > > > > @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
> > > > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > > >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> > > > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > > > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > +			       struct v4l2_mbus_pad_config *config);
> > > > >
> > > > > Because this can be used in many different ways, there's more chance it can
> > > > > be misused. That means, drivers call this in different locations, ex probe,
> > > > > get format, start stream,,,, and on differnt pads, src or sink. So imagine
> > > > > one set of drivers call on sink pad, and the other set call on source pad.
> > > > > It works well only until those are mixed together.
> > > 
> > > I don't think we can right now establish all possible use cases, or
> > > prevent people from shooting in their foot, moreover, the 'right'
> > > usage really depends on the bus in use, and I can't tell where this is
> > > will be used in the wild...
> > > 
> > > >
> > > > That subdevice operations can be called at both probe and s_stream() is
> > > > nothing new, I don't thin this is a new problem. But I agree maybe we
> > > > could limit get_mbus_config() in the core to only be valid four source
> > > > pads? Apart from this open question I think this patch looks good.
> > > >
> > > 
> > > I'm a bit skeptical on limiting this to source pads as, again, this
> > > really depends on the bus on which this operation is used. For my
> > > limited knowledge, yes, the use case is always the receiver quering
> > > the transmitter, but I don't feel like ruling out the opposite.
> > > 
> > > > >
> > > > > So wouldn't it be better to put some restrictions? One is to document
> > > > > recommendations. I think this better be called in stream on because
> > > > > some bus config may change at runtime depending on other configuration.
> > > > > So any bus config prior to stream-on may be outdated. The other is to
> > > > > enforce in the code. Some, but maybe not all, can be handled in
> > > > > v4l2_subdev_call_pad_wrappers, for example allowing this call only on
> > > > > source pad.
> > > > >
> > > 
> > > I hear your concern, but I think it really depends on the use cases
> > > and I would have an hard time to provide recommendations that
> > > address all use cases.
> > > 
> > > Is your concern due to some mis-uses example you can describe ?
> > 
> > Yeah, while trying this out, I was thinking how it should be used. I ended
> > up with a specific way: single direction, starting from stream on,
> > 
> > (streamon) -> max9286 -> (g_mbus_conf) -> max96705 -> (g_mbus_conf) -> sensor1
> > 
> > It's this way because max96705 doesn't have own vsync polarity, and it
> > should get it from the connected sensor. While someone may implement the same
> > in complete opposite direction for another set of drivers, starting from
> > sensor, or even in different entry point,
> 
> I agree with the use-case above.
> 
> > 
> > (s_fmt) -> sensor2 -> (g_mbus_conf) -> some_ser -> (g_mbus_conf) -> some_des
> > 
> > When the sensor2 driver is used with max96705 above, there could be a problem
> > such as circular calls or getting an outdated value. And it is harder to fix at
> > that point. So I thought enforcing the direction works for current use cases
> > (under my visilbity), and may help avoid such issue in future. Probably it may
> > be just me over-thinking, as it sounds like? :-)
> 
> If a format is set on a subdevice we are operating on a subdevice that 
> is part of a media device right? If so shall setting the format of the 
> different entities of the graph involve cross entry calls? Shall not the 
> entire pipeline format be validated at stream_start() and that is the 
> time g_mbus_conf() would be involved like in the first case above. I 
> might have misunderstood something if so I apologize.
> 

In this patch, it's fully up to driver implementation, so it's legitimate
if some driver decides to call that in subdev set format and call another
get_mbus_config() within it.


Thanks,
-hyun

