Return-Path: <linux-media+bounces-41219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCEB394F3
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D483A4FD1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA952D59E3;
	Thu, 28 Aug 2025 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RuOl66qC"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D32DE6E3;
	Thu, 28 Aug 2025 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365536; cv=fail; b=PaNz0/wr7fww0M4fqANseDuK/CLKLsBGEeo9pnA/aVoS14/02jVHlmEE1fnA+UQrFt1auPql+RmFEv6wpr0GH8iMP8bKffbBIBD2PtE+JByMLfkk926yKcbiEo+X4fp+SQYmkSG/qZyRuLrykKkI1i5R3XVnxMVeHIQHkNtZDhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365536; c=relaxed/simple;
	bh=KJ/sPmzIr+v7+lVJwiQ/KsAVMVTwzTynycZSiPF3+qo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D1hRpIA0K2OGeUqeOj0+QhpklxLkACQYfPgptlGE31ok6Jaho8PH1cu6qoax/320g7TtcNpJrKQxgEZQxKClPea5IO98iTOCK2kI0w59xSO7/AahSXxFThdeknTU8YoQpV93AkGo3g+fDwI5v8pvtjgowuSrQ+/gQf4Orh7Eb2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RuOl66qC; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhXQxATc8TyXuQKkqtEN4a8o/vk7gZBCprwaU5Bo+T3vdwgwTENt+Fn+xFQGDVbCIzU8QwHVy6g+9qUfRXgwhyM4qsn8sAWrcUqlawZQLJgIhCntKa3UnGYnuLnE8BLxVp/1rASN/eXlDfmYgpHG7MR7+98xqw7VikGcrSmFlXX0Ii3dLeKiMoevKfQklNBm4nxNFTZOSlEarAkEzks/6BumeOo98ojAMaOHrm3sSJ7U6gDFHtxo0kpkkYStNeud01UvA25dxO5fqSSqmNMxvSu+rkbzmiOBAKkxiQboOBKAGMwv3dcWOO4iq/Vo80ueVQKc3tjPeAY/Xe/GSDkqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb+l/R8zOwRvkT9LYdrq24LjORR7d8woY/BTReeQKQI=;
 b=NuiBGv+rp08qX8lEB9Tgg0Fa+qpR6ghiPRRN1+ZCqwjssW935n2gnUMu0oNHSVVyUvTJl8TFayJ+hHzXIrwRV/RqW/rYv/ObYLOR19t7RF9nGMjfrv+rWcbwzrbvJcAlhiAywRETQZl0ihkd9OZrNC399+4Wwotw8yWrvHLMdzwPPNJquiM+MjiPMVBjUub9/NnM6Jo6DINPZDWNbzNCSUTeg1GqOXxqV7/C7uTjWBLjzZvjoFABX3zg/T12YbzZLlf5E2CyDnF0muKZCI6yvPwSj+0noZvQyeGg5HxqEV1Dc9MzCpl13H/6WJSp5+/MNFRvQXqUHgU3Wef6QLQsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb+l/R8zOwRvkT9LYdrq24LjORR7d8woY/BTReeQKQI=;
 b=RuOl66qCxVV05k/FH1vAfaLdlvLVvweWetj5M1CyqAy7wSsPz0UaGnqZ+AX3umCBkrRZB9MVeZKMWQuE4A4Tn+cDO2LslNEfa9PXlD+3UjB9zgg0OYBFodtDHKO60hBDeb3PhGXp785jlMfG3FO668cfzlzZ900ser+kIIPCRgECHp28hwZ1rgQ7JiV7aKGmI5p5+l412huiRyJD2AECtqc0sfWQ1DPCXU23U50Jgdikzrq0/nfCA6FRQGk336LNCcTBZEhhswpR/bDCbF2HIBxOjB21Bwsim+kY5P0gf0Yl/DzCgPypI/JHXrcEQ1jgRanYcBxoX+7F354Ku3jZzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Thu, 28 Aug
 2025 07:18:51 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 07:18:50 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 28 Aug 2025 15:17:35 +0800
