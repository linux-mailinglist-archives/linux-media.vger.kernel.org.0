Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB7FD1A3D5F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 02:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgDJAar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 20:30:47 -0400
Received: from mail-bn8nam12on2074.outbound.protection.outlook.com ([40.107.237.74]:11255
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726867AbgDJAar (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 20:30:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAYnvQ0/PBw3XgJ8YJda61wcaq4zRVNgASfkY0pL0hKzwwBy+TA1X3sTG+eucgLm1UzrZqrdeWRbgZQPO500lV8DGnCoAfUASS5rokfwreqNX+Z57dZ3lCLgnUvSpt+96nwPybWJm/QBFjBIw3lLbi+DjeOWZdX5+4xW0ZA+11Y3nIhkQgD5bs9rIroVNbOAZNen+pShkJBTOVyc3lmZUrGQSmuimq7uxKup7slbSq5hOlWjH7C1kWuG7QYFNswK8ROYgJjx5zK9wwNaR2PY/EAu4T6eYzrTOQZlrr1RdaWBlg/eTeBTXRtnl3+RqxrFcb5fmjJLkvFrcMSmtewJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZPUgXckUvHi4dxshIK00zUKdYiN87ldZGtLcliOHuQ=;
 b=Rm/qgzrnhi2P1EPJR1qflSXxm3LiovUEg0TvwktnPCndwpQCZh8e81OBCKPOI0DccSBA2vTN4megu13NwkOThBPopl09DvR8yRH3hxOIarE19FHJnBrinsUmFT+orODilRkOCVxjAqR4SItIrUXg/BmPw4ep1q3T/2YfS0mUOsmj3HUUIY231LTPk3MFGDAcOUiBa7g9jV5r4BUWFWPdkPRVxrdUxyrLm0Vw9jhujA32ku++sas/bykBMtQwNVgTZfieONU97tYqd7+0UyVwTaWq7YPtH+hx4MwJLhR1RAstDKpTbXO4zvojnGsYpsYpmH8gaOxAJHSfEdWYHpiloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=jmondi.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZPUgXckUvHi4dxshIK00zUKdYiN87ldZGtLcliOHuQ=;
 b=hNZQ1XByf31mm+7Pk7gIhfHNUsprUWOp3qF++RpgFliHbpE3/RykLpGPJJvhJqXUHUqHAXjCRZWJhhCw6shKIKLUlUi3dcvX7LmpdgqC0VZSg7IkJTEc27xYA+LKCtQnTs1yvW683e6gRjYjwoRHY6OLcJ/u3mWlEhtvz4NUiM4=
Received: from SN2PR01CA0011.prod.exchangelabs.com (2603:10b6:804:2::21) by
 DM6PR02MB6075.namprd02.prod.outlook.com (2603:10b6:5:1f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.21; Fri, 10 Apr 2020 00:30:39 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::3c) by SN2PR01CA0011.outlook.office365.com
 (2603:10b6:804:2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.19 via Frontend
 Transport; Fri, 10 Apr 2020 00:30:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 00:30:38
 +0000
Received: from [149.199.38.66] (port=53963 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMhYh-0001PT-DK; Thu, 09 Apr 2020 17:30:11 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMhZ8-0004dD-GN; Thu, 09 Apr 2020 17:30:38 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMhYy-0004bM-Qe; Thu, 09 Apr 2020 17:30:28 -0700
Date:   Thu, 9 Apr 2020 17:30:28 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
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
Message-ID: <20200410003028.GB3396@smtp.xilinx.com>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
 <20200401223037.GB583@smtp.xilinx.com>
 <20200407222255.GS1716317@oden.dyn.berto.se>
 <20200409073507.yes2rnvqhbj3k3ya@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200409073507.yes2rnvqhbj3k3ya@uno.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(53546011)(426003)(5660300002)(81166007)(81156014)(8936002)(47076004)(70586007)(26005)(70206006)(4326008)(82740400003)(9786002)(336012)(356005)(6916009)(186003)(478600001)(7416002)(33656002)(44832011)(8676002)(66574012)(2906002)(54906003)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8777a68-0a57-4368-80d1-08d7dce664c3
X-MS-TrafficTypeDiagnostic: DM6PR02MB6075:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6075D5E2D6917DFC13953A85D6DE0@DM6PR02MB6075.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0369E8196C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fc/84cJa5+HgP/VI5sgoCVU51RevEBqYBKUKOyJI4egfgr6hseziGy2ilxafC+lw8N2fXAwYOwSu+OFLMfNmkenG8nBlpuuUMPsYO/IpQkWU5k99fohsCqRKwDLXi9JFiGbnLyHhSqvh75Mkm992XF6EaOAGY9LKQMjZUiu9A8wXvPJbT8m36DRACXAhbz/Ux7N2fs1+3VDA7abG9yX3SxZacjYSGfBpkshkShma1XLJpOsuROGtILqRxrL5PEeh8IZrWsy3s4QKgKI+XEDL9gc1qs9qmqP5y4dhxlAMbTOtsbAofdp+jZ2evEHZoiKWiCtBI91A/hWzFohXHDop/UvWpBY2cwMiht6CTlAWBH1jCLoN0QvfxIhHVxK6djDc7hLOaoWp+gWNGepX30aFfLOwH/StzR99sgjpWm6APWAi8OGCr1L2ymEi4Gf96vjEWbHN9ws4UQ0OK05Z5abMU2+6aAlq7tsol1I5E6m+y9j9WKTPwo3ZzWTng5FQhPUKvBmONBSe/UVt+3ZlTV4pcw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 00:30:38.7167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8777a68-0a57-4368-80d1-08d7dce664c3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6075
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas and Jacop,

On Thu, 2020-04-09 at 00:35:07 -0700, Jacopo Mondi wrote:
> Hi Niklas, Huyn,
> On Wed, Apr 08, 2020 at 12:22:55AM +0200, niklas.soderlund+renesas@ragnatech.se wrote:
> > Hi Hyun and Jacopo,
> >
> > On 2020-04-01 15:30:38 -0700, Hyun Kwon wrote:
> > > Hi Jacopo,
> > >
> > > Thanks for the patch.
> > >
> > > On Fri, 2020-03-13 at 07:40:33 -0700, Jacopo Mondi wrote:
> > > > Introduce a new pad operation to allow retrieving the media bus
> > > > configuration on a subdevice pad.
> > > >
> > > > The newly introduced operation reassembles the s/g_mbus_config video
> > > > operation, which have been on their way to be deprecated since a long
> > > > time.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 67 insertions(+)
> > > >
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index 761aa83a3f3c..3a1afc00e094 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
> > > >  	unsigned short num_entries;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > > > + * @hsync_active: hsync active state: true for high, false for low
> > > > + * @vsync_active: vsync active state: true for high, false for low
> > > > + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> > > > + * @data_active: data lines active state: true for high, false for low
> > > > + */
> > > > +struct v4l2_mbus_parallel_config {
> > > > +	bool hsync_active : 1;
> > > > +	bool vsync_active : 1;
> > > > +	bool pclk_rising : 1;
> > > > +	bool data_active : 1;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> > > > + * @data_lanes: number of data lanes in use
> > > > + * @clock_noncontinuous: non continuous clock enable flag
> > > > + */
> > > > +struct v4l2_mbus_csi2_dphy_config {
> > > > +	unsigned int data_lanes : 3;
> > > > +	bool clock_noncontinuous : 1;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> > > > + *
> > > > + * TODO
> > > > + */
> > > > +struct v4l2_mbus_csi2_cphy_config {
> > > > +	/* TODO */
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct v4l2_mbus_pad_config - media bus configuration
> > > > + *
> > > > + * Report the subdevice media bus information to inform the caller of the
> > > > + * current bus configuration. The structure describes bus configuration
> > > > + * parameters that might change in-between streaming sessions, in order to allow
> > > > + * the caller to adjust its media bus configuration to match what is reported
> > > > + * here.
> > > > + *
> > > > + * TODO: add '_pad_' to the name to distinguish this from the structure
> > > > + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> > > > + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> > > > + * the bus type.
> > > > + *
> > > > + * @type: mbus type. See &enum v4l2_mbus_type
> > > > + * @parallel: parallel bus configuration parameters.
> > > > + *	      See &struct v4l2_mbus_parallel_config
> > > > + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> > > > + *	       See &struct v4l2_mbus_csi2_dphy_config
> > > > + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> > > > + *	       See &struct v4l2_mbus_csi2_cphy_config
> > > > + */
> > > > +struct v4l2_mbus_pad_config {
> > > > +	enum v4l2_mbus_type type;
> > > > +	union {
> > > > +		struct v4l2_mbus_parallel_config parallel;
> > > > +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> > > > +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> > > > +	};
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
> > > >   *				  in video mode.
> > > > @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
> > > >   *
> > > >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> > > >   *                  may be adjusted by the subdev driver to device capabilities.
> > > > + * @get_mbus_config: get the current mbus configuration
> > > >   */
> > > >  struct v4l2_subdev_pad_ops {
> > > >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > > > @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
> > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> > > >  			      struct v4l2_mbus_frame_desc *fd);
> > > > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > > +			       struct v4l2_mbus_pad_config *config);
> > >
> > > Because this can be used in many different ways, there's more chance it can
> > > be misused. That means, drivers call this in different locations, ex probe,
> > > get format, start stream,,,, and on differnt pads, src or sink. So imagine
> > > one set of drivers call on sink pad, and the other set call on source pad.
> > > It works well only until those are mixed together.
> 
> I don't think we can right now establish all possible use cases, or
> prevent people from shooting in their foot, moreover, the 'right'
> usage really depends on the bus in use, and I can't tell where this is
> will be used in the wild...
> 
> >
> > That subdevice operations can be called at both probe and s_stream() is
> > nothing new, I don't thin this is a new problem. But I agree maybe we
> > could limit get_mbus_config() in the core to only be valid four source
> > pads? Apart from this open question I think this patch looks good.
> >
> 
> I'm a bit skeptical on limiting this to source pads as, again, this
> really depends on the bus on which this operation is used. For my
> limited knowledge, yes, the use case is always the receiver quering
> the transmitter, but I don't feel like ruling out the opposite.
> 
> > >
> > > So wouldn't it be better to put some restrictions? One is to document
> > > recommendations. I think this better be called in stream on because
> > > some bus config may change at runtime depending on other configuration.
> > > So any bus config prior to stream-on may be outdated. The other is to
> > > enforce in the code. Some, but maybe not all, can be handled in
> > > v4l2_subdev_call_pad_wrappers, for example allowing this call only on
> > > source pad.
> > >
> 
> I hear your concern, but I think it really depends on the use cases
> and I would have an hard time to provide recommendations that
> address all use cases.
> 
> Is your concern due to some mis-uses example you can describe ?

Yeah, while trying this out, I was thinking how it should be used. I ended
up with a specific way: single direction, starting from stream on,

(streamon) -> max9286 -> (g_mbus_conf) -> max96705 -> (g_mbus_conf) -> sensor1

It's this way because max96705 doesn't have own vsync polarity, and it
should get it from the connected sensor. While someone may implement the same
in complete opposite direction for another set of drivers, starting from
sensor, or even in different entry point,

(s_fmt) -> sensor2 -> (g_mbus_conf) -> some_ser -> (g_mbus_conf) -> some_des

When the sensor2 driver is used with max96705 above, there could be a problem
such as circular calls or getting an outdated value. And it is harder to fix at
that point. So I thought enforcing the direction works for current use cases
(under my visilbity), and may help avoid such issue in future. Probably it may
be just me over-thinking, as it sounds like? :-)

Thanks,
-hyun

> 
> Thanks
>    j
> 
> > > Thanks,
> > > -hyun
> > >
> > > >  };
> > > >
> > > >  /**
> > > > --
> > > > 2.25.1
> > > >
> >
> > --
> > Regards,
> > Niklas Söderlund
