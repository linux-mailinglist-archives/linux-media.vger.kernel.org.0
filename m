Return-Path: <linux-media+bounces-26354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F21A3BB7A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B70D16EA13
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A92C1EB187;
	Wed, 19 Feb 2025 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="DciZSGN8"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301F1E5B76;
	Wed, 19 Feb 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960225; cv=fail; b=GPp+DWAjuhc2+emszHSzBsGBqBPVn/8NXSzJi3GhZ7ZAms01JpI3jqdXEo8H5kZyEioSFd9tzDYew5/DiOYKSwzjxugg+05HTW6JtxEHik71eXV+lXwly81Dr8TE2TspkIGXvO5oAksLcjX8qARiDIZ9njppg8mQJubfkGIldlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960225; c=relaxed/simple;
	bh=A6bK2fTdCdlrmNVUtFenZWtcU6bEcA5ZZ1M2I6EnNfI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PzLkyB5WQCguSi23SdfsyzKcOxBkyxHGS00Ye57Avn6F2O01hUAhmbr2RE+u3lhIHdEBLWKCZ4ERcHB7hqUNv7tu9NR2nBrGsbqvYL5um+e+UqvSE29qzcRssIrfdhwMy+1L7wlx6LXyQIA6fmsATj98m+/BelSA91976BV18eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=DciZSGN8; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmdPpf2fWKSmybH+mFfZPkNEk7Cz9M3vyTHfP2EI8SWt1x2Grfc9ohd8D/8ZlNl17718im2ejC8rhlJ3p7684RiTuEIQrf3GIG/Bu36jH7gYCfNVNq2IfLigeIzc1Mchy9jP3JuWtSCTUCRh6FwxlEc2Chf7WXGeQHuW9gJJwvB5wsSgab3mYmx07X1z/vHyPuIqlS4nODe6PekRUraG1nbIz50QbVziN38z47G0PCuS8/CikP1cPgqL6NWY3DY8HJ+sn7lmuEr0w1NtE+va9+ywqmVnfun/+i5v2lWj/mX03UmSsyh2AI708c5nSl3UY7vMyOZrxtLzFX/lMLubxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMVS5NeYk87UXR8+hPDeUJLtc1kE/NMvWLHUJ11raok=;
 b=rvsWKrWi63ShRgBWy2lzz1edA5HDzlnSAFvmiVc3N5DZS8zbFkmqVjIZYOSM3yqd2LT/vO09pOptS5rOqzWj/cUqfwdYFfuBBHgzvE62uCCZDcCKVOMEk/NaSH7r4/iJ+8a0L0LN+cG/6B+NgapVFf1DcT2t+ipE7nDCg1jp2i0HIS7RzQk6C72PunvUnN/7BZ0qeXqJe6gXY2dI5FxbtBlZgzuoiQWYkV4Luu7kc0H2lLOE4ewQKd75e76tbzPF7UjPqjeUvffaRe2u1A64veWQ8quzKf/NFK1/x/E5EDptGmd8oQN/b+uyvp+xVaZYSgyA0l7RixGKcz4AzlpCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMVS5NeYk87UXR8+hPDeUJLtc1kE/NMvWLHUJ11raok=;
 b=DciZSGN8vvWeKS72jgHuy4Y8Mjgl6kZEzgxigbOpmFpW8HgkLzT6AWqhlp6YxsKbmxpzbiXPLmFvWfyxTbcYRxjOxf4/peI4I/NEAH8DUutRSl0ElUEyW3/0wX2XuiAnrZ9NDiwoRP9tOJ/nP7LvpwNQK9K04YqIadYobXY4Pr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:49 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:49 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:37 +0100
