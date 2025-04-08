Return-Path: <linux-media+bounces-29689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D2A8180B
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05778426805
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EEA255230;
	Tue,  8 Apr 2025 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kANTUpEF"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902A258CC1;
	Tue,  8 Apr 2025 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149283; cv=fail; b=LygYBa8N0nwEilBP7FRF1vZKC6g3X5ym/T4hgm51PinuxL/Zk6s7WzQvaWEsEPAgAT0pALy2u6CFGjn84s3jsX0RM0l4V5PPUDtAHkWBJKGnOTJYgy4pzRxWhpYF80I3F/PIfp7+YAC3A3on3rvOBjAXeEn6lWMvLxR+qYrC6ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149283; c=relaxed/simple;
	bh=R2kk0SBqVzOFIflcKq8BrxZ0OmoRNLZ62rPJnBtoVIg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=phCy9WsdGX755tAycZi5r92WXoLqC70KUkDJ4Kk5yk0Dp9zYQv1KLN1XOjsOgCPhkAAoW9WTzBx2eoE+UT5rWtr9Zxw/jxRINLGX/dpFMY9zDMZuTTyeSPhkPtcLACHDkXaILe0q/Vn+WMpAPFI+e54qIG5k4Ge2J/0owkVtVrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kANTUpEF; arc=fail smtp.client-ip=40.107.241.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfdlx4Cisf8/R01MPi3RwTTtbYmL2C66JhFxmmeKurVq8C31II6/pxB1jVRAaGViXAQXLe+XGx7usGz8XH7HlJoNHl/HBMaI3iIjLPzAkMUr/DBasPjuFd/MImhkbRBcvzWxzL/EuToycOAPCUg5YM2WwsuGSPZD6HTKrXdjPc7DZFk5mEyR3DhgO/IVSq4ipKl1HNlhJyLIvppRetlHDlMNDaEFmjJfntvKXZbpx6bNndBXcUxATrHMJOenTeFUGx8EntPUgF5lH/b7+LK06Cb1fQofxuOpTsTcmh45USbkv0yX8TDqMskb7LlyYg8PI9jIHk+db5DZnRPAynyP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PifaDEuiM0LSt6Kb/d7M3sEq910h1cnQiB+4EzQ/uwc=;
 b=ieiZDO+8FlA/ThbQyKPwvARmnLpMa/gZjoDTK88T7+5kuu5xVOL2aVO1BqElJYu7LtOYpRaf2gzE+mHUgAO4GvtNl97uU86CI6+7h74KAgPkUVHXdqXJEZxYjNE6MX78bnJUQT+JWOiVE3DyJ/TgG+zlWtlB2K9z5wOql0JQ03qksJIKah3rlb0wTeD9+2a41jYsoUv4SwbfFejvmegMBxrdaIUAL+RysH82FFAKLrX1oaOUho4J/nO9OIwgadkRQkw/OJe5gNIqSrps59qwft9x16U1WmipxaVQXvxyO+9JCDLIv0HRw21B6iKH9GBS4CowmvuQFK1Rb5Uom6t+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PifaDEuiM0LSt6Kb/d7M3sEq910h1cnQiB+4EzQ/uwc=;
 b=kANTUpEF2Z77HJPz+jaUWSoI3Jk5qW9agUfBbMhPFoJe/t+XuUaIEiRQLg7cfyOcSAJGFa4MVraH2FEn9N0mSb8v9Ybfp71dt1YVzUhGkB9dOwjPps5PWvvK6jvrd95OUo65/OkTurVRQMm57krxUwmNfxtWC/xXLNCJb/e+gEl2RmJdK/2f6tRV4C4sTEZZUu2JvNm+HGqV5OSsTKOC3xQFBcSYNE3hf9B62f+X/YBEQ8vYPguMhhWmSvN6sb/lTpSZxzkXsTVIpbhwnOp43J3a7x53HLwJ7hGC3/04+3B/KnV1cEE4rVM0cydYfGBVNbC13ZlsfaVxAP9Ea9spvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:09 -0400
