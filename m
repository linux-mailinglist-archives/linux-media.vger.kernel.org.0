Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A37511709
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbiD0Lum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233131AbiD0Lui (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:50:38 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290103.outbound.protection.outlook.com [40.107.129.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF02C9BAF9
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbCrQhRI+ScmVgZh9CQrNnUOJ/BO4FP0hYsAL+cZguIfcTbxvKtdS3/fu2TbhOhm7j1NlAoc8qOKpqH4ZtWKW6YUxRPAMAETDc2yas2wAbiGuVTh/5TviNDSF8GHd9FxiwYn1JVLte7HoycZ2c0UuW5yl6dWevjN+i2puqA67zc1bnbXKPx3Z3CsIa4dZpe21TT6SGKSL6+BgOPZfY9YCRHIdvE8TdUZcAiPlH/Rpto+BwGy264JBB60QvX5VkX2uA5Tbj4lnSHmcjpc8MZ4/wwhhJx/66lVWjMfA3k1Do+Kpv/G+3zuABW+j5DLCscVp2lwP6JE61ctJ8A3iiyV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgLa6NPuLOVp2A6Nuu0le+wowvjyfwV0pZN9jvbxYp4=;
 b=UkjqP0qXLlRW7ktwNF5ma218n0kgN+5UBn7FmG2XLH7WOUC1MrBHosR8n5y0XFhBmG3Qj1Q/HKTV9IPgPeNUI67RfPS/BesayTWBNK+3G75A7hoGgEjae987y3rGHNErys2RcwuO09DootylvTWndDnmruvnNU47EeB4L1PqO6zt221tjNh17XGXJo4Gut9BBwYmhS0Pz1P61bx33tRCDUAHdCrsQKoY5m+XKgHBXlCQjBdJD2+Wuh2iZteiQbZ9JgW775PCLkrq9lyVLqldY8poFbnEWufWfR1ldTENf7fp6arfQcj+qglPCN54bp+MODCJWNQ9BVtgahzrx08IRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgLa6NPuLOVp2A6Nuu0le+wowvjyfwV0pZN9jvbxYp4=;
 b=MeKBHFU8mtk0lh5YVmelknb7i/sn5HeueKiorlRs5NNG3Dy7WVN+YwM/GwNbnLugg1RHNr2xzNKU95kHKd5D/az120OpomDUTO1AuH2kyw7cuJEDtePrXGuRrVoeMTsUXoTtzXr1Ido+EEbL05li6Fg1cLPS+qs/5tNMgeD0FgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1502.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Wed, 27 Apr 2022 11:47:17 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%9]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 11:47:17 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v8 5/6] dt-bindings: media: staging: wave5: add yaml devicetree bindings
