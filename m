Return-Path: <linux-media+bounces-26349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC291A3BB6F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E43F3A3E79
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DB31DE4C6;
	Wed, 19 Feb 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="edrQedPj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2125.outbound.protection.outlook.com [40.107.20.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E481E0DCE;
	Wed, 19 Feb 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960218; cv=fail; b=WdvGb08/HwJ/GjAYXmB7XLntaciTQq3ukG1OwOKKSuIu3ZGE9o5+kLV7PKCkiIc3i555nvbkfkx07upZx1A1kDZlDZqkLKYHYOpEXtvofS3a4iZHxc69wQwzuBT3D6QVwiF7VFnsgXlm/s9GfC/BHkVHtQg4ZUp7g0igSsarEg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960218; c=relaxed/simple;
	bh=XAUyQebd/kIeP60s7a8uULFfE6nUdjkkCSmsYkQbEPk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aZ1ZdKB8W75ddGcOZ8eNFvRbfmZXD6hsNu8A/yIHLZRpNWX/mO5bgL2GgyAGpk9IVD2rxZz8y+EAVkulNRjkc5+CuYV+FzoLxq/zxokRCCvXm3nmuej6gUubkrvVe9NBKRXDyokN8exIjXMSIpYW8WZO5pdXYWltZNiRMY2c8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=edrQedPj; arc=fail smtp.client-ip=40.107.20.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jgo37EmL6nW7YfsXSs19N4ESitPjjwwjBtrvkODffuyrJXSgHoJt8ISezR/Bj/Y2PbrqXsRk3Fi9P15Kk4+4ycO95iNqTv//dtMTxr+XciYTMAlXLdJeNt7Cohq7AQTqGc7zJysBjCcAtigBKySN9/U3dSAmiB7E7G5bhrmVk2dVkmhn4Ll0HZIPASIP714ALLFpQ7ORn6eAaDmg9fNcT0I13L9kozshw4dPmKcwb/bhNaDK10RP9qTaaxx9ug2BrDsrCDRHQivhdC/GLJgSJe0CdQwxmjo1mjhwOv1v7ScN++4DS525O1yCKX+lHHPO+vUu0l7aaZCLlWaNPNiEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iu/nfn49C5pEXaXCCGrNWax4dy7On7ZTpZLW1KudVGI=;
 b=nJl67oSis3RsahJ594VmogdZYhTSKma6dW5jDIgPX3JSNPKGApXS3zMJNxwASdy9Pp6ItUIhDiangjqgY4IjqiZVugcHfCGxLB+E5cFwREPi4TEQxi8r+1Afpt21dy0+jiaU7Nb1Lhj0oCxkPriyY4qYGr6acD27xG5clREj2qo5lalDBg6Dmfp/5t20/tvZhXTo8jDq7qNwaDxTQn3JC3ubVzZf5AcNw8TBkjPguYWFZpYI+Un4j35g8noM/0z4Az4G7VHKY888LXencCQq8RCHvYYYILvtuAaDvG+A9c5axVzGOactUxP/Ek0g/TnMfmTz8pY+5scgyV4gilUiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iu/nfn49C5pEXaXCCGrNWax4dy7On7ZTpZLW1KudVGI=;
 b=edrQedPjcBXdkzPOTjrh3Bm7DzQcDNH7Fnqb5hWDN6hewOBbkR6bFPklGGuddfwU0NnQfUBceL6epF+BNeR/eSVaiemz43VghM/Y23/D5swHq3eiFlNV5F+F1xLN5UKf2ZKN4rGUDV5hkJwvDRcbQTMMvjPz4iSMBXDJxEKZ3Zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PR3PR08MB5721.eurprd08.prod.outlook.com (2603:10a6:102:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 10:16:53 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:53 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:39 +0100
Subject: [PATCH v4 08/11] arm64: dts: rockchip: add the vip node to px30
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-8-e906600ae3b0@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=1271;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=B4x8zY3KX5X9wBT8dC0eI+dkSq+U/fBGBr32XMjj84I=;
 b=wJXulz1wTX1KuW+447TaCtfcqu193E1J8SrF4uXOXa+CpPwEjH26HoKHwRUlJVAxlFhEx0Waq
 E2d+E0H5raLBDiIf3g/Z18jwmPI7BTmWNpFh4ORUR/kwApmulqoWA95
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
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PR3PR08MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 311ddcfa-40d9-497c-756e-08dd50ce87ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2NVWXgwYUNqb1NXdDBrOFpCOFJoVENjcEtWanVBSWJ1djVBYUtqWEFsWGxU?=
 =?utf-8?B?Rm1xQ1VZSk84NWhkN1JmdExyNjhzUUN0WFExNmZuRlF4cGNHb3FXZWVCVEM3?=
 =?utf-8?B?eXhXWjN2MjhKMTVBVElwaUZ5K0QzQytuYnpvWTErbkpvRjhnLzJyVDVSNTR1?=
 =?utf-8?B?cWRsMTIvaUFKelZIVGVYdWRScW5sLzFML08zTm5qNzlyd0h4d3I1S1Q5TWZG?=
 =?utf-8?B?UWxGQ1piVTlrZ3VEUFBya2pYaVZWK0NpbHBtWERIRVhOZDhsQmd5N0paRzN2?=
 =?utf-8?B?TjBLd2h3Q3c4a1RFVWtvSkFKUXpJTHB5THJmMjV1bzM2MjZJQWJvaXA5SmZi?=
 =?utf-8?B?UkpNUnRBdjlNK25xcjlNZlRKUDVjbjkxeEdZT291VEszdnZrSGxqaVZMc25B?=
 =?utf-8?B?bHFZenFVaWZEWXlmVmtDQTVKL2J2VGRlSHVzd3hpUlhoam9wVVVqdlltdXhx?=
 =?utf-8?B?aHJqdU5KWGFHSHRTRm5BSFJlcENVamNVa3hDQ0ZRVGpEK2cvOG1MTXlVdE5o?=
 =?utf-8?B?M3VQZ2VrZ1V1TWFHVUZhempWVXNCNi9ab3pEMXVjaEZTK1lMaHFreVQ4YVd3?=
 =?utf-8?B?eUZnaS9HT3UyZ2piT0VvbVNaRW4xV2ZEU1B2ZWRvTkxsSEhQUUhKNHk4U3Zx?=
 =?utf-8?B?YkorL2hlbEkybm13TGJBekE0MzYrajBGQU5TdGluTlhPeVY1U2dKaDFzMnlk?=
 =?utf-8?B?a3dLMXkrbVlML2syRzhWMVlCbHdrdE56b0NwVVA5ckhkdklBa3ZyNCt1UlZ6?=
 =?utf-8?B?aENURE1jYkdCTHc5bXZoZDluSEc0c3RMZ2xqa0kvdW5tZnNMVUE1amRIeFRk?=
 =?utf-8?B?SG1xdXVrR3R1UTJyY09zOU5EUURTM21tdkFkb1RzNUxFcldEUG9kZVlyaDRp?=
 =?utf-8?B?bTNuWUgvcVlLd0RGL0xVbU1TZkpMSHVqOVEzT2xsMHd1MHFtRGtGbUVWczdr?=
 =?utf-8?B?NWdFeGtVcnVoKzBtUjJOVWtFNWlCeGh4cjJRemx4YUUyby8wT2libUdnUGNp?=
 =?utf-8?B?eWN0aTk3RGtNSlBjUWRpaEFOTzRicGlZaEJQcVJNYldoY1lENGcwSkpNdDdk?=
 =?utf-8?B?RmpnNzVQZWtBT2hGdjhnTmNVeUY1ZHpvZXQwalZhSWtYdTUxSGgwbzRycVRo?=
 =?utf-8?B?L0ovOUcxVnRTSFZEM0RoRHppZkRhVklTY21UdHJLL2ZaeUZuYTRkRkZSUXNF?=
 =?utf-8?B?NGZsQVRyWm5MOHBWK1pzUUNZWW13SVczMjVlWEo2ODVEb0s1c3AwdmJ3ekky?=
 =?utf-8?B?bXFacXdFcXk1L0V6SnRPYTc3NFIvZTdQdEFrYzRGZXIvQVVEQ201N3JpVVlV?=
 =?utf-8?B?aVFuVk5NR0xIMFloVW5BYmx5dXh0Ukp6OWUwdlUwUkRjbmFLY3NlNTNGOW14?=
 =?utf-8?B?Z3crcDlVQm54N283QkN6REdMSmhIdEp4eFRBZkcxYXFIOUVVY0Zwa1Q2Q2lU?=
 =?utf-8?B?bzk3a2dnMVhUQW1zVWU1TGtPY0o4UTQrTzVRMm9wbVFJVitNSTVjY0x4d01l?=
 =?utf-8?B?cXZzNENmZ0MrYUxWY0NPWER3VlpFN2RwNEIrTHhlSS9SSTNpRXhPNkwrYVQv?=
 =?utf-8?B?NEV5N0l2THFNcTVDeU5TdXZyeEJwZk1VZ2dCUEtJaUtUOGl2dHAweHRVNVlG?=
 =?utf-8?B?WTJqT3JiZlE2eG9TWXM2bkc3dSs1VmJaanhuZ0s2VHBRNkY1TUpSRFlCWllz?=
 =?utf-8?B?V21wUUNPTVRMZ0czeVJBT2crcEF4d1pLWHdaSVRDYnZEUEdjemJmNm1BVHZN?=
 =?utf-8?B?WEZzWWRyQ0dLOXZPaHpUazlLV25tM3lqWU5iR3ZzMjVEeEg2c1I2SWVkMlRm?=
 =?utf-8?B?emxXZkd3d2lYcGdoZkhpVEwyUUpWaGpvaGNMQ3hkdGdOZHR0Y3dVOE9EN0ZX?=
 =?utf-8?B?TFNleVplbmo2a1orU0NabkljazVSZHRBLzRrUzhKaFF2TlQvbS9nSzE2NTcx?=
 =?utf-8?B?U0ZvNEtTbEpMSlIyWlVLNU5VZS9jQjdMSk1Wa3NDb3NHQTRsS2JZR3hNNDNt?=
 =?utf-8?B?ZmgrOC93aXB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0Y0ai8wSGdxTXJUMm1aTG5XaFJyd2RJRFo5ZDJ1SWtiWWk0dmpaanprUHY2?=
 =?utf-8?B?Z1RId3kyZHBkTGVCd0dvL3lVdUxHZmRvVWd0Q2J2b056Tm0xK0x2cEt5QXlC?=
 =?utf-8?B?MHFCS1lBQTZXaGwyalN1WXpGNzRUYk45VTVGZU5NWjZ4eDIwYVozZ1ZiaTA0?=
 =?utf-8?B?OVlSL2ZMS2JTRDYzbENlRlI1U01DeUhBVWRkSEQvck14TU1GQlM1WUVEZ3dZ?=
 =?utf-8?B?STJBQitkbnF1Z1NNV1lJV2s0QzlHZ0pDQ3hZK2tES0RQNkxXaGxuUjUzbWsw?=
 =?utf-8?B?Q2RUQzgwMHFTRzIrblVhOWNaR08xaTlsREhRQzNlSGg1NEppRWlTZTFJMk14?=
 =?utf-8?B?V1hrRllyQWN3MUVUZzd4emwrSmRMekNZVUgzQzEvTStJdzFicjZPMVZQVzJJ?=
 =?utf-8?B?Z2dRdzRpN2NKMm1wWFBWMnd1NDVOSGptZkVKZFdCMjRWWmFOeTZQMFRNOWox?=
 =?utf-8?B?M2dzQVg0YUpYWTArbWl0bVNMc2ZvcnNpUGk3dFlQTndqYURIclhGNmltbTJ3?=
 =?utf-8?B?KzFjZ0NJSVBWcWNOOXFGWEE0VWtoQXlLYnFzWHEzRUIzTndBaTVLZEhzeUNu?=
 =?utf-8?B?YXQ2eGV2ZEF6SThrNEpSaUl2SW04andBM3RPWTNzZG91VzNYK20xNCtTSUtV?=
 =?utf-8?B?OTN6SWJ5bTZSSEthdmo0ZDJsdUI5enZ3WFFQNnBuRklkT05xdWR0NUlvYWhP?=
 =?utf-8?B?ZDMwUzVaZE5yR0NlS1Yvd3hiMXpSV0hQdm95d01BaDZlSlF1UEkydDA5UUxo?=
 =?utf-8?B?dzJmUEVpclQ3ZHg5WGs0NVM1a01sdXJ0VXpUQnIzZU5LN1FxV3JweDdQeEhC?=
 =?utf-8?B?dHFUQ0tNaGI5UFI0T1JlUGJncTd0ZVozajluUlB4NTF6VSszeFNnUEFUNEd4?=
 =?utf-8?B?VTErYXVhUDlKTXBkUWJKSnJjNUYrM09pZUtkVWk0TFEySFU0aHVEZVhsUUxJ?=
 =?utf-8?B?SVk5RGFGTkVFQXJMdFgrL2dIWXU4T2pYQ3hiVTZBdWpsMGsvT1Q4Z0pUUFNF?=
 =?utf-8?B?bWZwZEY1dGJMYXpBZDNncURBeTBWdEljMWgxaklRTzJOMU5xSVBUWHNtQm9h?=
 =?utf-8?B?emVzR0NhSFpHK0xWVEwxbkFuaW1NTjVWa05Vc0hXZENHUzU1VTFaMUp0ZkZn?=
 =?utf-8?B?ZUtwN3VkSHlzMSt0dHB0aUdFTStvbG1QQUQ0ck91WkpPR3BWNkpRazM5TUcr?=
 =?utf-8?B?K0FsczQ5bXZyZkM4R3RWcTRQeWRyZGhMeVIzUW01YzBRS3VqczVtRmFUdS8w?=
 =?utf-8?B?USt1cWIxRmtzSklFbnpNUmFJWmJNM2EvSW1xcHUwMWhPMWQ3aktKQjJ4Y0R1?=
 =?utf-8?B?cVN0YXV4VGo5cEt4YytrWjNjVzhDMkpmYTdQelc0TUlCR1JpNkErZXVkQ1h6?=
 =?utf-8?B?N3JEbU02azlic3JsYzFjLzlpeXgvbkZzWGVIYzIrajhuVFJpQ0JLS3MzSEFp?=
 =?utf-8?B?NU5tN0xIUnVUQ3B0NEpFSWNINWxLNnNFZEZVWnZwWjdWTm85VU40dGxUQ2E0?=
 =?utf-8?B?TEZUWHQ2NElqbnlKU2ZFVmpldHc0cFBzckJoQlF1Q3U0N0NZbFZQSElKUDdL?=
 =?utf-8?B?enRFaU5VZTh2VmpqVkRZQms5OGFPTHVxRTRhcEErN09lSnAvOHhQTzlXWGp5?=
 =?utf-8?B?eUgzNGJoTDBVYVdidXlUekp0YzJsRStuak9LMjFBN2JaejY5ZUlwZWNRSkFV?=
 =?utf-8?B?Qk40Y3RPMzU0SG1zWEtGbjZTd1RnMHZDc3FLQkY1OVQzSytQbW16blFvOGtJ?=
 =?utf-8?B?bXB5ZURwU0lFYTlheXBtUGI3TjlKdlFBMGxaTmJtREh1Yi9pUDBGNXUwb2Zt?=
 =?utf-8?B?SUZHNFNKcmpkVHc3bm03aGdadkd2aDIzeGFIMENFSm1kVGZmTWtaQXlDaDNG?=
 =?utf-8?B?OWVlZXlib09hRjluV1dRWDBXNEZaM3ZWVVNFQ3FIZTI5QlNyVnkvSkFBS1do?=
 =?utf-8?B?cklSNXo5R0NGYXljbDZUK3E1WFdVZkR3NkNOeHNxdDBFaWhuUnA2TlpScVhQ?=
 =?utf-8?B?dG13dzZtbzZvakd2eHRuMk14T2RQSURqN29KTmtER1JXWVQ5b1UvdjgwUmp4?=
 =?utf-8?B?MWd6NGRlK2hIZzlqU3J6MkhicnpjRXJvSHBwNkNha2tVWlR1cEhONXVBM3F5?=
 =?utf-8?B?bmxZaDZmeTI0Nm0rWkhFVi9tMVM2ZmtuTXh0K0VTOFRNUmNCcjlEZy85TXZi?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 311ddcfa-40d9-497c-756e-08dd50ce87ef
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:53.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmvjHpm5WpgHbDx6+SAWjJkvVwx2vM0qeR0wFjqalg60cy8aIHmbG5vgSTZhdNiU/IQ6VCuCtpM4z/jXviwZ9esdUtJxKKrk/C1Rzhppu2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5721

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9137dd76e72c..c2acf5952d08 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1282,6 +1282,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.34.1


