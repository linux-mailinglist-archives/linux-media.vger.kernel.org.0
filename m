Return-Path: <linux-media+bounces-52927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO0WNbNtk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:19:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6610E1473F1
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C339B300D1C1
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425DB2F4A05;
	Mon, 16 Feb 2026 19:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mtsWFQn5"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39B2FD7BE;
	Mon, 16 Feb 2026 19:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269553; cv=fail; b=fBOf1wjTN5SkcCQjoVZdyPps5Bz80q343ydNtW3+EnVL2hFowZdJ7ABrpvA8V2YKnbHna2/nA1L+X52mErQfuJiSmdczk1fvK6con7Z1hG5qMKVrnbXxqLBpb+gMAoj7YHvTVs4fhiTCiWc5qTHoSrehnqQbc71lX/zFRaiG4eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269553; c=relaxed/simple;
	bh=gt9d3TAU0cBeyuF44cTC3+bxCAuKbAxxJcynx46Amlk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Cl+pehY4OvMqkgLoYzzFmoVXGmoWYhmXl1zvUFbqmIk9fzHECZaqXqJLOPfDCEeSOxnT5089h2TdkG+cRrVQwtTN0XNRcr+JowZa8I0XBt9tooPsyeFUOIx8e2gMGJybMBSRnhT0xOhc/ODASE7waK7YqbpBE1yfIz4k3SXydGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mtsWFQn5; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD6btBt9oEk+FDcroaa1ukDfoIoD7oC55Z5XRCUI3zn/xO0sGShm9nQMgQj7Iv5a6pcn5pmePJQ13/2+URSEJPxClOTSHdbgacQT0PNPYQkeX+hfJijUzs/yIIDzVGKZiAG8rwuDWNv2FZPmv2J8RoVd62OT07gvPT8qLRIFX4NmWVdhnjxVOzo/R3+PLGvD9jyfIaMW9CnhJQQROAckONeFgC8OZSm0As2UFOdEzqAVd1OVW3VKhEa0g4YHg0POxF/HKjDR7SE8RUIij4CrKYIjbLUOMmJgnKbymdK40E05UBiXIqK2m9MJk3K7YBn26qF2D4c6TsDnKZYuWbSMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd+l0r9FHLn72FWkeqxlxnK3CiG+xUP9t/F/2ghxpV0=;
 b=uMJbbrYFt4GaWDptci7jzP34lgu9F02dtT50P/hS1KPCxCT0w3rylg7nepjQcSXMjDJlXW1sLtrwv7QRDlWNs639cUr88UEorxGfuF17qTPxmJCUnjhqJqInZx49eAm4ejWG+3FgyElgT51tUn0wOHtpyFfKqj3fACp8agnz9xBYdQ/y3JWjgQcf5dbOomZzPRK5tP8FE2fd8+xncvTOCdA5F1co/aSQIuZIeqivCujpZ/niW+JNdbqendCpaDURa3GOOJtRkw3JC7xrdOzUyoqR41/uonkXviIa2vLh+o57waDGBnbiJQfiCcRTmz3U8OnvzFweYtinY6+ReK6pXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd+l0r9FHLn72FWkeqxlxnK3CiG+xUP9t/F/2ghxpV0=;
 b=mtsWFQn5ZHo/ziTSu43i4UJ99l1OQ68wU1ww8aBvH9K7gQP9sdWutlqwLFoh8vI9cXGXr+K/NW3ij8CRmDaq60gYXeKChE3Sz+pXcWk53OEVm1XAMbJ5DeirFokzWwS+NaffVvLmEiVYYCvF9VndCZ2+03VNZcMf1b20GzAndsrXA6dniXQpusW4FvbAPUgNusOUHGWpl8Mrdnz25o63db4s94JP5fNYV4LDN0A995pKF13rX0pc8hQGjlvNYgdLTb0ppDk7WVP7G+rIN6z8/gHnSpeRj1QZpEL1UktXbZWUfYX6cmDMtYD1l/cGhh6Zc7sbQDYIthc5FlNHfSN9xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:19:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:19:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:42 -0500
