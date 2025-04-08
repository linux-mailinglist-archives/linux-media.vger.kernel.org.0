Return-Path: <linux-media+bounces-29678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61226A817E6
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09795424ED5
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3871255220;
	Tue,  8 Apr 2025 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K5eJNiFr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2075.outbound.protection.outlook.com [40.107.247.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D461E2843;
	Tue,  8 Apr 2025 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149239; cv=fail; b=rcuudM0OKa/rSA0J9Vi6WA1Bev40vAzYy4pWTFjz+lCdG+ay8o1IgFNn9XCC+fI1ivdj+d/UUpHqwWOj/dFDmn8Cxc/DzVJ4X9AdqBpGjRgMXnYyR13EeuAz7z5WvfRuORULPplE8D6d4hFN9rpTnFHB6VXVgwBzGcdwnbNUXDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149239; c=relaxed/simple;
	bh=g1fY95P8WjfgaXTPePR1Dlmfcc1XaeXEDaiXdoLrYG4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=tV1DIworblYlDJvDm5x5ZxnXdZH9Qv9f/8HnJMM4rkD2sbz4RKK2+3xr8J+IZ8jCdK3zMcslTyuDMKxHo8CEpW1xWippjF24Yi0W8LsuOhFB4IX46QOht/sEBtM7OspUjNQxoEVYYjY7ZbZxJ8+2LkDtzH1wJqzkTutxCktZX34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K5eJNiFr; arc=fail smtp.client-ip=40.107.247.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBX2ASafdOrswRtW+ZQcdVyfx58WE7ROKtV4WnbxBesjgjk3K72W76RF3r9yNsY2xXTVYyP7Y66L+gPU0bwf2Lj23F9t76kqTTjmdFgb4L3AtXinnYLZXImTodJ+lbo9ZuDvgo2rvKSv+7HbFmSdy0m7Ii4k7v7RkqgcReH6T4k4pVJ8tybUfg968cBqPpVGM4iaTSR+FyCmZHl4yBNL/oPfqTK4a/z82JnUxdkLQfOq0gEXHlTJKpxFpP38FjSbp646zDPpmgoOkw6XvPP+HhWfneuEf8Bd7lP/6BZGHuMa1wQO4G8uCaR4GgGJ0s4U0bpgq7QtrCrBa8mAarFvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbmBTDc/N9bwv7GP6tMoLmfcF5DZ/CZlC82CTcYIIeI=;
 b=HkOM7TqgEj5enCv38YmCHUjAVwHeKsw2fI0383hgfeXnbBhS2aAZ3NWlxnSUzMjAijqObp+EUoJpOb9oD6NC+Gmg0dgUzPIKm96Pq2BU2Vge6YPI6e4YGMPOpxBFpXwSCue5imJb3kc63v0cA/8AiGh2NmnA0R3Y22ZPFQ4D1kUm5x0Maw0ouQg3lRpAZBXTgYO4sL+bW0F4OZW62tpGX+eaGf4bTQRHVfDNWV8w9s+8WyFlS7IhxHaSh6Tw/jfL/JsKh9N++Qs1Kw5Xp9rXRXnHkGDj69ttiu3SJF6dp1HCf4GA4Omub0zQWGTIw+1AT35exYstSqeVVPdCNlIzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbmBTDc/N9bwv7GP6tMoLmfcF5DZ/CZlC82CTcYIIeI=;
 b=K5eJNiFrzNXLq7ocbqU12eYyqYnlDP8V41VINJqVkGkww3cKycHI1XydHqg+L9jDqwYpmh16r2Vu+OCLZ10Gd/cDiE0SfsZ6fXLDonJ5hLrATZWXPaHXqec11Cu5osmvzohcBSPMkx2T6OwjuzSfpWJCsceAY6D7ONGKbKw0uzLIDbY8g2ufcA3mkFvqGNK1CRS4DZlWkPPVx+C/aURM7KIF/ma3jFWFtEk49RN4uKHFjVkVn2fOtj8zZx7w34wANRRW8i0pG6n0UxbZQsAfzo9BZ2oopxQF99n6KpUfJFFcuPfjLI3M1E3wrnzfcgI/nGNgjl/dXB9iCbJq/GUTAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:53:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:53:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 00/13] media: imx8: add camera support
