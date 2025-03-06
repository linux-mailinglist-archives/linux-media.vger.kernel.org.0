Return-Path: <linux-media+bounces-27776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36002A5520B
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6D9188BA8F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305C826E969;
	Thu,  6 Mar 2025 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="uLikhVFL"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022121.outbound.protection.outlook.com [52.101.71.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778FD26BDAB;
	Thu,  6 Mar 2025 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280198; cv=fail; b=XonE0Z03Lr+goTtyV96D79u/9JEgFbu6N64SQXO08zmyFBBBNqZTNBRwdcf8KmDifQCZr9p1A15CK6Y3yo3viodxewtYxZLwxtG6yFsY710Sj98+OB0xBefs+hE0YMnaf7U5fyvmIP5A4ZaVLFDKoV65wGuP5mWOyDcCipK9Dwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280198; c=relaxed/simple;
	bh=JMzBYOKMxZG1zypK2Xw9X9mgiNJ0ITgNFxK18RCULX4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hQijz99sTpSngFj/J18PEt+MSZuHjOz6YhvYurvRl4MBslWirsLJ/1McU7XAHZGJPQZ2PleJCdekMhzOvogj0OrRhQHypara7jFcOKQpCe2tziziw2boevMc4JbFa0VdLcr7x3Oc0HwvUNn1/lvjr4q/bcC4eqaknuBd9KSjhJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=uLikhVFL; arc=fail smtp.client-ip=52.101.71.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyVClWE48uJEZ2tcGSeBHvgQx9XJcFbainAV5EkPDU2L/KRk3g2cAxD2/XTjMfooT7cLzUPB6+bip4P3zn9zuKes3TA+XuEdJUwxqxipSDkLv9w8pztLsKz7fRGdyGxq+10hCB9c+/n20nenomX2W47z4kJjNw6jrkTrx78jU6oTawXRhBpGsss0ONaSttp6drbInt+ZB653xn7eTv+7m2dT4CFVPLb3K+4sM1vPbGkEjMm0B+l2/66vu1f9Bhc2cB7ePuf6daJdzxgdP+dZBlmj8N5tlklc0ruq6K+EbqtX5iYo1FbqoaP8SY1s9H7c6ctwftU8sCjcen4dHQQjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GADnoYshuvKf8MjgcGBM075hZ+scoIrwJ3loAJXtSZE=;
 b=EXpmINVKWTHx6IuS5/OhQUJkXKXQxyiqgMb9G37SzQaVLYA+tvIOBJgLVoBCJi0tZHxpeSoSsBZvmK0+nUu32TxhEAS6+8ApvozhPNxfmLlXNcp7HyJ4z0ZfJnAeMw4E8JnPRW0EPpqhrnh5GIi2as0s87WxsTD72e6sQrnPh0Jx7YSo+RC+hqQLbe7+lZ6SAwFskIvjkAtAyVlnLyINH6bgOdZzXU2ICEKqcN+KanS2Tafgb5QmZJL9vat8GXXcgBYXkjt3jokqMX8+OLwRb3788mEQ0LYpwRa+Q7Xptr8WNI8l92nH5vnt6OQuZLNKdYRO0ZeX7a1c5XGXq4w5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GADnoYshuvKf8MjgcGBM075hZ+scoIrwJ3loAJXtSZE=;
 b=uLikhVFLYt9PMW8eoU+/MTkmcLcVfEK7Yb3pp6NTjPDc7POb3IVviyHUVVEvbPW9Cse8LG91cdjO5RM4tKO69GuSAIsaXi9HDKR6NtGD1eO8uz0i7KSjJYhEerXAlNTW9ytuS2oLaAbOj5vG0BlU91pqCayyViUhVwluGklD5ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:26 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:26 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:12 +0100
Subject: [PATCH v5 11/11] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-11-f02152534f3c@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=1481;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=JMzBYOKMxZG1zypK2Xw9X9mgiNJ0ITgNFxK18RCULX4=;
 b=sJ2BqVzYxUd8+VVbsTi2B1SUc7WGN/9qqX2kTeEKO3U4U7DX5kfMFrxtGSHTcYZwRU+DJt2zv
 A6ff8xos26eAvhRxRsrA3+R3r4qVYpw2ea/tdUyPazTNtNAnQ5wWLwC
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
X-MS-Office365-Filtering-Correlation-Id: 514fde20-913f-437f-02f6-08dd5ccfd567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUtuOG9YZ3dLMHp4UlJzVTBiZ2hkdmxyVzlrQXdXSWNia1cyOTI0eGlWb2xo?=
 =?utf-8?B?Z3Z5YlI2K2RIY2pieHVsQ09obWhEaGk2eFRyZ20rWGd0MGlEOXI3YWFQVjZ6?=
 =?utf-8?B?QitDaDR5eXh6ZmZBSThkVnZMTzFmeDl4UEVFdmhmNXV1d1RNeWw3V1dwczQw?=
 =?utf-8?B?WFJUUDZCak9GVlVNejFaN2VZeDhxR1dvYUZPRWRyQk0ydTh0Q2JEdkJrMzRS?=
 =?utf-8?B?dlczQnkzMW5mRFFCenhxQnNHVG8vcWMvT3JMTHBkNG1LWE9ZYVdLZDZGUXpr?=
 =?utf-8?B?VDFRdjFjdnBhWElmZzFiVDJGa1hGbDFTdkdDYWVEWk9LeHRtRi9DSzVIcFRl?=
 =?utf-8?B?Mm9FV2F4RDBFRTVKQXVvQzg3S3hBd1h2Rk1DbEFRdlVHWTdwVWsrM1F0TlJO?=
 =?utf-8?B?clZTTXhPRDRobGtibUFEWTlvUWt1UktzZGJlaENONHFiazFtdmJWeTNlKzAz?=
 =?utf-8?B?R2w4cUtweWRzbEFLVENVQnBzcWxndFFobVcydU9RYTh5Qi94bGMyS3VzR0hh?=
 =?utf-8?B?TFdDcXMxWENoMXk3RlRMcm9LSGFrTmd5d2t6Y1ZIdUlZdFpvZjZFTmlKYzlO?=
 =?utf-8?B?bGZkRiszMEM3RXRzUWhja3N4S2Nha3VnQ3djTXpJb2k0eWYrT2lSR2pFUFVD?=
 =?utf-8?B?ZHZVcnhqamFtZ3Eva3pYNTIxQkN5blNVWkpYQ0t1bkU4RzJFRGdRTG5jQWdB?=
 =?utf-8?B?SHpJb040dkVUdWlxNzVlTW1DWTVrYmpSWmtmS2RnR1RGVzN4QVFGZitKMDZN?=
 =?utf-8?B?czFLa05ESlJpeUllcWxiM25GNUJyQlJTcmY5N2czZXJFcm4rM0tZNmV0Z0Zw?=
 =?utf-8?B?Z1FnVm5MTGpEZnJrYVkxOFpvYzNUaEl6ZWdHRUdyTDNLSnNzeWx5WllYMjdC?=
 =?utf-8?B?N2VURGMvZjVJekZlMFhma3JWSmIvVVJpU1BpbFdoOGJRSGoxeFdnd3hHd3A3?=
 =?utf-8?B?NzhxVlFxSTdtdVc0VktRK3F4NlRLcWUvYmRVdDlaWnI2UnQ1U0FHcWdZVHBp?=
 =?utf-8?B?Ym8vd0poeUdrdnlqNFVSZGRiZW5HS1NvNHFIK2tsajh5eWtlNDBkdHZiQnVn?=
 =?utf-8?B?TC9uTmxiaG9lUnF3eUV5a3llaG9Yc1BmNEV2M05oRFR4eEErblRkWi83cWhJ?=
 =?utf-8?B?QWM3eXdFaWFrRWRZOEllY2R6RERBOGRrbjJoUTFHVXIrTGRwMGVEN3VwWFJP?=
 =?utf-8?B?Z0xxQ2FwckhvS3RIdG5mampsRTFPTTYzdkdPTTQ4dkQvWlJNSHk1VXdXaW94?=
 =?utf-8?B?Q2NxaUFKcnRiREQ4VE1NUjZYdFZRUSszOHlJWThlWFNRRUoxUm5TbnArdWND?=
 =?utf-8?B?dVhOTE9IQVoxQi9JbHZzeHp6ZXp3WllBNzEyTDZBa1dnL3JNUnJsNHpnd1hP?=
 =?utf-8?B?akVvdEpub1R0TnJ5aWY1QW5ZNkJLT0EwK09UOTdPMmN1SmlIMm13azdBeEo3?=
 =?utf-8?B?SWJDZ3Z6Y3RhdStxTzZweTZwUTBoOGZMVnhoZlBMZFVKcmZZUzNjRC92czhW?=
 =?utf-8?B?ZXNsSGtHc0xPazZ2My9QSW0vdWZuVWhYZm1zVUt6aCt4NTRJUUhqZkpOOUVB?=
 =?utf-8?B?R2VkSHBtaFJJMThUSVpXWFArVHN2MFlCVTJlVVdwMVlqa2xGdnZZZUsyK0tN?=
 =?utf-8?B?eVZQNmJUeVFRSW5TcDFPL2pjTVNEVHUxaUo0VW1BZC8wb0tsTWFzRG5kaU1M?=
 =?utf-8?B?RXZjcTB2SVZJWFVpSVZGYkdkbFBodCtYdmdQR2dKWTc3R0kwWElzY3AyZ2tw?=
 =?utf-8?B?RG4yb0N0bVErNE9ENzR2Z0ZUUnpYNGRYc1JocmliR1QwRzl3OVF4eVFzRFRk?=
 =?utf-8?B?a0hRT2k3K1FVNWFxOFNhclg1cUJtekNGU01hQmFlQTNsTHZwSFBYc2ZFQmgw?=
 =?utf-8?B?WU1EbDRNSzBWMkMxeE5Cd2cvbit1RXJadHE0eDdXODd5UndieHB5Ykd1R2dv?=
 =?utf-8?B?QS8yN3YvcjNQN3d6blhJc0I3Q0tNL1hKYXNEdXViU3EvdjFrUFlIWjVnWDdD?=
 =?utf-8?B?dTN4MDhrWWFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS9HcFFON1FJNEFNVzVHcnRiM3RxaUllUDY2WDloZHZVYzdOQ0hpYStTeG9w?=
 =?utf-8?B?WXdLZ0NaeWhERXBlL2x0Wk5HWTMwemVqVmUwTlhncXVZcFVJU2JobjFKR1hL?=
 =?utf-8?B?OElRdHZqRVpCcUhEendFWXdmTEJMbEhUVmhGNTZWWUNaNVpaY2RKZmxYVXgy?=
 =?utf-8?B?c1Z1dUZ1WEFaWk9SRDRTeVJQSEtYbXBRM1pkeWQvWFhBaXNIcVp4NFo3YXk2?=
 =?utf-8?B?VHBCTFFxbS9VbW9nQkRmb20yZEswdnlVZjJXMEIrY1Jrc3IyYXBNNCs2eDZ2?=
 =?utf-8?B?QWwxNnV6Y3VhekxuZmxEOWZpZkp5M1htaHZxREVaYXFaT0RsUW1NcHFxMWhQ?=
 =?utf-8?B?UFJmazJSd1VINGZRc3o3V2hMV2JiUGcveThOVkEybzlwb1U4VW9Tb2NUNEVD?=
 =?utf-8?B?MUpsbFJZMG9tYVJIR2k0eHhsZlRCY2kxVS9SWjNxOFQya2hQaFVjV3RGVjky?=
 =?utf-8?B?dzZTWWRNQTFMdm16cXBwOFZxWFRrQjZjeGE5RTNjbXl5SFNzRUgrdlNlQklq?=
 =?utf-8?B?aWoyUitEOU5PbVpZUGlZYmcxNVpZbGl6NEZOLzVQUmpoNGJycWFPdG0rVlFE?=
 =?utf-8?B?aU5zMzkrdDZSeklIT1UwQVVySzgxb1ZDQ2dBVkZMeFVLVzdZNG05M3VZUXY3?=
 =?utf-8?B?TFF5V1J4RHVQbXQ4U3ZObWtqeWxNS3BvdlRvK1dHREdHSHF6aUNVVllSQVpp?=
 =?utf-8?B?NmwyZWNtVUlpY3Y5T2RlY1NURERPVDB1LzhjcUJYcWJTYmk0clJxYzlqN0xD?=
 =?utf-8?B?cEN3cmlkYnkweElvanFZeW03ZlVpK2Y4cjRFSFNhdm9nUVRLKzlTQ3Roa0N6?=
 =?utf-8?B?OVNyOE1meXZQSHJFQlZjYVJmeFFTbVo2QW5lY3NxVjgvTmwweGdhMEQyWnd5?=
 =?utf-8?B?ZVJnMzdqK3NaaDIxOXlTYUVNR3g1RGJqckVNNFh1RVpQWHFCM2NvRTFTTVJz?=
 =?utf-8?B?dXhHRWJnRk51aHFFY1YxRzJadTB6YlRhQjFQdXFIeml4eCtGcUhJMkZNWDNp?=
 =?utf-8?B?WlU0T2xVUzJITThvblJzaEVHKzRhdVF2bFM2cnZGaEJZeWRnVDdZSWNSR3dk?=
 =?utf-8?B?Vy90R1J6emZGZXlPdVNSSHdzQ3BMdHVXbmhxTkMrVmZQQ21yS0x4Z3lBNGp2?=
 =?utf-8?B?NEg0Z0xpU2RVWDQ4RkNpeVpwUXRtN3B0bG1SaFFyVWgzcmtjcGdRc21qZEln?=
 =?utf-8?B?c0N1S28zL21UdURyNS9HcWNnS2svc01ENlYrQW5DclF1S01MNnc5L1B0MUVl?=
 =?utf-8?B?eHpRbFpWalVRV3BGTExlQXkwSXp6WW1GdXpOSnhJN2w5OWZLQ0JrZ1dHb3Nx?=
 =?utf-8?B?TWJ2aFUrcWNOVUtNQnQ2MXdaSEtyUVJnRHZrWTA2VkZJbDJHK3pLQmNJRU5X?=
 =?utf-8?B?TWprNmJVcXFEOWN1R05zNFFiKzdHKzNZVVE2QVk5ckVyMkRaK2RHd3VacUVy?=
 =?utf-8?B?dFU1cEJSNFFVY3BvWW5BaEVvWFY4NFUyTGVMVkdPTkxWU0hGdXd1Nk4ycTg4?=
 =?utf-8?B?U0hza2pOSUlmUG5QQURmc3dPcU1XY1VNcmdDK3RCdlR0aHJkRDN0S0ZNMkVG?=
 =?utf-8?B?U1J4WEVrc0FMVlJQak1vbHF1ekFudUdxV2o5TXhLTkY2OFQ2ZFBhNUIvTXY1?=
 =?utf-8?B?blhPVWI4eng0WDRqYVVGN3JWL2JnazZPV08ybnJkc2xtdXRaQ1VKdDVJakhL?=
 =?utf-8?B?WFNGN2Z5RXdwU1kzbUJHdlpLYy9qSlRvNFFwRmwrNmN6Mjl0QnRscW1teDhL?=
 =?utf-8?B?SmdRaSt6cjVHZlhoS3lyZm0xU0gyTXZyNXppczFQT2ZreE1lT25nbjBCQzVH?=
 =?utf-8?B?THBqMlJaOVlHYWFrRHVNVmtmdXhMVllzSnY1VXVlZ2dFQWpUNWFCVDhzdUNz?=
 =?utf-8?B?S05uYjZxcWxVc2RWeUI3aUV6RWxDYitrNldtWHY3d1BNcE9QMmhzM1d2UFZp?=
 =?utf-8?B?UlcvSVRQU1hZVTE3emo4a1dMYTRONDREL1BWaVFONDhXTXU1TmlkY2N4VUNH?=
 =?utf-8?B?SitzSmFkQ0w3SDN5eWdlTHpRdTY4VUJiSzFKT1pONXQ1cEFJR1VpSXNZbEVE?=
 =?utf-8?B?cUwzc0sxUzhiL0NBQW5OS3NtUGVsOUdPVnVBR3A5ZWlqVW5LQm4yUlRwYldU?=
 =?utf-8?B?RVplUEFBWVJvYWtUazBTdW1ZeGNVRHZKYlhTYU5jb3FUc002TW9JcjZaQ3Ew?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 514fde20-913f-437f-02f6-08dd5ccfd567
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:26.6188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fF2aGxYHE9U6oWsFL9RH+PhfAv+LT9QQcKhD5FFsRloSB19HH7lSXQ4Js/mq1RBuNqhA77cK5C2c2m5FaOGy4P/N+oYke5TvrZQfkjhXkAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
is broken out to the PF5 mainboard expansion header.
Enable it in the device tree overlay for the WolfVision PF5 IO
Expander board.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../rockchip/rk3568-wolfvision-pf5-io-expander.dtso  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
index 048933de2943..411b06b534f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/rk3568-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -134,3 +135,22 @@ &usb2phy0_host {
 	phy-supply = <&usb_host_vbus>;
 	status = "okay";
 };
+
+&vicap {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cif_clk &cif_dvp_clk &cif_dvp_bus16>;
+	rockchip,cif-clk-delaynum = <10>;
+	status = "okay";
+};
+
+&vicap_dvp {
+	vicap_dvp_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_BT656>;
+		bus-width = <16>;
+		pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+	};
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.34.1


