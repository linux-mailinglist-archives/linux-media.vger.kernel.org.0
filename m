Return-Path: <linux-media+bounces-40999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65027B33C45
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33210173E11
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9912DF715;
	Mon, 25 Aug 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hykch/K+"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8712C2DBF69;
	Mon, 25 Aug 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116660; cv=fail; b=Wllwb9YUIbcOOThnq6A1+iI+m0tVMLLNK7TlYdMriqpRTTteV/1yyLOIwsoVnptxtV04iIJcvAZKWgM21HrHI1ZG08GVXSmN7lt179LKJJOyzeMJcUa13f7CfhCnHBzEKByzipM3X0MOpYfxJ9yS42ZxKREd/pOGCzHZlgYRGME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116660; c=relaxed/simple;
	bh=KPZroa8mPbLzd7xdoDW6vBPNQ2XU+HsknrVWdyaaKb0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QBls6cdzXTqSXIXYpXKDaVXkDKN1BqpQYUHCZD9onWd0A26Rb/zYiNJspY1nJMYY9T5S9lY71BJTV7g0Z6Q/wj9AnI/r7QAZ3y9D8uR0KvPTpxg6edZtPA8jHQxtqNUPA7Wval+yQ3JSCHmy1Y4gL1Klf4NOFQYC7CPYW0+KjAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hykch/K+; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3GUNbyJvpe8QDXxcEyk4AD/yhAf/6A9+gdMwW6oXmZg4jfwkd8/1aRHwXnRlvfz3XvrdQ5ky+ZXJ93UwjTVZxUfFQDg75rBdkf3RrmqrF1Lo+YMgi0diDQlreBeJ7J7UUbC65/qdq/G9EDRC9+GuKntcJd0BzNmTx3aFk3rlUctR0mY0qi+z/MYrTtC0LqawCyt9prVzR3Dmrm5+0CYSWyN7U1mfl9bZ9q8XcvDlJCcT1sEdavMrDpgjbUwCLM+klDowP3cgoT6xlQJOUGrFTSse6CBCwTMGt+/tdydXrnSr3P7+qH0Ir8hYApIkWoi1kIR7AB8ve/mpj9kphBWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1aKYt3jxcgrtV3hTQV7I5rW4j4ImWPcmEemjIo/zDI=;
 b=JSoQgB3pmqwoqtmTA2pGORExDjC2dlRlMa/CEtdy/qN/EW35uM+8ZK17r2q9zhZMHtE13e1xZjPp60CUFZRqa81UpjDO6oAw9B6a4NJgokgQ5O5kzwFqRdaqSdqlCKJx1CZ8Oi4KDWgpDVOPaM/XtdsCX/S27z8w+m1mfE0YzhPMIppQpVvoZplGb6s4n+uhLyFnroWJjpuXht319e4mmEjJoI6LDjleR+lYxeI11sUIFOh/n0+ivO5xdKkvn+FDpVez8x8HY0dLMihcjn22g16nbrjBIgSQEEvir2yejsgLSl5EljeDwGvKYpQ3IePkI8L1iJmGoTfI6rfi/2O3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1aKYt3jxcgrtV3hTQV7I5rW4j4ImWPcmEemjIo/zDI=;
 b=Hykch/K+yBkQ8qFCk/wa9BccD1lDFtpO0auQWpxO/4Nc2RBF2NvF4JxVAkXT9dbCfDpMFiAoBXKoH1604h4uIU/5lPIpiW0BPi813xWim7zadqMWb4VgqYgA/kOTbIto+zUIVp9V1j473mRloLy593mH8vcb+C0eAtYz6j5Z3XqMm9nW8eLjVNJdic/80CNWUOrA71ysdQdiA1aZ7enWJK2CFopBEwwUp71rbpkjKw3cs/xHTrSIw7UhErCrZ0hUoQq3alwJOC8BynudpWyQ9P/SZIF4M56hbs41aK4a0KVDV7v6M6lUkdnAyRtNBq8Xm6ou/OgVu8Gssi+yVzx6lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 10:10:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 10:10:55 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 25 Aug 2025 18:10:13 +0800
