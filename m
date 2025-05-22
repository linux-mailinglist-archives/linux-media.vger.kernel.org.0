Return-Path: <linux-media+bounces-33180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0587AC12C7
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7ECC1712FB
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05091A08DF;
	Thu, 22 May 2025 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kObw82zY"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038EE17D346;
	Thu, 22 May 2025 17:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936636; cv=fail; b=o88FfYp8f8u1PWoVsFPh7adlcOpaU0qTUaV5w/6qJ7A5L1fH3ttMXU3HLf6a2dJN6RptJE4A1G+qN8mfWjr4UNEdnEruvc1uRjNMUQjWZMEQJkqxRD97vmbR5bvtVPAXj95/Sm6PLjnJkRANmFnt1QYkoWFEHWtG4TOjAIEaFOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936636; c=relaxed/simple;
	bh=eZpdbImXpboiQbV4dgRf9tPUfet/08V2CU0FiUVwLfY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lB+doqOeqDJxl3+Rny0fEPTwXD8f1qvj85t9Uyx/Cw/KFVJHn/DZpKkNMcfK1CU9KTLsp/4xVS6DI9EmTnmjRRsIZJG3Vj2/23ZkXxHxmYBIvLbhJLClsI0ghO0CuxPyvo7mS0xsYtEoqbZpdUHYpRCD5d1/BJfeJgKDX+dnHAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kObw82zY; arc=fail smtp.client-ip=40.107.20.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBYFITOlbimFRElJb4Kk5P+ZTaBZAMXXX4CMt4dderHyIJIJRN2iYLl/longXXqlHjpXhLj8v4vbEIAHp1DFxrOu2jkelh5PQSfiBWgizLh/T9ul3tkHBFWfsrXpWGKYJccasnrX45bRirL3q6ubEMvt9Xtsj86lVjpp+7vddQ1IxmGIXEajYBl9m/Scz/pbhISI+62jtfUiJnDut2i7J5/9FNa9lUwFo11n0dm91W9M8fioF4ba8WsExsP3fPA+lqkSc43lOeBjH19yo62xIvG7yG7zNCPrGE14CmEE2ttXkg/XEuq1jTfvSdgyy3jG106vnBpmaZUitln2mCsFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj7xc8CFWOZNDj0xY+8YEP2rkK4asDaZ75PnX8kjS4w=;
 b=a6/mHYDWgtoanooxh0mAoto+C2ryTY6PQuDJtl72by/JkMbqCThN7va7QGT1f4xyXYcflM7YkGgacrq74pNiEpQubaMybB+yLmZLJ02ZXOscbC7/QcJBCCUOlG15AivElMZGi5J+UheWkGxlu0ikMAdSwMNkJ7ZiapU4Pb+YlFW6IDsZYnBaoTIO9qq2K4pbNsZoukEBxAbyYL9cSPWsWMBRFh0IN2NpUgNYNeo1C6Q4vHSMqjHvce9mjpoD9p6uWbao/2A/NTMkNXDDsymJBI/K9X/BsWjYaEqhoEDOHttrM9OMiZ2EfIYRLrjwoiDaSvgpzuSj5WJF5P5OMctHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wj7xc8CFWOZNDj0xY+8YEP2rkK4asDaZ75PnX8kjS4w=;
 b=kObw82zYkbUhkTB4m64FF8qE/TYb6WWGwzOvtPCajcxcX3+Y4efXlWK4uRf2X7dJcubLs+OMU7hYfPhB6EQQpOrdtP+z9fHxV07YkIwly60E7gMEwbvmvMU6GgDJhhN4jbslO/M/OPeMeaqlaUQ73sGsbl9t6STympqDoxzrrPYaG2iRn6LtFyfGSwp2+CgEP3NYP31tHtLthBv/YR4RMp+l6x8arOx2lUAR3Uu8Gan08yZtb0v5iL8Nw5aGzmsBDTaYOiE8FAWwUeHLvcEJG/wF1zRo39Vcmkgphhxv+OKcNFHoh+WXHZ6arit5EGYTlAZtpHNlQ/93mfgrn5WskQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:11 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:41 -0400
