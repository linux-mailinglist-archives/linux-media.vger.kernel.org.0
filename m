Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD2B304708
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389533AbhAZRPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:15:03 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:33507
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390754AbhAZJDO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 04:03:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFLei8tlOfrK+66frFEdfGm25fVz8cyOYrvcYzUujBluBtor91qYDgRkYoL1vfNpJO6qlHUIJ7KChcEaPbCgwtOoYcJ6/aGj+ZWnLpNGTi1TnYDdYrhUW/N5BEMtTb0RnoqX5t9F963KqX3mlrNiKLC2KRzyFNJWTvXXWJCgfEc1eL1BP4nxTYIYDYrhIhEVW0DcIR6To9gdFuSrrugnloDgiZFuVEUo9qYplzPg4e0jD9p2ibmFNumxLoTn9xL9yB9nFZH8gSjS+SJ6dC8fGxCCssZPxRBOFUS57TlRyN8qz0An082LHMAqA74N1x59vHTh0/12lH2FALG/1WvfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS4FUi4lJy8sy5/foKPh2GA49woYwc7TxSiv6kty9bE=;
 b=AOjqU7h+pU3aU5D2e/Kv8l3IEN+GUZhhcRNeFxzZG4Q8vrT3aVOMjcFKZc4rxCl9CKOxjq01s7Nhhmpvu4WdNpvec/FpKZaBrFPU15sX89BzFnyM3hJ4X7pBK7+8mxeL5UO7WOLJfSoP+ZD6ZzRcvz2Jryt7G2cZAQk06Mkisph6DjFcwY00z+mt6FTTGr+wib26GBqJu3mLaA1i+yEdNkzlOmpvhf25WbfTBZj7mrBYNksj3jPel/JlfEohFkergXLRqNHzEUq0jk7sSpTKMuowceBbRsjlDAWbMpYI3zGRLdcV8b4WJVy4ZRGgUD159O+6L4apWJYYAqGxTseUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS4FUi4lJy8sy5/foKPh2GA49woYwc7TxSiv6kty9bE=;
 b=f6FiVqRwTJ/pz1SpKrKl7Rd6kv11cLKFuz9j5JtJBl1K3tShVoZiyh305JPbI0i/8syzQ5widpL1qS9okE+BruciTP58P7g/3mZkTNdOFws8Jxz/D+xFSiXWlvtaT9MDgI2+JS6ke89J0BZyaz3pa/d2JOPKXWA57g+tRILf/f8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 09:02:21 +0000
Received: from AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::64a8:cb73:cfb:1674]) by AM6PR04MB3974.eurprd04.prod.outlook.com
 ([fe80::64a8:cb73:cfb:1674%5]) with mapi id 15.20.3784.012; Tue, 26 Jan 2021
 09:02:21 +0000
