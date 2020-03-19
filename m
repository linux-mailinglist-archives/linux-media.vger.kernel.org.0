Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96CC18AA2D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 02:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgCSBId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 21:08:33 -0400
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com ([40.107.223.88]:17472
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726596AbgCSBId (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 21:08:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJDZrlb7SoG8GyeMoTA6gs7gBAeNTQvIK42jOttdkflUdTprJQfy8Ow7mIIIqmdsoVMj6LKnK33wR2EuWRPv3QA54ntXwGTtWxdbdaYr7im6+l1zVDIm5FdabwbNjIMbbAta3wluDKgc0SgibbS+8HlSZvFJCsTuBu1aM7d32Z/WTWD6V3DWuO7TNKnjiGz8t0AzuPd6n6sP8u/JLCZXPf4WeUCioGaiwwHEt56iodxAZ2Z0PyPgHjS0WB//ry/GxpkFYVd40Vx53OOcJ11yvLxit3JkH/jhPkXFtRWN9Rgi8bx12Xm1fjJlf2hKc4eEBfAD+TdTEn1VJeYjlarqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ivuJwjqWfnofjuL5PxE4DSVGBksBE2d+naWSA1SFdQ=;
 b=IXoAOQelMRp4mwvXLWJ8n5gdI2aI2DlfnmjlV+7iiPPUkHDct/pIaxVPxHiAf1F+/0+wDwGbtd3IDWeESxcjAwVT3g5mylswiESVQivYI+CDGY/yZVXv9QTz2QNSgQnwSFrSTTh5Q1/TicYuRnOoSzZamY8xRKefy20C+MROTVgWFoJYI/z3L0/4ubCSIOwAtJfYdbVnZcyfHlV74u9O2tGh4C8pf7AtvdNTA0xnE3YFdNwR4jej7ji/FAdwwsOIlq0nQtxUWY5Z4EkwKVPrGsKlh9Ve6j3zZe9aTYFxr06bbCD/IyOjUVphl4YxGps7pcGYkOXnT1JUn6BrTCbLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ivuJwjqWfnofjuL5PxE4DSVGBksBE2d+naWSA1SFdQ=;
 b=Mz6NcQmk7+CmFUCEWspExVQFxZx0SmkISIZKb6roSGWJ311xaUWmulpliw8f/QufCA5U/aNHJF8YNuOEwVPcrQvKa2AoJ2Rr00jC0k3fJnu3sHAX0bA+x141ITQb9c/Oyn0QI00a8CXw7oZYqlCYqAS21XuBO3x6Xf9GsNW/cMs=
Received: from CY4PR08CA0038.namprd08.prod.outlook.com (2603:10b6:903:151::24)
 by MN2PR02MB6079.namprd02.prod.outlook.com (2603:10b6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Thu, 19 Mar
 2020 01:08:28 +0000
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:151:cafe::cd) by CY4PR08CA0038.outlook.office365.com
 (2603:10b6:903:151::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Thu, 19 Mar 2020 01:08:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Thu, 19 Mar 2020 01:08:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jEjff-0002lh-11; Wed, 18 Mar 2020 18:08:27 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jEjfZ-0007vO-Tv; Wed, 18 Mar 2020 18:08:21 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02J18Dos015650;
        Wed, 18 Mar 2020 18:08:14 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jEjfR-0007u7-Qe; Wed, 18 Mar 2020 18:08:13 -0700
Date:   Wed, 18 Mar 2020 18:08:13 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "niklas.soderlund@ragnatech.se" <niklas.soderlund@ragnatech.se>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyunk@xilinx.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: media: max9286: Add overlap window
Message-ID: <20200319010813.GB27556@smtp.xilinx.com>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-3-jacopo+renesas@jmondi.org>
 <c029c8b3-928b-24d0-777e-add1136bf051@ideasonboard.com>
 <20200318141939.wzn7tdaxpb4anyou@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318141939.wzn7tdaxpb4anyou@uno.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(199004)(46966005)(5660300002)(186003)(316002)(44832011)(54906003)(426003)(336012)(70586007)(70206006)(66574012)(4326008)(33656002)(1076003)(478600001)(966005)(81156014)(81166006)(8936002)(356004)(26005)(9786002)(6916009)(8676002)(53546011)(2906002)(47076004);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR02MB6079;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fd10ac8-9579-4550-eb4f-08d7cba20811
X-MS-TrafficTypeDiagnostic: MN2PR02MB6079:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6079CE353B99E283E59370E0D6F40@MN2PR02MB6079.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0347410860
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWUtcy4ZD2zI0pmhN84S3lVlBuXVJ9bdWXMBmUL5eS9rwm5LFssRZjhQ0UBLVX3c/b7D94GIaUYPS4vYmpIBJJVXn14N2O/mD7TFQD5RbEARUyzxLr/eO99JWAKE7dLgnrUjDztoVlDdYqRMrs+AIrVoFEVsyxWzibaXAnVAFZSWMMFHIpz/+q/3WtzQs+4GepIxPdYrES69rJOxeOmieHtVK1hYOlkoqD7lP2ZsQawQmTT4fckW/UVBpZsNfe/dneiQB8n8mkFbifTLMucmz4imwUQJAt4O1Drw9M7PObpec3QHpYoXeQCKt/OF/MRnnHilwjVGMocrEyQ5E1pFVQ2lc5/uX4boAYLvZcI3/G8Le5PcAb8WloRvcRKx8/5Ry3DTcKNKnR6Km2XqvvPiOvs7r9hg9CkVY8NW41Pj0fcxYekok2tVzEHa/mugL0Jvjza6tUzrM0z5DbA3ThqYD1DheIYrKq4X4JlU/8k0myve5Z1XoJbRWnQ1rdSlZ+h//t9HSkLEl8z3axERNK38tIod0Zh3I8+ZFhkTNMF2AE2AYjTHtcTm3UQPi2qLOMXrERms34hb//Lfd2F5EoYTEA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 01:08:27.4595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd10ac8-9579-4550-eb4f-08d7cba20811
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6079
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, 2020-03-18 at 07:19:39 -0700, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Wed, Mar 18, 2020 at 09:45:14AM +0000, Kieran Bingham wrote:
> > Hi Jacopo,
> >
> > On 16/03/2020 20:27, Jacopo Mondi wrote:
> > > The MAX9286 chip exposes a way to control the 'overlap window'
> > > parameter, most probably used in calculation of the frame
> > > synchronization interval.
> > >
> > > When used in conjunction with some serializers, the overlap window has to
> > > be disabled in order to correctly achieve frame sync locking.
> > >
> > > As the exact meaning of that control is not documented in the chip's
> > > manual, require all DTS users to specify the value of the window. When,
> > > and if, in future the meaning of control gets clarified and a default
> >
> > /in future/in the future/
> > /of control/of the control/
> >
> > > behaviour (window enabled or disabled) can be established, a new boolean
> > > property could supersede this one while being sure that older DTB are
> >
> > /DTB/DTBs/
> >
> > > fully specified to avoid confusion.
> > >
> > > Provide a few convenience macros for the window disabled and window
> > > default value.
> >
> > Well it's not the best solution (putting hardcode values into the DTB)
> > but I agree, without documentation these are almost 'magic values for
> > the hardware' which is unfortunate.
> 
> >
> > I do fear this may be the wrong place still though.
> >
> > This is dependent upon the 'serializer' connected, so is it a property
> > of the serializer that the max9286 should query at probe time to see
> > what it has connected?
> 
> I see two distinct issues here:
> 1) overlap window: this is really a property of the deserializer and
> should be here specified
> 2) reverse channel amplitude: this depends on the serializer
> configuration. we could make this a serializer property and have the
> deserializer read it from the remote end,  which, if I'm not
> mistaken is a no-go (not sure I recall why, but I refrained to do so
> as I recall it was considered bad practice).
> 
> This should work by ideally rewriting the deser properties when
> loading overlays, or simply configuring the deserializer correctly
> depending on which serializer is connected in your system. I don't see
> it working differently than any other endpoint property. If you have a
> parallel video port configured with an active high vsync polarity and
> you want to connect a camera with a low active signal state you should
> change you video input port ni your .dts or rewrite it with an overlay
> in case of dynamic loading.
> 
> >
> > But that's just back to the whole topic of bus-parameter negotiations
> > between the serializer and deserializer ...
> >
> 
> The real solution here would be to have operations to call on the
> remote to get the bus configuration and act accordingly...
> 
> I recently proposed
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=256127
> which works on remote pads though, and we have one pad per gmsl
> channel, while this should be queried from the device. Yes we can bend
> this to interrogate the remote side on the first connected channel and
> ignore the pad argument in the callee, but maybe we can do better than
> proposing an API and working it around immediately ? :)
> 

