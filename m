Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AE6233BC2
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730830AbgG3XCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:15 -0400
Received: from mail-co1nam11olkn2054.outbound.protection.outlook.com ([40.92.18.54]:28769
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730816AbgG3XCL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:02:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZqexn+qsxnTZvPoi94dGvycAVeQHCdVNaiklw39o22HdfDNicBrWt/yv2ldHABgW6QvLutPkUMueinpMLa/IugByZ3qjDg67+y1zXPn1oCfsbvmpZe7OXEfg4WDVRihDQJ9P1dEdhyjjA98EFQzPCSlkor6c+ylcS05wUod/obrETpJEQ88QR6iZhmnp0cOKkzCs0ZUjaOL3rYs85ip1y2pX7JTvnncxB2GwZsOvoDqc0WWVadmOumKFyR2Hyf6L/L/kfLn4pwRoLgEotJEggK7C2BryiNjSSYpudLO2D5pw5vzpiKEOjR6pwe0Bi8P9i3joJ3OW4IAPpc3QRUTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blb2TXRMp+yo/YM80XdL8XrZqtDJRYtixFtmZKoQWno=;
 b=h7dLPy20zV1fjbu2H+2CnNDbnCg120gmtFmXIKmFp4lgMeq7lyjYidnBrBU3fy7qfaC6uqfTK3sOiWVcSqgOuuItD3ObkBkhT8w16Li4u+MdcM5RgPfAjz+26nlScjeg3XNtY8xHzdtS9+fILwZmTtJj44NOL1nc6Rn5av8w97J85CqGahzqh2g1scRPuzBTul3EoComA47vb5psiUxwV+4hsPyqKApHC9Fv1PKPhdnsN1+q2NQFQnBsF1YoAVwDPfo8QLLI45qNdWWmRjaxAdwarjb3iFyt++f8iLPxHeSVA635PmjM+88bMmXt9PGMHmteYXBYsxmH3oS9qhGQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::4b) by
 CO1NAM11HT057.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::185)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:02:09 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:02:09 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6596A80B681EE7BBE23592754212134BA198ACEE2B5D7CB2DB0EDE81235FC83E;UpperCasedChecksum:8F19E0DF905CC33C86E76E53392147AEA5680F956105E879707AC12DB6A82CD8;SizeAsReceived:7885;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:02:09 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 11/11] dt-bindings: media: Correct samsung-fimc parallel port numbering
Date:   Thu, 30 Jul 2020 16:01:14 -0700
Message-ID: <BN6PR04MB0660B938349CA15DE7BCC5BBA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-12-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:02:07 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-12-xc-racer2@live.ca>
X-TMN:  [4H0vmUXwVvtd+gYRvieb3VzExRmUgc9uRhumOxiyx0ARjfgIV6+/lmymWIVI9+Vv]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 45929ec7-0b00-434f-37d4-08d834dc965c
X-MS-TrafficTypeDiagnostic: CO1NAM11HT057:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHfC/ydrQF3oRUjURQOQUSYTv8k/BcbcG3az97rWdstQGzWd4TiaodOb62ErBBCX9j0r/Hiuy0HAv+ZGkKQp4v7bzqYZSxYalIybvs8oWhvNzkPIagSPqEtDuVVfc0FJkj5orWe41j5bL8j/FPPKJW8I/s2+Hem+VJvd1ER8QgmIxHWySdz1AFz0FJ+rUcfyNg1aJueKnCuhHbCo50/MYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: Va8N7+GzrxSlCkFTcwGLUGCRaLywNzTlCqvgKzbSLG+LTKbyNP2FD5J7a5h2VEqNEsBlRZgOapGUEQETypC2IZreOWegXPTecPQUk6Jn4oAoMpsfgRGM2StW1zuKtFEs5hyOAiUUhY7YcaiOz07H2U/gYnGuSCqc7CaiKM+hpc0HgwyQ8u2M2mVVW/CZO+wk47wt1OQOferptIF7hevFOw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45929ec7-0b00-434f-37d4-08d834dc965c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:02:09.6779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT057
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The parallel port nodes should be numbered 1 and 2, not 0 and 1
for A and B respectively.  The driver has always implemented 1
and 2 and the in-tree Goni DTS uses 1 as port A as well.  Update
the documentation to match this behaviour.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
Changes from v1:
- New patch replacing patch modifying driver to match documentation
---
 Documentation/devicetree/bindings/media/samsung-fimc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index f91b9dc80eb3..20447529c985 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -95,7 +95,7 @@ Optional properties:
 
 This node should contain child 'port' nodes specifying active parallel video
 input ports. It includes camera A and camera B inputs. 'reg' property in the
-port nodes specifies data input - 0, 1 indicates input A, B respectively.
+port nodes specifies data input - 1, 2 indicates input A, B respectively.
 
 Optional properties
 
@@ -172,8 +172,8 @@ Example:
 		/* parallel camera ports */
 		parallel-ports {
 			/* camera A input */
-			port@0 {
-				reg = <0>;
+			port@1 {
+				reg = <1>;
 				fimc0_ep: endpoint {
 					remote-endpoint = <&s5k6aa_ep>;
 					bus-width = <8>;
-- 
2.20.1