Message-ID: <5c30dd91498ccac3207a9577f170c8a4b37c17e3.camel@nxp.com>
Subject: Re: [PATCH v2 08/14] dt-bindings: display: bridge: Add i.MX8qxp
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
Date:   Tue, 26 Jan 2021 17:00:41 +0800
In-Reply-To: <20210125211316.GA1000096@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
         <1610616132-8220-9-git-send-email-victor.liu@nxp.com>
         <20210125211316.GA1000096@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To AM6PR04MB3974.eurprd04.prod.outlook.com (2603:10a6:209:50::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 09:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c0e33df-dd2d-49a4-6637-08d8c1d916d2
X-MS-TrafficTypeDiagnostic: AS8PR04MB7878:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB787850008E997BA8FA3BB19398BC0@AS8PR04MB7878.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTxTelFGONp1UrkhwvXzHgGq1PN52QMN0Sp8mRYZcso8qzuSadLZT9bNJvZQs8+NewGX1zsc8VsyV5yiE7BIJNFxUusXKwQ0uukwDR1ZNsSpsKN1LIIhTsH6muUt8QugN3pYXEWA75VjTSlzqvED+wyd6agqBSrL1CzsW/Zs+sCBazwwVWGEoZDdYUyn77UEsqtdxjhUbNoPSXLMH6Q8l90Rl6oT0loLc01IINLymU0zHxwIbdGOpAGeQadLHjn8XGA60e6Uw6K+CL/TSdPfJTXgvLtzPBiC23K4kNcjjsqSYi/pdOlR8e6j++bZ4+/lRqW99lhGi4lv0sbXMmilBI/2eBG8I+gg3swj5+ffpDCkDOMmQVZD0N11NIGJSTiLA8Y3d2pQ5H7QhM9vGGPK0zZ4jZE6rni7+H4yZ3mcG8RejBUJjn3OzKI74tjYtMtwSY3RpBKcYS5CoBJJZ7/k/D1vxCuFIYlGs2w+oVqP9yIK9Fu6rIPmYTavMmwhKyjZrtu3S53+IoiNchgknD7h2GvKKdTZPlwshMGQDdOKPb9WmuayJgk10zaOIB6ZEgRtsMBAyQF+Nbrgsd2TzBtdHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB3974.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(4326008)(26005)(6512007)(86362001)(52116002)(8936002)(7416002)(66556008)(66946007)(36756003)(316002)(2906002)(478600001)(966005)(6916009)(6506007)(8676002)(66476007)(186003)(2616005)(956004)(6486002)(6666004)(45080400002)(5660300002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUlxNW4zdnhYRzJwUWxabjRXQ3dYaUhIbzdqL0JRQ3ZhNytTc3Y1SkVCY1pW?=
 =?utf-8?B?TUNWQXB0R1ZORTVrcGVWMFVvTzVxZlVIMnhaZDJmV2xBRjArU0hmeExCbmp3?=
 =?utf-8?B?aEYxaTNIaWlTOWN5V0pFRGlkeitqNTJKdktZa1M1UjNqVStPbHZ4RnptOW80?=
 =?utf-8?B?VGlZdjZFejNDOHhMRGg3QXAvMWt5OGpkRG1JYm1kNzIrR1VwUm9DcngyZGd4?=
 =?utf-8?B?RjZhQUZ1akZ1eExybWNzN251b1E0QVZsc0tnczcyV2ZlT2xqbFhoYzNFcngv?=
 =?utf-8?B?OWFVTk5yTnhLZlpEMXNzZlJCcG05cHhPYk5vU2RkcTljSjgvRjFOdDNGd0NM?=
 =?utf-8?B?NjVKVEVPVWMwLzZUSG9PTTV4Mnc4VGN4Ymh2bndlOS9oUXVSVTRlVzZocUFl?=
 =?utf-8?B?NDc3VWFDczVjbjZaSjBJc0hkVnVzZURCZWRYdVhTMHRaNGhRNlA2V1BkTTRa?=
 =?utf-8?B?WXRIU0gxMEppSmlVSmFmYzRhRkd5cjdtaXdDOWtrWUNKN21WTGRKN3phc0xh?=
 =?utf-8?B?RHo2eGE1SlRyRUFLZThrWldQOEdyRGkweXpBb0o1RitSUjZiRlJnZTRhTGRl?=
 =?utf-8?B?UGFibkhialpxelo3QVdsTDFwVzhqYUFqYUlYejhaaUtTamlTUGFRSTJ1NWN5?=
 =?utf-8?B?aDVuY1o3U1Fjd0t6WjdHM3VlbTAweThZWTNZT2pJVU5uai9YTFRRY1ZnVkVt?=
 =?utf-8?B?eXRpeXJ4aEdsc3JCcFNTcFNJL0RyTExEQlIrdVl6T3ExN0FWbUJield0Mnpm?=
 =?utf-8?B?MGhoYUdNN0hGbTFPSHkyclltdERJRVhBUHZuQ3RvVlgzTEhLOFNNeS9Sbnh4?=
 =?utf-8?B?Rnh3ZjJtV0lpdEYzS1ZHNFV5NGp5eHp3R2dGN0lUS1NQdG9zanBFZ1J2cWJp?=
 =?utf-8?B?WXFmWE9OMzdDamNFczd0Y0ZTK1NoYXkvblhpbWdLaEVNUS9pS1d6U3YzSHdx?=
 =?utf-8?B?WFAvV0czSnphb041eGF2QTFrdjF5dUNlUHZNcVRKc09vWGE1dTliYVJPZTZG?=
 =?utf-8?B?enpDeUp0ZnpKTFA2NFVRZjNyTkc0Yit5RXlvb1VYeWQ4U1ZuQnZYTG1Cd2pp?=
 =?utf-8?B?cVl4c2x6SUprMVB1NFVHUWVmK0c2bnVoMFV5Sk8xZWJOcFV4ODZoVjVnQk84?=
 =?utf-8?B?Rm45YVJ2bUgxejgveVJvVDNjZ09UTWcybG5tK1pFVithemp1Ui96OVZwK3VY?=
 =?utf-8?B?NkpCMFEwOGpsMkszZDhlQkFCZy9wSUo1SnUxOVM2U1o1RWF0dmpHSGJrR1Vr?=
 =?utf-8?B?NHlkVitIbEpTbm9WQTJBb1hnVWRFbkRiSVNnKzAzN2V1a1dnRStHd0cwOHFI?=
 =?utf-8?B?MThrNGdDa0dpT0xrZ0JzcVd3MjgxbWJrMmRoTENKendaNEh1U2xkRURUUjMv?=
 =?utf-8?B?cEhodmd1aFE5V3FxeVpkaVJVbVBFTExTYkJBdFNsalJPY0ZDSXdRN1h4SWxn?=
 =?utf-8?Q?jrIauveM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0e33df-dd2d-49a4-6637-08d8c1d916d2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3974.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 09:02:21.6781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy14bFNiMlWGnK1xBqmpPCDBSSDlRCLV9iM8ElShMTW+htutLDh6IBRgvTey3ydAGt3z8H/KA974OTWNnQRXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-01-25 at 15:13 -0600, Rob Herring wrote:
> On Thu, Jan 14, 2021 at 05:22:06PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v1->v2:
> > * Use graph schema. (Laurent)
> > 
> >  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 105 +++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > new file mode 100644
> > index 00000000..187824e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbridge%2Ffsl%2Cimx8qxp-pxl2dpi.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C39b067c8005e4019ae6f08d8c1760c31%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637472060047200709%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=u7Hv3l5h%2FwAfl31GcfBntdxDXrAAM7XBxEwitTHo2Sc%3D&amp;reserved=0
> > +$schema: https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7Cvictor.liu%40nxp.com%7C39b067c8005e4019ae6f08d8c1760c31%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637472060047200709%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sM%2F9h6GLwhim7LidsI6upQzly7NnZoTbal2YBGygnEE%3D&amp;reserved=0
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
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8qxp-pxl2dpi
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      A phandle which points to Control and Status Registers(CSR) module.
> 
> If this is the only control interface, then make it a child node of the 
> phandle.

Will do.

Thanks,
Liu Ying

> 
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
> > +  - power-domains
> > +  - fsl,syscon
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    pxl2dpi {
> > +        compatible = "fsl,imx8qxp-pxl2dpi";
> > +        power-domains = <&pd IMX_SC_R_MIPI_0>;
> > +        fsl,syscon = <&mipi_lvds_0_csr>;
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