Subject: [PATCH v4 11/13] arm64: dts: imx8: add capture controller for
 i.MX8's img subsystem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-11-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=18070;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=R2kk0SBqVzOFIflcKq8BrxZ0OmoRNLZ62rPJnBtoVIg=;
 b=5IMKxS3cDYGQBbXkwQVROPd8+BbG1KHk0h1JBSSvwPtQX+aQssBPSyrthYYPK8UZpW1eMNYOD
 aPrEM6A83VoCKlDzJBgz84wxyQA1/+LOtP5gKH7/pZQrFmzQNPsE3W1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c68dc98-e112-41e0-f238-08dd76e7f653
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UStMbWJoUHBBdVU5TTh5UTZ5MmIvNS9VeUUxT0N0ZEFHZGsxdzlMdkJVcUFy?=
 =?utf-8?B?eEExZFZuczV4M3FSMjkrTXNhSFltdVBlTXN3ZVlPZjhSbnpNN0Q1M09PbUpS?=
 =?utf-8?B?UEZZK0FXZDFXTlJHemxQUmY4UTRvM3BEOGwzSWtiMng0U2Jpc3J4YjkzSUF4?=
 =?utf-8?B?cVpsTWo2aEhXVE9jUzVaU0xxM0JLYjVWR05EazhtMlNiVkRwMnFrbGF2V3dC?=
 =?utf-8?B?LzN6bFJvNWVyTDVUOHlRNUNJWGRVdjI4MC9aY2dvZW1saUJoQ2t2eVFsVmR6?=
 =?utf-8?B?ZGVBYllKTG5NMXE0cnRkSnYzVTlPRWRVNjM4eXJhb2pTVUFWZm1pZi9JUWZV?=
 =?utf-8?B?RitZV2Y1WGlxZTFITC9TTk1XOWNySm04MHp0UzhuWS9HSVZPT2k2VkVZNjgz?=
 =?utf-8?B?bmJoN1pYQXVEVmFzMnAwSnpmWnk5TkVSaXVoVVZtTm1SSWxLNy9WNmUxOFF4?=
 =?utf-8?B?TVhKZFFvWVdaNWNsREhRazBhTkFWZnU2TC92WTJPYTlmZnV6SnAvekswaDcx?=
 =?utf-8?B?emxhb2M3aWFkSThlQTFQaUg0TElDeU1qdzU2ejRicllqS0tLUmlOcFZMWnNG?=
 =?utf-8?B?d1dqRVlPTEdBYzIrSk5QUzBXMEFPbTlsdWZTZEZFeDZuSlpzOHRWeXFDckJJ?=
 =?utf-8?B?UnJMZHIvZzRicDhqWVQrTFh3dWEyZ09Xb2g3NklnbG1zRXQrOU1zaDhBUEl6?=
 =?utf-8?B?THNaU3plNUlZZWgyTzkxdURERGx6ekdodm1EOGF6b1JHQmZmZzhLWDlYeVcw?=
 =?utf-8?B?c2tiVnpHR1g1QXQ1VnMrTVM4MHhmQ2ZZaDZ2bnluOEFHMVNWbFArVW1xZEhl?=
 =?utf-8?B?TnUrZ1JyRVUrbW1iWC9JUFpjb3QvREU0M0tGMU56YkMzR1dZREtGVVRaaUpz?=
 =?utf-8?B?Uys5N1pXbW5QSFNhWjhpeittNFpKMEVVcHpQVlFLeXQxcFpYVStJUTZ6ZitK?=
 =?utf-8?B?UHhWTTZpMEJVcnBJdVBwWDJSZHRGU0VXa2RVRlFvT2puNDlsZE5lb2tBOEpW?=
 =?utf-8?B?OGl3cTdMbk1oSm1HNWEzbzR4cndKejQ3YXo5VjQxTmVhOTBRQUhzZXVFaW1D?=
 =?utf-8?B?eWcwdllBQkhtRmdTYjJUN1pLU24ya3FycXM0UTV3WWFRSUlhRnZhVnR6Y1JQ?=
 =?utf-8?B?UUFEODhLMkRieVV6R2orWTIrWHhMdmFNS0t0cFRjelhOenZJRUNsdTQ0M2ZZ?=
 =?utf-8?B?QkI2dk9qaXI5aWpyZEk3OHZ0R0g2SDJ0R1ZucytMM0pKaFdJdS9UM2t6QXY3?=
 =?utf-8?B?RytYUVo1MjEzNVBMdGdzRDlkMzVlbUIzaVB4STVNUE94cXd5M1RuVldReURT?=
 =?utf-8?B?NEp2dERsVGMreHZCZ203WlgwNDdZcHk0ald4WlNKVUtNakxVb2FBZEhYbGpS?=
 =?utf-8?B?YlU1cFhlWmt1aW0zVjhxY210MXN5S1dFNlB5NXAxdzMrdDJNVXBBQmcvMEMv?=
 =?utf-8?B?SkFKQWdjSnhkQUZoSGhraTlmNnFCRHV3Q2VjOWp4ZkV6LzdTbWJqVmo5MDBq?=
 =?utf-8?B?S3c2WStnSmpONVEwTXBvNzk1azVhRTl1UWJLOE9kcDNKampRQVBkazRndzR1?=
 =?utf-8?B?aElEZlprQVMyWDkzL3ZuRFFxL1lFZFBYMUdtdmoxU1AxUXhMNldvTXVGdExF?=
 =?utf-8?B?STU0aFlKZXVGUzQrRm03eUZnYWs4bHBqb1grNHUvaHVpNkpWajEzYmhsa25I?=
 =?utf-8?B?eDZyL01lbG1ZMFF4QW91Tk1ST0ZXL29yYzcxL0FibW8xUEdhWGdsSnFUb0dZ?=
 =?utf-8?B?QTNTSWNLQkwwd2RaOTZRY2JRTU82cHF0b3hsWEZhVnNyZW9DY1dZa0FSR2s3?=
 =?utf-8?B?bGVRNklSZFpkcnBxNk5mQVBkOUhTMjR3NitBTkNxSlpiSGNxOEFOQ2J4TTZ0?=
 =?utf-8?B?ZU1jYXFVVmxONjBsN0o3OWlGYy9XMVR6dHZubWhrRUcwZGhFVGFXYXZ4bGNB?=
 =?utf-8?B?UTBMaVUveGthZjBvOUZTLzVvSnhyTjZKeDlHQzRZZlpsT01vNldvenRDYTQ3?=
 =?utf-8?B?cXZaY2VJLzVRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZjdzaGhGU0dQelpzallnQmdSdHg2YWZzdW5CWEhPNzBoK2lsbGxHaUhCUytp?=
 =?utf-8?B?VWdrOGJUandPaTFoRUlOaEx3dlNIb2d6ZW5LT1c1Z2lNODRCUUxtaWk5bmpj?=
 =?utf-8?B?KzhEK3ZBSC9sT2xJQy8zUXZLNE80NndINW8vMlpuOGVjckRSYTh2ZlY0Ymx3?=
 =?utf-8?B?RVhjSjNmeFB4VndWbFlna2VqeFAyUGFDK2YvSjg4TnlydFNKcnNYd0xuR0Q4?=
 =?utf-8?B?VjNKdlZyTTdEWklxQmxDZlJ5T0VTVkU3OUNzTmk1Mms3Vko2clJSWHBTYmV2?=
 =?utf-8?B?U1ZaNjE4QXl5SDN3RzZFVU1JZFNJWDhXeUhsT1pVbUdIZmhmeGpkek9acW9O?=
 =?utf-8?B?YkRsZ3NPZ1RWaXJFcFBTaExiY2t3Smw1MnlBdE8yTWJZQnAyK29xYjVIc2FW?=
 =?utf-8?B?Sk9qMWUvTUhZSCtGWm5WMjVDa3ZTRWl2OG5PV3MwRXh2NCtUNUpYOHVNMElX?=
 =?utf-8?B?dklvYUVaVGUvdmlKbkRDUlo2dzBIY2NIdVl0ZFQ1QTF2VFFDMmlkWkxZdmF4?=
 =?utf-8?B?OThTZktNMnFoT1RoTm96Mm1zTVU1Zy9TcFZub0UybzBGLzVtRThFbkVzV3pV?=
 =?utf-8?B?eEtPU3dvZHdDczF5dE9wS25oK0gvaFliQ3pYNjJrVURPQWdWYjl1UHV3L290?=
 =?utf-8?B?UnNvNFZuMHBjY2J2WUZubTNmRFBMNzJzWHZJK0V2NjNheGd6RFljeFhnOGcw?=
 =?utf-8?B?c09XL0pLMmc0SzdTTngvRTdvaWFzei93M3BiS2FvSVd3b2diQ1hoYXBIV0tI?=
 =?utf-8?B?eExpYW45Z3NJbnY4VE5BMkZJd1hxdUt1bTNZdkhHaTlUTHFXdFdCekxrenk5?=
 =?utf-8?B?Q3h2SXp5TW5POUFPdDllSW5wZFpSTzlGemRxa21uSllaTy9RZFpXOGdCUmJm?=
 =?utf-8?B?UGxTa3VlRWt6WmZtNlJ4bWRYNzJrdVI4NDVBa0RGZmpKOVcvK0FPYVVjalhZ?=
 =?utf-8?B?OGNLT1BCZVJJQmpSL2RtNXpkU2pxQUhKQlR1TlduMGVQUjNzeFJzdUgxdDNj?=
 =?utf-8?B?ZkVMQjl3ZVJ0WFp4TWNpU1hzdDdoRHArZExwbkFoUjAxZktOSGxYdGZBZ2h3?=
 =?utf-8?B?S00reVlUZkZnTXY1RHN2T1JzaFczNlNUWkU0a3V0bVUrS0pnbTF0eXM1N05V?=
 =?utf-8?B?ZVI0USsvOG0rY3UvdEQ1ZVhHcUYzR3BJYWc3ZisxSjlyU0dmODJxdDVpKzFC?=
 =?utf-8?B?VnhkYkxHT3dlckFJNktXcDF2M0htUUlIU3JIdmJQamJzQy90Mk52NGVpdEEw?=
 =?utf-8?B?ZFFGZHp4cmFqaWgyQkpGUVJCR3RMMHloRXpIaUtHaHVtUTdlQVpFQzlFSVU3?=
 =?utf-8?B?MEtILzErV1J0TFpMd2xZbkVGTjJQYWFlL3A0NVpBNHBRbWZKMW9FbHJ5dTlM?=
 =?utf-8?B?VG9ESzlHK3gvM0dFV29wWkxRMU94TzBGK2k4T1pLUFc4SDBla3JaQkdvSWpy?=
 =?utf-8?B?SFNkMFJWRVM1NGJOVnpndEVxZ1JCaG9jS2lTRzkxUTlWK0lHMXFsRG5ydGZG?=
 =?utf-8?B?Qkl5dVFFUERHRTZqNzYzUmdkT2pCWmU3MFZ3WVc3TzB2b3dicE0ybDF4a2ov?=
 =?utf-8?B?RHh5akpBSmkycXI2a2FyY3BkNmltRkpJWjMwQXhQQTVvOFR3bXAxMXNveUlx?=
 =?utf-8?B?Z2hOYVlINDBBM1pwVkRud1BiNHdUR04rNm5DRzNhZnB3TkRGQjU1RTEySjlG?=
 =?utf-8?B?WnFSeSs4ckJwZ1BFeSt3T3JNR1g4b3lRcTl0WVVMeU9FejV5a1lEKzFaZkNx?=
 =?utf-8?B?QTRJeHE1eDBibHRCUnkzcTVwaWhqZHZUYnVQbFZGbzQvR3JvM1ZFRTNPVVlz?=
 =?utf-8?B?WXFLejZ0R1B2VzBNbFZWaDIzeUpMV1o3ZXNwN1dxdFpZSzdJUlBYZ3dBSHZs?=
 =?utf-8?B?OFIyazRnMVVVa0V2bk1nTkt2OTZ1bklwZ0ViM0RteWhvTmNtblAzWjVkdXhC?=
 =?utf-8?B?TlZ5MDNUOWkyTTRLTkl0QlBreGJhQlE3T0dxNEYxQXN5azFvVE5qRHcxelkz?=
 =?utf-8?B?S0ZEL1RrWU9TNVN1TTBMV0d6d3BVdW5OVXRJMG9CR0lpSXdCZHFFdWNGSFUv?=
 =?utf-8?B?YUlqMVdWZkdqMmFLY3RRcXVaM3R1QVE3ekduUVlSekpBSmpsK3llWEhrOXhS?=
 =?utf-8?Q?CV8U0VqQcYDK8hRv6tdPPeKtA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c68dc98-e112-41e0-f238-08dd76e7f653
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:39.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRxmEBLdYbYa/PreNvxeF2oa7Q2JKkN+GkBmmV8oChlXB0rr8zirrDsU3y0OqutSyrlo5/zMX7orJ339xGKNKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v3 to v4
- remove unused clock clock-img-axi
- add ports information for isi and csi
- Fix 8qxp clock, irq and power domain
- Fix reg size

