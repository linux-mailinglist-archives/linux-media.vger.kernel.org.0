Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CC927406E
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgIVLIT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:08:19 -0400
Received: from mail-eopbgr140088.outbound.protection.outlook.com ([40.107.14.88]:4262
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726340AbgIVLIS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:08:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrgCdecHuz/YB1we4hH1KbqPu3LZ+w54d/X93ystUKVfkKc941m/WI+Q4o73qIhk2mwbS015EiS4ZQRDB4YIINce3KOvxOY5FqIMda2W+qoa5oa80U67THmOdi6Jm8+pva67X48mD+eZGy4+FqyRHe6Lr4nT2k1msL3f4pt3wsGOwEPMJft2ZuriujcsrfdeNvjV2y12rdauAPZw2294n0OfaIusUGecEf4pbh2vRd5v9ecvafj4iKVjM07iU/zJCKVVt/83EALJPQZm/MtYdgPWiSo7Sk6jxrOCnRoTDIY5t+lyU1yK7WrKpbBuCBcHDxm7+maAPC3XO9hZ8MC81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MybzwfUYHItXM7QgDjO+eYajiadWBOZ3NWJhGuKGCas=;
 b=h8Mp95Q3kqKV0nQGs/QGe8lyivb4mC0dQ92csj/chrHPgtk2ItjG8l+SoxbHg8pE54lPTX1MD3L/Z8vJvq8yDySJ0Z9Td+4qPRJPaUjclOGTFUO+xAnGo0C4CDocc/jpFvcrVOeqG+JVkSJBgbXs9XiXeKTX4UB35rbYmrFzPeuJqcvvk6jPtjp99hYUMgJXYXap5aKAq9dVVR7TcL0GPCbrWpuJW2ryn9oNWhpE9+vVmcOVd+5aCUGzPQskAH0WKzUGQTkQ/VX2dAWu6yQQwGW2/8DxCGV8D92ilf9KDZGQszKFl3MW8Ai3xzcoOIu9B+sAesDNgkcdna7Rhh72KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MybzwfUYHItXM7QgDjO+eYajiadWBOZ3NWJhGuKGCas=;
 b=fgUubdydldnK5j9Vst3RZtFi+GckixVQPaztT6lcOrs6HVQYr1xEPj70S3QV1fCWWJ3gopcuyIVDF/lIrnOufRDYLsFkpAhcud1eiI6VMRexz/dn9uCNsaClDyKvjx9Vs5p+AwWYNhOUxeL6SsxWyxgmWWyJJsVevP836meOsRM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB6PR0401MB2327.eurprd04.prod.outlook.com (2603:10a6:4:48::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 11:08:13 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Tue, 22 Sep 2020
 11:08:13 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     mchehab@kernel.org, robh+dt@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH V3 1/2] bindings: media: gpio-ir-receiver: add linux,autosuspend-period property
Date:   Wed, 23 Sep 2020 03:08:06 +0800
Message-Id: <20200922190807.6830-2-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
References: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR01CA0130.apcprd01.prod.exchangelabs.com (2603:1096:4:40::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 11:08:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be8ff996-0618-48f6-d792-08d85ee7cc0e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2327:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2327013513664C936F32200AE63B0@DB6PR0401MB2327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtVJ4rm/U2fiYwTQaTr14u5KCu/VQ19Z2Q84uKUnQP26ygnbKgjcg9vccRrFSeEXF+FjC5xJ3VBxnZj/hMZ15S/H/7lEhR0B9BZtJ6rPhpMH7qWQWEDfGakZXxyL4Zftfd1MO1noGjtjZPyE+5M/vxFd1k1d4CKv7uazrq6PAYM+hXkjIPEQrDTB2xtJnMOo0IDHdls7Muu5zIPDv1nsUDhhsSgrAmq6JUZNzgaFUBzxF/Xs6DWQ5+eRwqy/jhabdSimU08itZO2zEd7Sqmavn1zarqfFdQ2jqJQ8kFOaIZkb4lxwPzQxLA/p4bVKNJDAXSb0lMst40o+o1SsNQXCxGietD3DZ14TL9zVNP+Lls0r2YWiG2N2uGGf/hLp3TD57wF3tZsipyaTVla9QZyLIurLr1/iC7IrC2AftxmHgdbNqL/V/Miou6wpHhN13Larwm2zfqoBkFTQ+gPka3EAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(52116002)(6512007)(5660300002)(69590400008)(26005)(16526019)(186003)(83380400001)(6486002)(86362001)(8676002)(1076003)(4326008)(66946007)(66556008)(66476007)(2906002)(6666004)(6506007)(2616005)(956004)(8936002)(478600001)(36756003)(316002)(142933001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: k1dbG+8x/ySg510dXk//6L4hq87TC0u7ESpaSB1g/mtkWBUhneIddh9461v9IsClEyJi0eSZfd4JeWCGXvx4Nb5qW6w/lYh9/TJ4fwBSab/SdxI9rYTFhHdWVLCifq4wiCeqVJyguLiRPl+YpxFk5Jajm31hHyvWOXAEk2/SNj/2iJ7eerFDYJV42Oj6igCwMTckZA+y51ExXbZc/CSTYoID2m8G/3inZkSei5IBQy/PXCRe3bde2p38nx0XuV7i/5xIJWB9FRou42m9stM/ZsZPsr0ml2odWWB8VY+5an57LCCqamoVn84WpULQEU88XFOdKERD4GRKYtKHj58D9vLgIO7R6BUdYXpLXQYNSxqdkI7eogYtw159jkmJTtyTjkJOqym3/kEroydhgqlgpXHU9+RbKQRDb4LlN+/d4AD303Sp63w4g4YGRAO4e9OUNMZZZ/IE+Dib7iZqC9KQSOjsvp5n2HtJDB2NVPpL/Lcc4Ku9OsDbc4dTLRpr4EoZp2BSqS/NKH/tL4NrPuCf43S2WOUGRBJT+xCZWuX2YtWVNWCJ1w3oQsTshE6KMgVsouXaV34Z//A3xOqwPGFFbyG0N4rrbJl91XmtjZTh4a3DWSzIr3owBMCO8A4SKINMFsimQB86GzcbAy//1OF8Cg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8ff996-0618-48f6-d792-08d85ee7cc0e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 11:08:13.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwuwY6OeW/c/DICvIhUO4eTUf7TrEhDMVLF/LKYxZ4USm6A8SuTi+1Ap4v+YUqoLnvTTlxfev1TXYskhsX8R4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2327
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add linux,autosuspend-period property for gpio ir receiver. Some cpuidle
systems wake from idle may take a bit long time, for such case, need
disable cpuidle temporarily.

Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
ChangeLogs:
V1->V2:
	* New add.
V2->V3:
	* linux,autosuspend-period = 125; -> linux,autosuspend-period = <125>;
---
 Documentation/devicetree/bindings/media/gpio-ir-receiver.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
index 58261fb7b408..e1447c9b0e26 100644
--- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
+++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
@@ -7,6 +7,8 @@ Required properties:
 Optional properties:
 	- linux,rc-map-name: see rc.txt file in the same
 	  directory.
+        - linux,autosuspend-period: autosuspend delay time,
+          the unit is milisecond.
 
 Example node:
 
@@ -14,4 +16,5 @@ Example node:
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 19 1>;
 		linux,rc-map-name = "rc-rc6-mce";
+		linux,autosuspend-period = <125>;
 	};
-- 
2.17.1

