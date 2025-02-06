Return-Path: <linux-media+bounces-25708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06516A2A547
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD13162AAA
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C924222756B;
	Thu,  6 Feb 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="YDe/30ZF"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC17226557;
	Thu,  6 Feb 2025 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835886; cv=fail; b=RJj/REhOwzYzPkGUmcY4l4Ae37RNpiiik6O4w3cFaK2XtzSClmUYVVpGeePbhf9lYA/Up4/4zJMEJkXzrP5QwphQQuYqnqw8jKLb1g+sQJZq4LVWpMoFpxDhcyiAolDAscgSm2cRRNu6D4JIZ/S0gzhpUaeqrFB23aRom1+6ru8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835886; c=relaxed/simple;
	bh=SDg937v1cP7FPpS/VJcKmS4uFV79UJRnXuRkwyi8+NQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eorCev6Ai3pGh3CpBMsx4gzJPjQkLyatoCNtWcatuaJAinw5Xm/Eq/Ji6I1ylDZ6boQlPdltsWYghsrV/UyQ6wIwpFVusPlYCgejrC4jGlq0AgiceqWCH1VkeHCdPj2ViMU8X9v9iFObIqannAvs+LgTqKISaEqOPTZZ2AW3PGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=YDe/30ZF; arc=fail smtp.client-ip=52.101.70.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ5KzyNJgBTe3gb9vIDDL4IYxayLUU2setYwMtbL16pWDTiY5Bhx7thQmUvmi6sRLjt1W6kBWJeNXR8Z+7wJGotEbFEWUcUUox/zaoaPGm4P08SLF4MUAkGop9ciMnARn/6DoarhkID+favSdXjoB3iAGCBZqVdkxN6d9qGBB7CVzqppASqdEqq/fjjG7b5YZQqsrpTg1iJI0xhO+QHF4050XQ8V2aGPbtwp+8Vn4gs5skFBbAE/RGAfBa9YsaC2YPLPDmUz57bC9HuFgmMn558t67QJWDTGwUczxLuq7vEdDX+iYxqn0Jrlw/sfG7fSXTKkyouqHLUdTu/Y9l7U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+doi2omx5IExXQnguRMSY/NWfiLwS9uLOk9L1EpnkE8=;
 b=RoV4UnCsQmzwXy6mJzgoiQ1jXIUD+3sPFP4od7dfM4iS+TK2v9QrHNR+5QAOEAS+4UIszR3ZwYr8jGH6mUEgYv83e3CaxXg6W1sUHZGAaJSphhnsMrkVVFtjD14cV2xkr0A+KcYHzqlDMToHSGzl0qvvErHbnyfBJpoWry3e/YgcvWGICXlIsXVdpuvCsPBx2vYt7itQGr6CSaQs4shM0BPaKZhjkuyl61clE2V5wI/q9TIKDVy037M8BQc9BCxeSyK5u/Lg6XjjxwPkL4sJBr2cFlsaN1CLhE9yiNJ8IqF9wE155LbkfawfDt8zHYkY14mU5vzhtFdCz+57JFxXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+doi2omx5IExXQnguRMSY/NWfiLwS9uLOk9L1EpnkE8=;
 b=YDe/30ZFHB0aDvsmCSn7ijFITbDDgE5yBZV+Sg39n2dJk3WVKs2TBmOs0JYI80ANIiNGLYEhav0B03dIpJYw4tF/suW8yLevauzMvI9+PBeWs4i7yd5Qtlj1VZCW6wyEm/RaLlAYE3S+6D+qYQiY+tZyx3C2EsFn5sp+N62/hPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10170.eurprd08.prod.outlook.com (2603:10a6:20b:63f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 09:58:00 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:58:00 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Feb 2025 10:57:41 +0100
Subject: [PATCH v3 3/7] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-3-69d1f19e5c40@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=5776;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=SDg937v1cP7FPpS/VJcKmS4uFV79UJRnXuRkwyi8+NQ=;
 b=RFaz7ze7OjWZbmlMKzJ84OtL8FE51cIrvUtL71w4P8PN2gDvymMZKbz9RGazxmE6Dm94NsM5x
 19/c2RuKC3nDcQKPWFahjdc/L37pwe/EY1P0HXyjYvVMCg1JgG35R+R
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
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10170:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8851d6-de9e-48b3-d5ed-08dd4694bd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmZOdlVoOURsMGcvVEViVFNObmM2M2hyd3JINmVJR3J1WTMyM3ZpSjJ1K1ZM?=
 =?utf-8?B?d3pTc3E1Nmk1NlIwZlRkTEtFZFMzTkdNUFh4VmlabGRIZjNVTW81MmJ6K1ow?=
 =?utf-8?B?c201bXMzVHhzL2Z4eDlOUlJyVTIxVU9RcTF0Q1ZHUmt3NWhNYzlQNU1BY2hX?=
 =?utf-8?B?OWlxNWJsTWgyZnp6cE1sRXFYSGtFU3BFdlRHR3lHTTV2Wm5lM1VIT3I2cHk5?=
 =?utf-8?B?bWJlUXpJeXNFRk9rM2lNSEF3QmVIdE9xcTF3NHFMcmYzNnRDV2xmNFA2TjRz?=
 =?utf-8?B?d01DTCtBRHE4d3BVUTlGSVpuNFM1L3lhN1BIWncxV1VBNVdsS3NaUThUV2FE?=
 =?utf-8?B?WlQvZ1lRcEh6UzBpWFF0TnpuT0dERW12c0FGYlcwWTgrcEhBL1I0ZUprQ0J3?=
 =?utf-8?B?WDFmRmdRL0FTWTJYQjdqZG5CQk9HbmloY2J4Q2RrQzZRbFBuVHV5VlF1YW9L?=
 =?utf-8?B?ZVRHbDZBS0hBN2Zvem5SWmx4NEhzUmlsNkVjRDNIaG1WR0ZjZUNaUnlYaUZM?=
 =?utf-8?B?RHBvZ240bldXaEFrdDRWdWI3b2MxZlZYcFdPWnRXRE9sR0luMkdkM0xpU0Jl?=
 =?utf-8?B?SC9TRzV1WTUwNkFEUzlFOWRpR0JiNitaNzZ1d2hGUXd5NEZmU1dHMzVHMmhx?=
 =?utf-8?B?RWV4a2pkZlE4TGUzNExmcjQ4V3h6K0E5eHNKdThmb09wNi9ZbGZzcTRlYU5n?=
 =?utf-8?B?cE5vamV4M0tXOUVmaW9FSGtvQ05PVExYaTluYkF1YS92ZXhISVFVQ2Q1THpB?=
 =?utf-8?B?UE1ObElrZU4xWjhCTGVLMFY5cnlkWk9BbmhFVithelRvM0crRXNLZWE5cENH?=
 =?utf-8?B?Qi8vTGdoR0VyZnBjZlk1UXZSeGJHU3dIZTBoaVBpYjRLMlVBSzlxbFgvTldR?=
 =?utf-8?B?RGlmaWtGSzVKLzBCdVdmdXpTTnZsUGgyczR6MjhnUXRMYkV1dkttQlRoMW90?=
 =?utf-8?B?dkpzbDVQbkJDVjB0NFMybWIzd2xvZ05NQWhrSjZ5cHpyWSsxTkUwSmYxSXF1?=
 =?utf-8?B?YzBOQkZaVTVyN0dOaENMMS9FbytuVS9lNEdXbUIxUlVnWSttWGF3N1BrZ0Ja?=
 =?utf-8?B?MTdIUFRIU3BYbnhHYmVpZW80S2dtL0l0QkxmZHM1ZkZ4eHF0clpkSGtOMlpO?=
 =?utf-8?B?RjU3YXBYMWd4b3d2SGZqTUcxQUs1N0F6TkM3ZkkvNklGS205WEJlR3l4QlFr?=
 =?utf-8?B?ZzdnSjcraTNCcUttdGlqc05adVRWWWcwOFltdEtRVjlVZzFiZTI3UjR5eFpF?=
 =?utf-8?B?bDNleHpQZGJaUkVoYitCSTlIdEZiQlU5QXh4Y3JoVEtPRGFQRklMSVhFUDVP?=
 =?utf-8?B?T1JrcmN5OEtmb2h5NWlWbmtyK3JmQkF4dzdUMVN1QXJUWVlMSmkzbzYrY01k?=
 =?utf-8?B?RVM4cWREOThFVDhpR0ZseXpWdzc5c2ZjMnBFTzNOL2wwb1B3K0lyNjJ5T1RW?=
 =?utf-8?B?enFlVWdESERZZjgzM2pVTzl2NUdXSVloN3FlQzlGU3kwZVpWbzBSYlZTYU4z?=
 =?utf-8?B?cW9UY2FCMXFGV2V0am5uRjhOb3hTMFBLSCtxU0VyR09JWXN2UDFUamx4cnly?=
 =?utf-8?B?dWtuU2l1OGk2RFZlQnN2cTY5U0h3RCtRSWlTenRGcjFOV3lxa3o3cjhEWlE3?=
 =?utf-8?B?SHgzbnVoMDMzb29MVUczYXUxVHE4MGl5Z1J2N3J4dFpXYUFnN3lJd1JUVVZi?=
 =?utf-8?B?alV6bmt0QTFab2FhNkcrcVJkZlkyR2hYZjZaWmlFUmJhaEZJbEJnL1ZkMmZG?=
 =?utf-8?B?TTBhc2wzYSt5U2JKWU5RWkdiRWI1NHU3S0pxTktWU3BsbWYzWjJPZVEvZGV4?=
 =?utf-8?B?NjlMU0xoQUg2My9CSGpreS9qcHF4TkVETGs5dWFsMmtKQzJKWEN6eTMwZkxq?=
 =?utf-8?B?NEFMdGJjRVdjdzZicU5YWitUMk9IVVU0RldwZ2hpelpIVnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFkRFNxdzVucDZxVyt6dUhlRWRIRjMzTDZtSXUwdm5MSVFOSzhFa2lwVzBM?=
 =?utf-8?B?UWI5MnFmRy9TdUxqMVovZmpEZVlEQlhCYlo2SmFrV3NlUW1Tb1NabGRkL0tm?=
 =?utf-8?B?czl1Q3BieSt6Wk1WV1RoN2R5Z3UwQ1A5SnplY1p2anROd2lBbkV1MXhELzNm?=
 =?utf-8?B?RzFucGlkUDVJUi9VZEg1ZDdqOUV0aEd0cXdXRVNnRDNydU4yQXpoOHgwNm9P?=
 =?utf-8?B?bk5BUTY5T2JsVGptMUdNd3lncEVQV01SNVc0MEo5alI5V3RwaS9jUEdObEFR?=
 =?utf-8?B?bzRnMFd2a0tnQWNXYmp1ci9TVS9IMzkyZFdCM2Q4TzB5Z05EU0o0U2Vvelk1?=
 =?utf-8?B?aENGTTNodVdBb3ozTHFxNVd6U014b3ZCTUVnd1pUcFhOa0hqdUFHL0RES2xS?=
 =?utf-8?B?MDF5Mm5xbGZyVllxU2pxTit0YWloSENkK0FxU2VTNDhwRndjMlhxMFJINERX?=
 =?utf-8?B?OVlEbmpPL1gveW5tK0t4WVl4Q3Y3UW04UkdJU3ZJRkVpWUlEMmdUZ2F3UHlD?=
 =?utf-8?B?dE1ZbjYxWllrbENjQ2JoOCtvVXUybnFmWFhvUnR2eGlCelJzZ2lTc0YrVHJB?=
 =?utf-8?B?N0t1REt0dWZhTFdjY0F2UUhZN2pTYVRPMkZTcHBKaFRtb3RxM2c2UnZkRllR?=
 =?utf-8?B?b1BqclFXTmdncitudGMzRzdzK2hIcHptZjE4MXFKQncyRDBVVWo3Wm5aZnBx?=
 =?utf-8?B?emxZQ0p0MDRRd3dNNFdWSDBDRUZEK0tnYlBQWHRMS1BRUXQ1MWd3d2U5T05k?=
 =?utf-8?B?Z3lRNmtRUHAzN2NxS3RFVDdmUHNOUTd0Z0gwMzU1VHNrYWZYM2s4aldqaGVQ?=
 =?utf-8?B?S3NOZVJJbjBTYjdZVHFHNVlNTzBRLy9LNit3YnJxOXlRZEhlNTFmemRxbVNC?=
 =?utf-8?B?QzdjaVFMYlA3Q0J6YWZhdXdlL0FkclJlYnY3dkNvbFJadm13WXF0VjN3QkFw?=
 =?utf-8?B?YVo5czZBTFQrNFgvcitaNFYxY1BxdzliUEtiaXdvdkJnYWxHSW9WWU9uSVd2?=
 =?utf-8?B?b3Z1R1dxQVVHWW8vU0tpNUFUaXk3TGw5MnBTa2Q1QlBOMUhVSWhSeWdsc3c0?=
 =?utf-8?B?WllncGxlNGpZRDNNZHMwSzQ3TEdLajV0ejV2aDNKaDNZV2JMOXpMcEI1cUhS?=
 =?utf-8?B?VTlmWkFzaHlzcU4rVkljL0J6Z1QyTStXTlNRYjlGSS9VWnVZSTVMWHhqOHVi?=
 =?utf-8?B?d2hkM002QmpSLzRNZnZmZ2xYWGFLK0VnTk1tNWNUQ3VoS2N3cnVBTXUyR0J5?=
 =?utf-8?B?eUFyWHlJdEZJUmVJVllmTXlrNkJvUHpWMFlEckM5QnZGNXRyckNrUld5QWNI?=
 =?utf-8?B?SG9xaEpMNlAyakVQTzNLVmRsOHZMdjN3em1wa2hnbUhjdExVeTNFZHdjNExR?=
 =?utf-8?B?WkF0Vi9xMFN5dytrc3hBRVlwNzlnNDArSm14U29uWlFLamNGR2o0bTY5OXZ5?=
 =?utf-8?B?cWFrdGk2SzdUdzQyS1dOZGJvNnJsTzhJZlpHOERKUCtvNDFPTW9RZitGelg3?=
 =?utf-8?B?MHdQRjNacTU4a3VBM1lDMjNWdmRVL2xMOEZNRHR1QnVKRVN4dXVENGxFcVM4?=
 =?utf-8?B?TVNLK0hRTERHbXZvYmR1QllsdHkza2RNMGhSNkZiOExaRlhjbkpGV2kycHI3?=
 =?utf-8?B?LytPMzYwS3lMR1cxZEYveDJoVnd1NFJOUnlsRjhvaVBaUnRjeS9EMVRxSkpC?=
 =?utf-8?B?Nk4zdjU0VytvMCtoYlpuUk9UZTdJa1k2TllqMThSc2RXcVhRUUpNWUNJTFdu?=
 =?utf-8?B?NEhrV2FtdTdnOTlaZ2Q2OHp5OFhDMGIyV1JCRjBxVTE0NjBwY1BpeU02TlB0?=
 =?utf-8?B?MFpGY1d5bFppbmFMZ0RRNmxPWUtYL0cvNENWcXJ4L1E5UFl3T1UxODgybVc4?=
 =?utf-8?B?a2IrZ2k3V1hHNy96b2hmLzRLZFhzUERaQTdROUhrK2ZrQmZpYXVDWG5rSGtF?=
 =?utf-8?B?Uk9RN00xTzZSNXFkdDlMQTd6Q2lucEdXNi9DWmFyamtFUWRtUk13OUxUM24w?=
 =?utf-8?B?LzdHeFkvd3FtY2RxOG9hS1dLejA5UTRmNlFyaGFCdEtTRHc1Q1N1Ym1mVnpa?=
 =?utf-8?B?QVJ2dXRzVkZBcmcxYjM2TTF0bmcvS0pEZEtabjhsanY1M0xrNlFuTzB5eXZR?=
 =?utf-8?B?SzJWc0V4ZFpwZE9DR0c4elFHWTNvOHFvRHR6Q2hxWTBaSFpjcGRUbjhKTXJU?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8851d6-de9e-48b3-d5ed-08dd4694bd41
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:58:00.1821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Slzlvu5SqTUKmz6+peUTet/kx0TnHf5Jan82vavrtBqqOcpsxtTZGZMV9o2kcDv/nd3eD7rJNdxBu1f0/0TwR+/HAo3WeXN8qcivYnACYxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10170

Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 167 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
new file mode 100644
index 000000000000..9dc4eebe2cf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Video Capture (VICAP)
+
+maintainers:
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
+  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
+  the data from camera sensors, video decoders, or other companion ICs and
+  transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-vicap
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
+      - description: DCLK
+      - description: ICLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: dclk
+      - const: iclk
+
+  rockchip,cif-clk-delaynum:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 127
+    description:
+      Delay the DVP path clock input to align the sampling phase, only valid
+      in dual edge sampling mode.
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ARST
+      - description: HRST
+      - description: DRST
+      - description: PRST
+      - description: IRST
+
+  reset-names:
+    items:
+      - const: arst
+      - const: hrst
+      - const: drst
+      - const: prst
+      - const: irst
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to general register file used for video input block control.
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
+        description:
+          The digital video port (DVP, a parallel video interface).
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
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The MIPI CSI-2 port.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
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
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vicap: video-capture@fdfe0000 {
+            compatible = "rockchip,rk3568-vicap";
+            reg = <0x0 0xfdfe0000 0x0 0x200>;
+            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&cru DCLK_VICAP>;
+            assigned-clock-rates = <300000000>;
+            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+            clock-names = "aclk", "hclk", "dclk", "iclk";
+            iommus = <&vicap_mmu>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+                     <&cru SRST_I_VICAP>;
+            reset-names = "arst", "hrst", "drst", "prst", "irst";
+            rockchip,grf = <&grf>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                vicap_dvp: port@0 {
+                    reg = <0>;
+
+                    vicap_dvp_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                        bus-width = <16>;
+                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+                        remote-endpoint = <&it6801_output>;
+                    };
+                };
+
+                vicap_mipi: port@1 {
+                    reg = <1>;
+                };
+            };
+        };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index bbfaf35d50c6..cd8fa1afe5eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>

-- 
2.34.1


