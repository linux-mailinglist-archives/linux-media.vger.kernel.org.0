Return-Path: <linux-media+bounces-29687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9ADA81800
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942BE1B83E36
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A742586CC;
	Tue,  8 Apr 2025 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZgHAf8lP"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2086.outbound.protection.outlook.com [40.107.249.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42E2580CA;
	Tue,  8 Apr 2025 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149276; cv=fail; b=RmE3d7oDkTf72FSCzhQC2q/UOK1RjqkRvRr1hsL2bv651fjRE5uFIa86LDGeZ3R8D2o30Bn9QcTlCyea9Zpnc298XP+H4V4w5AEaIhbZ1BPffu1/C/u00pZwiVWUt2aHZmNC+QI7q8mVL66T653ivbIcZxSzRybC+ESLzdNEb2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149276; c=relaxed/simple;
	bh=FaDfGMR3swA8QXQAar4w069jozmRmSBM+fQOBalUW/w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ku+yp12yA0mkEOMs8UWi15f5VphGxMQalzcfeSdLluU3wgFZEdcIt8NzGED1iqs2JbhDjTYAPLEkv3nvJNjHpXvymW8Y7BqW1cx/n7ZqiqZDWD/u7jJAXAFmE4reaBiIeMtEJGg3AYqxNU05hps7nGedzh3nW5DJL5C/s44+uxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZgHAf8lP; arc=fail smtp.client-ip=40.107.249.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCrM5s6PZ34RWY3iRGQiAFW3UTeOjZg8efSr1XvDbAeRs1IeqjAsr6YIn34pLZauJLQTC59/aS62V90XN6EI/HxCFV4174cRFy+Ni8GDgOoo79zeIA11z68iaY3ElHVYq64BisPgbfaQi6vNqDpS3V4tJNtGZiNV1w6XHha7a3wPrvb+dRIAcxBW9OFSgzG2Oz1/6M4J88JpSXCwPp/rTSyERyVIkUXMTO5HXhyIsZnxX93JyZjfvlIlWPBVuA6GX8GaYkFiU33ynXNXno5O7K0RtW5CH+OePaqIOQLhG4/Qw9xY8ROd0kzC7Io7r2mQp95rV8JBiWbUpPMTZy1bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dffwg9LBBpZq8rLz4RzxC3+OKWjjHLRSiKIlT1Q/7dM=;
 b=LcOUSHFwacTRqnXI6aD5bozI4BaVIgTunT7CxUqRfGcHlLoCRqs0K8Dik+cW4ctYBD5ylj4hfOCFzh/aeibO2fJgSiyMFgjnNjWPbRzb0Hr7+8umZ7FFJxn3JdcExAuCB+7jicrgpdP1IlNLR+sJybC9DBPqtoUy8LTW0RZ4MZ43KOxTV2WbH8ApLSJyM63eNQQBQDsVqG/hqBUoD+IAo/s33zrvCBOdIfjn5D9q5tgTh3RpdZ79Jz2wVur+U40Zt94oO0tjs1M8J1i/ASTeHrw69inbiFJ5nOfrNdXpIQm5u1Xi4OOncJXLnmZakVC3x8vKyOSD/JU3M8XPU4PSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dffwg9LBBpZq8rLz4RzxC3+OKWjjHLRSiKIlT1Q/7dM=;
 b=ZgHAf8lPsFtorEZ5VVxQx5uVXLQqIN/NLaVRaZs+IUdc9D9HlQzGDSIJWTVnJdXhiD/ve/ukBQesKMqGTAzvLUYLfD7jNMA5xWWVU3S5N/Kx0WoBi9FNEoqQ2170j0DXfdmIX8Qgt6Wh2UONz0YyV+2t3n3Kxzy6LUK+3AiZ7AscaOWuO4eRKxBU767ti6YdtIEXa4doo6V0n6ydu6fZVOLe3FuKYCgkxQNTWbnFTd3NsinXJnJZ03S5UujxiWZvi9Fwfr/H2Cp/ZTtEQZEVcilpYSYHfkDB936xbKH0xOup5kEyXBl7wzrOnqbNociQ/Q4GVq9grzD0v3rqcwi0mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:07 -0400
