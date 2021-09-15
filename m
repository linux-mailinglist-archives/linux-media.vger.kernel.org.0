Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC14140CD00
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 21:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhIOTJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 15:09:15 -0400
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com ([40.107.94.79]:3745
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230230AbhIOTJP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 15:09:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luaTDO6CZbiNYcEh5wtxf/5k2Dmk6Rky6nr8FscusfoQP1uZIp6iWF6/nSdTYTarQtMuvvG3RLmPqvUGi6MmGRZXDMTxhxNzudnjmNXmQHEykTAbyP2ICNCw84X4cnYhnrj7vL1g49ovp/CIHXbeYjk2ZeAdzYlIkUKQaBndE1kuDvzRbQx34pJjxui2pKg9AfrLBSYyIGsXoClsuH30N1DjvSQZnuh3ptSHLEbsTZiiHf7n3KL5XL2Lb9ENwL+jZVW5J3MqH2SqEGBiURpQaf0iKzq4rNeiTRiJU5Xhu2Tl4LwFk1ojY+DwDi1jF3x1UQQxs66zfbocogbXZFXpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4D8wEupx0k9KoDnhNYQwj+9Ov1k+Imdt0a12zyfQC/4=;
 b=ZYhZQcaYnF47oURc8faRXGs0D9GP5tOE0C9u5Y937pK68NrqNVHtqeq6KjW5Ut1+hN7SXPwck2Shv2Un8M56ZVdHnBMTSdNtBLv/oNecymCcyp5LtEvt+brE7oRrozUmh+qBbaxYC0FkPkKe7lWM3UijeGTnHVNlzOWU8HozTUEQiwLyXFmVxhiMo4dvUV2U45VGbTTZ/pCMCxeZavVM8ywEgyz6/cD+NARQOFv3zBi152C+DwIKi32UBs+Ek3k1Od+53DASE72QhX8g3Upu9cC8tnJkXonCFUJWvj4Z5DxufK1FIThpEZT9zPpih6Qn/JbDyFmcEzJy/Nw8tPRedA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D8wEupx0k9KoDnhNYQwj+9Ov1k+Imdt0a12zyfQC/4=;
 b=mnG4yO5ccG0kuYc15KbXYi2/M89vdgaqlbewaxcLQUXSivAKFvq5xFTfczbiFtO58j1QC2iGLCwYWZ1Rn+O9IXKw3jpuMvcYdsr5P0cxl5j0yqSI4tvEiwbKpELEuLcPO1OuMANw1gk8JWCF9gniQ9x+TOB655WNyAIvu1OPtJg=
Received: from SJ0PR02MB8514.namprd02.prod.outlook.com (2603:10b6:a03:3f5::9)
 by BY5PR02MB6834.namprd02.prod.outlook.com (2603:10b6:a03:211::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 19:07:53 +0000
Received: from SJ0PR02MB8514.namprd02.prod.outlook.com
 ([fe80::cc66:baba:632a:a910]) by SJ0PR02MB8514.namprd02.prod.outlook.com
 ([fe80::cc66:baba:632a:a910%8]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 19:07:53 +0000
From:   Anil Kumar Mamidala <amamidal@xilinx.com>
To:     Anil Kumar Mamidala <amamidal@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: RE: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Thread-Topic: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 AP1302
Thread-Index: AQHXpI9sCB2RVInkykOPzogv1LoR9aulgA1g
Date:   Wed, 15 Sep 2021 19:07:53 +0000
Message-ID: <SJ0PR02MB85147532A85305993AAA9D7FB7DB9@SJ0PR02MB8514.namprd02.prod.outlook.com>
References: <1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com>
 <1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com>
In-Reply-To: <1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fbfe7eb-fc45-4f6d-a687-08d9787c1eec
x-ms-traffictypediagnostic: BY5PR02MB6834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB68345B40324F0D2B48239CE0B7DB9@BY5PR02MB6834.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufy9LiHaG2Ab5LLMUh09kSJ5aJeaP2xREEI/Ocg7Ge/8OrL5jgwYgiPjxpO8LcdbEaa7cFdoaxUhZYwCj+esYrFR13/kh+ub3xC6JFxG0aCOSoOA3YYtVr1epIYV3DtdDcyl57cecSuxYDB5RHqALUZ4SVrZTGDKUIRGMZiT/DA5NN3lDzcLNIUsrhZ+l7Rvl7tdbMfyXQDIo/F/Go5OXo/6n+YoVypH1O1vMHF214+yfZR0eJtHQqVTP7W/r71vziR5SuEGNeAAXJU+jgQwIibzDPlnUba4Jq2rPsk7LC3xDBQ6QxmWSld9AYB94kNiXjQm67IV/qbYmb4haAP+8NGlaYj6yD7hv747udYQDWHFWO5AmvdMVQxANvZHownyKPKs7tw9o/VcoVg8Z0ZiFm9y0Se+bIxl7T6tSw6jBobtjkzC18SWQiKsG0qzilHe/83r1OWDHKsLkIvS5e8eNnaNRLgC67UlXoAEQgejEsRNGjA8f6mIabYjA2Eg+7rSf+hiz86VSpKd/u6kT+/uGUanB+JVbNoIMW7NasMLyw/9y4iRzLgrExNB/O/zwEdCYW/rDDwjUqz6/2CKbNP+ZryYhxmcS60CBRzF2Lwc6ASp5fpGFkFf4NsLU69ITeq3mXAuVQeb53aO6xrJduul6ZEMUvNeD2CulBa+FG858pOp+dK40TJ30ilghhulU2FPQAyF81Uerwb4AKlHxMNdB+BdfYpFmnrKF2WqQV7PXP18NTFKIR/t7+KVGZfMx3r1PITDvxWkLodccI2w6fx93eP2CNIBaWzS+yYK+galoaYkPlRhjUPsr4rPwCBGms37q5aSfngJJz0Lt3p5uIAttg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8514.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(54906003)(110136005)(55236004)(38070700005)(478600001)(2906002)(4326008)(186003)(6506007)(83380400001)(53546011)(71200400001)(66476007)(26005)(86362001)(66946007)(66556008)(966005)(55016002)(316002)(122000001)(52536014)(7696005)(8936002)(38100700002)(9686003)(33656002)(76116006)(66446008)(64756008)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q4NSbICRh5MBGTXUToBDHotECuzJ5qr16CcUyURtLCEaWv9ipWiJupvwGcV6?=
 =?us-ascii?Q?3Y4ehMz+UR1XgbR9rlDDO4UV+PNQgiGyqdLOopdEDqOmnVpJ2FDEyCjnGyH3?=
 =?us-ascii?Q?oSfklSRujEj+zeKcGJQ5/Ftt4NrtgLtDEe7PCmXHIkBTi3MRTD7IcmM/eKa+?=
 =?us-ascii?Q?IZw4YnbVeEg0dhGnwpzg88j2tdxtCrzmwkBJIYn2BBUDyb6kIWDy/9mvtYnH?=
 =?us-ascii?Q?B7TrNGdhWCkaKBSjZJFHm53cehZMEf7x8N8Gnyltu/DjcJlnTMjPwWFQl7oj?=
 =?us-ascii?Q?jWbE8IWfbD5j+gTX1WHnKSeSeZhwG5J6JvBlQwggMWjD/YwTRbNeR+CLvV+q?=
 =?us-ascii?Q?ZcQIWmiJ9/s33cVpZFk/fFeZcFgP3YYDFGlclm54/9btsSPEN1+fEcZZ0dKv?=
 =?us-ascii?Q?EPCcFqq3VeErHcyEVbxLa0J7VV0HpNffR5F0f+VpIu6Z5lL8D4TgF7k/lwMX?=
 =?us-ascii?Q?PnsJvUPbQC1re17SdCq2E2fE5GdaMGOE7O5T+4XzqET6IY98EGlw5q5fvz5R?=
 =?us-ascii?Q?jvMJ7JU11cVtySG2S9vMd49lv9WgF/cACoZtKv274zGLKRdxTodBsaZ06pfh?=
 =?us-ascii?Q?RD6DmaYBe29rUnAw5OpMzYAu1zzMtj//preEZrPIZp9n0MEtEohzLxvy1urq?=
 =?us-ascii?Q?KIiG6UsyOfwEn+dpcJ78siSLYeFqclx1S60PBZperzzKdRGakvdZJLMrHgzy?=
 =?us-ascii?Q?zCaCiaa2KQ3FlbZTDPJT73x89cZR9X9teBvjae4+gWuthdZjG7GPUAqfjcxR?=
 =?us-ascii?Q?ydgPAD/YXg+TYj+VPStVOUf0UqFnj7lTwp6/JYrywq9c09DTnEvIVDXmkXv/?=
 =?us-ascii?Q?MJQZHtttv4dSb0pV+z1wJI63aD7vA6GlqBcHV7aS4y8BX/im0kNhrsEQt9f1?=
 =?us-ascii?Q?m7gn9kYvViHxqyk68GHszTi/nhTLiNEBRTEC17zwbmBxu9dEL8VjKqT6Fear?=
 =?us-ascii?Q?/wMNyaNcjTTqWvb5zMjKMrhId32kOI/mQcaTF8n+uBbde3G+w1v6umF+grIx?=
 =?us-ascii?Q?nmZqLu2fNL/OyeX7we4d5X35IubYLYBHT4aOhfyiT18BUqSxaQJhuEXvjpLo?=
 =?us-ascii?Q?K1vYgMkrPfr/Itl96O4vsoYWrVZD8KmFhDgLDo7sMdczxqfYPP3JGF2t4Ihx?=
 =?us-ascii?Q?yKipFMOvMRYVs4LvLbcbd91X2ZSSyDpY1O8GNUGgYvAXx9y39YOPMj9moOs2?=
 =?us-ascii?Q?Ceu+a1trqO0yWNdmgqq91Dmvq9N2UHpz1wScEjeJVnpa7voW1IfIdjzoodd4?=
 =?us-ascii?Q?uhYfBdG3dbRkLQUji5WEdubNzLx5dta76EAJMgZymagoXt3dsuFa6owg9YrN?=
 =?us-ascii?Q?sxA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8514.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbfe7eb-fc45-4f6d-a687-08d9787c1eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 19:07:53.8026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n0hsBfLYHdX43/+VAYCr/TJ6s65kMSdGCnbUe9jtHYSNNjhP23H7av7F5Wcu+YpjdmGRJUwvNvbyymLMEeGAjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6834
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob Herring,

Can you please review the patch and provide your valuable feedback.

Thanks and regards,
Anil.

-----Original Message-----
From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>=20
Sent: Wednesday, September 8, 2021 2:26 PM
To: linux-media@vger.kernel.org; sakari.ailus@iki.fi; robh+dt@kernel.org
Cc: Naveen Kumar Gaddipati <naveenku@xilinx.com>; Anil Kumar Mamidala <amam=
idal@xilinx.com>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Ste=
fan Hladnik <stefan.hladnik@gmail.com>; Florian Rebaudo <frebaudo@witekio.c=
om>
Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP=
1302

The AP1302 is a standalone ISP for ON Semiconductor sensors.
Add corresponding DT bindings.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
---
 .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++=
++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b=
/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
new file mode 100644
index 0000000..d96e9db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AP1302 Advanced Image Coprocessor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Anil Kumar M <anil.mamidala@xilinx.com>
+
+description: |-
+  The AP1302 is a standalone ISP for ON Semiconductor sensors. It=20
+interfaces to
+  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the=20
+two
+  video streams and outputs YUV frames to the host over a MIPI CSI-2 inter=
face.
+  Frames are output side by side or on two virtual channels.
+
+  The sensors must be identical. They are connected to the AP1302 on=20
+ dedicated  I2C buses, and are controlled by the AP1302 firmware. They=20
+ are not accessible  from the host.
+
+properties:
+  compatible:
+    const: onnn,ap1302
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  clocks:
+    description: Reference to the CLK clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the RST pin (active lo=
w).
+    maxItems: 1
+
+  standby-gpios:
+    description:
+      Reference to the GPIO connected to the STANDBY pin (active high).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: MIPI CSI-2 output interface to the host.
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+
+        properties:
+          clock-noncontinuous:
+            type: boolean
+
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+
+  sensors:
+    type: object
+    description: List of connected sensors
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      onnn,model:
+        $ref: "/schemas/types.yaml#/definitions/string"
+        description: |
+          Model of the connected sensors. Must be a valid compatible strin=
g.
+
+          If no sensor is connected, this property must no be specified, a=
nd
+          the AP1302 can be used with it's internal test pattern generator=
.
+
+    patternProperties:
+      "^sensor@[01]":
+        type: object
+        description: |
+          Sensors connected to the first and second input, with one node p=
er
+          sensor.
+
+        properties:
+          reg:
+            description: AP1302 input port number
+            maxItems: 1
+
+        patternProperties:
+          ".*-supply":
+            description: Power supplies for the sensor
+
+        required:
+          - reg
+
+        additionalProperties: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    # How can we express that onnn,model requires one sensor object to be =
set ?
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+  - sensors
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera@3c {
+            compatible =3D "onnn,ap1302";
+            reg =3D <0x3c>;
+
+            clocks =3D <&clk24mhz>;
+
+            reset-gpios =3D <&pio 102 GPIO_ACTIVE_LOW>;
+            standby-gpios =3D <&pio 40 GPIO_ACTIVE_HIGH>;
+
+            port {
+                isp1_out: endpoint {
+                    remote-endpoint =3D <&seninf_in1>;
+                    data-lanes =3D <1 2 3 4>;
+                };
+            };
+
+            sensors {
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+
+                onnn,model =3D "onnn,ar0144";
+
+                sensor@0 {
+                    reg =3D <0>;
+
+                    vdd-supply =3D <&mt6358_vcamd_reg>;
+                    vaa-supply =3D <&mt6358_vcama1_reg>;
+                    vddio-supply =3D <&reg_1p8v_ext>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera@3c {
+            compatible =3D "onnn,ap1302";
+            reg =3D <0x3c>;
+
+            clocks =3D <&topckgen 0>;
+
+            reset-gpios =3D <&pio 102 GPIO_ACTIVE_LOW>;
+            standby-gpios =3D <&pio 40 GPIO_ACTIVE_HIGH>;
+
+            port {
+                isp2_out: endpoint {
+                    remote-endpoint =3D <&seninf_in1>;
+                    data-lanes =3D <1 2>;
+                };
+            };
+
+            sensors {
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+            };
+        };
+    };
+
+...
--
2.7.4

