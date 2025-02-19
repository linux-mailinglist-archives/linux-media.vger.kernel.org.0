Return-Path: <linux-media+bounces-26347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82605A3BB75
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0191E7A74CC
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D234D1E0B86;
	Wed, 19 Feb 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="DW2I10eG"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773FD1DFE1D;
	Wed, 19 Feb 2025 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960215; cv=fail; b=WXQ/De6Ni1GZmn7314rSfxbli8iC+VyySbDr+LuQ/8+DX4EHxsXezr3QZ2sWZo4F1rBhP0XMZA4vXgbfMDqz+JPC4XIxXp/EQSf4rmt2K4XnMkIcZ7W/IVmwUlLBQtmXGAG6Oc92HkrojhCwMwfw2ch8spTnaNUf5qHeX54Ufhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960215; c=relaxed/simple;
	bh=1KgRs60YsY5MkPQfV9P23YyKQHKBCw4RhAHsRw+Z8uY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bdIMp7cnKHPhXclhOUWJG+NhfUi17ao04tj61uuE7TZC+N98QEvv518UTpvGH2f28Y182Z0Ez77d2zwBGL275kumwPuy9g43fFHezilv9YoACw9uWXnuAZiZAExEcp8teKsNy/JY4mnildfCRWRi5nDzCI/LJl7t6J6x8vbprUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=DW2I10eG; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQA0ZuxBCB5XZ5oQtITXPzqavx/nkIDggzM1J9pwsRKQCGywwxUyoIPKO7HlHm80nmaoeTRJKoNUk2VlfGDoN/WRB4vbFb/YGays0nodTcoJdEBGzBLzALo//xRo1SwaaUavdK7bxk656QwjXOQLntrsaarj1OUaM5dzVAuFyu6slb3CK9y77vCIX7Qp89iZ2W/de3CNSxOjkNibb2qGt4Hm1LBA+Z+zC4lV59SOeMO4IikxC4qsqTR+tOTyNiG1Djz1Cv55ldQw/9+f2aTl92tCbr5R/7YbQnacJVdxfZmISwTnQQOrau5GUbPE5/N+WqBmbWFBA00NwKXE1sYqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsKNbYqhhEfds3zYlOEaEzUmOcWkgR6/7ip9ZUzohzA=;
 b=iCj4cciHCr02umvazlyD8VR/33NilwIv9QlGQxJm1wvc+WzpZj+xtbZFAz15a/n0bzmRaiMZKo/dQvEjw6h8bsu6bvVbe+ra9xkRa+wFle1JrE3a4j/NNlwBcCbdeM5IVE3Kt925uvN5JMoIJK/ZkSBSjcRj5lr3HW4HztMRiyU5r2yKEnVPP7Ekb+JqhnMQswz6SkXRMbWVDjxkcPtdolB6iHljeTSgzF3pEXMA0qOcCdRBhRej+RYhcdU9la8KbfkYRlBHwwuWKkpgICURhQwr2zoPfcviVTK5SDM0QbSBDUXnsR63CouO1YBEGjfsorhkYCiIUYKIMOKtfzGr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsKNbYqhhEfds3zYlOEaEzUmOcWkgR6/7ip9ZUzohzA=;
 b=DW2I10eGN2EELMGMhsUPgMhSr5mfu0h+pYn8yrAFk+UVUGwtbNuu17VkYkUwKeJXtozWX0iRppaB2kVWUtE73CiHs3YWXr7o2EnlmWLKvoZv61A/elSV3XNM2M5sAyPMUn0hDYFr5zzcktIb0KdBaB0QeIOVaQ/AiNk+Or+JkXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:45 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:44 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:34 +0100
