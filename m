Return-Path: <linux-media+bounces-26345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD9A3BB68
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBB477A7215
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EFD1DFD91;
	Wed, 19 Feb 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="JiXN2kMH"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BED1DF26F;
	Wed, 19 Feb 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960211; cv=fail; b=BUuh8Uw0fknWTVeuXFf699nrTNbyAKdHCaSxL2ZrELDgSQHtzMeR9tjjuT7djF5YPH08iaeKe0yItzMLq9DbQocQtuGQmpebVz4ErXREigaDrBJ2snztUAT1SYTWUzeh8up5aumHwHv9Jk9CbznHVa7UMGGVSG47OPmvkb5Pb2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960211; c=relaxed/simple;
	bh=Jwfb9ka7Co1QU4YFQj1bP68YHW3VZLAiB9reUK6eW8Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kXW1vzzliYy8Q+5adMgK/GSwtZBC0BouGn/YVkamr8Q6dzXfsxSJurSEaH024VexI86VQzIark+zglFmkO8yOVjeM/v3VlcAJ/Dxskty0UIP+mN+J2v0e6+Z4WP9mVywPRvV2qNbsklX2GfpobpVsiPIWN4QjlmFS8ppCmDZW8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=JiXN2kMH; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWQD5bO2EnSloBtvW7a5K+V4bkk2XJdyfS8o4SoDW5st5IT+uTAqyLmyT1/Tb6MhJdqAf4eRPW31+94geD0ceuASV821who2ipWBfIHasSfuHClLo+ngvaebdAeejONGj6zxE98ftP7pClW4CV494e2ND1CJdWDuELyuACOQD5S+y/vdz43noyI+Kl1DGAf17/W5itFk2Yj1uuC7l4DUApDxNoUg+446YSVUxvdll5mcVgDdYo5D0SY/Oi/86utXtPyCotsuKG1OsjKNcNbvxwje69sxLtai9YmG6WeIAGGgtMXVq1uJoXGRyJ9Tdr2WZyEI/ttCie+hW4dfVoV55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj6BxCl9fpw5Pry04iUoEkwcUhf418Q3mJRPppiteaU=;
 b=Vx9cfGeSfI845iFnjzqi+dCixmrdlYhT8OPay1q6iYiWjawpnUmjMOTZlmCfAJXgvPFxs46vixs/aFrCzcjQe/t+/DypTSCe6n7xwGVBv6TciFLv5UudKW3g3DMMzV8hjngA2E31YdPD2pHuVhV5ijKvYe7LneRBB8F46tXrRKEd9MCckAH0b49607fccRL8Ey67ZPnaGYxczCuXKx9ZT7oH6RvlBOl255E11UL+MtpTN/mJE6VV3C+v4L5TIDad0U8RGwctEf1SeDsDjCrmPLMF2pjDYI6IRNYyK9hJxJvGgVnXlFO1onXb7AtlbNs9zZelXQqqMItJebx7AA+wVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj6BxCl9fpw5Pry04iUoEkwcUhf418Q3mJRPppiteaU=;
 b=JiXN2kMHesBs1WQDKr8sh8G9JWU6f1UQI1VSeESMK0AwsAOVJiQd7DO5ueJ9gB09jwp2RHdx0srwym3I5/Hb6t6JDXwvQp8C0eJJQ23PJQ4rHerejJdADyiGHchEk2mvnd+NOHxQCpxzXq8wKv4VOVv06L3JzoA/xIVHR1zOvU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:41 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:41 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:32 +0100
