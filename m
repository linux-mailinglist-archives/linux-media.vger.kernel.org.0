Return-Path: <linux-media+bounces-46237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480FC2F263
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 04:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BC973B5A6C
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 03:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDF9271468;
	Tue,  4 Nov 2025 03:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UvF+a/kO"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C02A1BF;
	Tue,  4 Nov 2025 03:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226514; cv=fail; b=eSZx4AcFzbcdn6IM0Ny+8Ek4FgbT/2muIiWfL25JneeVJVHOlXTedYSpJUB5Flhxfp6SlUmGHj8sH2L4vg/9LMLDogS9UPVA4yFQkioFalTAVH8PorBOimAD1fJDx+yB77zOYTWehMbBDiI9Yc/9USc/1AabEUDAJb5JHLAEa6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226514; c=relaxed/simple;
	bh=piSFbCNfOR2T1QvVDwg4ktK69RJcekM6d0Sz1ftvtOE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pGf2D7DRRi+zLQfg4KvQxi1rQTLPyZdngsDeu3DLzZ2VBin0zqjsMKg7qXoT4FWo9u0qLJAACWa5y0/j8pnJMtNX6Ou7LNa+PRtTXMtzVq9YE9sYeDCHppumU5f+wygLNRidUTd4ARWVjEpGHlwQHEh2VKO/Uw79vR+DoHsIe2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UvF+a/kO; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+5hk34DSh5QIGRK7NxrHO9k2cVWMVQmqydOqhrYKKhSiLQOUU+h/+dmiTkqlL8S9CG4hhYeH9FenyRqMuVFT2FrlIPzewh+g342PVqp8KnRfzJCy2DfoJsgP4Qctp16JnwhEzzPwNVfqHDnOSTbMN6XRY5SIcbaIfejIGJ73IKUNTP2v8yY8ypBezIddmlfQv10gfxfjQpyVEmhGV/zgnsI16LFrBNTT9tWEbOvFmBQCnGGw9YEFeP979mm4qiTyqq8xvIu3rqhutp5LhH8IiVz3Fhun5TmMYnpghteVmv0lPg76ogEhWJjiN1kbkbKNllSp3IN7qkCVZIbVly+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EurfPWBczWbFE4J0d0S0th3De6TPc9yI/Cd1bu6i7w=;
 b=X/UefH2OhqfqE5a3jvu1FPfkddsWyrrPdC6I9zcx1msb7pZBsmOILKLy8IQVJVrd3HFLuSVMh1aIe28XKHHSn/GRUZscL7xKQgHULb6vePLdUndTywX3Rs29wySYJTGrzWLAoKMkDisVLUCWg0ELvS7xH1KRz4LMuY8wT/wuwxLM1jr4n4vaC+4c9F4q1yVvWbnm15H55h/wAQ68qkXGc91mrgZiAcqzhMxz18ZsdymVgTzQlYabDVOZ8Akpzix1t5aXEo56K1w5qrpU++KzvgX68MbGd67sYwDUKV4t1UNL9p6hsI5uTw2g3wrrDH4IKP5ZWKhA0JmJfqUb+Jn8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EurfPWBczWbFE4J0d0S0th3De6TPc9yI/Cd1bu6i7w=;
 b=UvF+a/kOGQz+7jQzjh8+fLruvUtAuxdwVTyVuMKKc1Fwp8RJAFzpLURoTWB/YDqz8Jvoj0kBy84LHNncz2weF5OCw6OYpVpkpk9MzQxWS2UMy9LcCzXqTaWI3elupLpPJ5uv1uLgGltJBek1oY/MnJ4qLEBWSlVJRSJ1hAnkiOQU5VwycUEHsFHROdKYxQWyQg4V4Hwqwal2o2n9jbW4uPqvln+dFbHi/XJ8wXqa8QjvxlBDTNTVOhP48D8ZVcSFhdzDkC0ENiR6lMndwjogYKOipf9ikKdmEQovNgACcq47iVSmG4MAmePcT12fmc1e0JblMOfI2qkr3J7zsdYIRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:20:41 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:20:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 04 Nov 2025 11:21:05 +0800
