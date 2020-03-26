Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C33A19352E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 02:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbgCZBNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 21:13:07 -0400
Received: from mail-dm6nam11on2043.outbound.protection.outlook.com ([40.107.223.43]:46945
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727539AbgCZBNH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 21:13:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grG4GSTUzSCZb5zo1NoKRX0rwU2EgMMWgDtKcrMXgjZs6cj/aqtI3t5lO0ZxXqvXGrLce7lLGcWuyB4xCu1QNCVVSEQYqWHBEWDniF/M9lcAqSiwsaekE2mwcWu4iK0/Lz7zIGWNYcNpRvQOjvpkc/4+Zf2OLgqFu1dhvuEcLQDg+a3oZrduMGOCn1c7MBhNBdQNPM8sH3HYgYG4XN3FWSVxpZqgf6BCjmBAfL+FAnDB8/n3no/QHN/pZVKVdymKjnxbCl+hZk6CFT5dK3ZnYErHr/XOn9boi7I9WI9ohaXZm2HGUjorsnfDLPnvzPIw7RV3h6MwKM2bquraVZBLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BifAIRKDrq7unZuCNxhIO/2TgFXdTEbK6JLlH+QC+M0=;
 b=AcIJadePHHTHDL/ijg/4pxdNLaR8frTA417p/ZJJAG2CE+EzsaIZeNrbHyNUSrhTt2Nqp+n2N4SDkcjocZ6Gj68rW2RBH0N+oqQO/MADwYVrqNG8p9mRHryBTWkTbFOWX1TZCBubbaEX+/qt5BgtkOorS9Atdcxizp5EQfYnRPXGJ2gBQ8G+NW32MD9UDBaWBXX28ITEx5uvW9ArO3msTKQ7ko1DBnqwChBGjdhQFooHJxapSMJ/IicB6JtjKoEbkdjREs33K9umgeKMlUj4vJ0NiqemI4M4nuQiELSWq8QEfXkvZZh8jZxK0YuiD2reElgNT37hUkyE/0x4Uh/6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ragnatech.se smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BifAIRKDrq7unZuCNxhIO/2TgFXdTEbK6JLlH+QC+M0=;
 b=F5ju0YL0Vugnsopzg2xkUMoO0U1K7oS+DZkyhSylNXXTi26vVTYFZCNpEfd+zAoozZX05JTJblNy6fP0tPD3FuqSIX5LNShmcleew1ugxCEY7fkCqoemnMFrk+Zyj9IuZBcLfFGemupckufVyXjGjY27Uj8pD50DOuIN/35fv+w=
Received: from SN6PR16CA0070.namprd16.prod.outlook.com (2603:10b6:805:ca::47)
 by DM6PR02MB4218.namprd02.prod.outlook.com (2603:10b6:5:a0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Thu, 26 Mar
 2020 01:13:03 +0000
Received: from SN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:ca:cafe::e8) by SN6PR16CA0070.outlook.office365.com
 (2603:10b6:805:ca::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.21 via Frontend
 Transport; Thu, 26 Mar 2020 01:13:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT017.mail.protection.outlook.com (10.152.72.115) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Thu, 26 Mar 2020 01:13:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jHH4w-0006z2-6S; Wed, 25 Mar 2020 18:13:02 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jHH4r-0007wv-30; Wed, 25 Mar 2020 18:12:57 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02Q1Crcc022555;
        Wed, 25 Mar 2020 18:12:53 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jHH4n-0007wl-56; Wed, 25 Mar 2020 18:12:53 -0700
Date:   Wed, 25 Mar 2020 18:12:53 -0700
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
Message-ID: <20200326011251.GA9997@smtp.xilinx.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
 <20200319010734.GA27556@smtp.xilinx.com>
 <20200319084557.v5hw54mmw4swzwly@uno.localdomain>
 <20200319232003.GA20549@smtp.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319232003.GA20549@smtp.xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39850400004)(396003)(46966005)(9786002)(82740400003)(1076003)(8936002)(316002)(4326008)(70206006)(70586007)(33656002)(2906002)(54906003)(966005)(356004)(5660300002)(30864003)(47076004)(336012)(6916009)(44832011)(81166006)(81156014)(186003)(8676002)(7416002)(426003)(26005)(478600001)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4218;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c241716-88ea-401d-c217-08d7d122d4f3
X-MS-TrafficTypeDiagnostic: DM6PR02MB4218:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4218E88981BB35E4950E9552D6CF0@DM6PR02MB4218.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0354B4BED2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfJK6ewynEntHJRyfFq+huyX6v0ClbjM4jk4dHGVBBky+NAMjyZ/J3fZ+ExKL8eOStEXV0CtWl7fYVU7zTeJjuH55nzReyOQM6UjzF+32nCNUsyr26/aRKc9s4aYDU5gMqhjk95SznRnbT6h7gDsg1IDE03LGCOpgzxl6Tj6vqZXBzVGJ5Lb7Pi4HknnHXfTguxlbjl5pdUeMNqWCD07Cd5A0bE7DZljIHqP6mypnQVx92PNg0DeEVak3JcXfgo5V/xUSDw6s3vgswHDy+XNtTouSFrfLy02zi1dOfPNlA8VGKROALWdpfbo4rJZSE1wF+SrcJFANv1GCNGD22s3NWLrLoQJlTXryurVwVdWYmAzH0C+ExAUUOpDsTu8ikStMOJLmZEvDYvsgFeeu1S2bVRDv/sjXz1U0c7bO2vyvhvgsQOOiN73xxp45VAMIzoewNOjiRa5aUNpTBVSYFFtYYB/2jvjLUdbBvgp7NkT2F4UN0ag/q/8SJSh7IPp8FWWmXAya2APohSDt4n0Cyx4kJhj3OpVGyUu4EpNtdLh34vqyp2dWumWch0BI0YofOdVJqEoM1QyfQGzWG2pSW49EEyYWYsYa4If2hWldwN1zo8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 01:13:02.6203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c241716-88ea-401d-c217-08d7d122d4f3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4218
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, 2020-03-19 at 16:20:05 -0700, Hyun Kwon wrote:
> Hi Jacopo,
> 
> On Thu, 2020-03-19 at 01:45:57 -0700, Jacopo Mondi wrote:
> > Hi Hyun,
> > 
> > On Wed, Mar 18, 2020 at 06:07:35PM -0700, Hyun Kwon wrote:
> > > Hi Jacobo,
> > >
> > > On Sun, 2020-03-15 at 16:15:17 -0700, Jacopo Mondi wrote:
> > > > Hello Hyun, Kieran,
> > > >    it's great you are looking into this!
> > > >
> > > > On Fri, Feb 28, 2020 at 10:13:04AM -0800, Hyun Kwon wrote:
> > > > > Hi Kieran,
> > > > >
> > > > > Thanks for sharing a patch.
> > > > >
> > > > [snip]
> > > >
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Set the I2C bus speed.
> > > > > > > +	 *
> > > > > > > +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
> > > > > > > +	 * only. This should be disabled after the mux is initialised.
> > > > > > > +	 */
> > > > > > > +	max9286_configure_i2c(priv, true);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Reverse channel setup.
> > > > > > > +	 *
> > > > > > > +	 * - Enable custom reverse channel configuration (through register 0x3f)
> > > > > > > +	 *   and set the first pulse length to 35 clock cycles.
> > > > > > > +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> > > > > > > +	 *   high threshold enabled by the serializer driver.
> > > > > > > +	 */
> > > > > > > +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > > > > > > +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> > > > > > > +		      MAX9286_REV_AMP_X);
> > > > > > > +	usleep_range(2000, 2500);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Enable GMSL links, mask unused ones and autodetect link
> > > > > > > +	 * used as CSI clock source.
> > > > > > > +	 */
> > > > > > > +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> > > > > > > +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> > > > > > > +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Video format setup:
> > > > > > > +	 * Disable CSI output, VC is set according to Link number.
> > > > > > > +	 */
> > > > > > > +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> > > > > > > +
> > > > > > > +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> > > > > > > +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> > > > > > > +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> > > > > > > +		      MAX9286_DATATYPE_YUV422_8BIT);
> > > > > > > +
> > > > > > > +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> > > > > > > +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> > > > > > > +		      MAX9286_FSYNCMETH_AUTO);
> > > > > > > +
> > > > > > > +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> > > > > > > +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> > > > > > > +		      MAX9286_HVSRC_D14);
> > > > >
> > > >
> > > > I agree we need to make some of these configurable, we need that too
> > > > to handle both rdacm20 and 21.
> > > >
> > > > > Some of these configs in fact need some handshake between serializer and
> > > > > de-serializer. For example, I had to invert vsync in serializer [3] to make
> > > > > it work with this patch.
> > > >
> > > > Quickly skamming through the datasheet I'm surprised there is no way
> > > > to control the vsync input polarity and you have to go through the
> > > > crossbar :) Oh well, I think this could be well controlled through a
> > > > device property of the serializer, what do you think?
> > > >
> > > > We have standard properties to control vsync and hsync polarities, but
> > > > they're usually used for output signals, and I would reserve them for
> > > > that future usage.. maybe a custom property to control the input vsync
> > > > and hsync polarities would do...
> > >
> > > Thanks for sharing pointers. These are not really hardened - static properties
> > > so I'm not sure if device tree is the right place. I was thinking something
> > > more similar to phy_configure_opts_mipi_dphy in phy subsystem.
> > 
> > Let's take a step back, as it seems I was confused as well.
> > 
> > Not knowing the device, I can only guess on why you need to invert
> > the input VSYNC signal in the cross-bar. I see two options:
> > 
> > 1) Looking at Figure 1 (Functional block diagram) the sensor vsync signal
> > is fed to the video timing generation circtuit. The cross-bar switch
> > comes after the timing generation circuit, and inverting vsync there
> > is then equivalent to invert the vsync output of the timing generation
> > block. If that's the case, instead of going through the crossbar,
> > the same result can be obtained by setting the VSYNC_INV bit of
> > register cxtp (0x4d[3]). If that's the case, I agree this setting
> > should be negotiated between ser/desr, as the VS_OUT signal in Figure
> > 18 is inverted in the serialized byte stream. Is this the case ?
> > 
> > 2) Alternatively, you need to invert the input vsync polarity to trigger
> > the timing generation circuit. This mean vsync is inverted -before-
> > being fed to timing generation, and this was my first understanding,
> > as I assumed the crossbar switch come -before- the timing generation
> > circtuitry. If this is the case, this setting should not be negotiated
> > between ser/deser but between the serializer and the connected camera
> > sensor.
> > 
> > Which case are you trying to address ?
> > 
> 
> My case is simpler in fact :-), hence the executive summary is,
> The sensor vsync signal is active high, and it passes through the serializer.
> Since the vsync is already inverted in de-serializer by this patch, expecting
> active low, I'm inverting it again in serializer to match.
> 
> 	sensor -- (vsync active high) --> serializer -- (vsync active low) --> de-serializer
>     
> If the vsync inversion becomes a device tree property of max9286, the property
> value will have to align with polarity of vsync source. In my case, I can
> disable the inversion knowing the sensor vsync is active high. But in other
> cases, such chain can be quite deep and may be inconvinient for users to check.
> 
> Another one is the BWS setting, which is just between ser and de-ser.
> 
> With mbus_get_config() operation, the problem can be isolated nicely in
> my opinion, and the solution handles all above and scales better.
> - The de-serializer checks the vsync polarity of all channels using GMSL
>   config. If all are active low, invert the vsync (if it can)
> 
> 	vsync_bitmap = 0;
> 	for(chan : channels) {
> 		config = get_mbus_config(chan);
> 		if (config->type != gmsl)
> 			error;
> 
> 		if (config->gmsl.vsync == +)
> 			vsync_bitmap |= << chan->chan_id;
> 	}
> 
> 	if (vsync_bitmap == (1 << channels.size() - 1))
> 		nop(); // all active high. don't invert
> 	else if (vsync_bitmap == 0)
> 		invert_vsync(ser);
> 	else
> 		error;
> 
> - The serializer checks vsync polarity in the parallel port config, and
>   if it's active low (and if it can), invert to make it active high.
>   Otherwise mark it in GMSL config, so the de-serializer can hanle.
> 
> 	max96705_get_mbus_config()
> 	{
> 		config = get_mbus_config(sensor);
> 		if (config->type != parallel)
> 			error;
> 
> 		if (config->parallel.vsync == -) {
> 			if (invert_vsync(ser))
> 				ser_config->gmsl.vsync = +;
> 			else
> 				ser_config->gmsl.vsync = -;
> 		}
> 
> 		return ser_config;
> 	}
> 
> The same can be used for bandwidth setting. The max96705 driver sets 24 bit
> mode only as supported bandwidth. The deserializer driver can pick it up from
> mbus_get_config(), and adjust its own config accordingly. It will need some
> remote node handling in each driver, but seems worth to me.
> 
> This became too lengthy! Hope it explains better and aligns with your thought,
> described in other thread. I will give it a try too!
> 

