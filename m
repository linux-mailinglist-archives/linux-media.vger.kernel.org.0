Return-Path: <linux-media+bounces-23614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540F9F5074
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4911B7A8E60
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009111FA82E;
	Tue, 17 Dec 2024 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="wKv/ClDE"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023088.outbound.protection.outlook.com [52.101.67.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95E1FA244;
	Tue, 17 Dec 2024 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450940; cv=fail; b=nmnxEjI9MoaDWIuv72Aq0rpxD7b+VxwRSbxewXse85ZsT6idUuX4ueQKAoq5NyRpN75iw1oJ0BlTdTWK2HuH//LZctLoddMYtgLzF42FWOR2k7imcBS1Uydl5Y4GYARu/zCgT07N2rFRSLP6LoYVXTWYYMkGJ41ZzD57xqwqk5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450940; c=relaxed/simple;
	bh=Iv8zXQjKTO9MzBU4yq6In+vkOstndZA8TJEpuCCdl3E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gDRG3v9BdZf/vUcBZ+EYArF5noOb4GQSdC2mkLoGuUmWv9TovEKY6fucu3oStcpm9bfrh4zVx9fUgUukaHvePrZjTl9gzjqAFVfeJM+5rqUc5pUbIORawYXpX3iQs7Id1DKc6sxBaYnBfI8hQymMI8sCeYMw+Lr/svqsFZ+KKEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=wKv/ClDE; arc=fail smtp.client-ip=52.101.67.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmSXdVwRQw5ZATM31yMNrV1ZEK0LDI/uP56HO3GtKwR5TV+zIgq2qbcquEpxWEFmf/Gu0UCmYNE71zJtPcRM5/11+XTx1FHlAQ+sBjAKxhHSQzzR4IYw/2sm/Vua4nYUqZguYcNKJKy8xb/Ie7HJJYCQL2yTIyOXdNJ2gLogsD7g8mI3jU414YWzJAHCT0Zw6IJIDs7b66hoq+TJhIT1Y4iI7ARkotpXyj2zOVga1NB8GR4yoELhancrkNBgTkCTivxxImmKsG0wIXhgdIG3ZtKKQEwji/EU8jzj0LyS/jGBt5apGcNrUx7LyCx2vALQlXofq9emZFSd7mcQm17NPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk3b1vxeDZn/wel0Eldbt0PkyheM0Xq6NUrTiMKUNuw=;
 b=L0La9XGVxLOaUksYzNTX8b5YJU2okuYTR64hxwXMHYg1xtURDPqNW79wBvlx9iTVh3Shr+dFgMVrk6/1MWu8JMQRYNEhar4TaK0LdToha8UTfahyA154Cp7Fkjq99i2N3SDFtwX23tidkFR2P9a31JVaGstZoT8B61OdnwJc1Jmz42v8mNbeHFo1RbfQ1Ec3c9jaYjJJypgMNmY8FG4px3t0+TlQODoyNAEy7gs3gTso51Mg3T+l5chuhQmN+ZK8mnhQkirwsb5Bmn/W+vu75IJSEUEY/IOJXjURknLGF4Qw6xGG7+DI3yQLyCS19ujKDC5B8Qg1grlpYsedtF0Pyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk3b1vxeDZn/wel0Eldbt0PkyheM0Xq6NUrTiMKUNuw=;
 b=wKv/ClDEFKb34C0tApzqx96+T5K+jCK5nl20pQuBuI1vZIfQOuyk18ZhSIpBot6YFoNQ5DB9y2hvXVHSGGUVnK+g9OYBxj+7CBKqPz1atDNwgXkRzevBgD+Yhuja34g+kb5NLRhXuQsgjMNeZFIEWLMEOgEmef9XHngFghvqqFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10149.eurprd08.prod.outlook.com (2603:10a6:20b:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:55:29 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:55:29 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 17 Dec 2024 16:55:18 +0100
Subject: [PATCH v2 6/6] arm64: dts: rockchip: add vicap node to rk356x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v6-8-topic-rk3568-vicap-v2-6-b1d488fcc0d3@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734450919; l=1988;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Iv8zXQjKTO9MzBU4yq6In+vkOstndZA8TJEpuCCdl3E=;
 b=EVAgMNiduf1W5NpmeMIcas1x/p175qznzjS81JBdWMP96nFigBHCqR4UcdBSgDckQefzIFR+6
 bDl8mgv1Jy6DytRedq+/PcTWgtAUoEYeMaZlpXXB/A/S5/jAyYMg4Ab
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
X-MS-Office365-Filtering-Correlation-Id: 32ec1d0f-d077-425c-55d6-08dd1eb33b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkF0VFJMak5pbk5qWWVrNVJrZmV2c0ZhS2h3b2pGbVI3bEQxejBwSFBleDBT?=
 =?utf-8?B?aG1WeGVEYTZMNGNwS3ErK3BQRjBKSlJkbXhLVXFSZTBGN1V6V1JKUUdKRnYw?=
 =?utf-8?B?QWJPWXVxaHhvZU9Xb3E4bHI4SEZVYzF6NFFBa04yTmZDandUNlp2bUVYdG8r?=
 =?utf-8?B?bjRHQVZ2b1hPOXliZThUYmpiUUxwbGJhVHlCcDI3SzR1RDRSTUJzUWZFK0FG?=
 =?utf-8?B?eFZnMWkrOGo1WG1tc1RLaGtza1N0NzFXaHR1dkhRbTE3Rys0SlFxUjFZazdt?=
 =?utf-8?B?cDdHOStyR2YrZkVJYytiaWRnZCtkamVabjErdGhSTTBCMUhYVUVsZXdjYW5Q?=
 =?utf-8?B?MVI4RHVFY3Z3Sy8yQ1VKMUE1ZG8yd2N4WjFVNlNualVwR2p4ZnFCR2NpZEpJ?=
 =?utf-8?B?RzNXL0RmQXJXWmpmSm9saUEySVdjKzM4ZVBWL1l3VUdoWTdFanRjbjAwOW1K?=
 =?utf-8?B?MDZJaUdNd3lsRThXVzVuMmxlRFZkTU9HTG9DbVZGVkQ1eG54NldSejdiNWx0?=
 =?utf-8?B?dGdLL2k2b2dtK0w3b3VORGwxeFhiaHd3eGh1NUxwcUhNamIwNWt1Y1VvNXdD?=
 =?utf-8?B?NzdVTk1sU0dVSVB1VU9YU3hua2tONjlzbTM5T3V0bExXUTNTQTZ5bWNLcnN0?=
 =?utf-8?B?QkpaYy9CbTFDT2tjN0Q5UWtuVDBNVExNbkhGUlUzajVHVnRlRUdSM090K1VW?=
 =?utf-8?B?a0pHL2o3UEdFTHV3V1NDNkwzNHRHYit4NlE4WEIzd0h4NVlRM2hWZUFIcVRv?=
 =?utf-8?B?alZ3UHF6eDNPQjRBdFphNjdESElRUGVwNVIxL0prWWJnWjljMm1Fc0dFd25Y?=
 =?utf-8?B?SXlwaFU2enhmY2hzODNjQlRRd0E0VGdJNHExZnNIbnF6OUdVQUVKaVlKbHBD?=
 =?utf-8?B?YXJ2RlkvNnVTNWNpL3Z0N1ArZEtpSmdZY3NoRkZHUFRFem5HS2xvaVpTRFU0?=
 =?utf-8?B?WDN4bk5BTFhDVW5hK0cva1FiZ3Q1dHNjOHRjNWVram5qbFRYcENPZjdhV1hl?=
 =?utf-8?B?S1dvT0JLMlJid25pTVhDMDlvVkVPWUhSV0JKTldaTXNZQzBxT3VvdnBmWE9E?=
 =?utf-8?B?bExER1UvYnVablJqa2IwK3FtN1JpZmJnVEpnMDZJYm9DeHVoU040dkJxUjhY?=
 =?utf-8?B?N2FWVDg2VDJnWWFzOUhCa0NRSkhkdFlQYnJMUFZuNEZSSmpveVpQMUhOVHI3?=
 =?utf-8?B?dUFrS0JQeHV3RmFsbXIxQkdjY0hhcWFqdzE3QTNJY1FlNG5ySjRJSG1WNmU0?=
 =?utf-8?B?UzQ2VEVWSUZrS08wSlZJTkVqT0lzcENyN2xGZW1pUGNsWFFyYXJWcTNBUE9a?=
 =?utf-8?B?ZHN5NkhJTmFSQlB1UmJJYTJESUxRb1dHWHBHeUJnNmxCbGdQc2tMTzlvSk1U?=
 =?utf-8?B?Y3A5TlRCZVIreTl6MVl6S0lnd1FxbytNdnNMcmcxbE4rUjBKNWpnODQ3Qzc2?=
 =?utf-8?B?RzlxTXJNaW1hV3poa1I1eWJaWmlKd0h4QnZ3WUpzeHNNcjhLR3RkS0ErWVJz?=
 =?utf-8?B?dGRDSzJUVkJTTlIwcHF1aUgwUG4yWXBSR09FekFaRG1RaWQvQUphUTFTS2Fl?=
 =?utf-8?B?K2dzdnY1WGtoT1lvRkN0VkpFa0FtcFM2WW1ZcVlRN1JtSmM3QUUzTzBuWUtt?=
 =?utf-8?B?Y2czWVFtYUoxSnY5enRGOTZuY1pZUStPOVRjNTJMYUhweFFyaHVDLzNXNzU4?=
 =?utf-8?B?RmZnS0NiSHFtV0s3cUpBK3o2a2JWVDZnaTl3SWtuVFhJejhyU3Z3Zk5TR0l2?=
 =?utf-8?B?c0pGeWYyNnJPV1BVdnNQK04zaFkvNFE3TTVjVWVrTFZSVkZEOHB5Wk1RZ2Vr?=
 =?utf-8?B?S3NMOVA0Z0tVNVdwYlNmVVZISmFBbVhPQVVpM0gzem1VNCt2bW11RkltenhJ?=
 =?utf-8?B?Q2xIWGxVTDVFSG5sbWFrb2t5QUlISWpvSWpYc1lrVFRTZ0NaYlNETGRBUnBl?=
 =?utf-8?Q?PFu++1CiVF98ygCS88/U2ILYo2y2nEOB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTFkdHNPSXA2bHA4M3VmYTB1R1Q3M2pBa3FxTU13VEVaeHUzSmtMTGF0bHpw?=
 =?utf-8?B?ZUc0aE9mNmE0N08xZGVJMDJwZXdUZHZHOCtnZ1I0a0xXbUxsL0ZURU9vTm4x?=
 =?utf-8?B?NnJxbU5MeHNhRG1BVzB0RWt1Vm05Q1lGY1I0ald1citESk40cE9hNjFUZzVH?=
 =?utf-8?B?M1h1NzNtalBzWTJ5UzRKbS9FZlQ3dDFVSGViQkY2K1ZrQytLditGWmVlSk1F?=
 =?utf-8?B?OGZLUnIrWm43YlJpaDRDYWtZTng0dnhNQU1QTytEczdyVVdjd2tRNHRVMTNV?=
 =?utf-8?B?V3hkME9rMUhGTUxkMktyTWtZZDVOQ21wakREMDZ0dEU1cXd5d2Ird1g1UG5B?=
 =?utf-8?B?YlZzM2VYVnJaWnhZMnNJcjJuYlMwQVdzdlBzemIyRVJmZkFpaHlPZ2d5Qm81?=
 =?utf-8?B?VUw3TnE0RjFZM3JCWDJKQk1GVHFuRWlTaDl0MUZWWTE0ZWJGSVdWcjRqS3Bv?=
 =?utf-8?B?aEdyRk9Qelp5MGY2eXdXOW93TEhVZUxkbFpGTysvZjZDdWhZLzEzVUhrbjQx?=
 =?utf-8?B?ZkVndkdkRVozME9IVll6ODNJdTh5KytydTFlejR1YjIwU0hZdEx5ciswdnJq?=
 =?utf-8?B?OHNvNUkva0M1K3N5b09QSVZseGdNbkwyS05BdGxudnFWKzFjSU1EMW5HVXFu?=
 =?utf-8?B?WW9IVDk5MDhrdStEZm40TE5qaEc5SlBsUVBNalJTTzM5cEhKK2lmQ2g3QjYv?=
 =?utf-8?B?TnVsVUJ5dGlqR05pZ1psUDFwNkF4ajF1RHc2ZXd2dUloaTFYOUtpVERiUExR?=
 =?utf-8?B?b2N1N1NwTStyTFlpeG4rMFVVaSszajZCbnUxQU9WNXkrS1psV1J5TzhRaG13?=
 =?utf-8?B?K0lQM25mK3pYMGgycFZjQUlnbDhrelBiQjRrUTZjNUhJSDgxcmNZM2FSZW0r?=
 =?utf-8?B?M0JSVjROZGFMK1JDNUNsdDQ2cjVqVFdwZjlTQlNPZC9XMlBDQUFSenk0WnBJ?=
 =?utf-8?B?b0l5V0Y1Y3hYc3hnZVZJOTl4aDF3eWhlUjNHdDEvN2FPSlpEY1ZqdWw4YnYy?=
 =?utf-8?B?L2p2RXNqVGc0QVd3UlFzaXJya2xYQS9sdEQ5ZUJMdDJsMGZGT3VWeGQyVVZr?=
 =?utf-8?B?ZlZ0U0E2NzdaV3hwMjdUZC8wQ1BkSVB4WWEwS1MvcVBtWjEvV3o2dnRoY2ox?=
 =?utf-8?B?S1RSbGI1bU1JK1EyOU9BbTdSbVJFZFRkQlc4OXUvM2VlcWh4OUVKbHR0dlBT?=
 =?utf-8?B?eUtYa3pVQiticE9qNWE5MC9PNnYzTE42b050eWR1MFQwSWpoQjhRb1JCck45?=
 =?utf-8?B?eVFKZDdvdnBPSGQ5ZFZaKzJUUkdTWVV5c3FjMWNwWnNxOTRvK0xrd0Vwb2Fa?=
 =?utf-8?B?Q1FEQlE5eW95RXNOemYrSkNDZ3dRaFYrL0tYMjJSTmNDdXQ0Q3RCWEhVbjdV?=
 =?utf-8?B?SDIrVjgrYk1Dc2pJbjR1Z2JUUDZabU5Hakx1MFA0TlluRmxISmEwbWVQQkJu?=
 =?utf-8?B?VU1tZWZJbjBYZDUzeG10Nkl6UnpkbEZOdzBlb0hFb0hEQVBxRTZ2bk8zamdk?=
 =?utf-8?B?SG5UVnJIOWIzVWJMcStGV3IwOUhlQUdxL2lxZ1JKZ29tRnlQM3ROaW5xRVNK?=
 =?utf-8?B?S21oQWR4bE1YdmRVbThRVE9TQUxNMnZ1REdQUjIzeTNxY0xld2doTnhIOFBU?=
 =?utf-8?B?SkpKeDJONzR2aUQwdkV4TXI0UnQ0WEZJS0p1TkZqdW9nbmcxc1V1N21pWC9K?=
 =?utf-8?B?bUN3ME95ZmdIR215SStaQngwcnZuNzNrV3I5QUpqRk1XUk0wblpubVl1V3U0?=
 =?utf-8?B?UmNkWUQwRExLajY4Mk1YRHpVSDl2Yk9HVGJyalBxaXJVaFd5OW9oN2NBd0Ir?=
 =?utf-8?B?b1J0TzZEcUx6bVZPV3l4a0k3bGppM2VHSysxbTZIUk5lY2wyb3lSTWQ0UVlq?=
 =?utf-8?B?VVMwNE5pWXlMczZ0N2JWSjRGZ2M2U01ORWp5Z0kydm1GbkcvdlpFbWQvaThN?=
 =?utf-8?B?N3NKbWxMekxtV09xYjRBYVRYUHNIN2FSU0ducHFjV3JQZmtKRkhqUWEvK2h5?=
 =?utf-8?B?Yks4ekRxN0c1Y0FMRk1vaG1ZMnZ3VmN1Vzd0Smtlb1RRQjNyLzdnc3ZUei9O?=
 =?utf-8?B?eWRVVk42WHJEZEhVZk51WDhJcHdiYUxOSmxaU0hBR2ZEK1VDb0ZoMXM3LzRN?=
 =?utf-8?B?N0xqbG5VZzJ1blB0VmtkMjM4Z1VMNHhZZWVvZUhoRDc1VENOTUFtTDQ3b0V3?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ec1d0f-d077-425c-55d6-08dd1eb33b21
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:55:29.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzhQ6VU0kEV1fxjc0AcIRYOS8UhxBltXXtFAuRyCWHCgMcMAEcgkV9ieoOnXw31Af+yGJavaWYd8m9XyLgkgTabLUyZNrczAIuTdQbeu8Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10149

Add the device tree node for the RK356x Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 62be06f3b863..73ff1ff01e24 100644
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


