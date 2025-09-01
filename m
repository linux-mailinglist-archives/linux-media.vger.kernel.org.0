Return-Path: <linux-media+bounces-41388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A8B3D9DE
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C023A189A9D4
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FDB258EC1;
	Mon,  1 Sep 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dG2LYS7M"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6F822156A;
	Mon,  1 Sep 2025 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707952; cv=fail; b=Kiypj2W2igK5L5F3BAIoqh3nSntHOF32CizADe1K5mdezF8Ae8wSzXqk27u6ME1X5WhDMOP1KuDl8OanBGArcN45LZdMdt3ZDJ9Ttg7xk3XjlSleJrmYTLgAqrVTsgjrx8iM8dmm4PnLF6PjAh9Z8piKSJgiPT1xDqT28UQkvv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707952; c=relaxed/simple;
	bh=zspT65V8qcTtaMcT3XXZpYAU2pAAb1spHyjB9UNlkVE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Jqk3ORcK5xyI6WoLhxazMQdys8lqx1FW+PRR/XcfXY12UAVAPhF02kwodQMOutD1pAzJCiKSTPGHKCLCi7IqhOSxwv4QOSsFAlbx/EfigDevPPJtsPpZYwIRuZ/TFQzzKtsaDzZOruyGrLOGdXYkBTvcsRy+fzbnnC1jeAJ0mAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dG2LYS7M; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIvICzHMSaohLIOEegPCMtHRYLGzZtjr6f+tNYFcoWsXdjhrQxiH3lY8LGKQvwH+dBkfYwdIgcMy3hPUZq4A8PY6wWvzEbTIsVafhtPLzJdOkh60THSGzhzFhd4cQdMnoFLMApdfPHn+S+/jn6CKOzl4AFENQvxcjI5AV+RNI4OmYzBKW8ZJ9VWAtKvqAnP97RTIb+tbEXwxBxh1VLhI4idLkWG31xgCJw4H0lBXkbeeDHcVaWw0FM4UaQevnHj5jnwUyMandOF+xIbBqAm1XhYickSNW0/1oc3eB9dVu4NE+s+7C76br2z36Lgndq6mdFWxDstscAM8cAjVtLPDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+H8ZuCbHRaLs7lriw+xNjFnHnGEpsBSJlYHUhM77/M=;
 b=lmMZpu4tnoohvZ0NgRX0kcC1d6o9k7dHym4aFaqaqzL+0u2S75tFPmFx7x/II6iVS7es75JiCmshJVzwqZ7kPrVgI6vtcM6O6v7/keC4j1rXXl3k51t+7w7VunCC4ZHAq3Oyu6TXtobN8DDPC00p+/5t18V+An5YQxVhbfCxcDoFHKgJWEflx8RzCwadv2iD+uNEZe+oZnLs8mh+kGgyJCV+riwppL1l0Eb4/WV54ciht76Z23e1VQEHcR9m2VkA/FqFgxUJ9QcnhPbhZp7v6tscBUS4nm6hRgyCbtnpQgyHdbg5sQBQ6NDq6NSF6N4mrt2oiWdRZ+qOzcyFQgAPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+H8ZuCbHRaLs7lriw+xNjFnHnGEpsBSJlYHUhM77/M=;
 b=dG2LYS7MkbSnMNYs95RktuySv5TF7EbdJCRX4LRgyb4X5ftcCSojNy55rWphmM8tNvvX/HMiRO5wt+HCbTsfjUbD7zWc9o1NR6kyoav6TOaVc8FCbQ9OOPw1BPTXS3CQqgz+0Lc/x2DE9ywkmM7w58X4fRxh6LPE4zSC1BTX9F9mTRbAbOOqpBQ0DVBW/nn4UU/ngUBl1g5tEHXhhAhF8jKV16lSsp/zqXbUIflspMp1cdOSoM+Vj+mgmMwjBlE1ZGg1kRR90ZOIWh8zE6UGtmOQGnR/466fevEgOd0SxfHKJA40vffio0fICLz87UhXrA+yJgGuTNRXBCbBrSE4AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Mon, 1 Sep
 2025 06:25:47 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::473a:e4c3:5682:7765%2]) with mapi id 15.20.9073.010; Mon, 1 Sep 2025
 06:25:47 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v5 0/4] Add MIPI CSI-2 support for i.MX8ULP
