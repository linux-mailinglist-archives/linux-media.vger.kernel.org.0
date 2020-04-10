Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE591A3D59
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 02:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgDJA3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 20:29:23 -0400
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com ([40.107.93.45]:40224
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726917AbgDJA3X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 20:29:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7jE+5T4T62wK7fPqiovMi9zz3L3Bn0kOMRDC57qtLqa/367ewdCXz73fiaBM/NIy8FOsnKcRoKki5IG4KTFmQKLfRiHM/kc+t+rOcxISNKLV8KsUFAR7A4wKrameq4Wc5a+5IK5rzSAd+k7F4mhA7aohrH0vciYKwGoy5kXjliTvfDXYFaibc3xUQsiqn8u/lc6cn5xDgn1kgM3mUBMeq8GdV4FKSDO4dT5wh0krlePkwA8CW+veXU7ah8D56r++cGNiJXnR8PaHcCYNUufq9Brc7AjLxLoVuyWBD3fBJO0Hx0/IcA/hvn3TjCr3CMThFS9/p8e9WPwlVwWVKew1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqbIMvWgo4UekbazKu//CXogitQ1WGSskM1HoFBMKhE=;
 b=iCkwkrrx2exr2ofiK6PQghkE+LRgd130n1Q4XMTD4hnNz/X5VirWPvJw366uljIxKk2VXPQ+/bQBn2COQ1uOT1l7uJLMNFvvqwwfhAhgR5O3v6XjysaF24HWaULCMtkY00EKwIYm13+k/QdnyH4OPwL0MkN5ZEaOZwEukqS1Rl6g90OqPLc0Ky0KUCNZjBxfG/qIGlu3rejhq9KH3sdFbNR4MthEPHaLLL78z1CWNIA7+rWECQXL0+edo+YHvpbyXSB5Khc2bmzkmGfgyR+l9s6GVU2ztLbEQzFCl3QCCOgG3doAhyUGu5b1RWzKdpTMkxKudt/3lCIRM9HFE0zXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ragnatech.se smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqbIMvWgo4UekbazKu//CXogitQ1WGSskM1HoFBMKhE=;
 b=lXKvNfKEiawm4dUsokiBBSlMSEe6GdhSk5FOuEv8MDAqlhLWx9gbOs9+tbqMo+raphFuaW8gx4RilGduWgBw4HIy/s9SHQz3KQ6y9zF3+aDCvBUHfKgPSlCYyxMvDDBmTeL+469y27Q8YRHP0LDdXDjWx2n1WjO65ueCD97VUZM=
Received: from CY4PR14CA0042.namprd14.prod.outlook.com (2603:10b6:903:101::28)
 by BN6PR02MB2675.namprd02.prod.outlook.com (2603:10b6:404:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 10 Apr
 2020 00:29:18 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:101:cafe::da) by CY4PR14CA0042.outlook.office365.com
 (2603:10b6:903:101::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Fri, 10 Apr 2020 00:29:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 00:29:18
 +0000
Received: from [149.199.38.66] (port=47058 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMhXO-0001MS-RE; Thu, 09 Apr 2020 17:28:50 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMhXp-0003My-UX; Thu, 09 Apr 2020 17:29:17 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03A0T92j019910;
        Thu, 9 Apr 2020 17:29:09 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jMhXh-0003Lu-He; Thu, 09 Apr 2020 17:29:09 -0700
Date:   Thu, 9 Apr 2020 17:29:09 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <20200410002908.GA3396@smtp.xilinx.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
 <20200319010734.GA27556@smtp.xilinx.com>
 <20200319084557.v5hw54mmw4swzwly@uno.localdomain>
 <20200319232003.GA20549@smtp.xilinx.com>
 <20200326011251.GA9997@smtp.xilinx.com>
 <20200408135237.tmqiqjogokj5kcbb@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200408135237.tmqiqjogokj5kcbb@uno.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(316002)(81166007)(9786002)(6916009)(4326008)(336012)(54906003)(1076003)(26005)(186003)(8936002)(356005)(47076004)(70206006)(2906002)(44832011)(8676002)(5660300002)(82740400003)(478600001)(426003)(70586007)(33656002)(81156014)(966005)(7416002)(42866002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f2bd253-2aed-4727-2103-08d7dce634cd
X-MS-TrafficTypeDiagnostic: BN6PR02MB2675:
X-Microsoft-Antispam-PRVS: <BN6PR02MB26751DCEE4B0EEE64D16EF54D6DE0@BN6PR02MB2675.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0369E8196C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bq/WV0FNBDQJLIQMNcM9SJVhyuD9pclT7YW16ZEGfrbxHn0qkC892jS8ugb+i0fGxYJrPujliqfB2X0Ey6JXkmZhjxlnpOQ1dWP4JrOKKT0OcVO7Sf0TaSzDZaFW29IU2c8bRCjR2A7iyPvJu9/RuHSaVE3wpHsfWzwwJOHursJ8B6qF/PErstRYneNWm9mOTpeXrYm9nCtop0gq5OOqHhBhxV7C0NC4jJHLyAEsQjnJNI785Gdc4MdMVncBIFEIfbZureUREh1IdIMUcdqde2tMfzVjIsP9ivfawqqSvMWbinpu8CckXB2AqI+GeKzHm2OtzqUbcZVnyWG+9dQp0ig3/5Y/Imio1uK8pWJvy5jmaqHRe31fiVW9oIrXb5PzlZs+ON+CLLCw3toCS5+56iwt4vZM4N7RfV8J7E1mVYUn7ellQ9on8UJGN2Q4d/pxBBvQ2GkoEpXXFWMkD2lVrD6UoZsLcA4nD72h1IOjvFG2RWJQsveL21d0uANlHWPS47AnHpe/+bOt8IJREeAlGI1nlXioXTzGBaQXn7Q4VwR0eZDYVheL/MESCl58jN/j+wxnElf3CvtCCKlAnHZqdhJjl/IMBJFItPECeVicRc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 00:29:18.2461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2bd253-2aed-4727-2103-08d7dce634cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2675
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, 2020-04-08 at 06:52:37 -0700, Jacopo Mondi wrote:
> Hi Hyun,
>    sorry for the very late reply :(
> 
> On Wed, Mar 25, 2020 at 06:12:53PM -0700, Hyun Kwon wrote:
> > Hi Jacopo,
> >
> > On Thu, 2020-03-19 at 16:20:05 -0700, Hyun Kwon wrote:
> > > Hi Jacopo,
> > >
> > > On Thu, 2020-03-19 at 01:45:57 -0700, Jacopo Mondi wrote:
> > > > Hi Hyun,
> > > >
> > > > On Wed, Mar 18, 2020 at 06:07:35PM -0700, Hyun Kwon wrote:
> > > > > Hi Jacobo,
> > > > >
> > > > > On Sun, 2020-03-15 at 16:15:17 -0700, Jacopo Mondi wrote:
> > > > > > Hello Hyun, Kieran,
> > > > > >    it's great you are looking into this!
> > > > > >
> > > > > > On Fri, Feb 28, 2020 at 10:13:04AM -0800, Hyun Kwon wrote:
> > > > > > > Hi Kieran,
> > > > > > >
> > > > > > > Thanks for sharing a patch.
> > > > > > >
> 
> [snip]
> 
> > > > Which case are you trying to address ?
> > > >
> > >
> > > My case is simpler in fact :-), hence the executive summary is,
> > > The sensor vsync signal is active high, and it passes through the serializer.
> > > Since the vsync is already inverted in de-serializer by this patch, expecting
> > > active low, I'm inverting it again in serializer to match.
> > >
> > > 	sensor -- (vsync active high) --> serializer -- (vsync active low) --> de-serializer
> > >
> > > If the vsync inversion becomes a device tree property of max9286, the property
> > > value will have to align with polarity of vsync source. In my case, I can
> > > disable the inversion knowing the sensor vsync is active high. But in other
> > > cases, such chain can be quite deep and may be inconvinient for users to check.
> > >
> > > Another one is the BWS setting, which is just between ser and de-ser.
> > >
> > > With mbus_get_config() operation, the problem can be isolated nicely in
> > > my opinion, and the solution handles all above and scales better.
> > > - The de-serializer checks the vsync polarity of all channels using GMSL
> > >   config. If all are active low, invert the vsync (if it can)
> > >
> > > 	vsync_bitmap = 0;
> > > 	for(chan : channels) {
> > > 		config = get_mbus_config(chan);
> > > 		if (config->type != gmsl)
> > > 			error;
> > >
> > > 		if (config->gmsl.vsync == +)
> > > 			vsync_bitmap |= << chan->chan_id;
> > > 	}
> > >
> > > 	if (vsync_bitmap == (1 << channels.size() - 1))
> > > 		nop(); // all active high. don't invert
> > > 	else if (vsync_bitmap == 0)
> > > 		invert_vsync(ser);
> > > 	else
> > > 		error;
> > >
> > > - The serializer checks vsync polarity in the parallel port config, and
> > >   if it's active low (and if it can), invert to make it active high.
> > >   Otherwise mark it in GMSL config, so the de-serializer can hanle.
> > >
> > > 	max96705_get_mbus_config()
> > > 	{
> > > 		config = get_mbus_config(sensor);
> > > 		if (config->type != parallel)
> > > 			error;
> > >
> > > 		if (config->parallel.vsync == -) {
> > > 			if (invert_vsync(ser))
> > > 				ser_config->gmsl.vsync = +;
> > > 			else
> > > 				ser_config->gmsl.vsync = -;
> > > 		}
> > >
> > > 		return ser_config;
> > > 	}
> > >
> > > The same can be used for bandwidth setting. The max96705 driver sets 24 bit
> > > mode only as supported bandwidth. The deserializer driver can pick it up from
> > > mbus_get_config(), and adjust its own config accordingly. It will need some
> > > remote node handling in each driver, but seems worth to me.
> > >
> > > This became too lengthy! Hope it explains better and aligns with your thought,
> > > described in other thread. I will give it a try too!
> > >
> >
> > And I got a chance to try.
> 
> Thank you!
> 
> > - used the mbus config for sync between devices. Ex, vsync inversion in [1]
> > [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/a1d812c0452905a644d83f715c43e91ade11b266
> 
> 
> So, I understand this works well in practice and I'm happy about it,
> but I wonder if, now that we have clarified this controls is a static[1]
> settings between serializer and deserializer, this should not be
> better expressed with the standard DT property 'vsync-active'. It has
> to be specified to the same value in both remote and local sides, but
> that's nothing new..
> 
> I know you're in favor of having them as dynamic configurations
> retrieved through get_mbus_config(), and since we know there are more
> gmsl specific parameter to negotiate I'm not opposed to that. This would
> ease use cases as in [1] also.
> 
> I know Sakari might have different opinions, and looking at you patch
> in 3) I understand why: we might end up replicating most dt-properties
> in get_mbus_config(). Sincerely it's not a show-stopper to me, but
> I'll cc him and ask for his opinion first.
> 
> [1] With "static" I mean "it does not change at runtime". Of course in
> cases you have to change the remote serializer at run-time, having it
> retrieved through a pad operation is much easier, but that's a very
> advanced and tricky use case which also involves dt-overlay loading
> and other funny things. Luca has a use case, I'll cc him here for
> reference.
> 
> > - made the overlap window of max9286 as a control in [2]
> > [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/c3d55a9e0a8d2b67f27996529582bb7cfa551b6a
> 
> 
> Nice! My idea of having it coming from DT was bit moot, if this should
> be configured dynamically, a control is probably better.
> 
> What do you think if we try to merge max9286 driver with overlap window
> defaulted to 0 (we're testing this configuration with our cameras, we
> know for your cameras is ok) and then you could send this patch on top
> ?
> 
> > - some other configs using the mbus config in [3]
> > [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commits/hyunk/vision-wip-5.4-next
> 
> Great work, but I feel like I have the same questions as I have for
> vsync. Are these dynamic properties worth negotiating at run-time, or
> are those better expressed as DT properties ?
> 
> This is indeed a GMSL property the could be specified in both the
> deserializer and serializer device nodes:
> https://github.com/xlnx-hyunkwon/linux-xlnx/commit/016ade9a500b30bbd58571c47a94e95ccc40ec0a
> 
> This is indeed the bit endianess of the parallel bus
> ie [b0 b1 b2 b3 b4 b5 b6 b7] vs [b7 b6 b5 b4 b3 b2 b1 b0]
> and I'm surprised we don't have it already as a standard DT property
> https://github.com/xlnx-hyunkwon/linux-xlnx/commit/1f0fd7bf0c5149b1d735b795818f5812d4959d9a
> 
> I have a use cases for the reverse channel amplitude that could be add
> there and I already tried to express it through a DT property:
> https://patchwork.kernel.org/patch/11441269/
> https://patchwork.kernel.org/patch/11441273/
> 
> Something more to think about...
> 
> > Let me know if this aligns with your thought.
> 
> My thoughts are confused :)
> 
> going for dynamic configuration through get_mbus_config() could help
> use cases where the serializer are changed at run-time.
> 
> Although, abusing it might end up replicating most DT properties
> like in the vsync case.
> 
> Let's see if we get Sakari's input.
> 
> Thanks for your work and sorry for the long delay
> 

No problem, and thanks for sharing pointers! I'm getting to understand your
points better, and I may have to stop confusing you anymore. :-) Yes, I'm
still in favor of mbus config because those can change at runtime in theory
(ex, polarities change with programming register bits), but in reality it may
be unlikely to change dynamicaly from one to other at runtime.

Thanks,
-hyun

