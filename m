Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDB7221817
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 00:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgGOWqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 18:46:10 -0400
Received: from mail-eopbgr690044.outbound.protection.outlook.com ([40.107.69.44]:29575
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727971AbgGOWqI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 18:46:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlRagE1Rp/YbtEl670aemNGT3fUWLifOjuCgH7pSNgwb14ryDJO81Pnvgt5ktqE+lu+XEvLBs/1zkhjuIyQnjaye1tyv5nB7VrfRoyJTd49XkEtt/yQwJSmUZzJHNRWO0btUHMoq1m+v7i4OY6jG8LQaujGOXnykkj+xTuMhYgmvZF9GYBoupuyKOBf1uccZGlNGsRH6GO6F8Lc3rO6kaH+YuUSRL9xeF2EhwxdGPa0CoZUq/GxVCJfKv9omeju4Ig6hkxVtcK1jGeXCybjrXiRRSKW+uIfs+jWUKj4mmWIMVoHtIXYmtdHf/0c0FNVqP+7IPz83AqLH7y2KzKXRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6i4xwLiTh1MUghqkOvaUnXTiyDy2X/KyD9b1tLUQWE=;
 b=GOOHuE8k6EV37k2V08zhKJR3rcnEnAnOOH01JxJ2hnWC44wdYlpvYO0+i3BeR7eJM/qyXim7z7KMa2HJ4ZRGUYqhCmR3dwvpHiXcCce6xRK8/KTrJrJnxk7/KYtYIp/jvUuVGZnFzLertbrXmWZEG0MMZfkEgPZGXE6ClxttDH+ceVqMj3LgjXRcPaiAXc3iqfQg454XP1L1Oc8Tb/uq35sO/RJVN37JUjOs1lA2RGPGHJNyDxFQZlj3n/o1XZxf2TZsXVNHBjL7k7kckz/IFJ2i/jaNckQJbzNzevB25v5d4LWmK3ZtPcDBkBylJlu8oWT4EZOX48hfD6aIqwHGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=xs4all.nl smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6i4xwLiTh1MUghqkOvaUnXTiyDy2X/KyD9b1tLUQWE=;
 b=YLhlEu9f2UQP1B3cjsv0qbChqJkjeG65/mOz1HjZzncEmq/gQuLgRxaUteQVKmoqwVw/ecXKqpTPaujeuwY9z7IdoxT4cQy6hiyELZvHwYjs7yPI/MsCMvvWcEcB65kfeehBX7cJiIPTo5FuPwE8duzE6vu6zedHx/upHmXT3qM=
Received: from DM3PR12CA0101.namprd12.prod.outlook.com (2603:10b6:0:55::21) by
 CY4PR02MB2501.namprd02.prod.outlook.com (2603:10b6:903:72::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22; Wed, 15 Jul 2020 22:45:49 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::ec) by DM3PR12CA0101.outlook.office365.com
 (2603:10b6:0:55::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Wed, 15 Jul 2020 22:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with Microsoft SMTP
 Server id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 22:45:47
 +0000
Received: from [149.199.38.66] (port=45491 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jvq8C-0004lZ-5d; Wed, 15 Jul 2020 15:44:04 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jvq9r-0003ij-FG; Wed, 15 Jul 2020 15:45:47 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06FMjgk0030737;
        Wed, 15 Jul 2020 15:45:42 -0700
Received: from [172.19.2.244] (helo=xsjhyunkubuntu)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <hyun.kwon@xilinx.com>)
        id 1jvq9m-0003hq-KM; Wed, 15 Jul 2020 15:45:42 -0700
Received: by xsjhyunkubuntu (Postfix, from userid 13638)
        id D00172C6BB2; Wed, 15 Jul 2020 15:42:49 -0700 (PDT)
Date:   Wed, 15 Jul 2020 15:42:49 -0700
From:   Hyun Kwon <hyun.kwon@xilinx.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "joe@perches.com" <joe@perches.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>
Subject: Re: [PATCH v3 3/3] media: v4l: xilinx: Add Xilinx UHD-SDI Rx
 Subsystem driver
Message-ID: <20200715224248.GA3490@xilinx.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-4-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618053304.14551-4-vishal.sagar@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(396003)(346002)(39860400002)(376002)(46966005)(7416002)(316002)(186003)(42186006)(83380400001)(6636002)(37006003)(30864003)(2906002)(47076004)(336012)(81166007)(70586007)(5660300002)(54906003)(6862004)(33656002)(82740400003)(356005)(8676002)(478600001)(26005)(6266002)(426003)(8936002)(107886003)(44832011)(1076003)(82310400002)(36756003)(70206006)(2616005)(4326008)(42866002)(559001)(579004)(309714004);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f62b8fd2-880a-48c5-a165-08d82910d123
X-MS-TrafficTypeDiagnostic: CY4PR02MB2501:
X-Microsoft-Antispam-PRVS: <CY4PR02MB25014465FCB4CDBFCB35DA51D67E0@CY4PR02MB2501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLpXJiYX88L5FZtAqbieXUqc/wNEDJDx5ipZkjcSGxU3CTQ7FuHc6oUGjkvQAH00F/MgG+kAc5JyM+7jlaMP1wxSr0KiNJhZ4xPQxEfpLg+8WB2HgS3u8ZaMpbeS018lSf7parb7CKXAp7E/Y0lxnSdZdb2x/w9QB63dJNZLBzmj8sz0kG43y09pm8bCAJMR0iKt899mhEV3fctQuFwK8TJMmLzJEqykDifmLkRtRSDw2OTEnHIug3riFTxCuDqQKYY+JZk5Tu/Ot1XIOr3uzJqvKnswmDIUyz1lf/9RoeIosxbu6WxzrYiwdnvvokVtIVAFC4L67M2u6gWy8hf90MkKvvwv6mlCBXs+b7pu9Eeh8JsXHzYlZVSsY7FV8JVlEGCBeazS12gvJDwnoSaF+X+Ly8zWqJ9u8MUMzbOOLFJ/dDtvfdVsepQwAC+W6ORA
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 22:45:47.7764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62b8fd2-880a-48c5-a165-08d82910d123
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2501
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch. Sorry for late response.

On Wed, Jun 17, 2020 at 10:33:04PM -0700, Vishal Sagar wrote:
> The Xilinx UHD-SDI Rx subsystem soft IP is used to capture native SDI
> streams from SDI sources like SDI broadcast equipment like cameras and
> mixers. This block outputs either native SDI, native video or
> AXI4-Stream compliant data stream for further processing. Please refer
> to PG290 for details.
>=20
> The driver is used to configure the IP to add framer, search for
> specific modes, get the detected mode, stream parameters, errors, etc.
> It also generates events for video lock/unlock, bridge over/under flow.
>=20
> The driver supports 10/12 bpc YUV 422 media bus format currently. It
> also decodes the stream parameters based on the ST352 packet embedded i=
n the
> stream. In case the ST352 packet isn't present in the stream, the core'=
s
> detected properties are used to set stream properties.
>=20
> The driver currently supports only the AXI4-Stream IP configuration.
>=20
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
> v3
> - fixed KConfig with better description
> - removed unnecessary header files
> - converted uppercase to lowercase for all hex values
> - merged core struct to state struct
> - removed most one line functions and replaced with direct reg
>   read/write or macros
> - dt property bpp to bpc. default 10. not mandatory.
> - fixed subscribe events, log_status, s_stream
> - merged overflow/underflow to one event
> - moved all controls to xilinx-sdirxss.h
> - max events from 128 to 8
> - used FIELD_GET() instead of custom macro
> - updated the controls documentation
> - added spinlock
> - removed 3GB control and added mode to detect bitmask
> - fixed format for (width, height, colorspace, xfer func, etc)
> - added dv_timings_cap, s/g_dv_timings
> - fixed set/get_format
> - fix v4l control registrations
> - fix order of registration / deregistration in probe() remove()
> - fixed other comments from Hyun, Laurent and Hans
> - things yet to close
>   - adding source port for connector (Laurent's suggestion)
>   - adding new FIELD type for Transport Stream V4L2_FIELD_ALTERNATE_PRO=
G (Han's suggestion)
>   - Update / remove EDH or CRC related controls
>=20
> v2
> - Added DV timing support based on Hans Verkuil=C5=9B feedback
> - More documentation to custom v4l controls and events
> - Fixed Hyun=C5=9B comments
> - Added macro for masking and shifting as per Joe Perches comments
> - Updated to latest as per Xilinx github repo driver like
>   adding new DV timings not in mainline yet uptill 03/21/20
>=20
>  drivers/media/platform/xilinx/Kconfig         |   11 +
>  drivers/media/platform/xilinx/Makefile        |    1 +
>  .../media/platform/xilinx/xilinx-sdirxss.c    | 2121 +++++++++++++++++
>  include/uapi/linux/v4l2-controls.h            |    6 +
>  include/uapi/linux/xilinx-sdirxss.h           |  283 +++
>  5 files changed, 2422 insertions(+)
>  create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
>  create mode 100644 include/uapi/linux/xilinx-sdirxss.h
>=20
> diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/plat=
form/xilinx/Kconfig
> index 01c96fb66414..578cdcc1036e 100644
> --- a/drivers/media/platform/xilinx/Kconfig
> +++ b/drivers/media/platform/xilinx/Kconfig
> @@ -12,6 +12,17 @@ config VIDEO_XILINX
> =20
>  if VIDEO_XILINX
> =20
> +config VIDEO_XILINX_SDIRXSS
> +	tristate "Xilinx UHD SDI Rx Subsystem"
> +	help
> +	  Driver for Xilinx UHD-SDI Rx Subsystem. This is a V4L sub-device
> +	  based driver that takes input from a SDI source like SDI camera and
> +	  converts it into an AXI4-Stream. The subsystem comprises a SMPTE
> +	  UHD-SDI Rx core, a SDI Rx to Native Video bridge and a Video In to
> +	  AXI4-Stream bridge. The driver is used to set different stream
> +	  detection modes and identify stream properties to properly configur=
e
> +	  downstream.
> +
>  config VIDEO_XILINX_TPG
>  	tristate "Xilinx Video Test Pattern Generator"
>  	depends on VIDEO_XILINX
> diff --git a/drivers/media/platform/xilinx/Makefile b/drivers/media/pla=
tform/xilinx/Makefile
> index 4cdc0b1ec7a5..3beaf24d832c 100644
> --- a/drivers/media/platform/xilinx/Makefile
> +++ b/drivers/media/platform/xilinx/Makefile
> @@ -3,5 +3,6 @@
>  xilinx-video-objs +=3D xilinx-dma.o xilinx-vip.o xilinx-vipp.o
> =20
>  obj-$(CONFIG_VIDEO_XILINX) +=3D xilinx-video.o
> +obj-$(CONFIG_VIDEO_XILINX_SDIRXSS) +=3D xilinx-sdirxss.o
>  obj-$(CONFIG_VIDEO_XILINX_TPG) +=3D xilinx-tpg.o
>  obj-$(CONFIG_VIDEO_XILINX_VTC) +=3D xilinx-vtc.o
> diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c b/drivers/m=
edia/platform/xilinx/xilinx-sdirxss.c
> new file mode 100644
> index 000000000000..e39aab7c656a
> --- /dev/null
> +++ b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> @@ -0,0 +1,2121 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Xilinx SDI Rx Subsystem
> + *
> + * Copyright (C) 2017 - 2020 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + */
> +
> +#include <dt-bindings/media/xilinx-sdi.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/xilinx-sdirxss.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-subdev.h>
> +
> +/*
> + * SDI Rx register map, bitmask and offsets
> + */
> +#define XSDIRX_RST_CTRL_REG		0x00
> +#define XSDIRX_MDL_CTRL_REG		0x04
> +#define XSDIRX_GLBL_IER_REG		0x0c
> +#define XSDIRX_ISR_REG			0x10
> +#define XSDIRX_IER_REG			0x14
> +#define XSDIRX_ST352_VALID_REG		0x18
> +#define XSDIRX_ST352_DS1_REG		0x1c
> +#define XSDIRX_ST352_DS3_REG		0x20
> +#define XSDIRX_ST352_DS5_REG		0x24
> +#define XSDIRX_ST352_DS7_REG		0x28
> +#define XSDIRX_ST352_DS9_REG		0x2c
> +#define XSDIRX_ST352_DS11_REG		0x30
> +#define XSDIRX_ST352_DS13_REG		0x34
> +#define XSDIRX_ST352_DS15_REG		0x38
> +#define XSDIRX_VERSION_REG		0x3c
> +#define XSDIRX_SS_CONFIG_REG		0x40
> +#define XSDIRX_MODE_DET_STAT_REG	0x44
> +#define XSDIRX_TS_DET_STAT_REG		0x48
> +#define XSDIRX_EDH_STAT_REG		0x4c
> +#define XSDIRX_EDH_ERRCNT_EN_REG	0x50
> +#define XSDIRX_EDH_ERRCNT_REG		0x54
> +#define XSDIRX_CRC_ERRCNT_REG		0x58
> +#define XSDIRX_VID_LOCK_WINDOW_REG	0x5c
> +#define XSDIRX_ST352_DS2_REG		0x70
> +#define XSDIRX_ST352_DS4_REG		0x74
> +#define XSDIRX_ST352_DS6_REG		0x78
> +#define XSDIRX_ST352_DS8_REG		0x7c
> +#define XSDIRX_ST352_DS10_REG		0x80
> +#define XSDIRX_ST352_DS12_REG		0x84
> +#define XSDIRX_ST352_DS14_REG		0x88
> +#define XSDIRX_ST352_DS16_REG		0x8c
> +
> +#define XSDIRX_RST_CTRL_SS_EN_MASK			BIT(0)
> +#define XSDIRX_RST_CTRL_SRST_MASK			BIT(1)
> +#define XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK		BIT(2)
> +#define XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK		BIT(3)
> +#define XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK		BIT(8)
> +#define XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK	BIT(9)
> +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_OFFSET		10
> +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_MASK		GENMASK(12, 10)
> +#define XSDIRX_RST_CTRL_BRIDGE_CH_FMT_YUV444		1
> +
> +#define XSDIRX_MDL_CTRL_FRM_EN_MASK		BIT(4)
> +#define XSDIRX_MDL_CTRL_MODE_DET_EN_MASK	BIT(5)
> +#define XSDIRX_MDL_CTRL_MODE_HD_EN_MASK		BIT(8)
> +#define XSDIRX_MDL_CTRL_MODE_SD_EN_MASK		BIT(9)
> +#define XSDIRX_MDL_CTRL_MODE_3G_EN_MASK		BIT(10)
> +#define XSDIRX_MDL_CTRL_MODE_6G_EN_MASK		BIT(11)
> +#define XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK	BIT(12)
> +#define XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK	BIT(13)
> +#define XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK	GENMASK(13, 8)
> +
> +#define XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET	16
> +#define XSDIRX_MDL_CTRL_FORCED_MODE_MASK	GENMASK(18, 16)
> +
> +#define XSDIRX_GLBL_INTR_EN_MASK	BIT(0)
> +
> +#define XSDIRX_INTR_VIDLOCK_MASK	BIT(0)
> +#define XSDIRX_INTR_VIDUNLOCK_MASK	BIT(1)
> +#define XSDIRX_INTR_OVERFLOW_MASK	BIT(9)
> +#define XSDIRX_INTR_UNDERFLOW_MASK	BIT(10)
> +
> +#define XSDIRX_INTR_ALL_MASK	(XSDIRX_INTR_VIDLOCK_MASK |\
> +				XSDIRX_INTR_VIDUNLOCK_MASK |\
> +				XSDIRX_INTR_OVERFLOW_MASK |\
> +				XSDIRX_INTR_UNDERFLOW_MASK)
> +
> +#define XSDIRX_ST352_VALID_DS1_MASK	BIT(0)
> +#define XSDIRX_ST352_VALID_DS3_MASK	BIT(1)
> +#define XSDIRX_ST352_VALID_DS5_MASK	BIT(2)
> +#define XSDIRX_ST352_VALID_DS7_MASK	BIT(3)
> +#define XSDIRX_ST352_VALID_DS9_MASK	BIT(4)
> +#define XSDIRX_ST352_VALID_DS11_MASK	BIT(5)
> +#define XSDIRX_ST352_VALID_DS13_MASK	BIT(6)
> +#define XSDIRX_ST352_VALID_DS15_MASK	BIT(7)
> +
> +#define XSDIRX_MODE_DET_STAT_RX_MODE_MASK	GENMASK(2, 0)
> +#define XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK	BIT(3)
> +#define XSDIRX_MODE_DET_STAT_ACT_STREAM_MASK	GENMASK(6, 4)
> +#define XSDIRX_MODE_DET_STAT_ACT_STREAM_OFFSET	4
> +#define XSDIRX_MODE_DET_STAT_LVLB_3G_MASK	BIT(7)
> +
> +#define XSDIRX_TS_DET_STAT_LOCKED_MASK		BIT(0)
> +#define XSDIRX_TS_DET_STAT_SCAN_MASK		BIT(1)
> +#define XSDIRX_TS_DET_STAT_FAMILY_MASK		GENMASK(7, 4)
> +#define XSDIRX_TS_DET_STAT_RATE_MASK		GENMASK(11, 8)
> +
> +#define XSDIRX_TS_DET_STAT_RATE_NONE		0x0
> +#define XSDIRX_TS_DET_STAT_RATE_23_98HZ		0x2
> +#define XSDIRX_TS_DET_STAT_RATE_24HZ		0x3
> +#define XSDIRX_TS_DET_STAT_RATE_47_95HZ		0x4
> +#define XSDIRX_TS_DET_STAT_RATE_25HZ		0x5
> +#define XSDIRX_TS_DET_STAT_RATE_29_97HZ		0x6
> +#define XSDIRX_TS_DET_STAT_RATE_30HZ		0x7
> +#define XSDIRX_TS_DET_STAT_RATE_48HZ		0x8
> +#define XSDIRX_TS_DET_STAT_RATE_50HZ		0x9
> +#define XSDIRX_TS_DET_STAT_RATE_59_94HZ		0xa
> +#define XSDIRX_TS_DET_STAT_RATE_60HZ		0xb
> +
> +#define XSDIRX_EDH_STAT_EDH_AP_MASK	BIT(0)
> +#define XSDIRX_EDH_STAT_EDH_FF_MASK	BIT(1)
> +#define XSDIRX_EDH_STAT_EDH_ANC_MASK	BIT(2)
> +#define XSDIRX_EDH_STAT_AP_FLAG_MASK	GENMASK(8, 4)
> +#define XSDIRX_EDH_STAT_FF_FLAG_MASK	GENMASK(13, 9)
> +#define XSDIRX_EDH_STAT_ANC_FLAG_MASK	GENMASK(18, 14)
> +#define XSDIRX_EDH_STAT_PKT_FLAG_MASK	GENMASK(22, 19)
> +
> +#define XSDIRX_EDH_ERRCNT_COUNT_MASK	GENMASK(15, 0)
> +
> +#define XSDIRX_CRC_ERRCNT_COUNT_MASK	GENMASK(31, 16)
> +#define XSDIRX_CRC_ERRCNT_DS_CRC_MASK	GENMASK(15, 0)
> +
> +#define XSDIRX_VERSION_REV_MASK		GENMASK(7, 0)
> +#define XSDIRX_VERSION_PATCHID_MASK	GENMASK(11, 8)
> +#define XSDIRX_VERSION_VER_REV_MASK	GENMASK(15, 12)
> +#define XSDIRX_VERSION_VER_MIN_MASK	GENMASK(23, 16)
> +#define XSDIRX_VERSION_VER_MAJ_MASK	GENMASK(31, 24)
> +
> +#define XSDIRX_SS_CONFIG_EDH_INCLUDED_MASK		BIT(1)
> +
> +#define XSDIRX_STAT_SB_RX_TDATA_CHANGE_DONE_MASK	BIT(0)
> +#define XSDIRX_STAT_SB_RX_TDATA_CHANGE_FAIL_MASK	BIT(1)
> +#define XSDIRX_STAT_SB_RX_TDATA_GT_RESETDONE_MASK	BIT(2)
> +#define XSDIRX_STAT_SB_RX_TDATA_GT_BITRATE_MASK		BIT(3)
> +
> +#define XSDIRX_DEFAULT_WIDTH	1920
> +#define XSDIRX_DEFAULT_HEIGHT	1080
> +
> +#define XSDIRX_MAX_STR_LENGTH	16

This is not used. Please remove.

> +
> +#define XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW	0x3000

Not sure if this macro is needed. The value can be used directly. Single
user macro without additional description may be removed. Please check.

> +
> +#define XSDIRX_MODE_HD_MASK	0x0
> +#define XSDIRX_MODE_SD_MASK	0x1
> +#define XSDIRX_MODE_3G_MASK	0x2
> +#define XSDIRX_MODE_6G_MASK	0x4
> +#define XSDIRX_MODE_12GI_MASK	0x5
> +#define XSDIRX_MODE_12GF_MASK	0x6

These are not masks, so _MASK better be removed from names.

> +
> +/* Maximum number of events per file handle. */
> +#define XSDIRX_MAX_EVENTS	8
> +
> +/* ST352 related macros */
> +#define XST352_PAYLOAD_BYTE1_MASK	GENMASK(7, 0)
> +#define XST352_PAYLOAD_BYTE2_OFFSET	8
> +#define XST352_PAYLOAD_BYTE3_OFFSET	16
> +#define XST352_PAYLOAD_BYTE4_OFFSET	24

Last 3 are not used. Those may have become unused from using FIELD_GET().
Please remove.

> +
> +#define XST352_BYTE1_ST292_1x720L_1_5G		0x84
> +#define XST352_BYTE1_ST292_1x1080L_1_5G		0x85
> +#define XST352_BYTE1_ST425_2008_750L_3GB	0x88
> +#define XST352_BYTE1_ST425_2008_1125L_3GA	0x89
> +#define XST352_BYTE1_ST372_DL_3GB		0x8a
> +#define XST352_BYTE1_ST372_2x720L_3GB		0x8b
> +#define XST352_BYTE1_ST372_2x1080L_3GB		0x8c
> +#define XST352_BYTE1_ST2081_10_2160L_6G		0xc0
> +#define XST352_BYTE1_ST2081_10_2_1080L_6G	0xc1
> +#define XST352_BYTE1_ST2081_10_DL_2160L_6G	0xc2
> +#define XST352_BYTE1_ST2082_10_2160L_12G	0xce
> +
> +#define XST352_BYTE2_TS_TYPE_MASK		BIT(15)
> +#define XST352_BYTE2_PIC_TYPE_MASK		BIT(14)
> +#define XST352_BYTE2_TS_PIC_TYPE_INTERLACED	0
> +#define XST352_BYTE2_TS_PIC_TYPE_PROGRESSIVE	1

Not used. :) Please check and remove unneeded definitions.

> +
> +#define XST352_BYTE2_FPS_MASK			GENMASK(11, 8)
> +#define XST352_BYTE2_FPS_24F			0x2
> +#define XST352_BYTE2_FPS_24			0x3
> +#define XST352_BYTE2_FPS_48F			0x4
> +#define XST352_BYTE2_FPS_25			0x5
> +#define XST352_BYTE2_FPS_30F			0x6
> +#define XST352_BYTE2_FPS_30			0x7
> +#define XST352_BYTE2_FPS_48			0x8
> +#define XST352_BYTE2_FPS_50			0x9
> +#define XST352_BYTE2_FPS_60F			0xa
> +#define XST352_BYTE2_FPS_60			0xb
> +/* Table 4 ST 2081-10:2015 */
> +#define XST352_BYTE2_FPS_96			0xc
> +#define XST352_BYTE2_FPS_100			0xd
> +#define XST352_BYTE2_FPS_120			0xe
> +#define XST352_BYTE2_FPS_120F			0xf
> +
> +#define XST352_BYTE3_ACT_LUMA_COUNT_MASK	BIT(22)
> +
> +#define XST352_BYTE3_COLOR_FORMAT_MASK		GENMASK(19, 16)
> +#define XST352_BYTE3_COLOR_FORMAT_422		0x0
> +#define XST352_BYTE3_COLOR_FORMAT_YUV444	0x1
> +#define XST352_BYTE3_COLOR_FORMAT_420		0x3
> +#define XST352_BYTE3_COLOR_FORMAT_GBR		0x2
> +
> +#define XST352_BYTE3_COLORIMETRY_MASK		GENMASK(21, 20)
> +#define XST352_BYTE3_COLORIMETRY_BT709		0
> +#define XST352_BYTE3_COLORIMETRY_COLOR_VANC	1
> +#define XST352_BYTE3_COLORIMETRY_UHDTV		2
> +#define XST352_BYTE3_COLORIMETRY_UNKNOWN	3
> +
> +#define XST352_BYTE4_BIT_DEPTH_MASK		GENMASK(25, 24)
> +#define XST352_BYTE4_BIT_DEPTH_10		0x1
> +#define XST352_BYTE4_BIT_DEPTH_12		0x2
> +
> +/* GT input clock for sdi_rx_clk */
> +#define CLK_INT		148500000UL
> +
> +#define XSDIRXSS_WIDTH_MIN                    720
> +#define XSDIRXSS_WIDTH_MAX                    4096
> +#define XSDIRXSS_HEIGHT_MIN                   243
> +#define XSDIRXSS_HEIGHT_MAX                   2160
> +#define XSDIRXSS_PIXELCLOCK_MIN               13500000
> +#define XSDIRXSS_PIXELCLOCK_MAX               594000000
> +
> +/**
> + * enum sdi_family_enc - SDI Transport Video Format Detected with Acti=
ve Pixels
> + * @XSDIRX_SMPTE_ST_274: SMPTE ST 274 detected with AP 1920x1080
> + * @XSDIRX_SMPTE_ST_296: SMPTE ST 296 detected with AP 1280x720
> + * @XSDIRX_SMPTE_ST_2048_2: SMPTE ST 2048-2 detected with AP 2048x1080
> + * @XSDIRX_SMPTE_ST_295: SMPTE ST 295 detected with AP 1920x1080
> + * @XSDIRX_NTSC: NTSC encoding detected with AP 720x486
> + * @XSDIRX_PAL: PAL encoding detected with AP 720x576
> + * @XSDIRX_TS_UNKNOWN: Unknown SMPTE Transport family type
> + */
> +enum sdi_family_enc {
> +	XSDIRX_SMPTE_ST_274	=3D 0,
> +	XSDIRX_SMPTE_ST_296	=3D 1,
> +	XSDIRX_SMPTE_ST_2048_2	=3D 2,
> +	XSDIRX_SMPTE_ST_295	=3D 3,
> +	XSDIRX_NTSC		=3D 8,
> +	XSDIRX_PAL		=3D 9,
> +	XSDIRX_TS_UNKNOWN	=3D 15
> +};
> +
> +/**
> + * struct xsdirxss_state - SDI Rx Subsystem device structure
> + * @subdev: The v4l2 subdev structure
> + * @ctrl_handler: control handler
> + * @default_format: default V4L2 media bus format
> + * @pad: source media pad
> + * @dev: Platform structure
> + * @iomem: Base address of subsystem
> + * @clks: array of clocks
> + * @prev_is_frac: Previous clock is fractional or not flag
> + * @bpc: Bits per component, can be 10 or 12
> + * @mode: 3G/6G/12G mode
> + * @num_clks: number of clocks
> + * @include_edh: EDH processor presence
> + * @slock: spinlock to protect below members
> + * @format: Active V4L2 format detected
> + * @src_format: Active V4L2 format on source pad
> + * @frame_interval: Captures the frame rate
> + * @current_timings: DV timings from application
> + * @detected_timings_index: index of DV timings detected on incoming s=
tream
> + * @vidlockwin: Video lock window value set by control
> + * @edhmask: EDH mask set by control
> + * @searchmask: Search mask set by control
> + * @streaming: Flag for storing streaming state
> + * @vidlocked: Flag indicating SDI Rx has locked onto video stream
> + * @ts_is_interlaced: Flag indicating Transport Stream is interlaced.
> + * @framer_enable: Flag for framer enabled or not set by control
> + *
> + * This structure contains the device driver related parameters
> + */
> +struct xsdirxss_state {
> +	struct v4l2_subdev subdev;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_mbus_framefmt default_format;
> +	struct media_pad pad;
> +	struct device *dev;
> +	void __iomem *iomem;
> +	struct clk_bulk_data *clks;
> +	int prev_is_frac;
> +	u32 bpc;
> +	u32 mode;
> +	unsigned int num_clks;
> +	bool include_edh;
> +
> +	/*
> +	 * This spinlock is used to protect the below members
> +	 * format, src_format, frame_interval, current_timings,
> +	 * detected_timings_index, vidlockwin, edhmask, searchmask,
> +	 * streaming, vidlocked, ts_is_interlaced, framer_enable
> +	 */
> +	spinlock_t slock;
> +	struct v4l2_mbus_framefmt format;
> +	struct v4l2_mbus_framefmt src_format;
> +	struct v4l2_fract frame_interval;
> +	struct v4l2_dv_timings current_timings;
> +	u32 detected_timings_index;
> +	u32 vidlockwin;
> +	u32 edhmask;
> +	u16 searchmask;
> +	bool streaming;
> +	bool vidlocked;
> +	bool ts_is_interlaced;

Use of bool in struct is not recommended. Not sure if it's doable with on=
es
getting values from other functions, but I beleive above 3 can change usi=
ng
bit field or normal integer type.

> +	bool framer_enable;
> +};
> +
> +/* List of clocks required by UHD-SDI Rx subsystem */
> +static const char * const xsdirxss_clks[] =3D {
> +	"s_axi_aclk", "sdi_rx_clk", "video_out_clk",
> +};

This can move into probe() to reduce the scope.

> +
> +/* TODO - Add YUV 444/420 and RBG 10/12 bpc mbus formats here */
> +static const u32 xsdirxss_10bpc_mbus_fmts[] =3D {
> +	MEDIA_BUS_FMT_UYVY10_1X20,
> +};
> +
> +static const u32 xsdirxss_12bpc_mbus_fmts[] =3D {
> +	MEDIA_BUS_FMT_UYVY12_1X24,
> +};
> +
> +static const struct v4l2_dv_timings fmt_cap[] =3D {
> +	V4L2_DV_BT_SDI_720X487I60,
> +	V4L2_DV_BT_CEA_720X576I50,
> +	V4L2_DV_BT_CEA_1280X720P24,
> +	V4L2_DV_BT_CEA_1280X720P25,
> +	V4L2_DV_BT_CEA_1280X720P30,
> +	V4L2_DV_BT_CEA_1280X720P50,
> +	V4L2_DV_BT_CEA_1280X720P60,
> +	V4L2_DV_BT_CEA_1920X1080P24,
> +	V4L2_DV_BT_CEA_1920X1080P30,
> +	V4L2_DV_BT_CEA_1920X1080I50,
> +	V4L2_DV_BT_CEA_1920X1080I60,
> +	V4L2_DV_BT_CEA_1920X1080P48,
> +	V4L2_DV_BT_CEA_1920X1080P50,
> +	V4L2_DV_BT_CEA_1920X1080P60,
> +	V4L2_DV_BT_CEA_3840X2160P24,
> +	V4L2_DV_BT_CEA_3840X2160P30,
> +	V4L2_DV_BT_CEA_3840X2160P48,
> +	V4L2_DV_BT_CEA_3840X2160P50,
> +	V4L2_DV_BT_CEA_3840X2160P60,
> +	V4L2_DV_BT_CEA_4096X2160P24,
> +	V4L2_DV_BT_CEA_4096X2160P25,
> +	V4L2_DV_BT_CEA_4096X2160P30,
> +	V4L2_DV_BT_CEA_4096X2160P48,
> +	V4L2_DV_BT_CEA_4096X2160P50,
> +	V4L2_DV_BT_CEA_4096X2160P60,
> +
> +	XLNX_V4L2_DV_BT_2048X1080P24,
> +	XLNX_V4L2_DV_BT_2048X1080P25,
> +	XLNX_V4L2_DV_BT_2048X1080P30,
> +	XLNX_V4L2_DV_BT_2048X1080I48,
> +	XLNX_V4L2_DV_BT_2048X1080I50,
> +	XLNX_V4L2_DV_BT_2048X1080I60,
> +	XLNX_V4L2_DV_BT_2048X1080P48,
> +	XLNX_V4L2_DV_BT_2048X1080P50,
> +	XLNX_V4L2_DV_BT_2048X1080P60,
> +	XLNX_V4L2_DV_BT_1920X1080I48,
> +};
> +
> +struct xsdirxss_dv_map {
> +	u32 width;
> +	u32 height;
> +	u32 fps;
> +	struct v4l2_dv_timings timing;
> +};
> +
> +static const struct xsdirxss_dv_map xsdirxss_dv_timings[] =3D {
> +	/* SD - 720x487i60 */
> +	{ 720, 243, 30, V4L2_DV_BT_SDI_720X487I60 },
> +	/* SD - 720x576i50 */
> +	{ 720, 288, 25, V4L2_DV_BT_CEA_720X576I50 },
> +	/* HD - 1280x720p23.98 */
> +	/* HD - 1280x720p24 */
> +	{ 1280, 720, 24, V4L2_DV_BT_CEA_1280X720P24 },
> +	/* HD - 1280x720p25 */
> +	{ 1280, 720, 25, V4L2_DV_BT_CEA_1280X720P25 },
> +	/* HD - 1280x720p29.97 */
> +	/* HD - 1280x720p30 */
> +	{ 1280, 720, 30, V4L2_DV_BT_CEA_1280X720P30 },
> +	/* HD - 1280x720p50 */
> +	{ 1280, 720, 50, V4L2_DV_BT_CEA_1280X720P50 },
> +	/* HD - 1280x720p59.94 */
> +	/* HD - 1280x720p60 */
> +	{ 1280, 720, 60, V4L2_DV_BT_CEA_1280X720P60 },
> +	/* HD - 1920x1080p23.98 */
> +	/* HD - 1920x1080p24 */
> +	{ 1920, 1080, 24, V4L2_DV_BT_CEA_1920X1080P24 },
> +	/* HD - 1920x1080p25 */
> +	{ 1920, 1080, 25, V4L2_DV_BT_CEA_1920X1080P25 },
> +	/* HD - 1920x1080p29.97 */
> +	/* HD - 1920x1080p30 */
> +	{ 1920, 1080, 30, V4L2_DV_BT_CEA_1920X1080P30 },
> +
> +	/* HD - 2048x1080p23.98 */
> +	/* HD - 2048x1080p24 */
> +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P24 },
> +	/* HD - 2048x1080p25 */
> +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P25 },
> +	/* HD - 2048x1080p29.97 */
> +	/* HD - 2048x1080p30 */
> +	{ 2048, 1080, 24, XLNX_V4L2_DV_BT_2048X1080P30 },
> +	/* HD - 1920x1080i47.95 */
> +	/* HD - 1920x1080i48 */
> +	{ 1920, 540, 24, XLNX_V4L2_DV_BT_1920X1080I48 },
> +
> +	/* HD - 1920x1080i50 */
> +	{ 1920, 540, 25, V4L2_DV_BT_CEA_1920X1080I50 },
> +	/* HD - 1920x1080i59.94 */
> +	/* HD - 1920x1080i60 */
> +	{ 1920, 540, 30, V4L2_DV_BT_CEA_1920X1080I60 },
> +
> +	/* HD - 2048x1080i47.95 */
> +	/* HD - 2048x1080i48 */
> +	{ 2048, 540, 24, XLNX_V4L2_DV_BT_2048X1080I48 },
> +	/* HD - 2048x1080i50 */
> +	{ 2048, 540, 25, XLNX_V4L2_DV_BT_2048X1080I50 },
> +	/* HD - 2048x1080i59.94 */
> +	/* HD - 2048x1080i60 */
> +	{ 2048, 540, 30, XLNX_V4L2_DV_BT_2048X1080I60 },
> +	/* 3G - 1920x1080p47.95 */
> +	/* 3G - 1920x1080p48 */
> +	{ 1920, 1080, 48, V4L2_DV_BT_CEA_1920X1080P48 },
> +
> +	/* 3G - 1920x1080p50 148.5 */
> +	{ 1920, 1080, 50, V4L2_DV_BT_CEA_1920X1080P50 },
> +	/* 3G - 1920x1080p59.94 148.5/1.001 */
> +	/* 3G - 1920x1080p60 148.5 */
> +	{ 1920, 1080, 60, V4L2_DV_BT_CEA_1920X1080P60 },
> +
> +	/* 3G - 2048x1080p47.95 */
> +	/* 3G - 2048x1080p48 */
> +	{ 2048, 1080, 48, XLNX_V4L2_DV_BT_2048X1080P48 },
> +	/* 3G - 2048x1080p50 */
> +	{ 2048, 1080, 50, XLNX_V4L2_DV_BT_2048X1080P50 },
> +	/* 3G - 2048x1080p59.94 */
> +	/* 3G - 2048x1080p60 */
> +	{ 2048, 1080, 60, XLNX_V4L2_DV_BT_2048X1080P60 },
> +
> +	/* 6G - 3840X2160p23.98 */
> +	/* 6G - 3840X2160p24 */
> +	{ 3840, 2160, 24, V4L2_DV_BT_CEA_3840X2160P24 },
> +	/* 6G - 3840X2160p25 */
> +	{ 3840, 2160, 25, V4L2_DV_BT_CEA_3840X2160P25 },
> +	/* 6G - 3840X2160p29.97 */
> +	/* 6G - 3840X2160p30 */
> +	{ 3840, 2160, 30, V4L2_DV_BT_CEA_3840X2160P30 },
> +	/* 6G - 4096X2160p23.98 */
> +	/* 6G - 4096X2160p24 */
> +	{ 4096, 2160, 24, V4L2_DV_BT_CEA_4096X2160P24 },
> +	/* 6G - 4096X2160p25 */
> +	{ 4096, 2160, 25, V4L2_DV_BT_CEA_4096X2160P25 },
> +	/* 6G - 4096X2160p29.97 */
> +	/* 6G - 4096X2160p30 */
> +	{ 4096, 2160, 30, V4L2_DV_BT_CEA_4096X2160P30 },
> +	/* 12G - 3840X2160p47.95 */
> +	/* 12G - 3840X2160p48 */
> +	{ 3840, 2160, 48, V4L2_DV_BT_CEA_3840X2160P48 },
> +
> +	/* 12G - 3840X2160p50 */
> +	{ 3840, 2160, 50, V4L2_DV_BT_CEA_3840X2160P50 },
> +	/* 12G - 3840X2160p59.94 */
> +	/* 12G - 3840X2160p60 */
> +	{ 3840, 2160, 60, V4L2_DV_BT_CEA_3840X2160P60 },
> +
> +	/* 12G - 4096X2160p47.95 */
> +	/* 12G - 4096X2160p48 */
> +	{ 3840, 2160, 48, V4L2_DV_BT_CEA_4096X2160P48 },
> +
> +	/* 12G - 4096X2160p50 */
> +	{ 4096, 2160, 50, V4L2_DV_BT_CEA_4096X2160P50 },
> +	/* 12G - 4096X2160p59.94 */
> +	/* 12G - 4096X2160p60 */
> +	{ 4096, 2160, 60, V4L2_DV_BT_CEA_4096X2160P60 },
> +};
> +
> +static const struct v4l2_dv_timings_cap xsdirxss_timings_cap =3D {
> +	.type =3D V4L2_DV_BT_656_1120,
> +	.pad =3D 0,
> +	.reserved =3D { 0 },
> +	V4L2_INIT_BT_TIMINGS(XSDIRXSS_WIDTH_MIN, XSDIRXSS_WIDTH_MAX,
> +			     XSDIRXSS_HEIGHT_MIN, XSDIRXSS_HEIGHT_MAX,
> +			     XSDIRXSS_PIXELCLOCK_MIN, XSDIRXSS_PIXELCLOCK_MAX,
> +			     V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_SDI,
> +			     V4L2_DV_BT_CAP_PROGRESSIVE
> +			     | V4L2_DV_BT_CAP_INTERLACED)
> +
> +};
> +
> +struct regmap {
> +	const char *name;
> +	u32 offset;
> +};
> +
> +static const struct regmap xsdirxss_regmap[] =3D {
> +	{ .name =3D "Reset Control", .offset =3D XSDIRX_RST_CTRL_REG },
> +	{ .name =3D "Module Control", .offset =3D XSDIRX_MDL_CTRL_REG },
> +	{ .name =3D "Interrupt Enable", .offset =3D XSDIRX_IER_REG },
> +	{ .name =3D "Global Interrupt Enable", .offset =3D XSDIRX_GLBL_IER_RE=
G },
> +	{ .name =3D "ST352 Valid", .offset =3D XSDIRX_ST352_VALID_REG },
> +	{ .name =3D "ST352 DS1", .offset =3D XSDIRX_ST352_DS1_REG },
> +	{ .name =3D "ST352 DS2", .offset =3D XSDIRX_ST352_DS2_REG },
> +	{ .name =3D "ST352 DS3", .offset =3D XSDIRX_ST352_DS3_REG },
> +	{ .name =3D "ST352 DS4", .offset =3D XSDIRX_ST352_DS4_REG },
> +	{ .name =3D "ST352 DS5", .offset =3D XSDIRX_ST352_DS5_REG },
> +	{ .name =3D "ST352 DS6", .offset =3D XSDIRX_ST352_DS6_REG },
> +	{ .name =3D "ST352 DS7", .offset =3D XSDIRX_ST352_DS7_REG },
> +	{ .name =3D "ST352 DS8", .offset =3D XSDIRX_ST352_DS8_REG },
> +	{ .name =3D "ST352 DS9", .offset =3D XSDIRX_ST352_DS9_REG },
> +	{ .name =3D "ST352 DS10", .offset =3D XSDIRX_ST352_DS10_REG },
> +	{ .name =3D "ST352 DS11", .offset =3D XSDIRX_ST352_DS11_REG },
> +	{ .name =3D "ST352 DS12", .offset =3D XSDIRX_ST352_DS12_REG },
> +	{ .name =3D "ST352 DS13", .offset =3D XSDIRX_ST352_DS13_REG },
> +	{ .name =3D "ST352 DS14", .offset =3D XSDIRX_ST352_DS14_REG },
> +	{ .name =3D "ST352 DS15", .offset =3D XSDIRX_ST352_DS15_REG },
> +	{ .name =3D "ST352 DS16", .offset =3D XSDIRX_ST352_DS16_REG },
> +	{ .name =3D "Version", .offset =3D XSDIRX_VERSION_REG },
> +	{ .name =3D "Subsystem Config ", .offset =3D XSDIRX_SS_CONFIG_REG },
> +	{ .name =3D "Mode Detect", .offset =3D XSDIRX_MODE_DET_STAT_REG },
> +	{ .name =3D "Transport Stream Detect", .offset =3D XSDIRX_TS_DET_STAT=
_REG },
> +	{ .name =3D "EDH Status", .offset =3D XSDIRX_EDH_STAT_REG },
> +	{ .name =3D "EDH Error Count", .offset =3D XSDIRX_EDH_ERRCNT_EN_REG }=
,
> +	{ .name =3D "CRC error indication", .offset =3D XSDIRX_CRC_ERRCNT_REG=
 },
> +	{ .name =3D "Video Lock Window", .offset =3D XSDIRX_VID_LOCK_WINDOW_R=
EG },
> +};
> +
> +static inline struct xsdirxss_state *
> +to_xsdirxssstate(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct xsdirxss_state, subdev);
> +}
> +
> +/*
> + * Register related operations
> + */
> +static inline u32 xsdirxss_read(struct xsdirxss_state *xsdirxss, u32 a=
ddr)
> +{
> +	return ioread32(xsdirxss->iomem + addr);
> +}
> +
> +static inline void xsdirxss_write(struct xsdirxss_state *xsdirxss, u32=
 addr,
> +				  u32 value)
> +{
> +	iowrite32(value, xsdirxss->iomem + addr);
> +}
> +
> +static inline void xsdirxss_clr(struct xsdirxss_state *xsdirxss, u32 a=
ddr,
> +				u32 clr)
> +{
> +	xsdirxss_write(xsdirxss, addr, xsdirxss_read(xsdirxss, addr) & ~clr);
> +}
> +
> +static inline void xsdirxss_set(struct xsdirxss_state *xsdirxss, u32 a=
ddr,
> +				u32 set)
> +{
> +	xsdirxss_write(xsdirxss, addr, xsdirxss_read(xsdirxss, addr) | set);
> +}
> +