And I got a chance to try.
- used the mbus config for sync between devices. Ex, vsync inversion in [1]
- made the overlap window of max9286 as a control in [2]
- some other configs using the mbus config in [3]
Let me know if this aligns with your thought.

Thanks,
-hyun

[1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/a1d812c0452905a644d83f715c43e91ade11b266
[2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/c3d55a9e0a8d2b67f27996529582bb7cfa551b6a
[3] https://github.com/xlnx-hyunkwon/linux-xlnx/commits/hyunk/vision-wip-5.4-next


> Thanks,
> -hyun
> 
> > >
> > > >
> > > > >
> > > > > In addition to that, I need a couple of additional programmings on max9286
> > > > > (registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
> > > > > oddly change reserved bits) to get frames. The datasheet doesn't explain
> > > > > enough for me to understand. I'm talking to Maxim to get more details and
> > > > > see if those can be handled by serilizer driver.
> > > >
> > > > I would be really interested in knowing what's the overlap window control
> > > > about... it's very little detailed in the manual, I agree :) 0xf4 is
> > > > not even documented in my version. I assume it's something related to
> > > > fsync sync locking (Fig. 46) as I failed to achieve it without that
> > > > setting. How did it fail for you ?
> > > >
> > >
> > > I received one doc "Frame Synchronization Block" that explains the overlap
> > > window in more details. It's essentially a window between camera vsync and
> > > frame sync. If those 2 don't happen within the window, it errors out. So it
> > > gives a validation check, but may not work depending on the vsync patterm from
> > > camera or the window should be bigger, which makes the validation less
> > > useful in my opinion.
> > 
> > Thanks for the detailed info!
> > 
> > This reinforces the idea this setting should be disabled by default.
> > If we want to enable it, a value should be provided explicitly. I
> > still think DTS are the right place for this setting, as this is a
> > deserializer-only configuration parameter..
> > 
> > >
> > > I believe 0x1c has something to do with BWS as mentioned in my previous reply.
> > > The max9286 on my board sets BWS pin as open, and it makes the bandwidth
> > > to be 27 bit mode by default. So writing 0xf4 to 0x1c register sets to 24 bit
> > > mode (while 0xf6 = 27 bit mode). But I didn't hear back from Maxim regarding
> > > this yet. And unfortunately, I couldn't make it work with 27 bit mode on both
> > > max9286 and max96705.
> > >
> > > So this and similar properties may also be something that can be handled by
> > > the negotiating call mentioned above, while the configuraton through external
> > > pins can be modeled as device tree properties?
> > 
> > Indeed external pin configuration fits well as DTS property. Would you
> > like to have a go ?
> > 
> > Thanks
> >    j
> > 
> > >
> > > Thanks,
> > > -hyun
> > >
> > > > On how to control overlap window a integer would do ? Setting it to 0
> > > > disables it, so we could use a boolean property for convenience..
> > > >
> > > > Not knowing what it does I would be careful.. I think we should
> > > > actualy require a mandatory property, so all current dts select their
> > > > behaviour explicitly. If we later find out what it does we could
> > > > define a default behaviour by defining a boolean property. New dts
> > > > simpler and old dts still happy. What do you think ?
> > > >
> > > > >
> > > > > In a longer term, it'd be nice if such alignment between serializer and
> > > > > de-serializer is handled in more scalable way.
> > > > >
> > > >
> > > > Indeed :)
> > > >
> > > > Thanks
> > > >   j
> > > >
> > > > > Thanks,
> > > > > -hyun
> > > > >
> > > > > [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/3bd2dded834492f4ee89e370c22877b97c2e106e
> > > > > [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fb0ad7fd699d90d6bbc78fc55dd98639389cfc5b
> > > > > [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fe0b33b174b2850bf0bb25b3a367319127ae12ee
> > > > >