Subject: [PATCH v3 4/6] media: synopsys: csi2rx: Use enum and u32 array for
 register offsets
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-4-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=5481;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gt9d3TAU0cBeyuF44cTC3+bxCAuKbAxxJcynx46Amlk=;
 b=lKN2+nkjDzOmbQ48gHdVIXQujfyqUGh5v7ggEKOC3hmMMzbk3/NXhxZGM3nxNj2cYGe4jrr5b
 8wGya0/wiIGAD3TVoRX4ESXsOY0hkgUvCxlvfGGr4uV1TvaVKamXbKi
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dec547d-a12d-477c-1ff9-08de6d9040a1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RDhRS0JnR3pFMmFac3JRRlN1Z3VNMGQrVUkzcHNjaFJkSE5EZHJVYytBVlJU?=
 =?utf-8?B?d3RIRkEwWVU5aUJQWWVmb0g1YWpkR0l0citEa3c0eXpqK2JDWWhSY3ovV1BI?=
 =?utf-8?B?ZHV1MXBYN2g0QmVWVDNFTVdVWmdPVGZNdHg0M2U5TXhmUVdVUS9PTzdYRXFo?=
 =?utf-8?B?U0lnZkhXSlhMb05nOWVCZ2FtVzdTTHRKVzc0VjJKZUVKUnI5U1VyZ0lEUGRX?=
 =?utf-8?B?RElXZmZhc1YvR044dUZybXZEcDJwdjhlbi9LMlR4ZEJ4SVNyS1U5MThOQUJp?=
 =?utf-8?B?K3UxaVdacGt6aGhVdUFqeGphZ3ZlWSs4emRPVEJWdFpBTE8xRS9LN2NSTm9K?=
 =?utf-8?B?WUJCbS92d3lKMjFoTGtlenFWQUNkWERJV2ZhcGFGbGFZNE1rM1JQNk5hU3Rj?=
 =?utf-8?B?VlNOQ2xWVTlZZGhXR3VtbHNmbnF6MkhaWDNlSS81c3ExbmFZQmRWM1dqOVor?=
 =?utf-8?B?R0xuWXZpQW5nY0x0cWF3L1h0NGJtOFpkL0hIekllcmZjZUEzaTRnNkd6OEY4?=
 =?utf-8?B?TnAvSHdwSFRuL1BIWm0yZFJESHk0ck5MSVFXMnBKaC94UUZrM25tZzhwenFV?=
 =?utf-8?B?M0lUVXlLWGtNL1RHaWI0b1dTVmVlaEQvaHd3MnNyYXQ4dXF6bG4rYjBHVGFi?=
 =?utf-8?B?VXMyYlIyZGdWTVk1dHVNUTJ1WXU5SnRabll6eUt0TFpWOFpRWXRlTFlxNGN6?=
 =?utf-8?B?dFVJZk0xYnVzTEJEZVgzeDJkV1pQYmY1OFZhQnRSRDEyUFNHMDFRTXhKUGRk?=
 =?utf-8?B?c3FjQzArb3VVWXVhUzhLVzhvYzJzUlhFT1crQVpVQmZyTW5Oa2hZUlVWTCtH?=
 =?utf-8?B?bk1sblVLYTdOVjVEL0t3V29RMXZuQmJGSkhQakhzenN5S3phMm83eHk5ZjJL?=
 =?utf-8?B?NHFkQ0tKYUNub1AyNFBhd2djSTZIT1pkZUlLMzd1MnVWVVUybGpJcXl2RnNM?=
 =?utf-8?B?N2phNUhKSFRNdmgxdVVLazZvL3NXVlM0VGFVVG1mWGdnM0JHYlNkODJuNmFJ?=
 =?utf-8?B?UW5yUEFmMUJBNU11UGtvOVhFMkozeG9lZnRCaHB5WE5PYUlXYWZCc0FlTDRM?=
 =?utf-8?B?TmEzblNWYW9lVmZkN3Q0cnhvU0YvdXNpbjZtZFFXVFEwajRJb2RSYUZkaUo4?=
 =?utf-8?B?SnFLQjJqd0xHUVowSTRrNGl1aXhFbnB1bHdCNm8xQmNDUUtOK2N0allqRUJT?=
 =?utf-8?B?SjdNY25KTi9iOUtuaSsyQ1ZjVW1QSUtCM1JhLzhEN1NZWEFlbm02bUFkeC9x?=
 =?utf-8?B?bm1SekdvemY5ZlpSOTkwbURXT0Z4ZlJWRnNhMjUvTVI2UE1CYzVDS0I2MkxO?=
 =?utf-8?B?SnJCcjJBUTYvMGQveUgrc2FZUHNyR0FkV0FDVndUcXRFRDVabVJUbXQwN3J1?=
 =?utf-8?B?OVNLR21vSkNpZC9nZTRUd05jcDNxckxpQ05aQll6WVZoeG9ibTRBM2RITHBD?=
 =?utf-8?B?RG8zd3l3NXpnUFA5M0VKRkVxZzZLK3JScE9rZDdUYnhrZlN0c2xHVHFyUmNh?=
 =?utf-8?B?cmNOMkVZVmR1UjRaa1dVZHlGcXlNTHBPSkxHVXZkQjI4dklxNXIyN3JUZytn?=
 =?utf-8?B?eXdqWlZiekNzSmRQVkF3RFM4TnU4MzlWb25nZWpJTmp4QVhXY1hUT0tZY3R1?=
 =?utf-8?B?QkE4L1FWUUdFRmRYTnF0S001S3VvZXNZQVgvMjErcDZSN3o3eWJPRVlNUmtn?=
 =?utf-8?B?cktLWjRVU29NMHN2QW9Mdlk4VmxpQUxjcGViWDB0OGtBUXRIbDBqeFo2SVdL?=
 =?utf-8?B?NmtUU0U2NWFCWm5yZmhHbzVGbEllQ3o0ci9DMDA4Q1kyaW9DTnlpQ0Z3V0F5?=
 =?utf-8?B?K0JmamgxVWhjT28zNlV5MFFVWFJHU083N1VZMVhjOUlXRXozWTBTa0VVZGsw?=
 =?utf-8?B?MXpjQURsNHJvcFpaV0V1bzFZdmZXcVVCWDNRQWNGZDhBVC9lc2J6cnlEQ0Rw?=
 =?utf-8?B?K0dJVGdzS2FobjZ1Y3NTbGVZVWxXV3NYbC9Ub2thVyswdHV2ZHN1a1JtYkF4?=
 =?utf-8?B?b0JXUHNLbmRNU05QTmVLMUx3V044ZXh6UlNHTVlKN0ZFZ24yKzh5SVFicElp?=
 =?utf-8?B?YmNNZjR5QjNPMCt2KzJEQVhidTBKMXdGTnJKZmxyMklkVnRDT3kvVHN6RDdy?=
 =?utf-8?B?cTh2akRMS0ZoK0ZzSWgvOVNNcUgycXpwWHlLZUFCN3F1eC90YjJjY0ZRS2hX?=
 =?utf-8?Q?zgzkLp0OqgK+EtWpEDrWBNQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y3pUV1h4dGJPeCtIZi9ZYnkzZEZKUmlzUGUvdjdtSCttOGZlSzVwNC9KdDJR?=
 =?utf-8?B?RXQyaGs1SVByaTdUb1B5M0ZFckJlOVR4STV4c2dTRkpVd3cwYVpzbEtJVDlQ?=
 =?utf-8?B?eXdRc09LMnNFRmxZTjBlQ3VqME9FU0RnMGxCL09hYzYyZVYrUDU4d2tEeTBw?=
 =?utf-8?B?RFpuakxHK3pTb1k1bkY2U0MvZEpKNjNXRVV1bkVvYTR6NEduYWZCejdpWmxt?=
 =?utf-8?B?cW1HempzVjErb2cvbENSYzFUOFZCbjJSU25mWE9yWVU0a0hDOXZFWWlwOGxq?=
 =?utf-8?B?dFNzb0g2WW01dmE5MzR3ZTYyTndaY3gxMS9ZbmZ6ME9zUlo2dUFzNmtmS1dN?=
 =?utf-8?B?ekZtM2RwdmZkNDZIZmlramV3OEE0WnZDc29UdWpMU0RLM0NrU3VocW9WUmpq?=
 =?utf-8?B?cnoyOWkvOGNrUHJmMk5jalhQOU1NelpIQjFyZEhDLzFxcVNzVGNqVWxCMjRW?=
 =?utf-8?B?UHZyOTVNWU1YQXhvYStuZlRZa3N2MHBVZW14enhhN3JwUW1NbXJXK1Z0ZW5D?=
 =?utf-8?B?RXU5RGtMWEQ4eFozL3BLZGVyMDc1aDJvYjc5QVgvMm13OTdaR3R1Q3Fkb1V6?=
 =?utf-8?B?VWFJdXRldjAyNTJrWEZOajAySy9wTm9mRWJyU0pVbzV4SGVaNnVTV05zc0ti?=
 =?utf-8?B?NFY2TlBEd1JEL0hibWROU0U5YS9EaGRFbmVTZWlrdThVMXV1VFRCVld4QVVX?=
 =?utf-8?B?R2xya1RUOG1KSnZrZ2x3UUpsWm9LQUhKTDhVSlA4WHU4aWJTczRPRGpPV2tm?=
 =?utf-8?B?S3Y4cXhKdFl6T0FWQk42cXpublZtaEFsd1loT214aFQ5a1dWbkIxS3JROGJw?=
 =?utf-8?B?ZzdxUXVqQncvTVhBTHVvaHhHN0E4VkdoR0FzbG1XajdRZlVRU3hKQndyM0o4?=
 =?utf-8?B?MW02ZmhaT3FrcUg3YlF5UDlxalh2SzhXMFRIWERyQjZLd1dZZmwvRTB4djQy?=
 =?utf-8?B?d2poREZRN2xuTnlYSjlmVUcxa0xVNUdxLytWcjBYYTErakZTZUpkTTlpcnpO?=
 =?utf-8?B?KzA0Z0ovMXgzQ0FOeW1xRmZ4clpoaUNwV1FQd1VjSjRsS1YvSWgrSnk2TlM4?=
 =?utf-8?B?V3F1b0hWemxiVURtcGdyRHdwSlI1NWFPODZFTURteXhud1ZWR3l6K25SUVVH?=
 =?utf-8?B?cXdrb0NGbEZtTFdPOVFiSDZiY1VNT1pQYlpWeE1ZaE1XWE5DdVdRQVR0TkxH?=
 =?utf-8?B?NDFGQ0FUTmhyd0xuV1lEajB6d3ovcHpaTG1RWkxOVkd1a1pFdlN0MjAveFlv?=
 =?utf-8?B?VXpMek5xOGFZSEpSK3hwdnNTdWgrNTVTaHEwMFU2Um9McHpva3FWMnNtUGl6?=
 =?utf-8?B?R2NQTjFtYVRITzZkTkFmTGtTRG5PeWREVEtpanAwZHNaSWo2S2MrZ0J6M3Fq?=
 =?utf-8?B?V2R5Q0VRRndyRnd4djJ6WUVCNHF2Z083bnBRcVZvVkJMQWV5RkVSdnJZbDRT?=
 =?utf-8?B?TlpZdkpBbnQ2MVpSS0M2OXFoTTVCUHFNNXpMN1pkbkhJRmJ0dGtUY2FoNXpl?=
 =?utf-8?B?QXE5N2lYemRIeG1LOEwwaDBaQTBVWGpiVXhIRHc2S2FXNkR2UFR2clJrOVBY?=
 =?utf-8?B?TElzekszb1F2aHdjZFo2dy9jeldxRHdlbmpybkc0c3FCSUJlZUxETXBSU0ta?=
 =?utf-8?B?Njg1SytHWHFxclVtaW1JY2oxck1aMWxVMGFuazlKN2xqV3JxeURmeGFHYktt?=
 =?utf-8?B?UmVLZmNFR2RZcE1KaGszdEZJN3c3WXc0KzZIQjkzejFmTU9ud2kwUUQ1aWRp?=
 =?utf-8?B?SFNDNlNzbEtUWGt3Y0dWSnNiU0lJdFR0NXFMcGRaKzBNNUV1VlU1V1UzZUti?=
 =?utf-8?B?cWlUVmttN2hyUFhBU2M0QXZnVTgxNllqbFRiaDZseG4xRG1rVGNpY1BXemw0?=
 =?utf-8?B?S3pEWnhHOWNGRVo1TTNaVWpCRjhsaG5CRnNlL01GVkFPdGYrQjRRdFBKVzRs?=
 =?utf-8?B?ZUl1MkJka3dZYkdEazBIeFBUYkJZem9aZW9ObXBTd0xJMWM3QmVTeHU0QmRn?=
 =?utf-8?B?ejdpTlZuNlFvUzk5TnZaZ3RaU3FueUVndEJOSWdBRXpJTVNXMXo1ckhSQ0M2?=
 =?utf-8?B?ZFpNTmNvdUg0SzdyWmlaL01CRnJCampiQnhKQW9ReTIzRHo4dCtZR3VIVHdl?=
 =?utf-8?B?Y2VTU3MyS09wR0FtSEdNWUx3UEZsc1RwdUJ0QUUyNnFnVFZtSit1b054ODRk?=
 =?utf-8?B?ejh3N3V4bHQ4OERid0Z5Unl1SVlFZm5RV2VFSzlpcnVRSUNxdjRwVVNaemJG?=
 =?utf-8?B?NzkweEx0VHF6R2hIc3EvSXlMeDIzQmFGVkdUN0lrQjFEU1psMG5OSkxwR05p?=
 =?utf-8?Q?x67F6hV+jCjdQChWb4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dec547d-a12d-477c-1ff9-08de6d9040a1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:19:06.1532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FISPhoETzg/PlrJhXNF1YNtGglHgB3wctHdSmH8/ohMkzpRgRz2aOstnYCaXrPzmSZgVfFXpTHZMJRE5Cn5/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52927-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 6610E1473F1
