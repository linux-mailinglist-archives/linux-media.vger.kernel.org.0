Return-Path: <linux-media+bounces-33187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D773BAC12DE
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61097188D646
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514B229B8F1;
	Thu, 22 May 2025 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jNQrgQpr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60C29B8DB;
	Thu, 22 May 2025 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936671; cv=fail; b=KoXjdegrhyh+tdPOyGlfmOGQfGodkxW6MpH2hJpngqxZCjNtslhFcCGYPq0RqFYN2axiR94jv3hZ+8wqkrC36NCS0bawtwUpe160pCYlnS6ZLZT1i5nJXWyP09y+yBBJhTdkc7q7pPSlLZNgF0+YXmWEDdFfVUh9j06W7Ysrf74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936671; c=relaxed/simple;
	bh=FPa4YzYlpLsluVUau8kaPkuqmo5jDaC+9IpQrQmhdAE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m3vAO6Cv7UROvhATaPshnzuxNpP2RpPesJfEXbUlzVZsxVgTk1U/ESOpVPj674Rz0D/oXJlE9QEL3m28EvBG3qfBtzpqXc9YDpeySMgmw+fHrZazeMwiLs4rifGkWp/OaG7nRugxcAAzTffVc+/iM+mcIIkD0H2ZrGSQJuLinW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jNQrgQpr; arc=fail smtp.client-ip=40.107.21.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cisLzvNniZLuzUT6pYGvK/230WE6g/O8SDT2rzC4JE/aDGILolQj2R4RHjrUqkFz0BXqJRHDGV7HtyQYH6DYJFd2RMF7To1GQKUpShS1j76DK3vXo10p305Eb4gyMSUB5NHTPUOCt8+FsHf6svAzKTYON+YgzDhCMlWNSyR44SUfIfMeqCfX0+k/p3WZGSSfMnGhOqKRy9kdv7yGvjlzJIILm76thJsuayGu+4PLIXYFlKVmP05C10HpBoXZe+M+tQzgwjPr2981yKbn5ZuRUAeciavS2+R5EHWftMqyHWTK3qqPHprESQwqXcfUBQHPjtyIiTkuTJo/RR5RQqyC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MMt3cwDxpKSObS3qUWZGqRJJRxSNYTh00DQoNXLMuc=;
 b=qVVTReSD5tuIqKhaevzlr2QtslDbUST4PUdjlKK94f7AEu6GDYKdUK38nL+nqLk/ENIBJ9VIYdvr+FKgI3Dwef+9UBvnU9F+UXU1vcxsZiA1ujMKsSbeMyfsdwO6z9W5WmUep5v5MPpRaI6IazTZAWPOsIu0/9CV+FNIvbRlD6axWU3Xxq5NnteuXr530lCQh2uEbc2I/nRe+NC1bm+zBJNlv9tm9fuw8++l/z26RfSETk42Xz3h9gtikFLunz+ZEHrpV5/2PTxQKsmWb371vMFrfDLboPs3Y7kRQmnPUopMjpspQPQbyJrdukCBehwLra4VobWde37KOrUnS6db7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MMt3cwDxpKSObS3qUWZGqRJJRxSNYTh00DQoNXLMuc=;
 b=jNQrgQproRQOPyNk35ETmBKCnZW/uELJW4Pm03W3zilYkn1S4TItaHCgocWZI0Bgo5wOJI2SxHAdrwpp5wYm4xojzJj6wuJBRgqgHt/elTZJRwFYXmSg6KFAt8+I2qkOVWLVDxxXN7De63HfHS4p1oRMM3HOKt3SJ4BHQW1lzOs/r3SipYmZ86D+zIVNjA39B+U2lEqqTaHej4X3MRAFyRKWlxTTtXsK5Sw+5760TKAA+Sn9MCGcGgQ/YKH1tD02dZxwap5ZR28q9AAfQtT2D5HQJh+vWIuQgnIGDHdOwHkJXg5h0fP4DLkPYSvVv2qnEne5cPZ/m5YNqD5/pI+sHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:48 -0400
