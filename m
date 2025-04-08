Return-Path: <linux-media+bounces-29688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A76A81808
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA970425E06
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1076258CCE;
	Tue,  8 Apr 2025 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ir253U0H"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3F2586EC;
	Tue,  8 Apr 2025 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149281; cv=fail; b=NJd6tJjE9VK6fSwhFpw/jIvig77bTHTqJRlwDBORlnnWh60H9ISqWN0KSODYUgCgKXJtrxg3y5LVitRo3+b/hXMSKX74X3eK05O2OebemK0UNH0W1p7ihd39xxRCfDn33TTUXSYphihvKsx6ANnUue1QG78G/5W5Oo/WHdWTuFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149281; c=relaxed/simple;
	bh=GtmsxC03RxLq9WteRSAOzGXicyQnYIuxWpAMa2Eu620=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fNx0ls/m3RyLpjXKMdf/uGi8azTHEu93oJw7k2d2mto8yts61TD+rKVPHAmxjiqBzbXWlx7bznbCIP0cKXItIBECOSvADXFK3scBG9gplN0f0y+X4lx5PfRGDE1E1Q3ARn77EqXX9r4JOJybdRKlV2onpe55mfK8l5BQg9Px558=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ir253U0H; arc=fail smtp.client-ip=40.107.241.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlLsVwY7BvrWM/6K3lKNUHG6XV6LCjkoYD0MDRd5z4pkWOdD44WvEI2Xvkc+2vaACNdulFFySaO2A+LNJ01jnk7PkV1XqwEk1wP8AjUbplrMPqW5b16E9Sd9RsYZhiprDwu3P6uGuwygbb02S2Vpgu+F/IBvMq8hPay11oPRaadRa+dyLUKGfs5LNX5APoL/b0ADOfzL2fueo013jipa+xjQNgShBaL7M4GM12enZ+keSFhxLAR/Ek9GBMaALwJGHaasCyrfqnPt96P2jdjLAibpcGPl1XmIGACcpO8PQyz7Xo1ufkBwOdQ6rOGSbXYKsreuXqoDSp1DwrMVGk4k7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKc/xl1ev/Xgr5+VylYYaGYM3luxXIPPdyAYxRjwX10=;
 b=WvHnfhm1/eFymcOe0QDr4hdwB1jXxuwpdSPxr4IL0QntI/HpVhsjj7CsGgSDXhjL+fgdqmJEu4yDUSW+onmQxF2IlM7aMjbPbz0JrO6RTnTz0b9Glio9UKhs++S9k64k9cno9Lt73pq84NDvkZPYsIFlZconQwQz/905sDyTE57f2Q9q65YjQG7VUldZI3RDw7LL5a6Oh+Gs4eQnvMPfajntUcpt3cSBRVHkh2EmIfg0Y0pkED0F8a7s6ip50FKD+bA75urrtQVZVFyU2kvykYnIy/mB9MiYAcC6YaMrj7lH0keEiSrihpfeUX/FLVaXKfJRQYE7/l8ZjriPTiQybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKc/xl1ev/Xgr5+VylYYaGYM3luxXIPPdyAYxRjwX10=;
 b=Ir253U0HLGcFJCO5esWZKfcik3z/WcdlEk3hJI74UpLCFg9KAQq6HzGZ7VOndDcJLoU6dYnOuulvYOQWopeTUAo+C1Run44OCtGm8wD1zPzZAnMlWvHqZCaRpEdcMUNgcS2C4lc8xQwYe7/jAUjJZYEreLnHN53BkKV/fAnZBupPrhNtc1OCtDIY23ToUOrYb+rEnD7O7gInmmaSwbzXECHyZND73COrLRtkAd8f6+F0KWRXoauq4xLhPV/JrMwjVXMnaoL05ChtX/aVSE5FjOVPZag5G97YbyQa1nWcCW1WafzjqJ0+QreOGXsqqB0nB05wz85Ow2i6PU+SaA6OWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:08 -0400