X-Rspamd-Action: no action

Use enum dw_mipi_csi2rx_regs_index together with a u32 array to describe
register offsets. This allows supporting new IP versions with different
register layouts in a structured way.

Add rk3568_regs matching the previous macro definitions and pass it as
driver data during probe.

No functional change intended.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- use dw_mipi_csi2rx_has_reg()
- fix dw_mipi_csi2rx_(write|read))() control flow.
- remove reduntant comment
- add Michael Riesch <michael.riesch@collabora.com>'s review by tags

change in v2
- change to use enum and u32 array method
- use order
 - #includes
 - #defines
 - enum and struct definitions
 - the rest
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 94 ++++++++++++++++++++----
 1 file changed, 81 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index bcbf109a0bfd040c568c0652e28752c94a1bc30d..536e5df2b4172256def2e2a35b362cfbddf712fa 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -24,15 +24,6 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
-#define DW_MIPI_CSI2RX_N_LANES		0x04
-#define DW_MIPI_CSI2RX_RESETN		0x10
-#define DW_MIPI_CSI2RX_PHY_STATE	0x14
-#define DW_MIPI_CSI2RX_ERR1		0x20
-#define DW_MIPI_CSI2RX_ERR2		0x24
-#define DW_MIPI_CSI2RX_MSK1		0x28
-#define DW_MIPI_CSI2RX_MSK2		0x2c
-#define DW_MIPI_CSI2RX_CONTROL		0x40
-
 #define SW_CPHY_EN(x)		((x) << 0)
 #define SW_DSI_EN(x)		((x) << 4)
 #define SW_DATATYPE_FS(x)	((x) << 8)
