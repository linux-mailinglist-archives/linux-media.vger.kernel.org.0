Return-Path: <linux-media+bounces-40681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97006B30607
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1503188AF2B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C38436C086;
	Thu, 21 Aug 2025 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xjd+xJS5"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583436C073;
	Thu, 21 Aug 2025 20:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807523; cv=fail; b=JtdNVqlHiJnyNjLn6V0JjEo13xP9iknefXt2YuEVzBfwHR2P9nQGBGNzxQWw8gxFqUROkP5hILFjOPZWaRrUrlbuh9U3x5n/CzPNaFM9ZqwOFv7QGScPjmyA7GZaP6F/lKeZwBZW2lovJsdJVdWwt4/OTse8/j88hD5vzh2sc64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807523; c=relaxed/simple;
	bh=rM+abEFBwjHuL8n588QsuAlDICnODm3irxTZqQqvLM4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TC+Nd/bnYZGxN61V9xHDMgHDahsQlRHYC8PG+gj1Tsea1tTk4d7oqRmn+T/4aDeuK6VnCHxj95CRlOjlKWcVvHErPJ7nSBVH+E2VIiVl9oZjXzH2n+8CkdSOTaQEFaVJZ4tOGKVnDgaMdfn/S42FFEi130fbxWJkAX76ZujI6Ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xjd+xJS5; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+TRCXWp1oU3pks37ssqSEgZCagLgFZ/k9m/tqk6sz9U1J9Gv024cWhccHA9Gpyriq/Nsufs3ESCJESuw+msc9ckWm9PjDiJHuNXKmdGqbRGLC2ycIQxEu0BFReOIzOu1FowqzYtcqYdpm4Lwcjb3vXoKDWtbm0UylB/3fMFzMx9GlrPtlv0fa9JnAFDIb4XUvd2CxQXK0cEp+IW8/5y1Yje7Ted6cJaZV7Vu/AjFujPDOfpC/JRCgNEaiY9qp8qoayGc70W9lK1PHSx/ZhGABfLYO3Gnk/qgxkaoIbS0lk+e6i69A60wrr7nBLQjAVFm04zxLk2NqayYcYqgijGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9hkxBE888qd6hCn2JAshONcSE0vUEH9OxsYXaBipF4=;
 b=l9GfO+XB5XkWlPrLHLp6aI9oBDk1JRDRdSv5POpHvkK0tp30h0j6tdsd7eJtLY8RZ8QwhCcgeys19LvZxq5tZeissKO/ScHk3lV0+FmWFurWlvyjQFPqTMzzZrrc5wtCYmdYhKSNPJuCHSMWqVh7hdyQC5sEXzVcKC90Zj2G21zSM+dMPkHiLBSd9vn6PLCszbmzSLjawm2SpqZ5Iqyn12+G9rZCtdbnpTN1FevzBEn6WKMsUjrnGmnIrv3f9zCwhINaxiU1fg/phjH1SzEu49xFMHpTEe8Vm7VEIVfrrGpUnjkuR/S6Od3igW2h8fOIlXb7AdVNfcbHXziEXY4c3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9hkxBE888qd6hCn2JAshONcSE0vUEH9OxsYXaBipF4=;
 b=Xjd+xJS5uHBxPJeHMnRJXtV6zTAUSstHkA+JFfpp0mdu6JcB63aD/v3WCZ/3TXDa9kwIGtf9ifKX6prvl2V1uv5/9EvVu1b/T7VQ3xXJy6dNXPlcddlECmqFirocaPgR2n4ARuya2pC657UIE6RitVcZQ12SMhv91LaopIH68xPW3/p6A6IHToAjp6YYfl9fIG+Gm59fiLU2DQqFJJn9pcKKczbNA0+VpTZUUo5q0DdWQUF2zR0TQuXDeRmH0Y+uaArXzD0i3n76lq2bTibSccSUrKTvjn/o4uWR72BrCBqPDXs/8dg86+/LCAPkIHfnMlLghbyKDe7miQwz8YcqGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:39 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:59 -0400