Subject: [PATCH v4 10/13] media: imx8mq-mipi-csi2: Add support for i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-10-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=6039;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GtmsxC03RxLq9WteRSAOzGXicyQnYIuxWpAMa2Eu620=;
 b=xiuaornq99vq6LrHG01zzPwSjlrezxFExFvpuZ1mJToSTgiD0ttd0QB5MwBWVOhcLpYJ1Eset
 M1+K/Az2sTKDyhp1/2M06CvnDDHLK3FjQV0h9bnK6YbNYomQ5QjuMQn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce136f8-07d4-4763-412e-08dd76e7f3c6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bkE3ODZjbWZzK2gxajM0Sno5VHhsd2RkWjA2dHVBaDJpY21sdG0zcHVhNU9U?=
 =?utf-8?B?VXZmbEN1UEJtNUJYc0pmNGN2OERVYWw0UlpqSTNpVG9YRE1KdTlWTGV6M1Rz?=
 =?utf-8?B?RXNJTlJKWjNpQnNlVzFuWmh4SVR3S0FDSDNYZ0V6WVRRbm81bVZHdjIvNzVk?=
 =?utf-8?B?czRHQUlwVk42SXJKWXlkalpMQ0VFUkZqNTJBYk5od1VrQjR3MkQ3R3hMNUhB?=
 =?utf-8?B?VkJDRDlBYXJQN1o3ZlQ1UmJPdDdhS1JlQnVYa25pdFExUkpnSDg4enVlVmdk?=
 =?utf-8?B?RHVRQmRuTzVGeXJyR2pYVDR3UzE0dmlkYU4wYWZXeDY0ODBrN2J0VHVmSGRS?=
 =?utf-8?B?Z1JIMnExS3dKKzN0T2JPcDVVUzhXZDREYjZkSGVSdDNzMXhWU09oWlh3SUl6?=
 =?utf-8?B?U3oyR1ZvNWVLSXI1ZlRFWEtzZWdaRG5lRU53VStNR1JsMldOQTNnNVdETzRi?=
 =?utf-8?B?dmFMaFVuNEQ4UDZyZ2pBUDNmbEVFV3k3aXFReVp6Zzh1bXRMRGhoUDZLdzRP?=
 =?utf-8?B?SHFMZ2pPbk5EN01HSWJrdkxQaG1kZlpaOGdzYS9vWkNhT1I4N0tEVnkxWmg4?=
 =?utf-8?B?b3E2STRYOWZEVFc2alV5MTJWRWZlOGUxUCsrckQ2MmdUeEduT2gvNm1QajhR?=
 =?utf-8?B?Wlo1d09HWjJ2R2I5Uk9OR2sxNUZPdkFFMmNlUXpWQ1ZCcjFUeW1jZkNrcThK?=
 =?utf-8?B?TEJSUisrQmdUNE5ncGhyWFhTVlltVkhUdDNmQmxRaE5ISWpvWlJ1MU5NWUlr?=
 =?utf-8?B?VklxdnNmTkRBZS9mYkJQY0txZ0xPYVE3S1BBejczODQ3aXg0RlF6YThpRW5n?=
 =?utf-8?B?QmZCVGdOelM1bm0zcGZBbTVRVndOOVdSTnIxSVpaaG1DZmQrcjZtTng4OTFU?=
 =?utf-8?B?cTdINXZtV2Irdk11aDdCUmZjdDdvMVlCWmN0WnJXcDRyZW42b1RPY3d6Z3cz?=
 =?utf-8?B?Rk5kRmVMTzYwWk1MOXhRMUZjVlRUcmRQWkptdUJTWTg2MmY4dUx6NjlTKy95?=
 =?utf-8?B?WmFaQVpKT2FkdnlheFpuZWJvaVB0N0FqR1F3OEtvTUQxK2svcS9MWXJqNG5L?=
 =?utf-8?B?U1lWTmxyWXJzMDBCaGYrQjZibC94L285RW9RRUwvbGtDc3JmMWZaaGw4Nk1C?=
 =?utf-8?B?SFVjMHNZWktvNnRwTDEyb08wNjdDNkJldTV4VmhjVXB2L3hpWUh0K3JsR2Za?=
 =?utf-8?B?VXpJbUdkcUdaMzZMS2RqdTFsM1lrWUNBUTVhOXJFeVBhRDJrekdSYmE3dUtV?=
 =?utf-8?B?SVBxM3p2MTh0TzBPK241WS9ZVTE2T3dQdy9haVQ3UkRIaHhYV21BUlZUWnFs?=
 =?utf-8?B?SjhGUEhnK0NPR3NSVDZKYlNZTXZPVG1nV0hZcjJMRlhRLzI4RkhqTzVkTm1z?=
 =?utf-8?B?dEttWXRlRXo2eU9KSW04aGFBZGwyUDNSSjBHcEdsTVhRTnFsWUV4ZnNRdjQr?=
 =?utf-8?B?THpzc28rT2R6aVJLYk13Unh6NXlVUG9RZGVGN1pCU1NRd2hLSmRaSndlZ21m?=
 =?utf-8?B?MzNSUExFc2N5cXlETkNqc3B6Rk9ITnI5MlpsV2J6S2NkNWpXUGNnN2prWmQv?=
 =?utf-8?B?Q0FidXB4c3NMeWUyZ3BRcFdlbWdCeTlmRGJRek1lVTQrSHVEalR2cUU4OVVL?=
 =?utf-8?B?dlRFRTVKWWZmRElXMTJjN2U1UFY0N29FdkpOdUo5cE11NEhjbmZJbVdwVGNG?=
 =?utf-8?B?Q0lYL2FlYVBSbnBNZ1pxaWlDQ0pvWDlEcXFrNU1KVTA0WFdienRJN09UT050?=
 =?utf-8?B?SGpXMml2V0ZBRTFJTTNOTUJDTHpKSDg0bi9uVDZ5Q2doSlI1dy8vU3ZGdCtQ?=
 =?utf-8?B?eEJhTHpYNTZCN1QwWTdGK3doRXZVcDk2eXEvUE1ocXh0Nng5RkJQRktkR2cz?=
 =?utf-8?B?THhRb1RBaDJocTM1SDNzbFloWEdxSWpMYkxvTXhNcjJITUg0bHFPQzRlVEho?=
 =?utf-8?B?NHNGaXMzVVhCZmM5cHBMVFNLWGVzcjQ5SGlwU3NIVFkvSVFVL1NPVXV4MUZt?=
 =?utf-8?B?UHVOdlRQNTZBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aGh3akYvZ1A3U09GalExN3VteGQ1dzV0MG1YRjFTYXVVVVE5L0ZQNUtZV00r?=
 =?utf-8?B?TWFYa3podW1iUFprZkVTV0VlZWwvNzNnTFdKcm9iTTBFSW5hb2o3MVE4QjE4?=
 =?utf-8?B?K1ViMDJMRWYxeHJpK0k2SDM5SjNOcXM5NWpOam5DMlI1WGRpcDFFYW1DNGt2?=
 =?utf-8?B?a2R2RGRiY2V0cWFCanprODVHeXVTdDlHaHhxZlpGWlJ1NHpjRFgvN2xMSm8x?=
 =?utf-8?B?VjMwcWl6ZUhneC9hQXloVDdGNkV1RkdncXBLdXB2NkNoRkZTc2dYRU5kbEVN?=
 =?utf-8?B?cVBBeXZPRUdBckRlQWtjOFVqYU42V2JmUms4d3RpYTVBOXFlYW9CdDFidEhT?=
 =?utf-8?B?Zy8zaTdmWlRPV0RMWmliYkNRcGdiSHI2bWhhbGQzRHV5eEpoT1U0eTlnSGRR?=
 =?utf-8?B?QnpCdFBJZ2p2aldvTHgrU2IzVHlFZTZBTEJxNW96UEhiV09hMlVrRDJIeExk?=
 =?utf-8?B?VjlDYXhaZUR1R011U2Y0cjB0NmlrQ0tYc3dSbVlmOWt0a1NJT3puWDhXQ1V6?=
 =?utf-8?B?aU43RlBhL0V5c3c0NVozc2hIeGVmd2kwZUkrVXhITzEwU090cnpFczBjVE95?=
 =?utf-8?B?cmxSQllFL1pHQzd1bXR6bnIrK3dRL1NYNUd1N3EyQjBobTNPV2FOT3daK0dX?=
 =?utf-8?B?Z1lyamZSaVFiWDJIb2dYVTVLaWxoY0R5WFprT0EyRFNQdjEvamJHZFZGaWRl?=
 =?utf-8?B?b2wxbDMvY092NVdLNklZbndNUU9qMWdjQUJkVzRBREN2eDd5cVh3dFpEbFpX?=
 =?utf-8?B?K3oxWW9qRDJacisxdUpDUysvMTN6L0ZHMURZczNJTUJoaDA0c0w5TzhvK2Np?=
 =?utf-8?B?enNDNnZVMVZmTXNHTVVaTWZ3RnlhRytsU2tqMDBpTU9CMlpibmdDVitNNE9x?=
 =?utf-8?B?R05iVnhwYm8zZkh4RlJidjJ3Mzd4YXpJaUtNeWZtME02ZjZvNStNOUYrbXkr?=
 =?utf-8?B?MXhpamc1bXFQMm1rL1FmZXRtRnF4eHNUVWJkOXA4NFRuY09Ra0YwS29GRTVU?=
 =?utf-8?B?YThKRzhIVGtEUEVxSDFSZy9WZFhwd0V2YmlPNkRYQUM4SytVOVo1Tm54UkhH?=
 =?utf-8?B?U0k1b0lSYVE5NDIraFJYN05hM2NKTFhycE9vcXNoaDFPUEtlSnFiQkpzSFVO?=
 =?utf-8?B?dEg5TXNCT0hBazEvM1RHTTFMQVBuR2JiUm1NcVBKYjcvNEJYYUQxdVVDeTFH?=
 =?utf-8?B?UEhBbE9VaGQ2d28ySURZbTBJUUlQWU5BSE1NQ3lZQmx6MU1ZYldybDNNZXZz?=
 =?utf-8?B?dkc1K3ltSGd3dVZCUFZLZ2tDbDJJMXlVVXZQaThhTDUvTFdUUFhQYkFSZk1q?=
 =?utf-8?B?NGUxYkc5TVJ5clhUZ2NnTDhkMmJDcVU2NVhpTnh6Q1VTOW9vN0taMEFWTGJP?=
 =?utf-8?B?VVg3NmdXUitVejhnWmp6cE5BNFZDc0RManZrbHJlb0xZeDh0dktjenZTeitZ?=
 =?utf-8?B?OGJYVWkwN2lSL1RmN3RYMTEyRTZNOVIybjlpdnNWTEJWNjRudWFkNmMrUy81?=
 =?utf-8?B?LzZQUDdzS3hidVBiSFFQTGpmKzI1SnA4NUZ1aUJZZDBYRXNFRU5RNS9TUzFs?=
 =?utf-8?B?a05KT2hMeUgxRXpqZU9VeUQ1Y2xUV2pHV0pzeGZ2RkFuQ0pzYVRTWHdWNjBk?=
 =?utf-8?B?MWRCWjJ4RVN6QUVRaTNiVlhXNDhhL3YwbDR0WlFlQlI1ZWs0Qmc2NzdJbkw1?=
 =?utf-8?B?MHd3NTFGVU5jVWxzTFNRSmhrZjVjS2NlKzZoYWlkSFJ5RFNMRjBkTUk3czZ2?=
 =?utf-8?B?cXYxSEQxMFdiR1dOWmcyRmNJaTdZRGdjVVpmL1g3NHkyVkcyK0xnVG1vMCtx?=
 =?utf-8?B?Mm0yV2VZdFFYK1pDaHlGRkwxbjk4K3JEUXBQckFtNEozb1FmcXB5aXFDd0E0?=
 =?utf-8?B?KzdveFRyNHowUXY2Q2tLSFN6aVJJRExKZHM3MW1POXd3aHd4eTF3VlBuV05M?=
 =?utf-8?B?SHVGbVhSVE03eGZINHluanFrNThKZy92MVlNb0V1M0RqcFQ5T0Z3RGNnUERB?=
 =?utf-8?B?M1M4MTluWGZMQ1VUSnJ6NG1nVzhWcVFSWVd0WE1BcGd0cVBzSzJzODFGeGZ5?=
 =?utf-8?B?d3JwUTFMRStZZndHRytmaE5sai94em1xbm1TT3c2Z244RllROXo2emM0RVNJ?=
 =?utf-8?Q?aOZyYm0SAMrxHhc4szbjXni45?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce136f8-07d4-4763-412e-08dd76e7f3c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:35.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKkwCQXKDBKRf0U0FbL/TfZqtO3ulHwxcFTck+0qFGuWN0PTBVxhYFHh8qavKc6IYoBi7RSwH8rm1WvxGwobuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Add support for i.MX8QXP, which has a dedicated control and status register
