Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3D318C38E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 00:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCSXU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 19:20:27 -0400
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:34817
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727258AbgCSXU1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 19:20:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e22K63pvT3xmH6luZYJIsMPyo/DaDouqHBufq6KUFHcqIb7bu4S0BcCyi1R8v2LOF4cnWuSR+GmKX1HdYNQlVIAe1MUTXRalP3fY44nKbSRlefs9rTB4Mw680aq7+tlrvkqLcRxJ7bmVW94daexQrDMaONg8jXN4/n0z1aJmHFiFBc59CFyni9gKjr64n2U+JhZl54OlZZc9vPEvb/tAoDUESFcfRYvJWxx4ZeCRCNT+aLQcZPBywoD8rmA1VA/kUoLixz5enUpf7qvOFcrkFfEABpZ/69fjPkviRKvmM0igz6cUFOCAqEVe1KHSJjpKcNJwrTH5qzSp0c5Qouy+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cWRPVgH3qxpAyLqISimADalzXrwPHPne28XMneUU5Q=;
 b=Nl1eNklk+NlAX1gtovzxAI4uFEOB/zniZmHHNlFSqIA6XDLzI62+m3PAy7+xkTFgap76Ay4TEe9AMag80nwkDF3IhBx8QCqpgkEmQe6hSgt+e108NuZjGXad/1q+/vyRsr0c/PVh52nU0i5GPDFz7zNX/ykzmIdCDmyJZOcFjrTZ59zApUWJcOmdbJpiUYWQjDliXsXuXEV9htsyYPsK/iuJnKHw2W4qWzFNQMtZhcoY9SS7ECntIrR/DrB9LAtEb2n03CPgJFVwB6u2ArMbZUQr1+aI5iUfmf+OziB8WSRJHvhl92DRA0nAGNBOdIEAIjU2tZDuHDKIDrd1w+xctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ragnatech.se smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cWRPVgH3qxpAyLqISimADalzXrwPHPne28XMneUU5Q=;
 b=I0Nh+jjszwrExMpeJ96zrbvlXo7WAnbWOCoZw30npdY2ty3g3jVWxkDXHE6wtuIvdWV2tPGEyFXjdMSpOqSDdGkAOCi9R0zDRpG2IuymUliTLQfXVuLwxCf9orE2FiFap3JKMVz/vAfa/+/uN/36iLh9FtUH0IHj575PvQK5exE=
