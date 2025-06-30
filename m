Return-Path: <linux-media+bounces-36359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA55AEEA40
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E2AA3A4116
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8570E2EA175;
	Mon, 30 Jun 2025 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BaxNAqYa"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC382E9EAE;
	Mon, 30 Jun 2025 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322524; cv=fail; b=jL/KW4by91JEujBcPK2TebQyqkGwHSXnFUgOFTgf21CjAOm9NCI1RnR3DAR5QcPGOR2z8l02zxh2LI0SCv/xVNdbVi/aLjHdis08ow2HrmG5Ad5N4kidyOB46fEdKeseY1R8b3DcV4ZDU90ormlDvyULIHcTUx6uLbV5XCjWP9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322524; c=relaxed/simple;
	bh=8yYGKQZCIfPEuuzfEYYFQfwYrfJ3U0wW5TwZwwA4lFI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uejEXmDj9OCHIzPbdti+mRFLt4Ljy+8vakuapZXrrTdIZQxme7cLhoJbLvj4Bj7xmbLqo3UIj/6jizJM9Rz3ImJlvZKqsduqai2J/R5LyDBEOH64RSTO/KcGeIPZzXvMoKRmLoOAQx7k2mKFj1v+w9aF1Wk4hNnERi4vI8faO3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BaxNAqYa; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcZOmf4a/Eb9KgiMT42zij/72SXESZOyxn5rmuupL8UnjbT3NXcxN2I7aTbFAUM5/DoTtSR9YMGK9A0GJbymBlSN81U/7JAdSR22FKMjFn0U2d9MHrkYcIIMLyzi61HXIZLLpTUiPOW/bBneCz7pBjiRXkP+HKaVXKSg/9YUBYicTnK4AMPAVIpoTqp3luDGPOxEJZewybQVw/PS8xvwHYygr37QTtzVpBBCwAFkw4rLCS8jo/wdva1vLcbW7UadbwmGxJdlsarrWzfVM+QAu18a6W3MH1JDqoARXTTi1owsZfWiUhKzJHj9JoiDvXFtBL+g5/aqrA8dlA6ttxD/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f10Q7dk4VZwqftpRTHAXgG56nYo341pkr4iU0/z9CKY=;
 b=vrei5UZ9h2tOg7s8jo4rHudmSCtuHrcfbAPjshsvj2uYb3570BpA3BhwMpiOoKjBesiSFMh5WlRsiCzzCNcG30j+NgymSqPV506y91aa8SsQqaIhYnRAKjexLtST+CjkQLnNH3Mj4IE+1Gzs7UA21wYyX7uUxhknPY+jAOjTEPtCYJ3NSQz6QRQyDGqgT8VeH2JvFpA41zbNEFUoij3Op9Ean5W/RgOHXeJFGw4RqdsqxD2kiXVYDwDBQgvh7G7/ZvB+O3y50ZodS3ZKVB7DHgHoadBcRYpTnQfFT5TBUH3lheQQcjRUHAWo2DEMqUngHbZr14t7BuqTbSk+cFGjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f10Q7dk4VZwqftpRTHAXgG56nYo341pkr4iU0/z9CKY=;
 b=BaxNAqYaKFF+1HLgd8WX4IFXOAd70khhxA+yJO6KpFI/IwluZRvvMQXwdfULlpy4bnh7PyM1uRmBCSe/8bgg8muQhpm4xJTXV/Y6WMbSil3FoapMKZBSr8tsTtl4bapyO1QuGr4WkR3UGJ3diSHQBXX2CkTfyifnye6x95IEiicqd4L7CxfTZ+cG5cOEPY9EVE2HtVc2GgcDAoRTCrxyCHcrEZR/EKHh7+VgpuZ4eTyYZ7/CXr8le4gP5LfNOU+CTd4SX0gWpw4FxK2LPFFfWdRaENCSgI3uV5pc2pAt1U0iJDuNxRdBbTf8xf1mdzJEQehO1svWo1ehry1bKQ4AOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7078.eurprd04.prod.outlook.com (2603:10a6:20b:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 22:28:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 22:28:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 30 Jun 2025 18:28:21 -0400
Subject: [PATCH 5/5] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-imx8qxp_pcam-v1-5-eccd38d99201@nxp.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
In-Reply-To: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751322499; l=4134;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=8yYGKQZCIfPEuuzfEYYFQfwYrfJ3U0wW5TwZwwA4lFI=;
 b=gMWfFEu4rexSmChlk74efTZhX5OG5/iGB+D0XikLF+zBTT7OVASB5Sc4sN4dRicxfuPUG5Vjc
 bPt43fVG+ktCnINbpPhcrQJITNhKRxToTj1qCh8dzOMRXOF6XzCsTcU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM8P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: ee77160b-0147-4bc7-b942-08ddb8257669
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VGFMZStWS0ZTOWNndDhDNG95WkxvUEdwYW1uck1kenBjcERkRVJ3OCtIVmNm?=
 =?utf-8?B?enVjVUFLYUdJbW9uT2VJcHFEQjhGUFNFaUN6V0w3dDQ0K3MreEV2a1RuRzl0?=
 =?utf-8?B?cjNIa0tLa0dFc0c1S2hMbGIyWnRZZXdZVmw2Z1B1d1FCRlZiMHdJeVF4SzhH?=
 =?utf-8?B?N1IyN0pCZkQyNktpRjZxTi9wb1pzOVZ3SXhyY0E1b3ZiS2QvR2dVU2JxVkdT?=
 =?utf-8?B?enRWSVBlZkt1bXZyLytLZ3FuTkJKa2dVL0pYaGw5VzJ1SDNPYU8yUU9sdXN1?=
 =?utf-8?B?Z2VwMDZiVFVVelRjUkJzK3lWditDR0pSd0doblVNL2JKV3ZDL095Wmx4eGhS?=
 =?utf-8?B?Q0dRalExaHErb3RNYlFnZm9ZL05BKzlPSE05elN2MFQ5RlA3VERGT082eFA5?=
 =?utf-8?B?bkgwQjFLSmhhUElUZGEzZUxwNjVMRjRURG9wNDh0UDJjazlXdjJvNDVZelJF?=
 =?utf-8?B?NXdEV0wzZjVseHQrYVU3SHZmald6Q21oNVFvVUZkMEFXVzY4bGFKV3lFRnEv?=
 =?utf-8?B?bkNveEhSWGpsNFRja3lFSzlNTmZ5K1NlTWk5bzJnMlRtemZKYnE5RUxoMjBn?=
 =?utf-8?B?YnV3N2lqZlZZMmZ5bjU3L1BKQ2VXSUlqR3AzdDB3SThDWU5UNUExcGcvZG0y?=
 =?utf-8?B?TGtsSy9yOWZRejVuaHNkZjZ0VFF6Qml2WFJ3L1YvVEhoM1FldnZBMXhsaHpy?=
 =?utf-8?B?K3I4L1BKQXZxQkUwTnJRK2FnMmdJNlVJc0xSMlk5LzNab0t3d29VZVRSZy9B?=
 =?utf-8?B?L2N6YWNMZDVLVDlnYU1ZR0tJYVo5eHVQYklTSXVSSUpyVGpMUVJIZEF6eUdE?=
 =?utf-8?B?bTlVc2xvZXhlTUdTVHp6SEpBcEd3QUdwMUV2R1U2N0ZtWlpDOGZ1R1JRL3ZQ?=
 =?utf-8?B?UUN5TWNuY2FVajdBak5TMGRHMTlxUVlrT2tZQkVtbFcwekF4emJsUTEzUzJw?=
 =?utf-8?B?WUNTMnpxWlRHRDR3dWhYcGRUUFZTMFRjWTRQZnZmUTZXd2xJNTRUM1Zwbzdt?=
 =?utf-8?B?aVBHZ3dHY2htYmYvQU9zTkt1cXo3YWFINUhkY2xRd2hJRTd6RTZqQmwzOHg5?=
 =?utf-8?B?WEpzWUIvMVJmT0J3VHNBRTg0MmpJdHFNVWpTRGZBZDIxTnZMUE5XbXpxRHFG?=
 =?utf-8?B?WGt4VVkyUkxTcG9wZ1JDblFrWGNJblVxWGFZN3RUSUV0MmJlSU5TRzNzYmtB?=
 =?utf-8?B?VDNaT2RkbmN3VlZuNTdkMms2S0d5eCtvQk5qMW9vYlpCaWltSmhDaTFyMU9z?=
 =?utf-8?B?VC9Jek5yUU44aCs0ckNib0djbktzUkVQMlhDZThYRGVLbkoxWHU1akdrYXho?=
 =?utf-8?B?SExVZHpzMTlaY20yeTVXVW1td0ZETTVtZE9pOE44M3ArbEM0ZmtwQnRINGU3?=
 =?utf-8?B?aTZXWGY3Tjd3TGg1UWR3cGM2WEVUUVQzTHg4QXhXS3hYYm1TYUQ4M1JhdDFx?=
 =?utf-8?B?K1Rib2hiNC9qbUU1SmlkM1V6T2FWSEFYWDBXVE1qZFFVd1NURTRnTjVodTJu?=
 =?utf-8?B?c2JKcTVIcXVzUTNmT3pzTWVQaVJWdm9ZSVJyREdiMVR5K2JqcVlJVFRsbm9D?=
 =?utf-8?B?MEJzb2EyM3VYdDNJTC9hZ3B6azg1VzBnUnJjeUM0MHVGMitwd2JNa2pLcWR0?=
 =?utf-8?B?SjdaY3VlZVF5blk4QTJONUllNS9jYjdWb2txclhCSXFHVVQ5Nk1YTnFObWNH?=
 =?utf-8?B?MUtJOGlnY25iOXc1VkwwL0ZsR2M4QnBtRThsV09XQVQ4TEVRWTEyczBnYndo?=
 =?utf-8?B?Y01vcS9DRFZieFdZYnlEbVMrYTV2VFZWWHpaMmVOeFdKRWVrdjBnZFFjeDJh?=
 =?utf-8?B?Q2owUklJMndEVUQzaFd1OGpodkRnOTR5TWxYc0tpbkdMWjVwUmxxVEhYcDZY?=
 =?utf-8?B?bVVHanNhNnZMZFUxUHVsMFMyakY3V2lYVUgzY0dIUDFwTnFJQmJWQXd5SFV3?=
 =?utf-8?B?bGk3dnU2YzlXdTJhNWFHT3FkWWtQKzVSb2xhc0YyaHYwQjQ4L1dCbnh6UlFH?=
 =?utf-8?Q?ugTXUSj15fPT6FJOv530HdMlokGhXU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Nmd6K0Nza2VySlpzM2swOEo4OGxLWXdqemZlOENkS2NuTXJQM1hDTTNydzh2?=
 =?utf-8?B?cUNpVUZOZFd2K1RSM2drVWVWRDdFcklOVE9QUzZHdUlmU3U2STJOTEdHSFBt?=
 =?utf-8?B?SmozdzQyaWdISWd0T0Yzd00rbklkWi84SXNLaGdTc2E5Y1ROUFhCNGVFbGI2?=
 =?utf-8?B?U3dCVXhZVnMzVndnKzFaZ3hRUHc3c213cUJ0TE91ZlE5ZnoxOHM3dEtzVlZo?=
 =?utf-8?B?cVlvQXZDdzNJVGZWNmIxb2QrWmM0RFF6c0VlRU1EcXlvYUkxdEJtWm5OUjAz?=
 =?utf-8?B?NEdLam1MR09QVUhrUTVwRXR6SzdGTHM3Z1I4NXRHejY0YWZqejMwbEppTFJM?=
 =?utf-8?B?WWdzSnNHTVFkVHhGTktkbHBOVHlqeEkxZmxqYlZ0NEhsMFdTWHhxeGhGbVFO?=
 =?utf-8?B?d1RuNjl5eXVPbWZoQkRqUlBGaTVOOHM4R0l5QmFoRHJoQ082VGtUTVJlQ0ZW?=
 =?utf-8?B?ZFlkTTRYRHVlYzU4SEhIRFBsUlZaTWN5Q1cxOTE5WjdudCtRZi9KNjQyQ2Mw?=
 =?utf-8?B?VG94TDJzd2FnWGdUbUR3RFg4Yml0Y2lJajFobTZZT3hDRCtIM1grQXVxMHBj?=
 =?utf-8?B?N1ViaDl3b2pnU2dMUTFPOE50OXFXN2wzVUxZdFluM1hIN0l6WUMrT3U0SnJa?=
 =?utf-8?B?TnJSNmJaUVdhVnkvT0tJN210dWJvT29KcS8veEpCYnVMWDUyWDVXcno1Vyth?=
 =?utf-8?B?RnlXVThyMWNUMHdUaDZvSkFuL2VmNUZnNElFOCtwaGNBU2krTFVBTi9oWTdy?=
 =?utf-8?B?RVlGOGRZaUt0emJXajlqM3BWMnhZMnh1Q1crK253Sis2TkRxTnJ0S3NnUVo4?=
 =?utf-8?B?RnBuYVhyTEhReThRSi9BTGMvK2pmcG9nMTNpRDVyaWlwOEMvS0hVOSt2SlNH?=
 =?utf-8?B?NDJEc05CTTB0dGFna2NqaStzOGQzb2UyZmZhNjZPY3JlYzNWZ09oK3ZHSTVT?=
 =?utf-8?B?d3JvNld4b20zRHkyb09WelFyTGtteU5UVnpxbmhXZHhWY0l1UkEvMEJwMm9Y?=
 =?utf-8?B?bFo3S2JjL2JUeU92SzlLdzVrQjlITWtMSzl5QmpRcm9hKytacHdzaXN1RW9Z?=
 =?utf-8?B?M3VMeVI0NEIvQ1Z1ZGxLeVlkbGJjdEdRU2VtcnpMczlaa3NXc1dMSGZBYWRj?=
 =?utf-8?B?MEF3M3NEdTlvNDNJQkwxNU84L0sxWlZhazR2THRoUEtSNU54eTRMUnJMUXhp?=
 =?utf-8?B?YksvMWZYRFhEZVVDOGZYVjRrYjI3YWY2VmdHbURSWW1saUVDVXhEa1RFemRu?=
 =?utf-8?B?MEh2OFpkYnNhWFdqM0djOW1neHQ4TW90M0FrenFHV01EcHpnU3VZb2RWeGJp?=
 =?utf-8?B?MXJaelU5ZDA0SnJ3OEdEbTNjdXdlYzlVM0wzMWU4RWZRekZXQlYyRXQycXpD?=
 =?utf-8?B?U3lmMVBrM25tM28zK2RTbFZNNGt1c25teEtHNjFwZC95dzVBY3R6NHpYSDBj?=
 =?utf-8?B?SEtmcVRyYVk4eHZuREhzTmRXMjFzYXJrbkFkY0ladWRseU53amtSV253ZVJ2?=
 =?utf-8?B?a3RhaDZwREgwK3V4THB1Z3FnVlJHUm4rZ3FRcXVuMlVmdDdVYTV3c3FxWHdU?=
 =?utf-8?B?VlgyQUpKZmttcFB0VnpYQlZtVVFQSUN5Z1dIS29pU0hNTEJ5QTBHc2cyVkpP?=
 =?utf-8?B?ZzJwZlFGREVrRXRudzZPSUV1K1VuM3RqM0FIUGk0WDV4eUl1L3RoUnh4NC9Y?=
 =?utf-8?B?dzRIeHhwK2lack5DZERtTGFtYjAvTktjVHJ1a3NoRnhuVFNlcmpYVyt0eVlS?=
 =?utf-8?B?K05YUWdjaXh4VURnZEltMURMRnMyclZsS3p4SjFQNEhka3VSRGpnMDFjY0N4?=
 =?utf-8?B?UTRCV0RCNFNBTkhQeFY4YkxtQ1kzaGljVGsyRkoxbEwzWlRGbk9WOWtDN1lz?=
 =?utf-8?B?YVhNUmtOTVRMdkN2VWt2VXN4Y2pTL21VdHRweDZ5MFZaL3pmYzh1WjJOUkZW?=
 =?utf-8?B?REVXRzk2bGptVTMzS0RrRGRLOVNUWkRCSFd1WjdZa2Z5aDh6Y0IyZXdNZDR1?=
 =?utf-8?B?L3ViTU11Y0xEQkRZTXd5N2R3RWc1azlmcGhPY3UvRTZSRE9kM01WSlk2d241?=
 =?utf-8?B?QXVQMzlxYUNaRkJzOGpBVmFzWDlGTk5kQVhUbTVldWR3cHYxbjRsM0luOUhO?=
 =?utf-8?Q?IIas=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee77160b-0147-4bc7-b942-08ddb8257669
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:28:39.8629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mw5w2/zb8upJLrPtcOstKpi+1hbKHzDr2VG1eHy8ZEhvusXW3vKvMfzxN8uhw0UX9qFymzLJjPPsplxVEvarJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7078

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI and parallel mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 ++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 37 +++++++++++++++++++
 .../dts/freescale/imx8x-mek-ov5640-parallel.dtso   | 43 ++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 02ef35578dbc7..a9fb11ccd3dea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-parallel-dtbs := imx8qxp-mek.dtb imx8x-mek-ov5640-parallel.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-parallel.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index c95cb8acc360a..09eb85a9759e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -487,6 +487,23 @@ pca6416: gpio@20 {
 		#gpio-cells = <2>;
 	};
 
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_parallel_csi>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		clock-names = "xclk";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "disabled"; /* Overlay enable it */
+	};
+
 	cs42888: audio-codec@48 {
 		compatible = "cirrus,cs42888";
 		reg = <0x48>;
@@ -865,6 +882,26 @@ IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
 		>;
 	};
 
+	pinctrl_parallel_csi: parallelcsigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02				0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03				0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04				0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05				0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06				0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07				0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08				0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09				0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK				0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK				0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC				0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC				0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02				0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03			0xc0000041
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
diff --git a/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
new file mode 100644
index 0000000000000..927d6640662f3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8x-mek-ov5640-parallel.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&ov5640_pi {
+	status = "okay";
+
+	port {
+		ov5640_pi_ep: endpoint {
+			remote-endpoint = <&parallel_csi_in>;
+			data-lanes = <1 2>;
+			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+			bus-width = <8>;
+			vsync-active = <0>;
+			hsync-active = <1>;
+			pclk-sample = <1>;
+		};
+	};
+};
+
+&parallel_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_csi_in: endpoint {
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+
+	};
+};
+
+&isi {
+	status = "okay";
+};

-- 
2.34.1