Change from v2 to v3
- remove phy and put csr register space under mipi csi2

change from v1 to v2
- move scu reset under scu node
- add 8qm comaptible string for mipi csi2 and mipi csi phys.
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 362 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  85 +++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi         |   5 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  86 +++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi        |   5 +
 5 files changed, 543 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index d39242c1b9f79..2cf0f7208350a 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -10,12 +10,264 @@ img_ipg_clk: clock-img-ipg {
 	clock-output-names = "img_ipg_clk";
 };
 
+img_pxl_clk: clock-img-pxl {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;
+	clock-output-names = "img_pxl_clk";
+};
+
 img_subsys: bus@58000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
 
+	isi: isi@58100000 {
+		reg = <0x58100000 0x80000>;
+		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "per0", "per1", "per2", "per3",
+			      "per4", "per5", "per6", "per7";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>,
+				<&pd IMX_SC_R_ISI_CH1>,
+				<&pd IMX_SC_R_ISI_CH2>,
+				<&pd IMX_SC_R_ISI_CH3>,
+				<&pd IMX_SC_R_ISI_CH4>,
+				<&pd IMX_SC_R_ISI_CH5>,
+				<&pd IMX_SC_R_ISI_CH6>,
+				<&pd IMX_SC_R_ISI_CH7>;
+		status = "disabled";
+	};
+
+	irqsteer_csi0: irqsteer@58220000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58220000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi0: gpio@58222000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58222000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi0_core_lpcg: clock-controller@58223018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58223018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi0_esc_lpcg: clock-controller@5822301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5822301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi0: i2c@58226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58226000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_0: csi@58227000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58227000 0x1000>,
+		      <0x58221000 0x1000>;
+		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_0>;
+		status = "disabled";
+	};
+
+	irqsteer_csi1: irqsteer@58240000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58240000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi1: gpio@58242000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58242000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	csi1_core_lpcg: clock-controller@58243018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58243018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi1_esc_lpcg: clock-controller@5824301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5824301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi1: i2c@58246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58246000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_1: csi@58247000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58247000 0x1000>,
+		      <0x58241000 0x1000>;
+		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	irqsteer_parallel: irqsteer@58260000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58260000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_dummy>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	pi0_ipg_lpcg: clock-controller@58263004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263004 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "pi0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_pxl_lpcg: clock-controller@58263018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263018 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_misc_lpcg: clock-controller@5826301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5826301c 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_misc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c0_parallel: i2c@58266000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58266000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_parallel>;
+		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
+		status = "disabled";
+	};
+
 	jpegdec: jpegdec@58400000 {
 		reg = <0x58400000 0x00050000>;
 		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -40,6 +292,116 @@ jpegenc: jpegenc@58450000 {
 				<&pd IMX_SC_R_MJPEG_ENC_S0>;
 	};
 
+	pdma0_lpcg: clock-controller@58500000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58500000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma0_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pdma1_lpcg: clock-controller@58510000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58510000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH1>;
+	};
+
+	pdma2_lpcg: clock-controller@58520000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58520000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma2_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH2>;
+	};
+
+	pdma3_lpcg: clock-controller@58530000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58530000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma3_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH3>;
+	};
+
+	pdma4_lpcg: clock-controller@58540000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58540000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma4_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH4>;
+	};
+
+	pdma5_lpcg: clock-controller@58550000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58550000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma5_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH5>;
+	};
+
+	pdma6_lpcg: clock-controller@58560000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58560000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma6_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH6>;
+	};
+
+	pdma7_lpcg: clock-controller@58570000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58570000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma7_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH7>;
+	};
+
+	csi0_pxl_lpcg: clock-controller@58580000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58580000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi1_pxl_lpcg: clock-controller@58590000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58590000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi1_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585a0000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
+		power-domains = <&pd IMX_SC_R_HDMI_RX>;
+	};
+
 	img_jpeg_dec_lpcg: clock-controller@585d0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x585d0000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