Received: from DM6PR13CA0068.namprd13.prod.outlook.com (2603:10b6:5:134::45)
 by DM6PR02MB6108.namprd02.prod.outlook.com (2603:10b6:5:1fa::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21; Thu, 19 Mar
 2020 23:20:19 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::b1) by DM6PR13CA0068.outlook.office365.com
 (2603:10b6:5:134::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.11 via Frontend
 Transport; Thu, 19 Mar 2020 23:20:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Thu, 19 Mar 2020 23:20:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jF4SX-00038y-W4; Thu, 19 Mar 2020 16:20:18 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jF4SS-0007DX-S1; Thu, 19 Mar 2020 16:20:12 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02JNK5wh016463;
        Thu, 19 Mar 2020 16:20:05 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jF4SL-0006kn-Au; Thu, 19 Mar 2020 16:20:05 -0700
Date:   Thu, 19 Mar 2020 16:20:05 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
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
Message-ID: <20200319232003.GA20549@smtp.xilinx.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
 <20200319010734.GA27556@smtp.xilinx.com>
 <20200319084557.v5hw54mmw4swzwly@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319084557.v5hw54mmw4swzwly@uno.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(199004)(46966005)(356004)(478600001)(5660300002)(54906003)(7416002)(33656002)(186003)(47076004)(4326008)(8676002)(2906002)(426003)(9786002)(8936002)(6916009)(966005)(81156014)(70586007)(70206006)(30864003)(26005)(1076003)(44832011)(316002)(336012)(81166006)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB6108;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 094a1a8b-5684-40fc-f653-08d7cc5c16ba
X-MS-TrafficTypeDiagnostic: DM6PR02MB6108:
X-Microsoft-Antispam-PRVS: <DM6PR02MB61089D14447E2B08F4A2ED36D6F40@DM6PR02MB6108.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0347410860
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LqfwXRSCqG4XiUZH7SVwwCpyYBXEYT8qzr4WXYyMA6rJf/C5z/4YbNbzRUqDbu6TtTu310I/3IjEYL9qFjdXafpCyKx6Mc8pCLOSQnYcCB+gPHY15ujirMNRjb7A9U0koa3/WYQPaKe8YTPqyVJst8pZGjLCpZ+voS/MVx0GQEp4i3ZxLMe747aNRcONBjsN+Ary1aFNWG6htjkKiY3kFrOPsBUpg+FFx9NP1jHgwsMpKqsEKzErlqoZw1/+ONIXSqCjChkh3CtEuW7am3s9+bwS8fgfqZqTKvvZDL0fOuruJ8dyUsp3uYo0cUiukTjQu2JgJAUZzDWk2tAfnQQbCWlYSMHCZdt8LDOKjKl0XhdmqUwzzTStOTHU7JRW37mPp+wNLZk6fiWdeTY9FVFU4fnvKpQND8QGsIHaBwYffp4A9VhOyMyQK/Tc73WW17xv/jy3bUgUQlatF16rV/i+HQA23TK1a900gHTtSHaUvYABdItQBaVHn9CurTm0LTyYkix8GI2Pvc6iQASR+sLTUtz/sOxFmLXCN4YSe2mA2PLvFzzeBckZ2BOeNp7as5rnccPklwRjxOhsRgUYm3LeGU7T1eRHsZOyg1jViiv+vY=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 23:20:18.4421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 094a1a8b-5684-40fc-f653-08d7cc5c16ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6108
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, 2020-03-19 at 01:45:57 -0700, Jacopo Mondi wrote:
> Hi Hyun,
> 
> On Wed, Mar 18, 2020 at 06:07:35PM -0700, Hyun Kwon wrote:
> > Hi Jacobo,
> >
> > On Sun, 2020-03-15 at 16:15:17 -0700, Jacopo Mondi wrote:
> > > Hello Hyun, Kieran,
> > >    it's great you are looking into this!
> > >
> > > On Fri, Feb 28, 2020 at 10:13:04AM -0800, Hyun Kwon wrote:
> > > > Hi Kieran,
> > > >
> > > > Thanks for sharing a patch.
> > > >
> > > [snip]
> > >
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Set the I2C bus speed.
> > > > > > +	 *
> > > > > > +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
> > > > > > +	 * only. This should be disabled after the mux is initialised.
> > > > > > +	 */
> > > > > > +	max9286_configure_i2c(priv, true);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Reverse channel setup.
> > > > > > +	 *
> > > > > > +	 * - Enable custom reverse channel configuration (through register 0x3f)
> > > > > > +	 *   and set the first pulse length to 35 clock cycles.
> > > > > > +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> > > > > > +	 *   high threshold enabled by the serializer driver.
> > > > > > +	 */
> > > > > > +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > > > > > +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> > > > > > +		      MAX9286_REV_AMP_X);
> > > > > > +	usleep_range(2000, 2500);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Enable GMSL links, mask unused ones and autodetect link
> > > > > > +	 * used as CSI clock source.
> > > > > > +	 */
> > > > > > +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> > > > > > +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> > > > > > +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Video format setup:
> > > > > > +	 * Disable CSI output, VC is set according to Link number.
> > > > > > +	 */
> > > > > > +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> > > > > > +
> > > > > > +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> > > > > > +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> > > > > > +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> > > > > > +		      MAX9286_DATATYPE_YUV422_8BIT);
> > > > > > +
> > > > > > +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> > > > > > +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> > > > > > +		      MAX9286_FSYNCMETH_AUTO);
> > > > > > +
> > > > > > +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> > > > > > +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> > > > > > +		      MAX9286_HVSRC_D14);
> > > >
> > >
> > > I agree we need to make some of these configurable, we need that too
> > > to handle both rdacm20 and 21.
> > >
> > > > Some of these configs in fact need some handshake between serializer and
> > > > de-serializer. For example, I had to invert vsync in serializer [3] to make
> > > > it work with this patch.
> > >
> > > Quickly skamming through the datasheet I'm surprised there is no way
> > > to control the vsync input polarity and you have to go through the
> > > crossbar :) Oh well, I think this could be well controlled through a
> > > device property of the serializer, what do you think?
> > >
> > > We have standard properties to control vsync and hsync polarities, but
> > > they're usually used for output signals, and I would reserve them for
> > > that future usage.. maybe a custom property to control the input vsync
> > > and hsync polarities would do...
> >
> > Thanks for sharing pointers. These are not really hardened - static properties
> > so I'm not sure if device tree is the right place. I was thinking something
> > more similar to phy_configure_opts_mipi_dphy in phy subsystem.
> 
> Let's take a step back, as it seems I was confused as well.
> 
> Not knowing the device, I can only guess on why you need to invert
> the input VSYNC signal in the cross-bar. I see two options:
> 
> 1) Looking at Figure 1 (Functional block diagram) the sensor vsync signal
> is fed to the video timing generation circtuit. The cross-bar switch
> comes after the timing generation circuit, and inverting vsync there
> is then equivalent to invert the vsync output of the timing generation
> block. If that's the case, instead of going through the crossbar,
> the same result can be obtained by setting the VSYNC_INV bit of
> register cxtp (0x4d[3]). If that's the case, I agree this setting
> should be negotiated between ser/desr, as the VS_OUT signal in Figure
> 18 is inverted in the serialized byte stream. Is this the case ?
> 
> 2) Alternatively, you need to invert the input vsync polarity to trigger
> the timing generation circuit. This mean vsync is inverted -before-
> being fed to timing generation, and this was my first understanding,
> as I assumed the crossbar switch come -before- the timing generation
> circtuitry. If this is the case, this setting should not be negotiated
> between ser/deser but between the serializer and the connected camera
> sensor.
> 
> Which case are you trying to address ?
> 