Subject: [PATCH v4 09/13] media: imx8mq-mipi-csi2: Add imx8mq_plat_data for
 different compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-9-ef695f1b47c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=4412;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LyukIx+1tiwYPq19TZRYdEvx1H1hK9TvpLaUo0+Fvmk=;
 b=vHENDKGEwBW/ntMVYAp+FdXOA6MiKjLxelVgNP4IFgF9xmYs26DkEATEo7COZS0JLeacX9oeb
 FoB7TuPBkdkCJPsRSYdiu5DbjWfpiVwvDZXR51OPM7Yp00j5J8AMdfK
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
X-MS-Office365-Filtering-Correlation-Id: 469c45c5-cefc-4548-9b90-08dd76e7f148
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cnQ2SDlnanVPZ2RxRjJQRlNpeDdqUm9IeVk3VWZER1VPdk5TZmwwbHdTamRG?=
 =?utf-8?B?SHIxSGlsU0dRN0t4c1duWWZJSDc5U0ZSWGhxRmp3bklObFhjWVpqcnJ2ZE9X?=
 =?utf-8?B?VUpMUll3ektQbm1ncDd3aDlXTDMwVmJReXltRXdGVEoxTDhsSGYzZ3dZNm1l?=
 =?utf-8?B?cWJQSGtrR0dKTGhRWTIyWHJlQzhVZ3FCdTFQR0pwSHJpOGZUMXBWbHRDT2x0?=
 =?utf-8?B?YXNWcDZvTkpBWnpRaUZrVFY2aUVLS1hyVCtzU2Y0Vmx3WHBaQUxKdElNdWhk?=
 =?utf-8?B?TFJIb2htNjJhOXNGS0lXRG5IdmQyb2pvcmpGajlRTHpDNkhFVVFrSHoyVnV0?=
 =?utf-8?B?YURReCtQNmpxeUJsSW9qZlpMSURtQU14RWk4WnFqRDJzTTR3emJwRFJCVFRH?=
 =?utf-8?B?L3R0aDVjaWJpaHFOc3dNKzBQNEdYWVExNGVEK3ptbVUwd2paRWthZVBPOWpM?=
 =?utf-8?B?T0JSUy9nOXdmVEo5Tk5ZQWorMzhZQUJtVGJLVWZzTDZ3ck4xSXJFdTlQZFVY?=
 =?utf-8?B?dmRJa3BPaGZwMmpUZktXS0lOYVFMa21sTTdyZE9URkFOeFdYa1h6eFd0UmVV?=
 =?utf-8?B?Z2w4UitNSWtTVWRmY3YwalorZTNRV29mam40NmNDNHltem1WVGtFM1Z4Rm5P?=
 =?utf-8?B?Y21aR3BXbmdZZE92eTVvbSt5Tjg3ZlhOaExEMW9HYjRLcEF3VlpEK1llaWVx?=
 =?utf-8?B?Q2pSSHo4WUQ4VG1ZSVlsT0x2UXVJMVRyWG90TkJoRUhFa2U2YlV1cHgwTmxo?=
 =?utf-8?B?NzNXQStrTExiM3RDRFpVWVF1eVNPeWhmVWU3UGh1RjZNeFlhaExqVExKZTY4?=
 =?utf-8?B?OW1XZm1ueUt0RmttMTRPOTBzMUtMVTFvcXVVbnA3R0Vqdy9BYnN1Mi9OSGth?=
 =?utf-8?B?U3FGU0l3K0xuQXRadUg0YjJHcDFrQjFFNmxIZUsydkx5M3gzK3MwU05GQUQ0?=
 =?utf-8?B?ZE5qTkZaR1NtU0lBbjlPODlYSzJHZUZ5aGZQNm8vQlBnUHkzb0FjTVZjQ3ky?=
 =?utf-8?B?cmhKejdTU0tlcTM2NzNQeUUyWDJwZVZnN05sMTM1c2JHSVJKdmg2azZIbGt4?=
 =?utf-8?B?S1Y1L1lHdVJMVXB3dEVWNTVKOHVPc2hVVC80M2FSWTUybDJCYldVNU94bElS?=
 =?utf-8?B?MFBwQ0xIM0Z4eGhPdDFJMEdiVmVDbVYxVFNLa0d3bmVGK3VJVTAydzlZMHFQ?=
 =?utf-8?B?NjVhNnJTK0RBY1pPV0tXQ1NtNTd1Mmo0dzdacHNWNnB3NVVDTDNvZFhTMkQ1?=
 =?utf-8?B?MVFLZ1A3ZGx3UkFwc0U0TFdtM2lGRlkzeDRQVUpCZEVxYS9PUDcrQTIvZmor?=
 =?utf-8?B?YUJ0YStuZFZ1QlgvWDJOYjNWdTN6M0RvOFdCSnV3R3hOaVA5TGhSbVFxcTBY?=
 =?utf-8?B?RXlTeXNLQlJXY0Nja1NjVHoxeXJTVDJIdkR4UzJvT0ZVN0ZPdjdiYXE0aUU4?=
 =?utf-8?B?ZzFRb2ZHRlJneFNZS21FNk1mVHRENlZ0cFJoeDV4YzU2UXVBRkdlcjdCR1Iw?=
 =?utf-8?B?MC9ZQ1dIL2tVT3l2Ymp3VXgvcnV0aFk1SEFzZGhHemNtR2hLTm1aRk9ZTTlJ?=
 =?utf-8?B?eU85a29iRCtKREc3WkQyaXZabkxZM3dWNlpMT0VwbCtBR0U3cnVJU3BaUFNI?=
 =?utf-8?B?RlNsN0hiZS9wY0hCR1hTa1huWlg1NURXTGx4eXlZNnhORHNXR0RmVTBSMmxN?=
 =?utf-8?B?bmFvTGp4NG4xRHVEWWRwc3ljUjFpNzBFZTdqOVFGT1ZuK05hRHhaN0crNXM4?=
 =?utf-8?B?ZzU4OU4wM3M0VHNiU2xRKzRCeFpLZERZT2tRWDNUc0NPZ2NVSm5rdkJWbEs4?=
 =?utf-8?B?aSthWVpNcGl4dXRjRmQzbGI0bFJiVW5haDVBanZlNnBITEc1TytKTE42Vzd6?=
 =?utf-8?B?bHQwVXBHQ05BYTRSd29OSHVyV3JpVGphYUR5S0tiZ1N5N2FZQkUxTFY3Zms1?=
 =?utf-8?B?angyVG1JWGVPczlmN1g5OWhTamdtb2piZkJxRmRsUzlnN1Vzb2pqUGs0VGNU?=
 =?utf-8?B?OGVtS2ZvQjdRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dzFpdWhnQXZxQlZiZ3c4aXNGcDZOQTRlTTlSdEVzRDEwZko2UjdSZjRwNlNq?=
 =?utf-8?B?SkFwb09FS2M0alNaaVg4U3EvSTNqQ2FOYWIvaXZrWjl5RHdVeFVOTDRPK2c0?=
 =?utf-8?B?TE5FVGNvR1ZkS21mZUpQSzhjVTFFR2tFMi96ekdqWlVTVjI0eXpYL0xhQldE?=
 =?utf-8?B?Z3hTOGI0SjBhNTFrZlJiWE1yZ2FhR1JsaXg3TDlEbTZBZHN1UUxjbGtiZmVR?=
 =?utf-8?B?YkdZTlM0L3BkZFVSZG1Sbm1vUWVKQ2tyeWlLWlJ4dG9LTU83M2VGNCswcis3?=
 =?utf-8?B?WU1JVkNlMUxQTW14Nko4UXJpY0RzcEtHTGd4U1hZVXkva3hySDNWbGEyaEd2?=
 =?utf-8?B?MGcvL1lRdDAwbFoveGVINEFGSjFLbnlONE9xZS9qMmNYcEZNVWtsK1NRdDJ4?=
 =?utf-8?B?UC80UHlYQkZBTjE4M3FZS1pROGpkTXN3dzFHRDc0UmpHQlNNa093RHFxWUYy?=
 =?utf-8?B?MkswQ3N5UjN4MC96aDN5SDQzWnVWOE9Na2tZUjRHUWxPNGpEclltSnB6cTVy?=
 =?utf-8?B?c2tuZGlYSldVNDhIcWZaQ3BsZVRyb3U1QjJtUUJhU3FxWGVNalJqay84U0hL?=
 =?utf-8?B?TkFraW45YmJlUVNMRWtwNFdlT0RSVElTLys3bkNhSWR3RDNzVFJkU1VKc0dh?=
 =?utf-8?B?WXJzUDlGZEJYTytUNC93dy9YMDVSZmZ3YjQ1ajBxa2pwemxMZjdEWjZkZDQy?=
 =?utf-8?B?dUZHaUEzd21lNXpIQllXTCtkTVN4L0duY0dxSEl6aFlhV2JaaC9iY2dwQTQw?=
 =?utf-8?B?cHpRUWd0Ri9KakNaY1h2WE00c2ZMV2hxTUJWMDgyM2xTaVFWQThjdmo0YmNG?=
 =?utf-8?B?WmNHVTV3NkhZZ2FJaWsxK1BUQXI2VERsckRnK2YxMEp5UG5XQUVOMW5GK1hZ?=
 =?utf-8?B?U1E2R1ZxZ2NZSmlkcGFRZnNkemZKd241aWlzeDVhMUhvaUh3d3V1ZkdvaUho?=
 =?utf-8?B?bGZXSmwrV0NTOUs4NXZ6MDFTUklMdkx4R01wZXZPai9tK3ArSHdyZjA5bjZP?=
 =?utf-8?B?amJGaWYyQTZlWFJxckw2UU81L043dmsrTGlDcytlcDJnb1lxb0lwQ2hlNTNU?=
 =?utf-8?B?MnEvd2hHU0RtWFR0d1cvY1R2T2xCNXdUMDhrZWN0WElzN1haRmR4SmxZd2VE?=
 =?utf-8?B?d3VMMm5MTzg1eEFlRjJuWXJUaGcvYVIrdnBMYVJucW5PVmduR3N6TmN1Sk8w?=
 =?utf-8?B?Rm81UnM2bmJwcUNDNDZJNU1YbCs1akQ5QjVvaG5Qd1dObExVNDQ1V1JDOE5H?=
 =?utf-8?B?WTZrZm9hTXVuRmhnUnhUN2RVL082Q3lGeXpNSFBVTUZRc3ZUWDdpTXZUbThI?=
 =?utf-8?B?YXhETjdYQmMveVJ1YjRFc25TZzlzMjkvdzcyckdGeS9Gc3Zrak8razVFTCtP?=
 =?utf-8?B?RGVEaWRwV3daMDRaa2pCWDNsSVU0Z1JuZ0pHbnBqbW1USGtPeWtWcko2RjlC?=
 =?utf-8?B?ZkhRTDhOY3JNd0gydDVZZk5tM2xpbDE3NWpQUllVdktuckdZazZ5Y0d1YzN6?=
 =?utf-8?B?QzBPZnB2bkRqbzk0L2FVSEZ5aFhjbnJyTVJ0V0dQR2lhcFhnd0ppdVdWajQ3?=
 =?utf-8?B?bDNjTXlEd2RkL09NREV4M1ZzY1ovUURuMGhEbktFS1lCcnFIUUZFV214OGJ1?=
 =?utf-8?B?RktReVE2K0Nkckozd0Nzb3h2TnZneWZ3TkdXVmsyeFBLaCtieTFyUEsrL2R3?=
 =?utf-8?B?MTdEOTZtaTdPWDBHNXlGUksyaDdIZDcxZm9GZm44NjRFeDB0RFRtdUtYZ3VR?=
 =?utf-8?B?bjNBZ3hIOUY3dG0rRzdsY2lJQk1YUDRsRVBjZTBydVYzYjRiNGRJRTJCZ2Z1?=
 =?utf-8?B?a2tjZnJhYWpaM2UxU3Y4RUhGWXBTcFpqaURxdFJLQXNWODdKenQrbXRDbXJM?=
 =?utf-8?B?Y2M0MXA2MXlMQjRBcnhxRWpza1NFSXJCL0lWNHJERmtrNjFoTmswSDlkb2hK?=
 =?utf-8?B?QXl6RUF2UkxaV2NUOXM1MkpxRWlPZkVEUENwZ0Qzei90c0dBYWhmR1JvQ09i?=
 =?utf-8?B?MnRUYjU1WUJSZkI3WEZLb2RieGdNMTNFUnEyUzh1RlZNeTRJVENadzBYRS9I?=
 =?utf-8?B?a3gydmRNOHZwNG91ZzN1aXBMdm9TdmgwUDdES1NvN0cxRGdlcUlibmc2b2o0?=
 =?utf-8?Q?U1sdCkXjai0PJopHYdT/QqKff?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469c45c5-cefc-4548-9b90-08dd76e7f148
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:31.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoAlEm6fGJT3pSKxxwhwFxO8sAWBPe1tRlzfr4n9MR+0MIitMGs29JUExffJXASP8CzYcWGY0P87P5SE6qQN5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Introduce `imx8mq_plat_data` along with enable/disable callback operations
to facilitate support for new chips. No functional changes.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v3 to v4
- Add Laurent Pinchart review tags
- remove unused 'names'

