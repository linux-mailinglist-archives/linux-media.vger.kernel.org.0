Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4EF34F89E
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 08:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbhCaGUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 02:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbhCaGUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 02:20:19 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::60d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64C6C061574;
        Tue, 30 Mar 2021 23:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3O5ZDr4qCGQtOcNAZVRScl8uKNgGW8xQarfQrYbm2piFoLllL/P/IQ6GlHYYpkPrEjFfZwTDOnnzBOQCXjtKuckAmK1dyBWLmpcy2EBxDSWYrKHyozJIqxPgSOsj0HFD+RsHVNkQc/UXIMu7M5IV6h/rAgFPo0CWRPtJ+/cp7m1VLEfAqyhhoOokYF8bsI+PNdCEn9rA19iNYXj4l8wWk6vj9zhnLGh1/lhSTYfpZVjR1m0NKeHxCnyRlIFyqTnxVN0Nq5TYX3Kp4g/SBneJvI07Qr6T3w5oE4xSK34fdzQzDxprX/h110kPyLOuzhFz6d2DLaHvagpbyQuYhO24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=602P3XSSviNYooLbA/0h2eqZX+BRKqFTqp0veG5iPm0=;
 b=axZ5mM2klrXiXEnPRBL3LqwSNNLvy3R33CRHYm85nzmUWWgyErBMjM4qIm1u1HLEK6+pQWAKhptAoF0J40hFP8B40EwndT7h3Hk70bv3zNx4QU/g5TbK4QxPbY3NqmV2FakjkijxFGv9sc/qZ0bVghzmcV7gcGryqOEhZLTDRkXGn4xBDd3aku9T7+1dHpEZguMQVIekICjesrwrL5Fr4NySywDnxbFZf44a92zWVN3v9/wOL/G2RplqfOKLu6ye3ZF7byTlj9dF98R7i4Rdh1IDnFFbk1QvsZdAW/dMCmCXGai7uqzkqXp6lg2Xx2SCBQd1g92m1k4RY8ojbhvoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=602P3XSSviNYooLbA/0h2eqZX+BRKqFTqp0veG5iPm0=;
 b=TIgGBYzt38FB3MoasnXezs3bNGWTcXW7/10UHXOVvb3KWt0MYgo5gvzhU0IJrbJQHCvFspCHCWvFoD8j16HpYKpvXYckbBEAypm5HWRI8MuaGDJsgg2+I0KU6d0LyHv8R+UN6lJP6jxKXDPiFwvSd4SqQcEp3IZdS5tq47kXE+g=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2320.eurprd04.prod.outlook.com (2603:10a6:800:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Wed, 31 Mar
 2021 06:20:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:20:08 +0000
Message-ID: <a319b8b1a6eeffbd98bca39f45249237538eff1f.camel@nxp.com>
Subject: Re: [PATCH v6 09/14] drm/bridge: imx: Add i.MX8qxp pixel link to
 DPI support
From:   Liu Ying <victor.liu@nxp.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>, kishon@ti.com,
        Vinod Koul <vkoul@kernel.org>, lee.jones@linaro.org
Date:   Wed, 31 Mar 2021 14:18:12 +0800
In-Reply-To: <CAG3jFysiRnNCv21utFyj+UuFhW+6om0eHEMLH57FYSdiBqL5wA@mail.gmail.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
         <1615952569-4711-10-git-send-email-victor.liu@nxp.com>
         <CAG3jFysiRnNCv21utFyj+UuFhW+6om0eHEMLH57FYSdiBqL5wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.0 via Frontend Transport; Wed, 31 Mar 2021 06:20:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 788e69b7-6bc1-496c-8cfa-08d8f40d07d7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2320A53026E69A8D332600E0987C9@VI1PR0401MB2320.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: neI6ghyTF66mMMPtdaFD1GWvSRa9KFAOeprqd00lDB3LMde0+djeErH+bkBFfqRoCd2Qf0A7JymqcdvonNvFIrizJNV46th/yHwc2fb+C4NOS+dzIkGcrNwwp9JesOTHjg6hJl9mrruVaJPTZEbN9cxjmX8W9KwvjJeCO7uw946SDFwa6AaWoiA/wX8/+DiWq/Hgf8ODTpFEFWd60LIWguWa06rSC+UDQr6XJLdlayDYLMgHJyzBPPzbFfSjAtFQb9IQ9uuBeW3NIKTIKATcUu4BTXopRR6/rM0YjJECASeI9vobI+fcTE5wuCEZqm44gd3x9PeW82YFDUADk2+cyE7OduLi8yPh0pOS0oulIEgRgSAx4tGze+Zk5MMIoTbZwbqSCGmmy8l3HXjx4Eoks/F+Gy7AygLpm+EQHJWO/qbQcyBnIoTPmLMotBMkN43W3w40vAE3kxMrZKwXQBcQ1bjZkuY3KgQwg+vX4z18PDhPVzkCmY0eznMSJb9r3D/9I81i/5X1XPOmfDd+YXUgH9v5ZsuszOAC/4TOjx+TJoUYAQpzDFop9zCdMuZ+wI62gFVTNpLKkPr5Wj2/dBz+Y90nyj9U6F+/8SlzL1ABVRkpr3MTQ6V8ldlITx/J/AC4b6GnGWMEGtyyAfzuhscx1SEJCWQ5vq7aFEap5w4wbic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(6486002)(83380400001)(66476007)(86362001)(7416002)(2906002)(36756003)(6666004)(66556008)(478600001)(8676002)(66946007)(316002)(2616005)(6916009)(4326008)(956004)(186003)(54906003)(16526019)(8936002)(26005)(38100700001)(6496006)(30864003)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmtJT2hxWC9pVUw3aVVHZ3RiZWhOZlBXc1BKZjJvUlRlRDFNU3V4Q012alpZ?=
 =?utf-8?B?OUlWOStnRmFmZk1YQUNKQXBFdHFjNktabkRsc1V0Q1pwUXpNd0hoVjVBNnEx?=
 =?utf-8?B?b1BjN2FKK00yTExtcFJhcFZCTDNOUlFhblZuY2hFMnJ1YnArbjhuR3c0YldX?=
 =?utf-8?B?bUNhSnYvZTFKMEdNd2h5dnFLajFmTVVmNXFUaGE3S2I3WVVyZG4zWklDQjRP?=
 =?utf-8?B?WjJnSjVvUXNPNGNjVCtTdG90R0xoRkdERjczUDYvL3k1aEovV1lxa3NtSkZ1?=
 =?utf-8?B?SjVSVHIxZytUeDZBSlJmL1Q5eWVzMWhPNmpOSkNodHkySWdmUWpuejFkZXJx?=
 =?utf-8?B?czlsaEgvZmZMOW1WTGNFeGVFdndRR2cyVGtxK0RKVDVkNGJnUExBT3VTSFJJ?=
 =?utf-8?B?TCt6djlpazJBdTZRQXRycGFRSS83K3JFck83QkIybDhDZjdJUUtMU2tpR2Qy?=
 =?utf-8?B?OWVFWVZyRFN6YjNhU3dRZ3hyaHVDRXVUSXMydWF3VkFMOGlUL1JoRW1lQUM3?=
 =?utf-8?B?ZWNHMW5YbldSTHZxemlmR2tOSzkrdHVSN3J6MWlqMzlGR0NUcDIzdXErdkVl?=
 =?utf-8?B?eUhzYy9TT2tOY21SYjNQUUVUVnNNYStLRStjS2l4ZFJsWitjb09CNUtGTW15?=
 =?utf-8?B?R3UwaXRjY25xZW04bnVLZEtjN2JCeXR3VVBCUHBFU1BmY25FbXFkbnNFV0lp?=
 =?utf-8?B?Z09yZVpIMXFac3VEQjdPTzF0aEpraGJSaC9KMkdudjlTU0FGaUljempKNTh1?=
 =?utf-8?B?aDV2cWs5RXVHRmhyckJ5eXdiYkZ2V0V5TUhCYnA1aCtXUWdtb1NtWi9SbjNK?=
 =?utf-8?B?aUU3K0ZJdFhPOEFlWDU0YXBGYkdwZ2dIajF5TUN5d3lUMHNwajZjZXJ6VUdi?=
 =?utf-8?B?dm4wV0pNeVJPWGcwN3YrMGVXc1FWV1AwTHNuR1VBdmlXNGVrdEFFR1FrZTFj?=
 =?utf-8?B?NUxxWHFoNmFCRDB6M2xOclJIQ2ZzU2dodzlVem1ZWHRVYzhDdFN1YlgrOHdU?=
 =?utf-8?B?WE10dGg2azlmQUlRYVZQUTVYaitSMVNhVWVmNGNoT0hsclAxVGtlWUh2OXkv?=
 =?utf-8?B?YW4vRjA1TEd2M0NQQTBkUVlWK2c4ZzFybmlCV3dXakRFTVY5ejROUVNjZGFO?=
 =?utf-8?B?OGl3UDB5ZndKY1g1YjliOTYyZ000OHRMVlJMUm9CdU1EQXJXM1MvVzZQRTZU?=
 =?utf-8?B?WXVWcWFyd0QvNFhWRFZ4L2FHNWFEc1Q0Z3YrNDZxK3BUalptak0wbk83WUM2?=
 =?utf-8?B?YVNvUU9xTlFrWHlndWtZZkJOV3A0Uk1wOVlYUTV3b2RIQTNBMUtIYjd0TDM2?=
 =?utf-8?B?Um83anEwN2poR1FuNmFEUmtDYWJSR1Y4WmxpVDMvSzFhNVhVbWpzR2tYNmVo?=
 =?utf-8?B?dXVrWkYwMm5TWGxUc0FmZGl6alRmdlJkUjNFNnpyNTZ3S2xHdW9NbWpzVm9P?=
 =?utf-8?B?RlcrSFJvVmJlV2ZiY3Azc3N1U2JDR3BiVDhaTWxxUldUSHcyN3JQVWNtbXpP?=
 =?utf-8?B?Uk1jcXBzRUJwalArUFBncURrYzhCbDlZNm5kaURmR2hGalpxejJ2WDJIY2s1?=
 =?utf-8?B?OXhPS3lYeGYvMGJNY3FnWTFEYVV1YVJIQURDbTh3OHNKMTJhUEJsSlEwaVVz?=
 =?utf-8?B?YXhvWkUweWp1MFVoa05OR3BvZXMvS1dhTEp0QjN2TWxjRmt1b2I1ZDlmUFZt?=
 =?utf-8?B?MFAvQ1dXbE1UaXU3TVdNdGRaU0lLQXB6TVhTbnVJZXRpR0psZzI2NllJZDQx?=
 =?utf-8?Q?Ic74okVLjFgs+kg/V+qtH+KqdjcCrB91FhNLaB9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788e69b7-6bc1-496c-8cfa-08d8f40d07d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:20:08.3000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rdq5k2z0eBBSqvEivCDwxm7CwRW8uF5briSnwgfBs07XlUel+8TvUQDaqm2yiUgZ7eD/o8fYH8iZZMQvqNAwAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2320
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Tue, 2021-03-30 at 11:42 +0200, Robert Foss wrote:
> Hey Liu,
> 
> checkpatch --strict had some complaints, with those fixed feel free to
> add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Thanks for your review.

In the next version, I'll also fix the complaints from
'checkpatch.pl --strict' for the pixel combiner driver(patch 4/16) and
pixel link driver(patch 6/16).  If no objections, I'll keep your R-b
tags on them.

> 
> On Wed, 17 Mar 2021 at 04:57, Liu Ying <victor.liu@nxp.com> wrote:
> > This patch adds a drm bridge driver for i.MX8qxp pixel link to display
> > pixel interface(PXL2DPI).  The PXL2DPI interfaces the pixel link 36-bit
> > data output and the DSI controller’s MIPI-DPI 24-bit data input, and
> > inputs of LVDS Display Bridge(LDB) module used in LVDS mode, to remap
> > the pixel color codings between those modules. The PXL2DPI is purely
> > combinatorial.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * No change.
> > 
> > v3->v4:
> > * Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
> >   the PXL2DPI instance instead of using alias ID. (Rob)
> > 
> > v2->v3:
> > * Call syscon_node_to_regmap() to get regmap instead of
> >   syscon_regmap_lookup_by_phandle().
> > 
> > v1->v2:
> > * Drop unnecessary port availability check.
> > 
> >  drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 485 +++++++++++++++++++++++++++
> >  3 files changed, 494 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > index 4d1f027..1ea1ce7 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -14,3 +14,11 @@ config DRM_IMX8QXP_PIXEL_LINK
> >         help
> >           Choose this to enable display pixel link found in
> >           Freescale i.MX8qm/qxp processors.
> > +
> > +config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> > +       tristate "Freescale i.MX8QXP pixel link to display pixel interface"
> > +       depends on OF
> > +       select DRM_KMS_HELPER
> > +       help
> > +         Choose this to enable pixel link to display pixel interface(PXL2DPI)
> > +         found in Freescale i.MX8qxp processor.
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> > index c15469f..e74dd64 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1,2 +1,3 @@
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> > +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > new file mode 100644
> > index 00000000..6696855
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> > @@ -0,0 +1,485 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright 2020 NXP
> > + */
> > +
> > +#include <linux/firmware/imx/svc/misc.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <drm/drm_atomic_state_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +#define PXL2DPI_CTRL   0x40
> > +#define  CFG1_16BIT    0x0
> > +#define  CFG2_16BIT    0x1
> > +#define  CFG3_16BIT    0x2
> > +#define  CFG1_18BIT    0x3
> > +#define  CFG2_18BIT    0x4
> > +#define  CFG_24BIT     0x5
> > +
> > +#define DRIVER_NAME    "imx8qxp-pxl2dpi"
> > +
> > +struct imx8qxp_pxl2dpi {
> > +       struct regmap *regmap;
> > +       struct drm_bridge bridge;
> > +       struct drm_bridge *next_bridge;
> > +       struct drm_bridge *companion;
> > +       struct device *dev;
> > +       struct imx_sc_ipc *ipc_handle;
> > +       u32 sc_resource;
> > +       u32 in_bus_format;
> > +       u32 out_bus_format;
> > +       u32 pl_sel;
> > +};
> > +
> > +#define bridge_to_p2d(b)       container_of(b, struct imx8qxp_pxl2dpi, bridge)
> > +
> > +static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
> > +                                        enum drm_bridge_attach_flags flags)
> > +{
> > +       struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
> > +
> > +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                             "do not support creating a drm_connector\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (!bridge->encoder) {
> > +               DRM_DEV_ERROR(p2d->dev, "missing encoder\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       return drm_bridge_attach(bridge->encoder,
> > +                                p2d->next_bridge, bridge,
> > +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +static int
> > +imx8qxp_pxl2dpi_bridge_atomic_check(struct drm_bridge *bridge,
> > +                                   struct drm_bridge_state *bridge_state,
> > +                                   struct drm_crtc_state *crtc_state,
> > +                                   struct drm_connector_state *conn_state)
> > +{
> > +       struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
> > +
> > +       p2d->in_bus_format = bridge_state->input_bus_cfg.format;
> > +       p2d->out_bus_format = bridge_state->output_bus_cfg.format;
> > +
> > +       return 0;
> > +}
> > +
> > +static void
> > +imx8qxp_pxl2dpi_bridge_mode_set(struct drm_bridge *bridge,
> > +                               const struct drm_display_mode *mode,
> > +                               const struct drm_display_mode *adjusted_mode)
> > +{
> > +       struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
> > +       struct imx8qxp_pxl2dpi *companion_p2d;
> > +       int ret;
> > +
> > +       ret = pm_runtime_get_sync(p2d->dev);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                             "failed to get runtime PM sync: %d\n", ret);
> > +
> > +       ret = imx_sc_misc_set_control(p2d->ipc_handle, p2d->sc_resource,
> > +                                     IMX_SC_C_PXL_LINK_SEL, p2d->pl_sel);
> > +       if (ret)
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                             "failed to set pixel link selection(%u): %d\n",
> > +                                                       p2d->pl_sel, ret);
> > +
> > +       switch (p2d->out_bus_format) {
> > +       case MEDIA_BUS_FMT_RGB888_1X24:
> > +               regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG_24BIT);
> > +               break;
> > +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> > +               regmap_write(p2d->regmap, PXL2DPI_CTRL, CFG2_18BIT);
> > +               break;
> > +       default:
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                             "unsupported output bus format 0x%08x\n",
> > +                                                       p2d->out_bus_format);
> > +       }
> > +
> > +       if (p2d->companion) {
> > +               companion_p2d = bridge_to_p2d(p2d->companion);
> > +
> > +               companion_p2d->in_bus_format = p2d->in_bus_format;
> > +               companion_p2d->out_bus_format = p2d->out_bus_format;
> > +
> > +               p2d->companion->funcs->mode_set(p2d->companion, mode,
> > +                                                       adjusted_mode);
> > +       }
> > +}
> > +
> > +static void
> > +imx8qxp_pxl2dpi_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                     struct drm_bridge_state *old_bridge_state)
> > +{
> > +       struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
> > +       int ret;
> > +
> > +       ret = pm_runtime_put(p2d->dev);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n", ret);
> > +
> > +       if (p2d->companion)
> > +               p2d->companion->funcs->atomic_disable(p2d->companion,
> > +                                                       old_bridge_state);
> > +}
> > +
> > +static const u32 imx8qxp_pxl2dpi_bus_output_fmts[] = {
> > +       MEDIA_BUS_FMT_RGB888_1X24,
> > +       MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> > +};
> > +
> > +static bool imx8qxp_pxl2dpi_bus_output_fmt_supported(u32 fmt)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts); i++) {
> > +               if (imx8qxp_pxl2dpi_bus_output_fmts[i] == fmt)
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge_state,
> > +                                       struct drm_crtc_state *crtc_state,
> > +                                       struct drm_connector_state *conn_state,
> > +                                       u32 output_fmt,
> > +                                       unsigned int *num_input_fmts)
> > +{
> 
> CHECK: Alignment should match open parenthesis
> #217: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:164:
> +imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +                    struct drm_bridge_state *bridge_state,

A fix for this would require over 80 characters per line.
Anyway, to make checkpatch happy, I'll do that in the next version.

> 
> 
> > +       u32 *input_fmts;
> > +
> > +       if (!imx8qxp_pxl2dpi_bus_output_fmt_supported(output_fmt))
> > +               return NULL;
> > +
> > +       *num_input_fmts = 1;
> > +
> > +       input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +       if (!input_fmts)
> > +               return NULL;
> > +
> > +       switch (output_fmt) {
> > +       case MEDIA_BUS_FMT_RGB888_1X24:
> > +               input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
> > +               break;
> > +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> > +               input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X36_CPADLO;
> > +               break;
> > +       default:
> > +               kfree(input_fmts);
> > +               input_fmts = NULL;
> > +               break;
> > +       }
> > +
> > +       return input_fmts;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge_state,
> > +                                       struct drm_crtc_state *crtc_state,
> > +                                       struct drm_connector_state *conn_state,
> > +                                       unsigned int *num_output_fmts)
> 
> CHECK: Alignment should match open parenthesis
> #252: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:199:
> +imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +                    struct drm_bridge_state *bridge_state,