Date: Tue, 08 Apr 2025 17:52:58 -0400
Message-Id: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqa9WcC/1XNywrCMBCF4VcpWRuZyaW1rnwPEYlpYrPoxURCp
 fTdTYtQszwD3z8zCcY7E8i5mIk30QU39GmIQ0F0q/qnoa5JmzBgEhAFPb2m8a5VZ7yiGpWVlag
 bDoIkMXpj3bTVrre0Wxfeg/9s8Yjr9dfhmHUiUqAcawFMPUoo1aWfxqMeOrJWItslA5lLlmTFU
 XHTWFYJkUv+JxFyydefTFiJIJXWepfLsnwB/B4JlxgBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=3867;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=g1fY95P8WjfgaXTPePR1Dlmfcc1XaeXEDaiXdoLrYG4=;
 b=bfecjaVpXPSMqtTEwTbXe+bLmM4hHYp6Axck9WJ45Fild7Gm6WuijLnuv7DZPSTXkz6mdKdw0
 ky1CVDEDpOCCOCZcpOaxP0yuxhZkWsAQvHGHyIERGan+10DuJhxOVPA
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
X-MS-Office365-Filtering-Correlation-Id: 15d67b15-3e5c-4a46-12ea-08dd76e7da74
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MHU0WDdnbDZQeUFhNk9zcWhsb3IwTlFFNlZ2eVNoTVRocHVsK0k5WWtrdG1Q?=
 =?utf-8?B?bjNpVGRDNmdDRWRDRitQc05qWUpDUmVGVEpEQzVQdUJMVTJSZHRCUTFCWXNO?=
 =?utf-8?B?bGZLaUZBcnMvRUdWUFFVOUJ0RVd5b1o5TDVsajRJR2tBRlpURHFzZE1WZ1dZ?=
 =?utf-8?B?akIrTEhSSDl6Zy82VXo2RERPTlpyMlRxemRnT1k3SEt2dkJXMmZNL1FWVk1y?=
 =?utf-8?B?bHhSdklWRDdiQjQ4ZlY5bkVVbk1TNUdCeVVFL2pWRDAreWlxeE9YMlFORTlN?=
 =?utf-8?B?a0I3WTlOc2w1d0dnOXBUTGpWMnZmVjFxVEVlSFhrQTZ2RE4xQVAyWmdmQXZo?=
 =?utf-8?B?REJpVzlxYXNJRk5kQlJLc0c1VUFILy92NFB4aGNiMXNpZmxSYW12ZmcxQVVn?=
 =?utf-8?B?Qy8xUFVEcGdGSTFJNWlrdXJYbmFEOGJKaTVPSzJBSExpM2xQUmFWRys3SERF?=
 =?utf-8?B?clFCQnF6VXdvak51WEpmYnc2TkJ0K0R2djVibjVldEpuQzBMT25YU3pnNEMr?=
 =?utf-8?B?Zm52ZUNKbmRjRHpBdGsweW1kR1cxRDVkTW5uMkZGd3lpZ0YzV2lwWGp2SVd5?=
 =?utf-8?B?TzNrWGp0SGJSTC8wcUk4ZVBSVzN6em9Yckt0NzVOSDhoSmd2L0NHUzBxcytq?=
 =?utf-8?B?enRzc2xnQ3VPeSs2azVqK0tWTXpSbkVGbTNyQkhZMjdUdzdIem4yc2VLTHkw?=
 =?utf-8?B?TmEzTm1xdlJjcVRMYU90ckE3OGRRamxFVWpIMTFpQVl0UXY5bTdIejlqWXZm?=
 =?utf-8?B?Vm9odnVCTjZUemN1VGlLZmZoNEkyZFZyajZJRW55cGk2N2phNGdWdGhYUGlO?=
 =?utf-8?B?MGlUZW5acTh2MklQUTZudWd4TGZVREhCcklhQ0dtb0JaRk04QnF1TCtOS2ZP?=
 =?utf-8?B?S0pleGszdTJ5dnRVZ1U5NVlaSDVsYnVrcXJKUEZValE0N0ZTZFBjTUdNQU9T?=
 =?utf-8?B?WU5sL0RLWGV4QkNLQ0JGSXB5REdvdXpqOC9NaVJmMTI1VWJYcUZSR3J2VVlx?=
 =?utf-8?B?dno1N1JEdlZ4SlJMWEtBRXRUcUZLR3hZMEFVWkl3UVVoNzRBeVRmcGdyc0da?=
 =?utf-8?B?U05WR2ltQmZlWFpRcFpiQUpsbFZnY0JOMkljOENpcnV2NW94ZHE3bnVzTzhx?=
 =?utf-8?B?bDZoVTI4TDEzemNsQUFmZ1F1TlBDelhZTlh1VHQ2aXU3WjJEQzAxOHorUUhJ?=
 =?utf-8?B?WW9ScmdqSjFUY2N2Rnd0bE9oN1pUdTRYWHJEYklkdStUUHg2Smh5VEdJbDg5?=
 =?utf-8?B?azhaMzFGaWp1OEJwb0N2NWxWWHgva2xzN3RGdFloakJXeGRMUVZsT1JSSlJV?=
 =?utf-8?B?TnVIWHEwdmlyVG5XZ1NIMlY0ZlBBcmhhc3pLREFFa1JyOTVSSm8wV2JqQ2J6?=
 =?utf-8?B?b1R6SW9FSjlBMWRiUXl2UGJBVzlxNitzZ0cva096bWd2cnQ0eGh2bytLUmlr?=
 =?utf-8?B?Z09NSVgyTU1iZ1Rkd2N3S21KK24xcGpCdWxsV040RzdadE5EdWZxUzhsRFU2?=
 =?utf-8?B?bTVuQWY4Sm92ZXd2eFVqY1N3YlV3UnovSEtVRmZRRVRDaVNhQVBIRGc1ZXNo?=
 =?utf-8?B?enJObjR3RFlvSUpRazk1d2p0YTkybTBaOW05OGZONlpjcjQrVzkyZ0ZqWGhM?=
 =?utf-8?B?djZ6QzNURWowMXFJSEZDN3BWU2JnU1JVa1VJWS9aVVNjMlV3SVIvamZsRlUz?=
 =?utf-8?B?SlZLc3pZVE1HVE1sMnpnSXcxMU1nTHk0cnJkUktCdUppWGpCMjhCd1FnRGg1?=
 =?utf-8?B?VC9MbWNhNFlRNktLUWZTak53VjZ6b3JIK2JaQ0tQdjFpSFp5aXVWSXlDRGNT?=
 =?utf-8?B?SHM0RWJLSzN5M0ZhNm1SWFpKcVgvMzZTa2dxYXltcWpZMjJpMXc3MThtcnZZ?=
 =?utf-8?B?dlNVODl6cE1xSERNelo0S0pqNWx4VlZ6YStQdkI2bnBNNThTRDJPTHZpdHd2?=
 =?utf-8?B?T01YZDM3bUI0ZndGeXorWi84UjBVRHowTEVCQ3VnbzM1aXZIQUt4cEFlTUNH?=
 =?utf-8?B?UXl0bkdCZXF3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RXJpN0FTTDJXN3Z1VWtDVE9jZzl4MTRNalgyQWRqYW12UjJtTDVNVzI3ZlJS?=
 =?utf-8?B?Vzl4MVRtTEI4SnBkbWdNU0NHMTRCNEVVY3IydEpSdnJrQWtxNW8ra1YzU3ln?=
 =?utf-8?B?TXRFRjEvL3c4VG1yb2NmMkRiVnd4ekJRb0dJMG1JRzVhTDB6VGNjcm1LV1ZG?=
 =?utf-8?B?d0tWYXBQOVZmRGhzMEI1M1hTcHVHZFlkeEY2Sy9YY3BZWCt4cEJaaXBFQW11?=
 =?utf-8?B?cm8wWnUzV21ZZ2c2VjVIUllzekFjSzRxOXBWUUhYSzZRU3pzeWQxbFlsSEd1?=
 =?utf-8?B?M045TG05Z3ZKMWxOZy82UWFsaVVZTUc2M1dWN09nMWpxampPdWlqQ0tFQVVE?=
 =?utf-8?B?Mk1lTENZM0IySHk5cUVTSUJBR2Rua1lTdGlOTmZZSWxpYTJ4ZkZ5aTBDR2Q2?=
 =?utf-8?B?UC9VeEJyMEdJVGJXQzcxSVArZ05DMmpPZXZtWks3VGIxQzJzZjNSdXdtcXVu?=
 =?utf-8?B?cjRNREkrWk1OU0NVSTAyWGUzSkNEMDZkR3RWSDlmMXdZQ3dBSTlzTFQ5Zi9S?=
 =?utf-8?B?RHlTekMyT05tbkpmaStQSmhkT0tmdEUzd3ZWUVBRZklhT0pxcEJqWjg4OFJ2?=
 =?utf-8?B?dldJR3pZZXRBdTNvQ3FyS0FKZTQ1djVSbWwrTkRYR2FxdUptMlZ1OVp0SXJC?=
 =?utf-8?B?cTNrQWpoSDB3YTU5Wkdpa2x4WFFOaW5YMW9ZckUzVERuMnJ6Q0hTZ3RBZStT?=
 =?utf-8?B?MzJUeW9udHRJcE1tYWtCTWRDdy8rMG10MkhhV2RWYStITkVZS3N4OWtNWk1r?=
 =?utf-8?B?b0lMR1lxKzRWUzNPRVcySStsclIva29SQVljTUNhNzh4UUlpRk9HOVhDaUEy?=
 =?utf-8?B?YjVTTDJUN2ZMN3J0OWFkODhGend4a3c4Z0dxRG55WjEwMHJKem5UWEdyTENo?=
 =?utf-8?B?UXpiLzE2ZGtPZHJnQUIyQ0VUWHFiMzE2aEp6SkN5eWc5eUY4eVNWdEZpWUJP?=
 =?utf-8?B?dzRock1lczJIcmdoVkNWcjlOSHdmdU4vbElnR3JpbFlJQ2JxMlJiaVYwZDht?=
 =?utf-8?B?RmxzY2QxTnZWNUlaQlVrZWlML2h4MmhRc0w2QWxwcjJIQTRxeFdQekxRSlo2?=
 =?utf-8?B?Mi9OOTlGcTBrVXNpTFIzaUpKWHNuMTVYZi9YbERnR2ExL0ZWaHZna1NIcmQ2?=
 =?utf-8?B?bFNlVWdZWEtUOVhtU0kwRUpBeWNsUHh0eTlLRUQyMUxteHJLQUw3RTZpYVZK?=
 =?utf-8?B?QjQ0bW1OdVhhTk9MTkVzQm0zTENYaHArSTR3WjlQWVpob2RnbU9QTS9LcER2?=
 =?utf-8?B?dlZlQ1Y0NkxqVnBia1hFSjNyaU1jQkIwYktheGNUU2dJbVNBYjVubUYwUnNt?=
 =?utf-8?B?WEdOSU9uMnhSeTh3bGNYbmFOaVZHRVpXRmlPbGhaZ0xzYi81K212Sy8yZTM2?=
 =?utf-8?B?SlUrY29pSm1GV2VGVVlId3JQZ1JqbnBvN0x3TDVEalVVUk5RYUdreDFrb2lI?=
 =?utf-8?B?NGpjZ0JUaUpiQWlVVmp6cmhjVyttdkJXaGt0Z3dnWG04T2ZJdUFxZHFGd2Er?=
 =?utf-8?B?Umh5aDdPTGlodmU0OXlyY1FFVXZsVUs3WGpBTTN2bnJXelRTS2Q2QVQ3a1RW?=
 =?utf-8?B?QWh6cnNDOTJYcXFLRzVQaHd2NXJNakJId3l1WEFhaUtUdEVWYnBLTlRUalR3?=
 =?utf-8?B?eUk1cjlsKzhTTmRJOTlMMWk3MWc5dGQ2QlNPc0ttaEthTkFtc2ZEeVhmaGsv?=
 =?utf-8?B?ZDFzVXR4NXNBMFQzWW1nVmFMNlZub1ZBc1F1Ri9zSXhqSGZEcFJyWS85VCtM?=
 =?utf-8?B?SzRWM1JVaUdvdkVpSXA1bEkzYVh5emQ5eFZNamdPM09IOG5naEpuTlJCaEpP?=
 =?utf-8?B?NmNuYlFwTjcybHR5WURWZGFtZVpJalRhRmp0bnlpZ2dHbjhaSTA4MWhQVXQr?=
 =?utf-8?B?QkhmQ0F6MEw5dytlTit2MU9kWFRDUDU3cm54aUFKYUk2UWM3Zm5COEFPbXBk?=
 =?utf-8?B?eUgvQ2hnbm1sdFFtVXRiY2ZCRUM4azJONUY2ZzcwdEFFQlFsOUdjaTBJbm8x?=
 =?utf-8?B?TEVZZjVNY2J3YVVXU0hwMVEvWTM2VE50VG1ISFBXWHY5VnlERXFlekZnOEdR?=
 =?utf-8?B?eW1NK2JhUnViSGhqQ0Z4Z3p3V1haTSt6TG5ZM1dJYmJQNngxNmZucW1STWQz?=
 =?utf-8?Q?n6OM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d67b15-3e5c-4a46-12ea-08dd76e7da74
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:53:53.4935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vp/YlgdhkJo6Z5kQ7bb69KCYY5AzzQwsoet88UrOtQtqRYI/tSdq2YYgfmY85QxVyGWGSjpnLNH62/JO87k1qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Add SCU reset driver for i.MX8QM/i.MX8QXP.
Update binding doc.
Update driver for imx8qxp and imx8qm.
Add dts files for it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>