Date: Mon, 01 Sep 2025 14:25:28 +0800
Message-Id: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFg8tWgC/13OS26DMBSF4a1EHtcIXz9qZ5R9VFVkYxOuVDCyA
 yKN2HtN1KokwzP4fp07ySFhyOR4uJMUZswYhzLk24E0nR0ugaIvm0ANstbM0CYjnLFf9PQ1UuM
 d18p75XxLChlTaHF55D4+y25T7Om1S8HuI7CFgFesZoYLSRm9THHAqfru4nSKOVfDMlZN7Ldkh
 /ka0+1xcIYt/JsBeP4yA60pKCuE4EYYJU9/le3JzPdUvlBeKJdaS+usAtc8U7Gn+oWKQi205t0
 x6ZzR/3Rd1x9QzoREXwEAAA==
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756707946; l=2355;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=zspT65V8qcTtaMcT3XXZpYAU2pAAb1spHyjB9UNlkVE=;
 b=0xAuJMJKl7qHbZNeYmuHKHwYRKO5cjZyNBzQBDboqXOwH81be//HBobsQl8cciNuvHpmMcJ8K
 o2huT3q26SFBP54N/+g+ZsRRdchbmt1P9C4a2dK4scMn0RfXH72RjkH
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|PAXPR04MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c56bfd-feb4-417a-a2a5-08dde92062a0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VTRYNHgxU1Y5R0V0VzF0dWRtTFc2WnRhQ2hBcStqaVlyOWdlbnpJTDhzUzIy?=
 =?utf-8?B?TVdYWE9kdVpCQURDRGZtZksvMWRoeUJpbkl6SFBxSEVYbURKZWdvRjZ5UjVI?=
 =?utf-8?B?RWhqSEtEVmprano3U3ZXd2lyMnY3K1RlY1NVc0UzQ1ZQb2NOYTJHT3VPcTJj?=
 =?utf-8?B?V3JSY2hHQTRpZTFJeHJWdnFZSFVSNjNzYTc3ZXA0UDErM2RyYk5YekZUb3ZE?=
 =?utf-8?B?ZVg5eE5NVE0zaTk0TjlCelRKSDRFZzJPaXd4OE5DUTdQWE8xbjRpRUNHWUVw?=
 =?utf-8?B?THprMXRhbTh2YlNCLzdKTTRxakhUeVNWNXo4YXdWMDBIOXRzZ3Q1NmhuSHNP?=
 =?utf-8?B?QnMvTzVsbWJ0VFd6YTlKMFJtaG4yUlZueWpPTlQ5VjF1bzJDZkdJQ0V0eWFK?=
 =?utf-8?B?YnhRMUc0ZmtzaGh6SmgyeFFhU1BqMDE0eHFwcHljTkpYL295NGdmejI1Slhs?=
 =?utf-8?B?ZThKcW93U0dTazFyU25xdGRFeHBIUVBORTBpN2tTOFg2OU83VUhlUnZmNUpV?=
 =?utf-8?B?SlhWR1ZYZFEzRld3NmhUUkR0R21LK1VnK1l0Yyt4OFVBMm03Rmk0Q3hCU1lZ?=
 =?utf-8?B?M2NPdTZEU1dBVXFWcDltbTBybkI0Wi9BSVowUFczMUxsellMUlVBQlRRZ0lM?=
 =?utf-8?B?d3FwL1dOYklSSDB3bEt6ajR4QWIxTmkvTjh3V2lGeUdKam80MXlmM05PQkhk?=
 =?utf-8?B?WXVUVWo1cVJxaW8zSTY4bkZCdVN0SC9VRWdGa1Rlb1haRGcwNkZYK09VWS9V?=
 =?utf-8?B?NUlJZUtaY2pSaHBoRVZVOU5EMmZ6S09FVU1GM2l2cWhsdW5SbkI2dWI3Qzd0?=
 =?utf-8?B?ZXBudDIxSG8wMTROKzN5QkNtMGpKcm91MFhjaHhpZGYwNnY0NjhUbDFsQTE0?=
 =?utf-8?B?dE1SUWNxNUVtREF2ZUs5QlA2TjRNM29hQjl4R3E0NXdkS2pjMFRCbStKYk5z?=
 =?utf-8?B?cklDbzlRdGtDRnE5MTQrS0pXZ05PdnM0UzdJMlVUSUR5M2hZcWVpYWJYMDVI?=
 =?utf-8?B?L2xVdDVvWC9CNmJaRk5qMGc0VElmU0xHMUxROFlBaTgyL2pkRmpqbmxVYVd5?=
 =?utf-8?B?N01UV0FVeEwwM1E3WWVGWmdXTzR2SXRTZk45Z29iL3J1dFRRZ3BzbXRiOHF3?=
 =?utf-8?B?Mnl1aTZvZ3U2Y05NdmF0ZkR2cFYyZ2RVUlZlc1czYzZDYWR2Wk10aDZEVU1r?=
 =?utf-8?B?OTNudG9aaXQyQ2REbWFRWGV6dDhxSUxRQlZYZjRxQkV2YVFqcjMya1ZLSGI1?=
 =?utf-8?B?V1lMUnJlYkVtRkFGT0ZUQ1diV1lOSDF2eWtxVFozVjkyWjgxTmVDWDZWa0Nl?=
 =?utf-8?B?MVpTNjIrYWdIMGVoZVpaN2gzQlJJakFtMEpHN0U4N2FWTTdJM2VaZS9oSEJD?=
 =?utf-8?B?b3J4ZUF5V05xYmppbUpaVnROWkxEWitOV2VlR1ZpNHpRdk9MQkxFRGNkVEVr?=
 =?utf-8?B?bmgwSXErQ2FCaDJTa2tDS1VYZkFWZ05mRmVDdnJKREVJY0ZRU3hMaEhLaG1M?=
 =?utf-8?B?Zk83dVV1Mm9LMlBUUFFxU1Q3T1JrUmtPQmtDbUo2eXFHWW9aOXlxQmNQUmZ2?=
 =?utf-8?B?ZUhvclRUbGc1dTBzYW4vQVVDcUpveTdxYjUvQkd1clk0MFl1bFFtOWRVQTJE?=
 =?utf-8?B?K3ZDZVpoRXY0MTRBVjJlY0FPdEdyeUtaenhERGFnNEZXdGZEa0xCMzdqL1Nr?=
 =?utf-8?B?anNxSHRITldvS1FqNW9lZVNEeE5mRE1hL05yYUk3NGE2Q2ZVNWNpSmRVY3FP?=
 =?utf-8?B?NFdlQkxLYVRqcjZ1dXA5Y1pXbTFxOTFZSjg0MnEyUWxzVTYyWk9rRHZJOVFT?=
 =?utf-8?B?VkZYb3I5M1NBVE52Y0pzUWh5WjRRbFhZdldTZ3c2bTNucGgwN0c4WXlhYmNa?=
 =?utf-8?B?SDBXd3FZbCtOVHRHam4xZnlvWksxZ2R5NnlBbm5ROEh6VVVNNmVCM3ZyTm1F?=
 =?utf-8?B?RGhTY2FINUt6R0pKV1dRK3NiZUlWa2dKdWRmTEtkQ0lld2gzcWdVSWFCZHNW?=
 =?utf-8?B?dmJsdndObG8yZmdrQnVOUDkvM3FaU3JrVlFSWEZsSVZPODhMRVFqYmlDclJD?=
 =?utf-8?Q?EsgJ2Y?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MWZ4NnhYNEsrU1poQjFkYXg5T1FHRHJHam1CU2U1VVlGTjZPd0Q0V284dVQ2?=
 =?utf-8?B?a2dtNmpETTRaeGRkdkFJU3hmdmxKQWpXSkJkSjNJaW1IcGtOWGVwWTB2Tld3?=
 =?utf-8?B?OTdpdHpQbVRCcFRmK0RvZzhkRCtJd1RuTWdKcUJIb2MxU0FsUEM5REdxUmZt?=
 =?utf-8?B?ZDlsTFRmNjhnUnlSQkhmanh4c2d2L0ZLZ1kzUWlEWitURzUxVThRMkZHWlJ0?=
 =?utf-8?B?eUlyME9VUEZKQVpBVGNYYVdwa2c0c3Izc0lZbHZsb3hkMnZRZ1c1akJBTWtJ?=
 =?utf-8?B?cm16bXhGckFYeXFGQkZtTHFSTjB6TzZITGhFZm5wQklQMlh3QmFlZS9qdlRX?=
 =?utf-8?B?cmtISFVxeWs3RG9kRTBpVVhmenhtaGJzTUxzMFhnUlFMR3crWnZZTjJGOStX?=
 =?utf-8?B?K0ZQZnFaUURrSjkxTDFWeUVyY3FCcFpPdkNKcm9QQUJDMlJ1VlpXaS9xa3Nw?=
 =?utf-8?B?dUI2b2RuVnZQTllMRDJaYjhQRUo4U1NXMUNMbVA0OVhjZ3FVaUNvbW5BQmVq?=
 =?utf-8?B?ck92MG9IYnYvSHd0RWw3VENCZnUxUDMrNGEyVzlZTWM4UHZ0aFZQQWxaM2NW?=
 =?utf-8?B?NmpHSnJlaG9kb28rcGdqcHNmdkJLWXIwMy9FVHdBM0hvNmFwQTR2dm9aaXVP?=
 =?utf-8?B?eE5pU0FiSkJrbUMxcE9LMHJOOFpJcnBJdjEySXg4MHl3YlNXUFZQSkF2Z1pu?=
 =?utf-8?B?SDRXK0hCZkdyWTFqRjFvNXY5MDZveXY0QkhsTEVnQTl6WXFMWWgwb1FiZVB3?=
 =?utf-8?B?enl6Ylk5MEpyaW5KeHJ3RFp6S0hwa3V6Wkx2b2o0cVFVYmk1TWxhOWRLbDMw?=
 =?utf-8?B?SmNWNFB0UlVFQnZaUHowK3VJQkRIVmlGSjZaaGpyS1IzdlNveWY1eW5aODBi?=
 =?utf-8?B?cGplNE5LVTM5ajRlc204U2ZkdEdSMHROOVFESjA1MDRVeDR5UEpYbTZZendy?=
 =?utf-8?B?UjYxcnJlaTd5QzRaRWx6M1NNTFFMUk5sNXhaVUZQOTB3K0NIcXV5ZFoveWVD?=
 =?utf-8?B?Q0ZzU3gwZExoWWdWemU1aGYvcDJWaFRpS28vTVJKSlE3WmpVdG5teEI0K29z?=
 =?utf-8?B?c0kzdUNhempYMmcwbk1KekRCZ0pqU1FVSFF1ZkJBRCtFWUN2QWZyQXlhMU5G?=
 =?utf-8?B?b2d0ZWh1SWtabDBrK0ljaG5saXA5d0gwT2Mrd21FR1dOMURJTHZVdE5wM2VG?=
 =?utf-8?B?MnFMeVZoR2JMb0NpUFZ6ZnkzdkNuZFVCUTBPOGpvVG9CYm1SNW1pTjFPNTNv?=
 =?utf-8?B?cno4K0ltcWhQcmZxL2t4MlVHVXdLWG5FcjFCTDdFdEtmMzh2ajE1amtkUTZS?=
 =?utf-8?B?OHJyMHhIZGc3Z0VUV1lWd3EvbVdoTTdKVXBkVWR6RTlMRnk5UUQxbnErYUVW?=
 =?utf-8?B?SHZPbEsxLzBjcVJadW1vcW1XeTdqOU1YbU9mSGN4cUJoM1haWVV0bnN2cFB3?=
 =?utf-8?B?QzlJUlpycWM4TkEvK0l2TXh6TzRNZlhqeFhJVHBGamkydDZkZ3VKck4vNDZy?=
 =?utf-8?B?dXpKZXg0SG1wV01YVUg3bXJpejNyZUFRRkliUS9haDk4QmtMbWdySTRRd1dO?=
 =?utf-8?B?endnM1VLenUrT2RLd0p2aFFnYWpMck5TQTFLUjlScWxZUG95WnpyOVZLSFBQ?=
 =?utf-8?B?YmZCaUpXQnpiUWppQXptWVNYUDdHbkFNd3BYdXhmMGszbVVHR1NQdDhFNXk4?=
 =?utf-8?B?WFFMVDMwMGNsVmhpL0daandlTno5TUc4c0sxQUdyQzdHT1JRdDR6YXpLNmtT?=
 =?utf-8?B?ZW9zVlgrdSsvRkg1MCt5bWhDeDd6U1h4R0ZhOGF3TjA1TDFYQlZEYUhUTEJa?=
 =?utf-8?B?K2ZJOUNFVGpzQ2FCdjlwT29QU1lxaGFPRFkyVXRPakJTa0NYNy9qTnEyRHEv?=
 =?utf-8?B?YlJuUFJiVlVtVGVqckRURWMwNDRybXVMWlJVYytUTlQ1cEpkQWVDa3lFY3NE?=
 =?utf-8?B?c2lTalFLMDRtMmNkZFp3bFFlaWkxY1o4TFBxK3pEYkVOcXI1dlR5T2tXMDFz?=
 =?utf-8?B?VEdXSXl1N0t1ZWlLdWtQZ3lPbk9sSllIQ1pUNFdVNW9laTBFT1NPMTRIc0d6?=
 =?utf-8?B?SDlNbnF4OHQxRWY2T1NlMGovdjFTejB3OTJmNFYxQk5KK3NaZUpvKzdOVjhC?=
 =?utf-8?Q?VIh00k+rvTN7TQD0kjMH8YpFK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c56bfd-feb4-417a-a2a5-08dde92062a0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 06:25:46.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiWipmF+VZze7Rea7T20sY/wWjQ3wBDZqMiJdrC++C9KBZr8ZXQD44oPqaU7VRuJKwifq2THlLY5QvO8IGgRjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Delete else: block and move clock constrains to each case.
- List exact cases, but put imx8qxp/qm in one if:then: block to avoid
  repetitive code since they are same.
- Link to v4: https://lore.kernel.org/all/20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Add restriction to i.MX8ULP and the other variants remain the same as previous versions.
- Update commit log in patch 1 to describe why add new compatible string for i.MX8ULP.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com

Changes in v3:
- Correct the order of "fsl,imx8qm-mipi-csi2","fsl,imx8qm-mipi-csi2".
- Correct the order of minItems and maxItems.
- Restict all variants.
- Change pclk clock name to csr to match IP port name.
- Align description about csr clock with IP datasheet.
- Add reasons for adding a fourth clock(csr) in patch 1 commit log.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com

Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (4):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 60 ++++++-------------
 3 files changed, 127 insertions(+), 46 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


