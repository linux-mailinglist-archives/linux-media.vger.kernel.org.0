Return-Path: <linux-media+bounces-65139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kaucHO76Mmr+8AUAu9opvQ
	(envelope-from <linux-media+bounces-65139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:52:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA669C3C7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:52:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=UTS5kxXl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65139-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65139-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C73B308AAF0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169EB395AF2;
	Wed, 17 Jun 2026 19:50:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B838F938;
	Wed, 17 Jun 2026 19:50:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725846; cv=fail; b=uMIn2YuIWStOqDfUQSsLmzLTz0id/e+TqelpT5u6JcuTKaLIo9TDFUFW5zIxt12UMlPCrNLQH1kDQ/2s5tTddC6lJTItYWSIA+Y1zAIKxPg5yf5U5u3/v9BuEXkKv5a5VOVnXWa59eTNUirWFBpsFLEGHJh6fwVZY2CwOtmTYzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725846; c=relaxed/simple;
	bh=wgLOAzMDs9Bfbuy0AZ2zYAbhRf/wnMcO7vav0jFuiWY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DNnRwv7hJUitC+vXU/wNma/+ZGA7S3xcyonXKqXOTkotnErHs3/jh9SbX4CNAxqAQ2mpnzQv/V2NqyAqdOS68TubGr/Nb/ZfScO2TAObCcdyVwN+146sumXGEigVakWaoGeFjYHJ0GX+fGss1O+2RohP0EIskHaGHt3M80ds3BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UTS5kxXl; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plw9ZOoacua+jVNwqgpqPdZc6h9RO4mr3ujdZH/AasnPODV9GvpV6TbDEMteK0dXy53ZCgU9R6n0N8AJqv+1FgyEclcdAszz6OPSWHSbkjqHAy/pLndTrxVMK9rVCwN5C6d//DNwrT315aNNX+dR05bcwh70tipmEYS6873//XAlttgiw6sDYYCno+EL866/Nqa1+ZbnN1IkT7qYOrYv3p3NhyIXz4PpG9NB7NITsI6sL8taFNdIAEL3149bWLQni4Z4Iev3+CoyUA6izd8+kSbwiwUL/ATGKdz8qisBBlU/VitING0ATX7ktbPMZYoefLta1K97iHGTejCyjrUeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1lNmMvgNRmTFB9P5Z0JDs4+kAt0G/cdR8MRKgsnNjM=;
 b=jaJ3mZ186jf7NcBR4OB6EAHZ0bMGYF4kOcg2Mmud+ZpPvxxl2tzI7O5vL87ey5VpZCUBg3W47IAaoPwgAwEqsb7emqJpMqmVyZe01nZtfN8gYq/pTC1ipv8hdLDGdqQ43WzEv0oS+HSMFqPvUgfJmMjCquD01GTYE3UVKMHNp9+emEern3PfaneybJihJ6tUFPPc2oo6P+eCO+3riP/sCpTkxEx/JHNk2zYA/4N6HNXxEoyoiLtSsOqbmnH8y38/iI2bJbWTNRF/qUmbFh7QxzG7QCV/h4O8n1kHylQbe2LGnv7z4puO43modtZSM8qsPeDcQUe8uZmHDZeTTykagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1lNmMvgNRmTFB9P5Z0JDs4+kAt0G/cdR8MRKgsnNjM=;
 b=UTS5kxXlUPu4DKSXnELq3aXOJ1ti58ht2/gSmnRvS/73wzdsUabM2hXNBR1oFcesc1MNVvf+WCQoLzuH/bkB66e2j+DCYX3EKOEhHNdiG4VoQ4Sh5MholQYUXsd9PSD5ldfaXWaFrpkfwCv4ILV9zi6AnaPpCXT5mAY8vzVsQm1z5emSH5OkTMuWOc08khZY43Uh9S3YzOk37fSpDsXbU4pm/xLH7qSTuUYSNiqyXRLG5a2sNihnuzFJG9PVoAPg+m0Mst9FB28fROu/6S2n9KOnoMYA0v4fxyLHeO6fS/luyq2R2y97k/WlKtdPakpBEUZ9TwuzSfNRJsHSL0nkKQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:35 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:13 -0400
Subject: [PATCH v5 3/8] media: synopsys: Use
 v4l2_subdev_get_frame_desc_passthrough()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-3-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
In-Reply-To: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=1927;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Y8MR9/rSbB2TctCLI/3l3auRGt4GUXD5p4CJPx9E8uM=;
 b=JYIsRG63ho+Qth0kJfUQ1ZSFy1GJAUp7XWG8OxucXmU0zwuPihpUzbeJ3DCoodcP9B7ko+ifF
 u5klllkecDnC/bmZHYYnU5sAbG1I+ndRqQHbtwHeT+GfJ+RVvpPlY6X
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:806:d1::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: d9205df6-3ff9-4d00-a21c-08decca9b29d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 CUYFoxx1COfR2AVTmJcpXN8y9MAOCzDDUyQIm7hPy44piSy5SlVyPV2UbWHx9afan0q+0TmLzt9w7UFvsf6qbRsa5YQd6iy6Cbsi+j4P2DpOKj01j0+kOyhJGd8d5hH8K53BY8xsIQJeLY/OLcUgeZteyrlVzgiRpDmQ+KX/ulVOYRmc1V2jNTTmsNk8RExjc6rMzvHD1LLIWqD68+YY5hCdezNo+OisghyjDwkg81nT8aBbbTX6j9qT0vSphpeleC0/ZK0OO6rd2gwcXmyIbeW5vSiJVX9cR7yNEu7nLm4mJzW2kDYFt/5vZkU2I+P2rJT21HgnPEhUTJfd7mbYuqIjM8dlg58UPlQnPSMZyku659cVRJDr9qxx1hQxIz6mFGUAIeNS7UY/sw/4FvaNVITmWO0mvKEsFv48+pRXsbsKCIn/sLUzm94Ls6hu6k+OnBmmgpS0G89L77EYFDtSbs9Oo5wRVygcu2J3ZwS2upRSbxREIAxbcW32WHJRoyYdT18HjYnw9MNkZUuqn4eN806eyT27lz1fhjZwstEvyBr3kldgseficQNx4WGimp+IFVmJngfrouMxU7Y0XaF7ZrLpuJTFczViBFAw3d2OP5U73cKrNplJ4OZJlJ4uRnhYLwVOuz15yNPPgsJksNPI7F7BJ0emtFpwXNOwlTcuDZEh61Nd6SoU2bkhTYmmqB6BvYBWJSMuQPmkplLwL5TZPw9ivgqu6RrwzBEo7UpHQ8E=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VXA2VDh3d3FEb05KbFlYcU5ucDRHZW9wZFZvcVhaRUgzMytwSFR6ZzU2YzVt?=
 =?utf-8?B?VWM3T0Q5R2hIOWNpaTJmN1hvSFZaTmVkVHc3cUo1TG0vZHFSZ0ZsTEk4ZS84?=
 =?utf-8?B?cjlVTGt2SFZhdjBWYi9KS0Y4ZFNzOS9aZkZqblBPNVFJN2FSUDArZFg5dURN?=
 =?utf-8?B?a3ZzYXVWSGdUc1NKTVljQ0RBVWtkZHNHM29xaDVTd2tPM2JkYm9ZYUtCdXFk?=
 =?utf-8?B?N2ZLK2VGaFFUS2pWV0gyS0hyZHgveFJIbURLZGpxS3kvSUg5UEtwZ3BXRGV1?=
 =?utf-8?B?dEVlTlhvTGVqZ2h4bUk2NFUyVTh4Skk1Y3BvanpWT0JXbGMrYlF0ZHkwVlV4?=
 =?utf-8?B?SUJTaElqbEVhR3pWWnhqTC9YQWNmaWRZY1ZZRVF0TFlOeDJpb3JzKy9QL1ZP?=
 =?utf-8?B?b21GSEVyWG1mZDhEUDBadG5jUzFLQWFmNXd6L0plRUpkeUZpUFBIWmRuNllK?=
 =?utf-8?B?NUhabGRKUE9EZ3JORFdOUmlkKy9NVWhxL0tBTXhKQ1ZDbzdwVG5YUEkwcC9n?=
 =?utf-8?B?L3lVcU9PTFYxM0lzMXJ6RHpUR0VKclNGbGdyNjltYkw1ZTMwVUtHSUhsVmwx?=
 =?utf-8?B?M29XM2w0TTZXcm95VkpXK3gzcE5yMHVycWN3bWpXUVBpdHR6bGplNDlCQ1px?=
 =?utf-8?B?MDc1YUJPMytzOEJFbk94dEdWajdCR2hXMnBSelB3Rk1DZ1ljQjNhc29rMFJI?=
 =?utf-8?B?LzZ0MlVIby8wUFVuMzBFenpVaVAxY0xWNDBmUzQrOUltdkoyYjRDTUpBaUZl?=
 =?utf-8?B?UlJIakpheEhXUnhYSlhyMTZJQlpjRXhnVWNQdXpXZEl6U3dHSTlHakRqd3M3?=
 =?utf-8?B?c2YxbkMxOGdOclJCOVNZalFnNkVUOU9zVzlXbHp5S1NKR2YyQ0IrQjlYNHQr?=
 =?utf-8?B?YnFLY3JOTFJkM2dLTEZxVGN5QUlXeUFyMGlxbTlJTXc5b1pTTWYxQ2RwYzlB?=
 =?utf-8?B?LzBLUW5oYnFFVWN1WnBqaWkvOTlYMzZmSk00QWI1cEdxVktWdDFyK21UTFBx?=
 =?utf-8?B?K25CdEdyK1Qrc1pQRUtVMHNPRGM5elo1c05jMFp3Skwya0s4Unl3MDNZTTVF?=
 =?utf-8?B?b3lKVk5uNThVNlpJOTl5MW1zTEJkbFpyNlAvQURJbmk5TWk5V253dTRsTEd0?=
 =?utf-8?B?clFPNHJ4NXZNQUllVnIrRzNHQTYwWDk5Y1V5aWxvZGNRNXRGWE5DSU13Qnoy?=
 =?utf-8?B?TzYxVzhvRTFNOTlQMXJhbGMxUEtxSEVFcWdLamlKTDJmYVI2c1BIOWRzNWhG?=
 =?utf-8?B?N0pBSUxoaCtYQy9MMHV5T2xHWjRFTTNVc3BpV1BhVmkyQ2VhemZZN3lxdlB4?=
 =?utf-8?B?d2xpYld2OC9jdDJCMWlnU1dsOTlERk85cWVuaUxZamdnRkF0alZmQUFEOXFS?=
 =?utf-8?B?Rk11Yk1pbFZkaktuYzNqcFdzaFQ3UlN5VTY1cWxQUjRtUmt2U2Zkc2ZjVDFL?=
 =?utf-8?B?amZmbk9lWm1hTTdSZFVpbGZRZng3a1o1amVvaGUwOGVKV2JEOEtsVnVmeC9E?=
 =?utf-8?B?UlUxVFNaSWcxdm5UR094MlFxYVVqSi9QSXdoVUFQRGMyQ1pLcU9XT0xrcUxQ?=
 =?utf-8?B?WGNXaXRtSmpsMW11YzZNTjEvVlFwWDFoOWFXYzJ1MFZ0MGhwdU80MmtVelpR?=
 =?utf-8?B?blZIL1dpYnlRczFmVHA1VDB6TE1ZenRBamI5R1RvTEx3eDM1MTlRVzl1VVc5?=
 =?utf-8?B?NHh4d1RSaUx4S0FQNitBTGFRWGNQZWFNcDFPWTYrWXhUYnRNOXZyZmtQMnFs?=
 =?utf-8?B?Rkl0cVF5SFVjbUQySU16d3Qwa2cvS2NGUnJ3RzRFQVlFMmpKMWp2ZVBBL3pz?=
 =?utf-8?B?RSsrL3drYS9VV20xMElpWU9uM2ZmSERQV1k4ZU5OUXc4Zm9iRXUydDArYVdv?=
 =?utf-8?B?aU1zQlBjV3pVRXNzT01JdExTUW5tcm4xY1llbHNiN3k0QVBodDlJVW9IUlQ1?=
 =?utf-8?B?ODZQcmxsb3VVL0xKTHowYzF5eGtYSDluZ2kzU3dwNlhQeHdBQWorb1JjRGNT?=
 =?utf-8?B?RnJ2YldqeXF0SzdDU09QZUpQblFwS08wYUdTYVliZjRCcnVva1RZL3hIUSt6?=
 =?utf-8?B?cmdtZmp6ZTNtOW41VitHdjZGRUJwcHI3SnIxUXFSWHgzNmt1VzNzajlTaTdj?=
 =?utf-8?B?WTRhR0VYaU5UM0xMazBVT041N3VkSWpmM2tjdzBMNUNQWG8vaGJsNjh3a0NJ?=
 =?utf-8?B?TFJiT1RxeEpueGxyd1FBbmNlNHNrK0szaUhGcGE4NnVzSlNTVmw3TkN4Qkhq?=
 =?utf-8?B?UEpLVnZiSFFSQk9qYVFINkZHRzI2aERoVXVOU0FYUnlNUFVyQytsa3ZidWpk?=
 =?utf-8?B?Q1F4WGMyUFVxQjhWVjBZVVh3RmVhK1dHQ1AyR3l5dWFlT2NuZHZ6UU91SXpM?=
 =?utf-8?Q?Ry37+2qgTol9VZWcK2MSSlYbIC5GWdUdIT2ze?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9205df6-3ff9-4d00-a21c-08decca9b29d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:35.3080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCW9BW2pPb9hRLJTAZYFPXUu3gd55mii2j26VHO6GCHeT1YlT8glw8+yESZ57hC1YE4UV4rV1Prcv0WtCmmVa20qsbS3PfoOApNf208bJkc/Qyblqu1iDmpMqfPYVxtu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65139-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9DA669C3C7

From: Frank Li <Frank.Li@nxp.com>

Replace the local frame descriptor callback implementation with
v4l2_subdev_get_frame_desc_passthrough().

This helper provides the same functionality while avoiding duplicate
code and simplifying the driver implementation.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- new patch
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e5..f51367409ff46 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int
-dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-			      struct v4l2_mbus_frame_desc *fd)
-{
-	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
-	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
-
-	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
-	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get remote source pad\n");
-		return PTR_ERR(remote_pad);
-	}
-
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-				remote_pad->index, fd);
-}
-
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
-	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,

-- 
2.43.0