Subject: [PATCH v2 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-isi_imx95-v2-1-c05b7cb104cd@nxp.com>
References: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
In-Reply-To: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762226484; l=2073;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=V1vGzRFItnY59MjCB6FuQUTfcs9XAcIyNOBkE70r6Ys=;
 b=FzVrsxgsmiOpMLtFAyJG0IRu7bLlcVRnhh4/iL4c4mUQrG2AxuxvNAJyiGOLsc28stA6ECfjI
 ZnN8k6z/Gx+DGieBG9n9RG8dr1YjufwQ8A/0r01qVwZTy0LDThO72Iq
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ff4483-430a-45b9-66b3-08de1b512237
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bnpVcGFTT0Ntb0U1dVkvS1Nlb2dGTnhJVU5kdnhQTFJLbTBjekVIODQrdS9r?=
 =?utf-8?B?ZWNVdldVaGgxRDlTUXhZSE1mWUdFQ2V5ZWdkYXlvQWU5UmZsb2RaMTFYOVpI?=
 =?utf-8?B?UW40bTlRRFNOMjVXVFkwbVV6dTFJNmgxa1JWMmoyUjNCTFc5dE02M1RXRmZI?=
 =?utf-8?B?Mk5JSENBMDVrK3JEc2o0RUM0L3lnZHFFSGJlQmdlSU1iMVg1V1YxcXJ5a2Yr?=
 =?utf-8?B?blpkb0RCZi9iZGZGQThZNWRlUkQ1KzBSbHNlMnV0cC93emQvWmEzVmw1ckNy?=
 =?utf-8?B?RW9FUTU3VEJsUVRQcFk2dTFmandJaDF0M3pPZzVEZVlpdFBvKzloWDBubXFC?=
 =?utf-8?B?ZnVBVVAyZW56MGtlZGtjdk9hZEVRRGNScVZnSEsxNDBaT0VsK2NnWC82YmU4?=
 =?utf-8?B?YmU1ajVYZlcvNmY5MC8rTlhrZWt6bWluOEdaOUROTE1wK01nVkE2b0xYdHRO?=
 =?utf-8?B?RGNMN0VEWmZ0a2U3UHI1UTFNc243RWN4clMwQ2lLT1Zzck1WK094VzJwNm4x?=
 =?utf-8?B?Qlg0UTZNcHBZZ0ZLMnovZ2dZSVYrdW55TjVQTkJLaERPL1V6dnlxUDZDNk1X?=
 =?utf-8?B?Umc4MG5uS3lnL1NQT2g2ZW9wZjFRRU9iRHBmZVByU2VpMXhVT3o0MDdZTWVu?=
 =?utf-8?B?ZUxNUVo3S29uWUtwYzJPUEU0d1FKUlNGd3habVVjeVFZd2FBRUNVQ2VMeDE4?=
 =?utf-8?B?NFMwcmNkTlRucVRGeDlNN3BVR003a05zYkJhRXQyUjBzR0pwUFNhQ2J4YldT?=
 =?utf-8?B?QzIrK0oyd3BHNFJPaUVPN3pVNDBSS3pPOXlUYVRQS3NWN3BXZTd5ZHdlUGl5?=
 =?utf-8?B?Y2JLWFQvcmx2UGdEdDY0YThxYjN3bHc4Y1U3L0RjVzd0ZlkvQ1p5UW9GbGhJ?=
 =?utf-8?B?M1pCc0l0bTNVR21kNVROQmlRTUlqa3lpdHhzc1lva1dtdnBXM3ZkLzQybDUr?=
 =?utf-8?B?TnNraHdJazQzU1FpZk9OdEQ3cWRZY0hDakdqaVNEMmU4Rk4xS2M2d3gzSXdV?=
 =?utf-8?B?alZaZ2dUYnJpMGNYbFdnaVdWZnlxcDQ5VjJDbUorSnc4OWFnc21xUW9nS0Fa?=
 =?utf-8?B?MlUxNmpZWE81cWVWWTFycFhESENlUU5FOEpPS2VFdytwL1VZYmNtbjM0WHFW?=
 =?utf-8?B?UDhjU2JJZjlaaExqYkwzMElWMEd1Z2l2U1RsdDUwM2owdW1kVTlsUEhMOWlJ?=
 =?utf-8?B?VmJXeGZ1TjNwVFN3UWFNYmxFNmdlaFZaeFdLblA5Tkx5eExHZDA5NkFVbkRK?=
 =?utf-8?B?VGdJZ3BQWHJOYzl3cGpldTdmTHpheFVNNnV5M3NBN3hpTDdMN1R0K014Wmli?=
 =?utf-8?B?ZnlNUWVDalozVGtqYWZBZUdYSGo4N05tZFhPM3lDQjFYQ1NOeWt0VXBvUUtD?=
 =?utf-8?B?RG1LalE3eVkzbHgrOHdFcWwreDJ4Q3B6emRQL1hSMFN4KzFnNmJoaExHU2lH?=
 =?utf-8?B?N2c5eXloSkJDOG5TZ2ZRc0RIZ1dpUWt0SEVJdXdxbG5Za0REYWpQTjVMcDVM?=
 =?utf-8?B?cWhjbnJWd01sYlZQTkgzYjZsb3d6OWVtVm5INSthd0piNWl2Z1pjaG5SMHI4?=
 =?utf-8?B?S2hSUDZtbS96blIvS0UxcmdyQ0R4Mk5pc1NjdmlhSXI1OWg5WkMvOGd5TEZ0?=
 =?utf-8?B?UGlmY0JJeTd5Mm1DVlFZUWRNbENwdlBtQVYyb1JGMHlzdDFlN0VUdnBKMWVV?=
 =?utf-8?B?SDVNTnJlWVhyR21nVmFUZit4ZWhidjdLM29ya0NjbFJMMDMyOE5jdmdvSUNy?=
 =?utf-8?B?Ui9jNHdKUHkyVEE2WmtYVkI4QjV6ODVtbU0wTHF2WGE5VHNMWW83aXhBRG9V?=
 =?utf-8?B?ZmFsdXRRNysxeGhOUVVyR0hMUU5temRxbno1T1lKeHRrSE8wQTJLMXJleEdr?=
 =?utf-8?B?NHc4MGMyQ3g2aUk1NlNiSnEzNmNzNXBtbVZ3L2tZMHMrWnpYdUt1M0hSMVlL?=
 =?utf-8?B?TXE3OXFhZ08rb1ZBQ2VsbVpPUXhTalU3RzNWWHJ1ZzVQSEUvOXlVOHdGZHdM?=
 =?utf-8?B?RXFhOWp3bUFLRVF1THA0SFo4VVBJYm4waytSbG85VGttcXBrcEVBbS84N093?=
 =?utf-8?B?dE5JQnlYaEJnN1dEYTVPWnM2djFudXdlaG84dz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N25NT1o0QlJlSEk3ck1xNU05VVdIU3IzcUpGR1RldDZ6Y3VycUVjYUExWXJF?=
 =?utf-8?B?b0xYWGhaUjNVVTlQMWdFUTlLWUtramtVeU9Oa011emtpRjMzc3JyMUNRYmMy?=
 =?utf-8?B?Z3NiRk5nYjhuMTVzT2NreXNKZjdmUWw1emxzVEY3azBNbXE3bS9ab1RuUEJ1?=
 =?utf-8?B?YXJ4T3FXQkNuaVQwanBlTU5IYXFwT3ZDckQvM0JyYnFUV01RbFNLcnJ1bWpa?=
 =?utf-8?B?K3o1SHNKMnFlQ3FoUDNHYURNbmkrNGFqSnRkT1NheHZJem1NMlJqdUx0N1FB?=
 =?utf-8?B?am8rMmFyejlVZGcwMVg1eTArSHZhY2tncHRMZXlZVmtsN0NJYklmKzlnbFk2?=
 =?utf-8?B?RUlaSVNoZjR4NkQ3amhYeS9UVjBLT2U3SXV3WWhqYmZiaytsVHZmUnh3Sk1w?=
 =?utf-8?B?ZnNFZ0h3WXhhOVdZdng4bXBiYzIvNlVsS1kvb0Y0dE8wVU1vRHhVZlFlYU9R?=
 =?utf-8?B?Q2xLOWhXUXBNTDhPR213Q0FLZHhOQ2MrN3lRbm11NUtDbVhDdy9EZHVxUk9J?=
 =?utf-8?B?YTdSYXJwQ0NldFhOT2RDQytNdVkzWEJiU0ZBV3d4OW1lTEc4d2hRWDYydjJl?=
 =?utf-8?B?UXZXK0JQTFF0aEEzVkF0Zzhud3p4SjdMNUxTS29CR3JjcjdrZG5GL3Zva3dV?=
 =?utf-8?B?OEZaMi9RTEhiYk9SNmJLVU9BU1ViRlVNd3dOUGNCQng2cWVnYUdqMVlnYnhS?=
 =?utf-8?B?UkluL2NsVGVja1hVdFB0alNIcnBWcnZyNlFQemJDeFdHRjhmVlArQ3ltcWVN?=
 =?utf-8?B?TWhCOFk1MWZQeHBIaHBZVVIyRTV4ZTcwaC93THc0Z1pjMWVNbnZYNy9RSWFZ?=
 =?utf-8?B?QUVUZFM3cHFrNS9ZYVArSGo2UUhSMTRaOGZ4dFJvek10SFE0VmNaUVhkQTBs?=
 =?utf-8?B?cUlYVEtkQlVLZ3gyUm1McjdpbktGS0ZVNVl5bWxTQjA3K1NiY0lIR0ZqT3Y5?=
 =?utf-8?B?bjBUblRIbXZ1N1BlTWZDZXR3b1RKZUJQVkNQeUg2Y2R0RDlLd2l5UjRiRklF?=
 =?utf-8?B?VzI2Lzk0K00xUlh0NjdIa0wzQ3dYb29CampMcXAxck1aWkpYSTRRaHZ1c1ZB?=
 =?utf-8?B?U3pkZG44UThJOEtLalBCMlpYTXd0ZlRZUkdva0cxMXJRK3VUWSs4YkhoWVoy?=
 =?utf-8?B?ZXNtc3EyQnlXTG9sOUJ6aDlIUkRaYkYvUzhoV2RMMkxVRGk3ZTJGZ2ZMNDE2?=
 =?utf-8?B?UU5XS0pONDNqQjVZWjZVbnIvSUpnaHZ2b05LTGExSXhhR1gxTDh0MWZudUk4?=
 =?utf-8?B?amFFeko4MCtrNXYrTFN2K3Z2U1JzM3QzVThTRERiWjNOeVAwZWtNdkNmallD?=
 =?utf-8?B?S1pCVGdFV2VHUC94blQ0YTZyb0IxTGRadjc1enkvMjBiT1pMRmdLejFHWlZ5?=
 =?utf-8?B?eXJNejUyYy94ZExuQjhIN0loYnB1aml5MlZLUFgyaGlZOU4zZGVvOUN6Q25q?=
 =?utf-8?B?WWtIMzVPOUN2dTdSL0k1QnB2MFNFNmt3QTRUV0VyT01ibnE5OEJSajY3VzNM?=
 =?utf-8?B?bGlSZ0NodGQ2VEJQMERSNk5yNUp2a3hrSzlyWE5aaUxnd0NMVDg0MU5HekJn?=
 =?utf-8?B?RVc5V3JvVEVnUURuQmRLRmVDQWF1aUI5TlprdGFCenVNZDVJVlJuN0gzb3Vw?=
 =?utf-8?B?WldsU0R6d09XdTlhNjJxT2tua3VoSHM0b0hIVHFSMDFzS1lyeldTcFZKL3Av?=
 =?utf-8?B?RmdMQUZiNWprT3FPYUhJTzZ6SzMxVm1IS29LNXdDUFhsczdhZTBsMVZNZmhk?=
 =?utf-8?B?bEIrcldldkw0aldWWkhQeU1Oa1V3dDF5cEtRaWZ1d0FnY2gvU2Jsajdzc1pn?=
 =?utf-8?B?aFFBSnZnUnVuOGcvM0VoS2sxeEVTV0hZdElaeERpMjkyRjNDVCtjdE5hdlpU?=
 =?utf-8?B?VS9ldVA2RmxBZDQyeGhzanFRYTk3WFArZWxKNklmQ09MSnZBNnpaUFNLNTIy?=
 =?utf-8?B?R0hMOUtBY2UwSHJ1Um9vV1BOZUltMS9FZzhyY2xhVGRmUksxUG5laWFJSk9D?=
 =?utf-8?B?UTFpSXZMREI0ck54cDY4K2hjdEtrNW9xWFF2NFJpR1Awc2FNZExVZUVQSG03?=
 =?utf-8?B?TzA5S0UxNGMzcHp4OXh6ZVJORFd6d1BjZ0xEOG5Mc0trZkJIR21XbjBBSG9U?=
 =?utf-8?Q?6vQpNciIynyMiqKrmzDcEOTD6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ff4483-430a-45b9-66b3-08de1b512237
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:20:41.4980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31oRfB5E62Ns9XGxSbx04qaFVv0QntM44JQAuxafHyqA05bBA+UO8sOJPPWkaOeLrD4oasbsHoVII5pvqftVTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI module on i.MX95 supports up to eight channels and four link
sources to obtain the image data for processing in its pipelines. It
can process up to eight image sources at the same time.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..8c73f673620f48d53b0033ac8a5edc542462cba2 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -23,6 +23,7 @@ properties:
       - fsl,imx8mp-isi
       - fsl,imx8ulp-isi
       - fsl,imx93-isi
+      - fsl,imx95-isi
 
   reg:
     maxItems: 1
@@ -49,7 +50,7 @@ properties:
   interrupts:
     description: Processing pipeline interrupts, one per pipeline
     minItems: 1
-    maxItems: 2
+    maxItems: 8
 
   power-domains:
     maxItems: 1
@@ -98,6 +99,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 2
           maxItems: 2
         ports:
           properties:
@@ -109,6 +111,33 @@ allOf:
             - port@0
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-isi
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+        ports:
+          properties:
+            port@0:
+              description: Pixel Link Slave 0
+            port@1:
+              description: Pixel Link Slave 1
+            port@2:
+              description: MIPI CSI-2 RX 0
+            port@3:
+              description: MIPI CSI-2 RX 1
+          required:
+            - port@2
+            - port@3
+    else:
+      properties:
+        interrupts:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


