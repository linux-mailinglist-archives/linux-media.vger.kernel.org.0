Return-Path: <linux-media+bounces-48828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E82CC022B
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 23:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA3B63033739
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 22:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC65328258;
	Mon, 15 Dec 2025 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CeUOrhRK"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FD132572C;
	Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839025; cv=fail; b=LS7zQbltQK/jChjtMc3d4iNli0yVoFo2i4rQ5NlFuIUM2kDa70SXTe+lI/zQHNvLD+wix67OFaNhsNKdmGCNEQQZ2tUmdOVt2jxQvQ5Pbcv+Evp4RRWbErW8kWPFT9Py+WCvYvSFW4tFIMJ936ULFJTOm8cPr0LDE7TsGYrZbyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839025; c=relaxed/simple;
	bh=8ZRGC0HOcXdF4yY0Klkdzev0fb+EGZKR4sxFFWOvq/Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=luoQKJ0uc4Zj/S2sX0OjM3OmimTrfQX5/ZR/fVe2WdV6wvWpUl5B5LWv1wnIj/+8RupEqSlksd99WeeewzKJyPCAVu22GF24rY5tjt3ClP84RGwuKKNLX/humQjp8+e1ePpgVKWoCou6WmhSBRK2kk029j1/rlGpvuYiU7/8yf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CeUOrhRK; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoaZ0hQ8KTKJ1a4+s7OQxQAvu9OIGLJr/9ykc1d5PLiJD03rEr9XPd8pMjCJL/Ehx5zeGphxNZDpbvDnM91VZEUdPszKUtH1iBueUe/EZcqmQJamqoZCix0AebpfEuE9u02GzblLkceGT1ANYbYmDStOJzsnSoa79eewp/m9x48fY/B/0A2WXe3QUxOWvKcz+a8dvRoxtwkp4t3cTFLZQoQXhIKey3+cZ9yUd4tNHQ9PYG20FZDrknZCwTbyhlxyZjDMPdH5O8Yso06XZjP3aiybjlinmH5UTvaQMit5OIyDLdJo1fMfGAAGR/s/jI6jWku3kcaYZjqNn3B8vZOj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08qB5mwk/VJd8IPFbwD0PBx2hVv/tdtoaLkQk4flIrI=;
 b=o1nndHf6NoayMSxHgOi23UO22bNyobH8gZJd+E3/UTqCVRCwkkBraS13Ot4SuJcc6wPt4SDS15B+3kYh8Uzu+C+kjlsR0hUlsq5U4YGkH48LOBmSutyV8dJdLOvXSUbKzRfF7rz2LXQi9+JNf1K1icDLIVy4YXEQnRA0f87QTMztzoRxU6YQYMn2smSgzw0mYPyt0zNhR9iRdluESWcd7iwrZwItR52td9kJ4M6oBkeQWGqpaSCASCwX1RddM097IUvrWf3DKk6tZw1U3sB9GFhOdgAUgCFqlwmrdGOUWDRAIqyTjfxZH81oGzqdzXPgEBKSTDNU6MPwT6ZHTFHNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08qB5mwk/VJd8IPFbwD0PBx2hVv/tdtoaLkQk4flIrI=;
 b=CeUOrhRKcApsWutNP9HHa4Utofz1LNsd6484i2gW64UBRZeZPUg/KR5q13lxDq7+h0dZyo4yCdkqzXvbvbm3X+fN4sTuIbddh0VZs/ToeT8ovThRYIbm17a05V/78KfgHSiLCr1KetR/iPWex1gip2VCG1BgKo6C17lxKuCfIIWJmTogBRHCvZp7XUm8gSLRjcK32fNYf43QKmRUXyzxgMtk5zviRZIPGbTtEnULaS/TykBhkwF3r9Fv/sRng2sgx/ULvEC7QiyoK1mptjo4v+FsX5VBDuzQTb48KbCl+rVgFy3dYQb7Mtkc/lDBiV0tmVgGgucfclNtIuz97xCEKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 22:50:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 22:50:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 15 Dec 2025 17:49:53 -0500
