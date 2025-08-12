Return-Path: <linux-media+bounces-39556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D06ABB222EC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7294564964
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFCD2E92D2;
	Tue, 12 Aug 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BMI+9van"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611901C5D46;
	Tue, 12 Aug 2025 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990390; cv=fail; b=TCRhmsluqJaoJ5N/0rTWS+UfEDAh8gRQgQkSrqCqaw8O3YWeayR16NunzAyogbpmTZtjI47zbIen0cv5AiuPhQt7/Fx4Oumf5i1xc0lEm1c3p9wRpAOv/9G0oIqNAvpsmYjIkFghacGx3yrDA9wFH6fnAuwCpkez5QhiUs9TRUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990390; c=relaxed/simple;
	bh=kTAVMcRTZmmz5ImXsMRqiAf4R675sdhXfc8xwokvDUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fmDZcKIGS4I3MsjI/8WSid4XReyqqoGU+YkJhtgyZs2pGv1XixYoX8oNNQnOLbdRmic+GTqarYMeTb05uKE4iwnWtrbC3l0gmFwSpU5KEZDgmLgUd30LO8kKzRRZ8fWEOYgntlf4VubVe4QOdpAYq7g7vwxSCzt2zX0pZwh8MLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BMI+9van; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSnmrXt+gVEqeOFAS+hUh9/YfYxfhn8t/O6LiabqRB17Kj2QnlfJ4lfRese6Ie0GGsnfTmouGSI2aJVW9SFNLF0/K/29cI+sKEcFq6XE59VEkSgWWAoJX5u1PULS8/49OPfClzl8Q0ruFVajkdn6lDwqSr6VQDcv+FP+y5OCXnnkexHBzFrcbD2NDwxsbhuNjLgTXJ8bXNg08QXFNZX8hBJJGlP7a0vX3yvets6OgLQRn2LZAF9VlQzUyZ2TiGncoTigrHDjEanVkGWx8A/oHi0JTaOoNQmcz6gzvXy5GY0RU707I7IG2MarE35c8mHW+2HgdHy4JPfT1uhCEyH66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMVi+ion8H8A7RFNOWM2d7Ln7dp8q4Xb/gTIR2rQc9U=;
 b=aGU7h7NAR0wwkYBXtCDrd6O4qNRynlwLiTlP5YRa33wP4G3F0WefyTpoYLy/Klvi0kad/UNsi9e15BfyiB+dJcJzKFZKVg7riUcXIxS9GLkK0Y38o+QmaBtZMLY+ahDk71palsFkWwEkga5AZYBypVES8PVOKMAneBBcad+S4BS8idjlYxAFWisPZAPBnVduTxWf7VwgVLRQ0f5UuLgUHwJGDHVGrqatRiPQjBC1SgrJIuQO7+Gq+0/HGMyrS9HGOnZWGtEKMxxCExPuctRIkcmQepTP/HhOv2hqESIRseNdr/O2pBkiBzaqvgGhHgptyGbRDU0IdQ8Ys1hWODEy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMVi+ion8H8A7RFNOWM2d7Ln7dp8q4Xb/gTIR2rQc9U=;
 b=BMI+9vanXWj1ucxS60+aLxsZqjAZfGYkLLj4tcVFDEUqlhOCIy4BsEFoih6puA8a0oK66u0JajknykTUfcIdLWWx3dDmg+kgVdMVbsVYF5pPgfhOjMTP/pCbjhA114DmUEWkdCAVRRRRV7EBz7OB0u23wtQy64YAdF6CXeqazX75mq4/HKX+1Ww29kSTlw3KJ4KdMYC8plDRlK0m6CH5v1D9tS5M96WWCvTihLkFtPOPmpYWwupEd+WnT5db7MKdR2toJxDdGzCrab+bAD/g6QlPGM/2ni1i5vhaLyM/dRjGWzpuh22JDdroxKcQ7zYIlNiwCJfamH3gbQTz9rV6Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:19:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:19:45 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v3 1/3] media: imx8mq-mipi-csi2: Add data type field in pixel format
