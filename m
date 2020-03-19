Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA7518AA2B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 02:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCSBHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 21:07:53 -0400
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com ([40.107.93.49]:6127
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726596AbgCSBHw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 21:07:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2zSM+RQZIItQ2VJxxhdVZP0SFHhQWdHYHPBxfjwxjtJvb4E9zBiRALaFex4YVpDIOgFrGSYjXgsjCPS6tK+28/eZQVzY/L8Fai6bQMJC63yvjJV+x3cDOH8/kUAqifzH/FuQH2fYUegkwNjaavzvFtwW9oQKyjZBDibhyEjWXJEW8HM8n4TWzLMHTZCaoNNL7ujfCGiPBnOgmOyCpsj6VIndUmPHnIPpSP20bkvlSwGfrLAz/2w+bJ85qVObTot9uQMHl58uKDjL887HUk05uqOpeIvd33HzsJSWZTMzjpry0EQfbAkOmwFJGhhSHzY8xM14z2yXl+0jqEKdObQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h38cnnooV9V6WkiSz7vCCCPizLZwJESNDapvrv8nnY=;
 b=oYjoPdYreJ46QaAEnP4dBg69wqSxdEZnSjLTwlpvwvI3np7xaf7oj2fTEbQhDrOUJrnX/rsRIGBk/y1Jdt6M4+T5vNtT7slwLBVlHx4lvTcv5gzURLzRTYhmd7son43kf2IxTgRb5AiOMgm346MXKv1QtYZgoDVJkd3O/5196PPaW1nYINZIdApLrJreC4h005vsWG0OAiBNJ9E0iremEhpV0aTh+GBu5xcaB8kJbUGzwpEFg+k/6FfTuRv8Vo4S2BsRs+M/yTPyS3janWFolFsdm/hXtX6cfhzKC/L/VLGKlczAvkwZ7J6JR0rWmx7VD6L24geyIkTkvRkf2hqQBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ragnatech.se smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h38cnnooV9V6WkiSz7vCCCPizLZwJESNDapvrv8nnY=;
 b=k//+ig+ht6vFwU7jMQjs6g2AVTYAcQFygNrBs65hwTUdX1e66G8tNS8otjs5gC3wLLo8isCVcLT9v+mPrAOo4M33Ubg0VzBRmeB+Njnm0a8pDiPsAYAo7Q82b+2v2VYBkQ3mxVIXh0eTIprSQlsSWd9g4Hz1S66uIBd1auo4rQ4=
Received: from CY4PR06CA0049.namprd06.prod.outlook.com (2603:10b6:903:13d::11)
 by BL0PR02MB4689.namprd02.prod.outlook.com (2603:10b6:208:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Thu, 19 Mar
 2020 01:07:48 +0000
Received: from CY1NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13d:cafe::71) by CY4PR06CA0049.outlook.office365.com
 (2603:10b6:903:13d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Thu, 19 Mar 2020 01:07:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT008.mail.protection.outlook.com (10.152.75.59) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Thu, 19 Mar 2020 01:07:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jEjf0-0002la-Q2; Wed, 18 Mar 2020 18:07:46 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jEjev-0007n5-Mw; Wed, 18 Mar 2020 18:07:41 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02J17ZWI020471;
        Wed, 18 Mar 2020 18:07:35 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jEjep-0007lV-E7; Wed, 18 Mar 2020 18:07:35 -0700
Date:   Wed, 18 Mar 2020 18:07:35 -0700
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
Message-ID: <20200319010734.GA27556@smtp.xilinx.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(199004)(46966005)(33656002)(70206006)(70586007)(44832011)(426003)(336012)(81166006)(54906003)(356004)(81156014)(316002)(186003)(966005)(8676002)(26005)(478600001)(4326008)(2906002)(9786002)(47076004)(8936002)(7416002)(5660300002)(6916009)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR02MB4689;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81aeaaf7-e875-4221-a781-08d7cba1f01a
X-MS-TrafficTypeDiagnostic: BL0PR02MB4689:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4689669BF0A31AF8095B4326D6F40@BL0PR02MB4689.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0347410860
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y5Sg2K9Nn+69Gg4cYs/0CLL4dQEhRIHusPZJfYCuAZti0W9MzefOfl34cHNkfokSI9KEhMiBYutdSBHJ6uMhYMVecEXoFE9bqX20NfpLg3Lh+mi/Ki244LMzQgrbBw8yNtL8BMmiqBDXqmPl20W+y3Yka+0ZC/l4xHUtHdIDAx3XnrIi4wB6ClvHcCsPrm0HsvcL/5h12vyIfw3RIPQt+VzGMg/OrWQ0yzqTs97TUjqMpU8eRBui7jhr6fBdH2qJ7/iJuZ7mrbfp8CSNRjxGnpXVrywb8LcdbHmjBSWVVDiSZq4gDF+alO1vOVybHp08ElVICyCEgJGUI07stHL+OyFCN+oX91gJvyazy1C7vrGLR6MRFzyj6jKDjJC0dtvlrmUK6opDgkLskyIZI7NRh35T3xhB/B/u98HI94FTSRFtxucyTLVDVp8cXEiK52qvJfaGwRuTbdNmchCg6jrSZioAgxY3N1iZxqAWmkS05a5wqtQmG9Tfr2ejwwJ+AJI00uillz01CWs3A0pksFme9Up/eNRtF/0eAnlLjtRQqtKXajPugzwbUVjqYL9FUABYIupK0LT2lud1y3oaU7IjKg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 01:07:47.2444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aeaaf7-e875-4221-a781-08d7cba1f01a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4689
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacobo,

On Sun, 2020-03-15 at 16:15:17 -0700, Jacopo Mondi wrote:
> Hello Hyun, Kieran,
>    it's great you are looking into this!
> 
> On Fri, Feb 28, 2020 at 10:13:04AM -0800, Hyun Kwon wrote:
> > Hi Kieran,
> >
> > Thanks for sharing a patch.
> >
> [snip]
> 
> > > > +
> > > > +	/*
> > > > +	 * Set the I2C bus speed.
> > > > +	 *
> > > > +	 * Enable I2C Local Acknowledge during the probe sequences of the camera
> > > > +	 * only. This should be disabled after the mux is initialised.
> > > > +	 */
> > > > +	max9286_configure_i2c(priv, true);
> > > > +
> > > > +	/*
> > > > +	 * Reverse channel setup.
> > > > +	 *
> > > > +	 * - Enable custom reverse channel configuration (through register 0x3f)
> > > > +	 *   and set the first pulse length to 35 clock cycles.
> > > > +	 * - Increase the reverse channel amplitude to 170mV to accommodate the
> > > > +	 *   high threshold enabled by the serializer driver.
> > > > +	 */
> > > > +	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
> > > > +	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
> > > > +		      MAX9286_REV_AMP_X);
> > > > +	usleep_range(2000, 2500);
> > > > +
> > > > +	/*
> > > > +	 * Enable GMSL links, mask unused ones and autodetect link
> > > > +	 * used as CSI clock source.
> > > > +	 */
> > > > +	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
> > > > +	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
> > > > +	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
> > > > +
> > > > +	/*
> > > > +	 * Video format setup:
> > > > +	 * Disable CSI output, VC is set according to Link number.
> > > > +	 */
> > > > +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> > > > +
> > > > +	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
> > > > +	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> > > > +		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
> > > > +		      MAX9286_DATATYPE_YUV422_8BIT);
> > > > +
> > > > +	/* Automatic: FRAMESYNC taken from the slowest Link. */
> > > > +	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
> > > > +		      MAX9286_FSYNCMETH_AUTO);
> > > > +
> > > > +	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> > > > +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> > > > +		      MAX9286_HVSRC_D14);
> >
> 
> I agree we need to make some of these configurable, we need that too
> to handle both rdacm20 and 21.
> 
> > Some of these configs in fact need some handshake between serializer and
> > de-serializer. For example, I had to invert vsync in serializer [3] to make
> > it work with this patch.
> 
> Quickly skamming through the datasheet I'm surprised there is no way
> to control the vsync input polarity and you have to go through the
> crossbar :) Oh well, I think this could be well controlled through a
> device property of the serializer, what do you think?
> 
> We have standard properties to control vsync and hsync polarities, but
> they're usually used for output signals, and I would reserve them for
> that future usage.. maybe a custom property to control the input vsync
> and hsync polarities would do...

