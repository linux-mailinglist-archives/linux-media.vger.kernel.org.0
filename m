Return-Path: <linux-media+bounces-62702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIvIHDsEFGpSIwcAu9opvQ
	(envelope-from <linux-media+bounces-62702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:11:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C013E5C77CF
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2753D3033D12
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29783DC4A9;
	Mon, 25 May 2026 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P99Sjwcf"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878D3DBD4F;
	Mon, 25 May 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696605; cv=fail; b=RHOazEUc0j3B6Hbm4slX7spMwWS6Yif0bU6pK6CByPR6X9gYNo43TdT3k3yH4wV4yFB7/wfn+rqikdGVr3D7hFCKJ6iu0SxWgN6gkRbHeQcchezR9qRzo1jPkP8b3nV+xrWquC7zIbeXsLdv2SUIWIMqsYyuTgw6iZa7E0zAY4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696605; c=relaxed/simple;
	bh=H+YPO0NkqoIW2PxgwO+XpELbuV2QZ+HJGutU/ndyVjE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gKXE1ZvAKtk7EOGKfc2oG/0L1B5v3nbAYnvrvVXBLHRPNiTs8UbrFcyBsvpSC/TJZHJe6KHh4/T2/bTJvy2u2vy/LCjv0v21NbYCUXngs47vA69XkD/84KeboaWhqgZb3NNEV+3xZ3Q8luAd0joHlwjPQUOH0oIMyiI+XOGcxv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P99Sjwcf; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMN7AN8WkS7ZxhfRyJ0muZqCh6DcSoennDtjzFt4wXeiVq5MPH58ltbUzTCPTQdwMoQrhFKWvhSd1ctHsBL7qUEV4u2F4LFdIou3Re/ztzEfBlHNQCWCRq4a1fgifvSCiJlyMtxWydCLhPRX2Q6O+/8K4k+UZhYI/mbngSHvHynoMKK2Cg/D2PHZgvlY/615+xVHmw22T0XCKyT90a+do6jnbWtKB7H5jshPosy0N1/ZNjGNMuxxQ/cB21IkNCMASPbIFtSpaln7rDFxPWMORRRFCuSqBBv1of9IZKG4P40z4i9FutRjc4bJHksmUhi1oYnnB5mInWrCnsv5wYSnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rAEWsnYFf4rOjAwtZoqKOkEpeJSFG2NiYO8YArb7yI=;
 b=Rz6XoTw4c4oPFtUAPAjWuRlK554NnNVW3jh+vy47/w84JHudpCiL/iHk5gpsrks5iBzBGQgbIauKV7RmETA3C2zqnDgV0BWpES4LV6yTHHeADJkKzfQU1CTzabotplMnruU9oADpK7GDxUmhZnQEE5poWNMZmJIlvydBfUIxOpHFzjhWlLByYh8eOci8zshwj2rsRvV5sDPPMrPEUEqYMgBJJytU7iD0Drmklr0OlaqVA/KKO6xeJhd2fz9o12fbN+d5U6KiumL0m3h9uRQYm1nwXtKdbcfbjLo4hxALhhSHgGqY+O8sQUwIflDY6w2G1agHfYZF9y7D+hDxt+QoOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rAEWsnYFf4rOjAwtZoqKOkEpeJSFG2NiYO8YArb7yI=;
 b=P99SjwcfFXHxEd6UQ7tUqVMu8ZtReNz3mJjXdroiss0lY881wGOxqZPaeKDmd5+cfCP3KVGtn7qFB5XqfYIsTDj3NFG3pnOvYaG36pJPeAA6ARCcKwmYkYEQ43hvrikyBHYS+D6t1fkp48mlOQICiGhlfu0i2L5LEGZ8W//C6afrFLQlphwPRAXCHyiAi78BSmp2fr/iLP9BmnLnLb54EBXPLgKenAX9j4QHvhTwVXcoe1xSk0tWhGLgEmcVbHyv0DjhbNK68T0XGoCj4yUo6La1xeNBLERRZhBQ5KLDbdMPZQc+YSab6lH4l271+GwN920hEwy0ph1ysB5ZyDHjDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB12265.eurprd04.prod.outlook.com (2603:10a6:150:30f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 08:09:56 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 08:09:56 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v8 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Mon, 25 May 2026 16:12:21 +0800
Message-Id: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUEFGoC/2XQ0WrDIBTG8VcpXi/Fc4xHs6u+xxgj0ePqRZuiI
 XSUvPtMx1jiLj/h9xd9iMwpchavh4dIPMccx2sZ9uUg3Lm/fnITfdkCJWoA1I3L8SOM6dJPE6e
 GyWOngLxjEsXcEod4f/be3ss+xzyN6euZn2E9/SmhVFVphkY2PHQM0Jqh7fh0vd+ObryItTPjx
 oKpLRZLCGT7YCWC3Fu1tV1tVbGWrPTkrZEd7G37a0kCYm3b9d5AwfUenFL93uqt/fdeXazXg5U
 qWDJD2Fv6s+Xfa0vFSpBoWQEyDqcx5+POm623tTfFa8LBaKm1YbX3y7J8A3g2wa4YAgAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779696771; l=8563;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=H+YPO0NkqoIW2PxgwO+XpELbuV2QZ+HJGutU/ndyVjE=;
 b=D2lDwBc1SrLiiHOvqd2piuIIUuxp3kRQuNyzuuWy1Y5H8q9ihFhp3JVyWoiqQx4/AkrJRqwwn
 OhJzBrFajgwDtDsDJa8qhC02SqxdGei5seyf/tal5nkKVNcIWf+Gzva
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:295::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB12265:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f00c5f-aeaa-44f5-1ae7-08deba3501b3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|921020|38350700014|6133799003|5023799004|11063799006|3023799007|56012099003|18002099003|7136999003;
X-Microsoft-Antispam-Message-Info:
 9LEZfXxATqDQCdOQniFfbS+c8ly3gk5M8VT/MbDGGKzE9q93+LFOVh5kzuIDlFxcXc9VL3Ygu1BSgIdcUgAPgmB6AighYAaEzMr8SUU08zqRLOe01jo51LEw6/VaGMfktDvjrvDiel1EcZQPvoLLO+brw2Hs7YGPBfjZGxxcCQenFEEP7LOHBvhPA3k8+wYKEJsbbBwjjgrsk+t54xRjKb9HjIQuZluXOpEnv25PWP7J+sOf2ikHRXS+ORvyDMTj2wg8Ci8POmIWQn3F6OmWkf2WC0zWzGYWlIAfN2tMAy5LldkUQweQxXjzQm33s9wR9452bzAmZy7SCPJ8vu6skxsLEHJMUXn7VY60lMuw1/368DnZn1hVSbTCvlJwDCHdlNafeFd/DGgfkv4sOO3YDoWwvOzcSds3sSnqp7t6RvHAutX6BSG8A3CyuTq61M/S9LtmkhVg/7PWN4ScxHYbeRIYuX0gXYD7nuN0jndxTlxsKz1zgq6ysK4Kt6e/i/2a6ZaSC+WH0m+xibzMFtO3ddPYOpwDo6yQDStyk3VsBx8bNKDjXhJte9a+Z2ynObFtmGHElY1ZunOCBAhGlYyJXLEjjPocH1rzrWW+WSvnPpTWHLiYF5HKL/4ySsUmkPVYczis7W9HM6tFXKiSTA3SbwPkBJgXDtHwTPnQwAuGGWjGGFdPXBtiQStuYM0IM1LYRyWcKBlnXg1Bl2Y6VWBCuLNQ29NP24O0sgdTqnt7l6SPxFD8YEm+cdWSE0fua3kkOLaa4ojAHVqMP8a9+QTSww==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(921020)(38350700014)(6133799003)(5023799004)(11063799006)(3023799007)(56012099003)(18002099003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UDlvNVB3OUNIc3d2WEI0OHo2WWpwTnJHMzNRN3RFZE5wWi9LUU5rS2hnWW5y?=
 =?utf-8?B?ZWwxU29iVkV6S3lMT2NSdkZOUmhJcEYxVUhrQTg3TkQybVplRkdJNTVzWERz?=
 =?utf-8?B?TXd6N2txVFh2TU85RXZEWVJHbkV5bDViMVNrUEgzSnNKWnJacW1oQ3hYbkFJ?=
 =?utf-8?B?a2lnT3d1aGMyUVdoUGlFWWpYTDdhTU05WkV6V3NmOXhaVkhZNi9XK2FtY1Nu?=
 =?utf-8?B?dmovTFJFY045STNFUTk4Nk1oQ2ZsWDNTVmVjMmJHb1lFRzdrZDJUZ05OSEZa?=
 =?utf-8?B?MG9peVBrcFNtTGRPUlV0VytaLzUvLzJwNjFMTDQ5Z3VBM2hQa1ZsblFNdGd2?=
 =?utf-8?B?OU45dVN2VDFqYURDRjlNTTVidmF2YTFWSktJTVo2TlB6VENKbHBOOTR4bDgw?=
 =?utf-8?B?WUo4VVRiWEZsTHdjd1dEanhFVFZGdzNwNmdMa0NVZDRjWlhKQXBYMWkxVHZt?=
 =?utf-8?B?Yk5FUHRDNG9MNkhJbk5YbGtPb2xiY2U5ZnVjdFUzUkJsVW5OaSsxNU9iWWt2?=
 =?utf-8?B?MVpkVStIektxLytLQ1BkU2pOUnA5TS9rbUNpRGtFNGxlNXVXa01tOHZHZjJh?=
 =?utf-8?B?cTBCWjNvdVZ6d0Vmb3EwZ2dGQ3NHSXB4S0FaRWZkbnB1OThxVU05ZzI1QVlz?=
 =?utf-8?B?bFVnQlhmWmFuaUFYWkdTVTZyS0JPVHJRN1Mva3R6U1hZWk1xdFVEQ2EzOXh4?=
 =?utf-8?B?MWZ6K0pSYk8xOXlqK2JLNUZRNUdxVzRPUGc1MElqQUExU3JtM1Y0UHBLdndM?=
 =?utf-8?B?akdObG9KTGxWWDZRTkV2R09ZOTJ6a1o3a1RUellvUUh0NkZsc2VSYU00bHJs?=
 =?utf-8?B?Zk45UDlEeDgrZVU4Vi9hVmdnZnlXbDExVi9KdElFOGVHNzVicWRpbmVPb2Zh?=
 =?utf-8?B?czRJVUtLYSt3MkJsYUF1cFd0R1BVS2xyNHFPR1ZENnhRQTJTU2VlNmFEaVNv?=
 =?utf-8?B?NlNsU1VMZUhQYURPM0FjOUVEdVY3ZHlFVHgvMGswdlY0a05TVHd3Zzd0M2RY?=
 =?utf-8?B?WU9xNjFhTE1rRVVJNEZhai9FSlhtUHQyMlNEYkNoQWIxbk1zVTliaXVWeUVu?=
 =?utf-8?B?Um1SRWVBdUtab2VuY2Qzc2tVNzd3cnA5eG1RVXVKMmlrQUhpWFQxT0o0eitU?=
 =?utf-8?B?TmJzNXJuV3VJdGRtVEFWN0tucXBZN3lLOXZ0SlRwVnJxK3BaUmZKMGNvUVhv?=
 =?utf-8?B?K1BIU1JlOHNYK2R5ZUsvMFVOUytzMEhrWFpoUFBtajVsK2dDWVpQU0pMWkVC?=
 =?utf-8?B?WXpGbmY4OTBWejhuUEFITXRzR00zMmJDZlJKamJtVEdkUkJKQWp6RGtVRXUx?=
 =?utf-8?B?Y3hlQkN3S04wMEhlOVdEWHBQQjJrY0w5RVV0Z0JlWHMwMWZ5cEhjemJZNC96?=
 =?utf-8?B?TldISnFDVXZ5SGwzMmVteWRtK29XVDJha0ZFZ2Exd3gySmdOMWFPNXFaUjlR?=
 =?utf-8?B?aHNrWXJ4b21CN05Dc2hBcGIxM3AvdStZM3NwSXRseUIvOFJzVWtZN1lQTWho?=
 =?utf-8?B?Yy9BZGNsdXVEMkMzSkVmWG1aSWE2U01kVmpveEk1RDNueUpCdFZtMldFZVpQ?=
 =?utf-8?B?UHViUUoxaXFxOHlZcDhSZTBYbStrdDd4cFFTWkl2MXpualk2MDluS3UzK2Vi?=
 =?utf-8?B?L1JKZUVCclJWa2FEYUhnbk5ZVXBadXJQaURVU2NDbWsrWUVlKzlNcXBjRlRn?=
 =?utf-8?B?NjcyRWJFN2htT29pUGNXMnlkK1I3Y1V5UkJydmtqTGR0WW5OSThubmkvWWlP?=
 =?utf-8?B?RmVsOS8vSkxRRWtkNVBCUi9TMnR1Q0VFWUVCZDdmVnpFTjljVm1nZWJOMmI3?=
 =?utf-8?B?ZHROWWpmRW85UFRFZ05mK05LSnNaeUZGYzdKQ3YvN0VnSnFYZlJQcVA1SXpP?=
 =?utf-8?B?VDIrdHdWRmxLcGJUY0FaUnFKd0tUMW95RnN6VmFMNnR4NFN6VmlnckNOdk81?=
 =?utf-8?B?NHg2dDJ3NTdiMmRTSk05SXNpMGF3RkZ3dkpsN29wWlVIZzNmc0hadkhvN3Nz?=
 =?utf-8?B?VGlpeVZmRVlwVTE0d2Z0KzhCVVJpZ1QxZWNqTlJVUi94WnRiR3VnMU83bUFP?=
 =?utf-8?B?cVFPRzBkTU5hY1hyVER5bjFZK3JGWHoySlhVS2tKNmVoZ2w0dEpiZzhBMGl6?=
 =?utf-8?B?NllXcDlndThZY1ozczZham8rTXpEK3o3dWx2UjE5TzhGQ010MEgyNHdjS0Ju?=
 =?utf-8?B?NGEwVnpaL3poZ1VNckZXeXJ4dWlraUhTR1BHaEUzeGhITXRKRUlnelpOcUZG?=
 =?utf-8?B?UXlwK210R1NtdXZmeWI1SkFQSHVBRFpGaGUrMG1tL1JManFLcmVkZlR4TGQ0?=
 =?utf-8?B?S0VXWi9mNnZ0Z25CN1lCWklnZ0dSYnNpRkVoWXNoY3JELzNlWjdVdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f00c5f-aeaa-44f5-1ae7-08deba3501b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 08:09:55.9384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yam640ajxt3/0avLkEfRR02YZqnKR4KuAk6uXBlM+VJa+Mp35pd9jq1kK60YzHIafvRP7h0A3tYa/MsxAetcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12265
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62702-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: C013E5C77CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 7.1.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v8:
- Rebase to latest media/next
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Link to v7: https://lore.kernel.org/r/20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration
- Link to v6: https://lore.kernel.org/r/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com

Changes in v6:
- Rebase to latest media/next
- Update v4l2-compliace test
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
- Link to v5: https://lore.kernel.org/r/20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com

Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  92 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 757 +++++++++++++++++++++
 5 files changed, 872 insertions(+)
---
base-commit: a3d78e74dd3ed04797ea351edb7f0a19b961c063
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


