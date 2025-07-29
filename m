Return-Path: <linux-media+bounces-38638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F9B150E8
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 18:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98FA818A4FA7
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3C129A9E6;
	Tue, 29 Jul 2025 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="buqrmKv0"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705329826A;
	Tue, 29 Jul 2025 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805259; cv=fail; b=Ng+f83/2Ovb47cghcULK76ZSyRmogk2pCy7aAN+e0zF5v+Y87od0mJiGHFuW0b/gonjaytRu7PwlMM7L8VZL6JfIgH8B+r4ALzCQ4Fs5yVfm12fr+gf3/jfqw+8cpWcl43T0QX0vl6Qt+wOrQsfPre/R4c3gYQqoEnd3VZX5xRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805259; c=relaxed/simple;
	bh=bgE0978G0xC0wjQ0ppqK/X9I7iUJ76ZVZ1rLWXx+RSw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GgSPNTzZnHZ6jhJT/Yhp+esyghyOu+WwQDNen/YnV/xu3+pLxs/4NmclyvgE//b8nSwILlgxZe8h+yGNu8Zu9GrVt8ESoPuCQvswrwPibUqfFgb46aaw7vrszYxSAGyWnUqJnLNUb1ikJ16jXnoFHVw53qyGGrqCohKYd2g4hpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=buqrmKv0; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9PuQSlMwrTnQUReTFBshP48hzZ0weNkut7ElT5lhAAXcRN2f6Vxqpw/xQlvenIQ3XvJeuKoo01Qr/yDZq8ET40R17olkqguCp3GrSRY+WeGKnNFLMF6UgpQWC5CiANHzUO6HdKeEJnG/SwdbZZVpGtgYm1JYkWv24Gv/KmMkMEVjIjeNWxyDqvRlzQrI1qXTtqE4UPExZ5W64Q51gkFF7RpfPZPOx0V+Hcz0S+wMS8hFSZ/xNUmo8124oyg/xvto3Mks7hzT2MMpzGgw6dNUW0N9Ybca0iTgdlcqjqSdIXeoEJ/ohrXsMTtydCKSFndDI2PwaIFmg9DX+SC6TSK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Nu0y/yh6DSsBfG1nLuOxpH9YSVXT9hnwhzsRiT2C9o=;
 b=IZe592IlA8Hzzi5mieVF1WZIkZdalAkfKatUeaodx2+uGcPFLssWWKNBM+cdQ5zYe8rug7YPqddA7gNgNdX8Z6n/O2gNysHbxB6Q1jvHxOvKPdbzrfG8KQVF7HkKuZlmRobhtW9T2ujsbPFiQPgJQtTR5/xL6CaAbXTjC1qyar+JpbsSe2wbPx5B5iUWpZjpetsHqn4zveoI7RLiWugzoiNT6XEmS6dNH+RLDK1xY8i3dFFQfk/AsUd8RtHurEX9HYs3p5Oi7Nc0Jz/Qnc9RDiHSgexy+lcJkBiSJVJEs5wQtMi/RgIHL+q8IC2COe/hfex/6JyixWE0nBOZWOMQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Nu0y/yh6DSsBfG1nLuOxpH9YSVXT9hnwhzsRiT2C9o=;
 b=buqrmKv0wqOtiGVgTAyZXnOZ0MatT011KWi0TnV+bS+t/s5z7TA6e2+21R89eAcl+on65hmqJV8LyYurRP8CYNzKD65yppnZ7tSMtV+9DNAQ7p/W0rzESBlW7asGfkiQYz+9QTpoaZPSNMw+lLC7pymqgcUFIVjuRJNfNubttWl2GyAz5/Q486FfgjJIcds38aG5TaU10t3z4xGekWLUu2HZr2tPW3wR5Y4/z4gdNJe417/VTWNoDkPtAhrf8KG48f4iIn+1NKA3zdM2e2ac28E0B79km1goRpf93uMRi3rBCDD+fenE8WmeBuYTUUU2/+Qmm7xltJ4At1nEXFscUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:07:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:07:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 29 Jul 2025 12:06:26 -0400