(CSR) space. Enable obtaining the second register space and initializing
PHY and link settings accordingly.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v3 to v4
- remove reset_delay
- sort register field defination
- fix error messag in dev_err_probe
- fix comments
- use true for 1
- regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
in imx8qxp_gpr_disable()
- use regmap_write to clean register at imx8qxp_gpr_enable()
- remove reduntant CSI2SS_PLM_CTRL_POLARITY
- rename register DATA_TYPE to DATA_TYPE_DISABLE_BF

change from v2 to v3
- use dedicate csr reg to control phy and link settings.

Change from v1 to v2
- change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
phy drivers
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 59ec7107b4508..c6eb6dd0d9e5a 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021 Purism SPC
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -88,6 +89,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
+	bool use_reg_csr;
 };
 
 /*
@@ -167,6 +169,95 @@ static const struct imx8mq_plat_data imx8mq_data = {
 	.enable = imx8mq_gpr_enable,
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8QXP
+ */
+
+#define CSI2SS_PL_CLK_INTERVAL_US		100
+#define CSI2SS_PL_CLK_TIMEOUT_US		100000
+
+#define CSI2SS_PLM_CTRL				0x0
+#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
+#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
+#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
+#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
+#define CSI2SS_PLM_CTRL_POLARITY_HIGH		BIT(12)
+#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
+
+#define CSI2SS_PHY_CTRL				0x4
+#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
+#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
+#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
+#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
+#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
+#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
+#define CSI2SS_PHY_CTRL_PD			BIT(22)
+
+#define CSI2SS_DATA_TYPE_DISABLE_BF		0x38
+#define CSI2SS_DATA_TYPE_DISABLE_BF_MASK	GENMASK(23, 0)
+
+#define CSI2SS_CTRL_CLK_RESET			0x44
+#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
+
+static int imx8qxp_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	int ret;
+	u32 val;
+
+	/* Clear format */
+	regmap_clear_bits(state->phy_gpr,
+			  CSI2SS_DATA_TYPE_DISABLE_BF, CSI2SS_DATA_TYPE_DISABLE_BF_MASK);
+
+	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
+	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
+
+	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL,
+		     FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, hs_settle) |
+		     CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
+		     CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
+		     CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
+
+	ret = regmap_read_poll_timeout(state->phy_gpr, CSI2SS_PLM_CTRL,
+				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
+				       CSI2SS_PL_CLK_INTERVAL_US,
+				       CSI2SS_PL_CLK_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(state->dev, "Timeout waiting for Pixel-Link clock");
+		return ret;
+	}
+
+	/* Enable Pixel link Master */
+	regmap_set_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
+			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
+
+	/* PHY Enable */
+	regmap_clear_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
+			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY_HIGH);
+
+	/* Release Reset */
+	regmap_set_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
+
+	return ret;
+}
+
+static void imx8qxp_gpr_disable(struct csi_state *state)
+{
+	/* Disable Pixel Link */
+	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
+
+	/* Disable PHY */
+	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
+
+	regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
+};
+
+static const struct imx8mq_plat_data imx8qxp_data = {
+	.enable = imx8qxp_gpr_enable,
+	.disable = imx8qxp_gpr_disable,
+	.use_reg_csr = true,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -865,6 +956,25 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 		return PTR_ERR(state->rst);
 	}
 
+	if (state->pdata->use_reg_csr) {
+		const struct regmap_config regmap_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+		};
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
+		if (IS_ERR(base))
+			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
+
+		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
+		if (IS_ERR(state->phy_gpr))
+			return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+					     "Failed to init CSI MMIO regmap\n");
+		return 0;
+	}
+
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
 	if (ret) {
@@ -984,6 +1094,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
+	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


