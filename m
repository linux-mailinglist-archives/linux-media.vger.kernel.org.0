Return-Path: <linux-media+bounces-25711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3818A2A551
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363FF3A86D1
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01BF22A7FB;
	Thu,  6 Feb 2025 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="LqrAXuU3"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2101.outbound.protection.outlook.com [40.107.22.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529A2288D5;
	Thu,  6 Feb 2025 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835892; cv=fail; b=m67h9FwwONU5ae9LZr8o4gu4/HmcvAiNbsOCSPN0f0ZGsnNeVlw7q5KwCAeRxoIIrNksYvWDz7F2R7qaOkQU/Hv1WMlNfUyZv0LUOcZ8jgn4GHwZoXRkfucWfNvq464ohjOTNuZI1AJy8sf7qzbhsfsCwO9/DLKSMYDHFFy9Ahc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835892; c=relaxed/simple;
	bh=Xo9R1USL/z+d4IAQ/+r4od9eFDQsy0jh6o64qDS6lhQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uRtQ/oNGotGL80tvKkagAINnFbxKhDJUIZ0FvwCBRvj2zmjhaxwlNYnTJ4vdcTMqWcwWNuhw9QqZ1bDdUi6DDkmCl2tDd8DhlL3Fi2fBV6R0tDeWzoachqu6kVy6IV6xLwEDDmNEEb6LHdSG5UMmbMWF2o85/cB5Gb0+Dq/oFlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=LqrAXuU3; arc=fail smtp.client-ip=40.107.22.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpjAW4HlDfVmeak/83TLjugYu3BugMImUwK9zzeXHuP7jkgv1jbJDB55+2aKdwH3SHGCNYuMldCrGiFTzyRkPt/hj5kIQaW3vTaJROG/UqH7VbEQw0XwlUcWoCz8OhojVesA3oeMgZqho6Wo8iHURnHR9Sbh/SZJYqYnhUdQyPkyhBCcX9hmwqT1dBtW3Z90uUzQtmVtZc/AbujlRWniDkPprGz+++Fqv62kJL7yfVmRv+ZUPYe5gj+dmV2Ix2GATdwDJkTHlVKQDvtMxQO7l4XNE8J4sveDDD5XvlM2qt7KsBtxShdFsJIDcFng/kyhBPu7P5IkTookL3wSI617aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HthD4IvHLA6stKJScMCSkGvaVS45odtvgDWcqH1Zbs=;
 b=F6GHDU8WURxg3ThTUxJiIDAib8arzFOhFTBVRfXjb8RHNQrt82BXwK0iDShH4w/0i27MlfnAL6rVLnQvNqLmwPmPo/54NZ8ZIyhUDyork7vv6fFenqPDx7t5Pt6imyjfp6BEpwoo52HSpJd2wioCzJ3+8hJyPjsnTDSokpKpTk4swBJ4B4C71qhWtZO5Q7jmKsEiQIqveINMvBD6Gog+VzklaajJBcQqGm+2kNFno4HqoGxitMaszXZr2BQ318CEKbfZHyZ3FUa3wdvsHd4JWk4DZJJWG3s1ukLFyKmtccqE514DZO4SviL7Aa2s8t6X8e1rL4oYOM+pzKPZOkv3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HthD4IvHLA6stKJScMCSkGvaVS45odtvgDWcqH1Zbs=;
 b=LqrAXuU3wlgcHtMnToFsztUgm3lvSpN6edsor2S1bfUnoYy78GaFobJFxbTqKnGsFPLqq+vRq/tSQ0Qh1qBX1pr85euUnFUtx2y1dyuwyBIYvOjIVycZutE+IBC2oNV/zvMQ75jDEAXbw2DZX7VaeJKh2rJqtAgCRNISqfyhlKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9185.eurprd08.prod.outlook.com (2603:10a6:102:30d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 09:58:05 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:58:05 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Feb 2025 10:57:44 +0100
Subject: [PATCH v3 6/7] arm64: dts: rockchip: add vicap node to rk356x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-6-69d1f19e5c40@wolfvision.net>
References: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=1988;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Xo9R1USL/z+d4IAQ/+r4od9eFDQsy0jh6o64qDS6lhQ=;
 b=DP38r1+/6sg4XotjF9fAxYT39qRBpEHFEZXJJMDg/TdAjCP8mieYZzPmTFOcpRifLijjC96db
 o9lyrgJx4IFD+79RHUhm5pIsgZit8RG7k8ecJ9yWvX5mRbbSBQdOMhX
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 7764b05a-4f1a-4d9b-25be-08dd4694c018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?endwOStuUWZwM213b2FIS0J5U0hacVVsRGw5dWswYnQrU21jaS9ReG45QmJP?=
 =?utf-8?B?TFFUWXJjUlV6WmdoQUZzRjBzSXdrRjI1SHJmbHRhL2ZKWkZiNkVmdDNYU3FC?=
 =?utf-8?B?b1JaS2l2WVNhMHlBbGZIelF5SDBzUnBlcm1GdmhYR1VFN3ZlVmMvcnc1Wmtu?=
 =?utf-8?B?M1k4bzNlQ25NV0ttdlQvcXRuZkg1a2JXbUhtYklqdzJFZUhZdTNheEUzSjBM?=
 =?utf-8?B?R21ucDZrUTVOcllXQmhoZFR0MUFBV1Mwa0ZJeUVJY3J6TnhPVGNWRmpvRTRS?=
 =?utf-8?B?em1TQWFvdDl0OUhIUHhuWkJEcUdwWEVBeHpKRVpuU1QyR3hYWnJTaFVxek5Z?=
 =?utf-8?B?dEhTNVpFeGp0d09iWlBDZnFxQ01rMmdlQzhPZ1hsU2xXMDROYUh0TjJONUNw?=
 =?utf-8?B?U0FjcHRKdVdPYmswRHdzUGJTcGVLbXdOR3VTeUFnak5GdDZOK1pMWXEvM2Fk?=
 =?utf-8?B?YllzSnpLaGtSMk1yc25pcmhZNXVkS3lQRXExY0VseHB1M1lWVER4QWN1NkhQ?=
 =?utf-8?B?RTMzWnEyd2RHejhWOFJ5U1VZOFpMOWpFYUFLQkp3RnZMS3ZXWUdJY2t6YTha?=
 =?utf-8?B?MXNZMldwT2dqcVVFTElweFNYOTdMRWpUTGFNNTRrWGNaVEoxck03MzhHbDlq?=
 =?utf-8?B?Y3NzdlUxbGVCa2x4RnZQNDdmZ01Ccm0zL2daNTBOTVJPalE5OWZRRzdNUXBp?=
 =?utf-8?B?MFBHaUR5T0pRMmp0SFh0bFhBbGZ6cHJZYWNYMExqV3NBdmtOMGhxQU8veUlR?=
 =?utf-8?B?MmlwRWovK1hyS1dxNVBBUVdtcnROaWl6a0dqWDhwMEpDeWtYd2VUbTgvRWZj?=
 =?utf-8?B?aFBBSGVybTIwSk9tUzhNblcvN2hDdktRbWliZ2cybUFiM3lTejVlS3F4RElx?=
 =?utf-8?B?R3hBSmdNaTVsZ01ZT0dGRnUwV05SZklWQStycW9aYWo3d0o1ZHY4eC9FUTVv?=
 =?utf-8?B?ZnlodmFnNTl4cVVoNnVOOEhoNFdTM0drc0trQTJ4THgyVHYzUkVWbFR5YW5W?=
 =?utf-8?B?N1JQYWRaZjd5MkgzaGxlcnE0Mi9WWXBsYnlWZlJsVWRmWnhSejZMWnlEVW9Y?=
 =?utf-8?B?c3RaNWgxbC9Xc2szcnREZ2YydkhJYjdDWDBXVW45Tm5HNWdxek1Fek1pbmVK?=
 =?utf-8?B?aVhCOTZFWHprSEkrN0NUa2Z2ZzdYRkF1ZFpadlFVZHVmeWprWUZ1VDFLWkNr?=
 =?utf-8?B?Uy81QWlPS2VTUFUrZW9XTGp3RWQ5ZENpNnlKeWVocHNOdmYxSzAyODlZaUFQ?=
 =?utf-8?B?Rzk2YXlUakNTc0ZjbVNsbTZEakxKVlRveUVKeFM4eitrQW9BQ0IzZWUxUVlQ?=
 =?utf-8?B?UTdCZ3FUeVdKdS96ZFNmZEt2aEVlSElhN0h3MzZsNE9yU05TRXpTdWhxZTdu?=
 =?utf-8?B?dnM3S1k3ZTFlWHZNOXR1UDMxMnpkN2oyUkNZZitSMGZUWTFnMkJRREdiWmND?=
 =?utf-8?B?ekVKN001Um5ReEJULzhJNGd4a3lkbHM0ODhHTnd1VzFrYlBiV1B5QWFDSFc5?=
 =?utf-8?B?UkVid1FhNlh4STRweUtZYTBibk56aUFQbjVVbDZtUEpkSmFDZ0RBNU1JWkZ2?=
 =?utf-8?B?ZXhYVmtDWTJqdlh3NTdtK2E4VzlmT0JZUkx1cnJiVG9UOUVTWlAwbm9SVWpw?=
 =?utf-8?B?RE5POWk4S1NaY2lKRkxrc3FWY3RwOW8zRzYvaW9iaUZwL1ZmRnl2ckRBblFy?=
 =?utf-8?B?a0d5bm9hdWtuOG1aUXhjQmNHanFzT2l3aEhLaFNzdzJMUGw5SmRobjMzMXl2?=
 =?utf-8?B?eXc5Njh3RC9tUmNKdlZsVjRCTGpDd254ZGhjdk1yTkxrQVorbkE5SVZJdnRR?=
 =?utf-8?B?OWZwd0FwMGlIZytocXhReVQxSXBXaWRFcEpKekszUE9JQTRseEpianJvaVFj?=
 =?utf-8?B?TjBqTWJ5NWRvanJNTHZkamtTK3dZd0c4MVp4UWFacFVPWXNiZDR6cHg2OXFp?=
 =?utf-8?Q?88R3jlXsUFbdMWKqtFK/aiykHRaX7bIp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amlQMkZId0RvMDE5cFlCc3M5NUpoVzFlN2R0ekRMMnF3L3p3NURhNzQzWmIr?=
 =?utf-8?B?Yk0vNzQ0L0RCaXBMRjhFcnRqM3ZyVVZCZFo3NEFucC9BL0N2bFByNDYyZlVQ?=
 =?utf-8?B?NVowT0w3cTlBOGtwNlVIUHZJZzg2VWVSUlhRY285UWJFb3RsOFduZ0R2czhW?=
 =?utf-8?B?V2VwbDNxb3JoSFBuSEhlTlRJNElzUkc1N21MT004TEIxSE1xQWlzY2ZwcWJ0?=
 =?utf-8?B?eWJOdzJPTWhIMXBWK0hqbzFUU1FCV2srd01lQmpsSjlWSTVJcUVRRFhFYWVT?=
 =?utf-8?B?RGRHdElETTlpWjFURHE0ajJVcnZFVGtqNU11SnVnUmJRVzNBTWV0ZGZQMHZ5?=
 =?utf-8?B?MXZLZk1RSXZRWU9rdEcxeS8yRnFISDJ4cnQwU2phc2xWcmQxRG9nTVkwYit6?=
 =?utf-8?B?d3N2b0Y4OXl0YzRROFBhM2I3SVdZcjA4SHppallvUUhTUXZtcjcwSVJqREht?=
 =?utf-8?B?b2J0aFJLc0xDS3JTL0ErQXQvT0E2U0V1WEFRY2JjbFRtazRCTGhYbzR6VG9H?=
 =?utf-8?B?c1dpN3Zaa1NWR1VYeXFTbE96UCs3U1h4RnpGbFZ1VUpKNmt5cXB4bFBXZ3Nu?=
 =?utf-8?B?SCt4V0ZLWmUyanVBMkN5TGlnQlNVbkJxQi81Z3daMFVvdVhvZUdEbjV4Njdi?=
 =?utf-8?B?dXJGUytyRlNDanpqcU5MdE84M085dXZPbzRDU1FndkV5WjE0TnZVWDV0eTNu?=
 =?utf-8?B?S2NmcXluSHo4U3loUTlEQWEyeHdVSS92R2FieXhuY0hzZTVQR3FwVnhFbVFI?=
 =?utf-8?B?VHVXNlNmWkV0K0QyL1VtQTVjbXVnSm9MVHpWd0Z2bWt6dUdEQzhyM1FsNjJk?=
 =?utf-8?B?UloxM0F5RXQ5aVVCWE1RUGZRbnRGQ2FjdE1idC8rZE9JbHJxckg5Unp3U3Aw?=
 =?utf-8?B?VW1OTmh4VzZ0d2x1VWxISGN2UW1xeTE1elZrN2ZCeTNERkg0UzlITkNlUXlV?=
 =?utf-8?B?VjhGZnlxL1kvQ2ZFVXpjK2hyaUpoT2ZSeWM0VjBQWDR1bUZuWG4wRlU5c0Zp?=
 =?utf-8?B?Um4wSEl5VG5NTEdFY2ZzTGlSN0ZDZThUZk1kaFJGOVlrWmY3V2ExcUQ2b3Jv?=
 =?utf-8?B?Y3FUekpGRHBHWEdLc2FyeGdudVVIa2dCQnZxNDlIM21ybDdFYlU0T1NYbk9C?=
 =?utf-8?B?ZXlDaHNRakd2Y2xYTEJoMFIzd1BzM3NCMEtvUmczYWVqRTQwWXI3R3JiKzN6?=
 =?utf-8?B?QnIzbGZBSytKc3c1cGRTWUxLM1dUd1ZBSFZNa3VMNVY2V3FlL1hWSWxDZzRE?=
 =?utf-8?B?d3MxMEdTTEZjcm1mdDZ0WUZqU0ZJYU45N2ZWdnpmWjRyWFRwTE1BdjBwc2sv?=
 =?utf-8?B?TU1ON0d2eTJTa1lFSXY2VFhveG80am1HOUNpYWplaHRuRWRzOUJXVWxKdkh1?=
 =?utf-8?B?WXlLZkJCNVhQdTZCQThQVzFBcEZyeExMSVJFVzJQbXE4b2paU2ZFRURvN1h5?=
 =?utf-8?B?bktNa3NWVC9DL3lDaDloMnZEQ3RVKzhsaXI2eGw3VGV1WGZncDEwcWdwNVpS?=
 =?utf-8?B?QUJtSEVLVlk5NFpaUjc0YmN5L1BFWTZUM0FqelJHak5kZk43NkxpWSthdkRT?=
 =?utf-8?B?L3lJazlFZVZ1TU5wUkNSQ0JGNm9iNExoSERNWU8rbU9HNDdzMkhiSjdZYmth?=
 =?utf-8?B?RCtLaXZlYUV4UmVNMEl0SHNrRG1rQ1V0QmUzZU5zMXdGTlFDT1hlY0NEQWJK?=
 =?utf-8?B?b1I1cmdMcmZpZDljRFpWbE9GWGtzR3Z1cGJMQjQ2K3A5cUNxbFh6OFNwYnla?=
 =?utf-8?B?OVFRemNzcjhhTGVwQVFXNnVqM0dnU09BOXZDdzFVV1FIZ1JTL05zck82U3Q5?=
 =?utf-8?B?U2I4Yi9MVjVIZDNEdlZGazUyaEE0ZkhXYWNVbTdkOEdYZll4MUQ1WHNhR0wy?=
 =?utf-8?B?RnhPWi9EQnR5VXQ3L21DN2JWR3QyQTBSSFJFOVlmUWlWMDZueG5tTVRWUVhJ?=
 =?utf-8?B?cUVPa2Jmc285RGhEVkl3MmZQT2twcVc3MVBEblNjeUNURXc2akplV2tLdTRI?=
 =?utf-8?B?RXZIcXBzWlFNanNnWjQrZGVlNUlMVENmNkVkeE5taW9FSGlPaEppVG5FK2Vq?=
 =?utf-8?B?OXB3VEV0RGZaQ2ZPTFdDYWVzVmtaa29JR0JjSlNwbjBJdnlnVVh0dDF0UWRY?=
 =?utf-8?B?ajJNL1IyU1FlbXNWRnZzZjhRMGQvT2xJd3dodzJuWDl3SVJ3NFlUL29vaHZ2?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7764b05a-4f1a-4d9b-25be-08dd4694c018
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:58:04.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjMpqVfKjtO38JAhphIV/QP1DM+HrafwNA/JbEzPUcBBSRCbaZ6iRqlwVT2kRjLcCNiYl+E1WSYaUi5gAq3lyjmx3nUKxln/J2kTuJirG4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9185

Add the device tree node for the RK356x Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e55390629114..cba5092dbcea 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -553,6 +553,50 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	vicap: video-capture@fdfe0000 {
+		compatible = "rockchip,rk3568-vicap";
+		reg = <0x0 0xfdfe0000 0x0 0x200>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru DCLK_VICAP>;
+		assigned-clock-rates = <300000000>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+		clock-names = "aclk", "hclk", "dclk", "iclk";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+			 <&cru SRST_I_VICAP>;
+		reset-names = "arst", "hrst", "drst", "prst", "irst";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vicap_dvp: port@0 {
+				reg = <0>;
+			};
+
+			vicap_mipi: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdfe0800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdfe0800 0x0 0x100>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3568_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	vpu: video-codec@fdea0400 {
 		compatible = "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdea0000 0x0 0x800>;

-- 
2.34.1