Subject: [PATCH v4 06/11] media: rockchip: rkcif: add driver for mipi csi-2
 host
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-6-e906600ae3b0@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=20358;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=A6bK2fTdCdlrmNVUtFenZWtcU6bEcA5ZZ1M2I6EnNfI=;
 b=qz2LbOGOYDtTiMKp8EXqUs+S359XzpaxxisKIejmoyBumFO4+QsR8MU8WxZqSeHZNGX/wRsj0
 EZQVsoPtv4+Bl4gwKggpgTZ5y0yOirtkP+pvW6MKqYx04kKQTtrz4Jk
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
X-MS-Office365-Filtering-Correlation-Id: 7aec646f-23fe-4b89-2b44-08dd50ce85db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkVpKytsNXhvaTUyemZ2b3FCT29Bb3FJemdKSHdpYmZSUVRhczRJaEg1bnpE?=
 =?utf-8?B?VzRaTDNKSGhWUGsyaFNDNzFkVFl0VGEyRXBZRGR2ODJEYlhSdVk1bGg0YThG?=
 =?utf-8?B?STViT0N0bWZ3dDNFR0JtZnpTS0RjNHJFLzhMUlBYYjVpOGFNbDJaNzJXTEUy?=
 =?utf-8?B?blEvUWFFaVVBTDFiNEJDR1VlUHhTUnI4RVYzN2hBc3RXb1hPcFErNGRiT1d5?=
 =?utf-8?B?RHpRa0V6OFFvQlMyZXBOUEx3dFBzbFNuSG1pUFhia1psaGJFSEE3WEtlMUNv?=
 =?utf-8?B?dWJQS0p1UE8zaWI3N3ZsYUs4bEk2aXFPM0dNbGRxNVdGNlZVM0VxN3MxbEFP?=
 =?utf-8?B?U1JlbGJLbC9pVUpudnltYi9NSkwzY1BReC9oUXRDUVFrSWtpNTNsOXNLZHB5?=
 =?utf-8?B?MERobFFVTVBsRXpEU3lxdU40d3pXVXN5aEF1Ri9RUmMzV2VrcDJiYjhzZmZX?=
 =?utf-8?B?YURtRFJCSEdPdDlEZGwxTm5ESGNWdVF4VmlYSFZvU1dmWnBoWHZVRXczcHRM?=
 =?utf-8?B?ZmlPaTgvY0h3emdEWVZweURZZ05tUjNLQmExR21zMG5zUXIzVUZjRGVKL1BB?=
 =?utf-8?B?Q3VOa1VZQmhIakNzSkZsM2FrSXluZG1GWVc4b2FVd2hqY3psb2JRNFZhMmc4?=
 =?utf-8?B?NTNmMFNsNXk4eHdkUlpmd1pQZENaaWJxLzlVNDRna0txVWhMaEwwYmZDRUpX?=
 =?utf-8?B?YmY2SFM3UVVrSklWdG1pTWRQTlZMc2Q1ZmxObDhwdDhjMU43aFh5M09wQzNy?=
 =?utf-8?B?MzVZUnh2MDhtTzM0M3B6SFd4ZXN4NldIS05NUVJUTEJOVUFIRFVrTER3djhu?=
 =?utf-8?B?TmE3S2lNY1ZncXFqNGdBdVR0aDhMbFplaWFFVlpZSk9qcUkrZU5neUg0UzJu?=
 =?utf-8?B?WHdqcFlnM2JMMmh4YnhqWERqZ0dvQTl6SDRwT216dU16R3o0bm90eDhEdlJx?=
 =?utf-8?B?TERjREppQkp3YVQ0MXp2NmRYZWxoTWNrM1hkTVBsYUpIK2lxT3VweG04V1Rh?=
 =?utf-8?B?WWx1aFp4ZDY2YjhaSkpSUjVyWldQZTJURXU4MTErS3c3RHIzMnRqQXdyU1NF?=
 =?utf-8?B?ai9FZXF6Qks3ZXY0dzJQUGptOWJpYi80czVLcTF6SWFEblJDL1NTMzRzNFR4?=
 =?utf-8?B?N0NhOGlzYnI0azFGZmJKbUNPTDRiN2M5dWxWZjJBanN2Tjh6QzRkd0JTRDZl?=
 =?utf-8?B?NS9wOXk4eXFuZ0o4REltY3BYWWplOEFjeUYvblB0c1NHbjJvQVJOa29UNm5S?=
 =?utf-8?B?Y1hsbTh2NzhOTlQ4aXloSUE2L0ZlZU9TL1dJaWkrMUYvd05yVVd5V29Ub3JZ?=
 =?utf-8?B?UWxGRVFlZTFhRzRocUV4bmNYalpkTXh2dDlIR0czV3QrMlN6eDNZTUFHQ1U1?=
 =?utf-8?B?aHFtVlNZTEwxZVUwT1B4NG1GcmNxcW1CZVV5emZ3TUc3cWtWamhKQzFqZVlz?=
 =?utf-8?B?SEJJRy93MUNQVnVER2dLU2lXZWxWckpKV3FvV3pVU2w0OGhzemNZcThNU29k?=
 =?utf-8?B?ZWlKL0pMcnZhblA4aWZpVTBoOTVYK2k5MU9mQjRtdUt0UHFBSnRWY0xwSmtX?=
 =?utf-8?B?dmFhVVhnd0E2bUZTY0p1dGpNOXFaRWhoQzdtWkhoWTB0Tlg1VDlXcjZvb2s5?=
 =?utf-8?B?NjB6cWRJNnZ1NG1GY01uaG1URnFpUjhiWjFnTzhLZ3RTU2dwS3R3aVU3alI5?=
 =?utf-8?B?SGhhYXVaVFQ5NW55OGpwaDg4anBMTjNuK3dHRlRzUUV4RklVRXA0WTlvZTlk?=
 =?utf-8?B?VEFiT2Z0TVEvbFFyN3EvMTNiOE10b045VlhWTWZ5ekl6T0JFbURLNys4eXFu?=
 =?utf-8?B?VlA3UzFDaWxBbFlmOWs4M2ZuYnlLanVJMDhDWXRNM3JFekJ0dmtVRW4rQkZM?=
 =?utf-8?B?dUprY2UvU0RjSnI4K0NPaFVVbDJFa0VjTlROM3dyODBjdVE5djRjNDFsci9i?=
 =?utf-8?B?R1hsVlJNdGpKQURTYW1Gblk1TEk5SDZ0RzRTdDkyeUNvb3NmaXVPdU5PL2Fv?=
 =?utf-8?B?Q0IwaG5mdEN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG1qcjZhNnlBNGFxS1ZUMSt2ZjF0Q3owNEg0Y0dVSGUxdDBRVW1HSmk2SzBV?=
 =?utf-8?B?WGV0OWJrVmU1bWU3WHJndXlRZGxLMk80UXlmSTRlendxMUs0TkV3d0dJbjhL?=
 =?utf-8?B?ekJoMmM2UDB5MmJxMit3VlFGQlU2UlZKTkVwTDNxeGZRZU1XS1RDODg0SnRK?=
 =?utf-8?B?UVN3Yi9aY1ZEaDZEalFCOERaU2hRZEpFVzUrOHhsOWh0cXVqZGhwSnM3VndX?=
 =?utf-8?B?R1NMWFNRTlcwK2tWVmFreWhCcjdHS2lXcTgxZi90SlVhTHVrNlEyK3VXQTZD?=
 =?utf-8?B?MHRCaTk1QW5wRmtRNk9WNkUxNXFNRDVYdXhoTWMvVHAwekY5c0RCWG9Tdm11?=
 =?utf-8?B?c3NnMmhubDl2eDRvR0dBTlAwMW42a3l2TExJdkx6YnVnMGRlSGkzQ0J0b2dj?=
 =?utf-8?B?czBxSnNENUtxZ29ReEdLaDVCN1ZDU3UwTlVuRGRtaGdmVXhBSlZPQVdvZzNN?=
 =?utf-8?B?ZWtXa2daYkliY1p3TGptenhjb1Y1TWZFdTZOL0JWOVdiMXdld0Z0andtN3pm?=
 =?utf-8?B?L2E3ZkFQWXgzTmxTTHlJbTMrejcwTDNwVXd5RU9XUVd2L25yMTVjNzNwSkVH?=
 =?utf-8?B?V2x3ZXVRYzVhUkNlTmYyQkhqU3BpOFpBL1BSS3hjSU9sSUF1QVYxc09JVVMx?=
 =?utf-8?B?VHFvb1NVNUp0TmZTaTNXUFFnQy8yK0dSdXBiaUhPZ3U5TjR4UEtBU1k1b3Bu?=
 =?utf-8?B?UE9kbzFVeWw2bnNkcjZGK2ZmQVo3d1QxRTJDaitkbkt4alRyZ3BqejU3UHNE?=
 =?utf-8?B?eU1HeitPR2N0RDgyd2laZm5EMldNWUdCMndsdjFTU0pOTVRnMHNrNyswMWlq?=
 =?utf-8?B?ZmVFeEZwTHl2MkN1bU9ubUd3WEJlaXcyYWdXdEtLcjhOSU4rZXpFMnVsQ2lZ?=
 =?utf-8?B?Wkd5UVVOY1F2V25sSks1WTQwNk5YSG1vRnZSdHVUUi9wZlZhQnFMSlAyeWZu?=
 =?utf-8?B?SnpLR3R6S0N4MDZWaTBnVTlBQ2ZUZFM2WUZ1cjRwcFFMb3lLa1lRRTRLUkx2?=
 =?utf-8?B?cHBwZWRXalVKVm4ycWlZRlM1VDRUSWJNMG1DT0JjUE9TMW5YVW9sb0Y1RjVp?=
 =?utf-8?B?czYwSTdURzQxNEYzSGFYRGxKRUxSRERYOVZZWkJhUjdTbmZpeUFsa0FIQmhC?=
 =?utf-8?B?YnNiVjhCYUNJd09BV2tDK2xrS21Od2xzN0o3RTdyTnMxQVp2TnVGMGRIUjRs?=
 =?utf-8?B?MnEzYVVyR3NyTnEvTjVXcUoxMWVYWGkwTG0yUzNKMHhtRWhPeTJ6cWtiRUdV?=
 =?utf-8?B?c0RkZWNEakYrVU5OR3pMWFJvcWRvUWpnejVvWUNNbEJUTElLdWw0bUhIMlpx?=
 =?utf-8?B?R3duMlJlYTZzUlF2WkNHZmM5TEthUUxIL1VlU3N5ZGc4M2hZa0VxanQwSEFs?=
 =?utf-8?B?YmtqT0xVZ0V2TWNlYVVkZ1B4aC9ILzc3WkpaUjMrd2pZaFlib1hpa2pwVTY1?=
 =?utf-8?B?QjZDczZKM05CWFhDZkJVTTg1WHl4V3RjaCswNG9vOTQ2L1pCdG5tRGZkdVBB?=
 =?utf-8?B?cjV0L1NQQnc5N1NYcWp6ZzJqeHducTRZQkRTSy9RK0p1aU9FUExlaWt2eU5r?=
 =?utf-8?B?ME1PWis4cG5CdkpuQ24xSjlpTGthTDRpLzBMU3hSMi9jUk9CenQ3Nm50V2dm?=
 =?utf-8?B?VGZFalZOdlIwaTZBOEtGdmpKN3NzSGdHMG9tMWgvMkhxM3dycm1JWGRxMlh5?=
 =?utf-8?B?dFFrYmZ2eUY5dmRoVzNsWGlWd1kvRXRNd2N0YlFiSUY4WndpVzk2dWl1TERN?=
 =?utf-8?B?RGNMMXRYbE9SOWp3c1BsdW41VkFPZUx1MXRNUnYrRHVpQVpVdktOVnNoWWxl?=
 =?utf-8?B?dGtOWDU3UC9ZcVVKd3VMTHhMU2dNMFMzRFhGb2MrRkl5eGpzYXNDZ0lLKzMr?=
 =?utf-8?B?TXRTNHYvNDF5ZmRWSjFVempTUEpsbW5qQWxkK1U2eWRKQUI0RUQ5b2tBSzFi?=
 =?utf-8?B?VzlNbVZZa2gzaXduNXhwNW80amFuV080VE94LzJuUUdZU0c2cnhPeVI2cVZ1?=
 =?utf-8?B?WVlncjZlQ3gycXcrZHdxSmRYVDBaTEVKUXhWbm1ySDk1NytwRzY1ajRIUnpT?=
 =?utf-8?B?KzJQdlJvbVVweWtrOW5tM09IOXo2Mm91OEcrQ1dTMzdZTXdJcGpqYXFBKzJM?=
 =?utf-8?B?R3lZQW1mc3F5bE1KenA1R2QzQ3U4VVdXRnpFVEh5bll0ZVNIT0xaKy9SZytD?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aec646f-23fe-4b89-2b44-08dd50ce85db
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:49.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZjxohED9ge9PQYIQFdSoM6lQvvqIjLJm4eM8jWxiwElRmHYZW/ZQyo8trBjalKaLP+4J+qogGARQ2fbchzd8OsSvyRFgwzKoIBY+9+x2yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138