Subject: [PATCH v3 4/4] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-csi2_imx8ulp-v3-4-35885aba62bc@nxp.com>
References: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
In-Reply-To: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756116629; l=3032;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=KPZroa8mPbLzd7xdoDW6vBPNQ2XU+HsknrVWdyaaKb0=;
 b=ra3imm+DhCwFaZj85ZmYgsRzoJPgDkBPCAK8/v6GOeZ7FEbqwE6rCqVSlGiIR96QX6gEzipN4
 82H69m5z/xlCCboZOEhLXWuacSdUKD7bymeVlyQEJ83tl6eWA3OS4Oc
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d84176-8fdf-4e2e-5e1d-08dde3bfad9a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dGtGYTBNRldXcll3RXBDMTNQVTBkV2RqbU9pSTdyN2VSNlAraTJBb3dsS2JF?=
 =?utf-8?B?cmtsaFA4TGZySFo1RlVLS1RHZU9zVmw4aUtITm53UXp4alM0VytQUUNUdTAy?=
 =?utf-8?B?WmZuQzNUMXpoWkh5ZE5PblNzN0hxbHVWQUVZdWM0SXlYNnpwajlEck1zNzZo?=
 =?utf-8?B?STE5YVZOeDZyWC84RWR3TDJPNGFSeWlTa1BIbUZCeEhUU3c3Ty9wU1ZNZ2xk?=
 =?utf-8?B?TkpTaGVHT0ZzTTVvNlEzY2JXQ0hXV25sT3cvcXp0dXJaMGRjWjNSQVBTU29Q?=
 =?utf-8?B?ZFhuRWNSRG0yYTVlNi9hdTJBOStBZUdKU2tSVGUycFkzYnZKT3hDWStGWVRV?=
 =?utf-8?B?eXFGVytZVzgyUDljbkM4L05JZFA1VGhVQ3RlVEFMZHd6ZSs0cDR2RmtBeFFk?=
 =?utf-8?B?S0tHWm80cFU2OURET3lnaDRxWFNnRHNoWGpwUS9CSDNDMlllZVZkdnNhUlBS?=
 =?utf-8?B?a0pxZXM3TDRFN0hQbjZCU2cweVpaK2pkVVo3L3RueFdVeWtNei9hZVJTK3ls?=
 =?utf-8?B?TG9GeW44ZGl0VGJFWHd6QWNGWU9RV04yQm1NOUhacmdZUmNjaTd2SVh2Tm9I?=
 =?utf-8?B?ZTArNGU1SXlQUDZiRDJtWTdnUE85bllMWDBTZG92TXlEenAycXE3eXJoMXhh?=
 =?utf-8?B?c3pMSXpzdVpJZURyaDFmUkJLcm45VE5Ob0pYcWtGbHYrTFIydmFVL1Zma1Nj?=
 =?utf-8?B?RjgzRk5OSmdPYlFNV2EybVp6c0RkSGhwaGVEamlFSjBGazlGSldyVlovSElZ?=
 =?utf-8?B?SlBZbmg1VHh4WkwzeURCdHdSRHRtbFhOWStkY2xheXVqdkgwS2VIOGgreXo3?=
 =?utf-8?B?dFh6V1ZGNHFGVkdUeEpjVmY2emxKekpCS25NZ2dvZFg5RUZBU21wWVVKNXdP?=
 =?utf-8?B?Y3dsa0l1V1JFZHQ1aDZCSDVLY2U5YkludWlyaUo2dWFyUlUwQTA5azQ1V09Z?=
 =?utf-8?B?OGtTL3IrV2Z2SWJlVmtiamFYU2NhbGVNS1N3Wmc4V085MS96VW9HcmZtTXlK?=
 =?utf-8?B?Ynp6WWQ1TnlvTDdQVXcrbFczMDNiSlR1cTZlQU84MXAza1VGcTFaTjVvK3pW?=
 =?utf-8?B?NGNORlVhRXlYSmhaTXRYZHYzQTQ1RmkxMHVJWW53UXJjSmNnZklpKzJ4K1lR?=
 =?utf-8?B?YTI5Y2hIRVdwK2pibldGNnlFTFcxRW5YTGNlRDVGSnNGWCtlZDFuaUNYYklB?=
 =?utf-8?B?QXRlQkRQOVRNTTlydlQvb2loY1pTakR2aFB1emVld2pWa2ZWaGV4UG13Yjlz?=
 =?utf-8?B?bEJEdjZlMW9rbHpLYVRuVW1nYTJLZnk1d3JrTkd2TzNrOEhoYXU1Q1FwZ3l3?=
 =?utf-8?B?QStTbG13K2dGQmFHK3lkc3REenUyaXp5K29pb2w3Y25iVTFZK1FweGJSVnJG?=
 =?utf-8?B?czFHeG1tS3BYWTZvRzNMc1JCYlliMThmeGhwcGN2ZjNhZG1DQmkvWUlVNW5M?=
 =?utf-8?B?dGN3UUo5eUFMSkFScS9ZRnR3ekVaMlROeUU0dFJpdTRma0pCR2NJNklIME5r?=
 =?utf-8?B?RWIvUnh4Q1NxWlZJbmJTTEZpa0FHYTcwMW9XakVGQTFNT0NFenh4QmdmT1Zy?=
 =?utf-8?B?cFNSSFZPRDFSZisrWDBRMjlNamZZWlBrREM5eE1XbElCZHJ1QmtRSWh6cVQ3?=
 =?utf-8?B?Um42ell6UGwzNFBnWkNQN0lPYkduMVNWL0lkRk9ZWXp5VDIzZ2FJbjBpN3Ru?=
 =?utf-8?B?TWNlTjA5cEZvdC8ybzZzUzUxZzl1SmkzaFBrcjdPbW9ZcHpob3UwMlRsZDRv?=
 =?utf-8?B?enNmVVp6WVcxRERoR29uakFlWkdjeXdLQS9NaUFCelRqT2p6aU95VHR6T2tz?=
 =?utf-8?B?cGhRZTZ3aVFaUVc2dmt2WWtleVpqKzBKeUMxSXdKeG4vSjZDbzlqSnVaVFE3?=
 =?utf-8?B?OG5hWUwxektxWk12RzVLaGlveXIrdTF0UkpBWmVtL3lVVUMzSmI4WVExL3cv?=
 =?utf-8?B?ZlBFTi9IUlRZeDdROG43SEdtK3dMRWNwdEtuWkQ4ZS9UWi9mNzdNUXpwRTRK?=
 =?utf-8?Q?y4yq8pBvSahTuIbwN90TOUJuG9flS4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SGVxRFo0MXU2U0RnVTdpanBRYVZjQWFLNmR4V1FqSk8vR2F2R1I2aThaTkpE?=
 =?utf-8?B?TEdXeWFvTkxtRUd0S1BkbGZZTnMyK3lKS0MzQ1A0a2MxTUxiUDVHZUVlQmFE?=
 =?utf-8?B?cm9PQlBXWU9aaWd2bU5oVnVSc2hpWUFVcVlURUdIR2FaRkgxNnAxamdMMUZs?=
 =?utf-8?B?SDVxbEd2UlZpNUtOSTVWNlZuZ1R3MDMyKzBJNGFiRWdhZHBma0Rqd3M2TzU2?=
 =?utf-8?B?SmE3b2hDb2FiSWNidk10UVAzcjlBbE1MRUpsa0x3bGZJQlpGTmhPSnBiQjNS?=
 =?utf-8?B?OHFOb3R0TzlYMG9MeHRLSHFrQjBDekljTHpkaXdpWm5Hb2FJRElrRTJEVDNB?=
 =?utf-8?B?aUlWQnhrZCt1c2VncytxRGNzNkFJSHRrL0NrTVVjQ09SSU9kV3pJVmdLaXMv?=
 =?utf-8?B?UWdCRmh4QnVScVBjd2ovSTk3RmxzOUJOb080U2hzSlBEY3BPaEt0b0lTMFNu?=
 =?utf-8?B?dHg0ODREZDN1aExhd3NrWTJFa2hRTTM3T2EvbHliWmJkZUM2M25DWU5DUWJp?=
 =?utf-8?B?VklIcWgxbTl3NkV2am05bll4WTVFUFlmQU5qNVk0UklrZjQxenRUNGRQWXZs?=
 =?utf-8?B?NnFQU0dBWVk2TTBBUzdJcUVkSVA1bExiQzROUXd5Znh2OXhNTlc3a3FyOUFH?=
 =?utf-8?B?TzBkY0tLYUxNOEJEQTlwM29BZVU2U0xWaTFlZGNYOVYzTCtiUmhUT1hlUTF1?=
 =?utf-8?B?N1hQb2hUUHo3M2RPTE1HbmRyTDFldzd6aUgrTm1rSm92MmVpQ29WaVcyUG1p?=
 =?utf-8?B?YmVOZWI3em83N3RzYmk0RXlkK1M1TWNyVkQwdHZ6MlZqdzNONENzMmJOTHV4?=
 =?utf-8?B?Q1NxK2ZoYVIvblk1MEJpdSsxUklZallNb1p6YlpmQWc1U1FTWTMzWU5MVHRB?=
 =?utf-8?B?Vm5sdHhLblNBNVBBdGNsOFhaUVN4QzNOYjh5aUZlVFlCOWVKcnFQdEZPZmtO?=
 =?utf-8?B?cnlLVTZUSlIxUlduMDVWNzhPL0lrRFY4RTNDVi9Ca0UzdndXSi9nbytVNjRF?=
 =?utf-8?B?TTFUbTI0YjNGMXhMcnNCeVN6Sk9IN0tsTVlYbWtGRUxOSnFkMWRKbElpbkh2?=
 =?utf-8?B?RUhCaDFIL3UrZDhjanpmM2NZZTB3RzNjc01xN0xVNXhiTlZjSlpqalRZOWlL?=
 =?utf-8?B?Q0lUODlpbHoxZC9EWGxMbVdCTzM3dnBkZFY5VjVGdjN1QkgyRC9iWTRzODcw?=
 =?utf-8?B?OXpCTy9TcVI5MzlLQTRBMFJQbnIyWTBXNmxlN0xWcm1wNEVHLzBXSGhCRHI5?=
 =?utf-8?B?L0pFRDFaY1NrdHdzOU9QWkFDUzAwSnNxTXpDRGNOL25zUmZlK2dDWm9obXdK?=
 =?utf-8?B?aUFaQUttNEs5VHk5WlhMOHNXQlhmdzBjNHR3a0ppSk5FbDlkTHBBckhIRkYr?=
 =?utf-8?B?cVlxaXpyOStJRW9SS1Fia0ZKUzRUT0Q1bGw4dU9UVHNpdjhhL2hYZEQ3RWJQ?=
 =?utf-8?B?ZDVLZ2tjQ2pyRFpVMHgvMUhxRUpSRTArMjBpNEE3TWZvbVBldkJNYlFXYUdx?=
 =?utf-8?B?MlYweXJqR3dSVHErRDQ3L2k1aDltNHNCbU5WZ1hYZm5oVXp3NWNtVUd4dFFt?=
 =?utf-8?B?Vk44R3hsclFBQjFtMVZuTDQ4dG9mdWF4OTJrY3FrSkYrcjBRTUhKRlpnbC9x?=
 =?utf-8?B?Ylo3WmwvYUIzc2lra2FKamtMZHlNaWNjQkZQN1Y1dU0vdHkwbGxkSno2U3R3?=
 =?utf-8?B?WXdrYVVnUDBOQVFWT3RVamU0VGR4WXkvUXc5Z2hTUXFOSDduYzJGdzVSRHlV?=
 =?utf-8?B?anNTTzd3ZGhLNndZV3pPV21QYXAybXdiN3A1Y1ZkYTdDc2JGR3dLOHJPdlZT?=
 =?utf-8?B?WWt1VFEyWTFaV1NaVFgrdFV2a0EvYkJjUDNJZDRyeDI3V2Q4bjYyNEVENUtW?=
 =?utf-8?B?a28yRWFYUzhOdktWZnpZUUJKbkpFR2Q2REFuRXFhaEg1VUg2bFAvb01YSzYw?=
 =?utf-8?B?WXFhVmFDV1ZXMEZQZEFJMGwyZThVOVZ4Z1JXRXNSOGxFVjZWeXp1SGZLMWhU?=
 =?utf-8?B?RnVMb0FPWkpzYU1GNjFLSWRyblpFQllZcmprbXlPdDBtMHlqYnV1d0crSHRF?=
 =?utf-8?B?VGZPblE0clVDVnNWTmp3RGRwL0RIQnQwSitSdDNCUmZHNDFwNk1xeW5KaS84?=
 =?utf-8?Q?Pyi3E93Sc1KhFVHf1ptc9Xw+g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d84176-8fdf-4e2e-5e1d-08dde3bfad9a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:10:54.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9vM6EBQfnnXTLN4kAPDl9/VwKNQ1ihlB+gUak/t6a8pT4BPxPK+TVoKTeEKxV7uzwsWz3FzCTpe9Tc2AuT48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..fa7f75bec107fcb451a25da3f6e78c70bce7064c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "csr";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


