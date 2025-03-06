Return-Path: <linux-media+bounces-27767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1AFA551EF
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 509E53A3C82
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AF225BAD1;
	Thu,  6 Mar 2025 16:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="oKIBJ8aQ"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023113.outbound.protection.outlook.com [52.101.67.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5927025A35F;
	Thu,  6 Mar 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280183; cv=fail; b=rRnNanBbXpAQlM299zxc1d8vnO/8rXyOQUy21pWZ67/Q7Ps3R6QrmkDf3F3tbMSPd+Vx/c4BmTlT0NjmscMbrKO19DxgERGdQNnA9aT9gdzwyxByT3YJ82ep+/UkiV6oeyJwthedaMS9UgDgUoI39SrntnZ387OxeC/eiK2SeMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280183; c=relaxed/simple;
	bh=TOjjCdbG8+id2SdNirR3B6WDLwEWVtZBREEw0OdTRgc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UB3OS9i4pkePrmxsnXdcXjSEPyAeJK0EXPD2hI+yy+M+SpTIbch9SEOXgBGqR6wd3S5MxeCld1pXdNLEnRYvsohGp99ZlRTGhJEQv1qKsHHLmPlhwSBOJAM1SyINHWuygxvAEec2pL1ud/phpNhqYnFhkSJeCdjBDcwhugTK9P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=oKIBJ8aQ; arc=fail smtp.client-ip=52.101.67.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6grFY4Y5IV4mLT2FKCisgJcIB8SmYbvoqa8HCj6uWMQXpM/kkx5FtInYwJgDQ3564rDahx9Z1qnfo086PFLcJko/PiiM/TpgA1LfRQbV65EQ3WJkmJ4QSmA3p1phMiWy2VKjEDFMw2wXIGDgfGXXFfM72Cmf+Dgwbc1ZJGS7mQfamWTeBNlqbxQa9D2DwFMJRonPCETQh7U0TBcLwDEIOup8jXH/xMAOn4kWMzm/SpYS+bFcmGJ6w81zsQGme6ZDlk3ceGBHsfAhkrY1IuFU/JkmWiNUXskiYwZAP2GBnFYAGXuDiuqlsUmsbDQn1RCyOByc9OOXuDJGvl4ZYuGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAevX8DPPJJwFpeEZsZj9Ll8Xy/l/5Dz9tCfFmx2VLA=;
 b=bVIx51CoC0EkbAX+1jLmw6KeHt640ExL+8+eyt6u8WkByDaeQagZju+CI5kj6bXdRt7bf0xtFYcG90qSCXZeVk9twJqRq/bl9/kCBGw3niekO9nc2mw/L11iO1Tk8nsYdZI9MeNA8joLX/t94eKW+IVdXoh+EdIImtFp1HnbUEpC9CpDG9BIBpfEfNwX9mILcPTqT28KDZ6js7zINx/YUyc4GNm4AzYRzOe3AZCoXnMpeVAIBtFnzSimdFJrCG6M1xikZurxTB3kdbsMF8iZC1e8M5qZbPs1ONFAZCYV+9xkvjJA0lT1a6iNy9yzkKwxArBsIYmdmzAeTPgu8CuxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAevX8DPPJJwFpeEZsZj9Ll8Xy/l/5Dz9tCfFmx2VLA=;
 b=oKIBJ8aQ0R4Qvbb+Ca+/NcGqMSec1ppGDPdvqhVrNjC7AoFSLJFacnSUsWOaQsruyF30qoV6JXWrhBms8B2TPhYmmvD+TCM5u5ny1AAssde0zNvLtcFevm2ef7gXRyxhYleeG+C6AZENL6kednI2Di/udOqpBtxqQzMBP3CkZuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:14 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:12 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:03 +0100
Subject: [PATCH v5 02/11] media: dt-bindings: media: add bindings for
 rockchip px30 vip
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-2-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=4443;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=NsTFkcABzB7Oz4O9mN4hbSE8/lW18X7tv64zaWMvP0c=;
 b=el5pqdlMGGAI5ayjm8IXAGtNhhOWOn4XxuPRqf9FlJW86ai0nrAM8+PzJg09n//BBst6+okzu
 22Ffuo+UWvfBHcCcKpeWau1SuHbZWbczzX6x8rkuVV9wEoxJ0CIl6WV
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: dd790c15-f589-4953-3f54-08dd5ccfccc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUpSSlpvei9JSnhCQkxrU3RDR1FNZE9vUVF1dmNSRWVKUmpQMTF4NUhsNzZQ?=
 =?utf-8?B?a1VVZWMvMUNmZFJGbnYrenZlZ0hZN2J2azBjT0RrNmxPODBCcHhQVWt6R0x6?=
 =?utf-8?B?M2lML0RGektuZHRNZUFDZ1MrMitkYVl0cXdidytFa1ljYXRaQ1pDUWFJcXBD?=
 =?utf-8?B?UnJuWHFxL1lQVzBma0dXbDNHWlFGbmJ4bFdyK3NiOUl6UUhOcE5xeDJCSnVt?=
 =?utf-8?B?dGJFclhEWHBNNkNMSkVqbnY4YnAvaEpaYWVyd1ZPWUZCVy9uczh5NFpMNEc2?=
 =?utf-8?B?Uk16aUE2MXYwYWloK1VObVV1d21YcUtreTQrV3EwNWk2R3d5L3hzcjYzdDJi?=
 =?utf-8?B?N2ZsQ1hqSTFGdlBXSGpIWTN6RXFKNGxCS2NROUtnRmRDdG5Td3lNVS80M3JV?=
 =?utf-8?B?bDBjY2hKZ1ZHTWtlUGNJOGxDa2tuazc4RnJyVTFwczFSQml1THgvbDFibWdB?=
 =?utf-8?B?Qnl1TE8xcFczR0hoT0ZqTEhubUhKNnBSeG1WNGkzb2JLYXQzM3Vid0ExcVBW?=
 =?utf-8?B?OWczQ1lGemwzWmtMN2Q1am5sb05FQWh0WWF2N3BjaTZCWmdkRTQrZWE1SG9T?=
 =?utf-8?B?UXZ6NCs2dlpya3RidTdEeERqM1hoY1NoT3RGdDQrMzE3YmlZRkcrUzhZbERs?=
 =?utf-8?B?TDg5S0pIVldCcGVDYkl3Z0hjM1Nkc1VXc0NydDBJMXJHdnR5czkxRmgwcFlt?=
 =?utf-8?B?THo0VHVsQ3Y2M1M5TXp4Z0pTZ0JyV1dBeFNjRGt4UjdKYnl2VlFhNjhwWlA1?=
 =?utf-8?B?Z08wQllMem1ROWh3OWlmYURSbENNajNReFp4blNwMWFZTWFCUExUemtaVmVV?=
 =?utf-8?B?bEtNSlRIb0FUbkFWUXBIc0tHR2YzZTV4c3FZUzBLRkFKQkI5ckxzN1NzNFRa?=
 =?utf-8?B?WEVTTWs4V0huY2gzZW1FeGxBRjI4NHJ3akRLc2FDWGJoaUhRS0pTT1g0V3JK?=
 =?utf-8?B?WGI2aDFhd0xQQ0JXazBMbEk2NUQzaUtpWndkbFRhdmg5QzhZbEN1UmVzcHFp?=
 =?utf-8?B?RUEzMWNyVjZ4bG1YbzJBOWRHWFJrdDlzZzNIK3k1MGowWHJHU3RTTFJraEFH?=
 =?utf-8?B?QkJCZFg0SHc1Qyt6ZHBndHpwR0dCSnBzNzZaa1A3VDlQbEN1R1d1eWkrUFcz?=
 =?utf-8?B?eENXQlZyMVRJWERZa29MaWY4SUt4MHVibTVyeVA5L25XQVhJWTNFZEZMVTdm?=
 =?utf-8?B?NmtFYUZtNkpnNy9vWU5ZdUdZc2VvNmx5eWhLM2lQYy9DUHY0STdtNXZlRkFH?=
 =?utf-8?B?c1l3LzhPUjNzY1h5ZnNic3dWbmd2c1lkQlRxc1hGSHhjYkxDRXIrUSs5bkhk?=
 =?utf-8?B?WXhTNk8rNGZXZFVqWXBSZXo4Sk40dFNGSUMwcWNwSFBDeFRxYjFJQkdtbHpm?=
 =?utf-8?B?a3lNS3crQWIxOXpkL0tWRkhaWncxNUh5WEpEdHBJRnQ4WStPOVZleVcvRW9k?=
 =?utf-8?B?TFc0OUdiRmlybURtYUJ6SUNLUWlWdEZrVFZLcHJqTkpsOFN0KzVHZmFDSGM5?=
 =?utf-8?B?enFmdE5hK3MzajlMUk5TZ3hPb3BwbG5WaWJQMVpMc3BIdmp0MEhBcityUVVX?=
 =?utf-8?B?WW9mTlZDSWFUUnNvTUpXODJZbzVVUEpHUGZZQkhzMzNPQnFkSmV6dStpbm9v?=
 =?utf-8?B?ZHZBQkx4cHA5eEs3LzlMbnhlelg5QUFwSGd3NUxFZUdMYWpyaHBiQlZUMjdN?=
 =?utf-8?B?RHk2TlBZZ21VcHNYQlR0RUZKQ0FEb0JLNjZmT1ZmQUtMcE84S2t2eTJoTjha?=
 =?utf-8?B?ZXJtSHdBc21kUUExVXhKNHgzdTdWVlFmaURGR1ZHM0FoeEd0Y3l5aGdCa21E?=
 =?utf-8?B?NWJxeEFjVHZKakx6bU9KVi80Nm9VVVpBbTA2ZllDYWRMS2d3cVFpTXdBMUZn?=
 =?utf-8?B?R2tNKzVaQXZmQ0hTSWZDTFVuQVMyTmxIQU40QkRiZk1Ob2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ZWT2YvaEtPUU5zL0dWY2pEb05JbllqU1BVY1FjTDE3bEhSNlF5NEhUY2Ni?=
 =?utf-8?B?Sk90SmJ6SGlld21weCtQblNJeWNEbEJzcU5BRHZKN1dnTHhRbTdKUXhiZkJY?=
 =?utf-8?B?Q2M0aTZwZmFXOHo0Z1hmdk03VWxMNHk0aEUrRE0rSGxid2tGYVdOT3g4OThP?=
 =?utf-8?B?dUh2VXZYeXptMkU5TjhTVkhENGtORHBDcForVmxFSDZsU3ZINVZFd08rL3RX?=
 =?utf-8?B?MWdHNngxZTQ0Z2lRbXhVaFpOcUtpMGt3QURZSTk3N3NZenIwWVZRNmp5OXlj?=
 =?utf-8?B?ZC8zajNZUHgvQ0J2R2t4V3lEeitqYVIyQWhpenhDUVVvc1dKRk5WdlFBRHZp?=
 =?utf-8?B?WXZzdnlScUw5NjJvZ0FRUXJRNjRhdDRKN2VacUNpUzZEMXMvTkNuVi9URUtk?=
 =?utf-8?B?M0xNR0NEa1hRS3kxd0NVdzFpQnBJaU9TNzFNdW84ZTFJaTZBcDJEdW1wZzBZ?=
 =?utf-8?B?cU4zLzFFbXhHUlgzYXdJQ082YlVlekFwNkJnK2NMbUNIUW05aUtyQXlDNzJI?=
 =?utf-8?B?T3RhUXBJMC9JVU1LN1dDcDRSQjU3cng2WkVtWUg4SHNBTmhXU29qZWRMemh6?=
 =?utf-8?B?eFlIK2twUGs1WXdIOGNLMlZIeWpJajA1bmtMd0d4UkJkTDltaWpEQk9vTGJq?=
 =?utf-8?B?WE91MDNhRXY2MmIva1MrOWNreHo3Szk4ZmRWbEV4cTVRNEw5SFFKRm1nZ3hD?=
 =?utf-8?B?cnNnbUpOZWhjSUM2N1NLdnZxKzBPcEw2VUhlbDJnK0d2cFNVaHpGMDVUSStS?=
 =?utf-8?B?Z3NrRzlQOTF0ZUdQOUM2L0FhaFN0T1phVjZmcUpoMXZTbHQxYzFtZG9nWXpz?=
 =?utf-8?B?OVczSWxOTUk3RkZGQXBpN1A1MzNxb2dFb09MZjBscStoTlhPdVJWTVRkam1m?=
 =?utf-8?B?VUVJSzJqd0NpTk1Tc2tTRnZGR2g3SjNNL2VoRUUvWGJPMVZsMjN1NmhPbVJ6?=
 =?utf-8?B?cU9NNVdGdkQwb1JWZ0ErMmhvOFFCQ0RpL05ya0NISHJyYVluMDhObm51VC93?=
 =?utf-8?B?bm43UWZsb1dHZ3RsREtQenQ0TGFwM3JYUHlZZS9IQXNzbXpnUThUdFAwdEJt?=
 =?utf-8?B?bU9WaWpua0ZqYkNjZDI5dkwvLytSdUVGaXJtMnRsTHhuOWsvTUxOaGFCRTgx?=
 =?utf-8?B?TzEzQjRIY0Yva1JSOCtlMitwYUZ4eHRHR3Q5R0xybDhvRWRIZVpMRDM3V0g5?=
 =?utf-8?B?NjUwTUFTRThMUGRzT0VlNjZtMGZaUm1PQ3labFdYRWc2NVUycjQrR1Q0aGNh?=
 =?utf-8?B?VDdTc0VYNVd1dzVhMWxXWG4yNlNZeTBUTDVybTlLa1doUXdNZUNzK2puU25w?=
 =?utf-8?B?cjJCVXJjNWRVbGZTMlVMOTFKdFA0S2gwUWdyQ21URmFkbU5LR0VtNTEva3dW?=
 =?utf-8?B?ajRyQ0NCWmRXdUMyblI4TVBMdkNrSmtEcDMvWjUxeWdFelAvRUFYWWM0YXZ4?=
 =?utf-8?B?clUydEY1V1IvU2IrYW53Y1lwWEJSZ0RtUDc2SVlWcnd3R3FjbTN2OGxKZXI1?=
 =?utf-8?B?T3pVbFVucFUwUXZxNDg5eEpCMU9GcXJXRngzbHY4SGVCdktzaFZ5TGtmSFJY?=
 =?utf-8?B?dWcwSDNyak0vWlZYMm9keGtoWWFYc3JSNU92RnBqZHBPUkNRcGVFYVlhZ1No?=
 =?utf-8?B?U2lSUll5Skt6ZFNOcWZCQmdHVmJPUVE4TndEZXNHSDZ6RmdNOWkzOHNWNW9m?=
 =?utf-8?B?NWdPT25yd1VYRkhiaDNVOENXdWk3WTRYQ2laQ2lOMGhGZGl6YTJ3ZlZLbFVm?=
 =?utf-8?B?cEhMbUw3b2ZjU1RLT21nNFA0aTFFY1U1TkMyeFBVMzZpRjVpRVpMcE95RDFx?=
 =?utf-8?B?Q1NqdjRoYW1CNXBKbVJlazN3cmhmRnRCR0p3alJ6eDZ1UmNxY0JxMXY5d3ZB?=
 =?utf-8?B?WWZtLzMrejMva0xYdy9lWFBad2VnalRrakNqWGZXSUg4MDlmcjZiRjFLYjE0?=
 =?utf-8?B?KzlPOC9SRFpiRFIzWmdWaDFnMXlhNGQ3L2xVZlhXRit6V2UzV1cvV3M4R25H?=
 =?utf-8?B?WVBwbzVKOEdSZFppYUY2WjZDOTJrdTcyWjJqSGRRSm44V1RIUWZDdG91TTN0?=
 =?utf-8?B?dTJ6UzFMUlhzbDArYW5OMjJ0UjAyTVdEV29ycXpQR1p2ZzVvb0xHVHd5bHpu?=
 =?utf-8?B?ZXR0cXdwdWl4akF4ZWs3bGppSWh4RzdUdzM0eUQ0akZ6eVlkc09xMFZSQWNQ?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dd790c15-f589-4953-3f54-08dd5ccfccc5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:12.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2qyYy09Rei1OTFBMb76qtRcCx6xiYOsGF/3od2aRsf5pt/LeNyUBzhsfcXast7RRXJRPPbpCUDzUCOZKLjFMhWrlHe+pwS1GcT9osuh/cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add documentation for the Rockchip PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[revised description]
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
new file mode 100644
index 000000000000..d34c0974204f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,px30-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip PX30 Video Input Processor (VIP)
+
+maintainers:
+  - Mehdi Djait <mehdi.djait@linux.intel.com>
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip PX30 Video Input Processor (VIP) receives the data from a camera
+  sensor or CCIR656 encoder and transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,px30-vip
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: PCLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: AXI
+      - description: AHB
+      - description: PCLK IN
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: pclkin
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port on the parallel interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-capture@ff490000 {
+            compatible = "rockchip,px30-vip";
+            reg = <0x0 0xff490000 0x0 0x200>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+            clock-names = "aclk", "hclk", "pclk";
+            power-domains = <&power PX30_PD_VI>;
+            resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+            reset-names = "axi", "ahb", "pclkin";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    cif_in: endpoint {
+                        remote-endpoint = <&tw9900_out>;
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..bbfaf35d50c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20401,6 +20401,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
 F:	drivers/net/can/rockchip/
 
+ROCKCHIP CIF DRIVER
+M:	Mehdi Djait <mehdi.djait@linux.intel.com>
+M:	Michael Riesch <michael.riesch@wolfvision.net>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org

-- 
2.34.1


