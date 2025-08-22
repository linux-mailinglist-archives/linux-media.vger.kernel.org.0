Return-Path: <linux-media+bounces-40746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F221B315DD
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3424C624875
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F2C2FA0DF;
	Fri, 22 Aug 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MbqHqXrC"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013026.outbound.protection.outlook.com [52.101.83.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD22F90ED;
	Fri, 22 Aug 2025 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859865; cv=fail; b=esF+yz79q+2iNMOPWmjdcj5nTcD2jqDFt9rO3hu5RhvbjgXqwTG08yPC4d9tScmkPICdneSnJb0Y6mUDicD5tjNZBcJRc1qyIHkNG4D0Op/FlPtFE5bbD6svBQsYVKyS1EmVSNxTzfuFUVdCkzMsnhkO/g+vgMlT/Td2vw+bgiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859865; c=relaxed/simple;
	bh=+vinw9I1dtlYj7lSxfFJQrmNhWP5LNJsecXywOmwGcU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=vFL5clJsLmLWZaDurHBQHVRF6Z4g/3U92sX3OxOwP09CSCJkyU7mz6i4F3/scfw/DmnqTwJA0nU56UkazO5nCcqLx0NJJDgYjysibm7ILXWxTGgSsF05vlplPqFySikk2tSBad0a4CEdESnM5CyCSqkv+/P+N/JDBuWEt68XO8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MbqHqXrC; arc=fail smtp.client-ip=52.101.83.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aARXUmg7kQ4XP3f+bRzF+1F2PDZAbNcgdxhWzilhN5dkV4MhbRLkomntJkjhjPcGtgZ+E9PKSUlrb1cBsmIlKXFZmYXcTW57zmJS40H1tiwZffeH/DJDGVuY9lrtRiGWqdjYSEYnO5rsJfKXGquL5x7PdzAx5OpC6nmlGmsaiJ3BG8nDwYWqgOZWwJhKve40a6hLyiGm4RTt86hNUbT0YpMcH9k+f6ZQfwtK7FfIZdckzlp0hsTeuZDOCY8FbdSmpDSlgUyhlDbwxexQePsJsRB1AMnCJ13W10d9HeCjQYKbg2T3+pAvRU2E+H8jIBqeQLe9Cp8J+dHZsOpHIdmiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64KB2WQ1Bfj2Y9HR5CLOoIg1BdIgZkCgmY+Q8Ay0Ngk=;
 b=nmCRCbog2CGaAfRlq/WCbao76wymajunmaUp43mja9wEDs2zodNDNszDl/FnjyDj0VP1/uKFFmxEFAAJ4eYJZN0tGydlifB/FCINHxmGmL7whjIDQ0AeYPjFmD+Wk/3Fg5yA3DpEZ5iJ86e2IqpPXRLgdZ2Pofkdzo/mQ2bAGLmt9DPApTWnCH0kjNpSPu6vtu9x/XQ71FCDiKSgsJ8+ZRtnEE1o8Eo/bgzoPco8n8Y53/pI850mgVpKMjjsd9TV50O6INHXrR+yROg+bc8jk8wwSGYYCqv7rEV0Vx3kQgRvjzkAnTu++l6WeDUGlYbNm73vFPWqnbfaC+rHILAqOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64KB2WQ1Bfj2Y9HR5CLOoIg1BdIgZkCgmY+Q8Ay0Ngk=;
 b=MbqHqXrCh1SVo00HLV+FMkgnSG6mm6ZMEeABXH5Qx9db5VvC6XErU/RrxceYEchwSXkmCgpoYtftGQ5pmikReWgFE2TFXqk7egNCW3W4yDhltOB+raJFI4nEd12+UFdsLnAuQOjCVJlJLVMuOOCU2/U59AdxuRXV5ic6jBL3430UlGv97XER6MyiQR83Frdt1P6/L+ZjjKhLlS0nn7DFl7PauTE2LPEO2cVpynuHpgpzA9VYYtyIX132nzwB2T/7B5v+pZDtzAaUGLGBr1Dt+KdZlp75Q/7IyavYgEA1L0zrmwuAKTQovP4stCJc1ijsm+jcRTOtKOV1MuRaWaMxhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:50:59 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 10:50:59 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v2 0/4] Add MIPI CSI-2 support for i.MX8ULP