Subject: [PATCH v5 10/13] media: imx8mq-mipi-csi2: Add support for i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-10-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=6189;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FPa4YzYlpLsluVUau8kaPkuqmo5jDaC+9IpQrQmhdAE=;
 b=43RmRaZd/pPjCZ1Xh/WtGWTMTBIFQwxsYHgOPtkAUrgsyv8Zo1GSGbW3attfaWJBvUJmPwYXN
 nyxDjZP6JT5DPIsg5u6W6BHZ0cwJaVTtLo9fA9B7E2k04O3EuXnjPpw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1d61e6-4b75-437a-19b7-08dd995a2858
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QWJZQ2NLcmtlTk5zZUlIZjVxMTRYdFhETERaNG1pZDAya05kNVRZZ3JwY3dR?=
 =?utf-8?B?TDJGOU5yRjVrK2kvWmt4RWlLV2pmOVBrVVBHVVIvQnJpL2Z1d0FQa2JYZ2tw?=
 =?utf-8?B?ekJORnRpcG5pQ2RlU3lzOGZXUFVoYXE1N0xBRERNYzNXMURyK3dOQkVVeGQ1?=
 =?utf-8?B?dEtsMitWalZ6MzFmRjZsNFBpZFhRbW50Sng4QnMwQ25IR0JRVDN2cUtiU3ZM?=
 =?utf-8?B?SmsrS29lQ096WCtVSEQzeXdFa0pJUmJOd2RwblVRWGJKUHc3elNaZkRHc3pQ?=
 =?utf-8?B?bEkvVWk0WmxSZHVqelFaRk1ZeGQ1NWZBSmZUK0FLVlNyZGozY211NXBELzZE?=
 =?utf-8?B?ZTE3aXZNNm1SS1YrUWJ5NGNnbnpxUE9VcVhUbUFWTGdhUHZWRCs3L1ZmRndS?=
 =?utf-8?B?NytkV0F1KzJzd1RYdTFYa0c4bGtYazNXUDVETG5GWEtOd1dhVHVxVjB3WDFo?=
 =?utf-8?B?R2NCbFh6ZnJhWjhsUG80U2lUOHZrb2FsMTc5RTlURnRucVBVYU1BVElpOEhC?=
 =?utf-8?B?N2tPT0E4RWtoL0hERmdJMlNQOG1tVzdzdHZZREhPTWhwMTJMV29jUmx5VjJl?=
 =?utf-8?B?VXR5V1NRV1FtcTZTZkhFZlByMyt1WE1Gcml3WWxWSXlOK0FYRCtIUS9jZWJm?=
 =?utf-8?B?RmNVcWVhQklFdjVjN0Zrb0RnU1B1U3FRanJ6T01JRGYvanhEamw2Q0YycTI5?=
 =?utf-8?B?Ty9OTHc0RW83eGtWU1hxRExoMTlyc1V1OWxoWUdrOU9iMFZKSmxGSFVMMEJ0?=
 =?utf-8?B?WFZCT2gzdDNPM0NiUmxGU1B1alFEaThNanVUa2RFOGhtL1F5em1DcU8vWjZ0?=
 =?utf-8?B?cXVYWlQwekVuMXZhNUpHcjl0T0RTSTBWMlZxRUdkYzAvT3hqTWZWOXRZYkNn?=
 =?utf-8?B?QWpYT2k5QlNFcHppTndZVFMyR29jbTVvUFJodllTNzVzNThaZG8rWmtna2pB?=
 =?utf-8?B?WUFnSDZzZCttS2t0cjZuTkVZbkM4QTltNVBIaGtQSmhkd2loY295YmlzcDRR?=
 =?utf-8?B?Ullma3dtYkRMbk5MTTNEVXYzSFg4enhWVHc1c0hGYlhoYytxWlEvYlZSaEhM?=
 =?utf-8?B?MlFEUWZ0eVptSHBRWFhyTDBUUGJyU29jWDlqblVXaW9QZlliYTNlZDhsTkFZ?=
 =?utf-8?B?UFovYlRmYWxMZHNFZmpHeURRUm1YdDY3Q0ZaUkJod2czVTRzZzRLd0t1am5k?=
 =?utf-8?B?NnNJZFhVSE0yM3FRTHpEMkhRbXk5eStCRm5mMnVoakJudDJ1TW9uVVl1Yzl0?=
 =?utf-8?B?OXVXZTEzeTZpd0xYcHZYRXN5aWorRFRWZ2NsMi9qNWV3SzN0dUpSVzVST0d5?=
 =?utf-8?B?OGhCMSsyUnBTY1J5blQwcmRIWDVGOUVnT1dzOXd5ZjZLbmJhL2FlQ0hFWXA4?=
 =?utf-8?B?ZHl0VXpON2hKQ0VHZDVEdWV4dXlTVzZ6R21ZeC93cW1DeUtuMEVNZGFrYTky?=
 =?utf-8?B?YXl5VzdJT1hhVVNWVEtoaFhhak50eXBWL0ZSVlFHWk5QaU5SaFNNdGhzNkNI?=
 =?utf-8?B?TUxrWWM0TmlvNGo5WW4yQTV2UkdKS1U2Zlk1ZnZObndVV253YjY1SUVKTmp2?=
 =?utf-8?B?SUN1ZG9aUzRtZ2FoSThyYnRsUnpPYjd2ZExmakVac3Q3RWtnMklMUWkvdm12?=
 =?utf-8?B?WWMySDduU1NoOU9FUzhiMnorOThuVWRReXJzNmNLdVZoNVE2R3JsWThKWkF4?=
 =?utf-8?B?Z1NsaWdqTkJhdFI3RjN2bk44ZXJ1WWxrY3FKdVluV3pRZjJmZ00rcm5hblpJ?=
 =?utf-8?B?emt0WTl3YmVTNk5vYUZYdTcyb3gwejNGalptVmNicys1QzNrSFNObHIxeGc5?=
 =?utf-8?B?MmFweXBaS3VRb2JnM1ZUOXB4NWRyYVA4SWV6ZllNNm93RnQzbWZIam1VTHlU?=
 =?utf-8?B?STRlNlkzbks4a2pRQ3A4UWhaSDg3emZJRzg0bVVVdFFPbXFmVVhra1E5em1Y?=
 =?utf-8?B?YnZVOTM2TnBIOGRia2MyQkMwV2czYzBOcjZJT2t6dnZCdkFxdnIyRStNd1NK?=
 =?utf-8?Q?/vKY3uGKvlYyOOHOKW2zWlSuEZhccA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDVXNEpTY1BROXlPSXFPRVhCU3FIQXUwQnJxZG95UnZleG5FTEtqVUFxQjBv?=
 =?utf-8?B?bWJlam1TT09CM0lEV0NkWkN1WWxJK295V2pUdERBTzdRU1dJMzg5d01YbkpQ?=
 =?utf-8?B?eTVmWHJxTkozalNiNldTVVY4cEgvd2JsenYvTkpYRXJlSXNZUFlWWDZnWGNS?=
 =?utf-8?B?RTJZeE1tdWFpMmF6SVVROS9iL2lxWHhqbEVOaEdMWXh4eG5yUFhZditERzkr?=
 =?utf-8?B?cm5vWmRkaGkrRy9jeHFQU0k0dldHdmhXckdFR1M3ZEZLUzVuenE1dHloZmtL?=
 =?utf-8?B?ZTcwR1FDNUF5dEtOSEtjS1hiT3JUeWU3ZUtjTHEzZWlhRU1zUmFZSkZGenFr?=
 =?utf-8?B?ZVJ5bWdoMHc5TUR1Vi9haHpXUmRRb0FvcVQyWnl5NUpGd2FTZHoyZ294dWZh?=
 =?utf-8?B?Q3FtWmw5Sm0xb0JYZmN3dGxmZWlEa1J0enZhNTY2OWhOM0s3Z29WM1dkaGlN?=
 =?utf-8?B?K0YvM2tUMFNSQW9WZ2pmWU14enFxWkpuMXVtWHhIMm9haklzaXhCYyt4U0w0?=
 =?utf-8?B?K0tjM3UxaURGNUhYTDNzRE9nTXlGY0xwU3FadEtTR0cxdVVvbHJ4a2Y0RWRR?=
 =?utf-8?B?ekpqWk95djVNTXBZVVIyMm5GaVJkakozT0ZmNGVnWUdyRVRqZ1k2SnNGZFF2?=
 =?utf-8?B?dDdVYWl2dXBxNDBzUWhJKzNxWEJxYWJFMWg1eTVVL0dKYnk1cEpLT3d5T2RD?=
 =?utf-8?B?TVhUejZCQVZiVXNvdlRYVFdJSWMvNXlCNlJqOXZmVVUza0twS1RYbUFtVWti?=
 =?utf-8?B?YkRuKzRCYXVWbnZkUXZpRGVnWDFvemZkSnBKWFZRZmtUZ3dyZHJFZms5WlZY?=
 =?utf-8?B?UFc2YW5FaG43L0k2bVBQd0tEcDRpa2RSTzlPTU5kMG5MWDVaUFU0dlVSTHN4?=
 =?utf-8?B?R1RmTW1UaVBsK3R4dkZubXcxY3RoMVNyY1d3cmlGZWJDOU16bnRvYzVzaXll?=
 =?utf-8?B?UFk1VjFuaGh3ZHkzWEVQMFRia3FHdndEd3A5WG1QT1pvZW9Fb2Zhd1oyRjE3?=
 =?utf-8?B?SzBlMTBxbnJ3RzVDMlVlRTBTZUlwT1hxZVVyMURudTRkdk9UWHN4cFVPcGxU?=
 =?utf-8?B?bHk0UWl4NE1rWFJXODlkQm5EaFVsL1poNTJESGU5QzR1eGxxSEM0S2RZNDQ3?=
 =?utf-8?B?R0NkZFdWeWFCRFRwV3JBdXM4cng1dWdib3cvZm83cmpBZnNyeE5OYTUvWVdM?=
 =?utf-8?B?eDBYOHlhZTdONkZiSXJvVkVSd2ZCbDNuNzhMbE5oRFVORzRMOHc0SXhvWUIy?=
 =?utf-8?B?UnF4RlIwZXEvTWcrb2g0ZmEvN0ZqSUdsZ0d2Rnl3WU40QXVmOXVZaHRDVUxZ?=
 =?utf-8?B?TXh5WHc4SEh6Z2M5Yyt4UE1pZHhiNUVHdHE2alAxa2J6amdFRXNEd0x1SXJr?=
 =?utf-8?B?SzJVNWRUdVF2VTNhQmdYdmZFM2ZOZ1dGS2Z0dkNLSUtMNFVWajVMNVFWQnpV?=
 =?utf-8?B?V1gzTjJYRHE5UVlUTTFWUUYrYTdUN2p3akx0WFBIUmpJTk1XRW84aDJaRzdE?=
 =?utf-8?B?WWdnVFNxQ2tjYUtKNTluMlY1QXl1ekFEU3JFUEtXY0lNSUkxalJ6TFNmclh5?=
 =?utf-8?B?cmNsR1g3dGZvSzZma2dwNG5ISHZCaUVNa0sweTh6SzROWlZDK3ZsZS83OTEw?=
 =?utf-8?B?Y3NNNWIrNnJaN3pIaHpWdHFtRlUyWVgvRzBBUExWbFE1Mi9XTVpFcHkrT1RC?=
 =?utf-8?B?NEZ2aHRVZ2cvUnZPcVUyRkR2bFFTb0xXeUwzLy9saWtiMkVTSFVseUN6QW9G?=
 =?utf-8?B?MWRsM25xSlZuL1hWWFg4M0REUTVHZHltbXZjTjZRaVloREczbWxEdGhmY1NK?=
 =?utf-8?B?dG5Jeit5blNhelZjTllQeFVTOXcxQUNEYWNxZWgrT1ZGSk1ITDhGVEhpYitr?=
 =?utf-8?B?T2cxY1B5TW1LMnJXcXB6KzlyMThjTjJPZ3Z0UVQ1K0k4TWJmRVRJUEZjdkg5?=
 =?utf-8?B?Ykd1SzFmRHhQeVk0L04wc21JN3dKcjEzMTRldjFSU0RqeXNSNFIwR3ErSTQ1?=
 =?utf-8?B?SVVma0htYWFGc0M2RHE1S2FsUlZoRnRha09GdGdPckNuTnVCU3A4VEtKcHNB?=
 =?utf-8?B?Y2dzS3hGNnRmVjlXTFVqdC9MQXVMVUpiTXFKUUJab1dWc25UbEV5Y0lpQll1?=
 =?utf-8?Q?4hp0lNiN6NYMayAbo2zK3C/ED?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1d61e6-4b75-437a-19b7-08dd995a2858
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:46.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Howfv+0X/ygdAMcIheZgO1P1tZS9eKpSDmPa1vcTXCy2O0u2CN0Bobrv5G1/+VNmr1QWcBrmRklJXSGvSr5Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Add support for i.MX8QXP, which has a dedicated control and status register
(CSR) space. Enable obtaining the second register space and initializing
PHY and link settings accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v4 to v5
- add Laurent Pinchart review tag
- wrap some reg_map functions args
- add missed \n at error message