Subject: [PATCH v4 3/4] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-csi2_imx8ulp-v4-3-a2f97b15bb98@nxp.com>
References: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
In-Reply-To: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756365509; l=1321;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KJ/sPmzIr+v7+lVJwiQ/KsAVMVTwzTynycZSiPF3+qo=;
 b=vOcdBobZ19qvj1Rft8XipJeb02cHuwP6c+ucvCCAxgYnFjmYQIfsaXiHQDB84tYxx05nH+1uW
 cALQgdLMSvoBD/MAiQSGQHMGCyXQxrfJs9p/mZoKiurCBGRpe5e3ir+
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c79702d-d852-4efc-ed42-08dde603231c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VFBYVC9SNHNOYmJTU3ZnWjBVUEN6eGQrYTZwVkRldlQveWJTV29iWG5NaWVG?=
 =?utf-8?B?ekRFQnl4dmFTUk9GTHhweW1HVHRvRW5ZWUlxa05VaG8zdnA0dkk4clIrMWZG?=
 =?utf-8?B?SVV4bTdvUng5bFY0TFE0b01jOHNVL1k5azQxandBanROZytuMnRaZm1HSVg3?=
 =?utf-8?B?Q3Z5alEwYnBjWUIzQ3g0bTZua3dJL09UUHVmM3Bma0pEY2xHUzdaYU9Fa0NF?=
 =?utf-8?B?QkJIdk45bjg0a0R4Q3orOU5VL2kzY0JEUEYyRTN2NDhndDFaNkRFLzhVZzE4?=
 =?utf-8?B?QXFOOXJ4dzBTdzd1VkV3SFRhZUNKQjQ4cGJWaUZxeDFZR1ZYOWRzMTF2NnhK?=
 =?utf-8?B?VlVPZmNyekdNbXBMTHlMUEdiUXExcWpHN0YvWldUVER2aGN6b21FcFoxZHUw?=
 =?utf-8?B?MUoyenp6YUQvL2ZzclRhcGdQNXMrLzNzcytBblIxVEF4LytZYlhCTlJNNlRJ?=
 =?utf-8?B?UHk5Mm50c1YwR1hHMVQ4TmNmd2IxdlE0U3dESHlIa1NtVjczSnRiRUFFM3Bo?=
 =?utf-8?B?RFV3TEdGSXoxMVJJYTZBMlJMOTNiZVhIdW5hQW9HTVZGc3U5RTFNMWVQTU01?=
 =?utf-8?B?Y0F3NHFNNnVZdVR1cmN2Z242eHdvbnRCWVpwbUk4blVIV3d2SjRDeFRzL1FF?=
 =?utf-8?B?aDExd2QvTTNpM200NVowcDB5TkpxSE9UQi9NVXNoejBvZy9pbjJQbmdqRzZW?=
 =?utf-8?B?Um51WGVwc3hMeWRnUDYrUjBoQW5CRXFxbVRzSXNSWTBwRE5RYVFJUWFIbE1p?=
 =?utf-8?B?TExaWWhzM01ZdTRrTmk3UWRLOEFCT2x5UndXM0s3TTdhRll0Z0hUQ1AwS2Rw?=
 =?utf-8?B?RmVNaVQrWTZDVnd6U0NucmFaZFV4ZEE2NDFhMm1SQTNDWUJDL3dHSFV5Tmcz?=
 =?utf-8?B?RFdYM1FWSjRndFo5L1pHQXZIRXdFM1I5Y3JNaGxDTk1XNUJrQ0hkOThDMitr?=
 =?utf-8?B?a09JT0NSSWxuU3JLYit6K1pubC9VeURZNzVSQk5QMzNLdEVoNEU0ZENyV2Nx?=
 =?utf-8?B?KzY4NnAzeXZFZTI3eUxCRkJJS2I0L3FYTFpuUWxWWjBzQjBxdzk3OTc5dUNt?=
 =?utf-8?B?Qk54UUxCeHowSHhCUDVHa0ZENVRlVXEzY280dXRvMEpUZUhnVk9McTRXWnd3?=
 =?utf-8?B?R0lWakZlNDlIRGEyeGptczRQOFBOZStLeWJoZnJja0N5ZmMrY2FpaXdGTGhR?=
 =?utf-8?B?QTQrZktpSk5kYnlCdW5RWm9KOXNyQUZodnlaM1I2d2l1c0JocVdEaUp6Y3Mr?=
 =?utf-8?B?VzFpWVFXcXN4ay9mWUthaDNJbDlSZW5hMHRvMXNuZVBhcnpBc252czV5US9a?=
 =?utf-8?B?ejQ1MUZhWXBMZTJqWmRDTW9GbTErME9zYnRIZW5NbU5MVi9KMTBxK0NPVlZ3?=
 =?utf-8?B?Mk1vS1hUSVluYno4Zis0aDZRWUk5RHFOelM5R0hEZWpUSTlreldUTGhNMG9v?=
 =?utf-8?B?WmthbjJVaXNnSWY4b21VUlVKdUY0azFPY2JpVjNaRHd1SWZrcEQ0dzROMWpX?=
 =?utf-8?B?RTI4MjA1WFBxM3ZuNzlOY1liODZsVUljOFRpYndETHJSSEw5VGJJdE1KTXFl?=
 =?utf-8?B?ZU1qNUNMaVNTQUh5S0pHYXlEemxZVUozQ3kxaHBxSUtaM3FpMU1HOFA3TER3?=
 =?utf-8?B?ZXdSMklCM29RL2tDeVZhenJFQ2hPNFdFT3ZiWkUvejJWTUU3RE1zZzFIbmFr?=
 =?utf-8?B?MFVqSzlUb3RjYU1HbDNtNlFRTTVCUHRxR2dzdnk5cDY2anhUSWxyMlpCSGE5?=
 =?utf-8?B?MFpmZW1md1RIazZURzNZbEpnYUVKM0tXcmJ6VlBJdUtkVEhOMnJOYVltSHhj?=
 =?utf-8?B?Z2pKbHhGSW1XT0ZCNUI0cDNTbGxpcU1vbzlqMzJPbmtIUEVCVVJuS0RHWklF?=
 =?utf-8?B?aTJIMzBkbzlsQjI2R2FIUW1VOGJ5NVgwVXZCb2tkdnVQNHZLK213ZUVGV2FN?=
 =?utf-8?B?Nk9SSVYzVE1lSEdPNGRCQUQ3SGI1YVpJcGVRSHpLK2FwTmJPRk1WZngrUG1v?=
 =?utf-8?Q?BZjl4v703wDPxiKvcOe4w50SlgCMxE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L1Zud2c0MzZJQ040cStMK25Sczd1WjI4dmdZWjQ0MWNTU0xwYlByODJiSlhl?=
 =?utf-8?B?akhnZzA3eFlkSlBOeEFuQnhFbWFsbk1hdTV5VTdrN0pYWEJjS3RaTFgyRFJS?=
 =?utf-8?B?Ui9ObE5UOFQyc3RiUWNKWHMrK1Y2WFIrZXJhbzNoMXdtbkJ0c0ZrOVNRYnNE?=
 =?utf-8?B?ZkJDNjMra2ZrcHpYOWZwc29uZHdjdjF1ZUZTR2hjcHhqaE9zTU5tcTJEMzVR?=
 =?utf-8?B?S2QvL0tSYjI1eko0NENWbzg3NVVQTklnblRVNFFTa0IrVzR3ZzZteTY0WjRw?=
 =?utf-8?B?UVo0ZFd0VTN6Njh2czA4WmpvSGNhbit6ckhFK1hmVHplck9VaFcxUnNhbTYx?=
 =?utf-8?B?QW1nMFo3dWlxcW42L2NJV1l6WjdhYjN0ZzZPWWw4eXhGZzRNUGtMYjV2RDl1?=
 =?utf-8?B?bjg5YmI0VFc4d1I0WjNZTzdCNmdaWDdPRFU3WDQ2V0wvbUZ1RTNzVWh1Nm1y?=
 =?utf-8?B?SjYrT0x5dzR3M2NEYzRIMWt0MUVaeU0vZWgxQnFxbEhHSlBHLzh3UUNtQ1lX?=
 =?utf-8?B?RlhEYzNjNWtBZnBEOCtqOVluMnBqZVFiR3JZaDRHS2VnaW1Oa0NNZWRnZ2dw?=
 =?utf-8?B?M3VuR2liMnpCOEppcndKVVB3QUNZVVZ6QnFoY3pqb2pPejRLTUhHZzFEY2xR?=
 =?utf-8?B?cVNvazdPdGkyeDUrWER0RGtYcHhhb1FHeVlqUTBmeWZSMmFxVm1YdWw5ZTEr?=
 =?utf-8?B?aFJJZGoyRlNBVzZUb1NxdXRDR0pDK1U0VFBPdVhMUk81QXhBVm9KSi8rc0do?=
 =?utf-8?B?THBvNE9QTWRBS0JtaWNKRjRTblRHZ2RoUE1CcjFlVnRJdjNCTHZQZmtyTzEr?=
 =?utf-8?B?L295Mjl5ejl6YlE3Q0dnZUtRcDVGQjB2azhhVzlBWG9WaDJoMjgzakVTcDd2?=
 =?utf-8?B?SWxiY0JtZFM1OXdrU0EvSEVrc1JDajRCdjQzY29iVDloRkhVZmVaU3BjZXZO?=
 =?utf-8?B?Z0x4Ym1qajBxcjZuZnZtZXh2M0dLQWk1N3RWNEw3R2p6ZTMzMU1XSVRqNTRn?=
 =?utf-8?B?a3JZZVcxdDZFYVc4emhCVFNaczZkUDZYdjhkZmNrSWp2VjNMR0t4L1U1dnYr?=
 =?utf-8?B?VnAzTzhkamgwbFF5TXZpdjNXOGJBWmM0ZHZzaWQ0YmFVL3NZaGgvVTByZVV0?=
 =?utf-8?B?bUxxSHBVZTF3WGxpUWJzVExocEptSWtRN2ZmMmc2RVlCbUpwVlNOeTVJWkYr?=
 =?utf-8?B?N0NOZ0g2Z0ZneUdKdjFqMTM0UUZvWCtZTlRyRWFHZFlhUU1FRTVHSmRtZklq?=
 =?utf-8?B?YUZVTVhkQ3h3YVFhWG9COE1XclBVaUpkT016c0traW5vWk9PWDZ5OWRBd1Rj?=
 =?utf-8?B?RVNUODc3MkJSZ1Z1OStrWjJiS2F2SE5zeEtsb3ZLYmxMZ1ZyaXYva2xQTEZp?=
 =?utf-8?B?dEZ3NmQ1UEVmNFpMdGtNTEZHaDQ4ZFh6c0h1K3cvZDUrNit2Vis2WnFDVzY4?=
 =?utf-8?B?cTlNaHhFTTJyNFR4bnBnV3crNnFER2tuTW5oYkF5RWZCYzlVSnpWblJQS2F6?=
 =?utf-8?B?aFZSMHl4YUNzNnozRW9jd01rNnRoS0hteVBLMkRxb1NvY3lUUGZGaFJKcnpu?=
 =?utf-8?B?ZUlqcVQ0Rm5IOXd2dEFNV25IaTVWZitXZUxKZVY0a2E5bHFmSkVUQXFOU2s5?=
 =?utf-8?B?RXYzMndDaFNXNDJubGkvTDg4K3U4YXd5QW5BMlNSMkhGeWJJZm5LU2pJOXhk?=
 =?utf-8?B?QWMweElLRkVnYTFIN2orWGxUSjZZb09nemEyMDNZSkFrNUdnajc3KzdJNUF3?=
 =?utf-8?B?UU5EZFNkTHRpZlN0dUxSUmpOU05qbFdELy8xQllFVnJsUHJ2eTd6c3lXbWxq?=
 =?utf-8?B?a1RUVGhEbjduK0pTQ0p0RGNUVGE2MWRLZ1VEMkdkL21tYU5OMEdKS0RkbUdL?=
 =?utf-8?B?TUlBTGt0amNBT3pEWmZZbUJyL3lOaGllemMrY3VrSWlUZjZnTzEyZURvME9X?=
 =?utf-8?B?TitPVUR3ODFWSjlScGIvVzM3SkN4RHNZKy9zc0t5aUUxaWh6WVpkeklLS0xM?=
 =?utf-8?B?c0lkcVBYSDJ6YyttRjNTM3c4SjFiWW9OdG85WWlSZTVaQklKNVdMT250N0dN?=
 =?utf-8?B?TEw4ZEVxS2k0NEdGMDRpdTRTWlBSeDZ5S1VWSkpNdWVVQlY3ZnFVeFhMUXcv?=
 =?utf-8?Q?lQR3BcJGtg/JvW55yHe3JUwh4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c79702d-d852-4efc-ed42-08dde603231c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:18:50.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV6G4ZYF8i0Kdz3CkkAinNyDR2VOwct/3k5/BfZIb+fYhurz82Ei5T0W6sabJRYNDSdBx3Uuy4+2Vx/+CRcq2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


