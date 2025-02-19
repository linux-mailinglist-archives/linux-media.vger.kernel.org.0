Return-Path: <linux-media+bounces-26348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A354A3BB69
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3169C16EB2D
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F6B1E102A;
	Wed, 19 Feb 2025 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="bERxaRUz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BE1DFE23;
	Wed, 19 Feb 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960217; cv=fail; b=Tul6CVkBgaXxDaAIYQ4cotG/T7alnn8B0tOkee9oPI1WQhg9O3XuBT95Pt9TLia9h82N7saN8IZ8B4QK7h/D983VoI4xB5A9jfeNrivHQBAu67th3BsLN9f4aMX/Vz8rtW0Wy/z34ar8dXUadEawdPpDJHOZUK3KPqwg+6QxSaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960217; c=relaxed/simple;
	bh=bghLJodqati1K+aBvA7Aj+FG17Kj9elUhImEnrgm7jo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V+yjx6dHOVRqsTfxoX2/EJTgUpKrdF94y78CSR+hufYDkwcBtHj5aBu6vZbmIm6+2o90OjD8ebA3w78XKUDzbsyzZcFvtRj7WGbGHhpJGLwxcXM1p4AyOSj/PIfOBFjITtdcSwxypqR8Kx4B+Oh4W2VMTGlZG7J29chAIwWMQpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=bERxaRUz; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHHgdESb2uRsVB2R6MP+XeZ3ATVj7cqxxp1R+pROJeMfhB4b608Jl4tox4IsNYuP52gt0K5rDVe7/UarooW3IuX7IoW4oOZ/TQdtXeicEaSeI8e+W5wtwfa9+oMvojFUcK6BIAosEwlYE/18NQ7YZOaWZAQRFVEgznpFDMCx8zt1zXjYfpX3ii1EDYYG4HS+pgxFj4PGcx6QbYc0QDA8G/vwLFxYC8ca+BHaZihaeDKhu/jFD3kEW5SkcwMcgWmQHOGZ2K8RYK9iwJDelnQC0SWyHSOdqazvW7Jnes0MOQrGLevTpA0sBiJDi7FL3tHHfeM5PRGbF0wL0bKwNmRSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QailLYjyDYPffyoSP99sd7pP5p4Eq4dzoUNPP+G4IaQ=;
 b=s4q5QlZIVHF/vN5z6voGHH3rMXpJjO1JgUVxO/TUH25liu18ih96/EWpJp+BSki5oFrQns9wmUnUmYfEnEQDMDnQQwcJsKJ8oG1oZbuGMNUpr1wStPDUo4ThVnGdcDLqe0HBhSVSwf3XM42Y/7lbFUod/98Ql/Mai5Y3jJlJDrtjwyB1XhcJc9oP96h80hnZJ6yrmU/1KuIecgepQtNPqOMUHUIGdOrQbXN0OTP2xIWpMNSNv/OPxQ1vmXIXorwATQ9U+ZzvZVVeFMTW9dJCoXPyYBw5Pe06PD5eLUFPPgk/VtdajvHQWyDLf2aADtVMm85UO+cfmTg1rz6GzglCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QailLYjyDYPffyoSP99sd7pP5p4Eq4dzoUNPP+G4IaQ=;
 b=bERxaRUz2B7+Xn9J0U9PnBpTXQoBL3hcqNLDOdX8jCKfgrOPLm6ZRwubWuYYIlH/9Ml/5gTYIxYOha3illu4Nw6lPWZJg5dr5K76VhhBKbogAkK33uyzEI0oE17f8fhMEPIcr6Qmm7/CuysZ0hwe9ah/umfhFJ7yP2zLUOT4460=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:46 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:46 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:35 +0100