Subject: [PATCH v5 03/13] media: nxp: imx8-isi: Remove unused offset in
 mxc_isi_reg and use BIT() macro for mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-3-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=3023;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eZpdbImXpboiQbV4dgRf9tPUfet/08V2CU0FiUVwLfY=;
 b=osFbEv3Yqu4jULu0AckRngosvlmAUohS5fOr/exZSJJA9f69z9Avo1Zj+13l3L/Py8gM639mO
 qeOtrO8tZyRAwGoTkiFpk2hY8XzJojkPA5LJlPExJZ6VaIKt0nfEKzf
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d55c2d-d717-49cb-faee-08dd995a1390
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R1JaMVVhSmVoTGc3YW9MdmRRL1JhNkFSQ1kvVDgvd1Z4YUt4UkhuUEo5dExS?=
 =?utf-8?B?YWtWd0tWQUdUcUZUaGtBUEJSVXNHa3BlQWFWOC9rSTI1Vy8wdWxXY1cxOEdO?=
 =?utf-8?B?VjZaK29oT2JVT3NpcURJSXN4YlhLd1JhS3ZBdHlMZllFNjVqQzdieDFLOGtK?=
 =?utf-8?B?OENjd2JOWEpUY2xvZE1KWmFGQjJwZ004NGR4bElydjlZU2tVQTNvbm5TWnNz?=
 =?utf-8?B?MXhjc0ZNMEZuazZqdmt2WnE3bGZsWWVUS2EwZmVPci9CZFpJNC95dFIrbjJw?=
 =?utf-8?B?c24wYlJ3WjArNEVEQ3VIOENCYUp6V21GSG4yaHRUdSs5U0VRNnIvamRVUjVW?=
 =?utf-8?B?T1pialYvZUpZY2pwM3JBRDVGdjBWWEoxbmc2ak5tMUplendpaitWOGsxNmdK?=
 =?utf-8?B?dW15Qk82a25QSlBodFptREdWb3E0cGVtOTFlTjV1ZjQzaWZKSkx3aWJKbWpX?=
 =?utf-8?B?VHJRbzlDVk5JSytuV1lHN3M3d1ViUDhtREVBRnNsdGo4dXJxajJjblduUWtt?=
 =?utf-8?B?bHBKUzI0RHpzQ3NuOEFPVS9rY1lUNUJ2RlV2SDN6QTJwVkl6RGZQMWdRWEhT?=
 =?utf-8?B?RlJoNzh1Q0FTeGVwbkZuN0VYclEvU3VhbWphT2pWZVpRWldvTkpXMTdibTlE?=
 =?utf-8?B?aFkwZkp2WVJCY3p3ZElzbUhPQUtIdm1ac2N4OC9NaEcxVUlPUVJ2ekl2R3Jv?=
 =?utf-8?B?b2NPbUVVaDZsMnhBemRKK05VbzAxeEJnN1lRRkM3WXNxaVd2YU9aY2tkbHZK?=
 =?utf-8?B?YlQ4TU9MRk5ZcExDa3d0V3QxWnUzV09HS3JNcFdpY3EyeFJlcnI2UVZQd1p1?=
 =?utf-8?B?WXVkNFNWTDJ0MFpMemNjVlBMV0NiUnJBU3Q2VmN0VzdId01scWNHU3VESkNI?=
 =?utf-8?B?aFM4a045VUFsYkNmQlpPbFk1RzN3bWZ1UXRQLzdaZWNUZytVV3NHenNsR0Z5?=
 =?utf-8?B?RXNtKzRQakNXWk44TDYweWZyMEY1NWU2UGJvTFhjZnJhZURiMkFudGhYdWlK?=
 =?utf-8?B?cXdOUFRLZklXbTV1YVhpOGUxRGVaU2diYkVySGdiT1pYSFc4bGdqS1gwbXdi?=
 =?utf-8?B?Nm5xdXIyR0NucVZSMlhleEpzTW1zRWNqd1JFbmtIdmd1OXVhNkJLYThFM0VK?=
 =?utf-8?B?bFRtZFByMzRIdEVhbFM2c1BobXpuQzdpd2NrcFVXRlV5ZjdnVzRZM2VqdTRx?=
 =?utf-8?B?NG1NQTNEazRVSDltRTV1RXRMdGlFdytDd05JUmVTRWFWeHlTM2ladXlNbklw?=
 =?utf-8?B?eW5CVEtNc0Z6cHpsMUNXVHAycnVJZ05KMWpydjhVNmx6OU9tR0FZUERGZHVG?=
 =?utf-8?B?aVI0c1hmOTE4cFdNSXhJYXVnNWpGTzRFbVBXVEdqTng0RG1lU0lqR1dqUlQ1?=
 =?utf-8?B?R0p3ZFg0Umhqa01oczVzVW9GN3NieVhRU0dQMUV0ejRycGplZDlDLy85T0FS?=
 =?utf-8?B?WEt5Wjh0bXB0OU5MWTBKbGMrVWpIdnhGdWZod1hBTkNMSHBveEFDRFk0aGo5?=
 =?utf-8?B?eVBmSU5iRmNwT09jNlBOMlBvQWtFcHJLeGxuOFNuRUROSWdha0JlN3AxK0FU?=
 =?utf-8?B?d1hoa3J2SFFxMW1wRXRHSVZGZzhzakpqT2dlZkJmTUwrUGFpb1k4d0RGRkEv?=
 =?utf-8?B?RFlFTFZFYXd2NzBYTTcxOXkzckx0SmlycDA5eEpha2ZGM2Y5M0hNMG5lN1hr?=
 =?utf-8?B?cGtpU05TeU5LNkJTcWpvSzJvTGUyOVlKaGJFcUtkZzlmek15MlpBbjM2K1hW?=
 =?utf-8?B?d1U5ajM4N1V2NVZuSFpJamRKalBVQkpoMm53SmltM0gxeVFaRGJMbEFORjdF?=
 =?utf-8?B?VDc1NUt1WHNud3BFL0F5RUtwZmsxL1E2MVFVYXA1ZHVFK0ZIcWpwc0dEZ2Zu?=
 =?utf-8?B?RmpaNkkwaW1zbzhxSlBJQkh6ajAxUVdzK0NpWW9XcUpEUDNyQ25lRlRWQWFV?=
 =?utf-8?B?STJTYVRFaVhnbHVoWjJvYkRBRXFWelFTRXF5YUxvUVBCeEVrdlRlNlNNbU1N?=
 =?utf-8?Q?V4pnwCrCU8Ma9/43Q7iE0XV3L0cKbs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TGVVN2RjSFpUeEwxZU9aQUY1VXkzRkdtaDNtODAzRTZneTJUeUhjdGlteEd3?=
 =?utf-8?B?MUhSOWpOZThsRWZ0amg1V0pJNXBPSHczam53bzBiSG02V3hIQWJkNTgvVytu?=
 =?utf-8?B?Sms3c09jb3MweDNpdkFSbDVDYzRIZ2JRTm5YN05lMkZHTWxXRHRRNFNxK3I4?=
 =?utf-8?B?UFJqRUxZT2t6OHh4RHl3M2VlYzB6WkFEL2luK3pUdTdONFg3Qlg0WjZrQWk3?=
 =?utf-8?B?alF0amE4Q05WT01waGgrc2cxUWxsemRsOVBYM2tmNjlUMmtnWitITlhwd0l5?=
 =?utf-8?B?NjJwcFZzMmxnNVFSRi9STFIzL0hGS0hRZXZCSkxMZlJkYVhhUCtaMS9FY3Z2?=
 =?utf-8?B?ZG1ObnZjYjBIR1JsNDBmQU5UM1hSOWVFc0ZjTUtPWWpPUHgrWUJtUFdVZDRZ?=
 =?utf-8?B?ejJoWkovRlhBYW5mMlVpblNvWHluYVZycWpmak9RWjV5dXQ4Y1RwRmV0aDk5?=
 =?utf-8?B?K0JPY3NmaFJsOU1lMlU0a2NKVWF6YU9kdmNRQjQwSnl6WGxQKzRJbjBxUDUx?=
 =?utf-8?B?UW9hcHhRblFra3lTUzVCOWwzVkpGVW5kblpYa3dFZ2QyMEFIK1hpZ3ZtQzJV?=
 =?utf-8?B?TlFyZE1VVjZ2bTROVHU4U1hUZFZZTGxXbDd0WHQ4UFVIQlZ2VkpWaGdBd1h0?=
 =?utf-8?B?eHIzUnVralc4SzFHQ1hUdTU5OG83VWtzcFF6N3pEbUM1ODFXeFhSQnIrVXRv?=
 =?utf-8?B?aVZSdHAwb0o2dDRGVEwxYlBrblplWVZjNFp3K3ZuRVFEYVpNaUtGUWh0cDZq?=
 =?utf-8?B?dUlSNGN3OGFpZEtQSVNpSlFDVmlhVmV2SnlDZmVFSWs4NHJCOUpEb0NGKy9G?=
 =?utf-8?B?cUVzaFFxUjRaMG9TSkVGY3VzeHkrbnpCd0JqR1RWMlVBN0hMQ2h2NzNGcEdL?=
 =?utf-8?B?ZUdBYU1rOWcrTldKMXdldHc1b1pQTTBRRFRFeTcxT05wSjJ5eWx6bk50Z0Uw?=
 =?utf-8?B?c0taelRmT3lnTTIxUXp4NlZOK1I4YXIrelNsSEdES29jUndGMTF0eURyOXJ2?=
 =?utf-8?B?UnFTcC9VakdkY3kyb2FpMEVoODMwTEJnd09GSXJxdTV0cFNCdGZnTHA5M2Y1?=
 =?utf-8?B?VFE3a1ZwaG9BUDk5RUwwb2gwL3NBSEpSbi9WaUV0RmREc3FUclFwSVdHWVRz?=
 =?utf-8?B?WkxyWEdYRXFtdlRBcDI4dUxWeHZJZ3V0cXZkZEFuRC9lSWVLV1VRaXhMVkVh?=
 =?utf-8?B?b3VEVUtWaDVlcmFCcUVmc3pYMWpZWVhxNk9MV1kwamJQUUp3N0RvSU9TUnNB?=
 =?utf-8?B?VUlzdFpYQXdyT2pqTnQ1NVFJMWptMnN5MjJCVUFGdnJyYzFuTGcvbVFEd0pM?=
 =?utf-8?B?MEN2bk5IVWNjZ3ZMeTB0WXBjcEgzNi8rWlJwTFJTeC9pa1VtUWswQnp1SlAw?=
 =?utf-8?B?eVZqZVM0MC8rZjQyeVpWODEyckk0RnQ1VVNWUjRCOWttZ2VCM3Vmc2xVU0xa?=
 =?utf-8?B?SzFjNG1kME5IZ0RoTnR1TkFJMHRWL2Zzd2NRcUJMSWtmd2pPcVpkUXZwS0FD?=
 =?utf-8?B?M1BUVzV6OHo1Ym12aW56RTV6cTVhV3dGZmJVU0FKL0JOYnp3RzZYVncxYkpl?=
 =?utf-8?B?NE9XdWVhVW5NZjNOeFJDVW5sSjdDenVpWlRER0lmWnRuQytiVHJ3ODhkNjJI?=
 =?utf-8?B?SFlzRTlYK1pmM0wxaCs4SEcwdjF5NmFEeFhtUis1RzVuUDBPY3puQlI1eXN2?=
 =?utf-8?B?UXlyNC9YRGJFejFvZkMrN0JiZFllNWhMbWNFTzgzeHU1TklCUjZPVGFGVTRE?=
 =?utf-8?B?Q1gvekRLMTROMVZTVzZva3dMbDRwYklKWW5GZk9jVWMvN2N6MWJFTFc4dHhz?=
 =?utf-8?B?N3BiekZaVXdzSGFZYmNBSVNiVThDVlp3N3ZNb2NOYTJIYWgwM0lJU08xMWNE?=
 =?utf-8?B?ZU04WWNaVmQ4Q2FiSGFxdE00TkJUVm1EczRVU2JLeDYvWWtwdUNvL1l3Zzcw?=
 =?utf-8?B?bUNZaEdua0g5elR3ajU4Ri9DZmlyckJZMyt0T1gzTEpLQzhhS3lYNVRWa3A0?=
 =?utf-8?B?akxOOU1zZGRMcDZwSzgzb3pqcksyN0pwRFRRcWhpSUN4TUVHcVlhU2xENVlZ?=
 =?utf-8?B?NXpwaXhPTkR3SHNlYk1iR3plMTQ1RDQ1b0YwZnpWM3h5TXRxaFZuamxmMXRD?=
 =?utf-8?Q?MD1lF8k9zDsWUWkBcbXHCVWZW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d55c2d-d717-49cb-faee-08dd995a1390
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:11.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrmOfPOfgyVHWoYvOsu/4Vx0+P77U2zi6vrXghEGhbffVa8q6ZdYDUMZd5kif4qSYt9mIWoQpyOQVIZPrWlbfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Preserve clarity by removing the unused 'offset' field in struct mxc_isi_reg,
as it duplicates information already indicated by the mask and remains unused.

