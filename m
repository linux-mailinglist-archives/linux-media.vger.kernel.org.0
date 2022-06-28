Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641F955DFBC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345395AbiF1LIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 07:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345392AbiF1LIk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 07:08:40 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2100.outbound.protection.outlook.com [40.107.129.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E123D29C81
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8/UxmR4gQWVPxz80ezt2XBzEyKFhY1zHhOlgQsxNDn647oXk7P1G7YSAZPV2loTYFi2+WVEUAxTEdOkDwklRP8ilfLDUBhQJD2OWPi+43R7CLkm1+LXpySFnNxpigjHJD05+5RhYwUpRciV9TAuHJDWJOQ64AsGam0WW5jSBUnp37QLHXPl5MVEHFWsFgG9iPAYzJcU0Jd6StWQak6apdvpN11BFAXt9/ftMoSbKdu/RfTy7MNupGHQkEm5xJvXFNdIWWIRQdMK8Q9lr0rmCsgCpFBeDYdCSDxaHsT1gjLEfD5UNHQ6i4lUQlAx+Mx5r/iQ6M/vvEYErFtCiWXYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgLa6NPuLOVp2A6Nuu0le+wowvjyfwV0pZN9jvbxYp4=;
 b=C9Oj4AqO+U0+rVHubWY2x7Xn8pX7LxroSMMqv62XcAXybWYukAZoMPtWrl15uOzXwTT0gKXGs0z2Di4sSFq0TJLrDvCq7FNivVCHQhR07dAEqoQQEZ7hK1hdfqpo84JidOyiPv5TQjzKtfVnDtXtDe8xVs9mn3WriBVHg4L9t0Fkg7IE4jhlg2iE9p7MAnF6X6C8jyeU6MY0+WT77Gu6WLnrjVpVLMw2DNSKvt125k3Sx2hFIdc0ctgGa6ARJBA2oTkOmb0f+XVPiNb3uCrHBF6rYxRi11EDH4M3K6z0z8e6qPmK2si/MjM1wdp6Z9Mna8YQNdkg5igQ9M4CUd1jcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgLa6NPuLOVp2A6Nuu0le+wowvjyfwV0pZN9jvbxYp4=;
 b=WKXaHVHW4/l/tGC3FyOSC/OThArFvTat3d5HwC697AlxvdW64+zlLL40Yi6dnOn6WMYMmb5UkNbhvPF8lO51+ujdEOdMpCBfjyFUglrQ9/BTNfmTj0sx301g+006CUN+tDMk2XUdX2Gh1bTrvjolZIjo6y5m1BQ9zNqq+BJsOLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0386.KORP216.PROD.OUTLOOK.COM (2603:1096:300:28::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Tue, 28 Jun 2022 11:08:38 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 11:08:38 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-staging@lists.linux.dev,
        mchehab@kernel.org, Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v9 5/6] dt-bindings: media: staging: wave5: add yaml devicetree bindings
Date:   Tue, 28 Jun 2022 20:08:20 +0900
Message-Id: <20220628110821.716-6-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628110821.716-1-nas.chung@chipsnmedia.com>
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0222.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6052f117-947e-4f17-90e6-08da58f68d3f
X-MS-TrafficTypeDiagnostic: PS2P216MB0386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GMSn6qKWUnods43RpMXeo8FreVNw7A6I4GptVI47IIrkZBZcp/4MJOH49WgnfGY9KNv6SmZor5bveLi2xehEaupFQItntj7ynFXXtQ2mWiRQT1tRZOrcMrhQHhqkdj4remRhVoIN+ycr6kE2o8dDNbvyqbh/v0JmEyfksvnpYxFViqmFPEIbTPT3wn4gBeupQQvZXMg3hK3LlC3FqYLPr4dLKmvopG9zzTnEJmkNgv8CsoU0S9BrFxu6F5XHgNJhKKmAla2aliEKfR5R/dFPJKz5KL0yxR20WrrLxG8Fts+/mc9whbDy+PoHnm2tz4oc4kKGPyWrI9QQ+gmM84vXbO1vISSkrp+BD9tSOQ4eT+qGjiAAVpWc2uINKZj0W/bsDexWmQ03noqWvpIf6bJdRexIc7bOqv98JIL3t3vWF6p6m4YOWPkUUBtSI+ZUiAqb4WnN8aHtpl0KdnM/3E05ObU3jGfnA1YW7qCLWGDjkoKGDhq0cOMR+rnF0ZM105laLvVgzc7HlrHhHFZNyvKRrpNOM7Vje2NjSfmdnFzNHOjpehEGxRR9PHIuuYFnBlNTGb3GKRgaHtv7o2mQTQZbZSH1LUllZw3mg5iqvHXPIUFk1NuXETBJJPJ9HMxJERcgk73cIrfhZYQi0r/tBOcy178Vbq2nqDieSU0nKqn4x50X5mqXo2jRjYPyzsgKW+so4Ufys5TAMB0QFjFQb7cqbuMUKdmKP3fLNVuBKAbrC007pw2aR2eMK8DCQEOXU8Sh5QD2rd+T1UFhpEDo9J4loEV8xVzAnwMF10m1CAsDTf13WO255/PCu/DyFF3PzMuGdKoSm4swzKhtWWSl9q4gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(346002)(396003)(376002)(136003)(1076003)(66476007)(66556008)(4326008)(8676002)(6486002)(2616005)(966005)(66946007)(8936002)(6916009)(52116002)(6512007)(6506007)(186003)(6666004)(83380400001)(478600001)(54906003)(41300700001)(26005)(38100700002)(2906002)(86362001)(44832011)(5660300002)(36756003)(316002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1OKoLr03wZtSZz5HhkuB+eZ8LHSdpZ4sVX4uQ8/qne5VQAF4pmhy/u1wDdMw?=
 =?us-ascii?Q?ObqnZznXRzbS2Rk3ozeLW8ebd4mpP9axPYBuQkO1dXZIG9cWOOM5K/4keC5w?=
 =?us-ascii?Q?lNeqFVvXISwiZk3UvssFBl2EGxDXTXZpe+71XRM6t29k0TBMGtIdv1+e9ajH?=
 =?us-ascii?Q?PCebJxhWStfkEcpv5r0ywQRbYnat1bZil9ZMvkSwMjfzlPsnrglTbNXkcqDp?=
 =?us-ascii?Q?Tg9wrwN+Egezojr7vR788tO9MZCU1kFJp2K0Dx2s+Qqa7U/B3o/I6opm078q?=
 =?us-ascii?Q?XaayR0KSHYOpsV8aUMmMx0dK1T+mfjb6YYagv/korIjL7sWcz5H42baNy+k/?=
 =?us-ascii?Q?aaPTBJ1a9XBc27e+9dqBJhMyg7MBwuftOQx43zwSCZ9D6Z3xBH3DiJ3Q0pZ3?=
 =?us-ascii?Q?FAd/mV40uQQpOMI31bwut/UF5rjsF1ehTfMIIKhHA4byDUesAaRcnwMvag9S?=
 =?us-ascii?Q?UAYPQ29wWIKUrzKXZYmTfrFgRywWwY1l94iHVn27t8/VmsIvx4G6YC0Uvt+u?=
 =?us-ascii?Q?ez15EBzRb00+2gW84C8IAkYdITwF77h2VfMBGDmklY76RRiV690Jd+8BEtSC?=
 =?us-ascii?Q?sBDGyiJmQ/itkkMdOk/G7CeTcg6WB+s4WlJNvaPYJuF5u932hcggokAgiYm7?=
 =?us-ascii?Q?WT/lYc69dhDAR5gnrj5dkQDqgk9MSDl/ZrJUUjmvQypk3wexOn1N3xtUTb9A?=
 =?us-ascii?Q?u/sGlucTlFHGRUBNvU+w+A2XDLRsGogB6IHr/gm3L1PaL6LW19IO2CQFWxLr?=
 =?us-ascii?Q?nJNEnFtD0GGHQiM1k9WbFlUs1aBvjFaH6VhB5T4Vcr1YfiYObNaNqmnIIXEy?=
 =?us-ascii?Q?jkm5ei3IswJkXhW0aevvvBdCmNlWP6bum31x0pBt2fIqH8CimdHFfXTqLUx6?=
 =?us-ascii?Q?daNI78e/gLgAIUZf0daE7CWKc56Uy2trb+bmyff3OXsKFZDOe8sqqR5iuLtH?=
 =?us-ascii?Q?dbQ5Uc9MQ+NRxdRh4A6XJOBWiYsjym+Jv5urnLrqzPAJC0UBLxwT+dCyCv5F?=
 =?us-ascii?Q?dkCp9Jxe4Na0psa93uxBBm6LRUcSLqGdlwVvOdorkWuocZFyhw4YvnVUhl43?=
 =?us-ascii?Q?E8kf092vYcBydAs8ZUVZnf2fuzwdNOQG2tZhM3imjKQBCdol1V1nE7OO05ZM?=
 =?us-ascii?Q?b3y5cfCd0/RoIevjL8sgWk1zyrrNu2nknPrz88r6Jph44MaAwvHaRM7xyPLG?=
 =?us-ascii?Q?bLzmVSoKHzXIculs3kFpBPHZcrY3xGBkNs4C4OkSFP+qbK0yO6JCdEGyohPe?=
 =?us-ascii?Q?+b7ia1pw9LbMrTZ2wmFkRZaJFkYOefE9G3SRH2nIcU9RnfVhinuv6eopHvPf?=
 =?us-ascii?Q?jMYsaefjyvbOpbpKCPsVSrIrGv78x0+tXDEa1gRUqR3GrvOtgk1pguzTypD+?=
 =?us-ascii?Q?EVpjt9H3KRBBXZDhXBozzEWTjyBOfG7z1JYG0hTjQXC01REb7A3nv81idOwK?=
 =?us-ascii?Q?c5k0kiqsNQWIXRnxpYsjL8IuMEQAlrcAyYIZo6WiVqxKktRAQzHOA+gBXe9G?=
 =?us-ascii?Q?M40loPmfGoM/3iQOU0Gw8zKOw5Os+pglLU49wjnn1iHE4O5ci1E29JEkVN23?=
 =?us-ascii?Q?hGEiYX1EFYuHTUn6JuAsGGgdOMdOMliprdKJjZmuRVFCRqsHm129tN6c0yGQ?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6052f117-947e-4f17-90e6-08da58f68d3f
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 11:08:38.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXv9T8PxZfy7Ks5SYYqRJ4kPwvCt4cnezSYL+z/q0piNp4pxT2seHuxBg5Dvos3R8vtdAx+jViA551GEksx7Q2vQgTKTd3mYWSTaZPCFcmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0386
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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

