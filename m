Return-Path: <linux-media+bounces-38633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38218B150D9
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 18:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADD44161998
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 16:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C01293C79;
	Tue, 29 Jul 2025 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="km3+1MlK"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B8134AB;
	Tue, 29 Jul 2025 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805234; cv=fail; b=DShvCUV9Y6c/II1H1Kw5QjGK8r1U3YMdAGUNGb9GApojNUuOfZ78T/8STCob0aUuOmSdR7I9ZdnSOK9qvAFMOSnrOTq0+pV7GrkYuQJaM0q4fd6NYNvhLctQKJAA4sW5/+djNUZgktbBpeDefwGv91JM7Z4+0Ll/xtfjuQhxgNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805234; c=relaxed/simple;
	bh=in1OIJaaAaTNfIu5fxp61kLPwGvarDyPpthBXrRVePM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Yc6FM8u10JBoeHDlIin5/SDSQyUaieiQJDY4PMt24dWO4fDrfhwMvD3K+CDJDt+Nfe7MqFKLpzlBbJYruAQH8CYFiCCcVvBYGqZ80ovyYRrAmAWfeD9l9Zyl5QRa9EIR//3psaE3lB7HBzIhPKfI3PKbPj1MQduhMv82cTpXfNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=km3+1MlK; arc=fail smtp.client-ip=52.101.83.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1uprR9M2BqLjct9S0vT1yg6YvbvsfJUe0lPdR5PR5NzqbyaPuyvZkr0lMbSjaqiloF4+NkHjWD5q9i1AhzIozeqqIpVTkkECNMheLl+ry1UEh+zP06pYy95Sc+ajroMyboFtIrbXApcuNo8kGK1c/B5PKLGZqUEsMmI9r3yFkatuD6toK1EwyY0xW9HY21ifLwGxOXNuC9hCh4o8GPI7Hwp+YCyjFxSqphi0bPWFvAjYITcduhT+fu9bD39wseObfUJLlpgTtNMu1LWJXTqiBhZ75JvBlQcDyZ3ex5wr8IB/gnN/AL3JJFfVLJpIvhNKmibGqVkYhJj0yoEtstxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my1u7Ka5sCdrW/fgSDtb+bfge65GG//EMuEKuw36RZA=;
 b=TK71/Cq6EmnOZv2fpb1Pupgu2vjJ2ohgRI5/Nn+7I2RssKcaoSmdCyHjEb72N0JjSO7J0FCY95jffuSEyOAut20FcwidM5L32J6LcZId80dPIC7E30X7rG63X5nPowcQOmibpHX+okbRHS8FnOK5HTx3Aqh/BOCO3eFiQxAGsL/ZbQd76iYWFzpu6JqC9INy7gJyAnrUXQceS15PcsMCaaGNzbegmUXBG94AVmkTwTNWSNISYkPauDjyY+k+59OBOxXlWpryMhiUvWDCb1ER5qNj9BGHz5a1WJU//HBHYeq8x1biuD99VR6+52sMA4ZoNxeQs03LLf/9TFQ6T9tsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my1u7Ka5sCdrW/fgSDtb+bfge65GG//EMuEKuw36RZA=;
 b=km3+1MlK7TimXzqJHLyvS7BuZaLVz/x5VafBzAhlgABnZR9uBWkxKL1OEVghpOx9XF7t8RDbBaoxs77Wp1CULK8RSOnh/XKHxROFd1JRHtQ2WrT0B+DiU6xDdNbkxfa9fIBcS3u5FBbo1OLNnriBo/ctlhdC9d/LLkM/41Ddpw7n2MMhoI1OHlaQ9ADjRno3YuE5NxWjFddsXL//F03GPcpAWDN3RY2x/tGPu3hns3W94YU4FHvrgpgx1Evfe8JNbmWnPw1DZ1Q2rWzLD38C/dGkebeyye7En6kO7sRJtPEztg6xEO2eH3a/WqqXumretld1E7utzy0XZs7XUz+zeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:07:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:07:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Date: Tue, 29 Jul 2025 12:06:21 -0400