Subject: [PATCH v3 24/31] media: synopsys: csi2: Add need_dphy_reset in
 config
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-24-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=2901;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rM+abEFBwjHuL8n588QsuAlDICnODm3irxTZqQqvLM4=;
 b=ppIxflXjcUHbqkjCVwmVjo45ucjykrTMJObUWzCIHf9soM2QqvYO4jg4v+nruqhUVUNPxe0gb
 8iEkRBHyca6AqBQJvQlYcJeYR+QWIJPNSYoCdSAK6ETQ0Qp1Qsomex8
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb133b7-9093-441b-6150-08dde0efea64
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WFI1MGVSMmQyaHVYQkhJeHJvaWE0RnJCYnNGbTFVeU9BYmg3UWpScDhtdWdz?=
 =?utf-8?B?QXF5RStCSlVGVTNMMW53aVhXS1lEUDBzWERPWFlxVWJHdlFUTUs4TlFHdFND?=
 =?utf-8?B?T0wxc2dKUUVTVHZ4ZUJkZzl2UTRnSEtrQml6dCtiUVByaWNnb3hhcDY1NklV?=
 =?utf-8?B?RW5SQnpEMisxbjJUUjhtQ2ZwVzQwY3ZWcUVlbGZwU3BxcjZEMmNVYkNVdWNs?=
 =?utf-8?B?UnNOc1ltOGN2SVhHSGd1UDQvekxvdnZ5UDBpcFhrb05palBrSkN1SVkxQlJv?=
 =?utf-8?B?ZC80Z0x2L21FWUJPMEI4WmU1aTYxZlgrUExPZGhsTXByNm1oTzVEdzYwOXpn?=
 =?utf-8?B?Wi90SWh6Nkc3SFhianFKUDBIR0gzMTNEb0lJUzI1VlppcmpldmxROHdoTUFB?=
 =?utf-8?B?MFlMbmJGdFpVdDRqcmwvUmR2bGdTT1hiVTh6MHloUVoyQ1BmSDdldSttcHJM?=
 =?utf-8?B?bytWSUp5bmFLaURVTUM2eXB1SUNGNWNaeHlTd1V5RzFNSkxtTmF1N2hIajln?=
 =?utf-8?B?OVh2RE5XYnUwTko2alBiQVlMOW4rY2UvV3dkOXpSNWhIcEc2NWxHbDhIdUNY?=
 =?utf-8?B?cituUFJEd0U3aTBXYnVoandJWmVLTFNmNkRqSjRpM0daQk53N0UyRFhNWVpY?=
 =?utf-8?B?YklXUUJ4eEhkd2tYZE9aRnFLbnowSVJJZzNpSWl4cEhIZWc1dnVibEYwcThl?=
 =?utf-8?B?cHpSSzRIU1lob0MrNG42NmlGSkdQTG8zdmhKQktPZ3UyUWdGY01Bc3FOamYz?=
 =?utf-8?B?ZjRyTTdGbXQySGNjbzhrNnBiUUNReU0vYU5Ob0FWN0h6V0xiSDVzNUVkNVFy?=
 =?utf-8?B?WnN5aGJoVEVkQnVCY1Q3WWI3R0NVOThMQnBwUVdoTU1qWWNwUzlTLzNXOFhN?=
 =?utf-8?B?eGhEbG1PdDBZQkRqM3p2RWdqSDI4T1pnYko5ZEJhZTAwMVhkOURZaU1jeWFq?=
 =?utf-8?B?cC9jWHZ4Y0ZwcUV5SEZZdU9IeGo0UjVPSXNDdm05MmZuVHNFT0VOeUV6cFg2?=
 =?utf-8?B?Wm9PNE4wbE94dk00MzZpNDEyQWs5NEJQZHozbVV5cU9XWWlTODFNaGY2dkF3?=
 =?utf-8?B?T3VFOEVmbnEvdEl4dGJuNDBTUVlOUlFVbVBwUlJJWTU4TVBJU0xQVzhMbmF0?=
 =?utf-8?B?TDJIc0M3N1pUZ1ZJM2o1ODB6ajJMRVRpaFpKcnZpa09nWUZOejlXdmxEVHNM?=
 =?utf-8?B?eVVYMEd1bnd6SlpibUZHUjg5UEFSV3lPeGN2RzR2ZkRXeGUrekRyYzJvMFhj?=
 =?utf-8?B?WW1XbDJnNm92alBxU1VETXR5OTdocERpdGw5Y01kTGVUYVREZXpJeVZ4N0M1?=
 =?utf-8?B?eEtER1Nld3Y1MXlMeHAybkxSMXVINkNianFISXBPUkZPNUhQZWNmN21LaGlj?=
 =?utf-8?B?L1lZYjhnVzBuYzY4N1M5ekxKeWxUeWluaDlkakh0SWlHZEUrYkxRdFFhK1dW?=
 =?utf-8?B?VXJ5Nm0rSHZWblQ0OHN6YVZTNVR6L3dOQ1FmR3FkcEZuclp6NlJ6aUxTcjdK?=
 =?utf-8?B?czNuY0lxM3h3M3JmaVVuREdNV2djWmV3Q1ZyNExUaGpWOUNFOFkwVmRIcDlR?=
 =?utf-8?B?YWZNTmI2b0ErWngzN3J2YVpielNxbFVDN1EvUUMxR2piNjZNck82dXBNN21h?=
 =?utf-8?B?R2I0SkQvaWxYNXEzUk11d25VeGFYSXdrQWxTM1lTb0phbG10VVlyUU1BeG1F?=
 =?utf-8?B?L2tYaGJUM3FNMC92cTg5UXg0VnI4dEJMMjVDUGxPNHdOREhoeDlveEdieG15?=
 =?utf-8?B?dmlQWURRckpxdDhQRlZrQ0ZrbUVHNlh4SUpwUlczamF6VzhocDlocmxVQlQy?=
 =?utf-8?B?a2JmeU5MaThkdzZDcVc5UlJrckVVMzF5VVducFVKNXgzVFZCaUNmRlU1amdz?=
 =?utf-8?B?UTJ3UVNERzAvV1BCOUpKcnVUZXF5RzlzUWYzclc5NkxQcXo3TWU0dHI0dE15?=
 =?utf-8?B?cFZqNE9TS0VUNVUzZGtXMGYxQVIzdTZSTktmR2pRM2paWmJmbFltMmhzL0hY?=
 =?utf-8?Q?ozi+Tyj12l+M6080EnmunRicjxKJY0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UENMTjE4WDhYVGhIc09MWS9PRzhDS05TMmhOWFdaMXJNYzEvR2w4eTlKTlhi?=
 =?utf-8?B?NU9wNytPTFMzM3ZjR2JmbThYaHgxc29NcGRFVmJoYTVRa0Y2NjZDWSt2TTZI?=
 =?utf-8?B?bTJhMmx3dlliM1dKclNGU3BjajB4YjdnSGZoYnVFckdGamtybHJKTytRVDNQ?=
 =?utf-8?B?MkZGT3lPdHpHbnZBRVhQZ3BrZDlBblYzRERsQk5RNXp3SVhQVW1lR3laNndH?=
 =?utf-8?B?VSt6VlpHSEdCMWprcU80dE1DcmxBSS8rOXpTaE8vTzJKTm1BQ2VSZTNDQis5?=
 =?utf-8?B?VUNFN3NMTmk5YWNVSmFHeTNlK0RuWEhrdy9henVmemh4VVpoaFo2bGpwL2hx?=
 =?utf-8?B?blZHVCtFSCtyek1BMDJkbC83cm8xeXN5K3FqOFdYd3ZCSjk2bDBOOCtiVnA0?=
 =?utf-8?B?a1k0akluOVBnUWVDN2NnTFN3RDY2ajhlZ0QvM0tUOHBqSlA4UGVVbmw1dXI0?=
 =?utf-8?B?WUhRNm9CNTFJWWZ4aWNkNHVWdVZkenBhRmNmK0Z1bnFIdlVkMnVIQUNrRXBr?=
 =?utf-8?B?cUFXOE5ubUx3OUJqMzhabDQ1ck90VGdXcHJTMDdaaGdTa2FRVEJTZ3VLRXQv?=
 =?utf-8?B?bFZLSzZ1Sk5hME51R1dsanN1UDRPcFFoMk5Cdmk5ek03UlJrc0NoOFFaTHp1?=
 =?utf-8?B?WTVpbWhsVE1DeTEwRFZTZHdkckVMTXY5YTBKR1lpYlFvVXVIL2R4MDZDK2Qv?=
 =?utf-8?B?UFR6aFdkU0g2dDNsRDJWWnVvdXllNGtrSytQUzhiUk8rbElmMXhiODc5Mm5t?=
 =?utf-8?B?MmRicEM2Z1djcW5QWHprd2Y2TlRtQm8vandyaHBuWWJzaTI0cVBoQTBUZVIw?=
 =?utf-8?B?RmcycUlUc2xHekd1eDlURFNPL01uWlRrd2o0dklyUWxtTTFkbHRxVWlheTI3?=
 =?utf-8?B?THBDZmQxdWtWdjErNVNIdjNvRzlXdkRaQXVlMjlhYng5R3F2R0xjSGFXUnZI?=
 =?utf-8?B?dkxsUUNyZi9lV3NpWnpkbjVUQzFVZ2RvSUoxb0U2MUNEVFZNNk1mWGhPSkhk?=
 =?utf-8?B?TExzcXUxdTltN3h2cllqdXEveTRZdEVGSHdaVW9JQ3NtTFFjUzVOS2VGZlF5?=
 =?utf-8?B?ZlFpdXovWk1PQ29UbHZ4N3c4dXRkTzR3ZDdFYndjN3MyTVpGaGJnakgwS1Bh?=
 =?utf-8?B?MEpzY2M3MU83SW9NR1lFOUFlbEpqaU5IUm1YVlMzOXpINTRxMXRreG5EZHNI?=
 =?utf-8?B?d2RDRnJaTmE5Nit0NHhjSUgxS09JbWtGRzVYbERQSmVLdkgwMHgxdmN5RDk4?=
 =?utf-8?B?aTNhQjJxU3BnU3RRVS9MM0ZqOFNWWHprdEtlTmsvZGcyWDBCYWJ0MytCT3Vr?=
 =?utf-8?B?NnZFekJxeTFjdEEvcWc1YXdiMUk2dGJjZjZUeW1OblhoVmFIOTVzWTFmd29k?=
 =?utf-8?B?WVgrSEtKWHVjczR5dEwwUDRibk9vNzZ5SzQwQ0xaTVYvY25Jbm9yRFRRbWh4?=
 =?utf-8?B?ZVZ3WStsdHVJd2dycEpmc3NOTmVNSVdwVjRaUkE2bXVQL1B0bnFHeDJPTkd3?=
 =?utf-8?B?ZUxxREo4Z2NIaE5qWGZlaE90bjVMRkdydnZKMG80bmlNZWZVeHZBOWQzQ21K?=
 =?utf-8?B?V2hQOVM0ZEVhS1pGVmRPL29TMmp5SHhKSVV0RHNoSFNyVHJWWjRENENNSjN0?=
 =?utf-8?B?T0RsTVBxUDNLWmNnWC9PRklwaTN1VUZxbFNCaEhSdWlJS0JsWitvRXRPT2d4?=
 =?utf-8?B?aXd1eWw4M0pVTHpLNGVhaUZESjFlWHRYVmNFYjM5Mnc0cDZxTmZ1QU1JZTlU?=
 =?utf-8?B?a2ljZGxNNDRiTThscmVtR1ZwT2ZOZ2dDRnV6ZmJxZFh4TGQ1R0ZrNmwrbHNs?=
 =?utf-8?B?alRVV3BTWURnT1BTWlV0SVIxaFdPYVdmS0poVGFBRXlJT3RZQ3RSRkU2SHdJ?=
 =?utf-8?B?Y0cySlg2ajAxUnBDNWs4SU50dGExb2puaFZrcU93Y2VaNGlOQW5wUlRvdnUz?=
 =?utf-8?B?SmNjNjUrZU5pOFpNbkREMDhCOTNnbWpTTjBxeHVMaHhvK2pWMDAvbmcyT0Na?=
 =?utf-8?B?ZEdrTzRRd3NVR29qdzFZUW1OMDg3VFcvcFhmZTRneVpNbUFKeU1sWWdsVzJE?=
 =?utf-8?B?N0ZSdTZtN09aek1PL3MyU1lCbkd2VHlWVkRJS0FValRIeWlTbkN3Qy91eTdJ?=
 =?utf-8?Q?aaEw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb133b7-9093-441b-6150-08dde0efea64
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:39.2182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBoJcFy9Gj0VKF1MmYEXPxP9WQ1GQQOfUbOA3cY+2vAcai/xZh1HKSo4NTUrvNZ733A1m1LqWHMhN/H7nPTQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add need_dphy_reset in config to indicate need keep dphy reset state during
config dphy because some SoC like i.MX93 need it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 45 +++++++++++++++++++++++++++++
 include/media/dw-mipi-csi2.h                |  1 +
 2 files changed, 46 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index d6eb666646b916c2609a279f8badc1e8af557121..632ae5fd7da7850374c79dcff63b6ee4aee7b611 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -447,6 +447,45 @@ static void dw_csi2_disable_irq(struct dw_mipi_csi2_dev *csi2)
 	dw_writel(csi2, 0, int_msk_ipi_fatal);
 }
 
