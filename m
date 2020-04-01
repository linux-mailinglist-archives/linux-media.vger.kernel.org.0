Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E24419B867
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 00:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733101AbgDAWai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 18:30:38 -0400
Received: from mail-dm6nam10on2048.outbound.protection.outlook.com ([40.107.93.48]:6044
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732385AbgDAWai (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 18:30:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSlCNlQVQnVXi3ddkzfED2Gz5W41kyhLfA3niZb9vM6fJUMzaaok2pJp95Bg10VAvlCu9tNetqyxLQPeVDLouKkuRGskq1rCC1N4ClJeQMQzjDmiJf02S++H8nlyI2U+xVrStqQUsWrEYIWw6KmJs2sam25OxyUcWVy05rX0na52EVO1N1c2UwYe9GyYDWO7Qed9UDsd+MfUx9BLDeuURhCt6afkifMeB6Ryk0vE6CM1LKiExHaNNjUJJQzfvE5We9owv3AKJWPWNx10qrGCBovGeixtLLcaXYr1I5ZpaU3Ec1ZyWHkSBwqXLcHX7TeH2FB0TLzMNF7Q8DLhFTgIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssx+JkEkTRMGox5PWW5SJQETy/ZX+165UzzwX4W6lqY=;
 b=cTtKcPLIFx/q27F4fjunPOQ/q2bGLTiP2SWPpy6jTmmOfgF3NY4DnwIOZ4E2gL7B7nYb82XWjI7eWG2eRVdjKmvRf0lOuY344g/ZHyNBrxJL7xDLCtaaPK05uZxKbBc99tkMepmzWfPn0L2hXet9kxYvFR/2EurnRgm5HVSSiL6vN873wBObmQoT5xs2aFLQwWFMOqF9ocA4wEWD8Mxj2LoDUoNF9B4eegzsNN+0PM/JQ8nli1y+RpyTbXbFjd3FOsU2TJ3HOwUR1hEy4aWX5m7gbul70HRkVncVgkGJUQxGyG8JfB7xq6sQVcTHRpR1ivx4OdqXiRuszVd7egksFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=jmondi.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssx+JkEkTRMGox5PWW5SJQETy/ZX+165UzzwX4W6lqY=;
 b=tcTHcGd/Y7cYjLRF9ZKhmwbH/HLATAS0WdZiJMCKr91GPRIuHaTHnfI5EtYSVHHtInQsbf8sD24EAP64TX5JaPMrLNJ/mBHEKV8QqB86cITT0Ssxal4xsEQ3mMY7ziDYamslCwrn91fdUJV0Y3PbS3tldhT7Ioj+5tJsrd5Gr+c=
Received: from MN2PR19CA0001.namprd19.prod.outlook.com (2603:10b6:208:178::14)
 by BY5PR02MB6050.namprd02.prod.outlook.com (2603:10b6:a03:1f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 22:30:34 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:178:cafe::54) by MN2PR19CA0001.outlook.office365.com
 (2603:10b6:208:178::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Wed, 1 Apr 2020 22:30:34 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Wed, 1 Apr 2020 22:30:34
 +0000
Received: from [149.199.38.66] (port=49296 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jJlsU-0003EX-2M; Wed, 01 Apr 2020 15:30:30 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jJlsX-0001di-Pe; Wed, 01 Apr 2020 15:30:33 -0700
Received: from [172.19.2.244] (helo=localhost)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jJlsT-0001TT-5t; Wed, 01 Apr 2020 15:30:29 -0700
Date:   Wed, 1 Apr 2020 15:30:29 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/4] v4l2-subdev: Introduce get_mbus_format pad op
Message-ID: <20200401223027.GA583@smtp.xilinx.com>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(356004)(47076004)(7416002)(54906003)(8676002)(81166006)(316002)(82740400003)(70206006)(81156014)(966005)(478600001)(5660300002)(336012)(1076003)(8936002)(4326008)(70586007)(186003)(9786002)(2906002)(426003)(26005)(44832011)(33656002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86c10704-4b63-4eda-06aa-08d7d68c4b3c
X-MS-TrafficTypeDiagnostic: BY5PR02MB6050:
X-Microsoft-Antispam-PRVS: <BY5PR02MB60502DD9D107645850C47D3ED6C90@BY5PR02MB6050.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 03607C04F0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvavNdnW9y9H75Nu/WeElnS375ErxQtIvOkz8i6dvVaJb6cUS1H2YNdH8qwDUhOFgox05VcMEGNy3cUBGeF1oICkQ4+YmPbRUU0DFsfDZdctvABGMpBkRrvW0YkZdS1ThjuI/QTOGlKvUp+nnKZ7shiaRc2ud+tuhVP86zCGWvnPUDeCZ8e6L+sPs3W11Y6WE0VON1cHNH1G9HHZnh/cN54DbStA9Z3XzoZ2NiQCsT/7re7bj9NlpKxoL+duALItnthTMul9POXm56qKwcfnjkEKhX2RAPLE65meJSrdYduh4EiRIceyyyPb28X8FvqW+Mx6mnrps3PYyDh4ellspg/0wYIpeOqvVWlUwMwdsvS+LLpM+/o6vsld+41OUZ2fWTA4gGqvtSiCvVziwZ+ikr0PwiO0IvC+rf11j71A24EQrGmpm3jVl9/CrmJMwxGxBP6ghxcplE4hzyg5JC+dzCr/DVKuQtRWh/wi9f9Kxe+Wf3jGBW7kPLpzsMMt9lCNkl4zMIiXbnt4Ltc8DrUUbAyp2JQmRi8W5zbO+M8AhCS3jZF+l8RfhM8b8/gj7+YJOh0a2Kxj8KEiwClaqy1VxA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 22:30:34.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c10704-4b63-4eda-06aa-08d7d68c4b3c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6050
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patch.

On Fri, 2020-03-13 at 07:40:31 -0700, Jacopo Mondi wrote:
> This series introduces a pad oriented operation, much similar to the existing
> s/g_mbus_config subdv video operation, to allow dyanmic negotiation of media
> bus parameter.
> 
> The existing s/g_mbus_format are on their way to deprecation, due to the fact
> they operate at device level being a video op instead of pad level as this new
> implementation does.
> 
> The use case I'm addressing is described here, in the RFC sent one year ago
> on top of Sakari's v4l-multiplexed work, where I tried to extend the frame
> descriptor to transport media bus information.
> 
> Quoting:
> https://patchwork.kernel.org/cover/10855919/
> "The use case this series cover is the following one:
> the Gen-3 R-Car boards include an ADV748x HDMI/CVBS to CSI-2 converter
> connected to its CSI-2 receivers. The ADV748x chip has recently gained support
> for routing both HDMI and analogue video streams through its 4 lanes TXA
> transmitter, specifically to support the Ebisu board that has a single CSI-2
> receiver, compared to all other Gen-3 board where the ADV748x TXes are connected
> to different CSI-2 receivers, and where analogue video is streamed out from the
> ADV748x single lane TXB transmitter.
> To properly support transmission of analogue video through TXA, the number of
> data lanes shall be dynamically reduced to 1, in order to comply with the MIPI
> CSI-2 minimum clock frequency requirements"
> 
> During the discussion of the RFC, Dave reported another use case for media
> bus parameter negotiation on his platform:
> https://patchwork.kernel.org/patch/10855923/#22569149

And as you know, there's another use case for GMSL, and this patch set helps
negotiation between serializer and de-serializer. :-) I added the GMSL
config for some parameters on top of this, and it works well.

> 
> Another possible use case is for parallel bus multiplexing, where multiple image
> sensor share the parallel bus lines and they get activated alternatively through
> an enable signal. While this might not be most clever design, it's often seen
> in the wild, and this operation allow receivers to re-configure their bus
> parameter in between streaming session.

Even for parallel bus, I'm learning how diverse configurations can be.
For example, some ISP aligns bits in different way, MSB of color component
on d0. I'm sure there are a lot more creative ones out there, so this seems
quite useful to handle such accordingly.

Thanks,
-hyun

> 
> For now I have left untouched definitions and users of the existing
> s/g_mbus_config ops, waiting for feedback on this first implementation.
> 
> Thanks
>    j
> 
> Jacopo Mondi (4):
>   media: i2c: adv748x: Adjust TXA data lanes number
>   media: v4l2-subdv: Introduce get_mbus_config pad op
>   media: i2c: adv748x: Implement get_mbus_config
>   media: rcar-vin: csi2: Negotiate data lanes number
> 
>  drivers/media/i2c/adv748x/adv748x-core.c    | 31 +++++++---
>  drivers/media/i2c/adv748x/adv748x-csi2.c    | 15 +++++
>  drivers/media/i2c/adv748x/adv748x.h         |  1 +
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 49 ++++++++++++++-
>  include/media/v4l2-subdev.h                 | 67 +++++++++++++++++++++
>  5 files changed, 153 insertions(+), 10 deletions(-)
> 
> --
> 2.25.1
> 