Message-Id: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3xiGgC/13M0Q6CIBiG4VtxHEcDfrG/jrqP1poBJgcqQWM05
 72Hri3z8Pu25x1JMN6aQE7FSLyJNtihz6PcFUS1df8w1Oq8iWBCskpU1HYJn8ndnKo7qlFyAQg
 lKCCZOG8am5bc5Zp3a8Nr8O+lHvn8fkPA/kORU0aNUhpQH4+C8XOf3F4NHZkzUfzogcGGikw54
 t2gbFjVbCisKW4oZKpQApiSSb2m0zR9AIowNEwcAQAA
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
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
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753805222; l=2721;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=in1OIJaaAaTNfIu5fxp61kLPwGvarDyPpthBXrRVePM=;
 b=TEeTHo57ls+AmwDo4fUjku2MktzEpSC/yU1qWxiaVks8iTl63Jf4ZOe45Azt/yCSnAnVt2F66
 PWpvg6tx2L0CTFEmEpBfYn50ZDTD9f5XOSoiiQdAXCMaRj9JvEVGEYU
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
X-MS-Office365-Filtering-Correlation-Id: 971dfae5-efd2-41a0-d132-08ddceb9f7f0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QTlDeWYybkhPNmpUZ3l5T1Mrdkk5ZDZrNFpURDY0N29YcVlhVFRkYlZPamc3?=
 =?utf-8?B?N1A3Z3N5MlpDS2pSWFUwQkp1cno2bzcyWURUVHlhdWlpRysya3YvT1R2N2E1?=
 =?utf-8?B?Qk11TUkzN05ueE5FNHNITmVBQ1FkQ1ozcXV4OFE3M2dYWFVGSEF1VTBaQUxM?=
 =?utf-8?B?Q0FqOWhNcGs0WXp5Mk9IS1QrUjZjeXZkbk5tSVVaOUtFSDUyeWhpeTZvZUhT?=
 =?utf-8?B?eG4wRU1xMVp5cEcxUzNJdTAwL2dRTjNkZDZnbTYwb1hiOUpFQ2NvUU8yUS8z?=
 =?utf-8?B?L1R3aWdEMXZxWTNjSXNlc0lnQm56bmtaTEdnakRqdWFYNXZ5aStaOEE5ZGdJ?=
 =?utf-8?B?ZU9wdVBLQkJVLzdRb1orUU1ZUTlUV3d4Wmd3NWU2WkxrUTRqckpJRXhGdGRU?=
 =?utf-8?B?Z3FyeTVUTDVma2lFbXJKbmNmZFF4cGxDWm8zdHJPTUhCN2FNME9CZEc5b2lv?=
 =?utf-8?B?cWpZMVNKaUpNeE9STFpzVVA0OFAyNHhIdFhGYm5DbGRFTEEySUdmUDJOL20y?=
 =?utf-8?B?Tlk5R2U1ZU9rV2E3eHJSWThmWmNPTTNNaStnVXFHNWlTRmptUWtkOEVJdDk5?=
 =?utf-8?B?ZWZSTXpGVlhpY3lER3BxVkJ0Z0ZzYkdNeE5xNSsrNnI1dVdxSlhGbzZ5UWVx?=
 =?utf-8?B?ekpCUmFQdk8vNU1UNjZLcERsVDM1MEgwMTBiQ0RXTllqc3dUN0dOcktwQWgv?=
 =?utf-8?B?TDVENEtOVzhIMjgrUGJmNlFzRVNDY2J2R1pvbGV2VmFST2NoZXJ5Yk9ONTZ0?=
 =?utf-8?B?R0ZXY09nRzhsUUVHcHVwQzh5NnFDVkxMdTVkTHJNVUNqeGcyTHpxbWJqRHE5?=
 =?utf-8?B?THA3MW9VTE8wMkdWT1diNXVWOG1PNkNXNEpCcXhiVEJUSXhlTFNzRjhKTm9s?=
 =?utf-8?B?b2VQNVhuTUFBMFBZMUJFVmlOZ2RrZW0ra3F6OUg0Y0J5cGJQOEh2RktEMmRh?=
 =?utf-8?B?clhWUlV5NzNJQTFIQUF0TmlodWxQVk1iT3Y3aVFFKzI2MS9oQXg0OGVrbUxm?=
 =?utf-8?B?b0xnamdMSjB2UmlCUUhvc3lOaWttcTZiY2Y3c3k3b3pUc3pRT1F1cmxUalM3?=
 =?utf-8?B?TkdCdkpJZHRHM2dST21OdU52dWFoRHdFUXNFc2pKV2dEaHozVmNXM3ZHdmpH?=
 =?utf-8?B?RGpjUDJ4cGZtQlhnQ1hRMS9rTlNjY1Q5REZjenVnMlFhL1VZLzBnVTZ5OU82?=
 =?utf-8?B?NDRGSVBHRHM1NXpOSkZtSDNNMXNiSllJc2Z1aThvbUxVb2ZmYUZwbFdZQ1V1?=
 =?utf-8?B?WVZ5dzJZNjJtZ2hoVFZIRTZ1ME5tN21ZTjQrOEVQZHNnNVVWZ1VxeFVDZnlR?=
 =?utf-8?B?cHV6R2tMdFZGSnBmN0paMHVobHhoMHZnZElwQm1UT3BiRDQxRURGSlZodEox?=
 =?utf-8?B?U3pJRytOMUdteVN2TDByVGltYkRQYkI3RXV2Y0pIYjJDVWYvNDNQRUlzYzRJ?=
 =?utf-8?B?MmQ5SUpwczhrSHNHMGt2Njh5T212QjVOeE9icklNQTRGQ3ZHdUw2K1NVNmNF?=
 =?utf-8?B?TW1XZXQ1b3kvOHJheFdHM0VHRG1pMjI5TGovTkd2UmU4WmRJRENZZnNyR0Z1?=
 =?utf-8?B?aVBXNGQ3V1gxQ1REMURUSjIrWmJNdjFsVU1rOWxTSVg2ZDI5eFdPY2NtZ2lT?=
 =?utf-8?B?TEd1YzZxNTNXOVBEbWVTVm44V1lJMy9XT0dFKzZtRlA1RE9oUTZIdS9Ta3dJ?=
 =?utf-8?B?Z3R4SmpSeFBtcVJSdkJNdVg3MHFsc05oQjg0Q1lTbjZrTUJRd3p5WnY4NlNO?=
 =?utf-8?B?cEpkTDY3Sld6bjViMlJEMEFseUNGZ20xdFZSNDlFMWNlM1ZvSUxzVlNNMFYv?=
 =?utf-8?B?aHhwaFNNQm1lU3VLekRYZzJPYU14Tkorb2N5YXB1QlQxSjd3K1BNQUZHNFpn?=
 =?utf-8?B?ZEpxbHo0TTNwL1BHZk1wYW5MOE5XMnUvSHdtRUJ1elFLRVhMdkRiSFg4eFlB?=
 =?utf-8?B?cUVzOWNYMitVd0Jqb01mK2MxekFGM1hWVWxmTVQrTStyNy95emx6MWZySzFF?=
 =?utf-8?B?QTlPeEhzTmhhbndxa3FnY1hwRzJBZVpEb241VEVPRWFDdUEvOXhTeE1CQmNS?=
 =?utf-8?Q?5rOxn6?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U3JDbXQwckxlanVqNEd1eE1XMW4yelhkZ1E3c0xYNzBMMWYvTFV6Y3pMUUdn?=
 =?utf-8?B?bExqdEtzMmtjSGc2cEZYZ1FoelBHNVVGN1BrUm11cVNpZ3NQQWJMV090ekhU?=
 =?utf-8?B?SGg3djNIWXpHSmZZLzJjQit0TE1nd0RmZWVkaldmTVkvMnZ5TWVtbmthNTkw?=
 =?utf-8?B?Ynk1T2Q5L1V2cFgwdXFXVEJyZVR2S1BsV3BpUUQ2TU5oK0dSbjl5c1FxMUNx?=
 =?utf-8?B?b1p1Qmo4RXhyU2g5UkZtNEw1THFsY2hjT3RHRTdaTC91cCs5VjV0SHhSQ3Z5?=
 =?utf-8?B?QTBSWmN3MmFkdDA5aTZDTmxuMWMzODFTbkErRHZKdzZlZEw3cnQvVi9nNDA3?=
 =?utf-8?B?RThqbjh5MEpGY2ZzUjNzanZWYlVuWWQ2djh2SDEzTEE0V3EvTkdIYjg0RHNV?=
 =?utf-8?B?c1I1MU44T3hHRUsxQ2xneExreHhuSDlrRytCRWIvdE5LTzlOeUg2V2xob1A2?=
 =?utf-8?B?WnJ0L05QNFRSbUpxYXc4VldVU1hhVVdJenU2QUw5TmhVakxhdlpUd1RPeTMy?=
 =?utf-8?B?SWhHV1pnY0VxaEhkcjBpckJORy9sUUVZY29qaUdLQ3lyYmdoSDFpSTMxRHIz?=
 =?utf-8?B?UUdSZXIydXZvSjZucVpWbTBSVkJFZDA3SEZsT1RMdlYrNWtxRDA2Z2hMUnhU?=
 =?utf-8?B?SHJCeXJ2TzQ4SHE5cXkyLzgycW9obEU3MnZKWXkxd2V4bzlRT3ZxSzhoWGw5?=
 =?utf-8?B?SVVoMXl2QkF4OGtGY2FkUU1UWDFwcVlIMUw4cWJZRm5KdC92M1JYY3Z2K0JL?=
 =?utf-8?B?WXV2OVdYMEhYMDdOeFBpTHQ3bFpOZ2FOT2pSTmJyTmRiQnFrQzNiWXFFZjVB?=
 =?utf-8?B?Rlc2R2RadU0vQVpaR1BEVSt5WlVVaU16UWcrb3FuWm9hUkowaDVEMGlVRUx3?=
 =?utf-8?B?b0tnR05GMjRZWitzVWE5V3RuMGRCbHB2RUdMczdhTnc0TzBsYnlmdmxyWjkw?=
 =?utf-8?B?Yk5heDBLUTNValZDcnhITzBPa2dPNG9BMmR3L3JVN0dlbEJjaUNNWDN3UUZh?=
 =?utf-8?B?c0ZiY3lwNWRHOWhMbzIxS1Rtckc1YWNkazNYMVJ4NjRmQWN6dHFKb2E5dko1?=
 =?utf-8?B?TjAwVlFmSitKaWFzVnE5d0NEbDdIeit2ODF5U0IycmtyN2x6NUgvaExjZnFu?=
 =?utf-8?B?TURZN2c0aTJOeEVXUlJGSzVERlFlaFA5eVUzRnZ2a2IwMDc1N2NFaW9BVUJh?=
 =?utf-8?B?UVdaWUNjR3cyUDZJc2Z0VGVDNDdqaGx3czV1L2tyRU42cTVrTW1TZFZQdVlV?=
 =?utf-8?B?SGVNMW5RTE1JVWRnemIvM1VwK24xeUoxa2xHaEJyeTN6cFlDN25Za3kzdmVo?=
 =?utf-8?B?Y0ZURmZYV1prMVBnYTQ5d2FhU1Q3ZkpFK1M0MUxTeXRGWEdjYTNUeDNHYVpC?=
 =?utf-8?B?cElqcnMwNlRyV0V4RDRmTk1GczI4dHAxQ29kK1RrTjk1YjlxZXlaK3Bhc1Av?=
 =?utf-8?B?S0dPRVcvdEpmaERKSFc3b2E1ejNxelN3dWRrZnBDNi9TSVBwQkJ0YXArQ0Fx?=
 =?utf-8?B?eUdaNkptYzBqK1VOWitIZ21OQ2tYWGwveHkzbTRrWENSUk1sWFdPUzdrSU5Y?=
 =?utf-8?B?MkorQmFzdXZ0RFJ6YUhXYTVmd2pKYnVPemFTZ0hqRStzUDFHZUlpMjBxZWMv?=
 =?utf-8?B?SGR1NWZxazEzckgxaGdZV0lwL1ZsdEFXUlZEY21WVlppYmVPTURwZ2tYNkdH?=
 =?utf-8?B?eGtCV1VENVlHWUw1T0QxL25tOE5JMUtQY1Z2Wk80TnEzTDR4NWRTcklHd3BH?=
 =?utf-8?B?bnViUTdVTE5nTnF5NDhWWWliT3pxZTNLL2dPVGxrbmlzcjdTQ1B3Qm1CNnAr?=
 =?utf-8?B?a1dsZzF4UHdVclJxNHU3a1NpbWJheFpMaFR5WjhoZ2ZIMGNyVjBnelJhOFhW?=
 =?utf-8?B?RnBhOGtFd0liTG5jemVBYnBMNGtVUFlOLzF0QTI3by9HaFVZakUraVZ6YU85?=
 =?utf-8?B?SkJvSnJNaUFrVTErcHNiRnM2MU1wTjdPV1hpeXd0NHNHT2NKZEEwclJ1T09S?=
 =?utf-8?B?dEdKbEZOTEJZWGQ5ODdSZHg1TnpuMVYvS09tRnFZODhGekR4NTBWTGtWcU5q?=
 =?utf-8?B?cUZxa2N3WWxkbDh5b1ZFNUpOQ09rTFk0aWdRb2dkZWRobDA1aXBNTm5xOUQy?=
 =?utf-8?Q?HpEp7m4HqkNJNDgb4ZV05ze3T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971dfae5-efd2-41a0-d132-08ddceb9f7f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 16:07:08.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXMfNMRAZbdo9E0ivu1PmXsbkP6ZOMxmJnvYe+IQB/JIC0SEWNRzL1UAQclDiBO4502xDMCCrHgBT/qn/HUz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551

Add parallel camera support for i.MX8 chips.

The below patch to add new format support to test ov5640 sensor
   media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes

The bindings and driver for parallel CSI
   dt-bindings: media: add i.MX parallel csi support
   media: nxp: add V4L2 subdev driver for parallel CSI

DTS part need depend on previous MIPI CSI patches.
  https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/

  arm64: dts: imx8: add parellel csi nodes
  arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- remove imx93 driver support since have not camera sensor module to do test now.
  Add it later
- Add new patch
  media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
- See each patche's change log for detail.
- Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com

Changes in v3:
- replace CSI with CPI.
- detail change see each patch's change logs
- Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com

Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel CPI support
      media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Frank Li (3):
      media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
      arm64: dts: imx8: add camera parallel interface (CPI) node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  11 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
 include/media/v4l2-common.h                        |  30 +
 10 files changed, 1024 insertions(+)
---
base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
--
Frank Li <Frank.Li@nxp.com>