+static void dw_csi2_dphy_reset(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 val;
+
+	/* Release synopsis DPHY test codes from reset */
+	dw_writel(csi2, 0, dphy_rstz);
+	dw_writel(csi2, 0, phy_shutdownz);
+
+	val = dw_readl(csi2, phy_tst_ctrl0);
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	dw_writel(csi2, val, phy_tst_ctrl0);
+
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	val = dw_readl(csi2, phy_tst_ctrl0);
+	/* Wait for at least 15ns */
+	ndelay(15);
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
+	dw_writel(csi2, val, phy_tst_ctrl0);
+}
+
+static void dw_csi2_dphy_release_reset(struct dw_mipi_csi2_dev *csi2)
+{
+	/* Release PHY from reset */
+	dw_writel(csi2, 0x1, phy_shutdownz);
+	/*
+	 * ndelay is not necessary have MMIO operation, need dummy read to make
+	 * sure above write reach target.
+	 */
+	dw_readl(csi2, phy_shutdownz);
+	ndelay(5);
+	dw_writel(csi2, 0x1, dphy_rstz);
+
+	dw_readl(csi2, dphy_rstz);
+	ndelay(5);
+}
+
 static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 {
 	unsigned int lanes;
@@ -460,6 +499,9 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_phy_prep;
 
+	if (csi2->config->need_dphy_reset)
+		dw_csi2_dphy_reset(csi2);
+
 	/* setup the gasket */
 	if (csi2->config && csi2->config->gasket_init)
 		csi2->config->gasket_init(csi2);
@@ -482,6 +524,9 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_phy_power_on;
 
+	if (csi2->config->need_dphy_reset)
+		dw_csi2_dphy_release_reset(csi2);
+
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 20ce6a21f0674cad54f01edb508dce14cd07a8dd..d1afd8c6d95457c28d7e1de6935908437372572d 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -28,6 +28,7 @@ struct dw_mipi_csi2_config {
 	u32	sink_pad_mask;
 	bool	has_phy: 1;
 	bool	has_irq: 1;
+	bool	need_dphy_reset: 1;
 };
 
 struct dw_mipi_tstif {

-- 
2.34.1


