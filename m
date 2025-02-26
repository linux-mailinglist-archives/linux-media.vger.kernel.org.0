Return-Path: <linux-media+bounces-27077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5494A46557
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521E53B9063
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFB321D5BC;
	Wed, 26 Feb 2025 15:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="AONxXoHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D021C184;
	Wed, 26 Feb 2025 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584401; cv=fail; b=ogXxeU4iaNxOTLH14QrJc5nxItJQOm57UPGRdFwidKt+ox1FtgmBT8aOJ8uY3gS+7lN24533SYvUNxk4l1swDVdND9IhC0IjflecdC2295yJUqJpR08oRp8B4o2P7msC9OYgU4EM1Wpf6um3NyBidao7ePgJ35/vekwsEOQ8Wxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584401; c=relaxed/simple;
	bh=/Kzyw/MP6jsF1Ix+c4Am3oJvq1w4IKJw/7JZnObmkak=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fCVP1h2XtHd2d6JmUpX9jdLwJ6YsNHLR9tIMsXWpgmvRuQcojIfdqH6AT39NFw0JtyKoBh5Qp7Z1AeRkePobAgl9iqy72oKlMO0a63Kstnd8lDWCKh3bHj0T62jHILAc+cKtvBL5tYSS4tcigH1ExSuunFHzTYBQ0urf83Ify8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=AONxXoHQ; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loEir5RsQPqL0hb2IQK6rEit7GOtP7K6kDjDX3+7ZelXte60T5dFTguQlAAANppf2xkyNnP1LAsjXEzXUlBSbuJUypEwq75kpglmQDpG6LaCQslvJU0Dx8puH9umKXiEgQPHx1spmEYOPmeRPw08pNbPYtW9lgKFk6PrW1A7p2dlMf7GoJbZFVlAmkXDxocufTgyVSz+P+Cb/8GlPrtDe6D3vXrz6Wwztod89LxpRHyqViFlvF4FPcFL9GGXIhSKBvpSp+/Chl5yjM8UHKuWCInjC+vMPnzYkDID+ADbexmyV4yqDrGRgLr6CwVMM6CZ9fkODj/8gbg78yYWnXyb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAZbOQfrVQMEaCKUC/F/pwLUbAMMTXyHbvzNDxXmQTM=;
 b=MDUX7/UheONl6tLmaeO+cZoI44beEBiNCIA/fMz/Kw5ds2upoq+EaxflefE8q14XYIT/dRb5WGVd7QLSVzpx3xh/KFlSOjxAY6bQscsRixNmBvdXIhN4YBa4idVjBaoZbsaURwm1Gb5B6KNpwz/GbRIvDbt4RU/WHyKVoIQPyL5dp0InyjfsTd/9RhKPrbKcBth+bALhXilMYsEueknM1Wb8gRTi71KpnMAz7gnQyYrHRAkV28dU9yqwFu30pmaTyjcRh+nToQtJSXwsW162AHPKX1qHE2Z7xiZPuYSDTfIJ7zovzDJGfkOukrIN297ScdddvzmmVaBo/80c1PQxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAZbOQfrVQMEaCKUC/F/pwLUbAMMTXyHbvzNDxXmQTM=;
 b=AONxXoHQkB4Va7C4tym5ECzgdsH48J0bfOvpVNY0WFSzghclNxtB9I/iXRV3VrBQZLfN+uAc6FtUhUXVrM61B6wGHmW4CTZnvRGweIvbEpP/4uh2d65L/bVP6YNQdVjRYS7Gr8uM/W6X3afZdpsXq5ms8oxnhnVfFpVs0ziF6Hj05S0Z9tv3oEH9I6tqGuHNEtvjLpUC+U/JepmK/EiWa4NTM31bmljuMP+VtoIF8lQyz7w1N1/TcggBmy3j/1GuQ5jjyvtY2d9lBm2nsLq0CbDnMtHIl+jz9QHCBSB+BfNh38xpbU39430yN5LeRDvYA59DEk5XGgiJ/e13h/YgWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:39:56 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:39:56 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com
