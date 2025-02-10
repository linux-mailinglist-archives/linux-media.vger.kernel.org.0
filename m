Return-Path: <linux-media+bounces-25961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB7A2FB39
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC8D73A25F4
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722602505A0;
	Mon, 10 Feb 2025 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H0jQNppM"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94742F2A;
	Mon, 10 Feb 2025 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221212; cv=fail; b=HEHKxCecc2Kmcs3ZOp+7zAcTso/HkOIRMxZXNpGCl7ly8SAWnKxUYiQb0sJSB9xI0jTrxZjGR6cG21uKxgYYehyZCf5WLi0DuFB058dnjpopI8WUG8c3Lnr6qRuGohIvvpHlNeGmYqqTCwQAP2KFIGB76hpE8lzYtdKg06eYpFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221212; c=relaxed/simple;
	bh=Ip5M/e71q+Ga2McCkdT3MDC241p4b75hE0vPlSEpQ1I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Song860FOJwleH1+Lp2p7iMQecEy/xxgSE2i7sXelozFrExedH+Jy0F/7zfzh7g+nRAwt4JKV9PU0S9DcJx4SgkkxgFGRqS/QcQSsP9ABqp1jHFB0ZEZHQrDaj+ZprJxeJgFW+0S7Nhi+Bfc4xoRFax7W7EnJsE8GW7pkpY85kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H0jQNppM; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGikZvz/CD0bsAOwSVM0kzev883+hEU2r2Px/lusPsLOU70/zQeFhgeJXsWZAXl4SwpG+rVxB6YsiXzCHP3UDdTIrJafylYShRnkK8d/Dr1Re/S3hBEqKdjb1SrHKQMeNhY1Je4Iz05AAlHIWe+8ykHxd23S3OpEFmEGE7qrim651vSNojLABMej6ihwAs3zDCl2sxiDu4jRNtbWspXZjyPcfV9ckLAW6Ab5BK/hQYA8AqlunjL4+Q6b9C8gXfd+WMB1sLBoXZwhHuovz9e6acBTw9OVR81KHv3otDQAwJdaS7dmB226zEV5oVCc2CAdTyrqvnBSByrEhm43gXiq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB7a+axCJWrVm2CuKydyvWjA9Cn3Zs68tIlrHpWnAVo=;
 b=TwTbuSWXsGRNK9o24AHgvpxOMI+D7LAJD3Gx7XGa2cZHo8ome4/gvL5PEd8t5bIecqKIblaWe4D5R0TmggNPCJpv16kyRyxNwhZ2uiPLhzGdhrnLRmu1UnXG0qMVRuhPfMaUrH6AyA6hIxn7I8h2CRZ1XZXfJSTfGWiHUKL44QCBMrIKw0B8DekMeshdnYIoFQUJIO6VOvTKdqL9RULXedUFP03FZ3i0wnTlzDg6ouW20SrBiH9XnfhwmoeK6JBafsCy22UFBK30SCiDJW51IZg1c5Pd7oxUn+eKYuVte8UAPTKwXHK2n4HiQ3r3R60HusxpeQJI65QQhynzGilcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB7a+axCJWrVm2CuKydyvWjA9Cn3Zs68tIlrHpWnAVo=;
 b=H0jQNppMSzjr+1MaubAuBPun3vfwXkdra7CLRS6FMJ91+A9BR0Jx28HJS2yPMdu5wx7cdzXT0xD+XELXXHsNJKby+9wYX00W0UPoLXld8kMX0uf7gY22B7ylehq1cnCz58AX6fo+C2RCdLg6wo91Jqb2yFK5uK/mCYndsH3G82BLUcJhk48lOnAYu/f8wP6dHqQPHNbe+wz44VhJFeFhdjt95D0bqYJOQuA2uXgmSfNJZE3tYxJxMQQYcpjL+eKJGDlXl3cLhJ95Fyl9xmAmi+Xi4rTJUAPdxfvBfHlZpMb6bOKvd/N50M3BN92Ox9OCuaNch+Io0lU0YahTbQ2Jnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:00:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:23 -0500