The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
and one output port. It receives the data with the help of an external
MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video
Capture (VICAP) block. Add a V4L2 subdevice driver for this unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
 .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 +++++++++++++++++++++
 2 files changed, 732 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index 818424972c7b..0c18efd1f1b4 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -4,4 +4,5 @@ rockchip-cif-objs += rkcif-dev.o \
 	rkcif-capture-dvp.o \
 	rkcif-capture-mipi.o \
 	rkcif-interface.o \
+	rkcif-mipi-csi-host.o \
 	rkcif-stream.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
new file mode 100644
index 000000000000..fa3f42b2dc55
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
@@ -0,0 +1,731 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip MIPI CSI-2 Host Driver
+ *
+ * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define CSI2HOST_N_LANES     0x04
+#define CSI2HOST_CSI2_RESETN 0x10
+#define CSI2HOST_PHY_STATE   0x14
+#define CSI2HOST_ERR1	     0x20
+#define CSI2HOST_ERR2	     0x24
+#define CSI2HOST_MSK1	     0x28
+#define CSI2HOST_MSK2	     0x2c
+#define CSI2HOST_CONTROL     0x40
+
+#define SW_CPHY_EN(x)	     ((x) << 0)
+#define SW_DSI_EN(x)	     ((x) << 4)
+#define SW_DATATYPE_FS(x)    ((x) << 8)
+#define SW_DATATYPE_FE(x)    ((x) << 14)
+#define SW_DATATYPE_LS(x)    ((x) << 20)
+#define SW_DATATYPE_LE(x)    ((x) << 26)
+
+#define RKCIF_CSI_CLKS_MAX   1
+
+enum {
+	RKCIF_CSI_PAD_SINK,
+	RKCIF_CSI_PAD_SRC,
+	RKCIF_CSI_PAD_MAX,
+};
+
+struct rkcif_csi_format {
+	u32 code;
+	u8 depth;
+	u8 csi_dt;
+};
+
+struct rkcif_csi_device {
+	struct device *dev;
+
+	void __iomem *base_addr;
+	struct clk_bulk_data *clks;
+	unsigned int clks_num;
+	struct phy *phy;
+	struct reset_control *reset;
+
+	const struct rkcif_csi_format *formats;
+	unsigned int formats_num;
+
+	struct media_pad pads[RKCIF_CSI_PAD_MAX];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_fwnode_endpoint vep;
+	struct v4l2_subdev sd;
+
+	struct v4l2_subdev *source_sd;
+	u32 source_pad;
+};
+
+const struct v4l2_mbus_framefmt default_format = {
+	.width = 3840,
+	.height = 2160,
+	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_RAW,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_NONE,
+};
+
+static const struct rkcif_csi_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	{
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	/* Bayer formats */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+};
+
+static inline struct rkcif_csi_device *to_rkcif_csi(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkcif_csi_device, sd);
+}
+
+static inline __maybe_unused void
+rkcif_csi_write(struct rkcif_csi_device *csi_dev, unsigned int addr, u32 val)
+{
+	writel(val, csi_dev->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_csi_read(struct rkcif_csi_device *csi_dev, unsigned int addr)
+{
+	return readl(csi_dev->base_addr + addr);
+}
+
+static const struct rkcif_csi_format *
+rkcif_csi_find_format(struct rkcif_csi_device *csi_dev, u32 mbus_code)
+{
+	const struct rkcif_csi_format *format;
+
+	WARN_ON(csi_dev->formats_num == 0);
+
+	for (int i = 0; i < csi_dev->formats_num; i++) {
+		format = &csi_dev->formats[i];
+		if (format->code == mbus_code)
+			return format;
+	}
+
+	return NULL;
+}
+
+static int rkcif_csi_start(struct rkcif_csi_device *csi_dev)
+{
+	enum v4l2_mbus_type bus_type = csi_dev->vep.bus_type;
+	union phy_configure_opts opts;
+	s64 link_freq;
+	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
+	u32 control = 0;
+
+	if (lanes < 1 || lanes > 4)
+		return -EINVAL;
+
+	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
+	link_freq = v4l2_get_link_freq(csi_dev->source_sd->ctrl_handler, 0, 0);
+	if (link_freq <= 0)
+		return -EINVAL;
+
+	if (bus_type == V4L2_MBUS_CSI2_DPHY) {
+		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+
+		phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2, lanes,
+							   cfg);
+		phy_set_mode(csi_dev->phy, PHY_MODE_MIPI_DPHY);
+		phy_configure(csi_dev->phy, &opts);
+
+		control |= SW_CPHY_EN(0);
+
+	} else if (bus_type == V4L2_MBUS_CSI2_CPHY) {
+		control |= SW_CPHY_EN(1);
+
+		/* TODO: implement CPHY configuration */
+	} else {
+		return -EINVAL;
+	}
+
+	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
+		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
+
+	rkcif_csi_write(csi_dev, CSI2HOST_N_LANES, lanes - 1);
+	rkcif_csi_write(csi_dev, CSI2HOST_CONTROL, control);
+	rkcif_csi_write(csi_dev, CSI2HOST_CSI2_RESETN, 1);
+
+	phy_power_on(csi_dev->phy);
+
+	return 0;
+}
+
+static void rkcif_csi_stop(struct rkcif_csi_device *csi_dev)
+{
+	phy_power_off(csi_dev->phy);
+
+	rkcif_csi_write(csi_dev, CSI2HOST_CSI2_RESETN, 0);
+	rkcif_csi_write(csi_dev, CSI2HOST_MSK1, ~0);
+	rkcif_csi_write(csi_dev, CSI2HOST_MSK2, ~0);
+}
+
+static const struct media_entity_operations rkcif_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int rkcif_csi_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+
+	if (code->pad == RKCIF_CSI_PAD_SRC) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							RKCIF_CSI_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	} else if (code->pad == RKCIF_CSI_PAD_SINK) {
+		if (code->index > csi_dev->formats_num)
+			return -EINVAL;
+
+		code->code = csi_dev->formats[code->index].code;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int rkcif_csi_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *format)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	const struct rkcif_csi_format *fmt;
+	struct v4l2_mbus_framefmt *sink, *src;
+
+	/* the format on the source pad always matches the sink pad */
+	if (format->pad == RKCIF_CSI_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!sink)
+		return -EINVAL;
+
+	fmt = rkcif_csi_find_format(csi_dev, format->format.code);
+	if (fmt)
+		*sink = format->format;
+	else
+		*sink = default_format;
+
+	/* propagate the format to the source pad */
+	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!src)
+		return -EINVAL;
+
+	*src = *sink;
+
+	return 0;
+}
+
+static int rkcif_csi_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &default_format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rkcif_csi_enable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi_dev->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[RKCIF_CSI_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_CSI_PAD_SINK,
+					       RKCIF_CSI_PAD_SRC,
+					       &streams_mask);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err;
+
+	ret = rkcif_csi_start(csi_dev);
+	if (ret) {
+		dev_err(dev, "failed to enable CSI hardware\n");
+		goto err_pm_runtime_put;
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		goto err_csi_stop;
+
+	return 0;
+
+err_csi_stop:
+	rkcif_csi_stop(csi_dev);
+err_pm_runtime_put:
+	pm_runtime_put_sync(dev);
+err:
+	return ret;
+}
+
+static int rkcif_csi_disable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi_dev->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[RKCIF_CSI_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_CSI_PAD_SINK,
+					       RKCIF_CSI_PAD_SRC,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+
+	rkcif_csi_stop(csi_dev);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops rkcif_csi_pad_ops = {
+	.enum_mbus_code = rkcif_csi_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkcif_csi_set_fmt,
+	.set_routing = rkcif_csi_set_routing,
+	.enable_streams = rkcif_csi_enable_streams,
+	.disable_streams = rkcif_csi_disable_streams,
+};
+
+static const struct v4l2_subdev_ops rkcif_csi_ops = {
+	.pad = &rkcif_csi_pad_ops,
+};
+
+static int rkcif_csi_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RKCIF_CSI_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = RKCIF_CSI_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	int ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+					       &default_format);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_internal_ops rkcif_csi_internal_ops = {
+	.init_state = rkcif_csi_init_state,
+};
+
+static int rkcif_csi_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *sd,
+				    struct v4l2_async_connection *asd)
+{
+	struct rkcif_csi_device *csi_dev =
+		container_of(notifier, struct rkcif_csi_device, notifier);
+	int source_pad;
+
+	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+						 MEDIA_PAD_FL_SOURCE);
+	if (source_pad < 0) {
+		dev_err(csi_dev->dev, "failed to find source pad for %s\n",
+			sd->name);
+		return source_pad;
+	}
+
+	csi_dev->source_sd = sd;
+	csi_dev->source_pad = source_pad;
+
+	return media_create_pad_link(&sd->entity, source_pad,
+				     &csi_dev->sd.entity, RKCIF_CSI_PAD_SINK,
+				     MEDIA_LNK_FL_ENABLED);
+}
+
+static const struct v4l2_async_notifier_operations rkcif_csi_notifier_ops = {
+	.bound = rkcif_csi_notifier_bound,
+};
+
+static int rkcif_register_notifier(struct rkcif_csi_device *csi_dev)
+{
+	struct v4l2_async_connection *asd;
+	struct v4l2_async_notifier *ntf = &csi_dev->notifier;
+	struct v4l2_fwnode_endpoint *vep = &csi_dev->vep;
+	struct v4l2_subdev *sd = &csi_dev->sd;
+	struct device *dev = csi_dev->dev;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
+
+	vep->bus_type = V4L2_MBUS_UNKNOWN;
+	ret = v4l2_fwnode_endpoint_parse(ep, vep);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to parse endpoint\n");
+		goto out;
+	}
+
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep->bus_type != V4L2_MBUS_CSI2_CPHY) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "invalid bus type of endpoint\n");
+		goto out;
+	}
+
+	v4l2_async_subdev_nf_init(ntf, sd);
+	ntf->ops = &rkcif_csi_notifier_ops;
+
+	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
+	}
+
+	ret = v4l2_async_nf_register(ntf);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
+		v4l2_async_nf_cleanup(ntf);
+		goto out;
+	}
+
+	ret = 0;
+
+out:
+	fwnode_handle_put(ep);
+	return ret;
+}
+
+static int rkcif_csi_register(struct rkcif_csi_device *csi_dev)
+{
+	struct media_pad *pads = csi_dev->pads;
+	struct v4l2_subdev *sd = &csi_dev->sd;
+	int ret;
+
+	ret = rkcif_register_notifier(csi_dev);
+	if (ret)
+		goto err;
+
+	v4l2_subdev_init(sd, &rkcif_csi_ops);
+	sd->dev = csi_dev->dev;
+	sd->entity.ops = &rkcif_csi_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->internal_ops = &rkcif_csi_internal_ops;
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
+		 dev_name(csi_dev->dev));
+
+	pads[RKCIF_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					 MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKCIF_CSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
+					MEDIA_PAD_FL_MUST_CONNECT;
+	ret = media_entity_pads_init(&sd->entity, RKCIF_CSI_PAD_MAX, pads);
+	if (ret)
+		goto err_notifier_unregister;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret) {
+		dev_err(sd->dev, "failed to register CSI subdev\n");
+		goto err_subdev_cleanup;
+	}
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+err_notifier_unregister:
+	v4l2_async_nf_unregister(&csi_dev->notifier);
+	v4l2_async_nf_cleanup(&csi_dev->notifier);
+err:
+	return ret;
+}
+
+static void rkcif_csi_unregister(struct rkcif_csi_device *csi_dev)
+{
+	struct v4l2_subdev *sd = &csi_dev->sd;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(&csi_dev->notifier);
+	v4l2_async_nf_cleanup(&csi_dev->notifier);
+}
+
+static const struct of_device_id rkcif_csi_of_match[] = {
+	{
+		.compatible = "rockchip,rk3568-mipi-csi",
+	},
+	{}
+};
+
+static int rkcif_csi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rkcif_csi_device *csi_dev;
+	int ret;
+
+	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
+	if (!csi_dev)
+		return -ENOMEM;
+	csi_dev->dev = dev;
+	dev_set_drvdata(dev, csi_dev);
+
+	csi_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi_dev->base_addr))
+		return PTR_ERR(csi_dev->base_addr);
+
+	ret = devm_clk_bulk_get_all(dev, &csi_dev->clks);
+	if (ret != RKCIF_CSI_CLKS_MAX)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	csi_dev->clks_num = ret;
+
+	csi_dev->phy = devm_phy_get(dev, "csiphy");
+	if (IS_ERR(csi_dev->phy))
+		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
+				     "failed to get MIPI CSI PHY\n");
+
+	csi_dev->reset = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(csi_dev->reset))
+		return dev_err_probe(dev, PTR_ERR(csi_dev->reset),
+				     "failed to get reset\n");
+
+	csi_dev->formats = formats;
+	csi_dev->formats_num = ARRAY_SIZE(formats);
+
+	pm_runtime_enable(dev);
+
+	ret = phy_init(csi_dev->phy);
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to initialize MIPI CSI PHY\n");
+		goto err_pm_runtime_disable;
+	}
+
+	ret = rkcif_csi_register(csi_dev);
+	if (ret)
+		goto err_phy_exit;
+
+	return 0;
+
+err_phy_exit:
+	phy_exit(csi_dev->phy);
+err_pm_runtime_disable:
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static void rkcif_csi_remove(struct platform_device *pdev)
+{
+	struct rkcif_csi_device *csi_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	rkcif_csi_unregister(csi_dev);
+	phy_exit(csi_dev->phy);
+	pm_runtime_disable(dev);
+}
+
+static int rkcif_csi_runtime_suspend(struct device *dev)
+{
+	struct rkcif_csi_device *csi_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi_dev->clks_num, csi_dev->clks);
+
+	return 0;
+}
+
+static int rkcif_csi_runtime_resume(struct device *dev)
+{
+	struct rkcif_csi_device *csi_dev = dev_get_drvdata(dev);
+	int ret;
+
+	reset_control_assert(csi_dev->reset);
+	udelay(5);
+	reset_control_deassert(csi_dev->reset);
+
+	ret = clk_bulk_prepare_enable(csi_dev->clks_num, csi_dev->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rkcif_csi_pm_ops = {
+	.runtime_suspend = rkcif_csi_runtime_suspend,
+	.runtime_resume = rkcif_csi_runtime_resume,
+};
+
+static struct platform_driver rkcif_csi_drv = {
+	.driver = {
+		   .name = "rockchip-mipi-csi",
+		   .of_match_table = rkcif_csi_of_match,
+		   .pm = &rkcif_csi_pm_ops,
+	},
+	.probe = rkcif_csi_probe,
+	.remove = rkcif_csi_remove,
+};
+module_platform_driver(rkcif_csi_drv);
+
+MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Host platform driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