Subject: [PATCH v4 01/11] media: dt-bindings: media: video-interfaces: add
 defines for sampling modes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-1-e906600ae3b0@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=948;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Jwfb9ka7Co1QU4YFQj1bP68YHW3VZLAiB9reUK6eW8Q=;
 b=OKhYHz4+QCzaXpSdhkorEkpRvpMtP7MzvcayswcXTbosjQAFqmTdmVSfnZh39E6A7SLSS54HX
 wGMIQoRGVvpDjepRQWBQNRU59+9+h1B4jpLr6wDZGwXxqwd3NoDapEq
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
X-MS-Office365-Filtering-Correlation-Id: cd10669d-50a8-45fb-0666-08dd50ce80b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTEvUThXaS9ycGMwTXUrdUk2UG9DK0tGUkxBemEyRzg0T1hGWW9QS1d4Mm5S?=
 =?utf-8?B?bWIwdEppM3pwNHQrMDVKSEY2Y0tlT3d1eHBFYkF2SHc1S3dzVmgvYS82YUlt?=
 =?utf-8?B?azBtOWRCS2pLR0M2Znpxc0E5NHA5aHYxeVFXd1VmQlRCTE1vcmRqMEhPbGJa?=
 =?utf-8?B?ZGFyNUVhWCtLWlR3aXNJaU1QcnREN2JzOUl4aTB6dVRqRDJjdlZRRWtzakRB?=
 =?utf-8?B?RHNhZzhlN2k2aENlQVN3aDZLZUJZKzQ5Ti9aR1ZUbTJ0aFI4TTdaU0duZExO?=
 =?utf-8?B?Z3dKQ0x5V2puVEF4S0tpVW8yYVM4bW16TzZxMUdUbUlYbWU1cXlMUlhvbkt0?=
 =?utf-8?B?cmg5NVVCTE9kSzl4cXFTbGZEQ0RKckRuYTVzeGVJdjAyVWhpZEQ3TkRITVZT?=
 =?utf-8?B?WURmUHd0NEpNRW11dmFsMi9xUGQ5djlhV3FrWVdCOUZXT04rNENIemRrOGxy?=
 =?utf-8?B?Y0doU3ArVHlzaUlnSG9CbVhicC85UWxsTi92MnJWdXRYaTJzYU00Ukk4NDBI?=
 =?utf-8?B?REFldzVIenB0dnh3dTlRYjlXbXVxRk82dkU0UUhOeHRqRjQvUmtKdDNNY0tt?=
 =?utf-8?B?ZWk1RUNtVE1ITjJha0wwUlRTMHFpbWxoWFZnbEhqYzQ1Yk00Y0hPZHFFQlgr?=
 =?utf-8?B?R3ZiVUxMZlBSbVNyUC93SDNtbFVnd08vcEQvZXZvb1Fld1dzMk5HcU5iREpk?=
 =?utf-8?B?RmRwY1ExZnV0S2Q4ZHVLbDZXYzFCdHJ4U3l3aTFRK2w5K2RnVm9rWkRhVkRP?=
 =?utf-8?B?RUZOV1REblgreEtnR0c3MEo5d2pmNElvdDZYVXdlamFET2xuSExLZVVEcjdy?=
 =?utf-8?B?RnIrcWlQSXFTbXN3QVhWYVRheG5JWmo5NjRkS2trK05QZG5laWZoYmFMUFoy?=
 =?utf-8?B?UnZrUUkvaHdCVFBUOW1yemZPazFnZmVUZ1V0dExaR1hhNnRwS3VpNTVpc3Fa?=
 =?utf-8?B?YkRod0tLUksrcWJFMnJoVVFScTQxTUFKUGxadnIweFlCUldyM1J0NjR3b3Fv?=
 =?utf-8?B?L0JHcGQyOVRWR1FNMUtGeTdqN1h3UTNYMzVIdHFmVkFrWUpUclpNa2hoVCs2?=
 =?utf-8?B?N0RIT3QvaDc1Qmova0x4QVVIcXhzaHhTa0VNbU53L3lqeWo0NUo2SEptWVB0?=
 =?utf-8?B?dU9pY3B2TmFETTBUSE9EKzZDUGFDbWpGdy9BUy94emlUUVNva0xVc0pCR1BJ?=
 =?utf-8?B?clBzbk5oVjlmUlI3bCtmcG1uc3BuZXh3ZW1RcVB5SFJ0aGJBSEFHWW0vWERO?=
 =?utf-8?B?dlhqM29mVkU5dG0rTHd1ZDA0UWg2ejlyZkVkQWNqb0FvL3ovSGpVckdidXBi?=
 =?utf-8?B?QXEwZXc1VWVoTEpqajZiVk5Hc1BNcGVWamZzWXBVU1FrVFRhQUd3djBpV3NX?=
 =?utf-8?B?QTdUVXNpSGJ5Q0dXd3hyOXorUmJyQW8yVGJWNEVNSnZUZWdyUzJLVDd0bG5Q?=
 =?utf-8?B?RUpTZnRnMkgvTWsrTUJpa1h3Q2RDbjFJNmFsS0NtZ1U2WFdpK3FXTFRiN1ZS?=
 =?utf-8?B?S2ZKaDlPTnpqeExwQ3lOOVhwTGhCSEdCbFJqUnk4UXNrWnd4Q2VMYlhHck9O?=
 =?utf-8?B?NmdvY0pJb2NQVTlnblcwVkhIUkdQRFpuakVMdGpWMy9TVnBNeDhNOGJVaTdl?=
 =?utf-8?B?Vzc1SHBmTW5FYnRodkdiWi9rbGM3bURsRWZINUlyTWJsQjEyWFBuQlhqekFu?=
 =?utf-8?B?N0RMbVlQcFFabTJaTEdZZ1ltdG42QjliNGtvWWpEUEg2NTdqZjI5WEpyTXA1?=
 =?utf-8?B?K3hGaFEzdkdQOXJEV29pdTJqUGdJRE9pZGE0UXZNN1dNcitNRHd6MHNlMHhM?=
 =?utf-8?B?cHdHVUxLdGc4VUV0aGFhRDh0RFBEbnRxbjNsbUFYelNnS0Y0L00yNk5UMzV1?=
 =?utf-8?B?Y0hsa0pTajU3bTdHNnBYQ1lJdW15ZFR5R1NlcTNyT0M5WWhLc2xDaXdRQVgr?=
 =?utf-8?B?VTNxY2s2UjI1OHpQNmRjcEkxSUVPSTlRNTRzeU5NeUduME5ZTVpLTEhxOGVT?=
 =?utf-8?B?T0piWFZSeW13PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG56SDRvdGVlejAzMVB2UU10cmhlcHBRcGNSdXltZHB6MXIrd3g5TmdQSkgy?=
 =?utf-8?B?YkJreFQ0RjZYRk1ib0pTTzVqMm90ZUYxMVluVnVQWU1jeXpTSmltYmIzRjhX?=
 =?utf-8?B?SWxHMXMzeFhmczh6QWdnNFVPaWJaT1ZKRlJpc1doWmN6ZnNKT1BjcWxLeWZR?=
 =?utf-8?B?MlpoRHRKbjRFQ2JMK3NJMGZseVE4MVlkclJkU0FKb2YwNVlOWjV5MlNxLzhy?=
 =?utf-8?B?TVB2cjBJZW51Yzg0L0hxR09uSEdoU2FEMFphQllzRVNnd24yUXhaUXI5S3RQ?=
 =?utf-8?B?bXFyV3lZdy9IeUlDWlMvZjNUY0VlQzRCclJodnR2OStrbFUzQ2NHdldYWTBw?=
 =?utf-8?B?ekhzL0tzSU5YR3o3dUpZSVE1b1pEQUl1OTBRN3ZiZW0xbENwb21JU1piZ0hC?=
 =?utf-8?B?L0VrQjNoRVBlTGt4ZWN0cGdrK05wa2gycXdSakdXekZBUnBncUc1TFlGbnN5?=
 =?utf-8?B?b1pYZzdNMTFmdjZ3YlgyT2FucXVMUG5wZWR1Y25pLy9HRFNuV0hySllvSHNp?=
 =?utf-8?B?MExkeGFpKy9iT09CcFVCd3JkL3VnZW1sTUMvNVF0QSttRTlINDNGeEx5VnJS?=
 =?utf-8?B?OEdYLzdGQlNuY3JlNnFOWE5QR212TFh5L0RWTFVOU0luN1VGWlpuKzBiWk1K?=
 =?utf-8?B?Z0psd3dNb2RRZkxsZTBkQXpqeERZcElraDFBcS9MNkd5M0pIT213S25ZaFFV?=
 =?utf-8?B?VDhoNUpsUTFIRGcyZ2tvWVpNcVFySGNlZzRnZWx1RHFuditmaHVMblhqQjFt?=
 =?utf-8?B?aU9sMEljWmh6THF0d0w0eFhpZlkzbys3R29jMXpLeWsyKzhQOGYzejI1WUdX?=
 =?utf-8?B?ZXF1aW1sMWt0Q3YzdDlEVU54V0xhWnVGSUliV2ROMGd1M0tDalZ3KzBmU1gw?=
 =?utf-8?B?T05TYVlaQVdCNUJtVUVtWE90TjlXTVpwbW9iNWkxa3pJNjdoSVplMmM3cEZG?=
 =?utf-8?B?aDBITzlGS21CZm5GeVQzQTNOZnp0VGVnSU1NalUvaUtwUXQzQ2FtM0dNdG1Z?=
 =?utf-8?B?dno0YVZKa3dCZUQrdmkxb1h0RHdjdTAzZFhuaTgzK2VzOElrSkNqcXNIZ2pk?=
 =?utf-8?B?UDdJdjFYVmhhTUJEeUhqSWJKK0hRRWc0MW1XRzA2MHpOMWIvZ0ZMZVA5Z0gv?=
 =?utf-8?B?b21TVUEyUVdab0tISXJnQTRrVll6Ni8ra2hLL3prbXhIZzJFd1p2bVhMZmJR?=
 =?utf-8?B?RXRBMWdyNDZqZWFzdS90VTBQeHFCa0lzcEIvSFRrTnY2SlFuTXh2YWxxcDQ3?=
 =?utf-8?B?WHZXaG1FMTN4UlhUVGRieVV6SWlmS0duU2VVR2xSRVdTTVY5QXhxZzc5WkpP?=
 =?utf-8?B?ZERHWE5GRHdDZHVvSzZPL1JUUFFuUjdjNHlteUpudTRtZHY5RTMrSXJRUVJQ?=
 =?utf-8?B?ZXBkM3BmWk56b0RGYUZNdVFGaWdzRzI1dC9wYjRMMjhNUG84c1BpcDBoTWxP?=
 =?utf-8?B?VnhCZG5HYVU4Z2kzdUljZzlFalNmMHRvRm9HTXViTFIwNS9na3Z6bExBZXpD?=
 =?utf-8?B?cUNtazR3dU5NeUNwNWk2ZzVxRlBMTVh6TU1UTXVaRlIrNGpwaHUrMk5OL2dz?=
 =?utf-8?B?RVBKVStYM05sSzJoVk16M1Rud2l6L3hJOWZsS3NmMmlURzNpSEo4TjdxcG5h?=
 =?utf-8?B?QzVNb1hwOVN2NkRoWTU2amExNUlIV3lIWEpnMEhMaytkSEVGQ0FadDBsZzhu?=
 =?utf-8?B?Vk9VeXJoM3pwcGU3RmRNNWpGM0MvbUJQSjRBNkE0WVBpR3duTkt6RU1talRv?=
 =?utf-8?B?N1FSemxsdmhVbUxUNEQvbVF2V0FwYm9tR1Y3Sy8xUmowejJQNHkyRlNRMjdR?=
 =?utf-8?B?R3lFcFltZDhSQi85Y2dScFVwbWZNYjVYemo3RCtkZ0NYSmlMaDhVTW5QRVBN?=
 =?utf-8?B?ZTFXeDc0SWNKeFdBMVdLaVpjWGpSV0F0d3ZqSGNKVnJHdzhveWVicUVLaHg2?=
 =?utf-8?B?V2hLUWpNSmFSQVo4NnhWT2hpSmdKaUpXcFdOamN6OHBrTlVXN0hFQjlMVmUv?=
 =?utf-8?B?OWtZSGhQc1hnM29hRkQxS1JCOCtvMlZsTXR6YzZpWjc0a3JSa2tvTVJzbHlV?=
 =?utf-8?B?YU96TC9zMzNjYWtBYm1LY2lwOXQ4WVpyOWEwVkgwOTl2T0diSnFVUEpmRzRQ?=
 =?utf-8?B?ZHZXajl5d28yQ05tbVVXK25oSTFZU1JTUU5Eb2N6Vi9vUDdUWTVJL1hROEh3?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cd10669d-50a8-45fb-0666-08dd50ce80b1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:41.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFsZOZPSfaXxjVVrDer6Y/FQewzXkbNmLQOy38ATNHHAd/xDoX9rzRO/aI39GK/bXOYyixb096Eq0b5V83Giib8Ua/0QNEUu2EKpsK3NLgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.34.1