Ditto.

> 
> 
> > +{
> > +       *num_output_fmts = ARRAY_SIZE(imx8qxp_pxl2dpi_bus_output_fmts);
> > +       return kmemdup(imx8qxp_pxl2dpi_bus_output_fmts,
> > +                       sizeof(imx8qxp_pxl2dpi_bus_output_fmts), GFP_KERNEL);
> > +}
> > +
> > +static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
> > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +       .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> > +       .atomic_reset           = drm_atomic_helper_bridge_reset,
> > +       .attach                 = imx8qxp_pxl2dpi_bridge_attach,
> > +       .atomic_check           = imx8qxp_pxl2dpi_bridge_atomic_check,
> > +       .mode_set               = imx8qxp_pxl2dpi_bridge_mode_set,
> > +       .atomic_disable         = imx8qxp_pxl2dpi_bridge_atomic_disable,
> > +       .atomic_get_input_bus_fmts =
> > +                       imx8qxp_pxl2dpi_bridge_atomic_get_input_bus_fmts,
> > +       .atomic_get_output_bus_fmts =
> > +                       imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts,
> > +};
> > +
> > +static struct device_node *
> > +imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
> > +                                          u32 port_id)
> > +{
> > +       struct device_node *port, *ep;
> > +       int ep_cnt;
> > +
> > +       port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
> > +       if (!port) {
> > +               DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_id);
> > +               return ERR_PTR(-ENODEV);
> > +       }
> > +
> > +       ep_cnt = of_get_available_child_count(port);
> > +       if (ep_cnt == 0) {
> > +               DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
> > +                                                               port_id);
> 
> CHECK: Alignment should match open parenthesis
> #292: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:239:
> +        DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
> +                                port_id);

