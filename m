Return-Path: <linux-media+bounces-29565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6072A7F2DF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF833B17B2
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 02:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B10222F392;
	Tue,  8 Apr 2025 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rPYnbH5Z"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F878F5E;
	Tue,  8 Apr 2025 02:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081094; cv=fail; b=pnMoL8qVmJ0G2MRhOwgpOTY3KOnA6bbuGBAQkG4rlIa85STNAQtd6G6ldxK1Z6JB+VgOmNI0Mwv1ddgY3OLtUNjKYn8es2oLHZROenFFcAxx6Gcw8LcPSfrZdSKB8HJ6SxU2RA92T4U9zhQJP1VIF89h/rd+/mf49ZlXkMm+fE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081094; c=relaxed/simple;
	bh=6bhS4vAtqTzJ54w0wd9y9QQHIAg744otROWjbrVSDIc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zm84xujG7fZn/4g6cdx1L39h5j5vrx7uQSLVk4tnrJK6f5CSWyRFvr0e2Y7dhUHWcAYAmPDKxTxUiKCqgeIFnxMWqcqkbIBvigI37T+Unlzaqxbr90cr628l/9Pz0n+IichbfSJPsMd8bDMSoSqkc11OMM0l027RK9Q2M6ILjcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rPYnbH5Z; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6Fnlddiiv+TX1Y7s6jO1dUiNw+OrbKQ53q9KYUsreSAMQmp+HmdbWtfs+PHZaTTzZCbZsKzlAB8+8SRHIhwCvO+HttZNuZnyjgW2CNMQ0bunWGNroXkesaBEZAauW1EeAU/GRLfkH4TPJacdTVWmACm80PmOkmi6weMVlsWtxB+e5gfmw6AmY03yPycUq7GVXn0EIzXXDav7sty9mpl4L0C/V4n8E9oxzkyRgYym0tgiHLdRdpNdM/ZPzC/hqTAzpgXEUoNb5d4JifFRBc3ARwYeNQJ+ZKlGtQdixsHVslUrVbplqNGJfdVVGaekuM01QKoIMoDlY5jIC1IdvtL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZu5YBJP+mbe2if3Fan/tOLenCxdIeGCVI20YnmNmSE=;
 b=A9kQQIQwyn2VXNbLVhLdWinZXPb8Mj710UCxmPkOQH1sFDW/Qo7TRbHEvgIO/TPgTtEyNyc3dCijDopf+m2ayi/Mi8JtaGoWGjKgorkGMKrGdSqI6uZ/oYmMKBgGenEu5lC74Be09mOMfvReU03HL4wdacXPLwZNMxuNZ7XKOJ5Q2dYgkcocT5xaUhf5ixccY3y+lIPD49YUxhO8gcs0vzZ6zpk3h5BZGBgEotfkzQtmFcMJbZGJGuh7dAgzz+2tr444sByEF5m31Z0L8J2553l73xKhWug65VKkeJs2OjgLHJnpvqvPBNvALdNLVidYQOAC9IKArYqK+mCFQ62Y1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZu5YBJP+mbe2if3Fan/tOLenCxdIeGCVI20YnmNmSE=;
 b=rPYnbH5Z64/nJ1RC1VMAALP+jiNkNvN3zCiaYJy8M7dRKRgR3jgqB/+B5mA62Twi57kGVwlNsX3HHnR12cnva45Y8SCUnNjBatKtL1lNN5+QAdp0zsoepCpBS92VwfUmEZmvzdQDiCcHBRrFGmXTOF8IpWihhwYIRfIfrrH1HC/Kj986lICPnXgr3gmE1LpFTlwZwoVnMoPGNzS5sLD01g3OiuOzB2AucKFYJ6A0ogi5coZDPX/kKNV9GgXihs20SvcvopPOhifzVHzCN58wRNY4hw+t5dXHRLNaaOp3E0M106jYAbLSBSuJgRQGFQcJfqEGtvjmHJ2BVXG60lR0Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:58:08 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 02:58:08 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] media: imx-jpeg: Fix some motion-jpeg decoding issues
