Return-Path: <linux-media+bounces-24339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 534CBA03D49
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 12:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1F6163C18
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCAF1E5738;
	Tue,  7 Jan 2025 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="VykmVcA+"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2104.outbound.protection.outlook.com [40.107.20.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E311DE89C;
	Tue,  7 Jan 2025 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248079; cv=fail; b=eL/W7t7TzSuYyoCTDMHBvVY2zMvHyO7OIG84/JMPldrLyL3263YnaEQs0bisgxCnZmDxtqEDZh3kNK13qFiiVqMIIaV6zOTZx1CLaE6ClmPrfbnyS2p/P8gNeanJBJAYiFk+DIS/llS9A34ivzlMJ1nAQnkGOAK2U1Mfulz+P6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248079; c=relaxed/simple;
	bh=K21dJKoeC7Bg4iLWUc+Cx8o1Roik+hdIlo5b96v+47c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Numr88Hy5G0Lj4285kFiHoPDKl48o9GPOqV6+2YU3kjVX8E8VXR7vrynTEp8Ft7dRWlkPrwYKdQHSdookT0cKyo8ClKNACX4GUT2iTFu14AWJHe3E8fTHVEyh5Kd5kj6wwiYSQMt4FxtdLUjGbrbtweN6MZPkQ88YUhUxqnOA9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=VykmVcA+; arc=fail smtp.client-ip=40.107.20.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay6miHf73/a4SEIBPIuAmJlGcblFrI04dQPs/OyMQ7kX/fOG+bYIPMT29xcuJMNRHrYx/dbHYb9HpyLuHLt3ZVAXKHaA+/nq/3HKo9V/tsqHGnRCPNQ8Xz+bfHdBIxrb9SKsuf7qbCeKR51KTVI3yMbDrcXTsqUh0Aegi/yXXAj0rtWZrouqQMMl7GsaVpSD5FwBioos1Lf6/+KAv5x4zrwA5pvnQBQFo/Crle5BEc/WmYO2W+t8Jq+zniQdifAS/VNJ9TjqPXP71VgYiFmHZ2usyn+b5+2y1Ld8aJhAB9SjrBW72hglrlqOs3oeY3wDxUA+fIpbg/Vgy3qEzX5j6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wROi1SSArT5OQRZ6c4q41OWuNRwGtAxgEPIBz96LOGk=;
 b=JMBIs5tuAs+dNn7wzfe3qDq1V/dmOqHpSLRlrpz2ZDNidvozN6v/lPDuXpGJgvaql38tdB+QPbHfb9KbzRqrwGSfw4kJ0/Nj0XlKGpTYpWuR4Ql5eZpZYJGAGOrGncunggDPLj9R9LCExXECp6SJIaCdkOZpoqTTE34Ucf7sFu/TD0yt7Vcd89JDLUVhjpXaPogJ3zidEhAmSYfczMobBf4XmUUdpEqsQf5ksOfaeOn4sK4kqykAlywSmojQjxPTZV/ZcX/EZvjZsxXHqSXq1+ADB6DQK/1FAlQenHkuoLWqAgzhF8ja0WfhUFYtbC91emPma2/Erz7LjQvC1G1cng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wROi1SSArT5OQRZ6c4q41OWuNRwGtAxgEPIBz96LOGk=;
 b=VykmVcA+EDoza2bdqIwzEnqj2zLWd6IrDh5KX9p7/riPZdYWbbPrlQKwK499yKkrdHdg3/bYPdyva3BvvOUKyMLBIQfd827bglonCt1XfebrpDygsrO4UILGEpYBsH0FyrOez6WN2RyFpW+I1tBz4ksYBeJ1WlEEXjuK4roqsEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by VI0PR08MB10447.eurprd08.prod.outlook.com (2603:10a6:800:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 11:07:47 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 11:07:47 +0000
Message-ID: <88f8feee-9cac-47d7-9a8d-3c118e26d124@wolfvision.net>
Date: Tue, 7 Jan 2025 12:07:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
To: Rob Herring <robh@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-3-b1d488fcc0d3@wolfvision.net>
 <20241230200837.GA2477354-robh@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20241230200837.GA2477354-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0126.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::24) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|VI0PR08MB10447:EE_
X-MS-Office365-Filtering-Correlation-Id: 519461ff-efde-4a59-e4dd-08dd2f0b84b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUdSRlRuUE9QOERWWHVpdkxQbk85MUdaTm1jQk03cnJDRmFzM2RkVVFrTHJ2?=
 =?utf-8?B?ZWtXeGNhRFAxLy9xaGtqVEZnZGo2Z1BSeGtpQTRDNEJSYTJuZ1BJcFkwK0d2?=
 =?utf-8?B?b1c5c1l2RkpyUEo2cW1ZMWsyaUY4eDJsSkhUSGJQZEl1SlQrU2xzUXFDUTBi?=
 =?utf-8?B?V3NJeVJxa0JPejdFUXBuaDQrQ0Nla1Vmc3NXY1JocTdDdVpMRXFPNVBBSTFt?=
 =?utf-8?B?ZWhheDZRdHJmVVdyWEwyYlFVWmZDcFZLNkpWcFkxWVJ5RjliMW1POTRqMldv?=
 =?utf-8?B?ZTJ3dmhyRDBSMHFFdFZZYnp1M29XWVp4aGt4K2ZhK25TaTNBK2granVzclFS?=
 =?utf-8?B?NmVIalI2akRqbEY1RzlaV1JJS1JxN3puNzBGbGg0WE9EVjlySjdwRGc2dk1F?=
 =?utf-8?B?S2VBTlhpcnhKbzlXOWF2cDZzMzczR2NhQ2o3T2tLTWxZcnlGOUNqaUlidTZk?=
 =?utf-8?B?ZUhZZDFMUHhrNjBzN2ZzTS9Hd3E1bnJwYm42MTkrWXBLTmoxU1JSWHF5Wldj?=
 =?utf-8?B?b3Mva2VON3lSa0VaTVFrZm8yVFVvc1haRXNXYUFSMzMwS05ybGtmTXpwczRi?=
 =?utf-8?B?VW96Mm1ra09sWTNaU1pBQjVNMGFnajRaZzY5ZG1xaXZpNlFyNFFQTkIrRVBu?=
 =?utf-8?B?akkwYnNzZUdNdTFrMEM3SzB1YmJVTDRsK1JVMXd6ckJrbEY4MzJwamVtRG5D?=
 =?utf-8?B?MW1Gc08zVnBZWnIwaVF1RWtLYnBxU0M5UzRZWVNBT2RYbGlHSkFTcEVYajVp?=
 =?utf-8?B?VGx5Uy82QXZjMlQvV3lYOUNKcjdYekp6ZVk3eGdxM0d5U2dRVmFaQ2lzUUd5?=
 =?utf-8?B?QjJTbXJuM2VwY1V1M3hVSVE4S1l4WmxjdEt6Nys1UHlmeGF4eGhxemR6b3Jn?=
 =?utf-8?B?NGNPWVRVQlJRLzhEdEJGdzF4NU9WTWwwazlVMFNvUUxwVGFwanA2UkxyeWNQ?=
 =?utf-8?B?WndVb0VsVjVUeWpjQU1tYWs1NkRCY0o3a0s3cnAvMFUvSWluY1VZaWJTY3BS?=
 =?utf-8?B?VW9ZQVFuZXhBTldYT0Z4V2ZHQzFnWW90WDg4dDExa29TNEhYM2RFYUlxcmxN?=
 =?utf-8?B?Tk11UW1PMXNWc1BLRXlsbTNMQWpoaEsreFZJc2xlWTRiZWxWcmlha2NueGFy?=
 =?utf-8?B?cGwwelltb0RES1F3M3BoWG9HR2lGbkdqb25uRjZJNkVRTVVydkZLZ0JHZVV5?=
 =?utf-8?B?VlFWak8vNExwRTBJeU9JdEVrZlVJdHgvNG1OOTVhTUYxNUE2VVNuS3ZPYUU4?=
 =?utf-8?B?SFdBcTBMOTYwU0NLakxDT3NJaDBVcUFDcTBsNUpmZnZSWVovemEzMHYvb2I4?=
 =?utf-8?B?R21LL1VZTTc2TmdnZ0VRQ1ozMi9OR0d4L2VrUU9vVnJkb29HMjZoT0NMOXBu?=
 =?utf-8?B?TlMyOFpERGFvVG83cDN5TlJ4VFp3ZkgrUnFueVp2ZUVzb0VPc0VRYXRWcmh1?=
 =?utf-8?B?KzN6N0ZBdjFrRHIvZVByNmxJNWs5NXpkREJYcHNpd2pMK3hVUFpQU3lzcUR5?=
 =?utf-8?B?VGJIa09HQlN2VWZlMW9EaCswbEczNUxEMXNiV2l6QXM5azQ2R2VyNkZGdkVr?=
 =?utf-8?B?MDI4cDRiemZnejkvTWRod1plOHBDZGFCaVNERml0TDIzWG9yaEVqcTh6bTJ1?=
 =?utf-8?B?TWUwR0RVMGhkRUJ0cVU2M1Y4RVFCZzZEbERSM01BNjJPRUxUUVRjUG9MMUM0?=
 =?utf-8?B?Nzl1RWtCZ2ZVTVhOelJTUytDbXAzQklaS25VbXh5cUxhQlZ6TEc0cSt4VCtR?=
 =?utf-8?B?Nzh1SGlyMkdGYlBlelNxNzdzdk53MjByYlh4eUw0Z0kvaEVWZlJZaU5YOG1h?=
 =?utf-8?B?dDd0SWpubXZ6STdMRWpYMDkrcFh2L3kraTZnbzJBVVVwR3dDQlZzMGk5bHRp?=
 =?utf-8?Q?G9PwEYfm9Tmof?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE9YZHNqRWVrN0NYTzZFdE5oYUcyeTBqN0N2M0VCZHo2RmdyNFBlaGtyMGpz?=
 =?utf-8?B?MnlQbUpRT2FtLzZPRjBtMnIxNjBhQjBmMzJZZSs1VVB5dUswOUNOZ2xHYVkx?=
 =?utf-8?B?TlMzOUlLOUNOUWl0RWJjWVV3M3ZyN2gramF5am9nT2EwZE5BNWpUVUhoaUts?=
 =?utf-8?B?ZG5QclZyUjkwUUcvd1NENTJNd0FxTlF2OGZjam53MDlvanpTK0hoY1Z6NStF?=
 =?utf-8?B?V2dGdzVQbUNnL0xFZ1ozS29LTlV5cXNYZWhyOVE4UmcxOHVBS0Zqa1o4a0tM?=
 =?utf-8?B?NVhpMlBVUGJwQVFFNHdCb2VFT09VaWxXMXFaS3hIelMyaVg1dStHMEFXeGI3?=
 =?utf-8?B?T3dUd3NQL0NrMGNkMUNjdG56MTRUUnl1blVwY2JvQlQ5MnVtZ3dDZmNsYSt4?=
 =?utf-8?B?WGdtcjhWelBlS3lSdUdEZG1vWjhwaWdIc2hxc0tUREpZNGdXL08vWUJtTHNm?=
 =?utf-8?B?QTdLTHo1bE9JSDFEdkd5UUdRNjltbXQrTmlmdUNNS2t5OGlBWVpxeFMxR0NS?=
 =?utf-8?B?Yms5SWZzbE5xcVhPc0hFSWllL29NTk9UK2szUFlKZEhodFI3SUE3TGowcVRZ?=
 =?utf-8?B?MGJhYnA0czZqdjNFdXg4eHlzSVJLOC9UWnhOeERKdnppUWowQ1Y0TmJJMEpS?=
 =?utf-8?B?SVJ5bkZYTVdkaFZYSkVvY1o1YkZ1aFVCVUhvcEdNNEpwZWxNd0dTS0Y4Tm0y?=
 =?utf-8?B?Q1hYdnNxTUFNVDVVRWV3R3YyNkV6OHErR2VBOVZtQzI0RzFEQXVQQ1dpTGI3?=
 =?utf-8?B?UldyRlFEdUppTkc0RGd2SGcrUG5XRnREMnlBMjhKZmNMcEswbXVaODZJS2Nk?=
 =?utf-8?B?TjA3RXRVWnNRdGx0VlFqZ3JQTmo3akdzbnR5SnBjdnliY0NvL3JZTnpUdnlO?=
 =?utf-8?B?VGZwUzVZYURZYS9KeGZFbDZOdmQ2Vm9CZDdSTmhiZGkzd0p2RFF6TjNVSWwx?=
 =?utf-8?B?YnZpb2UzcVlRUEFjVEhRYXgyRjFJa1F6UE11MUdZT256SzhGVktQcEkrQzhv?=
 =?utf-8?B?LzdmUExOelh4Y0NMck16NTNuOHgrM3lRaXkyTmxlU2htRnEyTlVHekU0eW5B?=
 =?utf-8?B?UVphcHBUL044aHZDbUFkTHdVWis3bW9CRUZVOG5WdkdybkRaWnRjZVFLVWE5?=
 =?utf-8?B?a29tc043Q3dycmIvR0pYYXBScjhsZVVTQ0s2cWc3d2o2MDN1RWFzOVlDRVA2?=
 =?utf-8?B?TDc2SUdqOEdqYnVCSllVUUQxTktCcWNrOTRCSGJUTzBrTFg3ajNtVCs4OFlH?=
 =?utf-8?B?MkxCbUF3NFFFamIyWU1OOElOcUM0aVBVQkxKSVd1WHYwZXQwN212d3dVNGRU?=
 =?utf-8?B?R3BHSmxyQmZ2SXptNHdvMGtsdVMvUnJCOFQyL1hiNzNGc0JpeTdnMDUvUGY4?=
 =?utf-8?B?RTRJeVZrQk9rb1pVYTJ5WWhkSmFYZWFVT1RCc0pBa1E4M28zTU1RaWdoOHpx?=
 =?utf-8?B?c2dxWlNIWGFTdEpFeXJTV0crSktkUWlFK050eWtwWko4RXdmUUxEQjVDN0h2?=
 =?utf-8?B?bVVoTkx4Q0M0amRZYUhISUR6cnVNNk11U3BwS08zZlphcjJUeEczNGhaQ1Az?=
 =?utf-8?B?dE83WStDRStKN3NmRHVpTDFpM0c0eUZTZTRhZC9kOTBPbGdiT3V3YUFSWDA2?=
 =?utf-8?B?QytTemk0RHgrMzZTd3JkcGFMWEkzbU10dWhaTE92QysvT0JYQkh4RVpBdmhP?=
 =?utf-8?B?Y21LZ3dJZ2RxRGZzNkgvNHZvU3lnVWJFbUlEdXRFQ2ZkaHVqU2t6UGVtS3RH?=
 =?utf-8?B?NlZLWElNWHRyeWVycCtSWlZBS1crWTNndEpLLzI3aWZDRGVESDJ2S3RMeUx5?=
 =?utf-8?B?MDhVTnBva21Yb21JUlNpckFOQUZ4eERUZEh3YkUvY1NmRjNWMHZIVzFJRTdE?=
 =?utf-8?B?eS90eUhhV3ZPOXdyY3lmZGg1c3VCY29WVkptRG42S3VLdnZvclQ5Q2QzNU9S?=
 =?utf-8?B?ZzVhUzZZTXNrNEtGQzFXbTZkSWYrK2hFWFRHdytpQnhBL1hTbTVJYytZZWNG?=
 =?utf-8?B?THJSWGV0TlpnN2VzVHdLTkhvZ1IyaXJzLy9ObnVnbUFoODNBUURIK3N1aFVt?=
 =?utf-8?B?d1VRK2w1UWdJMU9WUFpDUUhMRlJWZUtIWHJEVUNNQTNwb05YWXVpd29pWDky?=
 =?utf-8?B?YXZXaW5JeE4va3hCR3c5RHV3RFNtYkFYemJkbGNmblJqa0o0VElienl3MFNl?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 519461ff-efde-4a59-e4dd-08dd2f0b84b9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 11:07:47.5532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi64VfP81AVOakQVg9uL/3x7SZu9hix0h8wQnCGg0iCDW3oZrV346NtOt7r0s0Y0GLnNraPQC1uTfxSqzN5cWes6MTaCkaNdfIA351ikYgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10447

Hi Rob,

On 12/30/24 21:08, Rob Herring wrote:
> On Tue, Dec 17, 2024 at 04:55:15PM +0100, Michael Riesch wrote:
> [...]
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: input port on the parallel interface
> 
> What about the CSI-2 interface?

If it is OK to add it to binding already although there is nothing in
the driver code that uses it, I will be happy to add it in v3.

Otherwise, I'll add it together with the actual MIPI CSI-2 support.

> 
>> [...]
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3568-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/power/rk3568-power.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    parent {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        vicap: video-capture@fdfe0000 {
>> +            compatible = "rockchip,rk3568-vicap";
>> +            reg = <0x0 0xfdfe0000 0x0 0x200>;
>> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>> +            assigned-clocks = <&cru DCLK_VICAP>;
>> +            assigned-clock-rates = <300000000>;
>> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
>> +                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
>> +            clock-names = "aclk", "hclk", "dclk", "iclk";
>> +            iommus = <&vicap_mmu>;
>> +            power-domains = <&power RK3568_PD_VI>;
>> +            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
>> +                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
>> +                     <&cru SRST_I_VICAP>;
>> +            reset-names = "arst", "hrst", "drst", "prst", "irst";
>> +            rockchip,grf = <&grf>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                vicap_dvp: port@0 {
>> +                    reg = <0>;
>> +
>> +                    vicap_dvp_input: endpoint {
>> +                        bus-type = <MEDIA_BUS_TYPE_BT656>;
>> +                        bus-width = <16>;
>> +                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
>> +                        remote-endpoint = <&it6801_output>;
>> +                    };
>> +                };
>> +
>> +                vicap_mipi: port@1 {
>> +                    reg = <1>;
>> +                };
>> +            };
>> +        };
>> +
>> +        vicap_mmu: iommu@fdfe0800 {
>> +            compatible = "rockchip,rk3568-iommu";
> 
> Not part of this binding, so drop this node.

Ack, will remove in v3.

Thanks and regards,
Michael

> 
>> +            reg = <0x0 0xfdfe0800 0x0 0x100>;
>> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
>> +            clock-names = "aclk", "iface";
>> +            #iommu-cells = <0>;
>> +            power-domains = <&power RK3568_PD_VI>;
>> +            rockchip,disable-mmu-reset;
>> +        };
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1138c8858bc7..8dbeb2927a08 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20223,6 +20223,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>>  
>>  ROCKCHIP CRYPTO DRIVERS
>>  M:	Corentin Labbe <clabbe@baylibre.com>
>>
>> -- 
>> 2.34.1
>>