Improve readability by replacing hex value masks with the BIT() macro.

No functional change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- add Laurent Pinchart review tag
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 25 +++++++++++-----------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 -
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603..ecfc95882f903 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -3,6 +3,7 @@
  * Copyright 2019-2020 NXP
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -247,24 +248,24 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
 
 /* For i.MX8QXP C0 and i.MX8MN ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
-	.oflw_y_buf_en = { .offset = 19, .mask = 0x80000  },
-	.oflw_u_buf_en = { .offset = 21, .mask = 0x200000 },
-	.oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
+	.oflw_y_buf_en = { .mask = BIT(19) },
+	.oflw_u_buf_en = { .mask = BIT(21) },
+	.oflw_v_buf_en = { .mask = BIT(23) },
 
-	.panic_y_buf_en = {.offset = 20, .mask = 0x100000  },
-	.panic_u_buf_en = {.offset = 22, .mask = 0x400000  },
-	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
+	.panic_y_buf_en = { .mask = BIT(20) },
+	.panic_u_buf_en = { .mask = BIT(22) },
+	.panic_v_buf_en = { .mask = BIT(24) },
 };
 
 /* For i.MX8MP ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
-	.oflw_y_buf_en = { .offset = 18, .mask = 0x40000  },
-	.oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
-	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
+	.oflw_y_buf_en = { .mask = BIT(18) },
+	.oflw_u_buf_en = { .mask = BIT(20) },
+	.oflw_v_buf_en = { .mask = BIT(22) },
 
-	.panic_y_buf_en = {.offset = 19, .mask = 0x80000  },
-	.panic_u_buf_en = {.offset = 21, .mask = 0x200000 },
-	.panic_v_buf_en = {.offset = 23, .mask = 0x800000 },
+	.panic_y_buf_en = { .mask = BIT(19) },
+	.panic_u_buf_en = { .mask = BIT(21) },
+	.panic_v_buf_en = { .mask = BIT(23) },
 };
 
 /* Panic will assert when the buffers are 50% full */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9c7fe9e5f941f..e7534a80af7b4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -114,7 +114,6 @@ struct mxc_isi_buffer {
 };
 
 struct mxc_isi_reg {
-	u32 offset;
 	u32 mask;
 };
 

-- 
2.34.1


