Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCB6330A9C
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 10:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhCHJxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 04:53:40 -0500
Received: from mail-eopbgr40059.outbound.protection.outlook.com ([40.107.4.59]:8313
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231151AbhCHJxe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Mar 2021 04:53:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chrYa/9odeDqfrblAAg1U0GohRsap5EZXQqEPvg8Z6Vxhuz+hU/jg4vc9Nr0wlM7qxKTMIL+kpbx1rrUG19UVzGkGEJI45nFQq+lqpcpHVPVyBBWbFxuBcWIO7maHUvsvuuBenvWXg5Riv4J6YumjGKiMBKFAFTQy/MR8X/eUZy7BoDB1YKQYTFcXIRgLzb0IVabIBlWXwJwqy6t01uAz9TBHGS+MFB0nTuF1qiLd7tZ9pr515+t/i4xU3v7mV7cUC/kVz0s9I2Etks8YR727ERSGs3UwmspyFEsTH5kCptK4YL/MX3n/hLAsj3KB1WuMS0Ii9v/8Q4zaT+oGefgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+/2WY26xe8Br5GUQyH/6d0BFghH6kFd11wd9V5mjMw=;
 b=LDAUXwJdWyP8gorJJYRtjTxFbRwrmv3e9zHWAt5bVVYuoqHWUojGYKPSs4GEbwfhnvI/Cmq0xyV+jBxxWvGPzHForYCdBW72PWZdTZ2JCYlTsj3IZBFzWC56vkCQCxV2f3CsfT9m3tYZ86sHBPHdhv/XzKP3jPGge801AfrxVc61PO3aU0/yTSIeo5blcxGCLkmP4VxMFmegiZCaRN+4pxy4yWA9yVOJkQTYjnb9fs4o9oKawUdd6X/jGR4t32wzNJ5STVNeNPCDogUUFex90HgIiydP5nXVy23PQpDlRfVIIUs8N2TlXfNQCE6nAYGsBXpnpdVyti/VxN75JuszKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+/2WY26xe8Br5GUQyH/6d0BFghH6kFd11wd9V5mjMw=;
 b=eDpius+3DaBIkqyNiYF9iaG0nZAGSySoNVuJi2xfQ8YR4UpkXTnU6byNMbNsxa08Kyx9pcpfS2WWVHGW9eTuz2YtG+BTlNL3Es02j3vuOAFaMyL2ECZzYT03BnxHc8Jh1Bf7PEVSzLFE9EayZD4TLzzKUH63suwV8mxjEr0OK50=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 09:53:31 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 09:53:31 +0000
Message-ID: <82712e64c5ff62645e0e15f0e99b3454e03d0802.camel@nxp.com>
Subject: Re: [PATCH v4 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
From:   Liu Ying <victor.liu@nxp.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org
Date:   Mon, 08 Mar 2021 17:52:03 +0800
In-Reply-To: <20210305224227.GA772562@robh.at.kernel.org>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
         <1613619715-28785-9-git-send-email-victor.liu@nxp.com>
         <20210305224227.GA772562@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::32) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by HK0PR01CA0068.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 09:53:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f8b9d80-3854-4a50-e373-08d8e2180762
X-MS-TrafficTypeDiagnostic: VI1PR04MB7181:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7181B41D933A9004398C122198939@VI1PR04MB7181.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7CUlLYaNXgZteC9DvquLCOgXyVSVRAh/UP5lx/F6hwYZD/TZUp4MA1irZS00m9DtCTLxeeh9iedNGJuIRROVPUDn/QJRl0KjNTZ3GW5c5NKCx0JCVPcAqf1dXX2XMNRiwPEgz8+2RtAYT5z4YQWv+Q8llF1TKiP/luzkd5nS05pcpkiNsBD1knefJa+dbpEn9oGQOsAYB73EpG1xMoHFRmXrK9Ter0PvgSNs/P8JFoJXC2T+vnQJ72B3yWCME9tlZvYjfmgjSm7zXc43w4CoI/ysylz6NeKdEjmsjDO4MM7YXxCIt8rVME8k2HCx6H3KM5EZ0j93eqkCL9mhCnSm5HVZrRx830ZjHejJW4RYVAIgHJPDmqvN08zJTnaRdELYQAkj62q6/W3m7Kflln+DEJu+unm6CP/kkEZVtsdVOBJbU2ED2lKqvItNq/zowpWScHX/jLm9Xn6LomXRY3VwzYLz5yy0ERcHBcnUNL66C8JyTSwavLiJmIwDsJbe3NBcjyBKOvQkPH0Vp6VkxAs0KMtol3ldrY8g1hZshrslJGYSP0WDRkb4XWBqMuEcNw9c4Ax2463avo0S4AebQfUqaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(8936002)(6512007)(478600001)(316002)(2906002)(8676002)(6666004)(6506007)(66946007)(2616005)(956004)(66556008)(66476007)(6916009)(4326008)(5660300002)(6486002)(16526019)(52116002)(45080400002)(86362001)(26005)(186003)(966005)(7416002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2Jlck1CRW5CZmJHOTMyRkJVTEEzTDZmb1poWDM4V2ZCbXZyeWNWWFM1em9O?=
 =?utf-8?B?bGhzR2RUaDFHb25NeXJEQnI1U3hyUkpWTDM1S3lNTDM2aUNkY05TUzEybjlD?=
 =?utf-8?B?aFBoRmorL083cGVISnkzZXlsajZyWExxNTBYZkk2ZDVtTnZabnhBUnMyeWpy?=
 =?utf-8?B?REJqVFJFbU43d3lxMEgwRmVlTUZRL3dLN2FuN1FpbnFkREFicnYvVi8yYVUv?=
 =?utf-8?B?dng4LzVsR3VFZm84bHNCcnFoWlVab3V4Tm5ENGdMaEU3MkxkOVJ2NTJkTzBQ?=
 =?utf-8?B?Ymh1SmJJSGp4bGxwY05mYldZSnJSa0FqZFRDVFZHQm01S29zMy9PUTN3MU9F?=
 =?utf-8?B?aWV4OFR3WEJXSldQd0hZdkRybzV2U09BVXF1KzllVDJ4VnZLR2JycGRLQlA0?=
 =?utf-8?B?MFlUQVo3VFZWRlB2Y0FtNFVadmxwVVJOMVpyZHhNOElaVHlRYTJxaXdvSzRU?=
 =?utf-8?B?M2JNc3FOQUhHd1ZOb3J0OXJteUo0bmRuZFp6RUNQanlEelJSTXRuQnhpd25V?=
 =?utf-8?B?dEYvWUJqSVh3emtMOW1xN2RTMjN1aDM0dGZBU0VxcHpEQTF3NlRVakNlNWZi?=
 =?utf-8?B?WVhTa0NxL2ZPNkNEV2NzTXM0Q3lOUUFiZGxoQld5UTdmZ0tWQjFEOGxEeEVR?=
 =?utf-8?B?Zm9RZVpOcEZNY3p5dVJrbm1DZ0tzZW9lTTBlUmIxWVhDYlo3SUV2ajQrdlYy?=
 =?utf-8?B?MWVxMTJJdlFkVG8zQWtUZkx2S3ZPcEYyTUJHeVpFQ25zK1FnbEtjdUdlNVhF?=
 =?utf-8?B?RzIvenBNM0dDUjJzUENBUXFrSGppbE9QZTRCSnc2R2ZrQXFCRjZRQzlJclgz?=
 =?utf-8?B?SUs5Z2N0dHc0RmUwVy9BdnFoS3BvaDJwZVdib0dDc1Rvc1JlMldnbzc0MWF0?=
 =?utf-8?B?bTVBSURhMXhON0orVTZKTjZjTG01R2xlemZqRW1iU29kY05HeFpWQk03Znlp?=
 =?utf-8?B?Wk5YeDY2ME0zNlpJRXpXTHJZelBIZVVNdmpLKzFpamNoczVMUHlld3NkMUVL?=
 =?utf-8?B?STNYRXBvYlZtdkhTekl3bWgrcVdzaU4yRzJPcEZWR0JUei9Ob1NSZ3RqRGdO?=
 =?utf-8?B?N0VRMjRPSHE5NHRBak5QN3RaWU82SW1CNkk1YTM5QlNOVExnYlp3NzAvUTEy?=
 =?utf-8?B?YS9Od014Q2h0SjFZMm1FMjlMRzFRTVprMmJnU2pqSU9IKzV1aHhZMmxTcHl2?=
 =?utf-8?B?dXhENGlXYjFPTkduUnlLQitVLzBsUXVGeFJNcTllbC9GMzhaUzNwZHJaZlBi?=
 =?utf-8?B?WGI5eUtqQ1VjSkR1dHhjcEkzemtoUFFSRkQzdkFwM3ArQStOcUVFMXQxNmoy?=
 =?utf-8?B?azlhZFl2RUNHMUwwcitWS0lnb3JvaWN6K0cxZVJIRmZmOGdua3IzQmN2b1Ir?=
 =?utf-8?B?Q3RmSndHZWNtNVV6SlZNNWR0NC9CRkVyeEk0alYrMy8xTTRMVW1uRFExcXlQ?=
 =?utf-8?B?V2cvaWRleFBNSmRoNkN2aGJTV2NnZGl2NENjc2Zlc2JYMU1JTTFMTDJNT0Jt?=
 =?utf-8?B?R2s1ak9RTXVHdWtBc0I4QTBvbHdxNklUNWhOaHcrTW9DS1RrTFh5WWNlNWRt?=
 =?utf-8?B?cForeEh3VzlpU3UwMU8xaWErWkFmVDhvankrdHJ2WERWdGhNL2lINnA0RzNt?=
 =?utf-8?B?Qy9FUUVreVU3QmNvTEpEeCtxamxKUkxaSFJETmp0cEdRbXZHVjRlYXRpd3dO?=
 =?utf-8?B?amkwY0RLVm1zSjFYajVtMzZPU2pWYVdrcFF6WXEydHpoR01UQVlsQTFoUGkr?=
 =?utf-8?Q?xU3k2+aVHpMcae9f5DYMPpAVTj/HzS7HX2w6YVe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b9d80-3854-4a50-e373-08d8e2180762
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 09:53:31.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg+MHBCDcQq18GkXe6doI+kIPKKEaMLiuDSGdQp0pgetH+bG6dM83mQ6mNB/tmD72fY6S07+N5kUq3XbJ5T+qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Fri, 2021-03-05 at 16:42 -0600, Rob Herring wrote:
> On Thu, Feb 18, 2021 at 11:41:49AM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3->v4:
> > * Add 'fsl,sc-resource' property. (Rob)
> > 
> > v2->v3:
> > * Drop 'fsl,syscon' property. (Rob)
> > * Mention the CSR module controls PXL2DPI.
> > 
> > v1->v2:
> > * Use graph schema. (Laurent)
> > 
> >  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 +++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > new file mode 100644
> > index 00000000..e4e77fa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pxl2dpi.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ca37ec67ba3274bcea5c408d8e027f69b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637505809544037562%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UN2IQps7q5vK6uNG8fQTn1Klgn0cVyuYnUeqxrjCWHo%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7Ca37ec67ba3274bcea5c408d8e027f69b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637505809544037562%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cvJVL3Fp1hwbjj1jO1YAozKdZATt5DJ78E7vGT%2F25Oc%3D&amp;reserved=0
> > +
> > +title: Freescale i.MX8qxp Pixel Link to Display Pixel Interface
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qxp Pixel Link to Display Pixel Interface(PXL2DPI)
> > +  interfaces the pixel link 36-bit data output and the DSI controller’s
> > +  MIPI-DPI 24-bit data input, and inputs of LVDS Display Bridge(LDB) module
> > +  used in LVDS mode, to remap the pixel color codings between those modules.
> > +  This module is purely combinatorial.
> > +
> > +  The i.MX8qxp PXL2DPI is controlled by Control and Status Registers(CSR) module.
> > +  The CSR module, as a system controller, contains the PXL2DPI's configuration
> > +  register.
> 
> So this node should be a child of the CSR. Ideally, this schema is also 
> referenced from the CSR's schema (and if that doesn't exist, it should 
> be there first).

I can add a patch to introduce a schema for the CSR in this series,
just prior to this patch.  Do you think if that will be fine?

Thanks,
Liu Ying

> 
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8qxp-pxl2dpi
> > +
> > +  fsl,sc-resource:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The SCU resource ID associated with this PXL2DPI instance.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,companion-pxl2dpi:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      A phandle which points to companion PXL2DPI which is used by downstream
> > +      LVDS Display Bridge(LDB) in split mode.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The PXL2DPI input port node from pixel link.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: The PXL2DPI output port node to downstream bridge.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - fsl,sc-resource
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    pxl2dpi {
> > +        compatible = "fsl,imx8qxp-pxl2dpi";
> > +        fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> > +        power-domains = <&pd IMX_SC_R_MIPI_0>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <0>;
> > +
> > +                mipi_lvds_0_pxl2dpi_dc_pixel_link0: endpoint@0 {
> > +                    reg = <0>;
> > +                    remote-endpoint = <&dc_pixel_link0_mipi_lvds_0_pxl2dpi>;
> > +                };
> > +
> > +                mipi_lvds_0_pxl2dpi_dc_pixel_link1: endpoint@1 {
> > +                     reg = <1>;
> > +                     remote-endpoint = <&dc_pixel_link1_mipi_lvds_0_pxl2dpi>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                reg = <1>;
> > +
> > +                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> > +                    reg = <0>;
> > +                    remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> > +                };
> > +
> > +                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> > +                    reg = <1>;
> > +                    remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.7.4
> > 