What should be worked around here? To me, this seems better solution than
device tree because those are not really hardened properties, and some even
have to be passed between ser - deser. So adding a gmsl config to the pad
config would do, correct? I can (and would like to) try that out if you don't
ee any obvious issue. :-)

Thanks,
-hyun

> >
> > But with this solution, any dtb segment or overlay for the serializer
> > needs to modify the max9286 depending on it's requirements ... that
> > feels a bit odd. Possible, I think, but odd.
> 
> Really not someone with any dt overlay experience here, but re-writing
> properties of nodes defined in the DTS seems like an intentended
> feature of overlays... Is anyone with more experience listenting (says
> Jacopo looking at Geert ?)
> 
> Thanks
>    j
> >
> > Do we have any precedence in existing DT to reference on this topic?
> >
> >
> >
> >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/maxim,max9286.yaml  | 11 +++++++++++
> > >  MAINTAINERS                                           |  1 +
> > >  include/dt-bindings/media/maxim-gmsl.h                |  9 +++++++++
> > >  3 files changed, 21 insertions(+)
> > >  create mode 100644 include/dt-bindings/media/maxim-gmsl.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > index f9d3e5712c59..ee8e0418b3f0 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > @@ -46,6 +46,14 @@ properties:
> > >      description: GPIO connected to the \#PWDN pin with inverted polarity
> > >      maxItems: 1
> > >
> > > +  # Until the overlap window control gets not clarified, require dts
> > > +  # to set its value explicitly,
> > > +  maxim,overlap-window:
> > > +    description: Overlap window duration, in pixel clock cycles.
> > > +    maxItems: 1
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > >    ports:
> > >      type: object
> > >      description: |
> > > @@ -146,6 +154,7 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > +  - maxim,overlap-window
> > >    - ports
> > >    - i2c-mux
> > >
> > > @@ -154,6 +163,7 @@ additionalProperties: false
> > >  examples:
> > >    - |
> > >      #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/media/maxim-gmsl.h>
> > >
> > >      i2c@e66d8000 {
> > >        #address-cells = <1>;
> > > @@ -166,6 +176,7 @@ examples:
> > >          reg = <0x2c>;
> > >          poc-supply = <&camera_poc_12v>;
> > >          enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
> > > +        maxim,overlap-window = MAX9286_OVLP_WINDOW_DISABLED;
> > >
> > >          ports {
> > >            #address-cells = <1>;
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 21a9ff4fe684..3d2455085c80 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10190,6 +10190,7 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +F:	include/dt-bindings/media/maxim-gmsl.h
> > >  F:	drivers/media/i2c/max9286.c
> > >
> > >  MAX9860 MONO AUDIO VOICE CODEC DRIVER
> > > diff --git a/include/dt-bindings/media/maxim-gmsl.h b/include/dt-bindings/media/maxim-gmsl.h
> > > new file mode 100644
> > > index 000000000000..47945ffc3a4d
> > > --- /dev/null
> > > +++ b/include/dt-bindings/media/maxim-gmsl.h
> > > @@ -0,0 +1,9 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
> > > +#define _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
> > > +
> > > +/* MAX9286 default overlap values. */
> > > +#define MAX9286_OVLP_WINDOW_DISABLED	<0>
> > > +#define MAX9286_OVLP_WINDOW_DEFAULT	<0x1680>
> > > +
> > > +#endif /* _DT_BINDINGS_MEDIA_MAXIM_GMSL_H */
> > >
> >