Date:   Wed, 27 Apr 2022 20:46:37 +0900
Message-Id: <20220427114638.1638-6-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
References: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb5037a3-0d28-4409-258f-08da2843adf7
X-MS-TrafficTypeDiagnostic: PU4P216MB1502:EE_
X-Microsoft-Antispam-PRVS: <PU4P216MB15025DEA7F9CC89FB69C92EBFBFA9@PU4P216MB1502.KORP216.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ZfGA88inmPDGmzN38VkORGGrG43gtTk4XaUn9IW6a2qrtgZGZoU522/6rhmCMZUOrHh1HpKKawaFUh44Qn9+Y/L2f4+oN4KtDB862Pe0BTav6+krRifceeMUwUJJ3ExvoNuRkEPRcOa/sJSWsXp1KEd149teupdreadaqHKBPIfeoDZsHPq3eA8OEh8RDR1yWeaymDZu6iD93FoepzkAOG+8RQBrHSHfQWz2eBf9mSiRG0S+6JF3eVR4yqXBrE7esFh0/K3wh6UnUNBU9Htr0s+abZHCUqGprUYVEp4Wnv9ExS3b5a3E7+d+idVkyCtM9mpHcZbZNsw9Sd/SLfjPgbh33WPCd8L/tUomyQITdMr6K/083Fm/QSG6b4DFUBP31QL5+vMM+m0AMdgJIGUBDYXSdEsBWFkSvcVwx9KHWfEy/4tDFqDhWNFFbf9ANGE7R4JC3yo7j+HWsmQ6J/Ok9PDbPZf5TDX7hR6ROufX1ccHQc6xeQKg4odpGSH6blb/+1eSGM47f+nIwDXdVLwUNTuwcUsU+18O3kdurLkYCkqs+tfKpthOErlKW5XA4t+P7huY4jfANxhhb/xVBCGIyhR5l3iHoZqcW/jArSjgIWZBcTTXTnmP5QDd2CpsBQF6BcR/utgWirAqbyEAUigQmKjN5C49J60gwOBWNPK5RcB/5Lm0ywldoxfpbnr5dxQsEQbHuECB+Ko9gIIyMH715amQwPuxmDypyCQj6AQQrFALZs3ApX72775JoIDccx1+F+KPHLNPW3YamrmfaE0GV0qTJhrNw/xI2WLKJGAlWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(396003)(136003)(346002)(366004)(376002)(1076003)(83380400001)(66946007)(44832011)(2616005)(5660300002)(2906002)(54906003)(38100700002)(6916009)(38350700002)(86362001)(966005)(508600001)(36756003)(6666004)(6486002)(6506007)(4326008)(316002)(8676002)(52116002)(6512007)(66556008)(66476007)(8936002)(26005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8WABCzGmcTYS54dK05opWwdskbm5/zgpMLCUv86YplEHAyeuWJiVCMeZpSM?=
 =?us-ascii?Q?FCeXF6CKLRMoK5xRzd1H6gepPnwVMkN3/tTG7JVk/gzYAp72q7YpE5gvavhe?=
 =?us-ascii?Q?KlHzWGjpXnZHEGCLD4TSICHrpzulfywYUUTNfUHoLz7Yct07vIPSfEQVZ+jf?=
 =?us-ascii?Q?pYbATw6tInPrxdfp7O4iUZI6yfGjNPFUwBvYQ6M/zvrUTMRmQCB3JHpVWa5V?=
 =?us-ascii?Q?t3F1a3+X9ABWG0air38M0I1IZSeFCg+pB/Tjbe8d6bFM0Pr59vPkfXp9yKS4?=
 =?us-ascii?Q?Gq/5OmuMYb+BTJdhC/Kp3Nvu28FtNZyHpvei+8kGDL2zMfGrCVFkNdXhPnOC?=
 =?us-ascii?Q?yoFm2VGlsy79hNN/Z55Q1GniFFBN+1OFGpjB09As+jYq1zYGalTcrAoLQqgv?=
 =?us-ascii?Q?THBaJY5kTp53Aykj+n1mTEiMzRLL+b+h/tEL+xAg+qsNiw7yyJp/t9qtO24K?=
 =?us-ascii?Q?JJ1dxc6+PFOU2wNcV1IaIcl7jZSIr8WglUE5d/0qZ1Ks5OqCEgpKfcggPPIj?=
 =?us-ascii?Q?dZBWEWchGiuYOw4ZGo8UCkefrLGa/f0Dr9+mbqxVY5FbqY/6ieqEq9Xa2lZa?=
 =?us-ascii?Q?2sp+m3oR3qoLGCmi5Iz6o8eE/35c58l93WHwV871UTJu/G/Wqr0Y1ElT3kXD?=
 =?us-ascii?Q?6yjIMzMAHEsYXA19s5Nhe80J9W0GGzh2qZPEgpcX3zfKHeBdHpZP9ejDj2db?=
 =?us-ascii?Q?zw4ZNL/PVLceLR4OfBFNvxLPQxGwWsbkhoCRE7wfO74egRkov/T1xvrdJPEF?=
 =?us-ascii?Q?ZUutxss16gL+r7O8rvwTEmf1d36dCmxSY7iv/aALI0lw7XykCQtq4dHHvO+t?=
 =?us-ascii?Q?gWSuSQwu0RNZzYACJmC8bzyBzLMn5bo0xl+lLTGV6tSlCe5IHkGX9UQmiArX?=
 =?us-ascii?Q?xQAmS5I7dmlCmzfmxL44aJmECwcBEG6fRzsnr6Vw69UfTJHaSrlBgXMv0Mrc?=
 =?us-ascii?Q?vxLLKtiTxGUzWe3dyrQ0YVuCI0qHHm69nA+cA0OLE1CLzuo98nl3zaw4gEMY?=
 =?us-ascii?Q?KVxOzitr1ZEeW1OiAbcT6Oa6L2yNV89YRgIMHvuicHhUK8y9t086zvWhksxy?=
 =?us-ascii?Q?w653NANcsLE18KpdOe8iv1IbTWAuY0IW6U6ml4SxPhdWUyo2w2hkv3XW0x0m?=
 =?us-ascii?Q?BtSQECy1jn2JyIsS59td33FPuoogpZqwE2HRmV+4i6AgJw4rcxrNy24Sw6vW?=
 =?us-ascii?Q?sRgq0AtHqkRY5mqv2MfyfwirQe+qIMuD3Vaj6nul7y6ePpj6FVbxPNBd31KK?=
 =?us-ascii?Q?3ENbz3yyw6AxAwbudsVu1Au/+B/jzOqGa6JnweTAM2oWljXKf3M09kkfxGqK?=
 =?us-ascii?Q?BEb6mhMOclLFNbuuEJUhRavK60S83zIOOFX4b1wekd0hUV+Ly2vAB0PueXwJ?=
 =?us-ascii?Q?jnkO8FTDgntrUejaiGABicvpheNimzVGEdUJB1NAkynjkE1iz6Q+jlBmHoAo?=
 =?us-ascii?Q?TUL5PWMKwFn9iX9MAJYFqcjc9oAckZPRwYOdPs6r2k3f1uJm8oNxduk3wWDa?=
 =?us-ascii?Q?kewCfAut16VmuxT9sLkC/4GlDd8IfmQvLmZNeNpQEfIT/19kWsF0HpS3ra8D?=
 =?us-ascii?Q?4X3AFlkHnx0hfIJWDB/ST9RpHrMe5vRLomdOFPeLcXpJeTqxxZNXqhu/Jrt2?=
 =?us-ascii?Q?PC4wg+pIhF8Xko+5u63oVb6BBF1h75AR3amEhpuQfFi6KTwKMK1ZZySMpMfZ?=
 =?us-ascii?Q?3PRKkL3oSR3UYclGRQFoYT5GJkDNb7zrhIRziEtHokk0QwzMtqtglTORl1zE?=
 =?us-ascii?Q?veWD1Vkw6Y/a5UQuBN64/lSb95YZj3c=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5037a3-0d28-4409-258f-08da2843adf7
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:47:17.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4X7X2X8jObweukdn0lfx7n9nR3nqiIqsNqdRIfa7Mx1D4UCtoiUpN1SbfQ5XXqtdZDPuQij+E4S39PYnLuzZAhVbCtIGtr0MoNua6xBw448=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1502
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Robert Beckett <bob.beckett@collabora.com>

Add bindings for the wave5 chips&media codec driver

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../bindings/staging/media/cnm,wave.yaml      | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml

diff --git a/Documentation/devicetree/bindings/staging/media/cnm,wave.yaml b/Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
new file mode 100644
index 000000000000..e18978cbba16
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/staging/media/cnm,wave.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave 5 Series multi-standard codec IP
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Robert Beckett <bob.beckett@collabora.com>
+  - Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+
+description: |-
+  The Chips&Media WAVE codec IP is a multi format video encoder/decoder
+
+properties:
+  compatible:
+    anyOf:
+      - items:
+        - enum:
+            - cnm,cm511-vpu
+            - cnm,cm517-vpu
+            - cnm,cm521-vpu
+            - cnm,cm521c-vpu
+            - cnm,cm521c-dual-vpu
+            - cnm,cm521e1-vpu
+            - cnm,cm537-vpu
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the SRAM device node
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    vpu: video-codec@12345678 {
+        compatible = "cnm,cm521-vpu";
+        reg = <0x12345678 0x1000>;
+        interrupts = <42>;
+        clocks = <&clks 42>;
+        clock-names = "vcodec";
+        sram = <&sram>;
+    };
+
-- 
2.30.2