Thanks for sharing pointers. These are not really hardened - static properties
so I'm not sure if device tree is the right place. I was thinking something
more similar to phy_configure_opts_mipi_dphy in phy subsystem.

> 
> >
> > In addition to that, I need a couple of additional programmings on max9286
> > (registers 0x0 to 0x63/0x64- disable overlap window and 0xf4 to 0x1c which
> > oddly change reserved bits) to get frames. The datasheet doesn't explain
> > enough for me to understand. I'm talking to Maxim to get more details and
> > see if those can be handled by serilizer driver.
> 
> I would be really interested in knowing what's the overlap window control
> about... it's very little detailed in the manual, I agree :) 0xf4 is
> not even documented in my version. I assume it's something related to
> fsync sync locking (Fig. 46) as I failed to achieve it without that
> setting. How did it fail for you ?
> 

I received one doc "Frame Synchronization Block" that explains the overlap
window in more details. It's essentially a window between camera vsync and
frame sync. If those 2 don't happen within the window, it errors out. So it
gives a validation check, but may not work depending on the vsync patterm from
camera or the window should be bigger, which makes the validation less
useful in my opinion.

I believe 0x1c has something to do with BWS as mentioned in my previous reply.
The max9286 on my board sets BWS pin as open, and it makes the bandwidth
to be 27 bit mode by default. So writing 0xf4 to 0x1c register sets to 24 bit
mode (while 0xf6 = 27 bit mode). But I didn't hear back from Maxim regarding 
this yet. And unfortunately, I couldn't make it work with 27 bit mode on both
max9286 and max96705.

So this and similar properties may also be something that can be handled by
the negotiating call mentioned above, while the configuraton through external
pins can be modeled as device tree properties?

Thanks,
-hyun

> On how to control overlap window a integer would do ? Setting it to 0
> disables it, so we could use a boolean property for convenience..
> 
> Not knowing what it does I would be careful.. I think we should
> actualy require a mandatory property, so all current dts select their
> behaviour explicitly. If we later find out what it does we could
> define a default behaviour by defining a boolean property. New dts
> simpler and old dts still happy. What do you think ?
> 
> >
> > In a longer term, it'd be nice if such alignment between serializer and
> > de-serializer is handled in more scalable way.
> >
> 
> Indeed :)
> 
> Thanks
>   j
> 
> > Thanks,
> > -hyun
> >
> > [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/3bd2dded834492f4ee89e370c22877b97c2e106e
> > [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fb0ad7fd699d90d6bbc78fc55dd98639389cfc5b
> > [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/fe0b33b174b2850bf0bb25b3a367319127ae12ee
> >