Date: Tue,  8 Apr 2025 10:57:16 +0800
Message-ID: <20250408025725.1244-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: d87f7be5-f766-4597-27d5-08dd764930b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W6QknYCAWL2YhZTBWcTgCb7CejBrDxbAMuUHBUiLcv65JFmc1eaIs7PENq5J?=
 =?us-ascii?Q?C+rZsheLIvNrPyc3aAYX+LcTRnsdnX3r8HHHmQRd6pYCkgBjPAIQ1hO6nMhG?=
 =?us-ascii?Q?8s/XRpLxi1usf8crpB97FZP3U0HxWzDw5dbUJvSsIMSo0WEhAZIQF5MbphoA?=
 =?us-ascii?Q?vT2ougN54LhTDgZtpJ4MQm5yYasHOIuD2GnPVGi4vy5lh3U4//WFMQ009ZBR?=
 =?us-ascii?Q?+YxHdxoicFOBkLUAFqWP+LzfPsSPQpxNtiEa/LuRMeFt6XrrrPJPWgV77Waz?=
 =?us-ascii?Q?fCG3mWwb2phkOcV0n4AsdSvaf4OCmBmrlrU2u+3aUimflnpIAUqGxmYLN7ui?=
 =?us-ascii?Q?417JD9MbMwZNJjmSMVZM/N+myC1fxxVXBR5LekXVPZCKaDwmqxWj4zh96S/W?=
 =?us-ascii?Q?yps4rF5DEuJp59A9cqHtSdlSFOEwOKUWKyvWt3mYcPxblje9LvE/ePtSnje/?=
 =?us-ascii?Q?40xSkkWoHk/gWXMPZ/ny6AQW+cRQyLDLmKyzu/ukOhwhXVZUMnFfZnLb7l5T?=
 =?us-ascii?Q?ca/4nTjbCaST8d2JCqf/Ykh0mVZjig9NC3dRAJoLxx0K40/CyeJ6emGFZY2p?=
 =?us-ascii?Q?PuPZDQHi/4NzrYKfz9ApqLKVyHhva8Nn0nq/3gL1/xdYRRfKhdW36vMoVJc+?=
 =?us-ascii?Q?Prcwds2Wnj1XZU3e8qsQnGyqfEYoXj0ZBNIv38qcHNyuif56Nvuncp4TpqLQ?=
 =?us-ascii?Q?khyrvEbo6fI+v0D26g9xfjsGIaPH0BL8FTstA0SOE/MYssGTNJSVsV7iWvsC?=
 =?us-ascii?Q?GhYvM8jKKmDt69Qv5HMuvUDsKQ1IWQY4Y0gE3T1LSQL3nSNQ/TlPywc3YyNt?=
 =?us-ascii?Q?tXcYuQPV0MYwgCsR8Dg5jfzm4LvNczoTHWgVd87Ufd3BOVe8ivLL5BiadBVT?=
 =?us-ascii?Q?yTXEYShHS7Q6Gl7duIr8suGkx+Zq2R5YUtvrORWVviigategpaXc5bYZfZRq?=
 =?us-ascii?Q?WKSBEsETTWoF1k3AJTapcyR1sw8kn8cyJZCxHNuOR73zmGzRkdnKK1FH1pr5?=
 =?us-ascii?Q?9p7xS3NWfJrkqov5XkfwqVRAWmj4n/pQvDcT1vqtVAU7hJwn7BotVebvzMYN?=
 =?us-ascii?Q?r6ltmTGEExA+VQ19VMYovBSxyUSZlvzEkZYLRghzfroUpeGFdBQB+He6WA0C?=
 =?us-ascii?Q?cX5ID3RuTJTZNd80OxP4zAhfbTNTnuV8N4oDiKC3GvyQ7kLYSRrwoZjebL4J?=
 =?us-ascii?Q?JbCJSJuJD+v4Grk1Z4j2GLC/RBXQpHXSOsvmjw7D3h80iewX2H4tdFlOOwKJ?=
 =?us-ascii?Q?xHy2PcztBATpgPvTrAmA/A88TrD0hfqUgfZJWzpZ2vaEWlGLXjb13u8UDtXq?=
 =?us-ascii?Q?vz6dwkU73KR5YkRveRs4++OSHX+11xAMC8eYjIuUE23EGSQYGG3T1W6Fq7kZ?=
 =?us-ascii?Q?0oEL5odXN5CITPozjVqK3Lgg66skoMfJHBRh370TmUsgTXKKH8ALr3QBi0uX?=
 =?us-ascii?Q?KdjfyP//7cOYaVajL+aUux/Y9o4Byu8u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gmvQ51kdOAqZknSCJmTxfw3BA3hpPIF+A/kzV1VhaJ2+uebSU5dng7pJLJr/?=
 =?us-ascii?Q?jYcim3UGguoipiKanF3a4UkGPJ8dHvPh/edImccrvX/ClxdQbd+K0yLtCg2c?=
 =?us-ascii?Q?5szILPO3jUEQJyVM1nEtndch3X39sQAroHRDXcU77YN2nBI1UVhTUkIR1sGK?=
 =?us-ascii?Q?phvyNc9XXwFjfXNtECSJYPrD5eb1XsNiZ5ZjWsfotD5ExXqSjpRaMmjLt85L?=
 =?us-ascii?Q?wUZfqE6dtOaYixv4Hj1NBWfDgho4fjj8zYQmsBdO8vPXnDTkDbjEd2QXB1M/?=
 =?us-ascii?Q?z8JRTbMw4mszftvfRZp5+Q3szrY1D70Zk2rV9e5B/R9aOUeWRAQ697dfFIl0?=
 =?us-ascii?Q?nDyTomtg0f+yLubgya+s18+t27DP+llg/DzF9Jl3+l/MNnnzNcSpc/4ks76m?=
 =?us-ascii?Q?db4KAENWyodyyE+QncW3khM2q8mEfC1SRyyoh+IPWLwfmezVEGiOEKGpoVpE?=
 =?us-ascii?Q?JaavB7p/XZI/gWMk4D2dARM+M8AfdxkQzvz6JouMYpzAG4LeW4+snt3zUHeq?=
 =?us-ascii?Q?45668FemA2rN0GJnWjWHws0A+jD8v3EA12gIoD8J2YOHMlaBZV9+JRhcaqhh?=
 =?us-ascii?Q?Vn/YAEc7bfymhitti/xgF/iEc5re2sBB6313vfYI1wH0zrl/4I5/duz08oHW?=
 =?us-ascii?Q?6eBvfxGlwIUdJLcFHUaD4WtxwJ88lSLZw3bbuiyBI1QEdeB12qSbQf1LjjTy?=
 =?us-ascii?Q?ln6V4HD0ovnKWi39tK/HOovmoHZObfqVbNj1N1y3Vz3Wo3N1ZTcHyKxLNdKw?=
 =?us-ascii?Q?2mGjFsy5D30H7efCvRDoIm2EEjpPpR+5Os6beE99c9CIs0lPsjethQUa+MZy?=
 =?us-ascii?Q?WOflppOaf2YxXXlAHZye+Ca8Ws3zbKfP/avrXnVf64BgJgqiqYbROLTdqacd?=
 =?us-ascii?Q?rd/TTVRCAQRIHVYY+WYuqbxV32OKcpVqQ90R+RKcPyIVWX0oQO9Lt3azXzmo?=
 =?us-ascii?Q?WSrAMv7HDx5/UFI0QOC5DuonzWyz4yKaEGImw1vzehkEVw0iuVwXbtW0PY5G?=
 =?us-ascii?Q?p81N3InBI8V5CSxL1Cnec1yOfOJpoek3d35EhH4eh7pHvH4yrTAHWpJqVzui?=
 =?us-ascii?Q?ofuWe2g9B2sNk+I5rApMZAK21cjNRm32Yu1Tkrd1vCOU6dGEkLjRbqE2svP8?=
 =?us-ascii?Q?53DkaNF1jaGFNfzKZ9zLPi6tNSLCzbdlrUYTuZTzzC5obaQaoTy5QbYmiB5C?=
 =?us-ascii?Q?k9hW/K6xHsxFqi0SOvToRqO9w0w84F6jWRc8lLYq9TNZv52XGXyuOyZ4isAx?=
 =?us-ascii?Q?GmBJxoipsLWsdF/BpiK8R/FB4Q7r1PZL3YYcWhPMRhlxP4fvUe4Hw9cuyQwW?=
 =?us-ascii?Q?99UjwtF/zYCgPCQ5w3yhnehPbNDocS9qXjV2axtsBEkMUggVYw05PiWzJS9K?=
 =?us-ascii?Q?aIwGQ+oQ7ovPhD/vjDpgnHGgLanDbsPpcAhnv/MYmo83N0PJZdj6bJAiHRFG?=
 =?us-ascii?Q?PWi0VXj0Cf773LlYJ9jCo5GcacwYO25b9BI768xnVe7vy3N8aFy8tdranceV?=
 =?us-ascii?Q?72Chrw45+lhKV1gxiPNPEgL1yxlD9hmiHxu2lu1OJOCy65HpD8x27EXwOVVR?=
 =?us-ascii?Q?ctzNNCddC8KMmpxlKJGVDVPMUBHhjn1yIMtbRj/c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87f7be5-f766-4597-27d5-08dd764930b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:58:08.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To/DlZHcT1oYKaybVWUM3Fh2NqeZFPphdE6iAN3BR6poeNMb5057ksCrD2DkRRsiOxRmtH/mBem4zuHJ0n9dsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Ming Qian (4):
  media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
  media: imx-jpeg: Cleanup after an allocation error
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 119 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 96 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