Will fix in the next version.

> 
> 
> > +               ep = ERR_PTR(-ENODEV);
> > +               goto out;
> > +       } else if (ep_cnt > 1) {
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                       "invalid available endpoints of port@%u\n", port_id);
> 
> CHECK: Alignment should match open parenthesis
> #297: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:244:
> +        DRM_DEV_ERROR(p2d->dev,
> +            "invalid available endpoints of port@%u\n", port_id);

Ditto.

> 
> > +               ep = ERR_PTR(-ENOTSUPP);
> 
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> #298: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:245:
> +        ep = ERR_PTR(-ENOTSUPP);
> 
> Maybe the more correct return value would be -EINVAL.

Will use -EINVAL in the next version.

> 
> 
> > +               goto out;
> > +       }
> > +
> > +       ep = of_get_next_available_child(port, NULL);
> > +       if (!ep) {
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                             "failed to get available endpoint of port@%u\n",
> > +                                                               port_id);
> 
> This ^^ indentation also looks funny.

Will match the open paranthesis in the next version.

> 
> > +               ep = ERR_PTR(-ENODEV);
> > +               goto out;
> > +       }
> > +out:
> > +       of_node_put(port);
> > +       return ep;
> > +}
> > +
> > +static struct drm_bridge *
> > +imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
> > +{
> > +       struct device_node *ep, *remote;
> > +       struct drm_bridge *next_bridge;
> > +       int ret;
> > +
> > +       ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
> > +       if (IS_ERR(ep)) {
> > +               ret = PTR_ERR(ep);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       remote = of_graph_get_remote_port_parent(ep);
> > +       if (!remote || !of_device_is_available(remote)) {
> > +               DRM_DEV_ERROR(p2d->dev, "no available remote\n");
> > +               next_bridge = ERR_PTR(-ENODEV);
> > +               goto out;
> > +       } else if (!of_device_is_available(remote->parent)) {
> > +               DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
> > +               next_bridge = ERR_PTR(-ENODEV);
> > +               goto out;
> > +       }
> > +
> > +       next_bridge = of_drm_find_bridge(remote);
> > +       if (!next_bridge) {
> > +               next_bridge = ERR_PTR(-EPROBE_DEFER);
> > +               goto out;
> > +       }
> > +out:
> > +       of_node_put(remote);
> > +       of_node_put(ep);
> > +
> > +       return next_bridge;
> > +}
> > +
> > +static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
> > +{
> > +       struct device_node *ep;
> > +       struct of_endpoint endpoint;
> > +       int ret;
> > +
> > +       ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
> > +       if (IS_ERR(ep))
> > +               return PTR_ERR(ep);
> > +
> > +       ret = of_graph_parse_endpoint(ep, &endpoint);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(p2d->dev,
> > +                             "failed to parse endpoint of port@0: %d\n", ret);
> > +               goto out;
> > +       }
> > +
> > +       p2d->pl_sel = endpoint.id;
> > +out:
> > +       of_node_put(ep);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
> > +{
> > +       struct imx8qxp_pxl2dpi *companion_p2d;
> > +       struct device *dev = p2d->dev;
> > +       struct device_node *companion;
> > +       struct device_node *port1, *port2;
> > +       const struct of_device_id *match;
> > +       int dual_link;
> > +       int ret = 0;
> > +
> > +       /* Locate the companion PXL2DPI for dual-link operation, if any. */
> > +       companion = of_parse_phandle(dev->of_node, "fsl,companion-pxl2dpi", 0);
> > +       if (!companion)
> > +               return 0;
> > +
> > +       if (!of_device_is_available(companion)) {
> > +               DRM_DEV_ERROR(dev, "companion PXL2DPI is not available\n");
> > +               ret = -ENODEV;
> > +               goto out;
> > +       }
> > +
> > +       /*
> > +        * Sanity check: the companion bridge must have the same compatible
> > +        * string.
> > +        */
> > +       match = of_match_device(dev->driver->of_match_table, dev);
> > +       if (!of_device_is_compatible(companion, match->compatible)) {
> > +               DRM_DEV_ERROR(dev, "companion PXL2DPI is incompatible\n");
> > +               ret = -ENXIO;
> > +               goto out;
> > +       }
> > +
> > +       p2d->companion = of_drm_find_bridge(companion);
> > +       if (!p2d->companion) {
> > +               ret = -EPROBE_DEFER;
> > +               DRM_DEV_DEBUG_DRIVER(p2d->dev,
> > +                               "failed to find companion bridge: %d\n", ret);
> 
> CHECK: Alignment should match open parenthesis
> #411: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:358:
> +        DRM_DEV_DEBUG_DRIVER(p2d->dev,
> +                "failed to find companion bridge: %d\n", ret);

Will fix in the next version.

> 
> 
> > +               goto out;
> > +       }
> > +
> > +       companion_p2d = bridge_to_p2d(p2d->companion);
> > +
> > +       /*
> > +        * We need to work out if the sink is expecting us to function in
> > +        * dual-link mode.  We do this by looking at the DT port nodes that
> > +        * the next bridges are connected to.  If they are marked as expecting
> > +        * even pixels and odd pixels than we need to use the companion PXL2DPI.
> > +        */
> > +       port1 = of_graph_get_port_by_id(p2d->next_bridge->of_node, 1);
> > +       port2 = of_graph_get_port_by_id(companion_p2d->next_bridge->of_node, 1);
> > +       dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> > +       of_node_put(port1);
> > +       of_node_put(port2);
> > +
> > +       if (dual_link < 0) {
> > +               ret = dual_link;
> > +               DRM_DEV_ERROR(dev, "failed to get dual link pixel order: %d\n",
> > +                                                                       ret);
> 
> CHECK: Alignment should match open parenthesis
> #432: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:379:
> +        DRM_DEV_ERROR(dev, "failed to get dual link pixel order: %d\n",
> +                                    ret);

Ditto.

> 
> 
> > +               goto out;
> > +       }
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev,
> > +               "dual-link configuration detected (companion bridge %pOF)\n",
> > +                                                               companion);
> 
> CHECK: Alignment should match open parenthesis
> #437: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:384:
> +    DRM_DEV_DEBUG_DRIVER(dev,
> +        "dual-link configuration detected (companion bridge %pOF)\n",

Ditto.

> 
> 
> > +out:
> > +       of_node_put(companion);
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
> > +{
> > +       struct imx8qxp_pxl2dpi *p2d;
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *np = dev->of_node;
> > +       int ret;
> > +
> > +       p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
> > +       if (!p2d)
> > +               return -ENOMEM;
> > +
> > +       p2d->regmap = syscon_node_to_regmap(np->parent);
> > +       if (IS_ERR(p2d->regmap)) {
> > +               ret = PTR_ERR(p2d->regmap);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = imx_scu_get_handle(&p2d->ipc_handle);
> > +       if (ret) {
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> > +                                                                       ret);
> 
> CHECK: Alignment should match open parenthesis
> #467: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:414:
> +            DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
> +                                    ret);

Ditto.

> 
> 
> > +               return ret;
> > +       }
> > +
> > +       p2d->dev = dev;
> > +
> > +       ret = of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_resource);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
> > +       if (IS_ERR(p2d->next_bridge)) {
> > +               ret = PTR_ERR(p2d->next_bridge);
> > +               if (ret != -EPROBE_DEFER)
> > +                       DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> > +                                                                       ret);
> 
> CHECK: Alignment should match open parenthesis
> #484: FILE: drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:431:
> +            DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
> +                                    ret);