change from v3 to v4
- remove reset_delay
- sort register field defination
- fix error messag in dev_err_probe
- fix comments
- use true for 1
- regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
in imx8qxp_gpr_disable()
- use regmap_write to clean register at imx8qxp_gpr_enable()
- remove reduntant CSI2SS_PLM_CTRL_POLARITY
- rename register DATA_TYPE to DATA_TYPE_DISABLE_BF

change from v2 to v3
- use dedicate csr reg to control phy and link settings.

Change from v1 to v2
- change 8QM go 8QXP, 8QM will failback to 8QXP to keep consisense with
phy drivers
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 59ec7107b4508..6501843ae72db 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021 Purism SPC
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -88,6 +89,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
+	bool use_reg_csr;
 };
 
 /*
@@ -167,6 +169,95 @@ static const struct imx8mq_plat_data imx8mq_data = {
 	.enable = imx8mq_gpr_enable,
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8QXP
+ */
+
+#define CSI2SS_PL_CLK_INTERVAL_US		100
+#define CSI2SS_PL_CLK_TIMEOUT_US		100000
+
+#define CSI2SS_PLM_CTRL				0x0
+#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
+#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
+#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
+#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
+#define CSI2SS_PLM_CTRL_POLARITY_HIGH		BIT(12)
+#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
+
+#define CSI2SS_PHY_CTRL				0x4
+#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
+#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
+#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
+#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
+#define CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK	GENMASK(9, 4)
+#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
+#define CSI2SS_PHY_CTRL_PD			BIT(22)
+
+#define CSI2SS_DATA_TYPE_DISABLE_BF		0x38
+#define CSI2SS_DATA_TYPE_DISABLE_BF_MASK	GENMASK(23, 0)
+
+#define CSI2SS_CTRL_CLK_RESET			0x44
+#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
+
+static int imx8qxp_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	int ret;
+	u32 val;
+
+	/* Clear format */
+	regmap_clear_bits(state->phy_gpr, CSI2SS_DATA_TYPE_DISABLE_BF,
+			  CSI2SS_DATA_TYPE_DISABLE_BF_MASK);
+
+	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
+
+	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL,
+		     FIELD_PREP(CSI2SS_PHY_CTRL_RX_HS_SETTLE_MASK, hs_settle) |
+		     CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
+		     CSI2SS_PHY_CTRL_CONT_CLK_MODE | CSI2SS_PHY_CTRL_PD |
+		     CSI2SS_PHY_CTRL_RTERM_SEL | CSI2SS_PHY_CTRL_AUTO_PD_EN);
+
+	ret = regmap_read_poll_timeout(state->phy_gpr, CSI2SS_PLM_CTRL,
+				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
+				       CSI2SS_PL_CLK_INTERVAL_US,
+				       CSI2SS_PL_CLK_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(state->dev, "Timeout waiting for Pixel-Link clock\n");
+		return ret;
+	}
+
+	/* Enable Pixel link Master */
+	regmap_set_bits(state->phy_gpr, CSI2SS_PLM_CTRL,
+			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
+
+	/* PHY Enable */
+	regmap_clear_bits(state->phy_gpr, CSI2SS_PHY_CTRL,
+			  CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY_HIGH);
+
+	/* Release Reset */
+	regmap_set_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET, CSI2SS_CTRL_CLK_RESET_EN);
+
+	return ret;
+}
+
+static void imx8qxp_gpr_disable(struct csi_state *state)
+{
+	/* Disable Pixel Link */
+	regmap_write(state->phy_gpr, CSI2SS_PLM_CTRL, 0x0);
+
+	/* Disable PHY */
+	regmap_write(state->phy_gpr, CSI2SS_PHY_CTRL, 0x0);
+
+	regmap_clear_bits(state->phy_gpr, CSI2SS_CTRL_CLK_RESET,
+			  CSI2SS_CTRL_CLK_RESET_EN);
+};
+
+static const struct imx8mq_plat_data imx8qxp_data = {
+	.enable = imx8qxp_gpr_enable,
+	.disable = imx8qxp_gpr_disable,
+	.use_reg_csr = true,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -865,6 +956,25 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 		return PTR_ERR(state->rst);
 	}
 
+	if (state->pdata->use_reg_csr) {
+		const struct regmap_config regmap_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+		};
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
+		if (IS_ERR(base))
+			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
+
+		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
+		if (IS_ERR(state->phy_gpr))
+			return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+					     "Failed to init CSI MMIO regmap\n");
+		return 0;
+	}
+
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
 	if (ret) {
@@ -984,6 +1094,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
+	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


