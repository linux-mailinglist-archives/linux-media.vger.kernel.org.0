Return-Path: <linux-media+bounces-27765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3CA551E9
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2A85167775
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C86259C9F;
	Thu,  6 Mar 2025 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="TD9IlJVT"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023113.outbound.protection.outlook.com [52.101.67.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA213635B;
	Thu,  6 Mar 2025 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280179; cv=fail; b=l6y3Nc8Of3YV33kqo+d5FqG1Jsjy0pasD4wpsBvaTMDHiAZKRyhstgfiqSxd6KCGxiocc0OAGNalvzgYCnGGgF850gZpQMh0jQn7hUTyoQTyHKCtwUKCZznNGLhb1i3/m/0lAmYSCJzHIgjg4fpfyNSl7nxwMuMbu+D4UZut/6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280179; c=relaxed/simple;
	bh=V4D6nXIHCBs/k7eX1Ftoj9Jioi3wFWXbO/uv1qQbFNA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fhP6f/9N3BYY9SJtgf176u69IKm4/Sb0gZAqEhBQMZpU+3nWnX/BZ+hKVZZAKvPqj71IfmWYE2ZWfC61qSMMbY2Rs4OePEx1TBcTPrelFg/m4fy3aX3iOCt3hfIJqF6GlHjuWeXUbhfrzlfiBmm7qXfVyiMmnrJOtjzT+aMRyBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=TD9IlJVT; arc=fail smtp.client-ip=52.101.67.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ff/fhkPYXNrSWggNbrncMlQ5skgFtH9/bn7avdkMUgi+Dl2XDQ78I2LKpcRavAuApvG3xzk5q6J+8fr6Ahx++uFqMepHG4+xTlkiLHlkcuJ7MP27ExNTdXA9EAjBiyZQKVhC1NLJgUzdxlL5vtsktXTNS+C3C5uZo4mSi4yuQegnKpSY+Ypbg3I+lp8fpWxX5juy6IFIn4YPOR2paQ2AsbY1H9RGLtcWF6SQKMCX+7R89moli8j+euzg9q1QtN43yHtsMl9q1o/zyIZ5sfXnN+n97sAhNvlI1spp6xVy1GA3B6XRwyHPwL0Ge6C/hQii6RWS1pt0F3ZAFK6LdabuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Q7nLh95fsaUfNfoR33BQwBUkVeuzVFZbKtN0YFgKSI=;
 b=LZpDvHtR1ViRzhYePu0PiW8wDoogQvL+arHzf/syzSw4sqVyRx8iPa3qJ/sKQ6RRwEEyzOHGYfkM+YGHurG3TcwlYZiSOffTGTzUhYVLqn+atmOL4wFDugLW0a417u53rC+uRUam5DlzgiSClhn+/ETEpfvItNd/N876pEUPmoqJtia6yA0Fishf3rXF29uIbjCYU5fhfDW2UgdVoILSxVzj0d9PrLjJv2bNG1wyyzgtbhG/O25MJHvaZ/Hm6LdU33Gc1FjQELvZkerU9N5CoFR0rszrkMhD3YWTqvTO0pK2iYma+9575F1mskkRc5XCDzxdtBMKkgcIIZe11NMSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q7nLh95fsaUfNfoR33BQwBUkVeuzVFZbKtN0YFgKSI=;
 b=TD9IlJVTwOiP+jDtUqM8XpPK9TftByv/Ak7Gpg+34qWjru4QwAE9td2ihDeuklDRgxbypOeDMo+aQUukJzfoIx3UwMqIiAsuaZYw7twk9zBGLcn13BqAasQ5vlPdXkeAdRZ056ZGyjFwKCOaa//aF74pzAXIOXHI11QC9D888po=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:09 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:09 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v5 00/11] media: rockchip: add a driver for the rockchip
 camera interface
Date: Thu, 06 Mar 2025 17:56:01 +0100
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKLTyWcC/4XPzU7DMAwH8FeZcsbI+STZifdAOySpQyOgrdIqA
 019d9IhEBKrOP5t+Wf7wmYqmWZ2PFxYoZrnPA4t6LsDi70fngly1zITKBQKgVANWFjGKUcoL1I
 bCzVHP0FwQSbnhE5KsTYd/EwQih9iv82/Ud9lqFxuvalQyu/XrU+nlvs8L2P5uB5R+Vb9f1/lg
 CCMRc+TNwrD43l8TV8P3A+0sA2u4gfjgj/sY6JhgXfK2hQjdvImJr8xjQLNPiYbZlzHE3eko8K
 bmPqFcbePqYaRQ2MQPcnwF1vX9RPs0QXyxgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=7918;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=V4D6nXIHCBs/k7eX1Ftoj9Jioi3wFWXbO/uv1qQbFNA=;
 b=QXBWSbV12RNW3RC9vJO0EGlj0CHzjZFvFbTpvArwhD5QQdx53+R2JoPpQGrrzTtgFdykhJAxP
 eqFaHvo7PsOAFvyATBwsSXTdM7Yb9n77YkIPkGMoXDzK7r1p0iCtRZs
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
X-MS-Office365-Filtering-Correlation-Id: 5a9aa9ba-6fd2-4018-708a-08dd5ccfcad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVJHVFdEMDBrckMrWnJXU29oODU4Wjd6bnNwMTVQaU5VQVVMT0ZMZm9TN1hp?=
 =?utf-8?B?c215aFF3enhMU05yVSt6VWpYWkZ6Y0ZkQkd4cG5Kd1hkaU9HRTNsblBWbm9l?=
 =?utf-8?B?TmxNUmF3bno1MlZUbUxNajlSNzNHaW1YUE5xUGMxNURRUmozNEl2aGtCK0Fj?=
 =?utf-8?B?QjlYYWVZeVhXSjArVUFMYklKSG5uTWJoNFk3Z2lPTVB4RkovYm0rTWFseGkw?=
 =?utf-8?B?Z2VkUm4reHlZaEtLR1hIL0g0RnpTaGtCQkRmaTA0aWNoSnVkdmFnZDVHZTNa?=
 =?utf-8?B?Nk5pMWdXdHBWOEkwRlQ5V1VvVERsams0bk9rS0dOK25PN2s4UTJ1NUNVcFFn?=
 =?utf-8?B?a0MrOFhWdkswanprcGFBZ25sK1oybEFqZVdPODhVcW5XWUVLeWxZMkQ1aGpJ?=
 =?utf-8?B?TFRtYVdvVFgxcVcrckQycFlnSm5CMGsvMS9kM0ZGNjk5dUppb1VoVm02aEk0?=
 =?utf-8?B?NGlJL3Jkdm15ZGJ4ams4SGIvcVFTQ1JUTGZ4WXdsai9GUGFFYVFnT0kvQ3Yx?=
 =?utf-8?B?VE5GTEVmYjJ0QUhmYnZjUmZyOVhKZTZTbG8zWVkrNEcvUUI2THNVK01FcEVY?=
 =?utf-8?B?eWYwcGhzMUFNdHVQa0pBOXJmb2pIdG5LbDlBb1NodmhUL1JJdE5KdktUTEpK?=
 =?utf-8?B?eVlocDhKZC9pT2paeTlEd2EybDE2MXdLZGd1TjNzMVZtQTRoYzQvQlNIZ3V0?=
 =?utf-8?B?dEEyN1VMbHUrdzRvMFJpMmFlY1EzbkN6UmlSVjRqY0tsOUZ5NXVtSUFUcEZ5?=
 =?utf-8?B?blFYcFJ6Q2tWV2ZHYTBGTkNzUW1DY2wzRXljSXl2S2M1cmlZRU45Y0w3anZ3?=
 =?utf-8?B?OUJPTURZdkc3UVNHWklXemNLbXc4MzhhaUlLWDdXWFN1T1JzV1VKUGNONm5V?=
 =?utf-8?B?V3NLRytGV1AvYmkxWlFZalB2ZXQwdzZXSHMvV2piU2o5NTJsNFIyQnJlOVdw?=
 =?utf-8?B?a05sY2F6SjNkMTFOMnhkclZDRldXSWV5YjhHNTJzVTVRYkdMNmNBRmtTMStq?=
 =?utf-8?B?Wko5cVJvYW9ReDF0SGU4T1JYV08xTzFFTzUrc0lUKzVKdmVQbGtjZGIxckV1?=
 =?utf-8?B?VmNONVVqcHRkOS9YYnlhR05EbVlZV1R0TFZCZ1FMVjE1M0RvRndiQmFaOUMy?=
 =?utf-8?B?ZWZ2RVp0U0xDWWlaOTVyUFdJemU4MGRZZWUrMFFYWHNvVUVSVnY3eHRMdm1o?=
 =?utf-8?B?ajQwcXR6SmhTOHozUWMyaEV1bHY5RlBhQVI1bjExeHVPeDRCdjhWMmY4MlhO?=
 =?utf-8?B?RUhCSzRvQjRGVFdRTTJtaWpjUkxiS2N2d1V3cnNMcmt6azI3RFpMaFlyTWVo?=
 =?utf-8?B?ZG5jSnZYZmlhRjRoK1JsRE9lRHpRcWdCWGlKSGpkNURCWjNweGlsT2lwUWFw?=
 =?utf-8?B?SzBkUHdKYUlRYXB2MGdraTJkTjZiOTFZTFdzN0d6K3hwS0E3STZDSXAxeU1O?=
 =?utf-8?B?TjBxRlE1SmwrZWVZQ1dxZlZaSzNWU1BkcDZrR3RGV2lwQk5INUhrdEQ1UVlE?=
 =?utf-8?B?OVB4bzhNQXZ1MG5KQTBOcTBCaS9SOXI0WmNWd1BrWEtIS0NJWTNIeVV3cWpZ?=
 =?utf-8?B?RTJ6SVAxZ25taU1mTnZyek9XQVhFN1drZi9ON3hVQk1jTUU2NklwNW15ekFl?=
 =?utf-8?B?T0VVeXpRQ3BBOG1PRU5JRGEvS2xQVnlwQ2JDK05vUThSaU56VmNvUSttbGNB?=
 =?utf-8?B?U3htQ1dDR0hJc1hJMkozZzhObk1kMzgxRDdCVUR5aGU1eVpnSXdCczUvMTlX?=
 =?utf-8?B?UGZjdGVoRVozUUtKVFI5MnBPRndPaitUYzN6em9XaEM3ajh1dWJBVUFvMXJF?=
 =?utf-8?B?enQ4bkRRSzk5QWFVdmU0eS91RTZnQml2bUNxNzlodWxoZTRweUxFdHppeE9O?=
 =?utf-8?B?Qmo0OXB5TE5EdUxQR3lUeXRCUHdaWWZhampSdnVkalFIYWw3dkR5QlhLclNx?=
 =?utf-8?B?N0tHcklpdE5Hb04xL1p0UkZFVzQ4T1R6QW1CY3EzdTliLzZRelR0d3BNU1dU?=
 =?utf-8?B?czVpbFArNENRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHhaMGVWRVQ0ajdrWUxOeXVIcVFOaElMbDVzMzU4K1I5dldhbmhZR0FvdWlr?=
 =?utf-8?B?dy9ybDNmeVhrNDNiYjJ6SDE3OHZRbGhwZFI0cVdVYSsvckhIaEFqekk4WXhY?=
 =?utf-8?B?N0lISmY2UERtU1c5ZDhRWXJZZEwvR05KVE1uYzU2QnVlY0dwalNzU3hncFdG?=
 =?utf-8?B?ZlRyMThKT0dqUklOL29keXFGOCs3WmpSRHZIY0g1c2NabVh0dWo4aCtieDNP?=
 =?utf-8?B?MGpmRU5jL2V4SWZZL0dwS3E2RjVNbkhNcHpMZWpkM1hsU1FhL2twNlFFTzl3?=
 =?utf-8?B?Mi83MGJsa2luL3hIUzZTZS9zMm50a2h4YXF2aGdWZmtPQVBVekptaFU5cVNz?=
 =?utf-8?B?QnVIUTV2R0N1b0Q3S0RBYzFmMVpJbnh0UkZWYVFONnpXb2szSUVsN2RUSDVG?=
 =?utf-8?B?bDRMdGZqcDBTNkhLdncwY3d0MHhvME1EV01PTDVGRGxGcTZpYnpyZ05GclMr?=
 =?utf-8?B?WG9pVzVlNEhSMURERGx6QjJSQnJ3QWdkZll5T3lGdU9OY2Z4VFFBQ0FxRk11?=
 =?utf-8?B?SXVMeHdzUW5OclVYK0UwOVFvODhSTmhBOHgvTlBRU2JmdTFYM3VnWkF1ZWpC?=
 =?utf-8?B?dmxOOEZkRWROMytCZ1hiWW9pMFdXVzZMRnNDbFRBcTJqRXhqSENQYUpYUGI2?=
 =?utf-8?B?aCsrOGFLN2JXM0Q4V0ZhVlVWRk9VNHRrV1ZJQ0JUd2FPUG80MHVwc2UvdEUw?=
 =?utf-8?B?UDg1MEtMNzZ3Q1pNNjV5KzkvZDl3b1N4c1BBUUw0SFRnUzh4Qk53YytmSTZB?=
 =?utf-8?B?SmplRldBZE9JaVJMeWVLZm5OQnNsZVlqZHlYbWoxelZBMzB0dTZPK3JFMGlY?=
 =?utf-8?B?QzYrcHVzakFZOUk5clRHMUVaaktnQmlGdXBLckpuWGNXKy9WM0FDVm1HSzB2?=
 =?utf-8?B?L0RqbTFoSDRDbmdpTktrME9PakNLTTdiMTIvUWpuY0Z0YU9tNlhKT0V2eDRm?=
 =?utf-8?B?Unl2dDRzc05FSXVpSWxZUERYS3RxSnpIYzlZaFcyWEtBdklKVXZzL0RsK3Nl?=
 =?utf-8?B?NWFicUFEZmsxVW9ZRVVIcG5CVXJ0K1RDbmxYQUNhNWZDU0pmNWxieE16RG1L?=
 =?utf-8?B?MXdqYW9FTmpGLzN6aGhSNG5TNzBBa05BTTErTlpCeEJwVkg3R3VITThVR0Ix?=
 =?utf-8?B?NUw3ZG0waVd3U2VEYWJLTVkwRWkrdnVBb1FKQXphNWg1L2dudVhSUHd0U28z?=
 =?utf-8?B?Z1VZZGVLM2RpQ2crdllUYlhCN0Y5SmJNaUNlNzVsaTZoLzBNVE1VU2hLeXps?=
 =?utf-8?B?dWtkLzlzMmQraXRXRmtoMy9rSmZTWDQ4VUZJdkEwSlY1K28wU0ZuQU5raVJh?=
 =?utf-8?B?Q0lwSHdNeUYrNTZ0ZWZRb1JkV1J1bzJSSHJrQ3JrSHcwL3lnS244MHpjcXd2?=
 =?utf-8?B?QlMvL1o4MCtKTU0zTFE5ZUVpL2pLL2N2N1ZZV3RVdWRJd2JaK25ITlN2bDJU?=
 =?utf-8?B?WU1jSnlWUWlFbHUyM0MyeElPZmhEdWtacUpqTmJPb0svRmF0SGZPVTJZeW8v?=
 =?utf-8?B?ZGhQWmpjajh5RzJ6TnE3RHFCeTZNSTVGYnhuZDVUY0RkSFc1NnpUdmlNV3R4?=
 =?utf-8?B?dTFzMkpzamlLdXhEZTNOZWhMVEdOcnlpclBwVnkraVd4Z0Qybm9hMjJnZ3Rl?=
 =?utf-8?B?M3BxSHRxd20zYUh5UldUQ1ZqRDBUSG1DcW9kQlluUldMRTZHR21LY2hnYjNw?=
 =?utf-8?B?MngrUS9Id0dEdVNJV3pzYVVQYXlhY3FQZHBBT1dZRTN1MStKd2VsbFg3UGFQ?=
 =?utf-8?B?SGpUc3UxOGU2ZnZWOEhrUk5iMnVaejNORXppcnRNaVVvTUpsYUlNc0xIdk5w?=
 =?utf-8?B?dytJcEVNN1k2U01vdFcxTCtxbndxRjRJSjk4OEpjOUQzNEdVKzJpVFFGNGJy?=
 =?utf-8?B?L3o2bTQxSG8wTk5DSkYzUzdZWHlhdmMrbWt2dHJqODVsR2YvLzVuTmRuUHk1?=
 =?utf-8?B?MWt3bnFSRnIvR2FSSDVBbUY0TnJsK082WkhNRFFlZEd4eFo5aTBxdm1yNXgy?=
 =?utf-8?B?SU9hWG9RNVI5cTJOemw2WUVEdndsSUN6aTE0Wk85bkppSnZocWY1aVppNm5E?=
 =?utf-8?B?U2ZGR2xrZnNqeG85MWcyei9NaVBqUUJZTXdXSWNpY0VhaENSZWdCUno1aE9K?=
 =?utf-8?B?RW9GeHV3RWI1U1poL0N1cFFWMklIYlFCRlVkY3NZTi8rVXc0TkdzdzZaVDBI?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9aa9ba-6fd2-4018-708a-08dd5ccfcad6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:08.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkfzQZPVWE3Iudt1r9xtJDIR3osj4vIltMfHPkj7w4BG3XtdHi8yLTnzIGDdxjcuFhoamrEq3DpiI8xIefnieFe5xUxqatrXz94+TMiEnJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

Habidere,

This series introduces support for the Rockchip Camera Interface (CIF),
which is featured in many Rockchip SoCs in different variations.
For example, the PX30 Video Input Processor (VIP) is able to receive
video data via the Digital Video Port (DVP, a parallel data interface)
and transfer it into system memory using a double-buffering mechanism
called ping-pong mode.
The RK3568 Video Capture (VICAP) unit, on the other hand, features a
DVP and a MIPI CSI-2 receiver that can receive video data independently
(both using the ping-pong scheme).
The different variants may have additional features, such as scaling
and/or cropping.
Finally, the RK3588 VICAP unit constitutes an essential piece of the
camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
units, and a data path multiplexer (to scaler units, to ISP, ...).

The v5 of the series adds a media controller centric V4L2 driver for
the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP DVP
 - support for the RK3568 VICAP MIPI CSI-2 receiver
 - abstraction for the ping-pong scheme to allow for future extensions
 - abstraction for the INTERFACE and CROP parts to allow for future
   extensions
 - initial support for different virtual channels (not tested, though,
   due to the lack of HW)

The patches are functional and have been tested successfully on a
custom RK3568 board including the ITE Tech. IT6801 HDMI receiver and
the Sony IMX415 image sensor as subdevices attached to the DVP and the
MIPI CSI-2 receiver, respectively.
The IT6801 driver still needs some loving care but shall be submitted
as well at some point.

Please note that the MIPI CSI-2 receiver requires a patch w.r.t. critical
clocks [0].

However, several features are not yet addressed, such as
 - support for the RK3588 variant (-> next item on my TODO)
 - support for the scaling unit in the PX30 (-> cannot do due to the
   lack of HW)
 - support for the interface to the Rockchip ISP in the RK3568
   (apparently, data receive via VICAP DVP and the VICAP MIPI CSI-2
   receiver can be processed by the RK3568 ISP)
 - support for the MUX/SCALE/TOISP block in the RK3588 VICAP (which
   provides the base for image processing on the RK3588)

Looking forward to your comments!

[0] https://lore.kernel.org/linux-rockchip/20250210-rk3568-hclk-vi-v1-1-9ade2626f638@wolfvision.net/

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
To: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Changes in v5:
- fixed issues raised by media-ci
- fixed dt bindings (comments by Rob and Sakari)
- fixed probe on system with no DVP in DT (comment by Alexander)
- fixed error path in register offset calculation
- split off MIPI CSI host driver into separate module (comment
  by Mehdi)
- added MODULE_DEVICE_TABLE() for both drivers (comment by Mehdi)
- Link to v4: https://lore.kernel.org/r/20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net

Changes in v4:
- added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
- fixed asserts on stream stop
- fixed register address lookup
- fixed link validiation callback
- fixed issues raised by Rob's bot, kernel test robot, and media-ci
- Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net

Changes in v3:
- renamed the driver "cif" -> "rkcif"
- rebased onto v6.14-rc1
- abstracted the generic INTERFACE+CROP part
- addressed comments by Rob and Sakari
- added V4L2 MPLANE formats to DVP
- added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
- fixed formatting issues raised by media-ci bot
- Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net

Changes in v2:
- merged with Mehdi's v13
- refactored the complete driver towards a media controller centric driver
- abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
- switched to MPLANE API
- added support for notifications
- Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net

---
Mehdi Djait (2):
      media: dt-bindings: media: add bindings for rockchip px30 vip
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (9):
      media: dt-bindings: media: video-interfaces: add defines for sampling modes
      media: dt-bindings: media: add bindings for rockchip rk3568 vicap
      media: dt-bindings: media: add bindings for rockchip mipi csi host
      media: rockchip: add a driver for the rockchip camera interface
      media: rockchip: rkcif: add driver for mipi csi-2 host
      media: rockchip: rkcif: add support for mipi csi-2 receiver
      arm64: dts: rockchip: add vicap node to rk356x
      arm64: dts: rockchip: add mipi csi host node to rk356x
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 114 +++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 ++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  75 ++
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/rkcif/Kconfig      |  15 +
 drivers/media/platform/rockchip/rkcif/Makefile     |  10 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 858 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 722 +++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   | 236 ++++++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 308 ++++++++
 .../platform/rockchip/rkcif/rkcif-interface.c      | 421 ++++++++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
 .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 ++++++++++++++++++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 154 ++++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 622 +++++++++++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 24 files changed, 4713 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20240220-v6-8-topic-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>


