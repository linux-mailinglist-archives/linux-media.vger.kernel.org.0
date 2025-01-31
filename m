Return-Path: <linux-media+bounces-25506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9001A244CA
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 585A118818C1
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185AC1F63C9;
	Fri, 31 Jan 2025 21:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="icI83HI2"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013015.outbound.protection.outlook.com [52.101.67.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3731F472C;
	Fri, 31 Jan 2025 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359292; cv=fail; b=V3Ma9ZtXjPf3hDWfM12nEQLruDUNWnyA0UVWC20+lApO1K9JM2zcrLaTDMMW+F7437HKq18zh2W4fiGbxYEGOCDrE3PA4tLixaubcCp+qSxtIAkIBm90/KjV+NwuswLvogp71wGMl8gnCO6XHt3XSXp8Pb6VFtHPzH6P3wB2fZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359292; c=relaxed/simple;
	bh=R5t+/ZXNW3Jaa+QvmuPlbAJLAwqM2EQdGD3IuCTlYTY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PkxRQ9ow9fOdZ0N7MY9x3SY/kRapcbiZMzqnTYC1LZfcL/lWFdHx5zDGumW89bs6YL8NEkBK1X0z8An0j0iW7Mtfuq42OLnAhSR113AX52KBkWkSJ90ZobJH0VUSO31sdkC+tc3lHcmJ2cZ0tsjwU0KnGSVbd6xEnyvhkbh93Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=icI83HI2; arc=fail smtp.client-ip=52.101.67.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFI1bnA4LMKOkaZ/EFAZmjqSEQrRjc6Me+0MdIyVIavJz6F5IydgWI7UTXrP5i3INzAzrV+hfY3GKnyH5t1r+5ihcuEOAaDdYT9L/8TFp3Cq5n1QWik0mHZtCcNhe0HqaaPwQfGL4rygUbSD4RUnvsHoB5GN9BYN0tFbnfyxh+8pyDFrCBnM9ZWeUMBc8jDhGZqQUYzm5CNHUGsDFNXInuRpP+Hxj+r49y13hs9NeFtyXykvWE6qKsW0HpocMBKpAR4AMTov9gBw3vqfPY8mByT1V9lxq0L90P4ibwcZB6zXU3A+wrTUdObMmGuEkPgZ9uxMR/sg75tS8tIYGyJLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7sYQPVi6ujWW5Rt6k6pkwPR4oea9KE4jLO9DMxcO6Q=;
 b=Mll8hHNKKEr5UfViTC77ELtajIdAVaT8spXC1ZQ4yi6+tqFNZhXAhYH2wDBgoA1CpUeh45WVbSBtTVmknQ56D2TbIqktpFYeswRqaLc0EHodXLe6H/I+76FcstEZVem2E5LAQ1mfK7pW9wA4pZES0DNZaVXbCz7M1L6ufmLmvBkriMyL2MXh/NgiiRqOEVqKlOQ20+CoCvcxKCgDrfQQQY1kCfrtLwIDAHtf3dmy+wqA3q17ojlwkSa0mSaI0lzMsOY1L5/z3WP1AZNycbBZlQ9APtty7SvGWjebgJvFDc+mbRV3AIjCvUPOLlMKEB/YyRbPjeJQUoD5JDLurX3xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7sYQPVi6ujWW5Rt6k6pkwPR4oea9KE4jLO9DMxcO6Q=;
 b=icI83HI2y8g8b9NJbmZsMs16jQaUaqoxfickw1SSq7sXzzob/s7kXwUYKPU0cSwD+GcRD2+MI4WZRWo05tEWETkgo0ZxVGpdwMGHBFeo1aN6LVPuZantGdEYtYYAN0IJvxe6QXRw1WlfZD9IkFHafgZUEphURohXrRHFQ3byJYrxSVn2rhReXBP7OPZ3cb9xxHdyAipievT5KalJz3cWuAufq4fRGYGV8lhTdfDf/F3See+DCFaS/agPSmoJsbDf+NMrKVGJrS+yXMVczoWm7uccQnPb1l0pAzC9kpciV3gbWFcDzSRZCIHnlksO8mUE9GG5UMLEZgnn23qEApw/5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:53 -0500
Subject: [PATCH 08/14] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-8-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=2150;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JNtGfG7oYNSgfXhw1+locx43vkgnzw9x8oafgpMA04I=;
 b=Oc7KrPS8+UltuOn7aGmnoDb/OiuQKi4TE6WD1zQjj1KTMRJccrZajD4aw0pGLzjYbBiGjEL0S
 qJh+3ifIFDPBXiRfiVj0qDuEWY/regD+SRKhQ3h4c1uqtGFrg83taag
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cc759e-1c0b-4870-e4cb-08dd423f15f2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cEhra3g0b1JVUC94YmJod0hpVTZKZktPME11U21pUEIvUnRqUjBZeDVjbFRH?=
 =?utf-8?B?OFMydDRaWVY4RTMyeW9WcEpLajZUcEl5TnJ6MFRjcUQxYU8ySGhWWElzRS9Z?=
 =?utf-8?B?OFI3bFk5dDhjZkJvT0RrZFFHN0k4M1RHaDRiY2JxQnVxODkxaVcvR2ZwWVp4?=
 =?utf-8?B?RjdacHg4TjVRa0x3c1dLL0FOZGJZZGlCeDJDR2dFQzFPTGZkM1U1RHd1dEtS?=
 =?utf-8?B?NzYzcFFaejZydXFIeUc5SDFpL0l6bWZKVHZMdE5tWElIWnJWUnQ0bTZxM0Va?=
 =?utf-8?B?U1o4VFgzQlo2YWtyTFJiTTd2VDYyNlFzVVJBRGNlL3ljT3hFKzVTUE53TTd4?=
 =?utf-8?B?VXZYUzkweUpSemNlZko0NGxER1pmL0V3cmNvajhrdTRkYldFd1RXS2dPRjJG?=
 =?utf-8?B?cEVybFVMdFJSdmF0bjNUNFZLU1RGNUhrUjhOYTZSTU1nU3RMMUJaWFYrdTE5?=
 =?utf-8?B?cEhBeEhBcTBvSFNtSkh3NlBlZmFqQUl6WGpBZERvMStIVHF5QWZZRHFIOVlL?=
 =?utf-8?B?aTk5MzdXNnk0QzV2MjAvV2MvRWplZGZBTE1WZVp2bzhONVhqRVNCOGZTbmt1?=
 =?utf-8?B?Y3BkV21HSVM5WU5WbXBoNWFlaHVpZFE2THRxc3N1aDNNN1o1UzYyQXRZTy8w?=
 =?utf-8?B?bU5hUXhTbWh5cTFlTHpUcG5LcEdnRnJHQzc3enRzRE1PTmNUd0xIOWRpSG5l?=
 =?utf-8?B?UGorbGRINFFkc1VIWEwvZHcrOVlFa3V1cnRxaVg5SUJ1QmxqdnZzLzNpMVdo?=
 =?utf-8?B?QktNVDFlWFBpTGNFbmk0VTBLbVYvZldCUnRYeGEvOUt5dWZpdHZqckhiWXZU?=
 =?utf-8?B?bkxmQUk3MzRxVnFNa3gvTHQxWTFxWkNDdmtGWGxsVVZBbmJxNVgzTGdYUVcz?=
 =?utf-8?B?UTgyTFU1ZW9SVnQ2K2c5VkxlUmx6a3lXOGRyTC9KYUVkWFFRN2NBemFEc0pl?=
 =?utf-8?B?U3ArTnBmb1hIWi9aSnYwNmswdWUzV05heVViMHcyc1M4SXpnb21jb2YvMTEz?=
 =?utf-8?B?U2NiT2pCOFJFZFYwdGdKZXBCaVl2bC91bGxkNWN6M2gzd3ZaQjMzRDg1SmJB?=
 =?utf-8?B?UjExbkdLRDdDcmJJSkdzQnF6Zm10UXJkRGUvM0JIeDFFSzVCdzZRSXloQTYx?=
 =?utf-8?B?T2xSZjNKVjRXN0h0TkZoNUtheU9NQjRoOXhXVGRIOHVCY0VPekJlbTVMaXY1?=
 =?utf-8?B?akNUVnlmNTJ4UzBIamp3Wk1CNDFxREczNzRUYWltR0tnbkkvbGRZUVpuVlpO?=
 =?utf-8?B?VENFWWdBZHBVNmVLSHZCQkR4QU5BdFd6dFVVTEY3RXhsUVlONXJldVZKdDdY?=
 =?utf-8?B?Ym91bzM0MmZmZHFkYnFMTTJkZkZzTWY4SVZSZG9lM3NaV000SUVBa0ZSbEF0?=
 =?utf-8?B?MS80MmJvR0poQTJEMDVLZVBTMnlXTFFnWjlGOUpVakRoLzNhVm1YbnA5cjNh?=
 =?utf-8?B?TFNjcXZaa1g4K29rQ3JVeFlPTDk4UFNrQjdRVmRHdWZOMS9KV0paNVprZElj?=
 =?utf-8?B?QzBHUGRRVjl5RWNQYUhPRllsZEpLNk9xYlR3cXZlT0dTYmtTMDdkTHVqUUI5?=
 =?utf-8?B?TDNRUmxod09lQXRxUUxmNjZlOXV0QzU5STBXL2pnNUF0dEtTSnZBRkxRTCt3?=
 =?utf-8?B?cVBBRW5mb2FzQTJHZWZUbVFCdElIci9kWkFjdjlIaExLcGRYeFV2OVBEanJL?=
 =?utf-8?B?SVdmYXphcWVPOWVQcWtPT21ibFBSVGRoMUlNR2RIUHM2c0lQOWZSZjFuMjJL?=
 =?utf-8?B?bkdVbGEwaXkvMm9CTy8wZThzSTdWK2Fnd2RSU015cTI1Rmt0UnVqVEh1Y1Zk?=
 =?utf-8?B?K1ZoODczRnFmUVYxSjB6U2d1U2tPMExwcmZrOHpxTTAydU4rV1NCSzhlckFw?=
 =?utf-8?B?T20ydjhIZFdheG5UNWpoenptc2xSWExXTk9keERJMnVESmQ3bmZadkhlbkNu?=
 =?utf-8?B?YllveWQxak9FWjJjMHhPblcxdGFqd0pHWHpIaFFVZjVNRnBFK2NXSEtud1Jm?=
 =?utf-8?B?eTg0TG9Dd25nPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SjJCWmRHd3h1S2s5VkhVcjZEYnNyTkFyTFZ3VUt3dWVRZlFMSzFJYkVHQVVJ?=
 =?utf-8?B?Q2dmemZ1dnM3a0FXRmJSRTFKaWt2d0tCbEM2dWo5RCs0eURsRk1rQU93RENy?=
 =?utf-8?B?K1IxejlNbEhoUTdKN1FodFZBRnFSYUlaMEp6ak1CRE8vSlFUTXlEL0VaQTJt?=
 =?utf-8?B?QlJDaHMvTFM4SjJrNmVxOUxvcVVFSi9QMnBlRS9yVHIyTHFZZGFsT2N4ZjNW?=
 =?utf-8?B?YXl4cjErZmp4T1VjRnUxQVV6U0Fod1htM3FIaHE0bkxFUkwvL0NrcWYvUEp2?=
 =?utf-8?B?WGFYY1dXZXN1VjJkZHhaYXpyZ0pmZTBubjc0TUVKVzNVTUlqMHhvdWVLM2FD?=
 =?utf-8?B?Tkp1RzV3bzVIQ1h4Ky90NEgwYzRzbzBkR25ScVhEL21kaEFCd2lCTk9mSGZG?=
 =?utf-8?B?WXNBeGlPa1o3UVJISWowTTg4ZWsyUS84cm9USTVML2RWUmJVUEVZMnExdUdy?=
 =?utf-8?B?SFErWmN1RzVEMFBpeWE3MjVWcVY4R01LTEtKOU8zSnJvQmhvZ1JNTjJuMER2?=
 =?utf-8?B?TmN2Q1E2dU9ORmxEa0sxRlB4bnhxa1YwbTR5Q1NLazFwS3NkdGU0TDVZbHMr?=
 =?utf-8?B?NDRMeXhLcnZKNmVKZXRuWk9INzMyUG03elB2SmV3bVBJRkdWd0VjMzdSMHpq?=
 =?utf-8?B?eWJMaHFpb1ZsdEtTQUtvUEl3RHRnVDdKdWFaUDdNbE5QQTR6QUQvcjJRYWta?=
 =?utf-8?B?VHhaNS9DeHh1ZSsvVFFUYzdESlFnRi91MFp6cFBGNVdQbUdkTi9GUWN3b0wz?=
 =?utf-8?B?VGdUQVN6UXlCOXdLRnJSTjhPcmlBT0hGTHNWVzBpVGNXV1hoTnMvZitjRGZM?=
 =?utf-8?B?Yys1ZG9tM2FpbUNOaVZkMFZXRUlwdXFkeVdnQTJ0WGVLenU1RWhuNVB1MUJN?=
 =?utf-8?B?Yy9ZUi9tbXQ4Q3lJay9FbXNVY2xqcUl1by9TRUQ0VzRXYUh1OW5IVU5vY0o2?=
 =?utf-8?B?eksxdktnZnZFMGNBTVV2WEtUbG1KazRtQmNmT2VaWVlhcTgwZDRaWnFQMVd5?=
 =?utf-8?B?M2d5Tno4RXhiMldmMkF1Z0VuOC9GMzkydHE5ZkFVYW5sUjJleHZiU0kxaUVS?=
 =?utf-8?B?RHlVTEhqQWNDaTBDZGYvd2U1cFFRRFJGWHBrK3daS2hTb240c2E4YmpURHVS?=
 =?utf-8?B?dE5GbHNDamJ5TG55aXc1Q2tsZGpYMi8zUkFOZENWeWxnN3dkNHlHUjVJT1M2?=
 =?utf-8?B?UngrZ1dOSFRqVjRIRGJEN2U4dFJRb3dHNVNXb3A5SDNTT1E0dW5qRTBlYWkr?=
 =?utf-8?B?SnU0SXF6cm5ha2VOTllLcGp0dnB6bW9qTjRZekhadlB3RjlmS0JYYVVoclBS?=
 =?utf-8?B?ZkJVTURiL2NLMmVTR0J1d1l5MTJzZXZWVWlTb2tpNi82cFBUanFZc1BUMHpN?=
 =?utf-8?B?Z2U0WkFCWCtRVzB4ckdjdWtsalFtd1did2w3TzBQM2ZCc1BOMEJ4NUZ2RjRy?=
 =?utf-8?B?NkJ3QWNSQmhMN3N2bkM5bUhYWTJVUmZjdHcybFk4QXJXb1BYRjVvN0grOW5V?=
 =?utf-8?B?RzJEYkIxWkdJazN3OFg1WkIxRnNwNHdERWJ4SE85RXpSVnlLQXRBS2JWWVdJ?=
 =?utf-8?B?eXA3WmdJR0o3cFJIT2tJVTcvTWxDeGMrNXR0aFF6UzZLWGNSZkdadkV1aUxW?=
 =?utf-8?B?UnR0SWxwRTIyd3J3WkY4TFRja2FLUkFJTld4bUJ0QktJRlp3OWx0U0FsWDBW?=
 =?utf-8?B?bW5Obk90WW90TFZOTzFYbTBCa3c0MlRVZmt1dnhYYi9uNE55OWJ5VkdJcXV0?=
 =?utf-8?B?N1lrTUZzQ0duME81QVBKdjFGdStueVAvMXFHVkFxekpheVJyRGlkVWRMQWhH?=
 =?utf-8?B?QWJ6SnpSak9HUURKTmt0VzlvalVNaVZzY2N1YXVZa0RCUDVkSm5DRXdTbVFM?=
 =?utf-8?B?akNyeE1yL3RZYzJKSm1SbmRmdEIvQVdMdXJma2NUMWRjbnR6dWFVM2NyTzE1?=
 =?utf-8?B?TW1SSmpMREw3dUVmY1hXQ1RGSXpnOTVweEN6NUgyRWQ2djZBUWIyQ3NILzJZ?=
 =?utf-8?B?cmo0VzE2SGZVMkNrQ3lSNVd2TGFIangvUUpWUW1uQWYvRmtYOGxwaFpIUm1j?=
 =?utf-8?B?NlNrTnNraGxNOFRJeE1aczhUamxjQU9vNlM5MTVxTGdpenlpanFCNmcxcHNw?=
 =?utf-8?Q?RWks=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cc759e-1c0b-4870-e4cb-08dd423f15f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:47.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QiFDOaea1+NVpbXkvDx2YLsjTfcq63u9gEj5Wu1rMlNK9LvrrR39KGv6oO5fUgNWVGAT2LUVmlVufp6EsgsQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM platform. Remove fsl,mipi-phy-gpr from
required properties and add 'phys', since i.MX8QM use standard phy
interface.

Keep the same restriction for other compatible strings.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Robby Cai <robby.cai@nxp.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 30 ++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 2a14e3b0e0040..91c4d8fbb1f8c 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -18,6 +18,8 @@ properties:
   compatible:
     enum:
       - fsl,imx8mq-mipi-csi2
+      - fsl,imx8qm-mipi-csi2
+      - fsl,imx8ulp-mipi-csi2
 
   reg:
     maxItems: 1
@@ -39,13 +41,18 @@ properties:
       - const: ui
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   resets:
     items:
       - description: CORE_RESET reset register bit definition
       - description: PHY_REF_RESET reset register bit definition
       - description: ESC_RESET reset register bit definition
+    minItems: 1
+
+  phys:
+    maxItems: 1
 
   fsl,mipi-phy-gpr:
     description: |
@@ -113,9 +120,28 @@ required:
   - clock-names
   - power-domains
   - resets
-  - fsl,mipi-phy-gpr
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      required:
+        - phys
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