Subject: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-cam_cleanup-v3-2-a61995068f38@nxp.com>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
In-Reply-To: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765839009; l=5112;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=8ZRGC0HOcXdF4yY0Klkdzev0fb+EGZKR4sxFFWOvq/Y=;
 b=dlxjs4509p/cFdKXpcgZNLUhTc+GDe8IqGdSEPYD1SVPOPavGRoX22V9/ndYxCCEM2odfj/Kw
 C17cLXPEoBNA2VfOoILJQzO7CRrT9DtMwkP2tp0e26ybN6aKEMxyJuk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d7d7cb-6dae-4121-b986-08de3c2c5258
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bDFaSEVSWFdUeGFCTWpXWS9pd3d2N05La3VyYkw5NmhPbkszcDlGaC91dlAv?=
 =?utf-8?B?cm9KNEE2dEZhc2lUaTlucyt3Y0pBWngwZ2ZzaHkxYytINzlEM1NNd0RPQ1dE?=
 =?utf-8?B?VmhHaE1pand4TTkzR1hmSnpZdFRDeEMxc3Z6ajJmK2k0cmZWTVE2WS9TRGxH?=
 =?utf-8?B?WFlyOTgvQzFwaklWeDM0ZEJLalkyY09Pc1RGa1psZHdkUldXZ0VZR1BhWWJV?=
 =?utf-8?B?dFFBbmtFNWZ2cTlQVHlpSDZuVmZqNUNINFhvVGl0QXY3eExkbU1LZWRHSkpB?=
 =?utf-8?B?aU5oV1FVbkNyYTZtbFZkdEx4Z0hRRFo4Y3gxUGNpeHN1UEtBMVJPVW11NkY2?=
 =?utf-8?B?a1F2eUZ3ZUlpVCt2N09WaitDaGhOSnBUQjlYQ0NRMHBRMzFXMHNETG5pd1VU?=
 =?utf-8?B?UThKRUlCelNxTWxTKzJmZU1xQ3JuMmU5eVZpNTdqOVN1WncvNUxNZk5nSGxj?=
 =?utf-8?B?aGNhYWw1Z1Q3RUlub3lZNVFBQUF5YWhJcjFuWlRTMXdKS0VOZXF6ZFlxMTA5?=
 =?utf-8?B?cHUzVE90U1QzRXAzOGRzblc5UE14bm5PbHBzcFFINUZ3L3B2VXh4RW15ZDFZ?=
 =?utf-8?B?K2prQ2RJRlcwZ3hQRFQvTE9CcnlhdTBwa3VnTi9aeWx1NW4rNFRxcVN1T3Ar?=
 =?utf-8?B?UmhSOGZFV3UvWWE2YzJzWVRJZUJyb2xjazByaXFRdldYWnhYRWM0Q2dJeXI5?=
 =?utf-8?B?WTZpbGRzUHBwWFVieVJuVis1Y3VleWhYZ0szVUw2d2UranNnRkNLOUlqSmov?=
 =?utf-8?B?VFpMZnl0STNXSURsRUx3Vzc1ZEFpeHREbk1JelRUcnRZSjAxMldXL2VnU09q?=
 =?utf-8?B?SytUdWdpNFhoWEhoK01YL2JrV2J1NHlLem8zMnZ0WERqMnkwQ3NnVkx3T0tk?=
 =?utf-8?B?Y3R2QzkvSHNpMWZLUEx1NU9ncWcyT3YxTnB5bU5QOTZib0Jub0tac2JqYWtm?=
 =?utf-8?B?ejFpTzhjMWxsQ0dpZ1NqVGlwMnlVUmNpVWVwdENqQmpwTnhLQTVlc20zUE5C?=
 =?utf-8?B?S0tNaDVkRFhkeWdrRm56d3ZGQjV5UldOdmR3QjhmUzVCSk9Fb3RBKyt2MHZa?=
 =?utf-8?B?QU04MHg0RTRyeExUNjJ0L21xZE5wWjh5SFlvOG1NNWUwOHYwRkl6UXp6WmMr?=
 =?utf-8?B?SGR0UVJXOHNOTTNpUFRrSEd1TFE3MDJzb3lybXlVTEpNSlplTS84c0NSVzVJ?=
 =?utf-8?B?RndkRXdmTmFMOEpMUk1pV2VvZHNQRCtwSy9LTU1hMDdlKytONlhJZXBLYXJ0?=
 =?utf-8?B?MnErYk5wZ041cis5LzNsaFlzMkNGZ2JuTTdFakNyOWNoNERZNVp1aDcrVG5k?=
 =?utf-8?B?TFFMN2xOc002UEMyTmd2NDZEejJYbkRzZ0hvdFJMeVdGVkl1RTVNMjZFMTdG?=
 =?utf-8?B?aWlWM1IwbW9rWjFOeUlDdFFubVN4QU0rWjJmVTYzemJSNjQ2QXNmdzJ0aUtS?=
 =?utf-8?B?VjAvd2k5TGtIYWVubmtQY00va1QrK2h2QTdxbGd0MGtxQ0tveW5RNFNpT0Q0?=
 =?utf-8?B?NWpvbFRrVkYzaVJhZkY2ZkhxaUN1b3dEVHRDZFFXc0gzUWx3UHU4ZTZsTVlJ?=
 =?utf-8?B?Ync1WDBhc2lKK3NFc2h0bnpXSWF6Mm92U3U0ckpqOTJQUWljV2w4cjhLN0ZF?=
 =?utf-8?B?bk96SmZlQ3VUWXJpaktHdHRDZC9SbEpjMWJVLzk0VmhWeEljYThleHRVdmlu?=
 =?utf-8?B?MzhFVFpXVHlwcWFLOHQrSEcxZnpuS3VweEJ4YmdqVjVlWWlOdVFIWjJ0ZFhD?=
 =?utf-8?B?dldqUm1YYllNSWl5REdNbVdlb2t1bDUydzJURmZEa3VGenl5NExQZllSVEND?=
 =?utf-8?B?TEdLMTBPdFFVMUtyaXBSQTFpRC9Ld0E2WTJ0eUNHWWVnaXNSVFA1a28rVU52?=
 =?utf-8?B?NXlQVFljYTRQSnFwQlFORHFUbHpFOGx1cE5YMm1vZkVSdDJqTEhLdlJpL0FL?=
 =?utf-8?B?dWJhK1VKVkFCdjBYTWJiOE1WOGVPYUQzVDl6VVdiTE0zZEY1K3NsUVA1VUpE?=
 =?utf-8?B?dWZDeGdMYzNyVzJxbVIxY0xEMU5qd1Y2WWEvSGhnYWxrc2gzRzNwby9FSTBn?=
 =?utf-8?B?T0JDNERhK1Q4NDRIMHRMVEhxQVNVUUxhV2kzQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YVkvV0ZScnJHVkR1Z2V5VzloeG5nTGlXYnpMN1REbHkrTW1OZTg0R25SUGxo?=
 =?utf-8?B?aytJS2xFQjVHTnpHdUdzVUJkRFVlcFN2S0gvRzkwUEhWUUR3YmUwS3E1SU5s?=
 =?utf-8?B?T1lqL29CS1orMzBMbVRFQWNSSlVJcFBFSUJ6bDJFWlJZS2VSOU82RDZwSWI0?=
 =?utf-8?B?dnhwT0hCK2R6Mkc3TXp6Mkp3b0Z2NUhyT0psZ24xMWVlT3FQYm1Ha2pGSzl6?=
 =?utf-8?B?MVFxaTZVVDZ3dXdNdVYwSUx4Tng2OGx0akQ1ZEhXKzYvazFYSUxLcm5rNUtB?=
 =?utf-8?B?czg2dEpoaFc2eGJ6WGwwZU1xRjBzcG8xd3RnTHhEandmQ3ZzQ2YyOU5yNzkx?=
 =?utf-8?B?aTlZUVdpNkNYVkZQQzYwdm1BMXlGSnBTd0JIdFFrT25ycHZpWHlUN0trOGx1?=
 =?utf-8?B?WmtHMEgrd3NpTWFjcFkwSWU3Z3JMaDNPSktHVVZXaHdBWUlGRGFvMnVqMW4w?=
 =?utf-8?B?Z0RXRDZ4OVIrVG5UaytvQ2syYm5BMWZWOXo1R09pMENOZ3FFSTM2ZVZua3R0?=
 =?utf-8?B?K0FNR3Y5YlVvUzFDTG1JdExtM29wZHdzUzh6akxzdjhQRERaVUZldksrRjMz?=
 =?utf-8?B?MTlwMS9vallVRVhWOGh2SW41ZFVya1VGNE02dXZ4eWdSTFlZNGxrcUhUQ2M1?=
 =?utf-8?B?NFQ0ZEl0NzZxZGVBR1BkZXl2WGR6U1JsL3lPQnY2d3hZeHZiT3Q1bmo3bFRp?=
 =?utf-8?B?Qjl0cGYwY2ZMTlY0b0JuL1MxUDlZc1JrTndwcjFMbXdnOVc3YXUxSUh2cTBI?=
 =?utf-8?B?YU5FVzdIamtSSTJ2WTc4NDBGNktHNGZYb3hiQmdiQ1NpZ0xXSlNlNkluUUF5?=
 =?utf-8?B?N2VKRnBpWUdtak8ydFNIVTlGNHExTStOczNiWnA4OWNBZ3I5K252R0N6K0pk?=
 =?utf-8?B?aE5rdmh4UEV5S0NhNUpBYnd5dzJRNDFWWDZ5VUU2ZFRrTmdBRmozenlCNnVV?=
 =?utf-8?B?Qk84alR1VFZ2bnpJa2lCOUFiOHJoT0lPV2wrZGNscUJFQkpDNXQwWVh4Y0JK?=
 =?utf-8?B?NUJoTjJrSFpuS3d4S3VqQ0FoNHFicjNheW5uSnZyamZTVk9Gb0FEMzV1Y2pF?=
 =?utf-8?B?dndzRjNpK0U3aEdoYlVZWDJkenRTV05uOGZqTnJjQ0VuUCtpUU1aUzNSa3Mx?=
 =?utf-8?B?LzJoTWxKbHlqbmJpUER5L2lrQVBYbzVwT28zU1NNcVVIYmZnM3pPYzVjR0g2?=
 =?utf-8?B?aU5LTm9KYzRGNERTWFRzNjRHYXl0dHBlcllzRi9VWEN0TXozY2ZsMStpZkl0?=
 =?utf-8?B?bmRGV2NwYlJjazJmaG1KSU5TMDRqWjdRUmVDRjFmMXpOYXZLdGJUNjU4WE9K?=
 =?utf-8?B?Z0xBY0ZNMFA2Y0M0VzJFMGorOVJkUytUSXZQcVRUQ3U5d0NJbmtqVUNUTEF0?=
 =?utf-8?B?ZGJRR1BRbGdmenhqeHNiRFdqY2V3ODUvQjZjcU5wcUJvV1VETUNJT3RueFgz?=
 =?utf-8?B?YlFIODJNRVQrWGhpMG42aTl1SzlxdEQ3RVd2ZHlXS2wvc2RhOVlPejBHZHZw?=
 =?utf-8?B?UGU5WWRXelcwVTMrU3JRbW1KcjNneUYrdWgrbU1tcTlZSzBHWXY4MkdhQTB6?=
 =?utf-8?B?aFpzOWZXK245WTNqdmJtU29WSlRVemVkUE03UFF1V3JrZ0hHZ2hQMGVYY3NU?=
 =?utf-8?B?V3hOOFNLN0NmOXdWUTRJbm5xaDBqTExpSnZ0dWR4emluOUxneEY4ZXNlVEpT?=
 =?utf-8?B?K2E0a3dwSS9aV3h1dWh5SzhRaDBtb1F2V05ES2taVW02dk5vVjg3cGtjc05E?=
 =?utf-8?B?TTdkMnplRWhjTE9aVVJGZEo4VTAvbFMyWGxlamNhVDB2b2U2WDk1U3c4REpx?=
 =?utf-8?B?WTVlUStzYitKVDRLY3phOTk3ZWNKMzBjbkt3QzltWmF3WFZ2alZZbFZEb0NW?=
 =?utf-8?B?OHQycFQzZTlVWW1RVzd5WkhjcndzNEVwT3d5ZlVDZWxCMWFqVmFTL1pkNUgw?=
 =?utf-8?B?OXJVVmNCVEpRdlk4Q2JwUEhudVczRSs2b28vNitWbHJEU1lOdXRpaTFBdmRn?=
 =?utf-8?B?YkhJVzhINk9iZGR0NmtNZ2NvVCtKY2tZaFM2ZGUvQ3ErMjBTN2QyZ09aamtJ?=
 =?utf-8?B?WDUwTEVST0VvODd2RDlmMklsSFErYlhZT2o3WjJFUXlEMTFoMHE2a21TWE12?=
 =?utf-8?Q?H8q4ENRk1xqEmrtqU3NvZxGwM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d7d7cb-6dae-4121-b986-08de3c2c5258
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 22:50:19.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ags5Pm8/L/7zumBCdeAgIhkEad6d6FyPPrVsA5Z7y8fowOhCcpWlRNXmzP4FosLKqy/98bA5dTtZ3xylXyF5pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

