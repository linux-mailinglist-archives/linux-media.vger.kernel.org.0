Return-Path: <linux-media+bounces-65140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b6vnJU/7MmoS8QUAu9opvQ
	(envelope-from <linux-media+bounces-65140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:53:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D569C401
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=MtMoAN2b;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65140-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65140-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 794913081134
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F05395AEB;
	Wed, 17 Jun 2026 19:50:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18C393DE3;
	Wed, 17 Jun 2026 19:50:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725853; cv=fail; b=X6IMvXDWd85OEL+iRZN2QYMieFVLfA2nepmQwjj1HVB3QAfNF28aem4DaBWdqXHVBXxmabc/BQk2rk8JWmU9P93YMfvJxATrus1G2WScauPRbiF2Pj5u3aXebpinnOqiDMF4hksy9Lz/gnPbvSwj9oIbvK3n5B/Kxaqw2QipDFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725853; c=relaxed/simple;
	bh=8CrOZlrwaqKFAlFzJe5oQKE5amkYUIOUGDxA3S0zfR4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SCzIV5DwC8tiY2loJ1Wyad/5nZVV0aK5hO+rAidPyc92HZRexKn65kM8z1rfZnZNI3x6XQa7XglWg9BP9jeeMHEj0JE35MYjsUC7AhslepT8kWUkNR5f1jrnakRtA0lt7ld02VKrbpNyChKjljv47tcSf2+XF1t4MNw2nqZWqkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MtMoAN2b; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkSPHnqkpHcKebrRgLBMs0TutcuYvw2MIR+9UgRad03r2YSsDrUA6txTeDer3BGG/qnA41ieRqLm5NHPzBs4BAjncFM93m2/dwU/6R2igprZRYXolIdoApK9CFJSdf72VGblrA4K5J/sI+OkNuysIJ3mnYAjaTuMr4xs6v1HodupevviRz3+Q7FlWr202FJDvovXYxvYjA294RPrGYtl4Scq2c4SuyrfJgI9E/1W62SeZg1JZfBvgXUGFA1cYCdRNn8UcTMm+aW3UlyiV3nbUV+Kfv8igCNbKYHR2CBsxV1qDqJdQGyEyzPvKXiJqGNeCGC2EVpzQ1mtgrg2uSRn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhuDDE8is88VJlNxKLdg7PX8IpozkECr8bOdqn9e2A0=;
 b=AXs4lm+ky9jGHz9qMtSmIkshZbefKKXcWHa+ySjUN+rA5gjyK7ZrHZE9OvKGIb1yIoaQStYGk3zzkevGNFuihoTjsPiuFTeSvZXZf+XEpq4/kKvbV0zOXeTHwWWnbyZX1pE9A5o9H4riu7PSonUXjXnNDDrHD2XPX/sN2gtm+k0vkMUA3SVGkvJG7VRbol6jve6Qwhr8zzrjM9jULIkAHRf6QC5UZXBIKs2L5Fj4ef8kANTOjECefLtFvZOE/n1gcWyZGCtP7eZog+ll7xfhS3dbSinYrVUSC2GA+1KVaQtB2JtqVJGSIHlqe3NQLMbcwFdPUlk9dsqcHWSZcktAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhuDDE8is88VJlNxKLdg7PX8IpozkECr8bOdqn9e2A0=;
 b=MtMoAN2bheHDk+F9d9oElt4rbehABUD1j18ciGG69bdcNwsJ2jEXkAQAAA2qkvBa4d4/8Z/Ohna+h5qVZxD6GBjtakP0xijKWnXQSM65A6wnEAc2kd42Ny5OKi8gKyie1v7SSnCpjMnhXD+tdSAbngHgh/bo5xe+3dDFj23XSHcfkT2W7VgUfSL7LCEQZhgzs+o4VwW7THUDfNB38TKTIr5A3PHPycQj+2HCOftBGxgm6Ratdy6OXdXRIdQQoaTUeyPYyNk5F3DQlZAWw1yDgVwuZMyJg0tA5mDADRvOWvQCOrLXWrh2yU06WiFk4s4bSiKKy0NtNKmtUf7hFghzgA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:39 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:14 -0400
Subject: [PATCH v5 4/8] media: synopsys: Use V4L2 1-to-1 subdev helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-4-7fa6c8e7fba7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=11750;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=flje5tIjBMr8KkLnkWaOH9gQuFFq6UUXRzEgUlr9pKI=;
 b=oxPVYQbVXBAq50PC6mix1O/fZjjEUPhJt1uJmKuGKWIu7MiBt25R2EwEWmZChQJrE2HXXHPNS
 0wRShVb94wMAFS721t/0kxezsPAeOEYBmiK5PAYMGNwRSmnjuTFSk+s
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd2e74d-2ab7-49fc-e496-08decca9b510
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 0UN6r8p+qRsxDdxkprpb8Q8f+di782c8X9FLVtAl3106QAyz7icBRrpj6sm2zcT+9sm0z4iey6UMAviB5YnOkj4UWZyrw4kJx7RUeLPQqSF2tsLW0bMHRkUXqUfx5xMKQ9VQ6jizfmcC1/NvgFkTmCuRC9DLCSQtj7if5dAdhmhlk+t8q53eVEVwYw9wKXV/EIhep5zuTxHfwa8vsk1rx1uJD4NGgvk0rwab4EWrZNGZlDu7CWZwduz1Nyv33SenP7V6OclxHG1/ZsPGVkbUFFB4kJtK92lNxoXGc+8E4hPPmVeO6nsSPCzxc+XUqCjsYbm/wP1lgkCVliyjKNRxjCA4i0Ym8Sw8lmYJZxCLim5oDW1KbxF0choyPnOnx808X0uZrAGXWX7bkYiIs2o9SKnIRIxUj7ylccMjvnIShYc7yLKupFwbIm6Rj8ggZLNKOsvkJrkKy1yov56ZRhS+KETBzu/IQOm7z/QGeuGya9zM160bAUGG+rVB6gTvl+gmrQBhKz9nruJFAvbBPoDgIygE77WnBZq5ihR17BcWDl2iOgchPjuQVdZ2HXBLTB5aXXHqAugZcNaHPEw3iNLu9ry/7dCQIQtPf5JFlrAeQCQ3KP880Ip/ApdVrt7f7waiNDVk48GJKmSiRS0+O7StxFaPhsd7yet+6wwA1wNMy6yFGUk/HVJHs9kna6hE2rf+ljjwy+LwfKSqmY0JzFBoRjm2m+hO4+DiZeXsvTfE6b0dpaZoCmvWHauTIaIdL7FV
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SGJyM0dUZHJ1Z3pXUTVvcFVGNjNUQW9vNmVOWis2L3VSbGNXRVJnNVFXc1ZS?=
 =?utf-8?B?RDFoSFVMZ3UxeXpLVkkzUktEdjQ0WXFFbnRudTNIVWtiK0FkUjlMODBaSVJh?=
 =?utf-8?B?WWZPR0hTRXNHQk02dzUycVdORGREUjJXVFVoQ0lYRDNHZ2krVndUdWloMTZE?=
 =?utf-8?B?MjNTV3phTEhTQURtMXFGNDhaa25PamhReFZZSHBhRzdJenNmb0kzT2Y0UWkr?=
 =?utf-8?B?VFZIazdudklCY0wzb0EzVk9YOGJGMDdtankvSGVsTzJzMFJIaTErZ29qZEMy?=
 =?utf-8?B?em0zOUxUeWNiSFA5OTBBVGJZcXlTTk5mK0htdG04b1NiUHQ1bzlQMVFaSlJs?=
 =?utf-8?B?anR3SU5TaDZZQlAwaGF6c21rdnNIc2Y5WS9qd3RXMTdjUTFZekVTdnhaSlcw?=
 =?utf-8?B?MVNSUjVIVENQRTRTUkZpNEs1dUlLRWx4ZEU0TnRMNlp0WEIzN0ZCMlVOanF0?=
 =?utf-8?B?K0syU1JVek1KdWp5dGFqQ3ZGVWJYMWFpN2s2NEJJT1BWM1hqZEtoZitWeis2?=
 =?utf-8?B?dlp2VFVRaWJrelZEWVN5c2pFRk4zSVhrMytzakZscm5wTzhqWHdLdlhGbnJ2?=
 =?utf-8?B?TXEvS0VMQkVhck5nNjQ3SDBTYWpsdi92L2hkZW4rZytpSi8zdWFoUXVPY1VO?=
 =?utf-8?B?VDJ5ckFPS3J1RnBSQjA5RzYraVZZb0FHalpOcWNvUUFxbEtveVprOGVvdXhN?=
 =?utf-8?B?TzNUQ0Z6RFpiYUY1czVwM290OUVtRFhUWmU3NC9tdFFzSEdhcUZFd1h6U284?=
 =?utf-8?B?Z2pNYmtmelQvbzE2WlZCSmFuckk1ZytLMVN6WnVqZzNaNTVURW93L0thWnRY?=
 =?utf-8?B?WGx3aTNSck13SDJiSVIybklGMWRsL1hibENaaVNBejI1SEhnUmNPZHhaTEhz?=
 =?utf-8?B?Rk1nNGN1bUM3SlJ2MTJ1dms3L3RSUzI1VjBzM0U1RnZZRndMWklaV0NjRFlU?=
 =?utf-8?B?S2s2UUMxeUpwSEFqSHo1dkdOZGRDbW0yZEZhSjhXUDJUS0tmbXUyNWxEUUVk?=
 =?utf-8?B?b0RsZkNnRTNqV1ovcXlOQjBlclR0Z1dSRUtTaHNOSHQ1a1NKZkZsbUxzMjJX?=
 =?utf-8?B?NjNDa2piTmZrY2c2ME5mRG9PWi9OTDBLRGt6K2d4NDJKNDRQZUo1SXFqazFs?=
 =?utf-8?B?VERCK3BSMEhSNU02Wms5K0x0WVNhcW5YYnowcTBhVmw1Uk9JTnAzNDJSbDUw?=
 =?utf-8?B?UXZSUTN0OStYT0tYZytXOUcyRURwc1FYemo3NTRtL1N0T1pmMkVmWkNpVzhY?=
 =?utf-8?B?WGh2ajNORkdQZkxINTJFTGRKWDNCdVRBOEd3QjMvV2lYL2FEUUREUUl2U25l?=
 =?utf-8?B?TW52WmtUbGJ0V3ZEeFMxNDJyUG0raUV4WXFsbjZkb3psZ3NLYkVqMExrQkt1?=
 =?utf-8?B?Sm9MTTNteUU0aldid3NGRHdUQnFEZUdaZThRT1RNTEU5TkpodzNsM2N4TlJQ?=
 =?utf-8?B?YkV3UHdQcTVyaFM4VzJ1QjVaYVB6cTdHM1MrVHM0eExLNmozZDBsa1VYZWsw?=
 =?utf-8?B?REl3YlBwUXllWW4zbHd5OHJGN0RuN2I2alo0TnMzaEorK0xaVUpvajNsVnAw?=
 =?utf-8?B?WkFGUkNNMzczQnhuODBOckhmckRQZmozVEdlYXMwR0t3Um1telNUbE54Wlpa?=
 =?utf-8?B?a3VPQ3VFSjhBUEVEMjlCL2VoeExvRXlJTGVybkg3VHNOb0szc0huUXpUaGFJ?=
 =?utf-8?B?RW85d0cwSkR1WUJNQ2k4SkVpbHhjOXlCaVJVYmh5VUZkUlFlWXpVYzEzdUgw?=
 =?utf-8?B?THZqY3ZucHpPdDIvNHBjWUw1YW51Vmk3WGJKOEJXc1duaVhtVG5TLzF6V3N1?=
 =?utf-8?B?VnFrR1E1SjhaeWdXQ3l0YitQdGc1aUxXc3E1LzlLUHJGVDNTSXdoZ01IUnhR?=
 =?utf-8?B?RllNelRIa2dCOGcwQm5qMnNMZW55U3Y0a2gzTE14aGRiempuUFBlYWJJSDIx?=
 =?utf-8?B?Wk0xU0NZZEtLTzArbkgydm5xUVd6eksvQ1lvOUtDQ1h0d0ZxbHJ6eGJwOThN?=
 =?utf-8?B?STZwRGwvTHJwM01BTFM1Z0UyS3Rqa1BreVpXeWFPSERJMGUxTUR1NTRWakh6?=
 =?utf-8?B?RFYyU0M4QmhyaW5NTTFvUysweHdGTWFpVGNCS2xHSEwvK3N3eS9XajBLWTFn?=
 =?utf-8?B?Nlp6UzVRbzN0em93eDRSU3FWanZDWGpFQktEdEFzQWRBN215dEkySllEbkRX?=
 =?utf-8?B?N1dMWlNQc2YrNjQvRFBwN3hIYVNxekxNcE5zZDlobGdYbk9CSUg3eDIrY3lR?=
 =?utf-8?B?ejgyd0VrcmJpUHpmb09Fc2EzQ1ZlN3ZPVE9KeDVJWW5IVnRLdDVURGJPeVNQ?=
 =?utf-8?B?YzdTTVkwODFXV2VUaTVBd3liZThOeTF0QTE5MGptQ3BOcXdWYmY2eXJpQVR6?=
 =?utf-8?Q?ftnCSunHnRlktvOvdVpgoUemvtD/P21U2jxrb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd2e74d-2ab7-49fc-e496-08decca9b510
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:39.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rc3vkbq3NDrXlO1kgqL06ohcigihNCcoxKSwUO3LbWwcwAmHAEDkeSczzO+QQumqHsGT/w4ZeDM1zwQN7myUY8EnyNPAiHxtXKVT+MfCYY6ojUIdu/dY+HCotxqZUc7X
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
	TAGGED_FROM(0.00)[bounces-65140-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,oss.nxp.com:from_mime,sd_1to1.sd:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 084D569C401

From: Frank Li <Frank.Li@nxp.com>

Use the V4L2 1-to-1 subdev infrastructure to simplify the driver.

Replace the local subdev registration and media pad setup code with
media_async_register_subdev_1to1() and struct v4l2_subdev_1to1. Reduce
boilerplate code and aligns the driver with the common pattern used by
simple subdevices that have a single sink and a single source pad.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
new patch

previous method:
https://lore.kernel.org/imx/20260226-v4l2_init_register-v2-2-902d7140f9fa@nxp.com/
---
 drivers/media/platform/synopsys/Kconfig          |   1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 172 ++++-------------------
 2 files changed, 28 insertions(+), 145 deletions(-)

diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index b109de2c8111c..8d7aabf93af34 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_DW_MIPI_CSI2RX
 	depends on PM && COMMON_CLK
 	select GENERIC_PHY_MIPI_DPHY
 	select MEDIA_CONTROLLER
+	select V4L2_1TO1
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f51367409ff46..b70e3783adcd3 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -22,6 +22,7 @@
 
 #include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
+#include <media/v4l2-device-1to1.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
@@ -78,12 +79,6 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_MAX,
 };
 
-enum {
-	DW_MIPI_CSI2RX_PAD_SINK,
-	DW_MIPI_CSI2RX_PAD_SRC,
-	DW_MIPI_CSI2RX_PAD_MAX,
-};
-
 struct dw_mipi_csi2rx_device;
 
 struct dw_mipi_csi2rx_drvdata {
@@ -112,12 +107,8 @@ struct dw_mipi_csi2rx_device {
 	const struct dw_mipi_csi2rx_format *formats;
 	unsigned int formats_num;
 
-	struct media_pad pads[DW_MIPI_CSI2RX_PAD_MAX];
-	struct v4l2_async_notifier notifier;
-	struct v4l2_subdev sd;
+	struct v4l2_subdev_1to1 sd_1to1;
 
-	enum v4l2_mbus_type bus_type;
-	u32 lanes_num;
 	u64 enabled_streams;
 
 	const struct dw_mipi_csi2rx_drvdata *drvdata;
@@ -294,7 +285,7 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 
 static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
 {
-	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
+	return container_of(sd, struct dw_mipi_csi2rx_device, sd_1to1.sd);
 }
 
 static bool dw_mipi_csi2rx_has_reg(struct dw_mipi_csi2rx_device *csi2,
@@ -360,9 +351,9 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 
 static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 {
+	u32 lanes = csi2->sd_1to1.vep.bus.mipi_csi2.num_data_lanes;
 	struct media_pad *source_pad;
 	union phy_configure_opts opts;
-	u32 lanes = csi2->lanes_num;
 	u32 control = 0;
 	s64 link_freq;
 	int ret;
@@ -371,7 +362,7 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 		return -EINVAL;
 
 	source_pad = media_pad_remote_pad_unique(
-		&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+		&csi2->sd_1to1.pads[V4L2_SUBDEV_1TO1_PADS_SINK]);
 	if (IS_ERR(source_pad))
 		return PTR_ERR(source_pad);
 
@@ -380,7 +371,7 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 	if (link_freq < 0)
 		return link_freq;
 
-	switch (csi2->bus_type) {
+	switch (csi2->sd_1to1.vep.bus_type) {
 	case V4L2_MBUS_CSI2_DPHY:
 		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
 								 lanes, &opts.mipi_dphy);
@@ -458,16 +449,16 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
 
 	switch (code->pad) {
-	case DW_MIPI_CSI2RX_PAD_SRC:
+	case V4L2_SUBDEV_1TO1_PADS_SOURCE:
 		if (code->index)
 			return -EINVAL;
 
 		code->code =
 			v4l2_subdev_state_get_format(sd_state,
-						     DW_MIPI_CSI2RX_PAD_SINK)->code;
+						     V4L2_SUBDEV_1TO1_PADS_SINK)->code;
 
 		return 0;
-	case DW_MIPI_CSI2RX_PAD_SINK:
+	case V4L2_SUBDEV_1TO1_PADS_SINK:
 		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
@@ -487,7 +478,7 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink, *src;
 
 	/* the format on the source pad always matches the sink pad */
-	if (format->pad == DW_MIPI_CSI2RX_PAD_SRC)
+	if (format->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
 	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
@@ -549,12 +540,12 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	u64 mask;
 	int ret;
 
-	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
 	remote_pad = media_pad_remote_pad_first(sink_pad);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
-					       DW_MIPI_CSI2RX_PAD_SRC,
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
 					       &streams_mask);
 
 	if (!csi2->enabled_streams) {
@@ -608,12 +599,12 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	u64 mask;
 	int ret;
 
-	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
 	remote_pad = media_pad_remote_pad_first(sink_pad);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
-					       DW_MIPI_CSI2RX_PAD_SRC,
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
@@ -649,9 +640,9 @@ static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
 {
 	struct v4l2_subdev_route routes[] = {
 		{
-			.sink_pad = DW_MIPI_CSI2RX_PAD_SINK,
+			.sink_pad = V4L2_SUBDEV_1TO1_PADS_SINK,
 			.sink_stream = 0,
-			.source_pad = DW_MIPI_CSI2RX_PAD_SRC,
+			.source_pad = V4L2_SUBDEV_1TO1_PADS_SOURCE,
 			.source_stream = 0,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
@@ -670,91 +661,11 @@ static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
 	.init_state = dw_mipi_csi2rx_init_state,
 };
 
-static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
-					 struct v4l2_subdev *sd,
-					 struct v4l2_async_connection *asd)
-{
-	struct dw_mipi_csi2rx_device *csi2 =
-		container_of(notifier, struct dw_mipi_csi2rx_device, notifier);
-	struct media_pad *sink_pad = &csi2->pads[DW_MIPI_CSI2RX_PAD_SINK];
-	int ret;
-
-	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
-					      MEDIA_LNK_FL_ENABLED);
-	if (ret) {
-		dev_err(csi2->dev, "failed to link source pad of %s\n",
-			sd->name);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations dw_mipi_csi2rx_notifier_ops = {
-	.bound = dw_mipi_csi2rx_notifier_bound,
-};
-
-static int dw_mipi_csi2rx_register_notifier(struct dw_mipi_csi2rx_device *csi2)
-{
-	struct v4l2_async_connection *asd;
-	struct v4l2_async_notifier *ntf = &csi2->notifier;
-	struct v4l2_fwnode_endpoint vep;
-	struct v4l2_subdev *sd = &csi2->sd;
-	struct device *dev = csi2->dev;
-	int ret;
-
-	struct fwnode_handle *ep __free(fwnode_handle) =
-		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
-	if (!ep)
-		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
-
-	vep.bus_type = V4L2_MBUS_UNKNOWN;
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
-
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
-	    vep.bus_type != V4L2_MBUS_CSI2_CPHY)
-		return dev_err_probe(dev, -EINVAL,
-				     "invalid bus type of endpoint\n");
-
-	csi2->bus_type = vep.bus_type;
-	csi2->lanes_num = vep.bus.mipi_csi2.num_data_lanes;
-
-	v4l2_async_subdev_nf_init(ntf, sd);
-	ntf->ops = &dw_mipi_csi2rx_notifier_ops;
-
-	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
-					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_nf_cleanup;
-	}
-
-	ret = v4l2_async_nf_register(ntf);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
-		goto err_nf_cleanup;
-	}
-
-	return 0;
-
-err_nf_cleanup:
-	v4l2_async_nf_cleanup(ntf);
-
-	return ret;
-}
-
 static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 {
-	struct media_pad *pads = csi2->pads;
-	struct v4l2_subdev *sd = &csi2->sd;
+	struct v4l2_subdev *sd = &csi2->sd_1to1.sd;
 	int ret;
 
-	ret = dw_mipi_csi2rx_register_notifier(csi2);
-	if (ret)
-		goto err;
-
 	v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
 	sd->dev = csi2->dev;
 	sd->entity.ops = &dw_mipi_csi2rx_media_ops;
@@ -764,45 +675,15 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2rx %s",
 		 dev_name(csi2->dev));
 
-	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
-					      MEDIA_PAD_FL_MUST_CONNECT;
-	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
-	if (ret)
-		goto err_notifier_unregister;
+	csi2->sd_1to1.remote_bustype_cap_mask = BIT(V4L2_MBUS_CSI2_DPHY) |
+						BIT(V4L2_MBUS_CSI2_CPHY);
 
-	ret = v4l2_subdev_init_finalize(sd);
+	ret = media_async_register_subdev_1to1(&csi2->sd_1to1);
 	if (ret)
-		goto err_entity_cleanup;
-
-	ret = v4l2_async_register_subdev(sd);
-	if (ret) {
-		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
-		goto err_subdev_cleanup;
-	}
+		return dev_err_probe(sd->dev, ret,
+				     "failed to register CSI-2 subdev\n");
 
 	return 0;
-
-err_subdev_cleanup:
-	v4l2_subdev_cleanup(sd);
-err_entity_cleanup:
-	media_entity_cleanup(&sd->entity);
-err_notifier_unregister:
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
-err:
-	return ret;
-}
-
-static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
-{
-	struct v4l2_subdev *sd = &csi2->sd;
-
-	v4l2_async_unregister_subdev(sd);
-	v4l2_subdev_cleanup(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
 static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
@@ -879,12 +760,13 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
 
 static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
 {
+	u32 num_lanes = csi2->sd_1to1.vep.bus.mipi_csi2.num_data_lanes;
 	struct device *dev = csi2->dev;
 	u32 stopstate_mask;
 	u32 val;
 	int ret;
 
-	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
+	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(num_lanes - 1, 0);
 
 	ret = read_poll_timeout(dw_mipi_csi2rx_read, val,
 				(val & stopstate_mask) == stopstate_mask,
@@ -993,7 +875,7 @@ static void dw_mipi_csi2rx_remove(struct platform_device *pdev)
 {
 	struct dw_mipi_csi2rx_device *csi2 = platform_get_drvdata(pdev);
 
-	dw_mipi_csi2rx_unregister(csi2);
+	media_async_subdev_1to1_cleanup(&csi2->sd_1to1);
 	phy_exit(csi2->phy);
 }
 

-- 
2.43.0