@@ -40,12 +31,32 @@
 #define SW_DATATYPE_LS(x)	((x) << 20)
 #define SW_DATATYPE_LE(x)	((x) << 26)
 
+#define DW_REG_EXIST		BIT(31)
+#define DW_REG(x)		(DW_REG_EXIST | (x))
+
+enum dw_mipi_csi2rx_regs_index {
+	DW_MIPI_CSI2RX_N_LANES,
+	DW_MIPI_CSI2RX_RESETN,
+	DW_MIPI_CSI2RX_PHY_STATE,
+	DW_MIPI_CSI2RX_ERR1,
+	DW_MIPI_CSI2RX_ERR2,
+	DW_MIPI_CSI2RX_MSK1,
+	DW_MIPI_CSI2RX_MSK2,
+	DW_MIPI_CSI2RX_CONTROL,
+
+	DW_MIPI_CSI2RX_MAX,
+};
+
 enum {
 	DW_MIPI_CSI2RX_PAD_SINK,
 	DW_MIPI_CSI2RX_PAD_SRC,
 	DW_MIPI_CSI2RX_PAD_MAX,
 };
 
+struct dw_mipi_csi2rx_drvdata {
+	const u32 *regs;
+};
+
 struct dw_mipi_csi2rx_format {
 	u32 code;
 	u8 depth;
@@ -70,6 +81,23 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+
+	const struct dw_mipi_csi2rx_drvdata *drvdata;
+};
+
+static const u32 rk3568_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x10),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x14),
+	[DW_MIPI_CSI2RX_ERR1] = DW_REG(0x20),
+	[DW_MIPI_CSI2RX_ERR2] = DW_REG(0x24),
+	[DW_MIPI_CSI2RX_MSK1] = DW_REG(0x28),
+	[DW_MIPI_CSI2RX_MSK2] = DW_REG(0x2c),
+	[DW_MIPI_CSI2RX_CONTROL] = DW_REG(0x40),
+};
+
+static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
+	.regs = rk3568_regs,
 };
 
 static const struct v4l2_mbus_framefmt default_format = {
@@ -184,16 +212,50 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
 	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
 }
 