Subject: [PATCH v4 5/5] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-imx8qxp_pcam-v4-5-4dfca4ed2f87@nxp.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753805222; l=3877;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bgE0978G0xC0wjQ0ppqK/X9I7iUJ76ZVZ1rLWXx+RSw=;
 b=uJ46QeYi+28LjxwWo3/1r+yfMdtoAQ68klTAf+jx/Ho8IQUzkmGsNJlDxKHtM5hCOsLl4prAy
 keETZcM6XkLBFjliJi5UHwFf27Yxh5JhzK77Siyjo5m5ZGnsmiUqM6m
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: c897cc0d-6296-4ea2-92ed-08ddceba0692
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dTlWZWJWbWQ0VnQ5Q3RZYk1kZUorSCtTSXdhcXVJTFZibWdrYk5WWU4yRHJp?=
 =?utf-8?B?SDgxTmg5SUVlVjVhaFhFUHJLQnNNS01KUHQxSllGaXpodlVDRDhxTXJOcGdw?=
 =?utf-8?B?UFpqQ0I3WVBGNzlZN1RmY0swejB2bTNhT3BqaDZHOE50YnI2OG1qVkl0U1Fr?=
 =?utf-8?B?cWVSVUFoWThOdW40L1V1ckFoRGhpTTJ1eFl3ODlTUkR0Z0FSNE5Tek54d2ha?=
 =?utf-8?B?Ykh4MGVVd08yVWFoNGljdFZ3RVRGTjduTlY4L0NVY2g4L1g3RTk4OHlVTWRm?=
 =?utf-8?B?RFZZU1haZFF1Q09sREprTXg2MGdMTGErTDJPTm1sYU5DVkt5Rll3TE13ajI2?=
 =?utf-8?B?bnlzZy93aHlZQUhZcFNzNmlnZS9LU1l1d0Z0OW5YNHhTWVhyVFlmK0ZyaGlN?=
 =?utf-8?B?QW94b3Zmblc3OC80TmNYN2FsSVY5eXlaMlFBVUR4NzVOcU50MGUrNk9CZFQ3?=
 =?utf-8?B?ZHc3S2JjQzdKdURaRCtsVlJpNEhOa3VRbXcxdmpGQ1F6Q1NmcnFkVncxRWxB?=
 =?utf-8?B?VUhNcTVkd0d3dUFQTWttdDlqZVFteDB4Zks2QzFRM0NZUWNGZzlBVFp2dmtl?=
 =?utf-8?B?eHZRZzFqVXRqOWFXVlBEY2FET0pwYXZCbEsrVlNjUnJCUTdXZW5EUUxSN1V3?=
 =?utf-8?B?WE5TdE9YTndvUFMydUE0aHJ0QzdrOEh2RG1QZnRCdkRkb1hwY0luSy9lV0xM?=
 =?utf-8?B?a0FEcHZ0WTE4N1ljYWlKdFNIZGIrbmI0VTNBS1hOYVFKK2ZTa2xjdXh2YmlI?=
 =?utf-8?B?MXNNV3A5dDFua2pOaGtEeWF5MXhvTWhGU0VlT0MxMmthb2xsWVUvVGtFVDBQ?=
 =?utf-8?B?em1QMEl6cE5jZWlVNUJ5TFg2WW9BemRKMUFoV01jYTR5RXJ6eTVCWGlFZVJT?=
 =?utf-8?B?a2R0c1FNTVI3Mnh4RTVGNTVoNlV0ZlZRV0hHVElWWWlkSU1kSk5PcWZnMUs1?=
 =?utf-8?B?alBMemc0d3AzTmxRWGNSOWh3bzg4WGZmN0tWUGJHRndxTzVlTGRlTmxtZTlT?=
 =?utf-8?B?akR2UlRXWWY5Mm9BSFIyYkNrK3l6RmhYTlRlZE0zYlNnSkM1NEdSUTJORC9q?=
 =?utf-8?B?cVpRbXNnOVAxRE5HOFhIRWxJUUc3dlplQkZlK2FHaVVtQ3NYTjFVdXQ5UzVJ?=
 =?utf-8?B?WHF2WjRDM0Q1MkFmUE1lOTJMS3pDQnJxWEtBOGV0dm5NazFEcWhnaE9oNVNI?=
 =?utf-8?B?VSt2TEpWM2UrNWpDWi9yT2FRL08rUlRXc2V6ZEd6S1hsS2lhdXcxNkdBeFZk?=
 =?utf-8?B?WnhZZTBTcnBVY1QyNmJnTG9EbUlKMHNXaTkzMnhXVTdpcDRlMXpNMnViVW1m?=
 =?utf-8?B?aVFzemxMSkRvd2VpYzR1VTRxYTBPeTNxYkU4Ti9LRUp1S0hQWnNxYVVwZEpv?=
 =?utf-8?B?UERocWZScUdONU4vajlHeGlBOStUZDZnQlVzdVB3TFplUjBMdFg2UEN5SVpo?=
 =?utf-8?B?bVZ5RzQvb0l0aktnOEFYVCtIY1dSajB1Y25qc2RTRlk1VDdlUkk2MUI2MVRi?=
 =?utf-8?B?MElQaW1OTWVTRzkySFFaa0FnSis4dzFseFJ2cUR4YUgxZGFpOFBBU0NrMGY2?=
 =?utf-8?B?MXFpSC9RdXgyZVBQSDhxRjNXT0UyVCtxV3RYdWozMmVGbGFDWk5qeDE4OGtD?=
 =?utf-8?B?UHpVWFJ3eFp3ajY1WlRhdlFseGUvcmtvMDdNOTlYU3F1aDN5VUI1bTMwT09v?=
 =?utf-8?B?V2JUOTUvbDU0ZkdrWjR0UjZCNWJnQjAwZU8wb3lETWE2V2phUzRQVXpUbkRO?=
 =?utf-8?B?eC9WMy9IRHAwOElGemJhWlNDeFNVK0U5L3ZEM0V1QUZ4WTBXMzFnTkJNbXNG?=
 =?utf-8?B?SHN0M1B6TTBtNmJ4cktxcEhkOTNRRkhOTXNPckEwOFY1bnpSMCsrN3A5dm9k?=
 =?utf-8?B?Q2lEMU5TZDlUZHJhWWcyMUVKU0JVMUxHTzErUXRkaUh5NEphZWtjcmtJdDlj?=
 =?utf-8?B?c0tXcHVDZHkzOUNCMjh3M2s4YlRxMkdtWjRKOGtwdHczamF3LzN2bHFDQitt?=
 =?utf-8?Q?r3zXs6BX4+VaeOSJYdRX4yar+cmi0s=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TUNhbWlrRzZrN3JnU2NtbUtyemIrdkErZi9ZKzBQc2ZLOWluWllxTkFqWE90?=
 =?utf-8?B?SkFqdStzc01wMVBTS3dFZUxKaHBEaXQyN09pVTFNSEp6STlWZ3pTU2lVNHJY?=
 =?utf-8?B?bWVhOElBL3cyRnY3bFNFWEl5VDMyL2YyeE0vNkRwcXZQbTlQQmRBN1NOM3VQ?=
 =?utf-8?B?US93ZSs1NHlCMFZ1QTdPdHRoelYwaDY4dHJiUk9QeUpJNkQ0WEI4Y2VuRUdu?=
 =?utf-8?B?Ly83RjZOS1ZDT3ZReG1TaFNXVlpaZDUyVkVaNmQweXR6bXlWZ3k1cEtmbEdK?=
 =?utf-8?B?ZGVhNUV5cU8xZ0xOdThwNXViNWpDOHhLRitJNUo1T3lpb0V4QjJNOW4vbnBr?=
 =?utf-8?B?a1I2TGg4dU55U0Y3NUNzSk5WcVZEWmtRVWF3STZoUDhHOWN3SVZjRjRvSFBL?=
 =?utf-8?B?NC95aU9VSUREVDVUb2VuRzJtMnZ2Skx1MlpyRS9XanJrZjZtWkxkRUNMVzJU?=
 =?utf-8?B?MkJXZlJnUnl5a3I0S2dtbVFWYWUrNXYzcWFLVFowaEYzZS85WXA2TTk0aURy?=
 =?utf-8?B?VGJYYTRTRWxMZUlVWm5jYU1XT1czS2FZSnJlMm1rOGE3eTJQaW9lUUExNjVZ?=
 =?utf-8?B?V0Q3UmkraCtsc05MNmV3QlE1Z0d1ZmJiQzMrb3NXendHcktxUURDcCtIV0wv?=
 =?utf-8?B?OW9makc4bjhZQXBuR1J2SVQzWTV6QlV4cVZIVGszeERqVnhjRThRN0JDNkgx?=
 =?utf-8?B?eUNYV3lTemdjS0FQbmtibHFWRlo2RXRyRytRbEZVcEh2b0d4OHRZNS9Ib2Iv?=
 =?utf-8?B?dkNqSFZ4VVp3R3h3dGNwUitPWXR1c1VPV2lUT2NjZE5XWnpleUVHVFViQ2JY?=
 =?utf-8?B?cHF5UmE2NjB1MjJ0VzdlbWllUVBPNmlMcTFzRnRZcnEvRkJ0VmZJaWJOaTl2?=
 =?utf-8?B?T3pnZHlYY3pNNm9UNnRBaE9JeFdpVGc0RTZ4Um05RnEwVjA5TUtnNlpRY2cr?=
 =?utf-8?B?VVZQckxPWFZvVmR6K2xRUjVDckhIUWhKNFB4TXU5VitmM0ZVMjc1ZTh6NWNy?=
 =?utf-8?B?Tko0NDRVbHpTcEhZVksvdWpNcjVrMDJoTEVOZlRMb2JTVGlaVXF1TlZrNlBE?=
 =?utf-8?B?SHcvVmFRVWdnaWtpV1dwQWdaYWlhYlJFajdpUjlXei9ndUJQUnM3U1RETFox?=
 =?utf-8?B?YUxiaGxNdXpqZFM0WlFWaEN4VUptVDJ0TG9VVUxuZGxITXZWQWM3OXZOdGc5?=
 =?utf-8?B?NEp5WFRPRVFIZVdJTEhqblg2RjRzVEFIWnpGWXdObUN1a3U4QXhtcVNKLzZJ?=
 =?utf-8?B?Vmt3eUx4TlhzMlVnaHl5ZDE5Vm1HRzlDMjZrbTJXSE81VGhoU2h3bHdyaGJT?=
 =?utf-8?B?eU5UWUM1MkRnTHYyTEdITzV2RW9Ga29UTHBMdDJrUVRVQTBqcFd5RnRlNFZo?=
 =?utf-8?B?K3o1QkVIOEUrWUY5TTB5Z2hjUEtnVGM2czJvYldGMmUyZmJIZmJRQ2M1RUtM?=
 =?utf-8?B?ZHYvU2l1bURDTTdGZDFWRWNnb1pnWmdmQU85aXp0L1MwdlVsNmxoVGJYTU1z?=
 =?utf-8?B?NkJOWnY0Z2hINk0yR2h3cDljc2Z3SEV6MkM0ZHhwbmtVYzFDQ3M2a2NPV1Jt?=
 =?utf-8?B?QmpvUk5tYkZsL2pFY1BrUGU4R0hIRndUbHNrMkVkdVE1NGw1SjZRaE5SY0JV?=
 =?utf-8?B?TmZqMStSeUU1cXQraXJKUFJPdmFCbTRHdnZnZGtPL2Q5NVAwWjlnNjN5V2py?=
 =?utf-8?B?K0R0Q3FlM1lMdkFlQS9pelJPc2pDNlpTTVpBTEZIZERzVnJvOU9MTG41YmJs?=
 =?utf-8?B?WTM5RjJkTUFyTmdYVlFlUGdKbS94d1ZRVjZHQXdoaDk3NFZLSTlXWThxdGhY?=
 =?utf-8?B?K1JaeGcwY1lKOXNxYytMb3ovWEM3YkJwaHNLb0lnTUpQMi9CWXdwSDZObFR4?=
 =?utf-8?B?SEhnR1BmeDJJbEd5MnZGK1g4N0MzWXdHMDNhUEcwY010VDRoRDBxZHc1ZTkr?=
 =?utf-8?B?R3R6ODl3OXZRZk92ZGd5a1VjWUR4RWZWUkpjQXF6aWE0ZzhVMXZWME1ZWmZ0?=
 =?utf-8?B?bUhIbXJBMlYreUpUdStqYzAxQVluaUpmZVFlcS81ZlJ5Wm5jRko1ZENBSDFh?=
 =?utf-8?B?ZlpNRmhxS1U2eTZTV3pta0ZWbkh4SndIb3RFRXN4Y1djYVRHcVV6Rjg1S2pi?=
 =?utf-8?Q?yEVbp8Sr05d4uXuJzqWCkfTy2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c897cc0d-6296-4ea2-92ed-08ddceba0692
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 16:07:32.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ3Z0G2hLP9ciIvAU64G8vHk69AF07sHf5gN8nJp2oTnTzqNYJuS1dRS+j1KpAy+olgjnzqDno9+bDeIqyj4Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI CSI and parallel mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4
- add hsync-active = <1>

changes in v3
- replace csi with cpi.
- use imx8qxp-mek-ov5640-cpi.dtso since csi use imx8qxp-mek-ov5640-csi.dtso

change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso | 83 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23535ed47631ca8f9db65bec5c07b6a7a7e36525..b85bb9ac8e8ec3548a54797a7583d55955b62f74 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..9fbdd798f17d610847819b8c6fb92694e42361a5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_cpi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_cpi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_cpi: parallelcpigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_cpi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_cpi_in: endpoint {
+				hsync-active = <1>;
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