Change from v2 to v3
- none
change from v1 to v2
- remove internal review tags
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 58 ++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index a8bcf60e2f37d..59ec7107b4508 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -62,6 +62,8 @@
 #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
 #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
 
+struct csi_state;
+
 enum {
 	ST_POWERED	= 1,
 	ST_STREAMING	= 2,
@@ -83,11 +85,10 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 #define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
 
-#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
-#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
-#define	GPR_CSI2_1_HSEL			BIT(10)
-#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
-#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+struct imx8mq_plat_data {
+	int (*enable)(struct csi_state *state, u32 hs_settle);
+	void (*disable)(struct csi_state *state);
+};
 
 /*
  * The send level configures the number of entries that must accumulate in
@@ -106,6 +107,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 struct csi_state {
 	struct device *dev;
+	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
 	struct clk_bulk_data clks[CSI2_NUM_CLKS];
 	struct reset_control *rst;
@@ -137,6 +139,34 @@ struct csi2_pix_format {
 	u8 width;
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8MQ GPR
+ */
+
+#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
+#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
+#define	GPR_CSI2_1_HSEL			BIT(10)
+#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
+#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+
+static int imx8mq_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	regmap_update_bits(state->phy_gpr,
+			   state->phy_gpr_reg,
+			   0x3fff,
+			   GPR_CSI2_1_RX_ENABLE |
+			   GPR_CSI2_1_VID_INTFC_ENB |
+			   GPR_CSI2_1_HSEL |
+			   GPR_CSI2_1_CONT_CLK_MODE |
+			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+
+	return 0;
+}
+
+static const struct imx8mq_plat_data imx8mq_data = {
+	.enable = imx8mq_gpr_enable,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -371,14 +401,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 	if (ret)
 		return ret;
 
-	regmap_update_bits(state->phy_gpr,
-			   state->phy_gpr_reg,
-			   0x3fff,
-			   GPR_CSI2_1_RX_ENABLE |
-			   GPR_CSI2_1_VID_INTFC_ENB |
-			   GPR_CSI2_1_HSEL |
-			   GPR_CSI2_1_CONT_CLK_MODE |
-			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+	ret = state->pdata->enable(state, hs_settle);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -386,6 +411,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
 {
 	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
+
+	if (state->pdata->disable)
+		state->pdata->disable(state);
 }
 
 /* -----------------------------------------------------------------------------
@@ -876,6 +904,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	state->dev = dev;
 
+	state->pdata = of_device_get_match_data(dev);
+
 	ret = imx8mq_mipi_csi_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
@@ -953,7 +983,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
-	{ .compatible = "fsl,imx8mq-mipi-csi2", },
+	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