+static bool dw_mipi_csi2rx_has_reg(struct dw_mipi_csi2rx_device *csi2,
+				   enum dw_mipi_csi2rx_regs_index index)
+{
+	if (index < DW_MIPI_CSI2RX_MAX &&
+	    (csi2->drvdata->regs[index] & DW_REG_EXIST))
+		return true;
+
+	return false;
+}
+
+static void __iomem *
+dw_mipi_csi2rx_get_regaddr(struct dw_mipi_csi2rx_device *csi2,
+			   enum dw_mipi_csi2rx_regs_index index)
+{
+	u32 off = (~DW_REG_EXIST) & csi2->drvdata->regs[index];
+
+	return csi2->base_addr + off;
+}
+
 static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
-					unsigned int addr, u32 val)
+					enum dw_mipi_csi2rx_regs_index index,
+					u32 val)
 {
-	writel(val, csi2->base_addr + addr);
+	if (!dw_mipi_csi2rx_has_reg(csi2, index)) {
+		dev_err_once(csi2->dev,
+			     "write to non-existent register index: %d\n",
+			     index);
+		return;
+	}
+
+	writel(val, dw_mipi_csi2rx_get_regaddr(csi2, index));
 }
 
 static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
-				      unsigned int addr)
+				      enum dw_mipi_csi2rx_regs_index index)
 {
-	return readl(csi2->base_addr + addr);
+	if (!dw_mipi_csi2rx_has_reg(csi2, index)) {
+		dev_err_once(csi2->dev,
+			     "read non-existent register index: %d\n", index);
+		/* return 0 for non-existent registers */
+		return 0;
+	}
+
+	return readl(dw_mipi_csi2rx_get_regaddr(csi2, index));
 }
 
 static const struct dw_mipi_csi2rx_format *
@@ -627,6 +689,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
+		.data = &rk3568_drvdata,
 	},
 	{}
 };
@@ -648,6 +711,11 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base_addr))
 		return PTR_ERR(csi2->base_addr);
 
+	csi2->drvdata = device_get_match_data(dev);
+	if (!csi2->drvdata)
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get driver data\n");
+
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
 	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");

-- 
2.43.0