Date: Tue, 12 Aug 2025 17:18:55 +0800
Message-Id: <20250812091856.1036170-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
References: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 4829b91b-3bfb-4658-11ef-08ddd98160a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VlhRMTFhRmpUWTlQL3FMWko5U2N6QzdFRlc0NzNBbnluaUkvYU92R2hpWFpB?=
 =?utf-8?B?SnNWUVJEMFhzS24xNHdvTDFlS0RZQmJsV2YwN3dXVFIyby9wb1Y3T3A0aW50?=
 =?utf-8?B?eTI0aTd2bW9LUUY0ZFJTQzVUellZUDJkeTRPYUJWc0JGTC9xUVd1Nzc1TFhE?=
 =?utf-8?B?WTdLcnp1WXJXS1hGNm5McXBQeVk1b2lUcXVEa2tTMmsyTG52TVdNQk9zTHVx?=
 =?utf-8?B?ZENJSCtKVHJCVENKSTgyRUVFRDdTQVFmVXUrMXhRb3R6VWEycVY5SFdGRnN2?=
 =?utf-8?B?NWJYVHg4anhYRHBaOG5sMi94TFI5SFU5cmxvVnQyN3RVNU1rQTRGVmxVUExI?=
 =?utf-8?B?V1p2eVNKL0x2WlUzVHpqSlVtNnVSa2JUdlpGdFpCcm1jUlFYYnlUVm5Ia1VP?=
 =?utf-8?B?eWsyN1hzMjZYU0dHbkorOXlTZmcrYmQ5OW03TW9LbE95WFREcFpLOXNneE5R?=
 =?utf-8?B?UUpQZ1QxQThnTUtRaUx1QUhnazZzd0Y0dGlPSnkrS2NOMU1PcHBXdXhWQTQ3?=
 =?utf-8?B?Y1cvcG5hY3ZIUEJvbmI5STV1aXZpclNJS1RBNytDN2xBWkFqUi9LWEVYSWh1?=
 =?utf-8?B?TWM4RWZtY3NmUU4xbFZuQzExT2FiQTkrRmd5Sjc1OHNjSHIrRk1CSDMvaTI1?=
 =?utf-8?B?M1NBOXFLWFIxRWhnMDhPTXU1QWRIZ2FFRi9rMjI0YzJNWkdCTGtST1ZNejRP?=
 =?utf-8?B?UUpwNU0wcCtqT2dhNzhKRXhkU0FNd2xWRWJBaWhYaWFDMmQ3YUxPMVBUSXhT?=
 =?utf-8?B?K01SK0R3QXpZcjAwN3d2N2huUjlET3Y1MW9Uc2pWS3h1VkE0ZUJzNmFJYXJH?=
 =?utf-8?B?eEcwM3JwbHIyazI0RzlkWjlGbktQSThVT2JUT2pRS1lPNUxFMGlhMEJ4bDlx?=
 =?utf-8?B?VGJIZzNUNy9FM2ZJVEVITzArSXpqd3hLZmxwMCtqdW8zT1JLdmZyM1NhcW9z?=
 =?utf-8?B?cFN6dFYvM0pyNC94d1Y0RGFscWpOSitCQWN0SzZ2a2J4ZGhwUGhSNmoyK2NN?=
 =?utf-8?B?bmEwSTdCTm8yR1hpWnlxSE5iRzhOUUQ4Mm5MY2pic1QxSC81SEFEbDlmckZh?=
 =?utf-8?B?Wk5HOHNJZ1drUTY0a2VxZzZUVktETU96U21TOXgrTE1vNVBoU1Bld3lRQVVR?=
 =?utf-8?B?STY1eEg1WjY5aVVKTG1UZmo0VldBbXY5cEVVVVBVaGRiSFZ3dy9WZHdNb0tV?=
 =?utf-8?B?WVM1OGRyamIrT2NlVUtINEZSVEtGMHVKMEIwZHN5d0JNakZNUGN1MjJDaVRS?=
 =?utf-8?B?RG1tVXRsUmdLNVBwKzhxb0t1b2daWFRFVkVycGdKamFwc242YWR3VEhDRjF5?=
 =?utf-8?B?Y1NFQjJpc3I1bnJkK29MSGtQY2t6bmtDRkM2VzNITjgrb3h3aDhFbUFTZ0hj?=
 =?utf-8?B?bUtFVXZJR0Z1MEdsbGtKZzIrOG90SnNaQkRsVUVRSmt4bVFrOWkrYUJxVy90?=
 =?utf-8?B?M3ZIZERlcEF0Z1RpNDJ4RWZuNW56VCtHbVNwYVZyaloxYkdHUUJMMkFaR0gz?=
 =?utf-8?B?d0VzYnY3bHlMUnA5K2poSVhvMy8yTkhPQWtEUklOM3Bqb0Vqcld5c3hiSVBR?=
 =?utf-8?B?V0VXM2FycERmU1M2MFFwYVJLSWd1WEpXV1NPNlpEbnBIb3RVaWtoT0xmcHND?=
 =?utf-8?B?RTlaWmV1U1BoN2xKcEJUYVY0NVE4VVMwNTUwZS9lU0ZqVkFTbko2aUJ3cUtn?=
 =?utf-8?B?T2lqL21kZFJTZEZnU0VDZ0dEQzVxYnpoTlFLM0pHZDlLb2hzRVZwSzl5Zkh2?=
 =?utf-8?B?SkxDS3pFRWdWNGRSL2hqUUNDQ29HN1JJdnVLZkE0Y1JNdXNwc25ZdnJYWmt3?=
 =?utf-8?B?eEZEakFkYkgyUXd3NWhTamJDL2NneDNRb3ZxVDFhTE9DWE1Wb2k4RlUwZkN4?=
 =?utf-8?B?dGozQUc1TFRRWnU4VkZUR2VZQStCaS9jODJpaDNEMG5qb0VLbVlUc21ackNl?=
 =?utf-8?B?Z3ozUk9NWVd6K09aeGwxMjRQSHdrbGF1UUw0TVJKUHh3NkhHa1dXZEliMVNt?=
 =?utf-8?B?UEVuaElUSHNRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VEFtT0dmS2R2Z2ZGVVIvRDdoazQ4d3pXbkFQU2ZFdCs1NTBGanVZc29aaTJs?=
 =?utf-8?B?NHVLUHVwUVo0WW9pTEVib0xzWjdjMGlNSGpXU2cydjV0YWVpZ0ZnTGVzSERt?=
 =?utf-8?B?MHVOMDltY2tmbldRMnZnNmU0QlgxbXU5R3hJOVlSREFIQ2VZd1hDTWpZV2Nz?=
 =?utf-8?B?d0M4ajBMS256cUE5SERhb1ovUEhKWk5hOHBiSGRFK055UWt6NWlHZE5zdXAv?=
 =?utf-8?B?VkJoNldWRnRGVkdNQ1VOM2pxRXh0WVhoMlA2NzR3S2hCVXgyVzhlRVFWRlIr?=
 =?utf-8?B?ZUZDQ3pvWW90RGtxWVNSVHJDK1RXbU5razlNY012SXduajNhbmx2OFlWTlJp?=
 =?utf-8?B?cWQ1WERBZVBNZEhibXF4ckRBZjNMa2g1TGIwUnEzUDlSRGZFNnM3dGNOMUxk?=
 =?utf-8?B?Nm51aG9paStlNi9WUW5MTEFtNDZLQ1ZGbjh3a3ZyWmRCREFYdXlKZDVMRFdE?=
 =?utf-8?B?NGJNTzFuUDY4cndPYTM1TDlMWWd3QUNwZVN3WDdkTm1HY1p1N1I1RG8yL1Zj?=
 =?utf-8?B?ZktuVVU4bUZvbFhOUXJFKzhEc3o1MmswOVBLQVhjUGR3cm1UMExPS2tZc0l6?=
 =?utf-8?B?aTgzZVlpUTNpemhIMitPdjhIWVJxNE5EY21Nc2dWYThVbVBya0loQU9EMDhM?=
 =?utf-8?B?ekxmSHgyRzQ1SGxHOW5kT1haQ3ZIM3RqY1dBem1HM3NSSHZzSFB4eTRES1lx?=
 =?utf-8?B?YVBKbVdraXBDYjBERE93WnhuNTNsVW4xTlVRQ1RUbUhhY29mUElBUFl1RE5z?=
 =?utf-8?B?NWdMODhWbk5sUDBoRFk3MG9IbGtSbUs4UXJ0OVRjOFFpRzcwRlRSQkNRMXhG?=
 =?utf-8?B?MTVXOGhmNnR2cWp3OXNlWTBUZEFSRHlhdEtVNzVsdnNDd2FUK1QwQ3c1TzR5?=
 =?utf-8?B?NE1PZTFuaHc4U2RJVnFiZTBETWNzYWc0T2hDSnArNERMOU54MGFOOUROK2Jv?=
 =?utf-8?B?dXAvcXAyWnJubzgvalBQekVuS3EvblpGa1R1cnpPWk82c1pxSWQ4Nys1T1d4?=
 =?utf-8?B?czNVLzBzMm5yaW1YUmRZelFCSWtZSWR3bW05MzM2amtrVmMvVXNicVU4OHFS?=
 =?utf-8?B?RUo5WFdQRWdkaDRFaTVIWitVWGtqOTFGbWgrQy9heWJKQ0NsTjhTd1JMckxM?=
 =?utf-8?B?a3J4VUoyN2pubnBEVlN4UFR5dFVyaWVObTVkVWJveStENmxkVWUrdkNpbmpw?=
 =?utf-8?B?VzRNZGIxT2Y2Yi9Ic1pUNUZGNW5RZTJlK3VpSC9KQk81Yk5rUjBVZlFjZjlG?=
 =?utf-8?B?M0V6SW5ZWGZSWWN5eUlHREZISG5OZk9ZaFpMcUxjU1RkUGpwaU5qaFhsZnh6?=
 =?utf-8?B?NjZQNkQyQmxkMHRnUGpNVGpmdnJKTVNnNjdlR3ZrUFhLbVZSazdzbFVkd1Jt?=
 =?utf-8?B?NDU4eHM0WklTWnF2RXlQQXFJSnpZMmFzcVBQbzZKV080eS8yOFZFb1ZqVnho?=
 =?utf-8?B?U2RhZU9FUWpJdGpxaVpkTGEzS2NQS3JnV0dKRGFzZFQ4ZWd0WEdFMThxVXU5?=
 =?utf-8?B?VnJMd2h6L0dKdjdsVC9QaUwxOEU1RitjN0lFdzVva3FTbmhxNWhZVk5RY0Jj?=
 =?utf-8?B?cUlKa1VSZStDazNRYkJIWWZMV2czUkFuaWp1WGFPTnNBNnhWQXMwUFNoL1FT?=
 =?utf-8?B?UXI4OHlEdkNJMWQvS3lKeVBXLzlxbUNTbEhSR1Q4TXdONlhKbk01SVZBa0Rn?=
 =?utf-8?B?UytZRnZSRzlFcEdMTTRlSTljN0xOMEhDSlREQWdVcVhZbnBwZnp5TTBIKzg0?=
 =?utf-8?B?V2JYOEdTeExYbjBvVDI1YjBoYVZMT3RaeXR3ZU03RlB2eVhOY3dnbGptZHhO?=
 =?utf-8?B?SmIrdmFGUGdUcDVJdzdZNFRodkd5dWRvTHI4b3h5RGs3TnhmanRtRnhYWW0y?=
 =?utf-8?B?Wm1ScUtxZ1B5Q2dxL0lySmVaNXlYVlFvR2dhMVpDcFh3cUFHYzhaQ0kvakxo?=
 =?utf-8?B?c1U1WElraGY1OGcrVkRzSkdBOG5jWGNabnZWdlFMb3Zra3ptYi9iT0dIM1Bl?=
 =?utf-8?B?OGtKN2phMDhqa0ROcG1NaTArcWVLdTBrcDhxZUFHZkp3aWJ5UXpVQUsxMHlM?=
 =?utf-8?B?cXZ5OThWUTVCUlBuMTlwdU5Yd3N3aWFTZ1d2clpnckpzM1dMdC9lY2VadGtE?=
 =?utf-8?B?SzI5dyt2NzRWa0pGQ3RJNVlNelFjSDhyWUZaSHBaWkRINUMybXFUeVFqcUQ2?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4829b91b-3bfb-4658-11ef-08ddd98160a9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:19:45.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aC55M6LupxnDcsvzFpZVWpG9FDQaystpGEIAVWwxI7uuDz5dssM9S7h63AVIAllJ9lLgOcdxs84jasZpG8B0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add data type field in CSI pixel format info since the downstream
subdev in the pipeline need to know.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44..7495400adc22 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -25,6 +25,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -138,6 +139,7 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
+	u32 data_type;
 	u8 width;
 };
 
@@ -262,68 +264,89 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	},
 	/* YUV formats */
 	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	}
 };
-- 
2.34.1