My case is simpler in fact :-), hence the executive summary is,
The sensor vsync signal is active high, and it passes through the serializer.
Since the vsync is already inverted in de-serializer by this patch, expecting
active low, I'm inverting it again in serializer to match.

	sensor -- (vsync active high) --> serializer -- (vsync active low) --> de-serializer
    
If the vsync inversion becomes a device tree property of max9286, the property
value will have to align with polarity of vsync source. In my case, I can
disable the inversion knowing the sensor vsync is active high. But in other
cases, such chain can be quite deep and may be inconvinient for users to check.

Another one is the BWS setting, which is just between ser and de-ser.

With mbus_get_config() operation, the problem can be isolated nicely in
my opinion, and the solution handles all above and scales better.
- The de-serializer checks the vsync polarity of all channels using GMSL
  config. If all are active low, invert the vsync (if it can)

	vsync_bitmap = 0;
	for(chan : channels) {
		config = get_mbus_config(chan);
		if (config->type != gmsl)
			error;

		if (config->gmsl.vsync == +)
			vsync_bitmap |= << chan->chan_id;
	}

	if (vsync_bitmap == (1 << channels.size() - 1))
		nop(); // all active high. don't invert
	else if (vsync_bitmap == 0)
		invert_vsync(ser);
	else
		error;

- The serializer checks vsync polarity in the parallel port config, and
  if it's active low (and if it can), invert to make it active high.
  Otherwise mark it in GMSL config, so the de-serializer can hanle.

	max96705_get_mbus_config()
	{
		config = get_mbus_config(sensor);
		if (config->type != parallel)
			error;

		if (config->parallel.vsync == -) {
			if (invert_vsync(ser))
				ser_config->gmsl.vsync = +;
			else
				ser_config->gmsl.vsync = -;
		}

		return ser_config;
	}

The same can be used for bandwidth setting. The max96705 driver sets 24 bit
mode only as supported bandwidth. The deserializer driver can pick it up from
mbus_get_config(), and adjust its own config accordingly. It will need some
remote node handling in each driver, but seems worth to me.

This became too lengthy! Hope it explains better and aligns with your thought,
described in other thread. I will give it a try too!

Thanks,
-hyun

> >
> > >
> > > >
> > > > In addition to that, I need a couple of additional programmings on max9286
> > > > (registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
> > > > oddly change reserved bits) to get frames. The datasheet doesn't explain
> > > > enough for me to understand. I'm talking to Maxim to get more details and
> > > > see if those can be handled by serilizer driver.
> > >
> > > I would be really interested in knowing what's the overlap window control
> > > about... it's very little detailed in the manual, I agree :) 0xf4 is
> > > not even documented in my version. I assume it's something related to
> > > fsync sync locking (Fig. 46) as I failed to achieve it without that
> > > setting. How did it fail for you ?
> > >
> >
> > I received one doc "Frame Synchronization Block" that explains the overlap
> > window in more details. It's essentially a window between camera vsync and
> > frame sync. If those 2 don't happen within the window, it errors out. So it
> > gives a validation check, but may not work depending on the vsync patterm from
> > camera or the window should be bigger, which makes the validation less
> > useful in my opinion.
> 
> Thanks for the detailed info!
> 
> This reinforces the idea this setting should be disabled by default.
> If we want to enable it, a value should be provided explicitly. I
> still think DTS are the right place for this setting, as this is a
> deserializer-only configuration parameter..
> 
> >
> > I believe 0x1c has something to do with BWS as mentioned in my previous reply.
> > The max9286 on my board sets BWS pin as open, and it makes the bandwidth
> > to be 27 bit mode by default. So writing 0xf4 to 0x1c register sets to 24 bit
> > mode (while 0xf6 = 27 bit mode). But I didn't hear back from Maxim regarding
> > this yet. And unfortunately, I couldn't make it work with 27 bit mode on both
> > max9286 and max96705.
> >
> > So this and similar properties may also be something that can be handled by
> > the negotiating call mentioned above, while the configuraton through external
> > pins can be modeled as device tree properties?
> 
> Indeed external pin configuration fits well as DTS property. Would you
> like to have a go ?
> 
> Thanks
>    j
> 
> >
> > Thanks,
> > -hyun
> >
> > > On how to control overlap window a integer would do ? Setting it to 0
> > > disables it, so we could use a boolean property for convenience..
> > >
> > > Not knowing what it does I would be careful.. I think we should
> > > actualy require a mandatory property, so all current dts select their
> > > behaviour explicitly. If we later find out what it does we could
> > > define a default behaviour by defining a boolean property. New dts
> > > simpler and old dts still happy. What do you think ?
> > >
> > > >
> > > > In a longer term, it'd be nice if such alignment between serializer and
> > > > de-serializer is handled in more scalable way.
> > > >
> > >
> > > Indeed :)
> > >
> > > Thanks
> > >   j
> > >
> > > > Thanks,
> > > > -hyun
> > > >
> > > > [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/3bd2dded834492f4ee89e370c22877b97c2e106e
> > > > [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fb0ad7fd699d90d6bbc78fc55dd98639389cfc5b
> > > > [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fe0b33b174b2850bf0bb25b3a367319127ae12ee
> > > >
