Return-Path: <linux-media+bounces-23609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EF09F5052
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D01D167F45
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D122E1F9EAD;
	Tue, 17 Dec 2024 15:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="IVba4SFz"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023088.outbound.protection.outlook.com [52.101.67.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914031F9A97;
	Tue, 17 Dec 2024 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450928; cv=fail; b=lQ+P0wJilowhvEN6vuSyi3Duv4aTQ/Z5l6JmY0TqysNJc9pRzW6oYT1W16unuorlZa/Cv8kEYzzANocAbzaIcDNuzCgkbIYHct3qZranp5jkp3yzlPvQqG4wDTf4JwiN3t7XSETPeP/sHyVwSN4Md0zR8n/alFY368xvQXsRI0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450928; c=relaxed/simple;
	bh=g3tpAJJnMyFyzkixlbq6j8An04absIUx2MkV/qioC2o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m4zwdxOXdAJ+xS4zBaiqAcs5YYqYzP94BwGLfx7Q+5AIY9tXCdiwLy64xNaGejFjcP71vJHAiuyTKLgd7Ay7AqbwxDQT/JS4ffr4pyjbklwodpgjlJnyiU7VnACRqNdOfClRgsYZ23ujl7COe2rZgtjX1a/oI9Skf2JUxRrGpEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=IVba4SFz; arc=fail smtp.client-ip=52.101.67.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa0/qdNX1Pav0gqc+mdUJp7vTVJvnIMBXmPpi4zzhNCLAV5ITgWf31/RI+aM5upmqR8ggWXal+JBJlqgMcKpxMOMBlNinnio3HrLUKRfuwLTbyV/DZW2CPCsXEF2X7eD9slooieYTfr/rwiEEuK3UwsKs1+rlgID0av79N+iCofcx+n7w1fLiel1OFb5bkEIQX6zYjHVYar1lR/zDvLQiNK95qV5w6AhZqtgMkpTcpKjbGPYNQRuGaSBhlLBVEkzGD6BMTkFazwujlr04HFxSUURMKLNCVnbPFYwrBSsZo+yqKwVFoFWcfmZR8VS1jC5mwjqwutccoMvjSJpg+Ulzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWkNc8fK9Tfm7JgT59wI/imAn+vxr11dgp2yqbb1eTw=;
 b=i/lpMeaEEQu3VegK4L65em0M0E8eWXBDJvXV6Fdj4nfANykFv7JVxTZ8q3Maqt99Dp+6F3p+vusAcQbZ4PyT/XyEFcL4bXGmMxOJ9AwHpVwKX9NKeuneIkgU6WhHcYvmy4o+6KATaELgwjFxdRfdJ8maATL3XJ4ad6d1ZMT82jyabUKH4IxCW7TAA9s3kS/PLeofn8tlUlaYWDCwrqHtS/aYniPv5Z8WgYJIkJQGPc+CIDBEM4yccRFoox1YNW9bGv5aU6YFUvQklaa4MUeO44n9kV9Se+suaivXuKq2T+2RGjf9q+FUXmpLYnBrzUfRKrauDlnbZmv5xQ3LiERhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWkNc8fK9Tfm7JgT59wI/imAn+vxr11dgp2yqbb1eTw=;
 b=IVba4SFzSwHnjClEI0hb8D8QDUQOkcPM0vyrC9nGUu5nlGOOvQSZLlIo7Z3lEDtRhGnGNfN9/CiBfDB5nj5BKb0ROgE72isSmQU+CtyPyi5yVQJINgBPp2bPn18dBwceHOWQhFzjgeoP5DG0MLOJK2DfZDzvEl1MPMb/tRdhT0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10149.eurprd08.prod.outlook.com (2603:10a6:20b:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:55:22 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:55:22 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 17 Dec 2024 16:55:13 +0100
Subject: [PATCH v2 1/6] media: dt-bindings: media: video-interfaces: add
 defines for sampling modes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v6-8-topic-rk3568-vicap-v2-1-b1d488fcc0d3@wolfvision.net>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734450919; l=927;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=g3tpAJJnMyFyzkixlbq6j8An04absIUx2MkV/qioC2o=;
 b=F45ata9Zbkm53oBC7JEJb4kRgJ01vOjjiu+4lgjQhu7gawLvMAUqEaoDMX1Mv+hAQXtvKXmRl
 cT0Zk1Qj5I3CRXW/mFEMxMUqgZY8VebKIGWwcbZIybRwg44cfQimBSX
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: c6721763-cd48-4b25-897f-08dd1eb336ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFQ1b3RsSkpSRksrMVV4amZMMHZIazNhTWZQeU5MaDVnRU54cUVsaHVPN1pK?=
 =?utf-8?B?SE8vdWxxNDlPM3VTdlpqajFZTjN5NDVNUmdDRldDVlBYbElHb0NaZ2JLTnI0?=
 =?utf-8?B?OFRVR0d2ZEhjczhBenY3c1FBbHJaWC9MTmk2Zk9LM1dHWG04L3ZNTFJTc2NF?=
 =?utf-8?B?SzFjdW5yd094dWdqYkRxY0FiamxlMlJrakdwbEJFWjkwMUI4azV5SmVGS0h1?=
 =?utf-8?B?eWpFRXkzckN5dzN0dGZMYmJaa256SGFUVVZLQklXNktIYnZsUHFDY2FIdGdF?=
 =?utf-8?B?U0dWdjBTdEtXUndBK1VETER2N0grMmF1TGl4ajdVeHpaVkhVVDFyaUdjcENQ?=
 =?utf-8?B?RmVxRUpCb1MwZlhMWG8xUWRNcEVhbHppWndWL1dSL0Q2NUhHU0lBMEpKZnBK?=
 =?utf-8?B?S0M2eDFSenlZclp6SjNUOEQ2MTFiTzNIR21LTkZkTDhyalk5QVA1VnNweVBK?=
 =?utf-8?B?WHN5aitPcWRhUnZ5OVpuaDl0NVBrdGFIeDEya0hWMFYzZ0hWRWFsaFdTT3Zw?=
 =?utf-8?B?WnNycHZpcU9ydWpiZ2hxeUFra3ZGVlg5NWIrWUl2RXdpdXFjSk9jdDArb1hr?=
 =?utf-8?B?SVNPTEFKVFByeFE4SjNjdGdHSy9HRVgwWWtrVzdMVUNIcG82Vm1TK1pRZDli?=
 =?utf-8?B?TGZaWC8zNis3UkZETzJwVWMzb0VGQVJ3bTVpK2o0MFZ4eWlsSFpETFhMSkd1?=
 =?utf-8?B?RjlZcFBOUGxuK1NwbDdBQUhhVzMxMjdlOFNxT28xYk9PTEVsdjluYzJUWnRt?=
 =?utf-8?B?cUVOdjErbVQzdUdMN0tBUDBna0pRbVhPeGp4M2h4ekdpVUl2elBzdzk1NGt4?=
 =?utf-8?B?aXhUbUk4UWFuOFhMY0RqSWJpVExSV21qUjBON0twQUlZckFvNnNvK3Fucit1?=
 =?utf-8?B?Rm10WE1RdlByMjl4ZHFtVmJEeUV3Q3JKeHd0MmV5ak1USWtER1kvN0dySm5y?=
 =?utf-8?B?a0RuUzZVd2J2K1REREdSUWdJSHVyT0FtZHA5YmdZZHhlM1phcVR0Snh6bHZB?=
 =?utf-8?B?cmFZNEZXSlF4LzBaelNCdHJwc3dCdkx3WXAvWDlwbWZnbXlSVG05S0hqeTZT?=
 =?utf-8?B?eTFFRFVsRWk4V0tBUnBoMktQK0xjYkM5TTVEelRvU3YwOVNBd0pmUG5vUkg0?=
 =?utf-8?B?ZWRvazJ0dDRFelR5RXhYa0pxekIxOFhmSE81dHZJSzBNdVBYNDZSZXhrUmhI?=
 =?utf-8?B?NVE1UVprZ0xHUFNlcXMzT1Flek9CZGZyVHRXb0h6bm1UYUVrUFM4WVVWN1Qz?=
 =?utf-8?B?Nlorb0xFaFRkb3prZXRhU3pxMFFTMFhNVUsyNGNjRnRFUGV4bjFqOGFycW5j?=
 =?utf-8?B?TXRicGdjMmZzRFRkZFBLMWlha1ZaaGJPSnprajF6UWlCdHZOWWlSUmU0cWZv?=
 =?utf-8?B?MXgyR3JHOHVXWkRUZndIVGl0SWk4Q1p3MUJKOEN3NkZJUkIwUm9xS05DcDF4?=
 =?utf-8?B?cXBGMklRSFNNWnB4UThrdmFJemJPS01QKy9pbVNXbzFiZlhvSlNpT1hBUHVC?=
 =?utf-8?B?TGM0MHgxbE9hNUN0TXdmN1RhZ2YvRHJPSzM5QzEzZlZORS8zTHNKSHo4ZHI0?=
 =?utf-8?B?N2pJZHJXeXFlODQ5Qkt1MXZIMGk4R05RdWVNdGNDTEUrdGIzckNLSGxobmww?=
 =?utf-8?B?WkFLMFhwNlEvaitiWk9sbDEyOUJDRjA5Tk54eWhEUmhHM2RyTjhsdVpTQkg3?=
 =?utf-8?B?SklzQzF2Nm0vZll5Ymx3TG1ZWHBPNnVuNWo2QWw2UE9zKzZWTnFNNUZLOXBy?=
 =?utf-8?B?cUdRdWpnUGNGa0Y5RWVOOVNRL2RvU1JJV0Iya2xWSEhOMWNPSHZMeEIrVFBU?=
 =?utf-8?B?eVQ5dkpBQlpmL1hlaHBXeVpSc1FwSFpSQ1NKQkhGN3cwSksrZ0tFQytxaHBO?=
 =?utf-8?B?Ujk0UTNjUSsvbE4vQ2h6OFpRQ2o5NzBxY1YydEVWVm5zekdLZ3JMNzZySnVX?=
 =?utf-8?B?dUZiYmEyL1FkMW02K2VsU1hFbS9rRkQwQVFUTUxYTTFhNWIxYkxIcEQvNkhZ?=
 =?utf-8?B?QldKKzlUaENnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJoMWRCRGdTVUZNaXQ3MVk5bUNWei84TzVCM1RiS29LQkp1UUVkRzg2c1gw?=
 =?utf-8?B?Z0lpUFNPUjN0d3BJN1h0OXRvZXduNlNtUlVtcWE5N1RZQVhCczZtWkJ6Yjd1?=
 =?utf-8?B?ZzMyYVJrSzRZd0ticGlRd0tLblZSRmpPdE9GMitKWHQraFZaQzV4Z1dyTzBV?=
 =?utf-8?B?NkdpUkYyNHdIZ0E1N2NJT0FoRE1zNEFKUkdxS2JBeVYxSUVxZzlzUTFVZ1hj?=
 =?utf-8?B?ZUFaNi9ra2F1RU5CcHB1N1A0eE55bWlPaFhwZnRHWWFLNHNubGYzOTlpQ09n?=
 =?utf-8?B?V3lGUkJJTGRsOVFBVEdmeGMvY3RBeVNWMDdUa2huc3ZVZjlzS2MybVpKKzRC?=
 =?utf-8?B?d3BLRVlxRGFJODUrWjZ4Y2twVUlOT2lUdis3WFdsQ1pIamV4cFF0eEw5cnc3?=
 =?utf-8?B?bnUzZFVZaW5jKzhBcUhRWDFpbGN3dkZWdnVHbHl3eFVTcU1hTXQxc2U2L3U1?=
 =?utf-8?B?WEtJYW1qdDJzM0ZvbXl4V1RvT0VWYmZXbjdHMlpIMTVISjlpWDhjMy9hYXZ1?=
 =?utf-8?B?WlMwMXFBUHNlc2kxRklaQ0JWV2VxNy8wQy9xSGp3amlXS3AyZkJHczJpNjY3?=
 =?utf-8?B?NkVMYUVOeVFvdFFpV2cwSzRNNzM1anRlcUUzNHZTcUN6NWl3LzNQVjhNMjVk?=
 =?utf-8?B?MnBtQWtBT3JSUzBFU0VXelA3c0NlcTdQRUs2RTVYNXM2WGY4eHlPeStueng2?=
 =?utf-8?B?WUpET3NZNGs4czhZWXltcnNZMUpyRXQxdm14V012R1BiSU13ekx3MnNoQTNZ?=
 =?utf-8?B?bjJDcXAyZ2tvUyt5R0lqcnNFWTROQmZOd2ZqOEtIaDIxK2xOeUZNeCtvL3Ay?=
 =?utf-8?B?aXJzRXVCWnRGeFU4YXcyUk9iZEFJbUhkZ1p3ZzJ3Q2oxSWs4YVhoMmFCTm5C?=
 =?utf-8?B?VEJUV2NORFpodTZyZWtNK3hXSFY3VllyZFZvUnlld0JQMk5TNVNFSXBaMHJL?=
 =?utf-8?B?a2JsTDlnSm9MaWV3Z1dpbENSY3JMek9LQ24vMkluWkJXN3BvRFJNMDZsckla?=
 =?utf-8?B?VDk2N3ZVZFQzMkJRd05oc0UycXgyNnN3QjIzZ3NLbHlzV2VxUWplY252ellC?=
 =?utf-8?B?MHkyWFFYMllGSHRxYnBBaDZiZjR5Q3NIeDlrZVFRdjMrSTYxMHJ5bzg1ajFJ?=
 =?utf-8?B?dDZnajBNbUxNcm1qSWhEc1lkSUt3S1NKM3lhNEZrMG0wOGFyMW1FSWxzeUJ6?=
 =?utf-8?B?VkRDejdnUmRmeW1EKzF2eUY5dG1acGR6cUtsemhreHlBYjV1Q01WZHZkVjNq?=
 =?utf-8?B?RU0rdE4zckVvVzVsbDFXdExtenp0anIwMXhGZ0F4ZEtLZGM2SU8rSGRmUWt5?=
 =?utf-8?B?YWlSY0NTN2Z0bjMxMjQ5SkQrUGdOa2ExeGdhQlVCQXhuY2dDa2NaeWtPYllx?=
 =?utf-8?B?cHNwdlg3TmVsVWtyTGgvekFmQ0pWaUk5c1BmTGttaDVROTlqL3JpTUN2Vjhr?=
 =?utf-8?B?RWsrNVBhUGRCNm5xSjM4cDdiWm0xSHdLS285c1RLL2ZEc3lVeDkrUEg0NnRa?=
 =?utf-8?B?MVJUdnk1RlBRZG4vTlhrSGJPeUdkanpOZ0xxbktwUWZvUGs3ZWduTzFyUzNh?=
 =?utf-8?B?cDIxdkxwemY1c0xIdytNekxrV1gwb1JIMzMwZ1BMYnRaaGxvQ20zU1hIVndn?=
 =?utf-8?B?TVZLdHBIUll3azdnSDJuL0g4VXM2OFFzOVpWQS9iRkdWVTFTS0NiOGE0YXpP?=
 =?utf-8?B?d3N0YlFmNDNNWCtQRCt6Q3BaZlpwRHArQU1DL3gzUFNZVFJuTk44Tm4vdFZN?=
 =?utf-8?B?SFN6RXdrTnhaMjRaTWhod2g4eHJJajFSNXNtOHdlbkk4TGJJcDE1OG52R3dH?=
 =?utf-8?B?TEpuejJZZ09Hc2FFNkdIS1I5bzRpclFHZDFrSnZvVWxGaUNQQ05LRzl0ZVRS?=
 =?utf-8?B?aWxreFoydGtTK2Z5QkQ4NFBsMzdKRjY2aEFtVndZZGM4UWpSSnNZRndBeFor?=
 =?utf-8?B?eWVadFFkYWVnNmpWdzdDVVlOcHBnS1Z0eXFQNzBzdDYzNktyUVU1ZkdVZlNL?=
 =?utf-8?B?OUp4Z2xIUkI3d1UwSndUTW81ckFySWdpZFZrSVRrRGZKMkdzM2dRaktwZkZ5?=
 =?utf-8?B?b1Jud25pVzZQLzJrcU1PeFNSTFdnV3FucXlNV0RKdGY1NE5rcU9YaXRTd1dq?=
 =?utf-8?B?a3lXeHJEZzljMm9PUEE1YzFNNnRBL09qdEtEam93eUVZWXprTURndlk0Ums3?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c6721763-cd48-4b25-897f-08dd1eb336ab
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:55:22.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z4Swsxy4GbdxxqTpXjhFAHZruMh2MtHuWeQnOxAAdfsjLcDmJCvz3lDyvnDO3Zmmh4wHXnjdKZ/5gVeoMs+O6xKAAFMnB5NiOGrd4LD/RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10149

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 68ac4e05e37f..02d8239c2038 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -13,4 +13,8 @@
 #define MEDIA_BUS_TYPE_PARALLEL			5
 #define MEDIA_BUS_TYPE_BT656			6
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.34.1


