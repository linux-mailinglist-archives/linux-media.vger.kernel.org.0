Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26A273CF2C
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjFYIFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjFYIFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:05:17 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547A8E53;
        Sun, 25 Jun 2023 01:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVn/EzexLlnytpKlgEEzTp93WzPuZLlEIJSi7xwKfijxJaldWg3i2aYGm36pImhiVzYlgSsFxYXRvbdLYqj76/6HHF+VvRRcluH6likjZpOabGIAxeRy592NeYrfgbb1UDs9m6a2INE9jIDbuGIU9Kl4NJGFgr30MM3QOZoIEnDnTB2J48ssuY+Yu802gLsKEdYXU1J9qG2GRav8/oFb6yszk36Bo6yOVI4SebA2Q/BPg7otxZs/jUH82aOsTYj+YIkyrtsPpCLqKlxcKMpv6mtP9fULjn1IFiniM/prnVgsqi1kbfPpQbJ9+gVdoc6VYyoAcpUYSI5HH0cdCd6xvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMkm6zlKqQFhJJE/JPuF0MkUqtMfAIMEvMk+UcwJa5c=;
 b=i9nVvQ7/SST9C2fbwqt9wbA9FiGDyCA0X77DgmfBDtclnuPf7Hh1mNF0A0MDuAL5vHWK0mCOFNsj5SgTthjONU/46BE5jPubpBwcU+4oIReMUj7RpL8ohPsJcfQeYGYvFY0Buw4lq24l/LVaj9ruogd+KmyCgPioPiEWWAt1nzmnHrrpIDls43GbBHrcGdj6QONgKct4oPoHbiPmq+fZDCvuRDx084saUpkCfD61d38qkQUwHKPuuDlnoDJl2qiXozs6bRLZqgGUVUzW5FnFglQuR8hMMoXCOiiPTrB2wcJIz7N8LGboshxGUZuEMniRlMaf2igcvh8qSbOV2iumwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMkm6zlKqQFhJJE/JPuF0MkUqtMfAIMEvMk+UcwJa5c=;
 b=A+CFutBJYvOTFmioGUPpxWjMI4/lm+v0yCP9qGjpGRW3rK1ORKnbjpZlHMqPDfEBiIE4hmPsl5sXZGenmgqL2S89pxJVn4b0HK2lzSmsFSYf6V8Ccoe3Lu0rVvrHQQyFV6cUBKeLv6Qbhi8ogcQold2+Jgo8iUgslgJUc66dsmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9279.eurprd04.prod.outlook.com (2603:10a6:102:2b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:05:13 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:05:13 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH 1/4] media: dt-bindings: media: rename nxp,imx8-isi.yaml to nxp,imx-isi.yaml