Changes in v4:
- Add 4 clean up patches
	media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
	media: nxp: imx8-isi: Use dev_err_probe() simplify code
	media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
	media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
- rebase to v6.15-rc1.
- Remove scu reset patches, which already in linux-next
- Remove patch
	 Add fixed clock node clock-xtal24m to prepare to add camera support.
- other detail change log see each patch's change log
- Link to v3: https://lore.kernel.org/r/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com

Changes in v3:
- Remove phy driver parts.
- csr is dedicate for mipi csi2, so add it as second register space. csr is
mixed with PHY and link control with csi2.
- Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com

Changes in v2:
- move scu reset binding doc to top scu doc.
- isi use seperate binding doc for imx8qxp and imx8qm.
- phy and csi2, compatible string 8qm fallback to qxp
- remove internal review tags
- Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com

---
Frank Li (10):
      media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
      media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
      media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
      media: nxp: imx8-isi: Use dev_err_probe() simplify code
      media: imx8mq-mipi-csi2: Add support for i.MX8QXP
      arm64: dts: imx8: add capture controller for i.MX8's img subsystem
      arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
      arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings

Robert Chiras (2):
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings

 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 ++++++
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |  11 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 +++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  60 ++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  67 ++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  85 +++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   5 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  59 ++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  86 +++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 133 ++++----
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++-
 19 files changed, 1328 insertions(+), 94 deletions(-)
---
base-commit: 1f665976a7c4e8779566e153b8854d7829ce33ac
change-id: 20250114-8qxp_camera-c1af5749d304

Best regards,
---
Frank Li <Frank.Li@nxp.com>