Subject: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=2071;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ip5M/e71q+Ga2McCkdT3MDC241p4b75hE0vPlSEpQ1I=;
 b=rbAxdMs1Bj1tn5HYKw8GUPdn+YbiwOvl59t7ywy0NM05A6APLhiPeAXLstINFe94ve+IUe7Kr
 /J/JOUBqpAgAUfFZkWLfa+g3wTQnjg4PpV1M7x8UIjryW7O/anzn5q+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 4933386a-5479-4244-9ca5-08dd4a15e69e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RTYyVVYzcGY2bkY5dVU0VFRUSDBUTFNHbHNqY2NYRzFjUWZzdlkrTGNhc2xx?=
 =?utf-8?B?MjQ3cXpXa29lK1NpMkdiSXBDMHp4WXZWbkVLKys2Qm05T0RHRmE2ZkFnK3lp?=
 =?utf-8?B?MWJRNC9OWWdXcit0SFRjd2hJd0dnRG53bGtPZER0Nk1iU0VNc1NIWjF6Z2VW?=
 =?utf-8?B?WXQwV0JmbFpsUDU5cXVsbzFTeUtud3RMZkttbXhXaHNmZ3ZjVEhsVWJFZk1Q?=
 =?utf-8?B?WFZ2TFhUZytaYXBuZis5NnZTUU5mbktJYUFoU21CRUdzQ0c3NW96cTd6Nlhi?=
 =?utf-8?B?cHFXOU5yUWpxaFBmNGFSOUVVK0ZSaTJZSU1qQjVDR01hUkg1aC80Nyt1ZFQr?=
 =?utf-8?B?WnJPOTVNdHF0bDY4dW45cTlNeGdFRVVJanhpVHphWmw1VzI2clczUllYejl3?=
 =?utf-8?B?NnhhcFNwbVFwQThPTmhhdHE0c3Q5eDgyK3NBb1JPRnQxVGpxckdIYVZjTDV0?=
 =?utf-8?B?QTFubURhKzVSazFMeTcwby8wQWc5Sjd6KzQ3M2hrYk0vdWZYM1Npa0t1ZTY1?=
 =?utf-8?B?Si84NGxvMTY0N0tDY0lDdFd1WHF0c3NvSHZJMDYxdlp0QVViT1B3NnBuQ0JZ?=
 =?utf-8?B?MXNKd2ZxTm9IQytmdEVoUlMyL3AzdUhIdk5QdkFIdDU0S1FoN1E5RlZUSzVD?=
 =?utf-8?B?Y0VPUDF3bnYxQlA3UXlmejc2S0FUWHYxZUNnWTBabEs4R1dTeFlRSkVGa3Nz?=
 =?utf-8?B?bFdVR0VheVFVdkc2cHVnZGtMcWxiUDNaTkt5RWx0eXk4TkRQRXk0bHBOc29v?=
 =?utf-8?B?Rit5eUhFV1NDNmNSTlJCNmZ6MHVDci9laTZYU0g5eEZQZWNvN3Rvbkh4T0lw?=
 =?utf-8?B?RmJpclYzRERkL2ZWSUZRQkpNMFBGSVJTam1vS3R6eHYyWW1qNDRxZWxvWTFt?=
 =?utf-8?B?NVpOYTlWZVZMellCeGZxaWZyeWN3dENiRGRseld1Y0lrK3FwaEFneHNBcjNm?=
 =?utf-8?B?Vk5zcndxY0lMbTNrckk0L050SWJWZWgyNlNMaS94dGVOS2pCWHBOSmEreWpK?=
 =?utf-8?B?UXI3NURIK3VXaHZySzVEcm9yT3lpN1dVOEhrU1ZGUzV3QnRNNkFxejE2N0Vk?=
 =?utf-8?B?ZkU5UDJUVTN6UEJhUUkzTWhPZXI3REg2emF0NGxwUGpBTE90YXRXTlRMelIz?=
 =?utf-8?B?YTh1MVFuV0YwTmFNQVU5S3JiZklzcHpjUUpOSXNKeFNPSUNpVVprd1pwTEpH?=
 =?utf-8?B?MnorTGJHMm4rc1cybDQxNmpuUlBhc3dxS0t6YkRMbkxzWU9IMlZnK2ZEa0N5?=
 =?utf-8?B?Q3FPRTMrOWs2RFd0UUEzb0s2Y3FZN1FBSUR0N1pvQ1Q0aC8wbzlHWVFXdGRh?=
 =?utf-8?B?cGJRK014YmVDTmlPWXJUenNCVVQ4QzRaMmVvYlRROUNJOVh4aUNXbUpHaU9I?=
 =?utf-8?B?cHA5aVF2MnliZ0xodVdzRzdZU0RFbnVaL21abW5IWm5YQk56Lzd3Qlkvenox?=
 =?utf-8?B?eU9GeUNGei9GOFJ3MmswQ2pkWDRCbGdpNGFoTXpobDZWNnR0UjlNako3ZkNU?=
 =?utf-8?B?TVJsR2g5N3k2ekk4Z2l6WU9HdFdUUjBOVzJZS0h4em15V1ExNnE5SUw5dHZY?=
 =?utf-8?B?TGdlV3pUdXdaQ3NBaHAyRnp6VXlqNmp1OFZ6U3pGdzYvMEtvRHcvZjIyelNo?=
 =?utf-8?B?ZkdrdHNiQ05vSmFneURHTHQxUWVFWTJ4Zy9nNW9pVHowMzJnN0pHZUFxcGla?=
 =?utf-8?B?OW4ycWdZQTdRZEoxRW5zKy91VS9EWDdyREExSnNVakhIMWk0QkJPUk1XN2JS?=
 =?utf-8?B?Y25oczV5UTVvNXZoWmlob0xOc1hPbklPczBFeEFPNTUwaThtQWlmN1YzbHd1?=
 =?utf-8?B?d3JOWis0MTYyTE5WSWZwSEJaSWNPZkp4T0tjR2wySFVLVmJDc2dRbjVRQmRV?=
 =?utf-8?B?THVJQTV6eHpZUHg0N3l5ck16UUVIYjlPaVJIVUtFUXFLbGxmQUdlYjc1bkE2?=
 =?utf-8?B?OEpVbGRuV0hFSnpuTmxUYnRNdGpKQTA5R25oNFlRKzhBM1F1Qnlib0RUUDFD?=
 =?utf-8?B?N3NCMnVwRHl3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OGVJK084YkdkR295N3FxTjM2SlJZRVNLUGdjc3lZdTJraGxNa2h2VWI3ZVNT?=
 =?utf-8?B?anRtVXNyMnFDVC9BSmVJUHhWNXJEdXNVRHFlOUM0STBYWGFWd0xnYVNBTzcz?=
 =?utf-8?B?QTBwY3I4bnI3YnlnK085K1ZmMnRzbC9MNzg1ZEJtcnFSNHRGVHZFcWF5dE9B?=
 =?utf-8?B?TjNSUDNpQ1NXUVNwM2s4Rmp2K2M1TVpESStSYmdYRHoxaTlDcGlYNDZtRDFa?=
 =?utf-8?B?bE5KZU14NW1DeGtvL3d3SytXSzE5V0cwZy9QUkQ1Q0dOUm5MV3BLeVNobSto?=
 =?utf-8?B?bFA1VC9xcXI2WmVGR3cwbk96b1gxa0NxRnErMzIvSEkvT1NscDJYemRlOWdR?=
 =?utf-8?B?WE10YzVNR2g1dEw5MjVpTWNTcjNRdC90RlEvTFQ3V3NyQkRtb09kYkVJRk9W?=
 =?utf-8?B?VkJHWGFPOGtVTVZYMm9ZUldxTkc4WWRPRHpQZXlQdkhmd2djL3k1eElRaXhJ?=
 =?utf-8?B?MFh2WnVxQVJoWUUyODM3N1p4WFFGSERoK2F3RGFPbm9mZTh5Y1JRMWJ4ZjYx?=
 =?utf-8?B?RmZHNGRXRWpycW5ZZGdQdWVuWEVEdzZyN29zN29ObDNzSVpza09jOGYyNWx2?=
 =?utf-8?B?cWR0MHJTTVg4T2NwWlRmNEIvdlZPa2Q5YkVtMmUzNTI3dE9md2t1eVFoV2Nm?=
 =?utf-8?B?VjBpbzRaMnlaak5RMUZLU2d0N0Zqcml2V3FrYU1KVkplSnk0RUlVdmt4ODJU?=
 =?utf-8?B?OEdzTCt2bW5rVFNKZVB1bHNZS1VSTWczLytZaFU4dk1hTGZ4NzBkK0I2UmpZ?=
 =?utf-8?B?NGVyODcrVEV5MW1CbkVCc0Q3dmFHM3BlNXlQVGVXRzhwUS9WQWRaSkpnUWpF?=
 =?utf-8?B?SnRiaVFjeVpSclNnS1ZPcnVIckc4U2ZZYTZESk5iTFFGSVRMMVIzUWd5VjVt?=
 =?utf-8?B?YkhQOWI1c0J1Tkk1N1JCM1pVVDhraWlvdHRxK3d2MXAxa3VTa2UzZGxjUk9I?=
 =?utf-8?B?NUlVVE5uVEJmQXhNSDVnUU5UcGExZDBvNG5hUXF5Q1lsbTQ5Y1pUdE8wM1ky?=
 =?utf-8?B?VWlGM1pScHhUK3JJVHJGSnAxZHZ5b1ZTdWpOR2RiSEFYcTFuWmdIb21qTFhr?=
 =?utf-8?B?WWlmaFFjeWxQZ1R4ZUpSMUhOTU1CcjdLWTY0dXBLb0JablBrSkcvaldGYzN1?=
 =?utf-8?B?S3dTdGp1MGlZSU0yZ0h0SGNpR0J6bUNOelljNnZrRUxVdEMrSUtLbXcydE9k?=
 =?utf-8?B?VUdWUUFldERqZGpwVEh1MDFoeXdzMmZUYS9TVUNnM1JyanIxZmFoTHNHaEp1?=
 =?utf-8?B?QVhCUGJXUjJUVlRSdmVZRkVyNVNXNGV4MHlqTnlTWlhHSmVCeGFTYmViZ3JS?=
 =?utf-8?B?ZE54Q0lqZHRPOXd2cmd3Mlk2ekFaNkVFK0RkOGIyb3d3L1p5d0QvNjV6ZFRj?=
 =?utf-8?B?MmozYWp4dFhXdGhXMDhkWE1YUlRVcmw1N3VYRHQyeXEvNWU4SE1JaHlvNlc2?=
 =?utf-8?B?aGhUWW5UQmxqUDVHN3VrM0RnaUpSR1ZYWEtkUmJGNWtqYWtwdjF3UVh1TWF2?=
 =?utf-8?B?ZkxkMHh2U01ITGtHM20wYm9XY0xyT3haazZuMzA2Tnd6UVo3S01xRmc0STlk?=
 =?utf-8?B?eW85SDA1eFAvcUlZM0pSZG85RGFVNGlrMkN0dHpybzR1TnFPYisvbDdDa09D?=
 =?utf-8?B?TkYvTE9QeTE5d1VwQjB2MVNDWVlUaUExU1pNeEdlSkFReVZwTlIxN01pK2pR?=
 =?utf-8?B?UEtYeGJjYkhTaWJtM29meGJ4L1R4QjArQ3A5aTBPbFo3amVVTjQ4L2VNNkNU?=
 =?utf-8?B?MngreW5GYmtxZE9GVXRKeEdrY2c5RWFTNHlrNzVIWjFia3R3dTU5WVR5VFRy?=
 =?utf-8?B?NTBsNnh0cDg0T1RpRTB3SUlCSXFta3VHby9icGxrOUxVbW5IeW9ER0NMRUU4?=
 =?utf-8?B?Y0RHa1JuanZYbkJ0bmNORTVmZ3NWdlVERitraVh0RnlIWmRQNkRPK0NZNGdS?=
 =?utf-8?B?bEVEUzlLbzNnU2Zyd3E0Qk1Kc01yNk9PcUVlc3NwelI1a0tCaHFoTmNPeWI3?=
 =?utf-8?B?ZzZEbC9BNGtTRGpvckpESnVzUGozY0JvRlVTTmZyUmdqMm1FNTRYczN4anZx?=
 =?utf-8?B?SDIyZkxOMVlWeDZyOC9tUFpsZER1YW5qcnpuWDluSHo5Lyt2VHJoaVpJSjds?=
 =?utf-8?Q?nhWbHmlazM5OKRyGKqBy5Te/6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4933386a-5479-4244-9ca5-08dd4a15e69e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:08.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxnVAfgT/tyeXWtzF/xwZ9tKclNTZ56syLvqCb2AAZkjqVEHerSDvjFQG8fouoG2FCx49OFoq/giSwsIIZ+WOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

