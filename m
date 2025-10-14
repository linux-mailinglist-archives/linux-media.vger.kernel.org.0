Return-Path: <linux-media+bounces-44446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36099BDAB9D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94905404DE5
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BA3304BDF;
	Tue, 14 Oct 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UCvJAjcd"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE592FC007;
	Tue, 14 Oct 2025 17:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760461277; cv=fail; b=KOQwXi8hj5W6im2Er9pTirJ0h8QYhWl4WDtmLNKqqUQeyJAhm4kMc0TtWkLd8Aty4fuzXLewq6oHxn1eETHNwpBBpDbxUGJvncXuYNWOz1e76Vq4v8mQsbr2sbthWLhOp7VHmyulhejrraNSXQ2NM7mLNV3ExTZ0AZwsKRy9gXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760461277; c=relaxed/simple;
	bh=/g67zDn/4BFccdEhyji5f7IOCHjE9MIj/wq7QJznTG4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jcoy6ku8xzM1r36T/8cNNBgYtvV1v4LsF8lg24sJmIZ+Am3mAA5h19yZjWp25c4v3ZBPXlxb2k9OMPiByR6Ph1ZBLno3+SfRzNB9BfNyqVCv6RVp2JVn55cFQ87hLgRwBTcUm61W2lpikMLEZeMeCA8nlacgAKqCZyzfLb6Gqmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UCvJAjcd; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MC2ej5tnIrHJVFBHpbfOk0a4mHccf1r8GleKgh39RLqAzW3d3Xoo86CgUG+ca1Rl58JQ7uV5YtYELaJlJxHADnGLQBKGxSviEuplB9FJS27L1ZKZh2NgbrJKWy0VRSxTFUZVne+Tv9ArzeGNjeaR7D/3yTEm4GmJb8zQvPvrcrft0xzJV56vPX6SzWloy3C/hIlKCPHWiVxwcf7onJwqME8n2Pg1JgPFEtSfEOjXDyVSQSlr1UWZMjq9lzNpKsmVIu/F6KK2VQ/GRBJ/5y6D37ns4OWfTHZX/CjQ/HARSF98cdqK4cZh3vRPTVW2BUyCsv8Ine0bJRcToouqxJUWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf6bJzO9rc1pXvoaFYYXOanlW21iXJYy5tVTKg+w2y4=;
 b=NBJMlWatkFcxKozN/OZ2J+xpYerDSoFB5KJVxfa4w4l9vHQ6saFoyJypbvnWIsTPM0waeVOIdM+rWq7TH79OL9EifkAJlkGae95rkQx1NaudW4baYF36vGT+yW1VlxyzF+XC8QudVGPSKwMEKjUAYc7tb1t7m/EbW7uoAGqdueluDbdK5JdUVDLygXDFAOV4liJ2S519LWvJLlYPHRLMLuKTGCoNQMw2pqhJcA7/EzlfYaTTvnnOu+7PQ4fi6VAre8oHe+WFrQQGGEvP5nPMUSf4s+T65My7xxAz58lZpDR2CmSLKXzgs4GK1QBWoxylFOplEtuZAgOFCOMaJ8CyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf6bJzO9rc1pXvoaFYYXOanlW21iXJYy5tVTKg+w2y4=;
 b=UCvJAjcdf4WWeYrOovEwnR9nVbKIDCF4QmATe7k/aQP0mTaGIoHtpfrbsTR+Lk+g3IYqmS+GH9rGE5tk38+3VxrGwQwSRSI0AvZzFo5nNGf1z1OBXCcuN+QZLCVpERdWf8DXS1RZJbJEaI7YM3vDkPxAvkcu1QTLdpUz+7lved2zestSjpcGvAfIP6dGQUCdobChqcQ5x5GXOP/3kXxqrlvGa2hBRKRC4zOivO6HjraU/TpFjaWpUgKNUb5IQw3g7gPVPJ4CArfqFP4FwJ61SKKh0V/BypcBCwVqsK9kSQhcQzkNqtGflXdHQjBtuFx6oj0LpeoqvJwjpo5jp11mFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 17:01:09 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 17:01:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] media: dt-bindings: video-interfaces: add video-interfaces.h information