Subject: [PATCH v4 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=5785;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=1KgRs60YsY5MkPQfV9P23YyKQHKBCw4RhAHsRw+Z8uY=;
 b=GLVvQDokJMAsTkPlynliDMcs/IiuL93ZH+p2AEmLaXyZJEHMcc8btE6HArgI/HbkQu7twZ3Ig
 wTbMzJzDPsHAoA3bLtCtw0R8dBzKUAOBxyP+HE0nvQn0NEJrW21MvPi
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
X-MS-Office365-Filtering-Correlation-Id: 8a670d97-b9ea-420d-f4df-08dd50ce82d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjRmb1VDYmREaktDcUFScUdxSlhPd3ZGNDg1QkU1dFJwTldydHBIK1Zyd1dL?=
 =?utf-8?B?djRlVy9QTDFMdEpRTG1oQnNPaXZwNCtzdlh0cUcxeTZZdm0zUlZEb1VrUCt1?=
 =?utf-8?B?emVsY0Y1cm1PdVd1SnVKWCtWb3RsOGwyS0VrQjZtUFhWdEl3ZkVUd1Y1TXE1?=
 =?utf-8?B?SXR6cnBycVBVdUhReklPbUVKZDlHNGZkdmVQdWpudFc4eUZQbWo3RlduMm0w?=
 =?utf-8?B?WWhvbzVpaEkrdk51OUZJaS9ITDJ1NGQ3dHViM0RtbVFBK1RYeDJNWTVaWjhx?=
 =?utf-8?B?NnVxSHIrc1lWWGZ3MWkrckpQYjdta25VOU04YU9TcEVmT0JmU1NOdnJrY0Na?=
 =?utf-8?B?dm9qVDVodXdSUGVJVmljZFpWZ0VzU3lydnowR2RFTnFqa1dkdUd6dkRndWp5?=
 =?utf-8?B?VVh5Sm1YdFo2ZDF4a3Fsc0pNRzljRkFLK0d4NFJmSjRQbm1hOGJKMnRpR3dK?=
 =?utf-8?B?NlFEWm1GYlZsZGhnbDlFc1lERVNzRUlqN1E1L1BCSmh3SzFGeElsb0lPUXll?=
 =?utf-8?B?MUplZG93aDJBWXJaWlcrR0JrQ1NoZ3M3YVA2VHl2UGtvVzcrWkp3V2I1dyt6?=
 =?utf-8?B?UStLUmJCSVBnUHQ0SUhLNmxMY05oL1RwZFNtNHh0OUZMN2M1TkQwMVN3eFll?=
 =?utf-8?B?U3NreXhacS9BNlg5dEdrQmd4K3BFQ0F1cndRWFlneHEzTlhsS0k5YVpNRW9C?=
 =?utf-8?B?KzhZbTlweTNlOXNGWlQ4NHBhSjdVZkEzM3c3WXN1NFUrbEh2Z2tjSkZIRmdr?=
 =?utf-8?B?Mnd3U3U4QmJ4cEJTZFdMTXZLODN1MGZMK3VadHBscTNMajk1NDNYTUxwL1BG?=
 =?utf-8?B?L2JBTDVZU3dML2ZURE5XSHpQeXZNZjY2b1JkVWpqMlB5MEJEdGFCSXNSVEho?=
 =?utf-8?B?Zy9VUFlETzBpeHNSRXVYVUxtRnUxL25TRXpPakYwNlRiVzBJcTYrSkdkNSt3?=
 =?utf-8?B?eGc0cUkzVk9tampaSjNWeHR6cXNQS2EvVEtaKzRXYzB5dXp2NGVwMk1xY0xH?=
 =?utf-8?B?Qmdac0NpVytPa0dLZitmUUxkTkFmTGJsOWV3SWF2WVM2YUZqaHd2SjlhTHZF?=
 =?utf-8?B?VUplME9mYVRDUWF0a3ZGdGhwVkF1ZHZZa2hEK2ZISHprOHArdlJENGFjUStj?=
 =?utf-8?B?SnpidGlva255L0hRckJyUURSZS9yb0VUYWEzSzhFeDYrSzl4TkFhS09EU3pl?=
 =?utf-8?B?VlVLbkxZRTZoYk0xZk9xOC9CNTdOWFFldmRJRE4wc1RtV2k3OFIvN3paYTlm?=
 =?utf-8?B?WWF1STFDdjYvZGhBVnNMYzhyQkJQNkowaVFTMDgrTHZIajM0NHFLK0JLSVB2?=
 =?utf-8?B?WmVjUzBlMCtwajVjNThwU0xtTWRtaDg4bkllaGZhdnI5VUJkVHp4QXJlQ2Zs?=
 =?utf-8?B?ZGhpVVNiT0ZkL1VPQ1V0ckhEZCtHeE9UbzdqbHZjYjlsdmFPd244YlEvcFl1?=
 =?utf-8?B?RERTeC9GSjVVblpqWnNNVU11WmFRTURSZWRZYVpqTGY2OVhyTzdnS3dwWngy?=
 =?utf-8?B?L0FGd1hGTVNEU2lOMG95MVB3VnBzNUZlQW1hME1oeFNpY0czQmlLdFNEcXlX?=
 =?utf-8?B?TGhud003V0VrY0cwTE0xZWpNWWhuZlhONkdOMENEeER2S0E3R3hmYk52b0RO?=
 =?utf-8?B?bkhnVXk4NkwzU2lQTFFjSG0rc2t6MWVUeGVPRWpMNlJJQk1rNUhCQVdJRHFL?=
 =?utf-8?B?SkNZRmtIMHgrNklGMmxjVHE1N1hqclJadWxIbzQ5TVVmSGZjdHY1SFVmQzZW?=
 =?utf-8?B?QVFmdXBEc05hbm5OeSs4WXZDSkZtV1BFSGxVd01Ma3RVMUJsZDZIeGdnNDRX?=
 =?utf-8?B?VkFuQlA4eVlwTEV2c2NlVVdBenJpWGh0VVVxZmM4aW9wSFUxNTQ4TEVVRTND?=
 =?utf-8?B?cDkyZWF5akNzQTd5enhrcnRIOXBIazdvQ0FPaTNwT0xiUnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGF6VlZNYVE5bElPd3lSamR0Zmg3N2l3VGlQd3hmeGdab2RRaUxEUmI1Rm5t?=
 =?utf-8?B?Z3ErRTBYZ2FRbXpSTGluSVpvUDhIdkd6U0ZNVlc1NmZwcW91RHNqd3RRd2Rr?=
 =?utf-8?B?NGs5K0VlQ0pvZy9Bc3Zhc1J4UzFRYVFranZLZS9ia0dlTzBIcnZUWHJUQ2Fy?=
 =?utf-8?B?cTY1empEUmhCQksxOXpYTHB0Y25EZGloOUJnR2xaQnFHR2t2ZmhCblhrdEgy?=
 =?utf-8?B?eldhTldMaFFWUWdVTDhMQ0xWekREZWVyWFVaRmF6MnRCSzh2QkVHa25lV293?=
 =?utf-8?B?OEsyaFVMVGY3L01hc3RHTTRoQkpCL2F1QTlNbitpNnU0c2o2M2NwdGIyOVdG?=
 =?utf-8?B?VHhSRGt1M3FBTEJDN3QzTzl3eTJGRHNZZDEvaDBQaVplcmJYVmUxcFZ4YThX?=
 =?utf-8?B?TUVVdUNNa2xtanJ5TXR2TTcwdm1pdmVtV2ZlKzdiMEd0b3dCcnNpZ2N0Qnhi?=
 =?utf-8?B?eklrK0ZGUGJMS3FkNmd1RE5iQ0JJSGdsQmJPb1RsbkkxK1NOeHM4MTFMMmho?=
 =?utf-8?B?dVhCMXU2ZWJGUHF1a1I2YjBaNDc0RjFRRkdRa1pHbE5OK1NTWndEbkFwZ0x5?=
 =?utf-8?B?SlhVVTR6UVBsZUdFU3lGWmx1dkg2czR5TmdJb0lObU80YmVJU2wzNHZ2cWhr?=
 =?utf-8?B?UThNRDU5M1RMT1htYUZLZjkzc0E1SlBDcm02QlNyVmQ4TlpLTU1TS0YzMGdk?=
 =?utf-8?B?RzJtWFpIREZEaFg3RWdISWZVV2ZlSTZlekRUZVdDY1J6QmZPTW41ZXByZFpv?=
 =?utf-8?B?ZEYvUkQ0UnRvM0NLbWE4ajl3VnFBOXpyRHFFd2VrbW5Id2NYb3ZTbU0wVUQ0?=
 =?utf-8?B?SUlITzVPeUg2bm55dDdDTjd2amdKQS9iOEJJVjJGU2VHalp5SHhoTVhnQmFq?=
 =?utf-8?B?dHZpaEJxOUdqU2oyRlF5MVpuazRzT2NObDdiZnNEM1VzZ040VFZaNnU0Q3V3?=
 =?utf-8?B?Mmg1L3AxYWFydm1BYUdzSDkvWTBSVWFJRittdTcwQXljVTBHNUNoR2ZMd2xq?=
 =?utf-8?B?VE1MSUNqb2Vwa2JGY1cyTm5hQ0NOeU5PTUdKYmZ2aUNPWnd5SWQ1NjQ2VmNs?=
 =?utf-8?B?ZG52d1l5bm1XZ0hJSXRWYWZwYUZZQ1kzU2J3Y0EvTjR2bkg5QkJMWEFWOVZu?=
 =?utf-8?B?SVloMEpzbjJOdmRaT0lHTTB3YktHWnVWcUo1a2RSVG5UWU02NWpoZHAvWkd5?=
 =?utf-8?B?dXJTanhObmdUYXc0OHVEc0FMN08vNDJRUkdnOFlxbm93SjV4S3UzOW9MNUUv?=
 =?utf-8?B?eVVFOFdlbkR0RU9ocWl1U2ZIS3A0NHNHRENpQjJxbU9uM2pjS3lwYVhlckY4?=
 =?utf-8?B?bFRmNXJqV0Y0NWdKeWp1VExHTkZMSkN2VzBDNm1sREVEQXE2QWdDcnNKY3N3?=
 =?utf-8?B?MmxkTDVpdDVYejFKOUNFV1h1c0tTQVczQ0tsVW1QRXU2K2NtS0VsSXp3aStB?=
 =?utf-8?B?VXQ1NW9xcW5MM2xGUFVzaE1Ibjk0elY4cUdhdXl6YVdORFZNamEyOE9JOWh2?=
 =?utf-8?B?YkJpMm5CM0F2cE1EYW9xa09KOXlVNkFGSXU2QlpvRzRjNkhjbWlMUUgzUC92?=
 =?utf-8?B?ZVZubTk3V0ZzZTUyVXFmR2VRbUR1YW96VjZJYWlwMGdiMk15S3grRG5HR2Vo?=
 =?utf-8?B?ejNtVEovTlY2SjI0aCswWEdqYWJibVV4OGNBdDM0ODhMYWFrQm5tSkRueEU0?=
 =?utf-8?B?K1BhK1l2b1JkREFHUkZNUmtBcmJZaGVCTFRxcTBJK0x1VllycXRsZVJjZHR0?=
 =?utf-8?B?eGIxUytxNUVPUUZSMitYdTJ6L2pYMWhjMXRjWlNVeVdUQmlXTDJIdmtCUHh1?=
 =?utf-8?B?UWVIU293U2xGME4xaGI1cXFOUDJSU1EvUFowYUlTL0FnT1B2RTA0SlloRFZH?=
 =?utf-8?B?U1Q4TVhWWlJ6OHBDcHFjK3A1eTZsQmttSXZuMU5GYVhCYzNXQyt6V3pvdDFU?=
 =?utf-8?B?NkRlTVNjRjNVTjZIb1pBLzNRWHpKRmFIekhaL05UNlNqNTRyaE9NVW9kTm1G?=
 =?utf-8?B?MUlLWVZXQmhPNjRYZWZyY2ZRL1ZNV1pEMGhmbHlzM1NMQ2ZtNm1oNzQ5bkox?=
 =?utf-8?B?ZVdycGw3M2FZVGJPR0VDU2hEMlN2NXY5SXNqUEhJMkg1WFh3WjJhT01JQzFN?=
 =?utf-8?B?eW9TSEZYQmVpd29zWm13U1JhdlpCYWhlZFFxbTE3TklFZ2YvdURxL3c3QnMv?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a670d97-b9ea-420d-f4df-08dd50ce82d7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:44.6746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXn7+pQGZDbVh3m29UEAkTBNABC6i6+UXNJMth7ZXZH2m6oEVd8YrAiuI2J3XDAWOx3BiX2ocmlbtz0zJsxPnINCt2pW9BBePUarFbcyq2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138

Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
new file mode 100644
index 000000000000..3dc15efeb32e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -0,0 +1,168 @@
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
+    };
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