Subject: [PATCH v4 04/11] media: dt-bindings: media: add bindings for
 rockchip mipi csi host
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-4-e906600ae3b0@wolfvision.net>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=4104;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=bghLJodqati1K+aBvA7Aj+FG17Kj9elUhImEnrgm7jo=;
 b=rDeUqv3SHPBlLzQnqmdLxw6quZHyHVCXurtSQwNUlwrrYBjlRg286nxLCPm5FfarK51rHfG2v
 /so5xd7K4SPCw9YSc3T9ISOCiv5UZQySeSaJIEdqa5oRUa6vioQi4xX
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cf58e9-787a-4542-19fc-08dd50ce83d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUNpNHVGOHY1dWM1andLbSs2WThKZmtaVkJFdDdMMUF2WVFJUkdrWG5JbjJ2?=
 =?utf-8?B?dEdxWlVwTkY1NFVVYW13TWU4RkpYb2hMeFNweDJlUGdGQXAvNDZ1Y3RVQndx?=
 =?utf-8?B?RGM5bkJjVXNhUnZMVk1sNDgvTURRTVRYakhBaW5aTEVEdnV2Q1hjNVBQOFlj?=
 =?utf-8?B?REx4UGJyekEyWWpNcE5ZUUkzbnBVM1dWK2NKZWRFNXVhU2dwbGtZREx5SFNw?=
 =?utf-8?B?M29kRWg1VEFQeUFnMzJpZFRmRXcxM1ZPR3VmYzBjQWZLeWFPeDB0Rmd4SzVT?=
 =?utf-8?B?S2RoSHN6QlQwaGVoaVBNWGFyWitlc1VxV0RUZXFsdUtkTVhxaVZFUWN2b29E?=
 =?utf-8?B?Q3B5RnhYaW5VS2RJU3p6OC9JTXh2dHBYTHluU21VMXVDamlzY2taUTlLNWNQ?=
 =?utf-8?B?bkdveWFxOGVCS29FSEQ4aXgwazZHWDJoUVhndVAzRUNwMWlROGUvZFNKWVdG?=
 =?utf-8?B?dWNGWjE4YjFGaEZpUk9XVVNJT2ZsYVltZjFra0RYOERxVWpsWTFhajVCYXFa?=
 =?utf-8?B?cGE1ek92U05wZGpCbllvV3E1eS82TmxJbnhwMHQ2WCtWSDUrN3dKMi9rckg1?=
 =?utf-8?B?aUt3eklTV0ZRRllnTnJrSmFkdUJBSFM2NzNuOWJZVTZZWFR0dy8yQ3BEL1dR?=
 =?utf-8?B?bFdHWUNPTDd2dFkrVC9WeUdKY3J0Q08yVnlRWTZJa1dNTjdTRCt1NTlsTHI0?=
 =?utf-8?B?bUNWMThWTWhFN29kTkRvbWdUNGxLelB5aFVrUlBTWWFYUHkxWm12QkplRkZY?=
 =?utf-8?B?WXRaL2pjSkU2VUx5NEZUQjdPNkZtMTlJeFIrYWZkMVB6ZFVnczFqZnJUZHlo?=
 =?utf-8?B?bG90a3l1UHpobW9JVndOeU5XN3A3clpQdGl0Z2QzNjV4SWhXNktBQVJxUlhk?=
 =?utf-8?B?WE92OUU1eEsxS1lnaEh4UFU0LzZVdGJXOTFCZHVCR1Q2ZUQ1MmxJUjN0dEFk?=
 =?utf-8?B?TGpUVVluNHlpN2ZaYlVUejNJWmRjYjhwMmNPbTZwMWMrVnNxL0VBQzR3UW9r?=
 =?utf-8?B?ZFVuQ05TQXNhNjZ6cW9MYkljaGxtZ0VaZktmTFFJVGU4NkE1TVJGdHgzM0Zs?=
 =?utf-8?B?UVRBUzhQQ3B0UE5QR3JvUzg2elRVY0t6eW16U0xqajZOOUptZy8vOXRTQlRz?=
 =?utf-8?B?Ty8xTzhqeHRYM3BNSDZIWlNaU2E5NTN6WERXZ1Rkd3B3Ly84cjhiRlcySmMy?=
 =?utf-8?B?Nk5tOU5PNGJzcmhtd2VXOWNYQWVXU2kxNkc5My9GT3NmODQvalRMbnVqL0VI?=
 =?utf-8?B?WGpweXErUFBSRU91SnJoQ0lLUlBBeEFsYXlISGJUbmIvOUJKUmtIMytJc2JB?=
 =?utf-8?B?YkV3NmIvWXhtbXErbGRZUmQza3Uzc2k0R1RpL0lHRkVqcWkreXpBczhTeFZG?=
 =?utf-8?B?UytiSFpGTjRobldwKytBZjVsMzk2S2dlUkQreWVqU2RDZjhsM2xsb3BHU21v?=
 =?utf-8?B?MkZRQmIyUTRRYU1KVjBsYVZtZk1IV01PV1pkbzZDWFViQTFJZzc3SlRjUmw2?=
 =?utf-8?B?Y2Z5OHBjOW41MXZaeXpTMDZYbjhyRGNRUEVKSUU5eUtESEJjemY5bDhHcmdk?=
 =?utf-8?B?Vk9DRHBOQ1U4U3dxYW5KS2g0ejcvWE1aYnUySDdNaXhoMHpBSzdyaFZUZEJx?=
 =?utf-8?B?M1ZZaldZNHIxVWdLVkZ4SjNRSzc2c1N6djR5ZmhieTdZOE5ZU2pzRHVzTVRL?=
 =?utf-8?B?OExWa2IwcXc3aHY2T0JMcG1ac3JVODZWaWRkMVAvRmZ6NENLTkdxd3k5c2Zh?=
 =?utf-8?B?SlZHdUg0U3ZxaDNhdlJ0ZVR0dXNHL1hIL0tFbVQ0VjJ6aWpvRVVlWnBrd0Ew?=
 =?utf-8?B?M3UvWmoxN0d4WlVMTndhd2Zaa1UyaWdPQW9zeE9FSyswYnJHSlpBRk9BbXRJ?=
 =?utf-8?B?UjlQd3R2eVZvZlFmWFhrVG5Jd2hOS3RxbHhIWjBBSW13VFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDJocUdTNmtsWEd6NCtyS3N1NGRyQU1TSW80N3NGYmJzYy9jL0VOa2hxSjR2?=
 =?utf-8?B?YytiVzd0aS9NbGJmeTVYNmdGZmZISDhoYU1uaEsrRmtXdTNWbzJpMG1PS3F6?=
 =?utf-8?B?QjZoelhSVnMvUUVkdWw2cXp1cjdOQjIrRkdja25HM1M4VEo4Q0dTMW5FZ1F2?=
 =?utf-8?B?Q2JjcHZXNjR0OGp6MzZlS0RKVHdRQUMrdFA2bVZYdUFlcGliMmtpTmhXQlJM?=
 =?utf-8?B?MHhJekdzb2JjZlVWNThva0hmQ2tuNkk2R2hTaW1CTTl0eWJvWjUwSEdodVUz?=
 =?utf-8?B?OE1DNHpIUkpGMU80amhkNU8xQTNqWWQra2o2bXFPUU1TZDdCT1pvYU55bkRP?=
 =?utf-8?B?NEtXaFc0cFdSa3ZzU3ZMSjhBb3EwbUJscUhCb3ltT08weTdiWVBVRUQ2R08y?=
 =?utf-8?B?YUwvam5qN2h0TTFOcjZveisyWWpVU3NFNE1IRE95NlRKRUk1dzVoenQ4OGQy?=
 =?utf-8?B?bmpBeDhFejNhUUVad28vakJITmFsalVkN0lER0Q3am9ZR2NrSWRwWkZkRXZK?=
 =?utf-8?B?SlViYVFMZGZZTHZ6N1BxMGFTTGFqSlpDYzRNRVM3MGwwWUo3Q0J3MElhWTcx?=
 =?utf-8?B?NTBzUlNmRWMzRjZ0YnRGRjZ0dXdHRngwYzM2bGxXSEFiSkQrTjhRTGJRTEt6?=
 =?utf-8?B?Z2IvQlVXT1A1ZDBvWkhYRUpZOHpoNCtoSGN0eDdISG5nNURuSVdSNlVtNUVY?=
 =?utf-8?B?N1l3THhLL1BOZEhtS2o3SGp4cVZyWk9DTENQZFBDdnQyaWdDcndiNSszUm5j?=
 =?utf-8?B?UitPSnRMenBDMkhGQ0pxUG51TjR5R0pDdjZDSWtSYmVWYUFNUmFhRTJWNUU3?=
 =?utf-8?B?TkhYZzQveVpVN3RoQmc5NGxBTWczTFg5Z0FhcS91NGZFaVU5RWg0TE9tVW5n?=
 =?utf-8?B?ckxnb1phd2trL3N5cy9rcmdGKzdLcHlsQ0ZaNk5WV3dnNWN0Nk5HY01FSEFG?=
 =?utf-8?B?dHhXaEREODNzVHJCcEJLbVQ3S0FabUFmcEgyRExWNlZRMDBnSlp0U2VwOUdH?=
 =?utf-8?B?dXV3dWliVmM5S09XMEVFekxpaUZockRpd1NQL3BPV3dxOXdQMUJsUnBiTDlZ?=
 =?utf-8?B?SERYSzBEbEQxU1N2MC9PUTdZT2svdzhKdHhZT1oxL2RBVHBDVDdqbzJDS0xE?=
 =?utf-8?B?MFBFdy9tVUlzYXpjaWVqVERBYVBCN1dHV2QrbGtpTlhWaEoyMGpSQm1wanF4?=
 =?utf-8?B?SXJGVW9laE1QRjBoMHJqazVuWU9FSVFVZGxoajZ2ZXBkaEcvQUY2cjdyWXc5?=
 =?utf-8?B?c3pBOEt0UVNibDN1eEthRXQyWE5BZXNiaDNFYlRMRkpPakhSemFFZUNuMjhV?=
 =?utf-8?B?KzVzV2RsZVpyUDE0WVNjVUtkcjFKZHBQNkJLVCtJQjA3OElicEd0L2lqSDJQ?=
 =?utf-8?B?SXJ3RnFKaVVzcVlkQ3VTaHZadXhGTmdlRlFzV3RSdzIxZmppYTBhcldaM1Zy?=
 =?utf-8?B?RXN2NUhxanJmZEcweWtKRFk4TWN3c3NpZkQrSEFvb29TMDlES0c0L0F6UWt6?=
 =?utf-8?B?OHN0OFRZMkp5N091b2c0YUh5MXlGTzFQL3NkK1JLTFpHK1hPc1dTdWxtaU0z?=
 =?utf-8?B?M1JSbHFneTdyUnlGdTY3TndBYmtYbUpFUDVnYVg1S3RUWW4xUW43aU50dlVo?=
 =?utf-8?B?WVpCMnFXZEFtWStiRGZLWDA1VjAyTkhmTGlncEFwKzEwMzFhcFRBRmxNQ1NS?=
 =?utf-8?B?ZHU5b2hicTI4SjhIMmxKdGVibS9KRVBYOENLWFBUcjhxSWV1TERmdmJJL2dT?=
 =?utf-8?B?MEdWWndZYmZtUkJwcVB4M2dIMyt2ejB4ZkozUEJVS0E3c3ZJS2lwUWR6MWtp?=
 =?utf-8?B?aDhBREVUb0lYcEhSSFVMaVRjSDlVVzV1cGJoR2wvWTZHRFROQnZaZ0UwZUZC?=
 =?utf-8?B?RzNJTitiOVJGcm1EYXorOTY4SWZtRkp0L2k4QlVkYXhDdWN0T2dHaWdLNFR5?=
 =?utf-8?B?aUhXNk5OL0xvVmFHWnlzdFdyclhzd1JXZFc4cEU1MnFQN3ZoazM3L1kvT2Vv?=
 =?utf-8?B?SUJXdy9mNlBLRk5xbTFxWDdBSm54LzVjTTJMeU5Wb29BTldLUlh6ZDd5dGM2?=
 =?utf-8?B?c3g2ZU5pdnNJZVB4bWJtVjVwU2djWEc2OWt6NWFHYUN3YmgwSVZhbDZFVHRQ?=
 =?utf-8?B?cDltTGFvL1ZRanlkeVh5MHFrNjVzWTdWWHVKaEVBZHNoMG0yb2JaUkprUUVy?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cf58e9-787a-4542-19fc-08dd50ce83d4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:46.3116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0giWUId/BDOJU/QFG18Ky2H107w+89GaC/RL7Dpr72Rx/70yffVVNFUelhZNDQQPQlDM5m73tyAbl6frnjtkfDtDAk+dSdVmB8TR3kH2DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138

Add documentation for the Rockchip RK3568 MIPI CSI-2 Host unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 123 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..288941686e96
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 MIPI CSI-2 Host
+
+maintainers:
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
+  and one output port. It receives the data with the help of an external
+  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
+  (VICAP) block.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-mipi-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: MIPI C-PHY or D-PHY.
+
+  phy-names:
+    items:
+      - const: csiphy
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [1, 4]
+
+            required:
+              - bus-type
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node. Connect to RK3568 VICAP MIPI CSI-2 port.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - phys
+  - phy-names
+  - ports
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@fdfb0000 {
+            compatible = "rockchip,rk3568-mipi-csi";
+            reg = <0x0 0xfdfb0000 0x0 0x10000>;
+            clocks = <&cru PCLK_CSI2HOST1>;
+            phys = <&csi_dphy>;
+            phy-names = "csiphy";
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_P_CSI2HOST1>;
+            status = "disabled";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi_in: port@0 {
+                    reg = <0>;
+                };
+
+                csi_out: port@1 {
+                    reg = <1>;
+
+                    csi_output: endpoint {
+                        remote-endpoint = <&vicap_mipi_input>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cd8fa1afe5eb..d83a7762dbe3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS

-- 
2.34.1