Date:   Sun, 25 Jun 2023 16:09:13 +0800
Message-Id: <20230625080916.3553621-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3d7acd-ae86-40c8-6faf-08db7552e75e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VZoN8difunHiHpMKdl/h5FT802Sz2UJxtETevBr4ERSy6UUdELwuThfNQMh7/QV+8DNwNM2+F+dX8A4zo6IOO/f2ojoFIxcvfqSXJjpst7slyWPfW+PU82OTDX8fWGvfaPlv+XT7I7tjkerEgai4sO0tJNPoNIvRyetn5hwuxgkJqxSgoGGLdpZjUzdboSw8QQzVCWLke2vqpr0hLGsKaqhPuyw6kgeBXHrB0WHmMzUvprbRi9mK+DXEKXp1Zkqjm8AsOWAltFndrvSod5Bt85LqSYvBqrAyng+y2N20UHY0p6BUEQrsQzu1izXl/T0yXpyxq3SRfT1uHFGG/ErqlQ8ykxNoRR345cztXtPpZLYbGGtx3PZTITS7PO2oX2kwMsY354f2n5SWQSSsNgVD2F13CT4QMiDofBWZHufVf8PDHdqeycifSAFXjNPul7Kb99mqKQ6bBT50VNe7SMSDMEIkDtaGrNSG/KOLVOsjL0PTHa/P7Hj2e8jJbVxbDKR8Fug7wrKgI+mYeAqDBhzpR+m0pJK2KWByM/LYp3Mk5r0xo9SqBNnMXO91zlG0U0d/Ph0WECvKe1X4ews7Z1OQMAmxGAp273qyZj1MiIHjnlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(8676002)(8936002)(66946007)(66556008)(41300700001)(66476007)(316002)(4326008)(6506007)(1076003)(26005)(6512007)(9686003)(186003)(2616005)(478600001)(52116002)(966005)(6486002)(2906002)(5660300002)(7416002)(38100700002)(38350700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jb+02jCNvT/NpiZefohyEtSOVSPClFI0wWwppRIn2QDBByoDSHsVltWm7NXC?=
 =?us-ascii?Q?tWMYTiiqnEdKKFBM0xxLn+WL3AtBT1Cc6lktszVDz4N0a4/Kw9goR9NlX7DE?=
 =?us-ascii?Q?ZaTT6RvtgwXcl79B6eoFzSFYvFzzdWpf8kTgbZj0MAcXtSdj+APoU5ce/48l?=
 =?us-ascii?Q?ZsilhwjCObAcbdpO3n0NtZD+tn4qdTLzgM/OnMexGNtgbpyaaa/Pps3dtrrl?=
 =?us-ascii?Q?dtunX8p7/NbvaAVS5DxeImuO5WIFq9TEc4eLlrL6xalBz023URXa/zLihLCK?=
 =?us-ascii?Q?SM5LY7+UIm+Fs/K4xyJBwjUvPMb8jOD8dDl76eP7LfWRDmy+MpWBohxZ25Sy?=
 =?us-ascii?Q?wxlF4YId9HsS0NBPLiW+R59HfbrrUfZHl+AfjtNLV6d3EVUEqzT0Qg+y8Rqa?=
 =?us-ascii?Q?Vr6lS1g2+lYI3n+m/HTbQA98sIpf/wVKRpxsg6EAaSqL70T8OcU/p1DCwk+U?=
 =?us-ascii?Q?uYHZq8fmIhCC2wSDFbL3b154QdQZFNJjvcaFFkr/VVi5pFVj2npZEwLGl/Zq?=
 =?us-ascii?Q?vvq3he+G8tToY8wMiW8sqyxD+X/zQeS9Y9iuHHDtjZOBIAm+qE6IkILBpryw?=
 =?us-ascii?Q?km/bdW0aprBeSd7ZCW+C09f/VbGwNf9CbkSO3AH/el47A5cUflZXri1o2v06?=
 =?us-ascii?Q?cEl8UCu8i2/ViJFYGFaL8TAlMNCG52XwLtTHny4QfKvDWEPXLekcL4XfvohT?=
 =?us-ascii?Q?L1X6heMmAyvY+mSkgzcMXC+5U4+gtgQOX/EXaLpWsjCT5hMCBiT82iLPCU7w?=
 =?us-ascii?Q?vKW8dPfFNxQZrdFccGcLaKMffIux09ElCILHgayE4lpW50MCpvHTGdkuitXU?=
 =?us-ascii?Q?1TYsbX/zFgisrOgjoKRMN/SY5nQQztHmg8IAlEQ+E3B433nXJnXX5/w98/T8?=
 =?us-ascii?Q?FkNTmu+yiSx9vZoSNI2FrCVdctn5TgaByqhkyff85INxZZyL83A4Cbf9KHu/?=
 =?us-ascii?Q?2ImXmMN7fOSOA6uFcs5D5oqlXsIac0/G9LNxsSLBUfTLlLKohNer0moY9ZHs?=
 =?us-ascii?Q?FHIchBxf69EJvvvxnNqIxgkYJKBcKbiCCzdFnf9t2TXVmKUh66Z27FyH+jC6?=
 =?us-ascii?Q?21dZ2ksSdUhZg9RSpiWoK+4YBWOetSM+Np/3EdfK1hARQc8SRMJRS6hJ53Ui?=
 =?us-ascii?Q?+po6Sb5N7pqBzi75ay/TrhTybXd/S/FxnPRuAMBJWmwrqk0P+OdTELLAlFSt?=
 =?us-ascii?Q?S2svDGZcTlH8aVgXwGcq0FvqXQZ7GzyyUHZaG7ix6QOTuBuhLD7Dj7Opt3IF?=
 =?us-ascii?Q?TTOCpjf1+mlFtR8vg7zqqp1gSuF6mnZfyKiSFfw2t2vvWBcBIE3KIEi757pz?=
 =?us-ascii?Q?x0j9rBZhLRoEj/gTAxTa48V2ssrjYtwk+uIcXaIoxfRxjXClMFIl1eDMMTw9?=
 =?us-ascii?Q?riHox4NJ1SHI3XK9H/nAUMPNbKvKscNgns6Q9hrII95jAzDG5pi55nWb+tfR?=
 =?us-ascii?Q?21eK1by98SF6mJjbJ0Oj9BKXplzICv4CCytiZB7CeQsklySxxlYQ1j+u7owS?=
 =?us-ascii?Q?sN6Ti1kStXGlPNFTy90GBRmDN4S3ZZU0SE0Y9d5FjsAOoeHzclb/n33ZXqn4?=
 =?us-ascii?Q?QAWwaUtkLu+/lKjPv5qNDaB0KEnQ4h/GnC19hhv/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3d7acd-ae86-40c8-6faf-08db7552e75e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 08:05:13.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqrPyvBeyG2Nye9+l2rahLj5VZGlBU7lCJ5XvvyL6gV83zRt13uh3EfpRh/w7P2rC3PnVv69jKSeFz3UDHHYUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9279
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Rename nxp,imx8-isi.yaml to nxp,imx-isi.yaml since the binding doc will
also be used in other i.MX SoC, such as i.MX9 serials.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/{nxp,imx8-isi.yaml => nxp,imx-isi.yaml}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
rename to Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
index 6038b9b5ab36..1ce9440bde32 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/nxp,imx8-isi.yaml#
+$id: http://devicetree.org/schemas/media/nxp,imx-isi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX8 Image Sensing Interface
+title: i.MX Image Sensing Interface
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-- 
2.37.1

