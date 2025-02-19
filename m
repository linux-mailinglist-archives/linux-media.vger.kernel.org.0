Return-Path: <linux-media+bounces-26353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF72A3BB7E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AEC11898D6A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864B21EA7D5;
	Wed, 19 Feb 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="L7sg80PV"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11022091.outbound.protection.outlook.com [52.101.66.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE171E5B89;
	Wed, 19 Feb 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960224; cv=fail; b=XLxyPSlw7N35I0l/v0lNYhKFWWPyM6/Ff6eFnYU1uk/WdhTqPIQ3KlPzPYK4F821hEANeoM1lkIMadMDvaSxsMJl+e0+tlmKIIi7oPFJXMa9WqCJ/dbxcaCyeWQaA1xFumebfthMD5DEqsqJ+pLhfITxBdsjNNxDZ0dzscA72QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960224; c=relaxed/simple;
	bh=0rHJn8xavEahuQRZGeeiAOQU7fRc2kjaBfHUQLOe/bI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sN+84VajyvOCxVgjimG6bLd9spPVeByTJQC+/Mpw3XBoycj5tEECOMHoe1ItwYMVDiJCK68ltvk7vOmuc8UJ4GFm7j6dSvV6M6au1zzFYC6/RNtKt78VC7fHMnkFf4JJHYVQSQ3RCuwk8joQByNRBCrQSJbMWGEwU0ROFlAfhAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=L7sg80PV; arc=fail smtp.client-ip=52.101.66.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuJ0cdhGv0qmKGW6HNhe65GMksE7jZaomEldPNglTaV2on4WdYxS/Imh+UXYI3LEWDrb1SYccc2omzjxjoMc5dsur7/M25le6V9AuUo0JzMBb9lOVwmbFW5WQ96qgb+wvxPNU9Hu1ktI8NTjvyMQvDjfq347R20xsJol/8XrGbSJfn7RgFD9hzi41tEJM4eO88jxYnZnPR7auJZEHl757pl9WwItRMahFNAmmATj3lBeZ7bS2qNFj7OgbPM6LWTD9tJ1tFJtJhR+V9eKT00LCx0z69No368ui/Mo/phwwYNWwOfHtP9R38yZLf0IkfZXVAUfem0lwzt6nnVH2sSByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFyoioX6467zwq6ZGo9ejTrdS8/9Ksz8xL2PAfJ8Pi0=;
 b=rK2gB4nKbmQE90M9jOqcSGT1aHtvdkn2lJzehcAghfrgfS8joAb29k4j0MGug7Xl06tr4f8/9ELvQKAnV8hhFg8XE3j6oBpj2SJ6sunvUDRlIOmERxNdR0o9ZllykUGIQi1PGuzJEZBGUuolzvJ04aR3kN/ylI0CssdHkASmfpxpePaD3tvd+UbaWD7V50Chp0aMz3ErdD81IpK+0shEpY0zauRoBdgZCHymXA8wdDf2gSmtrR4Q6DH+9wXWE4M7FDgPni3a19gJ6yJ8ZCTSa70LrE7MMh0+T4ZeRs9mZYtkntjWts46bh0E9akc/+NsRazzdCOBJ/QsQk5UzW63qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFyoioX6467zwq6ZGo9ejTrdS8/9Ksz8xL2PAfJ8Pi0=;
 b=L7sg80PVh5HTq1ISUsLvL0avxRV4hm+L9I875KUjGYLC+A4ugrpfVlEEyp831vZaMgbt4fFxR7Aymz+I0fAQSmYotpamnWVW3+67ar8JtNNDrWxRZk3l8MOhb5/0zDz1ZalRU5+sv5dMUOkALiqYprtBkj4DnjQHs7C6qDabuv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8384.eurprd08.prod.outlook.com (2603:10a6:20b:55b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 10:16:56 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:56 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:41 +0100
Subject: [PATCH v4 10/11] arm64: dts: rockchip: add mipi csi host node to
 rk356x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-10-e906600ae3b0@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=1478;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=0rHJn8xavEahuQRZGeeiAOQU7fRc2kjaBfHUQLOe/bI=;
 b=PUTH8k/Etcu0yH3aM/0kAAY5BE+evSiPf8VY4SjgYBz/iQz6VYoHk+RdmRPsg81pO2PfNeOvu
 N6hutZjVbBjAR8u0/ZXfho0iXqs4SDPd7LCHyOXDc16gFDxDmAP36Es
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
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: a54725f0-d47f-4f30-00a7-08dd50ce89e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?allyZUlxdTcwbDZSbUhFRS92WlZJSFNER2pGeHpnZ01xRGNBdGduYk5hYzdB?=
 =?utf-8?B?QXkvSVF1TjY1TEdkM24yWjhubkhJbVcxdWw3NUlYY3F1Wi9COHpGeGpCSjBF?=
 =?utf-8?B?R3NaWWkzbGRrbml6ZlVPT2IvOXdLYTB0QlVZNmlrckJlZHlCT0VoanlpU21a?=
 =?utf-8?B?OVpUeXVFRlFEcWYyMGliREhlaHp6RjhtVjF3NVY2dFRnMnYrWGU2YmRxTllq?=
 =?utf-8?B?UDkydkMxL0tVMkYwd1NISlRnOU1JMlp4OWQ3VDhCYUh3Qy9CNUxIWjUwR09I?=
 =?utf-8?B?dGRkWEE5ZEllZEY3Y0hMN29YWTV5dUMxQkVNQkVQZzN1S2JZZDdVdkVQWkc0?=
 =?utf-8?B?bTZsT1BrTERIM3RybGtzYTZkbUEzVTRYR2F2aUhMMlMyV2tlaW9wbnQwcFVh?=
 =?utf-8?B?dGx0bFN3cTJsd1NtQkpkYkdJc0FiVmpqNEllVVk4cFcwYjZodnVDTmtSbm42?=
 =?utf-8?B?TEI5QjFsUUJiUHNpNUw1VG1UbEc2dTVoRDhoUGYranJWbkVNYUZHUEEvYU9l?=
 =?utf-8?B?Qi9mcTlRRGt0L3g1ek1Pa1FKZnNIUmxJQjB1RCtCUlQ0TTZhRFB6b0RwU0pT?=
 =?utf-8?B?ZEtTYWg0V1kwOGx0eldHbWZwbEw2aldJcFB5YlJkMEgvZWpKaUh4N2F4U1dx?=
 =?utf-8?B?WXJZVUJFZmtaQXI1akUwZkdaVDB3bnJSR1phU2xkbTlsdzlwOTEzcnU1RENJ?=
 =?utf-8?B?ZUJXQlkvQWYyRHJZd1haenVMQ1oxUUsveU1NS3Myc3VFekZLT1BjZ282ZnR4?=
 =?utf-8?B?Y0ZtVk12alQwQ2pIUktZN001aGZIRS83eWR1K3d5d1UzTFBValhXcHNkajNT?=
 =?utf-8?B?SldtTjRTS0tSN0NmQ0J4dWREcmVVUDA5dDg1M3FodHJvUkVVcTg5K21zMEFZ?=
 =?utf-8?B?bHkyVGRHRFdQSzdyZjBhVzVtdGJLSWxRVG14NGd2WXJsbEZiVWIxRmZZWjAx?=
 =?utf-8?B?Qkl4V1d5Z1VWM2RxSFNQRnNUV0xxTTZJb1hiZXprZkIrM3hmV1dMSWxmdUxO?=
 =?utf-8?B?cGd6a1hZemtYbURxQVZ0UjlBOEtCcVR1ZFFOTWZaNDE1d08rYmtsdEdtNUZ0?=
 =?utf-8?B?YWJibElDOTFXejBsaXJnclVEVDh2OXFHQWl1NE5Ka3RWMzl6d08xaVI3d3Bz?=
 =?utf-8?B?QUhHTUY0UEY0RVVEVTZsbVl1UzcwbFowVERDUWxDYy9JZU1lVU5HL3dkVWlO?=
 =?utf-8?B?b0ZkTldlZVBvcUJzdkQxVUFSa3hSTnpUZ3RXWWs0R0NUSGtCdDBPSzJnMk50?=
 =?utf-8?B?QUZJZEN2Qy9nY0dNaE1xT0JuTDhWM0IzMW9KSFhwbWRQYlFuZUJpS2hRak9k?=
 =?utf-8?B?Q3RxTFNwcGUyckJFUVFGWkgyOE44YVZKRGVOdExrQTdJMXBjUVk3c001bVBo?=
 =?utf-8?B?Q3Q2OUM4ckhBRGlLVnllQUlYUlR6NFpYK0VmV3lYandQNjBmUXhPNmNCRUhz?=
 =?utf-8?B?TUJoV21XN1BMUnJycjF6azlKM0NIODViTzZsNU5xT241ZXZ3aEMwdGNLUnFq?=
 =?utf-8?B?RmJzY2hESnpZZ0pMYXJIeDJrbXZSTVgrNGkzVVRPZ2lmSmZnZVNjbjF0dmx0?=
 =?utf-8?B?WWpRVFYxQUdvNGxSbVdLUk1kWktZQ2phUlZkMldRWk90NXdvUFA3N1c1eUdN?=
 =?utf-8?B?Qkk1ZEdHUDdOOWNqODUxVUp6b08wZGtoT3pvaDR0WmFlTThTQ0dHbWRVandl?=
 =?utf-8?B?czJEcThvalBYUkVLN2RyRThrV2lMU1pDVjE4bEF4Nm1ISFFFOFhTa0IvV0lJ?=
 =?utf-8?B?Wm5KRGo3cjBXcC9yWm9FbTBSbjdrSk9GUHVzcjN6QWdKN1lLN2hvdnlDalVj?=
 =?utf-8?B?MmRtTXdBcUtSY3RtazJ0dVpQUTU3T3B2clBFMGI1OUEvMXNOa04vazlWdUlI?=
 =?utf-8?B?ZUxPNy9QU3ZoU0lGdTlCWmVxOVBiTi9sOU85ZzB2Ym4vb2VVV095RVlzMTRj?=
 =?utf-8?B?NGVsbXJJa3JYdmVEZTJ1MVVGTmxyWStJNHp6YS9DV2ZRWGlFZnMwa3Y5eHhZ?=
 =?utf-8?B?VGgwSGdsbkRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU56VlpJYi9NaTIwZ3lCdlJNelkvcGMwR2p1Q0lFc0toWDIvRGdLR2xmQ08v?=
 =?utf-8?B?dlJwMWNvV2VuVUppR05WaUpzWnBqSDRSTFJ5bXd5VldZNGYxOUNRWDVlTEhT?=
 =?utf-8?B?TENvR1lKS0RzbGNpSm9SZ2QyQ29QcmRxSzRqTGFiSlMrSTJLMHozQWxVV0J5?=
 =?utf-8?B?OVF1TVoxdmQram5aK0pjZHlndWx0R2FSd0Q2Y1R1U2dDek5Vc1dnM1YreEhi?=
 =?utf-8?B?ZUhUTThhNjdtTGlkcG1VZmQ3dDZTU1ZvQ0EzUCtTVWIzYXoyYW1CdlA0T2NZ?=
 =?utf-8?B?a3hCd3VUWFZNdE5TRUJqa0VjOHBiUW1weHVLaTBIRzdTclMwWmd0OHUwN2xI?=
 =?utf-8?B?TCtRclE2cjZveDhaTW1Dc1B1d3hCcWZYWm9qMi9ibDBmRk96Y0w2ZjBjYk9u?=
 =?utf-8?B?OTFCcnhvTStjQ2p6QXdvYVZ5UnBIV29oSWRvMVllWFNGdCsxbjZWZTJnL01H?=
 =?utf-8?B?OXMrUHBNdXN4TU1ZOHYxOE9PbEZ3elB6RElIOTFoajB1WENTaEdZVHRqeFFj?=
 =?utf-8?B?THBFNC81QWpKL256QStwb0dCcHF4ZDNQaEJJZmkxYXJ5bmdpUVZlb2dtcXQ2?=
 =?utf-8?B?bCsrVHQrZFFLZWRzOTBKZ0h6L0tXTjdGcE9nbjltejViY1NmdUY3dFg4ditm?=
 =?utf-8?B?Y1FMTVhaNys1c1M5OVBpSUJ3aytId0dRb2MxanNhekNPWFBwVXd6c2xQQ2I5?=
 =?utf-8?B?cnlldnk4WnRuK3NnU1FQOWgwTGV4SmY0M0thc2h1Sk91TjBwQU05bWdUWUJG?=
 =?utf-8?B?UTBHNFNzWWcvUm0ydjhNSFBRQ2I1WkJVcU9Wb3RySng1Wnp5dEZNdkpzb3Jp?=
 =?utf-8?B?THdpdTg5MHp5cTVtN0dBQy9zRURBOEJYRVFaQTErOWZuSytCdWprOVFmVDha?=
 =?utf-8?B?RXZReXNaeHZNUmU0SWZmWC8xMXlEL200SEtlczFDMDNRb0ltTFFDUTJkNjll?=
 =?utf-8?B?TXJtbEZCbEhxcCtaZUVEa2REaDlGUUY0VU05Vm9lcFEzYURacjl0M3lUd2Vz?=
 =?utf-8?B?dGxPZXNlTjZsUnZxbzhnNldxTTY1c282N1cvTHNzMFFTcFBZVnRTWVJCZmZu?=
 =?utf-8?B?WUI4VktuRnZpWnladTQvcnM3OGtMOWtiMHpydXhsbXNnbHRLSjJSRHd2QWtC?=
 =?utf-8?B?ZkYrT2UrdTAwelVSTDdGc3MrNEVKRWRiNHB2WGM4bDc0eld4bEN1N2J2aHFE?=
 =?utf-8?B?TmE2STlVTUd4MDhRbWNveXI3YUV5K2M5Z0lqQ3M0aHVkUDhpd3VnNDBtQVNo?=
 =?utf-8?B?dEpVN09UUmI3aDF6dWw0aDAwRDZ3UHljQzdDNmplRVlpbmw2eHRoWVZwVjRm?=
 =?utf-8?B?ZXVwejNsWnd5UzZrU2NKVHhPQ1lrdGJrTHhGalZBMFhMdThXYTRiZlNpQnJM?=
 =?utf-8?B?YVZMSFVxNTMzMUM0WHVaS2NwOCtrOEFIRkFHWnJYOHNDZFFDWlkzOFQyQ2xX?=
 =?utf-8?B?WkI1RngzdWRic1pxdTNyMFdMNFZoV3dIcjhNQ0pkc2tHeFVNei9Kd3pkRWEy?=
 =?utf-8?B?bFdmc2k0YzZOc3NOczRuQXBZOCtqY25KN3lKbkIxQ3ZGVnllTit0eHdEdU5E?=
 =?utf-8?B?TVI3ZkZGSWVqZkZMZ2x4eGZ1MjdDRkg3SzNSbGkzdFkzSHVsaW1wV0FUc0xV?=
 =?utf-8?B?TDQ4Z1pzd2d6RDVTTWxDWjMrdTVGS0ROSEhlVy9DL09MODU4dFF5ZVM4a2FZ?=
 =?utf-8?B?anNqcG9JV29ZTTU0V3YxZm5sd2ZUaW5xa3hkY2FEZWxVZFdta1pwNU1ac0pK?=
 =?utf-8?B?MnNNenE0TjZIWnB3NmYxMFBxYlFnR3MycEVvZG01dFA4S3A5djU3OTVWMHl5?=
 =?utf-8?B?SzdjNytEUkxLMVVCY2RBUW91MHo3T0VZTHlOVUgyQWtQWkdnbjhBN0xPMGN0?=
 =?utf-8?B?bXZmWWpIMjZQK05BYlFiNzBSbFp2a0ZYWmRabkQ0Y3RwMHlVL2dBdFpCbVJr?=
 =?utf-8?B?K2lrWHRRUExaS0pucGN4VWNiODQvRmF2K0tvMU5VOHpLWEp5KzJDVGFObzcr?=
 =?utf-8?B?NGdkY1c5dWNmVFRUZW1TWnRFOExzNXhxTnp2b1J1OTBSTnhtZEFoTWpBS2s4?=
 =?utf-8?B?OXF4dmRWZTgvK3NXdkpwRmRIQzlCY1pGUGdtbzZMWkZMTE5kVlFaTEtES2FP?=
 =?utf-8?B?cllRd1VKcktocDh2djh0N0ZXY1BUN0hnNUFVOWQyMHdFMndSTkZxNjlucDJu?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a54725f0-d47f-4f30-00a7-08dd50ce89e2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:56.4502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9ABLrPCNONbLQ5WV28FyKv6JyeTLvqV6RymAqBokKCC4LhQFNg8GfyCf/XDhvJ/cKDRmaT8DjV/52WihAUEyg7dt22zO6xp7ymzpUsVm1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384

Add the device tree node for the RK356x MIPI CSI-2 Host unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index cba5092dbcea..5957349ca865 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -553,6 +553,34 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	csi: csi@fdfb0000 {
+		compatible = "rockchip,rk3568-mipi-csi";
+		reg = <0x0 0xfdfb0000 0x0 0x10000>;
+		clocks = <&cru PCLK_CSI2HOST1>;
+		phys = <&csi_dphy>;
+		phy-names = "csiphy";
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_P_CSI2HOST1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi_in: port@0 {
+				reg = <0>;
+			};
+
+			csi_out: port@1 {
+				reg = <1>;
+
+				csi_output: endpoint {
+					remote-endpoint = <&vicap_mipi_input>;
+				};
+			};
+		};
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
@@ -581,6 +609,10 @@ vicap_dvp: port@0 {
 
 			vicap_mipi: port@1 {
 				reg = <1>;
+
+				vicap_mipi_input: endpoint {
+					remote-endpoint = <&csi_output>;
+				};
 			};
 		};
 	};

-- 
2.34.1