Use dev_err_probe() to simplify the code. Drop the explicit error message
after returning from imx8mq_mipi_csi_parse_dt(), as the error is already
reported by this helper.

No functional change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- add  Laurent Pinchart review tags
- wrap error message to new line
- remove error code print in dev_err_probe();
- drop error messaage at imx8mq_mipi_csi_parse_dt()
---
 drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
 drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++---------------
 3 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	/* Now that the hardware is initialized, request the interrupt. */
 	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
 			       dev_name(dev), csis);
-	if (ret) {
-		dev_err(dev, "Interrupt request failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Interrupt request failed\n");
 
 	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(csis);
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007013821f67d783898a15461f 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	/* Acquire resources and install interrupt handler. */
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(csi->mclk)) {
-		ret = PTR_ERR(csi->mclk);
-		dev_err(dev, "Failed to get mclk: %d", ret);
-		return ret;
-	}
+	if (IS_ERR(csi->mclk))
+		return dev_err_probe(dev, PTR_ERR(csi->mclk),
+				     "Failed to get mclk\n");
 
 	csi->irq = platform_get_irq(pdev, 0);
 	if (csi->irq < 0)
@@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
 			       (void *)csi);
-	if (ret < 0) {
-		dev_err(dev, "Request CSI IRQ failed.\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
 
 	/* Initialize all the media device infrastructure. */
 	ret = imx7_csi_media_init(csi);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a97910a6a0d53c9b6fcd73e9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 	int ret = 0;
 
 	state->rst = devm_reset_control_array_get_exclusive(dev);
-	if (IS_ERR(state->rst)) {
-		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
-		return PTR_ERR(state->rst);
-	}
+	if (IS_ERR(state->rst))
+		return dev_err_probe(dev, PTR_ERR(state->rst),
+				     "Failed to get reset\n");
 
 	if (state->pdata->use_reg_csr) {
 		const struct regmap_config regmap_config = {
@@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
-	if (ret) {
-		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "no %s property found\n",
+				    "fsl,mipi-phy-gpr");
 
 	ph = *out_val;
 
 	node = of_find_node_by_phandle(ph);
-	if (!node) {
-		dev_err(dev, "Error finding node by phandle\n");
-		return -ENODEV;
-	}
+	if (!node)
+		return dev_err_probe(dev, -ENODEV,
+				     "Error finding node by phandle\n");
+
 	state->phy_gpr = syscon_node_to_regmap(node);
 	of_node_put(node);
-	if (IS_ERR(state->phy_gpr)) {
-		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
-		return PTR_ERR(state->phy_gpr);
-	}
+	if (IS_ERR(state->phy_gpr))
+		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+				     "failed to get gpr regmap\n");
 
 	state->phy_gpr_reg = out_val[1];
 	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
@@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	state->pdata = of_device_get_match_data(dev);
 
 	ret = imx8mq_mipi_csi_parse_dt(state);
-	if (ret < 0) {
-		dev_err(dev, "Failed to parse device tree: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Acquire resources. */
 	state->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.34.1