Date: Fri, 22 Aug 2025 18:50:11 +0800
Message-Id: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNLqGgC/03MSw6CMBRA0a2QN7ZNP0KKI/ZhjIF+6EukJa01R
 MLerY4cnsG9O2Sb0Ga4NDsk+8KMMVSIUwPaj2G2BE01CCZapnhPdEZxx2VT5bGS3kxSdcZ0k3F
 QkzVZh9tvd71VuxQX8vTJjv8T8R0JSTnjvTy3hJO5xICFvn0sQ8yZhm2lOi5wHB9zqfjooQAAA
 A==
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755859853; l=1290;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=+vinw9I1dtlYj7lSxfFJQrmNhWP5LNJsecXywOmwGcU=;
 b=RHNJGNFBmaSHXbruDMc+jUYbiTdZyxgLfEEvOw9dLnjeFauWzO63ACrdXbTwoNEg6UMoCoiqu
 X+ngIvmBXvWAIF0IE6chl/ijNfkDx0Tzd3zXVCJU4xqVJ9+Q3I0T/Pk
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 22eb1863-c720-46b9-7ec9-08dde169c6e7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NHZiSVlnRjhjbkNpZnEyWEpiZldibnNEK0taMS84UjlkTDhYQnAwaTBWK3J4?=
 =?utf-8?B?WmVqaVZHd3kxUHdhM1JrSHcwMWVtNmN6VHl2K1JUQ1gvMGVHT3Q4MFl5QU9r?=
 =?utf-8?B?bjY2Nk5NRTFoQnFmOEpiWmFjd1YrUUdNWkdTOVFIeThOejJpT0p1TDFUTkox?=
 =?utf-8?B?U1lleEFIc2xUS3dYTmQxZXhZRkpzMjF3NmdGbjNwZHRhRmJNd2hUWGoxMzhY?=
 =?utf-8?B?Y0ZndnM0V3UySTcyNzNLeTNjdlJYalZkREpvQ3hSSkJ1MklzdFVGOXppOFV2?=
 =?utf-8?B?SE1yRmthZitManRKZmo2em9FZ05YbFB2Z29Ob1RvNEZiY2JnL1ZxUzhVZGps?=
 =?utf-8?B?L2JWZUtFWE9PQy9hVUErQ2x3ZUNlZllZT25IRXhvMjROb1hsWnZWYzk4TFNY?=
 =?utf-8?B?VXpsczk0ZlNVbjFqcENUbm1MYnRucTM3d2xSMFUySk5RdFZnaDV3bmJkeDVF?=
 =?utf-8?B?KzZrUFdpNDQyTzFtU2FwcmVKNWQ0TlMvb3VEbjVUNDBDbWMwdENzeGZwRGUx?=
 =?utf-8?B?Wm1xbjhuUEFVOXBPaE9xdXlGZWs1NDREbURmSUlnQldtZFR5NW83MGN3dGx4?=
 =?utf-8?B?em55RlhMbzVJZk9XZ3JPU2ROWGY3MnhFaDg0b1Z6dDYvVExRSVRrSE5iWkoz?=
 =?utf-8?B?SzVYaGI2WjR6VDYwbHMwYmRzeFBvTUZUakN0SThxVjgwTzBhMXpZTFh4SjFT?=
 =?utf-8?B?L2gvUEEzL3ZpOFROd2FtQWtiM2txb1owWTBQT1MxcEc0Tlg3bWhlMUdPVUN0?=
 =?utf-8?B?SGROdVhCendCQXE1dFNJZS9KdUl0L0Q4a2dBQTB3d0x3ZUwrQUdhU0tkVm1U?=
 =?utf-8?B?QjMyWFZUNUxDWWVkS0trMGk4SkNMYmlmYzR1Q2dDaDZxT3JXZjM2RGxhNEpH?=
 =?utf-8?B?VlFOREt5VWQrdEgyRmVXOTdDb2JwOGFZeW5nMVBJZFdJbkJEelNnL2M1MVU5?=
 =?utf-8?B?bm1Gai82WFR5cGxoTXI0Mytvd1RtZFJtUUFBYXJSanBHdkxrcVoyQW9oQlly?=
 =?utf-8?B?Y1I3cy9XWHNzTzBkNHM1eFp3ZlBPdHphbnVwbW9tQkVSa1U0TElZWE01eGpY?=
 =?utf-8?B?Qnd6K2x2bTYwYjZ1bFFXTy9PRzBkaTJtZUZwQWJheHlTbkh0YTA1L2NNdE54?=
 =?utf-8?B?aXJFZG1tNEs4Y0duUjRLaHRNRHRMSTE5T0ducjJSb1hWU2FVNFM0WjQ0QXla?=
 =?utf-8?B?ZU56ZGRIbmFlc3RCM1YwQ21hY0c2Z2lEelRtY3FJdkpXZlZZdmtrRStudU82?=
 =?utf-8?B?R3VwTGhjQ0ZMVUIzN0FuanpNektoeTN4R2hTUThITE1xbG5wMXJKMTk3MlRF?=
 =?utf-8?B?NTFRYTdLM2l4emFWN0V6dHIwdkY4cDAwQVNzU2FQVUFVbysrVkozVTd2QXl6?=
 =?utf-8?B?cjkxZWs4OHNXMXVaVC9SVHAySFRxaDVETkdCS1h3RWE2dG5PZVpPdDlWTTJx?=
 =?utf-8?B?WGxTRWM2SHNsK2xZR05tc092Uy85TmJxTWtJVjNZMkJxRmNZVEYxTE9HMUI2?=
 =?utf-8?B?QWpjU1JHZll6UjNMSVczTGJRenIzMHYySmdJMXVRNUJvOUx6K2FwTXdqdXpn?=
 =?utf-8?B?aWRPVm5PdUpLaTdRaEZ4MkgxdmM2SVJOeEdNT0Z6RyttSGhsWUI0bHA1ZDNp?=
 =?utf-8?B?RnJVejZGTUtVV21wcUJSVVZzY0xXSVArZ1doRVMrN3Y5TmYrTnB3WlVuN2kr?=
 =?utf-8?B?aHpaZjVPSjZhYUZTY2V2alMzZGZJVFlHUWJnbnRmRE5GOG45b215M1FSYXJv?=
 =?utf-8?B?SWl0Rzd0MlJJLzFQTGJMZlBlekEyZDdiWitCZktRaEZ4dnI1SkVHVGE0dWZE?=
 =?utf-8?B?N0Y2TVBkclZEdEczZWpEK212bGJNcWN5dEdFQWV0N20rN3preENZN1pXNVdk?=
 =?utf-8?B?TFpnNEVKNXdyRDYyU3Q2ZHdxWlpQS2hTZ3lyVm5tY084M3VGWllDOGFxZm16?=
 =?utf-8?B?T0trL2hXMkdPYWRrb1Z2Vk02ejdZNjZnQ1lJM0F6ZTVtdVpOVEVVUStlejdD?=
 =?utf-8?B?V0Y2TFR0NWdSUW5aUXRialNIb0VSR1NjajQxd1oyc1R3ZktySmdtRnJTVjNN?=
 =?utf-8?Q?xAZsva?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OW5aRWVqVVN0MmQvcG11KzRsbm03bDBtNktwdno2bittd1orMVZuZXZ3N3FW?=
 =?utf-8?B?cFArLzdIK0tWWFhrZmFFeW9tbzFuaUYrZ2lPSnBWMW1DeDlNVmxLVy8xRDJw?=
 =?utf-8?B?MzhuVXV6Wk9hKzhJNG8wTEt5dUVtU2FIdHA1OEU2cWFOSEV6N3FvbmJyQlNG?=
 =?utf-8?B?QXBWZWc4by9HMjcyZ29YRElUSnZrMWdWc0JoemZ5MU9lZFhFOFA0T1lYek1M?=
 =?utf-8?B?WHhRTXpmMW1tVUFleWdtKy9iK000dnlFNTlCSVEvVmJIbGIzaW5RaEFDSG9S?=
 =?utf-8?B?c0c3TUlvb0taV2J4V1N3ZUpKR0pUMjJhWHpKWWxkaks4VzlFeDVYNjJmcnda?=
 =?utf-8?B?c2U0TVlibVdJRUh3cW9tR2RTY3hkQnBvZ3FDenFwZjVrdEZNWXFhbTY1cERw?=
 =?utf-8?B?WFM3d3FCOTlCdkpJbi9HOTJJa1FoRW0wZXE2UVpMU0N2WlQ5MS96K2pHNyt1?=
 =?utf-8?B?TGpzNWczcnpsUkpJaTU4UUoxdUhwZnZCZ0NzOEJtTHRyWCtGejdGeXZvNmNI?=
 =?utf-8?B?UlRvVkozQ09mQktuNytZNGJzOGNVSGNhQXNnK1BvREpZQkV4cU16Z3FFWVpz?=
 =?utf-8?B?MVZDNGluTUNEMkNtTzVtaElDNVFZMlhkUG9RMmdOOEpsTVZzSGZrWW5vWUVr?=
 =?utf-8?B?bE5mNnFYb3BPUDZ6S0ZFcCtFdmhQMDFpVWlRWFhzZ0kzeC9hb2dvQi94MkJS?=
 =?utf-8?B?SmhKb3U3dUUrcmlRN3ZKbEN5UnBEbkRvWHk3ajVCVnNjcUxJbzdPb2ptZ3dE?=
 =?utf-8?B?eER3WUQzaDJJNWx4bzNJMjBhREkvWjlXeHhaUlZGdXBQcmpKa2sxcWtMUVcy?=
 =?utf-8?B?R2NFeS9neFFyRmJOYVlEcTdUZUFjbkZjUlFDTjROaExLcnRudHdVTUx5OVdU?=
 =?utf-8?B?QU9FRnFrNS90WS9odTRMY1ZNTlZ4UFJhdTFaQ1N2eDRqTXdkY2VWd0lWbHZN?=
 =?utf-8?B?Qy9qbUJkbitSd1dPVDAwYk1la21LZ3ljbndqd2RabDdKWW5SOFNrNjdUdFE3?=
 =?utf-8?B?cm1weFhITFY2dnQ4NWFkLzlWc2JGVE1TT3oyRTllWjFkMndMTmlNZXB1QUVl?=
 =?utf-8?B?UGRrTVRTU0o2TlEyTjZ5azhTek9BS3hTQkdkbU9peVdHSVdjR0xienh0SnJ6?=
 =?utf-8?B?WGpNdzhGUnVQeXYxOXV0RGE4bkltUXFCQjRXVWdnWkRPZk9xaUk4am82OElV?=
 =?utf-8?B?WTJWUllmbjhHODE3UWNzb3BPckt0eXhmVkRVbFRHVG5kcnV0b08xTnB6Skt4?=
 =?utf-8?B?YklKeXoyTjRNL1ZsejBvKzV2TWQ1MzVSMVBVM2IySFYzWklJUTJJK0xyMXFC?=
 =?utf-8?B?bTNMcnlIWk5aY2JtcEJLSlZGVS9VNTl4U3BDR25JT3JJOHRxRytsNFZwWmp2?=
 =?utf-8?B?cmlsdG41YVBvTm8xUGtNY2RycWdvL25qcjVGUFBOYlk5djQvQkFYY3RzK3hR?=
 =?utf-8?B?a2hnRE04UmZud2ZjZEU0eWNyaFZZYWpNcm9hdDNmKzZBWWI1dHZjTGdYZGJo?=
 =?utf-8?B?NkEzSXUzbFltQkVSdmlXV3lNZkowSW9PTVpvVUJQYVJEK3BuU2lFdUF6ME1P?=
 =?utf-8?B?bkZWMjB4U0tQT2ZkWXBQRnliZzJHRU8xZ2R5eStSeUEvNHY4bnB3aEpzb0FF?=
 =?utf-8?B?ZFhvK2ZNVHZNekg1YTJ2cUgrbzVLUXBEMkNlQ2VRTUFsRTMzYm9UT20ycWFS?=
 =?utf-8?B?cHJKRXFSVWxaaStxMHJQMlhvRG11c205QmsxYnVtRFVzNHRjRHhNNDNuR0xD?=
 =?utf-8?B?OVBvZi9HZmxGRHVUWnphN0hhUkNVdFQxQ2M5RjhtYkpKckFRZmdpUVpyQjU0?=
 =?utf-8?B?bDVkSHZnc0pkWVVGOHVTVlZmb2lna3liTVBzZTZ0cldxQWYyNFFHZSs2WHZZ?=
 =?utf-8?B?RnFsWDVwc1JVWXQvV1ExZGx6VFZUT2JNUGpTVk1GZmN3ZSsrUy81aUNhYkRi?=
 =?utf-8?B?VFNuL2lXL1RjdXNML3N2aEJpVm9yS05yTGRSdmdzWTUxK2VzWmRYd3pWbTJr?=
 =?utf-8?B?dENqSkRlUlNHSitQOVBPaGI2aHdkSzJOSHg1dlB5WklYQytxVlVrMGtiQVVV?=
 =?utf-8?B?ZjRrQTZJaEw5Y0JEanUveTVva2QzWXc5UjNoV3JOVWlBTTUwSlAvNjRMZVlt?=
 =?utf-8?Q?8vHxSLrgNC5+353/ulYzCiVEG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eb1863-c720-46b9-7ec9-08dde169c6e7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:50:59.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsMXTFSbrugNIMAW2L0M1PTPPlr/ZKmn7XQ0/vQY/48mbbmDWNh+SG+QFl8WIpznhlHCH7nxeuwQOXC+FW6Dkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (4):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 42 +++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 60 ++++++-------------
 3 files changed, 124 insertions(+), 45 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