In my opinion, from here to

> +#define XSDIRX_CORE_DISABLE(state)  xsdirxss_clr((state), XSDIRX_RST_C=
TRL_REG,\
> +						 XSDIRX_RST_CTRL_SS_EN_MASK)
> +
> +#define XSDIRX_CORE_ENABLE(state)  xsdirxss_set((state), XSDIRX_RST_CT=
RL_REG,\
> +						XSDIRX_RST_CTRL_SS_EN_MASK)
> +
> +#define XSDIRX_GLOBAL_INTR_ENABLE(state)	\
> +	xsdirxss_set((state), XSDIRX_GLBL_IER_REG, XSDIRX_GLBL_INTR_EN_MASK)
> +
> +#define XSDIRX_GLOBAL_INTR_DISABLE(state)	\
> +	xsdirxss_clr((state), XSDIRX_GLBL_IER_REG, XSDIRX_GLBL_INTR_EN_MASK)

here, inlining single liners or static inline would be better than above =
macros.

> +
> +static int xsdirx_set_modedetect(struct xsdirxss_state *state, u16 mas=
k)
> +{
> +	u32 val;
> +	struct device *dev =3D state->dev;
> +
> +	mask &=3D XSDIRX_DETECT_ALL_MODES;
> +	if (!mask) {
> +		dev_err(dev, "Invalid bit mask =3D 0x%08x\n", mask);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "mask =3D 0x%x\n", mask);
> +
> +	val =3D xsdirxss_read(state, XSDIRX_MDL_CTRL_REG);
> +	val &=3D ~XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> +	val &=3D ~XSDIRX_MDL_CTRL_MODE_AUTO_DET_MASK;
> +	val &=3D ~XSDIRX_MDL_CTRL_FORCED_MODE_MASK;
> +
> +	if (hweight16(mask) > 1) {
> +		/* Multi mode detection as more than 1 bit set in mask */
> +		dev_dbg(dev, "Detect multiple modes\n");
> +
> +		if (mask & BIT(XSDIRX_MODE_SD_OFFSET))
> +			val |=3D XSDIRX_MDL_CTRL_MODE_SD_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_HD_OFFSET))
> +			val |=3D XSDIRX_MDL_CTRL_MODE_HD_EN_MASK;
> +		/*
> +		 * There is only one bit in IP to detect 3G mode.
> +		 * So set it when 3GA or 3GB mask is set.
> +		 */
> +		if (mask & (BIT(XSDIRX_MODE_3GA_OFFSET) |
> +			    BIT(XSDIRX_MODE_3GB_OFFSET)))
> +			val |=3D XSDIRX_MDL_CTRL_MODE_3G_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_6G_OFFSET))
> +			val |=3D XSDIRX_MDL_CTRL_MODE_6G_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_12GI_OFFSET))
> +			val |=3D XSDIRX_MDL_CTRL_MODE_12GI_EN_MASK;
> +		if (mask & BIT(XSDIRX_MODE_12GF_OFFSET))
> +			val |=3D XSDIRX_MDL_CTRL_MODE_12GF_EN_MASK;
> +
> +		val |=3D XSDIRX_MDL_CTRL_MODE_DET_EN_MASK;
> +	} else {
> +		/* Fixed Mode */
> +		u32 forced_mode_mask;
> +
> +		dev_dbg(dev, "Detect fixed mode\n");
> +
> +		/* Find offset of first bit set */
> +		switch (mask) {
> +		case XSDIRX_MODE_SD_OFFSET:
> +			forced_mode_mask =3D XSDIRX_MODE_SD_MASK;
> +			break;
> +		case XSDIRX_MODE_HD_OFFSET:
> +			forced_mode_mask =3D XSDIRX_MODE_HD_MASK;
> +			break;
> +		/*
> +		 * There is only one bit in IP to detect 3G mode.
> +		 * So set it when 3GA or 3GB mask is set.
> +		 */
> +		case XSDIRX_MODE_3GA_OFFSET:
> +		case XSDIRX_MODE_3GB_OFFSET:
> +			forced_mode_mask =3D XSDIRX_MODE_3G_MASK;
> +			break;
> +		case XSDIRX_MODE_6G_OFFSET:
> +			forced_mode_mask =3D XSDIRX_MODE_6G_MASK;
> +			break;
> +		case XSDIRX_MODE_12GI_OFFSET:
> +			forced_mode_mask =3D XSDIRX_MODE_12GI_MASK;
> +			break;
> +		case XSDIRX_MODE_12GF_OFFSET:
> +			forced_mode_mask =3D XSDIRX_MODE_12GF_MASK;
> +			break;
> +		default:
> +			dev_err(dev, "Invalid mask for fixed detect mode\n");
> +			return -EINVAL;
> +		}
> +		dev_dbg(dev, "Forced Mode Mask : 0x%x\n",
> +			forced_mode_mask);
> +		val |=3D forced_mode_mask << XSDIRX_MDL_CTRL_FORCED_MODE_OFFSET;
> +	}
> +
> +	dev_dbg(dev, "Modes to be detected : sdi ctrl reg =3D 0x%08x\n",
> +		val);
> +	xsdirxss_write(state, XSDIRX_MDL_CTRL_REG, val);
> +
> +	return 0;
> +}
> +
> +static void xsdirx_streamflow_control(struct xsdirxss_state *state, bo=
ol enable)
> +{
> +	/* The sdi to native bridge is followed by native to axis4 bridge */
> +	/*
> +	 * TODO - Enable YUV444/RBG format in the bridge based
> +	 * on BYTE3 color format.
> +	 * XSDIRX_RST_CTRL_BRIDGE_CH_FMT_YUV444
> +	 */
> +	if (enable) {
> +		xsdirxss_set(state, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> +		xsdirxss_set(state, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK);
> +	} else {
> +		xsdirxss_clr(state, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_SDIRX_BRIDGE_ENB_MASK);
> +		xsdirxss_clr(state, XSDIRX_RST_CTRL_REG,
> +			     XSDIRX_RST_CTRL_VIDIN_AXI4S_MOD_ENB_MASK);
> +	}
> +	state->streaming =3D enable;
> +}
> +
> +static void xsdirxss_get_framerate(struct v4l2_fract *frame_interval,
> +				   u32 framerate)
> +{
> +	switch (framerate) {
> +	case XSDIRX_TS_DET_STAT_RATE_23_98HZ:
> +		frame_interval->numerator =3D 1001;
> +		frame_interval->denominator =3D 24000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_24HZ:
> +		frame_interval->numerator =3D 1000;
> +		frame_interval->denominator =3D 24000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_25HZ:
> +		frame_interval->numerator =3D 1000;
> +		frame_interval->denominator =3D 25000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_29_97HZ:
> +		frame_interval->numerator =3D 1001;
> +		frame_interval->denominator =3D 30000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_30HZ:
> +		frame_interval->numerator =3D 1000;
> +		frame_interval->denominator =3D 30000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_47_95HZ:
> +		frame_interval->numerator =3D 1001;
> +		frame_interval->denominator =3D 48000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_48HZ:
> +		frame_interval->numerator =3D 1000;
> +		frame_interval->denominator =3D 48000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_50HZ:
> +		frame_interval->numerator =3D 1000;
> +		frame_interval->denominator =3D 50000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_59_94HZ:
> +		frame_interval->numerator =3D 1001;
> +		frame_interval->denominator =3D 60000;
> +		break;
> +	case XSDIRX_TS_DET_STAT_RATE_60HZ:
> +		frame_interval->numerator =3D 1000;
> +		frame_interval->denominator =3D 60000;
> +		break;
> +	default:
> +		frame_interval->numerator =3D 1;
> +		frame_interval->denominator =3D 1;

This shouldn't happen, so would it make sense to have an error here?

> +	}
> +}
> +
> +static void xsdirxss_set_gtclk(struct xsdirxss_state *state)
> +{
> +	struct clk *gtclk;

This variable is not needed. Up to you.

> +	unsigned long clkrate;
> +	int ret, is_frac;
> +	u32 mode;
> +
> +	mode =3D xsdirxss_read(state, XSDIRX_MODE_DET_STAT_REG);
> +	mode &=3D XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +	/*
> +	 * TODO: For now, don't change the clock rate for any mode except 12G=
.
> +	 * In future, configure gt clock for all modes and enable clock only
> +	 * when needed (stream on/off).
> +	 */
> +	if (mode !=3D XSDIRX_MODE_12GI_MASK && mode !=3D XSDIRX_MODE_12GF_MAS=
K)
> +		return;
> +
> +	/* When numerator is 1001 then frame rate is fractional else integer =
*/
> +	is_frac =3D state->frame_interval.numerator =3D=3D 1001 ? 1 : 0;
> +
> +	if (state->prev_is_frac =3D=3D is_frac)
> +		return;
> +
> +	XSDIRX_GLOBAL_INTR_DISABLE(state);
> +	xsdirxss_clr(state, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> +	XSDIRX_CORE_DISABLE(state);
> +
> +	/* get sdi_rx_clk */

I'd remove this comment,

> +	gtclk =3D state->clks[1].clk;
> +
> +	/* calculate clkrate */

and this. Up to you.

> +	if (!is_frac)
> +		clkrate =3D CLK_INT;
> +	else
> +		clkrate =3D (CLK_INT * 1000) / 1001;
> +
> +	ret =3D clk_set_rate(gtclk, clkrate);
> +	if (ret)
> +		dev_err(state->dev, "failed to set clk rate =3D %d\n", ret);
> +
> +	state->prev_is_frac =3D is_frac;
> +	clkrate =3D clk_get_rate(gtclk);

Shouldn't the returned rate be checked and warn if diff is too much? Abov=
e
changes the rate by 0.1% which means the rate should be quite precise. So=
 it
better be checked.

> +
> +	dev_dbg(state->dev, "clkrate =3D %lu is_frac =3D %d\n",
> +		clkrate, is_frac);
> +
> +	if (state->framer_enable) {
> +		xsdirxss_set(state, XSDIRX_MDL_CTRL_REG,
> +			     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> +	} else {
> +		xsdirxss_clr(state, XSDIRX_MDL_CTRL_REG,
> +			     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> +	}
> +	xsdirxss_write(state, XSDIRX_EDH_ERRCNT_EN_REG,
> +		       state->edhmask & XSDIRX_EDH_ALLERR_MASK);
> +	xsdirxss_write(state, XSDIRX_VID_LOCK_WINDOW_REG, state->vidlocked);
> +	xsdirx_set_modedetect(state, state->searchmask);
> +	XSDIRX_CORE_ENABLE(state);
> +	xsdirxss_set(state, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> +	XSDIRX_GLOBAL_INTR_ENABLE(state);
> +}
> +
> +/**
> + * xsdirx_get_stream_properties - Get SDI Rx stream properties
> + * @state: pointer to driver state
> + *
> + * This function decodes the stream's ST352 payload (if available) to =
get
> + * stream properties like width, height, picture type (interlaced/prog=
ressive),
> + * etc.
> + *
> + * Return: 0 for success else errors
> + */
> +static int xsdirx_get_stream_properties(struct xsdirxss_state *state)
> +{
> +	struct device *dev =3D state->dev;
> +	u32 mode, payload =3D 0, val, family, valid, tscan;
> +	u8 byte1 =3D 0, active_luma =3D 0, pic_type =3D 0, framerate =3D 0;
> +	u8 sampling =3D XST352_BYTE3_COLOR_FORMAT_422;
> +	struct v4l2_mbus_framefmt *format =3D &state->format;
> +	u32 bpc =3D XST352_BYTE4_BIT_DEPTH_10;
> +	u32 colorimetry =3D XST352_BYTE3_COLORIMETRY_BT709;
> +
> +	mode =3D xsdirxss_read(state, XSDIRX_MODE_DET_STAT_REG);
> +	mode &=3D XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +	valid =3D xsdirxss_read(state, XSDIRX_ST352_VALID_REG);
> +
> +	if (mode >=3D XSDIRX_MODE_3G_MASK && !valid) {
> +		dev_err(dev, "No valid ST352 payload present even for 3G mode and ab=
ove\n");
> +		return -EINVAL;
> +	}
> +
> +	val =3D xsdirxss_read(state, XSDIRX_TS_DET_STAT_REG);
> +	if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> +		payload =3D xsdirxss_read(state, XSDIRX_ST352_DS1_REG);
> +		byte1 =3D FIELD_GET(XST352_PAYLOAD_BYTE1_MASK, payload);
> +		active_luma =3D FIELD_GET(XST352_BYTE3_ACT_LUMA_COUNT_MASK,
> +					payload);
> +		pic_type =3D FIELD_GET(XST352_BYTE2_PIC_TYPE_MASK, payload);
> +		framerate =3D FIELD_GET(XST352_BYTE2_FPS_MASK, payload);
> +		tscan =3D FIELD_GET(XST352_BYTE2_TS_TYPE_MASK, payload);
> +		sampling =3D FIELD_GET(XST352_BYTE3_COLOR_FORMAT_MASK, payload);
> +		bpc =3D FIELD_GET(XST352_BYTE4_BIT_DEPTH_MASK, payload);
> +		colorimetry =3D FIELD_GET(XST352_BYTE3_COLORIMETRY_MASK, payload);
> +	} else {
> +		dev_dbg(dev, "No ST352 payload available : Mode =3D %d\n", mode);
> +		framerate =3D FIELD_GET(XSDIRX_TS_DET_STAT_RATE_MASK, val);
> +		tscan =3D FIELD_GET(XSDIRX_TS_DET_STAT_SCAN_MASK, val);
> +	}
> +
> +	if ((bpc =3D=3D XST352_BYTE4_BIT_DEPTH_10 && state->bpc !=3D 10) ||
> +	    (bpc =3D=3D XST352_BYTE4_BIT_DEPTH_12 && state->bpc !=3D 12)) {
> +		dev_dbg(dev, "Bit depth not supported. bpc =3D %d state->bpc =3D %d\=
n",
> +			bpc, state->bpc);
> +		return -EINVAL;
> +	}
> +
> +	family =3D FIELD_GET(XSDIRX_TS_DET_STAT_FAMILY_MASK, val);
> +	state->ts_is_interlaced =3D tscan ? false : true;
> +
> +	dev_dbg(dev, "ts_is_interlaced =3D %d, family =3D %d\n",
> +		state->ts_is_interlaced, family);
> +
> +	switch (mode) {
> +	case XSDIRX_MODE_HD_MASK:
> +		if (!valid) {
> +			/* No payload obtained */
> +			dev_dbg(dev, "frame rate : %d, tscan =3D %d\n",
> +				framerate, tscan);
> +			/*
> +			 * NOTE : A progressive segmented frame pSF will be
> +			 * reported incorrectly as Interlaced as we rely on IP's
> +			 * transport scan locked bit.
> +			 */
> +			dev_warn(dev, "pSF will be incorrectly reported as Interlaced\n");
> +
> +			switch (framerate) {
> +			case XSDIRX_TS_DET_STAT_RATE_23_98HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_24HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_25HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_29_97HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_30HZ:
> +				if (family =3D=3D XSDIRX_SMPTE_ST_296) {
> +					format->width =3D 1280;
> +					format->height =3D 720;
> +					format->field =3D V4L2_FIELD_NONE;
> +				} else if (family =3D=3D XSDIRX_SMPTE_ST_2048_2) {
> +					format->width =3D 2048;
> +					format->height =3D 1080;
> +					if (tscan)
> +						format->field =3D V4L2_FIELD_NONE;
> +					else
> +						format->field =3D
> +							V4L2_FIELD_ALTERNATE;
> +				} else {
> +					format->width =3D 1920;
> +					format->height =3D 1080;
> +					if (tscan)
> +						format->field =3D V4L2_FIELD_NONE;
> +					else
> +						format->field =3D
> +							V4L2_FIELD_ALTERNATE;
> +				}
> +				break;
> +			case XSDIRX_TS_DET_STAT_RATE_50HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_59_94HZ:
> +			case XSDIRX_TS_DET_STAT_RATE_60HZ:
> +				if (family =3D=3D XSDIRX_SMPTE_ST_274) {
> +					format->width =3D 1920;
> +					format->height =3D 1080;
> +				} else {
> +					format->width =3D 1280;
> +					format->height =3D 720;
> +				}
> +				format->field =3D V4L2_FIELD_NONE;
> +				break;
> +			default:
> +				format->width =3D 1920;
> +				format->height =3D 1080;
> +				format->field =3D V4L2_FIELD_NONE;
> +			}
> +		} else {
> +			dev_dbg(dev, "Got the payload\n");
> +			switch (byte1) {
> +			case XST352_BYTE1_ST292_1x720L_1_5G:
> +				/* SMPTE ST 292-1 for 720 line payloads */
> +				format->width =3D 1280;
> +				format->height =3D 720;
> +				break;
> +			case XST352_BYTE1_ST292_1x1080L_1_5G:
> +				/* SMPTE ST 292-1 for 1080 line payloads */
> +				format->height =3D 1080;
> +				if (active_luma)
> +					format->width =3D 2048;
> +				else
> +					format->width =3D 1920;
> +				break;
> +			default:
> +				dev_dbg(dev, "Unknown HD Mode SMPTE standard\n");
> +				return -EINVAL;
> +			}
> +		}
> +		break;
> +	case XSDIRX_MODE_SD_MASK:
> +		format->field =3D V4L2_FIELD_ALTERNATE;
> +
> +		switch (family) {
> +		case XSDIRX_NTSC:
> +			format->width =3D 720;
> +			format->height =3D 486;
> +			break;
> +		case XSDIRX_PAL:
> +			format->width =3D 720;
> +			format->height =3D 576;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown SD Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case XSDIRX_MODE_3G_MASK:
> +		switch (byte1) {
> +		case XST352_BYTE1_ST425_2008_750L_3GB:
> +			/* Sec 4.1.6.1 SMPTE 425-2008 */
> +		case XST352_BYTE1_ST372_2x720L_3GB:
> +			/* Table 13 SMPTE 425-2008 */
> +			format->width =3D 1280;
> +			format->height =3D 720;
> +			break;
> +		case XST352_BYTE1_ST425_2008_1125L_3GA:
> +			/* ST352 Table SMPTE 425-1 */
> +		case XST352_BYTE1_ST372_DL_3GB:
> +			/* Table 13 SMPTE 425-2008 */
> +		case XST352_BYTE1_ST372_2x1080L_3GB:
> +			/* Table 13 SMPTE 425-2008 */
> +			format->height =3D 1080;
> +			if (active_luma)
> +				format->width =3D 2048;
> +			else
> +				format->width =3D 1920;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown 3G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case XSDIRX_MODE_6G_MASK:
> +		switch (byte1) {
> +		case XST352_BYTE1_ST2081_10_DL_2160L_6G:
> +			/* Dual link 6G */
> +		case XST352_BYTE1_ST2081_10_2160L_6G:
> +			/* Table 3 SMPTE ST 2081-10 */
> +			format->height =3D 2160;
> +			if (active_luma)
> +				format->width =3D 4096;
> +			else
> +				format->width =3D 3840;
> +			break;
> +		case XST352_BYTE1_ST2081_10_2_1080L_6G:
> +			format->height =3D 1080;
> +			if (active_luma)
> +				format->width =3D 2048;
> +			else
> +				format->width =3D 1920;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown 6G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case XSDIRX_MODE_12GI_MASK:
> +	case XSDIRX_MODE_12GF_MASK:
> +		switch (byte1) {
> +		case XST352_BYTE1_ST2082_10_2160L_12G:
> +			/* Section 4.3.1 SMPTE ST 2082-10 */
> +			format->height =3D 2160;
> +			if (active_luma)
> +				format->width =3D 4096;
> +			else
> +				format->width =3D 3840;
> +			break;
> +		default:
> +			dev_dbg(dev, "Unknown 12G Mode SMPTE standard\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		dev_err(dev, "Invalid Mode\n");
> +		return -EINVAL;
> +	}
> +
> +	if (valid) {
> +		if (pic_type)
> +			format->field =3D V4L2_FIELD_NONE;
> +		else
> +			format->field =3D V4L2_FIELD_ALTERNATE;
> +
> +		if (format->height =3D=3D 1080 && pic_type && !tscan)
> +			format->field =3D V4L2_FIELD_ALTERNATE;
> +
> +		/*
> +		 * In 3GB DL pSF mode the video is similar to interlaced.
> +		 * So though it is a progressive video, its transport is
> +		 * interlaced and is sent as two width x (height/2) buffers.
> +		 */
> +		if (byte1 =3D=3D XST352_BYTE1_ST372_DL_3GB) {
> +			if (state->ts_is_interlaced)
> +				format->field =3D V4L2_FIELD_ALTERNATE;
> +			else
> +				format->field =3D V4L2_FIELD_NONE;
> +		}
> +	}
> +
> +	if (format->field =3D=3D V4L2_FIELD_ALTERNATE)
> +		format->height =3D format->height / 2;
> +
> +	switch (sampling) {
> +	case XST352_BYTE3_COLOR_FORMAT_422:
> +		if (state->bpc =3D=3D 10)
> +			format->code =3D MEDIA_BUS_FMT_UYVY10_1X20;
> +		else
> +			format->code =3D MEDIA_BUS_FMT_UYVY12_1X24;
> +		break;
> +	case XST352_BYTE3_COLOR_FORMAT_420:
> +	case XST352_BYTE3_COLOR_FORMAT_YUV444:
> +	case XST352_BYTE3_COLOR_FORMAT_GBR:
> +		format->code =3D 0;
> +		dev_dbg(dev, "No corresponding media bus formats\n");
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported color format : %d\n", sampling);
> +		return -EINVAL;
> +	}
> +
> +	/* Refer Table 3 SMPTE ST 2081-10:2018 */
> +	switch (colorimetry) {
> +	case XST352_BYTE3_COLORIMETRY_BT709:
> +		format->colorspace =3D V4L2_COLORSPACE_REC709;
> +		break;
> +	/* When HDR support is added UHDTV will have BT2020 colorspace */
> +	case XST352_BYTE3_COLORIMETRY_UHDTV:
> +	case XST352_BYTE3_COLORIMETRY_COLOR_VANC:
> +	case XST352_BYTE3_COLORIMETRY_UNKNOWN:
> +	default:
> +		dev_err(dev, "Unknown colorimetry : %d\n", colorimetry);
> +		return -EINVAL;
> +	}
> +
> +	xsdirxss_get_framerate(&state->frame_interval, framerate);
> +
> +	dev_dbg(dev, "Stream width =3D %d height =3D %d Field =3D %d payload =
=3D 0x%08x ts =3D 0x%08x\n",
> +		format->width, format->height, format->field, payload, val);
> +	dev_dbg(dev, "frame rate numerator =3D %d denominator =3D %d\n",
> +		state->frame_interval.numerator,
> +		state->frame_interval.denominator);
> +	dev_dbg(dev, "Stream code =3D 0x%x\n", format->code);
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_irq_handler - Interrupt handler for SDI Rx
> + * @irq: IRQ number
> + * @dev_id: Pointer to device state
> + *
> + * The SDI Rx interrupts are cleared by writing 1 to corresponding bit=
.
> + *
> + * Return: IRQ_HANDLED after handling interrupts
> + */
> +static irqreturn_t xsdirxss_irq_handler(int irq, void *dev_id)
> +{
> +	struct xsdirxss_state *state =3D (struct xsdirxss_state *)dev_id;
> +	struct device *dev =3D state->dev;
> +	u32 status;
> +
> +	status =3D xsdirxss_read(state, XSDIRX_ISR_REG);
> +	xsdirxss_write(state, XSDIRX_ISR_REG, status);

This can be done after check below, so IO is skipped when not needed.

> +	dev_dbg(dev, "interrupt status =3D 0x%08x\n", status);
> +
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	if (status & XSDIRX_INTR_VIDLOCK_MASK ||
> +	    status & XSDIRX_INTR_VIDUNLOCK_MASK) {
> +		u32 val1, val2;
> +		struct v4l2_event event =3D { 0 };
> +		unsigned long flags;
> +
> +		dev_dbg(dev, "video lock/unlock interrupt\n");
> +
> +		spin_lock_irqsave(&state->slock, flags);
> +		xsdirx_streamflow_control(state, false);
> +
> +		val1 =3D xsdirxss_read(state, XSDIRX_MODE_DET_STAT_REG);
> +		val2 =3D xsdirxss_read(state, XSDIRX_TS_DET_STAT_REG);
> +
> +		if ((val1 & XSDIRX_MODE_DET_STAT_MODE_LOCK_MASK) &&
> +		    (val2 & XSDIRX_TS_DET_STAT_LOCKED_MASK)) {
> +			u32 mask =3D XSDIRX_RST_CTRL_RST_CRC_ERRCNT_MASK |
> +				   XSDIRX_RST_CTRL_RST_EDH_ERRCNT_MASK;
> +
> +			dev_dbg(dev, "video lock interrupt\n");
> +
> +			xsdirxss_set(state, XSDIRX_RST_CTRL_REG, mask);
> +			xsdirxss_clr(state, XSDIRX_RST_CTRL_REG, mask);
> +
> +			val1 =3D xsdirxss_read(state, XSDIRX_ST352_VALID_REG);
> +			val2 =3D xsdirxss_read(state, XSDIRX_ST352_DS1_REG);
> +
> +			dev_dbg(dev, "valid st352 mask =3D 0x%08x\n", val1);
> +			dev_dbg(dev, "st352 payload =3D 0x%08x\n", val2);
> +
> +			if (!xsdirx_get_stream_properties(state)) {
> +				state->vidlocked =3D true;
> +				xsdirxss_set_gtclk(state);
> +			} else {
> +				dev_err(dev, "Unable to get stream properties!\n");
> +				state->vidlocked =3D false;
> +			}
> +		} else {
> +			dev_dbg(dev, "video unlock interrupt\n");
> +			state->vidlocked =3D false;
> +		}
> +		spin_unlock_irqrestore(&state->slock, flags);
> +
> +		event.type =3D V4L2_EVENT_SOURCE_CHANGE;
> +		event.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION;
> +		v4l2_subdev_notify_event(&state->subdev, &event);
> +	}
> +
> +	if (status & (XSDIRX_INTR_UNDERFLOW_MASK | XSDIRX_INTR_OVERFLOW_MASK)=
) {
> +		struct v4l2_event event =3D { 0 };
> +
> +		dev_dbg(dev, "Video in to AXI4 Stream core under/overflow interrupt\=
n");
> +
> +		event.type =3D V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW;
> +		if (status & XSDIRX_INTR_UNDERFLOW_MASK)
> +			event.u.data[0] =3D XILINX_SDIRX_UNDERFLOW_EVENT;
> +		if (status & XSDIRX_INTR_OVERFLOW_MASK)
> +			event.u.data[0] =3D XILINX_SDIRX_OVERFLOW_EVENT;

Should be ORed?

> +
> +		v4l2_subdev_notify_event(&state->subdev, &event);
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +/**
> + * xsdirxss_subscribe_event - Subscribe to video lock and unlock event
> + * @sd: V4L2 Sub device
> + * @fh: V4L2 File Handle
> + * @sub: Subcribe event structure
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_subscribe_event(struct v4l2_subdev *sd,
> +				    struct v4l2_fh *fh,
> +				    struct v4l2_event_subscription *sub)
> +{
> +	int ret;
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +
> +	dev_dbg(xsdirxss->dev, "Event subscribed : 0x%08x\n", sub->type);
> +	switch (sub->type) {
> +	case V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW:
> +		ret =3D v4l2_event_subscribe(fh, sub, XSDIRX_MAX_EVENTS, NULL);
> +		break;
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		ret =3D v4l2_src_change_event_subscribe(fh, sub);
> +		break;
> +	default:
> +		ret =3D v4l2_ctrl_subscribe_event(fh, sub);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * xsdirxss_s_ctrl - This is used to set the Xilinx SDI Rx V4L2 contro=
ls
> + * @ctrl: V4L2 control to be set
> + *
> + * This function is used to set the V4L2 controls for the Xilinx SDI R=
x
> + * Subsystem.
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	int ret =3D 0;

No need to initialize this.

> +	struct xsdirxss_state *xsdirxss =3D
> +		container_of(ctrl->handler, struct xsdirxss_state,
> +			     ctrl_handler);
> +	struct device *dev =3D xsdirxss->dev;
> +	unsigned long flags;
> +
> +	dev_dbg(dev, "set ctrl id =3D 0x%08x val =3D 0x%08x\n",
> +		ctrl->id, ctrl->val);
> +
> +	spin_lock_irqsave(&xsdirxss->slock, flags);
> +
> +	if (xsdirxss->streaming) {
> +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +		dev_err(dev, "Cannot set controls while streaming\n");
> +		return -EINVAL;
> +	}
> +
> +	XSDIRX_CORE_DISABLE(xsdirxss);
> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_SDIRX_FRAMER:
> +		xsdirxss->framer_enable =3D ctrl->val;
> +		if (xsdirxss->framer_enable) {
> +			xsdirxss_set(xsdirxss, XSDIRX_MDL_CTRL_REG,
> +				     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> +		} else {
> +			xsdirxss_clr(xsdirxss, XSDIRX_MDL_CTRL_REG,
> +				     XSDIRX_MDL_CTRL_FRM_EN_MASK);
> +		}
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW:
> +		/*
> +		 * The video lock window is the amount of time for which the
> +		 * the mode and transport stream should be locked to get the
> +		 * video lock interrupt.
> +		 */
> +		xsdirxss->vidlockwin =3D ctrl->val;
> +		xsdirxss_write(xsdirxss, XSDIRX_VID_LOCK_WINDOW_REG,
> +			       xsdirxss->vidlockwin);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES:
> +		xsdirxss->edhmask =3D ctrl->val & XSDIRX_EDH_ALLERR_MASK;
> +		xsdirxss_write(xsdirxss, XSDIRX_EDH_ERRCNT_EN_REG,
> +			       xsdirxss->edhmask);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_SEARCH_MODES:
> +		if (!ctrl->val) {
> +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +			dev_err(dev, "Select at least one mode!\n");
> +			return -EINVAL;
> +		}
> +
> +		if (xsdirxss->mode =3D=3D XSDI_STD_3G) {
> +			dev_dbg(dev, "Upto 3G supported\n");
> +			ctrl->val &=3D ~(BIT(XSDIRX_MODE_6G_OFFSET) |
> +				       BIT(XSDIRX_MODE_12GI_OFFSET) |
> +				       BIT(XSDIRX_MODE_12GF_OFFSET));
> +		}
> +
> +		if (xsdirxss->mode =3D=3D XSDI_STD_6G) {
> +			dev_dbg(dev, "Upto 6G supported\n");
> +			ctrl->val &=3D ~(BIT(XSDIRX_MODE_12GI_OFFSET) |
> +				       BIT(XSDIRX_MODE_12GF_OFFSET));
> +		}
> +
> +		ret =3D xsdirx_set_modedetect(xsdirxss, ctrl->val);
> +		if (!ret)
> +			xsdirxss->searchmask =3D ctrl->val;
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +	XSDIRX_CORE_ENABLE(xsdirxss);
> +
> +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +	return ret;
> +}
> +
> +/**
> + * xsdirxss_g_volatile_ctrl - get the Xilinx SDI Rx controls
> + * @ctrl: Pointer to V4L2 control
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	u32 val;
> +	struct xsdirxss_state *xsdirxss =3D
> +		container_of(ctrl->handler,
> +			     struct xsdirxss_state, ctrl_handler);
> +	struct device *dev =3D xsdirxss->dev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xsdirxss->slock, flags);
> +	if (!xsdirxss->vidlocked) {
> +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +		dev_err(dev, "Can't get values when video not locked!\n");
> +		return -EINVAL;
> +	}
> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_SDIRX_MODE_DETECT:
> +		val =3D xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> +		val &=3D XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +
> +		switch (val) {
> +		case XSDIRX_MODE_SD_MASK:
> +			ctrl->val =3D XSDIRX_MODE_SD_OFFSET;
> +			break;
> +		case XSDIRX_MODE_HD_MASK:
> +			ctrl->val =3D XSDIRX_MODE_HD_OFFSET;
> +			break;
> +		case XSDIRX_MODE_3G_MASK:
> +			val =3D xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> +			val &=3D XSDIRX_MODE_DET_STAT_LVLB_3G_MASK;
> +			ctrl->val =3D val ? XSDIRX_MODE_3GB_OFFSET :
> +				XSDIRX_MODE_3GA_OFFSET;
> +			break;
> +		case XSDIRX_MODE_6G_MASK:
> +			ctrl->val =3D XSDIRX_MODE_6G_OFFSET;
> +			break;
> +		case XSDIRX_MODE_12GI_MASK:
> +			ctrl->val =3D XSDIRX_MODE_12GI_OFFSET;
> +			break;
> +		case XSDIRX_MODE_12GF_MASK:
> +			ctrl->val =3D XSDIRX_MODE_12GF_OFFSET;
> +			break;
> +		}
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_CRC:
> +		ctrl->val =3D xsdirxss_read(xsdirxss, XSDIRX_CRC_ERRCNT_REG);
> +		xsdirxss_write(xsdirxss, XSDIRX_CRC_ERRCNT_REG, 0xffff);
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_ERRCNT:
> +		val =3D xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> +		val &=3D XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +		if (val =3D=3D XSDIRX_MODE_SD_MASK) {
> +			ctrl->val =3D xsdirxss_read(xsdirxss,
> +						  XSDIRX_EDH_ERRCNT_REG);
> +		} else {
> +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> +			return -EINVAL;
> +		}
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_EDH_STATUS:
> +		val =3D xsdirxss_read(xsdirxss, XSDIRX_MODE_DET_STAT_REG);
> +		val &=3D XSDIRX_MODE_DET_STAT_RX_MODE_MASK;
> +		if (val =3D=3D XSDIRX_MODE_SD_MASK) {
> +			ctrl->val =3D xsdirxss_read(xsdirxss,
> +						  XSDIRX_EDH_STAT_REG);
> +		} else {
> +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +			dev_dbg(dev, "%d - not in SD mode\n", ctrl->id);
> +			return -EINVAL;
> +		}
> +		break;
> +	case V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED:
> +		ctrl->val =3D xsdirxss->ts_is_interlaced;
> +		break;
> +	default:
> +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +		dev_err(dev, "Get Invalid control id 0x%0x\n", ctrl->id);
> +		return -EINVAL;
> +	}
> +
> +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_log_status - Logs the status of the SDI Rx Subsystem
> + * @sd: Pointer to V4L2 subdevice structure
> + *
> + * This function prints the current status of Xilinx SDI Rx Subsystem
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_log_status(struct v4l2_subdev *sd)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	u32 i;
> +
> +	v4l2_info(sd, "***** SDI Rx subsystem reg dump start *****\n");
> +	v4l2_info(sd, "No : Register Name : Value\n");
> +	for (i =3D 0; i < ARRAY_SIZE(xsdirxss_regmap); i++) {
> +		v4l2_info(sd, "%02d : %s register : 0x%08x\n", i,
> +			  xsdirxss_regmap[i].name,
> +			  xsdirxss_read(xsdirxss, xsdirxss_regmap[i].offset));
> +	}
> +	v4l2_info(sd, "***** SDI Rx subsystem reg dump end *****\n");
> +
> +	v4l2_ctrl_subdev_log_status(sd);
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_g_frame_interval - Get the frame interval
> + * @sd: V4L2 Sub device
> + * @fi: Pointer to V4l2 Sub device frame interval structure
> + *
> + * This function is used to get the frame interval.
> + * The frame rate can be integral or fractional.
> + * Integral frame rate e.g. numerator =3D 1000, denominator =3D 24000 =
=3D> 24 fps
> + * Fractional frame rate e.g. numerator =3D 1001, denominator =3D 2400=
0 =3D> 23.97 fps
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_g_frame_interval(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_frame_interval *fi)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	unsigned long flags;
> +
> +	if (!xsdirxss->vidlocked) {

Shouldn't this be accessed under spinlock?

> +		dev_err(xsdirxss->dev, "Video not locked!\n");
> +		return -EINVAL;
> +	}
> +
> +	spin_lock_irqsave(&xsdirxss->slock, flags);
> +	fi->interval =3D xsdirxss->frame_interval;
> +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +
> +	dev_dbg(xsdirxss->dev, "frame rate numerator =3D %d denominator =3D %=
d\n",
> +		xsdirxss->frame_interval.numerator,
> +		xsdirxss->frame_interval.denominator);

This too.

> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_s_stream - It is used to start/stop the streaming.
> + * @sd: V4L2 Sub device
> + * @enable: Flag (True / False)
> + *
> + * This function controls the start or stop of streaming for the
> + * Xilinx SDI Rx Subsystem.
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xsdirxss_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	struct device *dev =3D xsdirxss->dev;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xsdirxss->slock, flags);
> +	if (enable =3D=3D xsdirxss->streaming) {
> +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +		dev_dbg(dev, "already in same streaming state as requested\n");
> +		return 0;
> +	}
> +
> +	if (enable) {
> +		if (!xsdirxss->vidlocked) {
> +			spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +			dev_err(dev, "Video is not locked\n");
> +			return -EINVAL;
> +		}
> +		xsdirx_streamflow_control(xsdirxss, true);
> +	} else {
> +		xsdirx_streamflow_control(xsdirxss, false);

This can move out of this if statement, passing enable or !!enable direct=
ly.
Up to you.

> +	}
> +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +	dev_dbg(dev, "Streaming %s\n", enable ? "started" : "stopped");
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_g_input_status - It is used to determine if the video sign=
al
> + * is present / locked onto or not.
> + *
> + * @sd: V4L2 Sub device
> + * @status: status of signal locked
> + *
> + * This is used to determine if the video signal is present and locked=
 onto
> + * by the SDI Rx core or not based on vidlocked flag.
> + *
> + * Return: zero on success
> + */
> +static int xsdirxss_g_input_status(struct v4l2_subdev *sd, u32 *status=
)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xsdirxss->slock, flags);
> +	if (!xsdirxss->vidlocked)
> +		*status =3D V4L2_IN_ST_NO_SYNC | V4L2_IN_ST_NO_SIGNAL;
> +	else
> +		*status =3D 0;
> +
> +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +	return 0;
> +}
> +
> +static struct v4l2_mbus_framefmt *
> +__xsdirxss_get_pad_format(struct xsdirxss_state *xsdirxss,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  unsigned int pad, u32 which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_format(&xsdirxss->subdev, cfg, pad);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &xsdirxss->src_format;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +/**
> + * xsdirxss_init_cfg - Initialise the pad format config to default
> + * @sd: Pointer to V4L2 Sub device structure
> + * @cfg: Pointer to sub device pad information structure
> + *
> + * This function is used to initialize the pad format with the default
> + * values.
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_init_cfg(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	struct v4l2_mbus_framefmt *format;
> +
> +	format =3D v4l2_subdev_get_try_format(sd, cfg, 0);
> +	*format =3D xsdirxss->default_format;
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_get_set_format - This is used to get/set the pad format
> + * @sd: Pointer to V4L2 Sub device structure
> + * @cfg: Pointer to sub device pad information structure
> + * @fmt: Pointer to pad level media bus format
> + *
> + * This function is used to get and set the pad format.
> + * Since the pad format is fixed in hardware, it can't be
> + * modified on run time. So set and get are same.
> + *
> + * Return: 0 on success
> + */
> +static int xsdirxss_get_set_format(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_format *fmt)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xsdirxss->slock, flags);
> +	if (!xsdirxss->vidlocked) {
> +		spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +		dev_err(xsdirxss->dev, "Video not locked!\n");
> +		return -EINVAL;
> +	}
> +
> +	fmt->format =3D *__xsdirxss_get_pad_format(xsdirxss, cfg,
> +						 fmt->pad, fmt->which);
> +
> +	spin_unlock_irqrestore(&xsdirxss->slock, flags);
> +	dev_dbg(xsdirxss->dev,
> +		"stream width %d height %d code %d field %d colorspace %d xfer_func =
%d quantization %d\n",
> +		fmt->format.width, fmt->format.height,
> +		fmt->format.code, fmt->format.field,
> +		fmt->format.colorspace, fmt->format.xfer_func,
> +		fmt->format.quantization);
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_enum_mbus_code - Handle pixel format enumeration
> + * @sd: pointer to v4l2 subdev structure
> + * @cfg: V4L2 subdev pad configuration
> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
> + *
> + * Return: -EINVAL or zero on success
> + */
> +static int xsdirxss_enum_mbus_code(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct xsdirxss_state *xsdirxss =3D to_xsdirxssstate(sd);
> +	u32 index =3D code->index;
> +	u32 maxindex;
> +
> +	if (xsdirxss->bpc =3D=3D 10)
> +		maxindex =3D ARRAY_SIZE(xsdirxss_10bpc_mbus_fmts);
> +	else
> +		maxindex =3D ARRAY_SIZE(xsdirxss_12bpc_mbus_fmts);
> +
> +	if (code->pad || index >=3D maxindex)
> +		return -EINVAL;
> +
> +	if (xsdirxss->bpc =3D=3D 10)
> +		code->code =3D xsdirxss_10bpc_mbus_fmts[index];
> +	else
> +		code->code =3D xsdirxss_12bpc_mbus_fmts[index];
> +
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_enum_dv_timings - Enumerate all the supported DV timings
> + * @sd: pointer to v4l2 subdev structure
> + * @timings: DV timings structure to be returned.
> + *
> + * Return: -EINVAL incase of invalid index and pad or zero on success
> + */
> +static int xsdirxss_enum_dv_timings(struct v4l2_subdev *sd,
> +				    struct v4l2_enum_dv_timings *timings)
> +{
> +	if (timings->index >=3D ARRAY_SIZE(fmt_cap))
> +		return -EINVAL;
> +
> +	if (timings->pad !=3D 0)
> +		return -EINVAL;
> +
> +	timings->timings =3D fmt_cap[timings->index];
> +	return 0;
> +}
> +
> +/**
> + * xsdirxss_query_dv_timings - Query for the current DV timings
> + * @sd: pointer to v4l2 subdev structure
> + * @timings: DV timings structure to be returned.
> + *
> + * Return: -ENOLCK when video is not locked, -ERANGE when correspondin=
g timing
> + * entry is not found or zero on success.
> + */
> +static int xsdirxss_query_dv_timings(struct v4l2_subdev *sd,
> +				     struct v4l2_dv_timings *timings)
> +{
> +	struct xsdirxss_state *state =3D to_xsdirxssstate(sd);
> +	unsigned int i;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&state->slock, flags);
> +	if (!state->vidlocked) {
> +		spin_unlock_irqrestore(&state->slock, flags);
> +		return -ENOLCK;
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(xsdirxss_dv_timings); i++) {
> +		if (state->format.width =3D=3D xsdirxss_dv_timings[i].width &&
> +		    state->format.height =3D=3D xsdirxss_dv_timings[i].height &&
> +		    state->frame_interval.denominator =3D=3D
> +		    (xsdirxss_dv_timings[i].fps * 1000)) {
> +			*timings =3D xsdirxss_dv_timings[i].timing;
> +			state->detected_timings_index =3D i;
> +			spin_unlock_irqrestore(&state->slock, flags);
> +			return 0;
> +		}
> +	}
> +	spin_unlock_irqrestore(&state->slock, flags);
> +
> +	return -ERANGE;
> +}
> +
> +static int xsdirxss_s_dv_timings(struct v4l2_subdev *sd,
> +				 struct v4l2_dv_timings *timings)
> +{
> +	struct xsdirxss_state *state =3D to_xsdirxssstate(sd);
> +	u32 i =3D state->detected_timings_index;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&state->slock, flags);
> +	if (!state->vidlocked) {
> +		spin_unlock_irqrestore(&state->slock, flags);
> +		return -EINVAL;
> +	}
> +

Is the spinlock needed to be held for below?

> +	/* input timing should match query dv_timing */
> +	if (!v4l2_match_dv_timings(timings,
> +				   &xsdirxss_dv_timings[i].timing,
> +				   0, false)) {
> +		spin_unlock_irqrestore(&state->slock, flags);
> +		return -EINVAL;
> +	}
> +
> +	state->current_timings =3D *timings;
> +
> +	/* Update the media bus format */
> +	state->src_format =3D state->format;
> +	spin_unlock_irqrestore(&state->slock, flags);
> +
> +	return 0;
> +}
> +
> +static int xsdirxss_g_dv_timings(struct v4l2_subdev *sd,
> +				 struct v4l2_dv_timings *timings)
> +{
> +	struct xsdirxss_state *state =3D to_xsdirxssstate(sd);
> +
> +	*timings =3D state->current_timings;

This needs the lock if above doesn't change, at least per lock descriptio=
n.

> +	return 0;
> +}
> +
> +static int xsdirxss_dv_timings_cap(struct v4l2_subdev *sd,
> +				   struct v4l2_dv_timings_cap *cap)
> +{
> +	if (cap->pad !=3D 0)
> +		return -EINVAL;
> +
> +	*cap =3D xsdirxss_timings_cap;
> +	return 0;
> +}
> +
> +/* -------------------------------------------------------------------=
----------
> + * Media Operations
> + */
> +
> +static const struct media_entity_operations xsdirxss_media_ops =3D {
> +	.link_validate =3D v4l2_subdev_link_validate
> +};
> +
> +static const struct v4l2_ctrl_ops xsdirxss_ctrl_ops =3D {
> +	.g_volatile_ctrl =3D xsdirxss_g_volatile_ctrl,
> +	.s_ctrl	=3D xsdirxss_s_ctrl
> +};
> +
> +static const struct v4l2_ctrl_config xsdirxss_edh_ctrls[] =3D {
> +	{
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES,
> +		.name	=3D "SDI Rx : EDH Error Count Enable",
> +		.type	=3D V4L2_CTRL_TYPE_BITMASK,
> +		.min	=3D 0,
> +		.max	=3D XSDIRX_EDH_ALLERR_MASK,
> +		.def	=3D 0,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_EDH_ERRCNT,
> +		.name	=3D "SDI Rx : EDH Error Count",
> +		.type	=3D V4L2_CTRL_TYPE_INTEGER,
> +		.min	=3D 0,
> +		.max	=3D 0xffff,
> +		.step	=3D 1,
> +		.def	=3D 0,
> +		.flags  =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_EDH_STATUS,
> +		.name	=3D "SDI Rx : EDH Status",
> +		.type	=3D V4L2_CTRL_TYPE_INTEGER,
> +		.min	=3D 0,
> +		.max	=3D 0xffffffff,
> +		.step	=3D 1,
> +		.def	=3D 0,
> +		.flags  =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}
> +};
> +
> +static const struct v4l2_ctrl_config xsdirxss_ctrls[] =3D {
> +	{
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_FRAMER,
> +		.name	=3D "SDI Rx : Enable Framer",
> +		.type	=3D V4L2_CTRL_TYPE_BOOLEAN,
> +		.min	=3D false,
> +		.max	=3D true,
> +		.step	=3D 1,
> +		.def	=3D true,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW,
> +		.name	=3D "SDI Rx : Video Lock Window",
> +		.type	=3D V4L2_CTRL_TYPE_INTEGER,
> +		.min	=3D 0,
> +		.max	=3D 0xffffffff,
> +		.step	=3D 1,
> +		.def	=3D XSDIRX_DEFAULT_VIDEO_LOCK_WINDOW,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_SEARCH_MODES,
> +		.name	=3D "SDI Rx : Modes search Mask",
> +		.type	=3D V4L2_CTRL_TYPE_BITMASK,
> +		.min	=3D 0,
> +		.max	=3D XSDIRX_DETECT_ALL_MODES,
> +		.def	=3D XSDIRX_DETECT_ALL_MODES,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_MODE_DETECT,
> +		.name	=3D "SDI Rx : Mode Detect Status",
> +		.type	=3D V4L2_CTRL_TYPE_INTEGER,
> +		.min	=3D XSDIRX_MODE_SD_OFFSET,
> +		.max	=3D XSDIRX_MODE_12GF_OFFSET,
> +		.step	=3D 1,
> +		.flags  =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_CRC,
> +		.name	=3D "SDI Rx : CRC Error status",
> +		.type	=3D V4L2_CTRL_TYPE_INTEGER,
> +		.min	=3D 0,
> +		.max	=3D 0xffffffff,
> +		.step	=3D 1,
> +		.def	=3D 0,
> +		.flags  =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	}, {
> +		.ops	=3D &xsdirxss_ctrl_ops,
> +		.id	=3D V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED,
> +		.name	=3D "SDI Rx : TS is Interlaced",
> +		.type	=3D V4L2_CTRL_TYPE_BOOLEAN,
> +		.min	=3D false,
> +		.max	=3D true,
> +		.def	=3D false,
> +		.step	=3D 1,
> +		.flags  =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +	},
> +};
> +
> +static const struct v4l2_subdev_core_ops xsdirxss_core_ops =3D {
> +	.log_status =3D xsdirxss_log_status,
> +	.subscribe_event =3D xsdirxss_subscribe_event,
> +	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops xsdirxss_video_ops =3D {
> +	.g_frame_interval =3D xsdirxss_g_frame_interval,
> +	.s_stream =3D xsdirxss_s_stream,
> +	.g_input_status =3D xsdirxss_g_input_status,
> +	.query_dv_timings =3D xsdirxss_query_dv_timings,
> +	.g_dv_timings =3D xsdirxss_g_dv_timings,
> +	.s_dv_timings =3D xsdirxss_s_dv_timings,
> +};
> +
> +static const struct v4l2_subdev_pad_ops xsdirxss_pad_ops =3D {
> +	.init_cfg =3D xsdirxss_init_cfg,
> +	.get_fmt =3D xsdirxss_get_set_format,
> +	.set_fmt =3D xsdirxss_get_set_format,
> +	.enum_mbus_code =3D xsdirxss_enum_mbus_code,
> +	.enum_dv_timings =3D xsdirxss_enum_dv_timings,
> +	.dv_timings_cap =3D xsdirxss_dv_timings_cap,
> +};
> +
> +static const struct v4l2_subdev_ops xsdirxss_ops =3D {
> +	.core =3D &xsdirxss_core_ops,
> +	.video =3D &xsdirxss_video_ops,
> +	.pad =3D &xsdirxss_pad_ops
> +};
> +
> +/* -------------------------------------------------------------------=
----------
> + * Platform Device Driver
> + */
> +
> +static int xsdirxss_parse_of(struct xsdirxss_state *xsdirxss)
> +{
> +	struct device_node *node =3D xsdirxss->dev->of_node;
> +	struct device *dev =3D xsdirxss->dev;
> +	int ret;
> +
> +	xsdirxss->include_edh =3D of_property_read_bool(node, "xlnx,include-e=
dh");
> +	dev_dbg(dev, "EDH property =3D %s\n",
> +		xsdirxss->include_edh ? "Present" : "Absent");
> +
> +	ret =3D of_property_read_u32(node, "xlnx,line-rate", &xsdirxss->mode)=
;
> +	if (ret < 0) {
> +		dev_err(dev, "xlnx,line-rate property not found\n");
> +		return ret;
> +	}
> +
> +	if (xsdirxss->mode !=3D XSDI_STD_3G && xsdirxss->mode !=3D XSDI_STD_6=
G &&
> +	    xsdirxss->mode !=3D XSDI_STD_12G_8DS) {
> +		dev_err(dev, "Invalid Line Rate\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "SDI Rx Line Rate / mode =3D %d\n", xsdirxss->mode);
> +
> +	ret =3D of_property_read_u32(node, "xlnx,bpc", &xsdirxss->bpc);
> +	if (ret =3D=3D -EINVAL) {
> +		xsdirxss->bpc =3D 10;
> +		dev_dbg(dev, "set default bpc as 10\n");
> +	} else if (ret < 0) {
> +		dev_err(dev, "failed to get xlnx,bpc\n");
> +		return ret;
> +	}
> +
> +	if (xsdirxss->bpc !=3D 10 && xsdirxss->bpc !=3D 12) {
> +		dev_err(dev, "bits per component=3D%u. Can be 10 or 12 only\n",
> +			xsdirxss->bpc);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int xsdirxss_probe(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev;
> +	struct xsdirxss_state *xsdirxss;
> +	struct device *dev;
> +	int ret, irq;
> +	unsigned int num_ctrls, i;
> +
> +	xsdirxss =3D devm_kzalloc(&pdev->dev, sizeof(*xsdirxss), GFP_KERNEL);
> +	if (!xsdirxss)
> +		return -ENOMEM;
> +
> +	xsdirxss->dev =3D &pdev->dev;
> +	dev =3D xsdirxss->dev;
> +
> +	spin_lock_init(&xsdirxss->slock);
> +	ret =3D xsdirxss_parse_of(xsdirxss);
> +	if (ret < 0)
> +		return ret;
> +
> +	xsdirxss->iomem =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(xsdirxss->iomem))
> +		return PTR_ERR(xsdirxss->iomem);
> +
> +	xsdirxss->num_clks =3D ARRAY_SIZE(xsdirxss_clks);
> +	xsdirxss->clks =3D devm_kcalloc(dev, xsdirxss->num_clks,
> +				      sizeof(*xsdirxss->clks), GFP_KERNEL);
> +	if (!xsdirxss->clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < xsdirxss->num_clks; i++)
> +		xsdirxss->clks[i].id =3D xsdirxss_clks[i];
> +
> +	ret =3D devm_clk_bulk_get(dev, xsdirxss->num_clks, xsdirxss->clks);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_bulk_prepare_enable(xsdirxss->num_clks, xsdirxss->clks);
> +	if (ret)
> +		return ret;
> +
> +	/* Reset the core */
> +	xsdirx_streamflow_control(xsdirxss, false);
> +	XSDIRX_CORE_DISABLE(xsdirxss);
> +	/* Clear all interrupts */
> +	xsdirxss_set(xsdirxss, XSDIRX_ISR_REG, XSDIRX_INTR_ALL_MASK);
> +	xsdirxss_clr(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> +	xsdirxss_set(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> +	XSDIRX_GLOBAL_INTR_ENABLE(xsdirxss);

Looking here, inlining the macro will be better.

	xsdirxss_set(xsdirxss, XSDIRX_GLBL_IER_REG, XSDIRX_GLBL_INTR_EN_MASK)

> +	xsdirxss_write(xsdirxss, XSDIRX_CRC_ERRCNT_REG, 0xffff);
> +
> +	/* Register interrupt handler */
> +	irq =3D platform_get_irq(pdev, 0);
> +	ret =3D devm_request_threaded_irq(dev, irq, NULL, xsdirxss_irq_handle=
r,
> +					IRQF_ONESHOT, dev_name(dev), xsdirxss);
> +	if (ret) {
> +		dev_err(dev, "Err =3D %d Interrupt handler reg failed!\n",
> +			ret);
> +		goto clk_err;
> +	}
> +
> +	/* Initialize V4L2 subdevice and media entity */
> +	xsdirxss->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +
> +	/* Initialize the default format */
> +	if (xsdirxss->bpc =3D=3D 10)
> +		xsdirxss->default_format.code =3D MEDIA_BUS_FMT_UYVY10_1X20;
> +	else
> +		xsdirxss->default_format.code =3D MEDIA_BUS_FMT_UYVY12_1X24;
> +	xsdirxss->default_format.field =3D V4L2_FIELD_NONE;
> +	xsdirxss->default_format.colorspace =3D V4L2_COLORSPACE_REC709;
> +	xsdirxss->default_format.width =3D XSDIRX_DEFAULT_WIDTH;
> +	xsdirxss->default_format.height =3D XSDIRX_DEFAULT_HEIGHT;
> +	xsdirxss->default_format.xfer_func =3D V4L2_XFER_FUNC_709;
> +	xsdirxss->default_format.quantization =3D V4L2_QUANTIZATION_LIM_RANGE=
;
> +
> +	xsdirxss->format =3D xsdirxss->default_format;
> +
> +	/* Initialize V4L2 subdevice and media entity */
> +	subdev =3D &xsdirxss->subdev;
> +	v4l2_subdev_init(subdev, &xsdirxss_ops);
> +
> +	subdev->dev =3D &pdev->dev;
> +	strscpy(subdev->name, dev_name(dev), sizeof(subdev->name));
> +
> +	subdev->flags =3D V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVN=
ODE;
> +
> +	subdev->entity.ops =3D &xsdirxss_media_ops;
> +
> +	v4l2_set_subdevdata(subdev, xsdirxss);
> +
> +	ret =3D media_entity_pads_init(&subdev->entity, 1, &xsdirxss->pad);
> +	if (ret < 0)
> +		goto error;
> +
> +	/* Initialise and register the controls */
> +	num_ctrls =3D ARRAY_SIZE(xsdirxss_ctrls);
> +
> +	if (xsdirxss->include_edh)
> +		num_ctrls +=3D ARRAY_SIZE(xsdirxss_edh_ctrls);
> +
> +	v4l2_ctrl_handler_init(&xsdirxss->ctrl_handler, num_ctrls);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(xsdirxss_ctrls); i++) {
> +		struct v4l2_ctrl *ctrl;
> +
> +		dev_dbg(dev, "%d %s ctrl =3D 0x%x\n", i, xsdirxss_ctrls[i].name,
> +			xsdirxss_ctrls[i].id);
> +
> +		ctrl =3D v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> +					    &xsdirxss_ctrls[i], NULL);
> +	}
> +
> +	if (xsdirxss->include_edh) {
> +		for (i =3D 0; i < ARRAY_SIZE(xsdirxss_edh_ctrls); i++) {
> +			struct v4l2_ctrl *ctrl;
> +
> +			dev_dbg(dev, "%d %s ctrl =3D 0x%x\n", i,
> +				xsdirxss_edh_ctrls[i].name,
> +				xsdirxss_edh_ctrls[i].id);
> +
> +			ctrl =3D v4l2_ctrl_new_custom(&xsdirxss->ctrl_handler,
> +						    &xsdirxss_edh_ctrls[i],
> +						    NULL);
> +		}
> +	}
> +
> +	if (xsdirxss->ctrl_handler.error) {
> +		dev_err(dev, "failed to add controls\n");
> +		ret =3D xsdirxss->ctrl_handler.error;
> +		goto error;
> +	}
> +
> +	subdev->ctrl_handler =3D &xsdirxss->ctrl_handler;
> +
> +	ret =3D v4l2_ctrl_handler_setup(&xsdirxss->ctrl_handler);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set controls\n");
> +		goto error;
> +	}
> +
> +	platform_set_drvdata(pdev, xsdirxss);
> +
> +	ret =3D v4l2_async_register_subdev(subdev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register subdev\n");
> +		goto error;
> +	}
> +
> +	xsdirxss->prev_is_frac =3D -1;
> +
> +	XSDIRX_CORE_ENABLE(xsdirxss);
> +
> +	return 0;

Nit. Ane empty line.

> +error:
> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> +	media_entity_cleanup(&subdev->entity);
> +	XSDIRX_GLOBAL_INTR_DISABLE(xsdirxss);
> +	xsdirxss_clr(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> +clk_err:
> +	clk_bulk_disable_unprepare(xsdirxss->num_clks, xsdirxss->clks);
> +	return ret;
> +}
> +
> +static int xsdirxss_remove(struct platform_device *pdev)
> +{
> +	struct xsdirxss_state *xsdirxss =3D platform_get_drvdata(pdev);
> +	struct v4l2_subdev *subdev =3D &xsdirxss->subdev;
> +
> +	XSDIRX_CORE_DISABLE(xsdirxss);
> +	XSDIRX_GLOBAL_INTR_DISABLE(xsdirxss);
> +	xsdirxss_clr(xsdirxss, XSDIRX_IER_REG, XSDIRX_INTR_ALL_MASK);
> +	xsdirx_streamflow_control(xsdirxss, false);
> +
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_ctrl_handler_free(&xsdirxss->ctrl_handler);
> +	media_entity_cleanup(&subdev->entity);
> +
> +	clk_bulk_disable_unprepare(xsdirxss->num_clks, xsdirxss->clks);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id xsdirxss_of_id_table[] =3D {
> +	{ .compatible =3D "xlnx,v-smpte-uhdsdi-rx-ss-2.0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, xsdirxss_of_id_table);
> +
> +static struct platform_driver xsdirxss_driver =3D {
> +	.driver =3D {
> +		.name		=3D "xilinx-sdirxss",
> +		.of_match_table	=3D xsdirxss_of_id_table,
> +	},
> +	.probe			=3D xsdirxss_probe,
> +	.remove			=3D xsdirxss_remove,
> +};
> +
> +module_platform_driver(xsdirxss_driver);
> +
> +MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
> +MODULE_DESCRIPTION("Xilinx SDI Rx Subsystem Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> index 62271418c1be..9526a6acc6f4 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -198,6 +198,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
> =20
> +/*
> + * The base for the Xilinx SDI Rx driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_XILINX_SDIRX_BASE		(V4L2_CID_USER_BASE + 0x10e0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> diff --git a/include/uapi/linux/xilinx-sdirxss.h b/include/uapi/linux/x=
ilinx-sdirxss.h
> new file mode 100644
> index 000000000000..1bcbf5852b22
> --- /dev/null
> +++ b/include/uapi/linux/xilinx-sdirxss.h
> @@ -0,0 +1,283 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Xilinx SDI Rx Subsystem mode, event, custom timings and
> + * flag definitions.
> + *
> + * Copyright (C) 2019 - 2020 Xilinx, Inc.
> + *
> + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> + */
> +
> +#ifndef __UAPI_XILINX_SDIRXSS_H__
> +#define __UAPI_XILINX_SDIRXSS_H__
> +
> +#include <linux/types.h>
> +#include <linux/v4l2-controls.h>
> +#include <linux/v4l2-dv-timings.h>
> +#include <linux/videodev2.h>
> +
> +/*
> + * Events
> + *
> + * V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW: Video in to AXI4 Stream core
> + * under/overflowed during a resolution or frame rate change.
> + */
> +#define V4L2_EVENT_XILINX_SDIRX_CLASS      (V4L2_EVENT_PRIVATE_START |=
 0x200)
> +#define V4L2_EVENT_XILINX_SDIRX_UND_OVR_FLOW	\
> +					(V4L2_EVENT_XILINX_SDIRX_CLASS | 0x1)
> +
> +#define XILINX_SDIRX_UNDERFLOW_EVENT	BIT(1)
> +#define XILINX_SDIRX_OVERFLOW_EVENT	BIT(2)
> +/*
> + * This enum is used to prepare the bitmask of modes to be detected
> + */
> +enum {
> +	XSDIRX_MODE_SD_OFFSET =3D 0,
> +	XSDIRX_MODE_HD_OFFSET,
> +	XSDIRX_MODE_3GA_OFFSET,
> +	XSDIRX_MODE_3GB_OFFSET,
> +	XSDIRX_MODE_6G_OFFSET,
> +	XSDIRX_MODE_12GI_OFFSET,
> +	XSDIRX_MODE_12GF_OFFSET,
> +	XSDIRX_MODE_NUM_SUPPORTED,
> +};
> +
> +#define XSDIRX_DETECT_ALL_MODES		(BIT(XSDIRX_MODE_SD_OFFSET) | \
> +					BIT(XSDIRX_MODE_HD_OFFSET) | \
> +					BIT(XSDIRX_MODE_3GA_OFFSET) | \
> +					BIT(XSDIRX_MODE_3GB_OFFSET) | \
> +					BIT(XSDIRX_MODE_6G_OFFSET) | \
> +					BIT(XSDIRX_MODE_12GI_OFFSET) | \
> +					BIT(XSDIRX_MODE_12GF_OFFSET))
> +
> +/*
> + * EDH - Error Detection and Handling.
> + * In the SD-SDI mode, the UHD-SDI core fully supports RP 165.
> + * The bitmask is named as XSDIRX_EDH_ERRCNT_XX_YY_ERR except
> + * for packet checksum error.
> + *
> + * XX - EDH Error Types
> + * ANC - Ancillary Data Packet Errors
> + * FF - Full Field Errors
> + * AP - Active Portion Errors
> + *
> + * YY - Error Flags
> + * EDH - error detected here
> + * EDA - error Detected already
> + * IDH - internal error detected here
> + * IDA - internal error detected already
> + * UES - unknown error status
> + *
> + * Refer to Sec 4.3 Error Flags in RP 165-1994 for details
> + */
> +
> +#define XSDIRX_EDH_ERRCNT_ANC_EDH_ERR		BIT(0)
> +#define XSDIRX_EDH_ERRCNT_ANC_EDA_ERR		BIT(1)
> +#define XSDIRX_EDH_ERRCNT_ANC_IDH_ERR		BIT(2)
> +#define XSDIRX_EDH_ERRCNT_ANC_IDA_ERR		BIT(3)
> +#define XSDIRX_EDH_ERRCNT_ANC_UES_ERR		BIT(4)
> +#define XSDIRX_EDH_ERRCNT_FF_EDH_ERR		BIT(5)
> +#define XSDIRX_EDH_ERRCNT_FF_EDA_ERR		BIT(6)
> +#define XSDIRX_EDH_ERRCNT_FF_IDH_ERR		BIT(7)
> +#define XSDIRX_EDH_ERRCNT_FF_IDA_ERR		BIT(8)
> +#define XSDIRX_EDH_ERRCNT_FF_UES_ERR		BIT(9)
> +#define XSDIRX_EDH_ERRCNT_AP_EDH_ERR		BIT(10)
> +#define XSDIRX_EDH_ERRCNT_AP_EDA_ERR		BIT(11)
> +#define XSDIRX_EDH_ERRCNT_AP_IDH_ERR		BIT(12)
> +#define XSDIRX_EDH_ERRCNT_AP_IDA_ERR		BIT(13)
> +#define XSDIRX_EDH_ERRCNT_AP_UES_ERR		BIT(14)
> +#define XSDIRX_EDH_ERRCNT_PKT_CHKSUM_ERR	BIT(15)
> +
> +#define XSDIRX_EDH_ALLERR_MASK		0xFFFF

Nit, lowercase for hex values.

Thanks!
-hyun

> +
> +/*
> + * V4L2 Controls - We reserved 16 controls for this driver.
> + *
> + * The V4L2_CID_XILINX_SDIRX_EDH_* controls are present only if
> + * EDH is enabled.
> + * The controls which can be set should only be set before enabling
> + * streaming. The controls which can be got should be called while
> + * streaming to get correct values.
> + * The V4L2_CID_XILINX_SDIRX_MODE_DETECT can be called when query dv t=
iming
> + * returns a valid timing.
> + */
> +
> +/*
> + * Framer Control to enable or disable the framer. When this is set, t=
he framer
> + * automatically readjusts the output word alignment to match the alig=
nment of
> + * each timing reference signal(TRS). Normally this should be set. But=
 user may
> + * control this input to implement TRS filtering to prevent a signal m=
isaligned
> + * TRS from causing erroneous alignment changes.
> + * Refer to PG205 rx_frame_en for more details.
> + */
> +#define V4L2_CID_XILINX_SDIRX_FRAMER		(V4L2_CID_USER_XILINX_SDIRX_BASE=
 + 1)
> +
> +/*
> + * Video Lock Window Control to set the video lock window value
> + * This is the amount of time the mode and transport stream need
> + * to be locked before a video lock interrupt occurs.
> + */
> +#define V4L2_CID_XILINX_SDIRX_VIDLOCK_WINDOW	(V4L2_CID_USER_XILINX_SDI=
RX_BASE + 2)
> +
> +/*
> + * EDH Error Mask Control to enable EDH error count
> + * This control takes in the bitmask of XSDIRX_EDH_ERRCNT_*_ERR to ena=
ble counting
> + * such errors.
> + */
> +#define V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES	(V4L2_CID_USER_XILINX_=
SDIRX_BASE + 3)
> +
> +/*
> + * Mode search Control to pass the bit mask of modes to detect.
> + * If only 1 bit is set, the driver programs IP to be in fixed mode el=
se
> + * in multi detection mode.
> + *
> + * Set this when not streaming.
> + *
> + * bit 0 set to detect SD  mode,
> + * bit 1 set to detect HD  mode,
> + * bit 2 set to detect 3GA mode,
> + * bit 3 set to detect 3GB mode,
> + * bit 4 set to detect 6G  mode,
> + * bit 5 set to detect 12G integer frame rate mode,
> + * bit 6 set to detect 12G fractional frame rate mode,
> + */
> +#define V4L2_CID_XILINX_SDIRX_SEARCH_MODES	(V4L2_CID_USER_XILINX_SDIRX=
_BASE + 4)
> +
> +/*
> + * Get Detected SDI Mode control (read only)
> + *
> + * Control Value - Mode detected
> + *        0      -     SD
> + *        1      -     HD
> + *        2      -     3GA
> + *        3      -     3GB
> + *        4      -     6G
> + *        5      -     12G integer frame rate
> + *        6      -     12G fractional frame rate
> + */
> +#define V4L2_CID_XILINX_SDIRX_MODE_DETECT	(V4L2_CID_USER_XILINX_SDIRX_=
BASE + 5)
> +
> +/* Get number of CRC errors status control
> + *
> + * When a CRC is detected on a line, the CRC error signal of that data=
 stream
> + * becomes asserted starting a few clock cycles after the last CRC wor=
d is
> + * output on the data stream ports following the EAV that ends the lin=
e
> + * containing the error. The CRC signal remains asserted for one line =
time.
> + *
> + * The LSB 16 bits of value returned by thsi control represent the err=
or
> + * signal on each of 16 data streams. The MSB 16 bits contains the acc=
umulated
> + * error count.
> + *
> + * Refer to PG205 rx_crc_err_dsX (X =3D 1 to 16) description for detai=
ls.
> + */
> +#define V4L2_CID_XILINX_SDIRX_CRC		(V4L2_CID_USER_XILINX_SDIRX_BASE + =
6)
> +
> +/*
> + * Get EDH error count control
> + *
> + * Reading this control will give the number of EDH errors occurred ba=
sed
> + * on the bitmask passed in V4L2_CID_XILINX_SDIRX_EDH_ERROR_SOURCES.
> + *
> + * It increments once per field when any of the error conditions enabl=
ed by
> + * the RX_EDH_ERRCNT_EN register bit(s) occur during that field.
> + *
> + * Refer to PG205 rx_edh_errcnt
> + */
> +#define V4L2_CID_XILINX_SDIRX_EDH_ERRCNT	(V4L2_CID_USER_XILINX_SDIRX_B=
ASE + 7)
> +
> +/*
> + * Get EDH status control
> + *
> + * This control returns the RX_EDH_STS register contents.
> + * Refer to PG290 register space section for more details.
> + */
> +#define V4L2_CID_XILINX_SDIRX_EDH_STATUS	(V4L2_CID_USER_XILINX_SDIRX_B=
ASE + 8)
> +
> +/* Get Transport Interlaced status whether it is interlaced or not */
> +#define V4L2_CID_XILINX_SDIRX_TS_IS_INTERLACED	(V4L2_CID_USER_XILINX_S=
DIRX_BASE + 9)
> +
> +/*
> + * Xilinx DV timings
> + * TODO - Remove these once they are in v4l2-dv-timings.h
> + */
> +#define XLNX_V4L2_DV_BT_2048X1080P24 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P25 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P30 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 66, 20, 66, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080I48 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 329, 44, 329, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080I50 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 274, 44, 274, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080I60 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		74250000, 66, 20, 66, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P48 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 510, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P50 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 400, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_2048X1080P60 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(2048, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 88, 44, 20, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#define XLNX_V4L2_DV_BT_1920X1080I48 { \
> +	.type =3D V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 1, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 371, 88, 371, 2, 5, 15, 3, 5, 15, \
> +		V4L2_DV_BT_STD_SDI) \
> +}
> +
> +#endif /* __UAPI_XILINX_SDIRXSS_H__ */
> --=20
> 2.21.0
>=20
>=20