Ditto.

Liu Ying

> 
> 
> > +               return ret;
> > +       }
> > +
> > +       ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = imx8qxp_pxl2dpi_parse_dt_companion(p2d);
> > +       if (ret)
> > +               return ret;
> > +
> > +       platform_set_drvdata(pdev, p2d);
> > +       pm_runtime_enable(dev);
> > +
> > +       p2d->bridge.driver_private = p2d;
> > +       p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
> > +       p2d->bridge.of_node = np;
> > +
> > +       drm_bridge_add(&p2d->bridge);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx8qxp_pxl2dpi_bridge_remove(struct platform_device *pdev)
> > +{
> > +       struct imx8qxp_pxl2dpi *p2d = platform_get_drvdata(pdev);
> > +
> > +       drm_bridge_remove(&p2d->bridge);
> > +
> > +       pm_runtime_disable(&pdev->dev);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id imx8qxp_pxl2dpi_dt_ids[] = {
> > +       { .compatible = "fsl,imx8qxp-pxl2dpi", },
> > +       { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
> > +
> > +static struct platform_driver imx8qxp_pxl2dpi_bridge_driver = {
> > +       .probe  = imx8qxp_pxl2dpi_bridge_probe,
> > +       .remove = imx8qxp_pxl2dpi_bridge_remove,
> > +       .driver = {
> > +               .of_match_table = imx8qxp_pxl2dpi_dt_ids,
> > +               .name = DRIVER_NAME,
> > +       },
> > +};
> > +module_platform_driver(imx8qxp_pxl2dpi_bridge_driver);
> > +
> > +MODULE_DESCRIPTION("i.MX8QXP pixel link to DPI bridge driver");
> > +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:" DRIVER_NAME);
> > --
> > 2.7.4
> > 