Subject: [PATCH v1 0/8] MT9M114 driver bugfix and improvements
Date: Wed, 26 Feb 2025 16:39:21 +0100
Message-Id: <20250226153929.274562-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::14) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 578cc0c8-fa03-4788-6d80-08dd567bd24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/uVjleaUpxx9ivTOVC1Kz2bNk94BcQ3phLj3f9GvB2Qie/JEaE8kf3rDV3QT?=
 =?us-ascii?Q?lQzVVx0huF0TQACvENzoQ5Y1Sp1jXWAk45jtj4GJEPnotoqpz4B0yTMvBV0x?=
 =?us-ascii?Q?MgcR/hYdb04St3MhaFeCa72cXAVtfXTVcMF4R/gSKaMmHLJS4COx2Ir8sdiL?=
 =?us-ascii?Q?HtMo/nNmYRtC7/bsYDG2ABPeiervp+FAcSB7ztI34UuOFCorSCTCSYlmNqoU?=
 =?us-ascii?Q?yEqaoq011858ZKXySdcZdhA2kTODL1YucuckQEKyApOyY6ERpGCjjz9HEc0o?=
 =?us-ascii?Q?fcCpVBx35NJP5HVOBS63Q8vyFVBABViwXou4oqdSPDWcScoiv7RYbyJCmERy?=
 =?us-ascii?Q?/FK6GiNgDuJN25Yyyx08UY59kCB5oc5gjMGTNPVsUiXZQm7TAmR7vmsTVSMH?=
 =?us-ascii?Q?XScu5Y9oeWK6BaWtaF0CxokkTfe6QXijwl7omnJMB1EiQ5Ise+J5OVy9A0FV?=
 =?us-ascii?Q?Ri9HF/h0oOl54RY/zA1lK3AukLSEq/Vl8FCFm1IHDShAcujSYDFQ1ptuaHmi?=
 =?us-ascii?Q?6f+KL0m7p7Jfb4zUV26ZcU8ZyQcMHIWQiOJzieaAWZ1ddgrSqFMYqsPSUCiH?=
 =?us-ascii?Q?JYtzll3iVsYnJCNdJLdnaMSioshY7a3Hf9ARImvpLmpTVYp3rWccWESDC1g+?=
 =?us-ascii?Q?Vwcq+Mfpk0s6g2EWO/5EPXbMAwjfVxRE846acUmDqG9N44vvw6nphwwv5Xo7?=
 =?us-ascii?Q?m0tcXQtmW35+M9zG74SBUmNzQg+Fj8CxFLevyuZwqhUjJyXS6pKwvj8vbHKg?=
 =?us-ascii?Q?o4ncrKPq01QGrs+hnwS8YRLMs7G2UPr6GKM/ZhkmTWDlAwoXJi0GsOwuKIpb?=
 =?us-ascii?Q?wfKMq0qy8Qk3ata8KLbdn5e9RH+ZRfnxHtmJkeU2QqrgL5jTtp7x9OGQQbXt?=
 =?us-ascii?Q?b1N+MITLvlSR00/iZNJzYn6g4URrjV332yZM0S+6W5Fd3C+gOE46gKo6IjV6?=
 =?us-ascii?Q?9iNycBvuhljAoHo7J6f+8pZt+bkk6iZ2v+MuvhYQvF0EjztqAnI4j99mKkvx?=
 =?us-ascii?Q?COfa1WWYd0ndxT0ZNlgU5mVha98TNjzuuAvrdvbUnBuR11wSBBZtj3BwXnZe?=
 =?us-ascii?Q?6EWK4dycUvx6MACh76LmdQQcASoTrsY9XP7h0UMfTCvHhOFL5ZxGMCsp/tsF?=
 =?us-ascii?Q?zMxNZAlUk4NC8cjezn92xrZKU5nFaKz4hrocBFgMVDMpe/ChldpxahmVNQ5C?=
 =?us-ascii?Q?xHI0BxKQJgGl7Ac7Bjy0ka6hRx7PQCNcBUf6JJ+EfcPBeyIjqldCOktO0yBo?=
 =?us-ascii?Q?nI1mZX+Fw57SS5mQiZvCjTdV3+Rdi05q64FnG0bKslLSo3cGzrfOk+AL6/lp?=
 =?us-ascii?Q?4AJ6Krx4flewLvMvK0VWHK2qrbDoUWz8Xj5RF+Dy/trLB4/ZvTXUFmdTuj91?=
 =?us-ascii?Q?iOvYw7gONmXQ45TpPSvqvxoLSoFSFceTSfLW7704bH8Jn+b1GkNkShUsxaGW?=
 =?us-ascii?Q?8FIDAbh9Fyda2D1UEXPzWsot+QZfB2UH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LQ7YaamyVr593rghX6yXi2xkqh8xHQNMjsYl+Z/QZlcuk83v1IMa0CsQEVNr?=
 =?us-ascii?Q?KLwkcU1dBIwaNr2GvvkS9Kvy8U413g2DhV1+ZKdvzGV+5lSZEgaI2WQCNCeg?=
 =?us-ascii?Q?g34Li1EI7D92NzJSLGcdqP7g80/ekqbNBcrZ8GSqMh2dCvY1M1TBUHzEAzEL?=
 =?us-ascii?Q?kMKMgKE7y4IqfrXxx5L/VLtrByC/nxb+fYLgmEYNUt+lYbQfCy5B9BDXmcja?=
 =?us-ascii?Q?rRdeF6jTkZG7i2yhVkrMoHyLP/DaISUbxQnGcwadJFpz4ItVJvf5rB+zqhIR?=
 =?us-ascii?Q?jGviZfmbQSkQrZEH0cZnzouHLngii4M87Lj/1bKz1mRIBLWdOglc+hOU2Hku?=
 =?us-ascii?Q?Vs5Qr5+0qVUqBLlvKRyhnp9k5//9ZKVmj5X2zVkCsrdGSuU+oeS8h+pNVLnX?=
 =?us-ascii?Q?V2yRIWC9m8mqGF71vTtl5uxe6iomKr1Kxua8wfhxAYUujc6BE25KttFLisCW?=
 =?us-ascii?Q?bPl6As5/FNWLoxuHQIqVMhCHSoraStJt+myc+qTlTRjHDyIxKSW7LPa8ivxN?=
 =?us-ascii?Q?1e58m6N+utwKkjC3EtyDU6AqrSzWv4e2WY23q4AkaNSC4AXi4dYIwqTDKcpN?=
 =?us-ascii?Q?YOQOmFSrv+JNQ+QLQ+eRz9OnGjABVcgEoQgRGRbyYFrsyIYwb1XNC382ArpE?=
 =?us-ascii?Q?r9+0QF2M9k+ceQV/CU9CID+YaJTU3UExevtpY4y8pDbJ6coJ4XBXYAXxRfCc?=
 =?us-ascii?Q?EYDoot9MiiMgRl12rx8yUPESDlItAe7YJwQCqeSm4ZU9Yj0SQjf1TBarIAi7?=
 =?us-ascii?Q?voTwb9/CSh6vNpktHuCOEKXk6pkzoF/lRVCgNpbIL1du/KcrXTOFL3qB6lev?=
 =?us-ascii?Q?Cmrr71CUw4S+BXTUl7rMyJ0xKl5imdroUXmGmgQhMOr1u7wvvqDSFsVDEQsu?=
 =?us-ascii?Q?lHX8gDeAlQwK5f/9Djsropz7Kg05BHVQKEv5QKj3kxaodRM1ah2cCnS/KuDX?=
 =?us-ascii?Q?fB4g1mL4UZqgG494THsys7A7V+Nc2ZdDt/5qKm/0RnOL2JhEWjGjspTD75gG?=
 =?us-ascii?Q?C9kRDyT/H8yn7VZMAyfrEL55Ywy7DHDIrWxqdT2RgnnzT9WOCCf0h9TQepLh?=
 =?us-ascii?Q?1akp02RZDpmskY4soL91ssthEfHv7rr9wRUubCaMnf0MyllV36F0KKn4G+0f?=
 =?us-ascii?Q?ZnOZNJ/xI9mxzcVgOWMjmggrK/kwYT/Iuoin4sBZJIiXZWv8RxVuS3nHcGcL?=
 =?us-ascii?Q?IgSvhSwpxe2katnzcZdgTtc3aNnnECgRS4MW2PCmFXnXCI4SYJ+zxm0bSyUv?=
 =?us-ascii?Q?bzcg+ijUvma2mZ6BsePGEq6NssNVFZHexM9lFbfc1qUbKsBY5FgnWGZyxFqg?=
 =?us-ascii?Q?85ZumSnQC4u2w/VL9HwUR+fl7n22TpdOKwRnD0nL8SKwxHqr/i7DPzq25KjW?=
 =?us-ascii?Q?bF5ahuWhDumd0B9aJMdTcjgLdi41LyklZyTTf1FIPrxKZlku3EPzqdFRuWdF?=
 =?us-ascii?Q?+0t9OjoDCBD5qh4vFElxMtTOw8f9NuiGG1jozzqMiv73j1Dansa6LaBND71i?=
 =?us-ascii?Q?lAfjSTl2K85AXZt2mIla8KdCS2FHwDL1zoMKWcg4hr7F0aBesbE0cGUg1Vh4?=
 =?us-ascii?Q?3v+rw6lzpu+BFx+nG7pzZoooWvmrdcY3Vr9FrQps?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578cc0c8-fa03-4788-6d80-08dd567bd24f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:39:56.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2D+NDCze5sSaG89ceuWWF5e59surI/xqtQW/xpIk1+p6luyJROJBHAxFVw2DcfIu9UBLkBZ3yPYiyP6XfhkkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

Compatibility:
- Implement the missing get_mbus_config() function to be compatible
  with the i.MX6 camera framework

New Features:
- Allow to bypass the internal PLL (configurable via DT)
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration and the horizontal/vertical
  flipping while the sensor is in streaming state

Thanks,
Mathis


Mathis Foerst (8):
  MT9M114: Add bypass-pll DT-binding
  MT9M114: Add pad-slew-rate DT-binding
  MT9M114: Add get_mbus_config
  MT9M114: Add option to bypass PLL
  MT9M114: Factor out mt9m114_configure_pa
  MT9M114: Allow set_selection while streaming
  MT9M114: Fix deadlock in get_frame_interval/set_frame_interval
  MT9M114: Set pad-slew-rate

 .../bindings/media/i2c/onnn,mt9m114.yaml      |  10 ++
 drivers/media/i2c/mt9m114.c                   | 161 +++++++++++++-----
 2 files changed, 129 insertions(+), 42 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