Allow num_sources (drvdata: num_channels) to be greater than num_sink
(drvdata: num_ports + 1).

ISI support stream multiplexing, such as differentiates multiple cameras
from a single 2-lane MIPI input, or duplicates input stream into multiple
outputs. So num_channels may be greater than num_ports at some platform.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v3
- none
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..ba5b2d3617a23 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 	 * Create a 1:1 mapping between pixel link inputs and outputs to
 	 * pipelines by default.
 	 */
-	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
+	routes = kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERNEL);
 	if (!routes)
 		return -ENOMEM;
 
-	for (i = 0; i < xbar->num_sources; ++i) {
+	for (i = 0; i < xbar->num_sinks - 1; ++i) {
 		struct v4l2_subdev_route *route = &routes[i];
 
 		route->sink_pad = i;
@@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	routing.num_routes = xbar->num_sources;
+	routing.num_routes = xbar->num_sinks - 1;
 	routing.routes = routes;
 
 	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
@@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 	 * the memory input.
 	 */
 	xbar->num_sinks = isi->pdata->num_ports + 1;
-	xbar->num_sources = isi->pdata->num_ports;
+	xbar->num_sources = isi->pdata->num_channels;
 	num_pads = xbar->num_sinks + xbar->num_sources;
 
 	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
2.34.1