index 2bbdacb1313f9..ce2ab67c6cba3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
@@ -3,6 +3,31 @@
  * Copyright 2021 NXP
  */
 
+&isi {
+	compatible = "fsl,imx8qm-isi";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			isi_in_3: endpoint {
+				remote-endpoint = <&mipi_csi1_out>;
+			};
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
 };
@@ -10,3 +35,63 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_0 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi0_in: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi1_in: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi1_out: endpoint {
+				remote-endpoint = <&isi_in_3>;
+			};
+		};
+	};
+};
+
+&pi0_ipg_lpcg {
+	status = "disabled";
+};
+
+&pi0_misc_lpcg {
+	status = "disabled";
+};
+
+&pi0_pxl_lpcg {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8f..c6a17a0d739c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -333,6 +333,11 @@ iomuxc: pinctrl {
 			compatible = "fsl,imx8qm-iomuxc";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 3a087317591d8..9d9d933148f1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -4,6 +4,88 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&csi1_pxl_lpcg {
+	status = "disabled";
+};
+
+&csi1_core_lpcg {
+	status = "disabled";
+};
+
+&csi1_esc_lpcg {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c_mipi_csi1 {
+	status = "disabled";
+};
+
+&irqsteer_csi1 {
+	status = "disabled";
+};
+
+&isi {
+	compatible = "fsl,imx8qxp-isi";
+	reg = <0x58100000 0x60000>;
+	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma5_lpcg IMX_LPCG_CLK_0>;
+	clock-names = "per0", "per1", "per2", "per3", "per4", "per5";
+	power-domains = <&pd IMX_SC_R_ISI_CH0>,
+			<&pd IMX_SC_R_ISI_CH1>,
+			<&pd IMX_SC_R_ISI_CH2>,
+			<&pd IMX_SC_R_ISI_CH3>,
+			<&pd IMX_SC_R_ISI_CH4>,
+			<&pd IMX_SC_R_ISI_CH5>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi0_in: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qxp-jpgdec";
 };
@@ -11,3 +93,7 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a57..c078d92f76c0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -241,6 +241,11 @@ scu_key: keys {
 			status = "disabled";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};

-- 
2.34.1