Date: Tue, 14 Oct 2025 13:00:43 -0400
Message-Id: <20251014170043.2341146-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::44) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3dcd9e-8ad4-4148-74c3-08de0b43457a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0zmDWt8WNWTaVSngGSH8FsI+8UCXflax16NQXRYeUeLWt6j2Bc4HoRBqX93N?=
 =?us-ascii?Q?gvC1QPMINyO0VHN3I9ZBqcGbVCpROfEWonzS5H39NRgZAs4wMygqoWsXZymy?=
 =?us-ascii?Q?N0EGBtwAJoecj+G5/tho0bjACBA1wlYQznOUm4fczEgSbk/J4S1I5TBq1otD?=
 =?us-ascii?Q?A8vfNknZ1D/h9lNX4+FauDc3a5egQK52XD76wq6RZQT6Ij38vprssxfPjW6H?=
 =?us-ascii?Q?edDHg/PGt820pgDIzBmjMLsK0yNZoqhRTPcdSsLgLiKQO8V7fzZSMbP4z+4W?=
 =?us-ascii?Q?7GvdggqNapK/GMJdLo/wAgAwBmZYM6WSGaCCZSTzG8+f9MijpGkc/B9US0Rx?=
 =?us-ascii?Q?H92GMnB49OwzzRotMAMFF+kHqb5dVv0eEWXDg2yBqCrVYDYyZCAzyDvVpL5A?=
 =?us-ascii?Q?BI2w3wza5V7/gxxOxEFciypEO7gZUiVWJ2Rhk96kwEV/xIwKcPt8I1O4VsMF?=
 =?us-ascii?Q?sf8NjhOStXwVx/Ci8UPx7U325Y0PJaAu9+ZNd63D6ki0I+bHv/hCQClIJeY6?=
 =?us-ascii?Q?YgCIiQlV5fPnRx7Ho5SUeLye+YYg5hpAZZxH89HvlemwYj/159csaU06WJzN?=
 =?us-ascii?Q?GGznYtm5Q28q9rXQ4NOUfDeZX8M66nTz4e3TnDQZ4HjaGawafotntk7G/6Y9?=
 =?us-ascii?Q?ICiSDrbMvvr0yukKbq2cig+OpFUYkhCeUR5Yav4dTlVITzH4Ku1Z5z7P+Nrh?=
 =?us-ascii?Q?Z7cnHnfSgH5TMduoIOph4usq5yA0pCii6+gtk8XBtbZZtqyyb2i17U9M2Ern?=
 =?us-ascii?Q?sHOGGSOhbpVjfjjY7VS5FQS/aoAtpe2mL+tVlRtTx8Qgx4MuigPHT8QUJRrF?=
 =?us-ascii?Q?dEU+sJVb4m5lo6D9Ugjbw1IJ1cvDcOYTbvWU3rsliayRExLh8Cw2qBHtn7PS?=
 =?us-ascii?Q?sUxRk3j1VXSj78ZSRC//f1sstPsP5Ay7rIIBKaUbl6SZhNeT/LfHct5nb0EF?=
 =?us-ascii?Q?Ngv0+RSNfLjFDuwEv+szyCuTwP3ynsLl4aaGPcpiFBSwPTcUi21Q4m7dQYJJ?=
 =?us-ascii?Q?RtlRjGI1/SOiL5vjMHfpXFaYADDQFhwQ7eIPDXv5Vzj6J8392RCXB3Lu4cvH?=
 =?us-ascii?Q?TI2+i/eb35YYErnsR0JcQ8TRGCUD8gci0i2rk6Y5JvgxTXmPb7XBWOOTvs4Q?=
 =?us-ascii?Q?8GLr1DpVhKIbLpHAsbEZuuSWzs0OHIjR8A0k3UKMXC7iea7GzJncgCGbH3FB?=
 =?us-ascii?Q?Z7+H98Q8Y3ndFchtqUVqzuwwBEnW2g1b7J9Gefpt/tTMM1z7rR4GkoZAzow4?=
 =?us-ascii?Q?6zcg03qgN7NTG5v5edi4t6+xJ2A3J56mPe2Nr52fwObgaQTGX1ccfwyQmWM1?=
 =?us-ascii?Q?qLDl/eNXeNINHYqNO54B/wR4nAp78jEzskMIiN7CopKy2xFrr8e99WFEDv6n?=
 =?us-ascii?Q?pDoguibpO5QC8z39C7Li7KVIqMfs98X5JD0lGkoJRSBghagt8rCrL26cF5sy?=
 =?us-ascii?Q?mYjEj7Valn7hdsWPLm65jW5w0ahz5odhPdT7EJxJbgoufGvXRy1yhAJNXWP7?=
 =?us-ascii?Q?aFoTyYg6Y3Cxld+iQeWPu2betbDNjyxMmI09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VlK2PSbEUxpqu/azxPnF0gsrlaFhQkEg3ot59bzMwedFwUmePBPMhZ2za9ge?=
 =?us-ascii?Q?UgeMv1hNW6cI5efpozwZR6h3NluQIo8GsJyNShTMj/LVSZEvqQ8uAmHHLzn2?=
 =?us-ascii?Q?uujZdaeMm2tbbxK/0+di5zVPGuANc1VFSKCZwb+7zymgs/DwEToiaZxr8LiC?=
 =?us-ascii?Q?Z8jsCUCRtf/SQAS+09VtS2OO+l4xg/LttsSDdAPe0j+vwgbwfTRj/XI4QjQD?=
 =?us-ascii?Q?q+GyV5/sXozUkoWzGLqBJeA7ounSzHUySHQdW8bP9Hm9WRj+B14GdQQsNb/c?=
 =?us-ascii?Q?KCUn1LxPHu3hor5GsiySUoBiZ+MvFv+Btzs2rhqzFDrAlicyjEz9duCb5DNK?=
 =?us-ascii?Q?3zIkShxGeMrbiKxv++HDIdfyArydD5mYOcs1wzpq1fer8lXvdk1NawcTqvhM?=
 =?us-ascii?Q?xpanKexcxYGlVjAtMOhKyDvvPuJkvl1p7YnoW3Tqb8fVES68ICJ0KnNNtFiC?=
 =?us-ascii?Q?3jxRrm/+OUUfDicuSbAcaozBZNck5XZky9jT+SZRy47J5JFDGdWMN0qDQ7CC?=
 =?us-ascii?Q?8kCf8xSJJIXdg90fQNtKuxwXZghXfiXfD/wnwk4x2Oh64azb5sVoRdIJWPoH?=
 =?us-ascii?Q?WDBBqTyeEpHQuIWji+90q82u783OpLkg9cctsOUI1643JH9FXc2K/G8QtLKM?=
 =?us-ascii?Q?7sBOO1yPp7Zo+q3u8BOOFUpmnUTeKV0hKeallpjQLUmWPty/cBhdxHAB3N+H?=
 =?us-ascii?Q?NB32nHa0mMIconr+6PSeQHXz4z8oNEfu+TdJQCpgYCm8K6zkMqC1kYB9eHjA?=
 =?us-ascii?Q?Q6YbZaGvwaQUWFr1t7u3aYvFGaz7XBlJts7c2fKgfiYeQhJePOJrGBUsUN6J?=
 =?us-ascii?Q?99OV0W9Fz7rdTtB5OTsDNRNA9UkiRuAuOnF8fppsD6QcmhNFOqgvF9TVPIfE?=
 =?us-ascii?Q?Owh4e6dibGlwwyew+dK5lHCl4qORoW8s2LV+AgJ4KX54ZpCElexUvKpyOEsX?=
 =?us-ascii?Q?tmzEbIKxYPW24rWZw4HlzuMBoR85L5oIJP4C3qFaVOsKad3gXqoi9hpccqnl?=
 =?us-ascii?Q?qRAErIdv4v37yOa4VzGUKeLFZUIvp7Wojtqncck9ZIQrioif5DvT66cd5lyg?=
 =?us-ascii?Q?VZDBhNPX6F0cgfZUPeYJ9xc/TwUSfvc11KID8YJktIvj2f77EzPW/b6SnEUM?=
 =?us-ascii?Q?Jt0W3Kkf4157oG8a24AtgLE9nWfmQlQZcbOWuUY1KKQR/X9MnvtsGw6hnueQ?=
 =?us-ascii?Q?unkDklMbMDMs/KChw8AsqZZHzOpqyWLTlAPEyr1GHrTFMlspAnvxmDHJueRL?=
 =?us-ascii?Q?ExQQjuzcj8s0olm3srIdtdFkLarCzMHzM3sazXO83WwdRXFtGZmx5/BTjF+0?=
 =?us-ascii?Q?bi31uH7bKMPdxExNuz8XeTFYgsdqBciWd+25V54DBJvtJHbr6v+EvZ6pLkw1?=
 =?us-ascii?Q?KfpSuI39Kyhnl4GyFDk9DPCu0YfcEkicTgNQ9nMk2qx7hV4kG+c9n01aeS+u?=
 =?us-ascii?Q?1iQnc9TJEmnMlcOpmQ8wqL5jPhZUla3AXIA+h8iDkVttQOoH0XR4+wUMnFN1?=
 =?us-ascii?Q?YGOO5oJF2qtesSVA1xJm8diHSM0fiu03BpHbDmHsztx2ld7/H3HnSqfUkMFx?=
 =?us-ascii?Q?PfvndK6SqSOZQObDyNAm4vHYXw0DIEctWMonjK+z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3dcd9e-8ad4-4148-74c3-08de0b43457a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:01:09.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JVmaZU8B1uMChWoG4rRRkv3llsdlQ4Jg0dqmwaxFs/1/5cDKkY72VLhOGHWJAT59e2NZkbV4rrVo8LyxOKyEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

Add dt-bindings/media/video-interfaces.h informations to help avoid use
hardcode in dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/media/video-interfaces.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 038e85b45befa..f96cc0e403ddd 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -95,7 +95,7 @@ properties:
       - 6 # BT.656
       - 7 # DPI
     description:
-      Data bus type.
+      Data bus type. See dt-bindings/media/video-interfaces.h.
 
   bus-width:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -229,7 +229,7 @@ properties:
       Imaging. The length of the array must be the same length as the
       data-lanes property. If the line-orders property is omitted, the value
       shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
-      busses only.
+      busses only. See dt-bindings/media/video-interfaces.h.
 
   strobe:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.34.1


