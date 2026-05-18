Return-Path: <linux-media+bounces-61873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAIFNsp2Cmo61wQAu9opvQ
	(envelope-from <linux-media+bounces-61873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 04:17:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D1564F89
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 04:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A8ED3002537
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 02:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4B42E3397;
	Mon, 18 May 2026 02:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ol3OS2qg"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030982D7DDD;
	Mon, 18 May 2026 02:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070634; cv=fail; b=Syl81jvq2DqNeuK60w/f46mp15wlLVpqyW8Gb/sIT2ZVjbP4ALYqR9458Qb1J3aqiJRp/AhR/fElrXhMA5SkeoMDTy2lXC7+EZmdeVIeKjfoXgH2zSgCosv8Om4tsrklIVEWASmu0INhMlaP5DcAd71HVsZwU8mDC4S4A8y7zFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070634; c=relaxed/simple;
	bh=VeT1Rx/xbY+fg+P/LIQzLC5Hy1Z3Z7+jECDVla/39SU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=peDAFHzCGHMkCMtmtTLCUE+LwB0C5sTEYa1S88xSQxum+m02ZjBujmrh1ouwO6IaBfvNvKd2ytoNeJV03uv6GIHd9Sc8GGqkWxbXspl3gWJxYyBNjMOof4VaziUAmL70xObvycO5y+fRfYa1QgDnKkcQXRk72vLVjNtwHIm+YYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ol3OS2qg; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEve6g9mXl9Tir9WanllJi5kxAbVtb1cQlzXnIf8/JxgqQ7oJ3Xovu8XLumarzOayp4cxpx306MpmkGmnQz+GqrhOYb6nqjrRhSDBx9ZUfzFw/RPci3563uWeZhg6WvkucM8fiZ1FnptRwy09Oi8QVDLklcyvTFV4DOXQRwfidL/KUc26qs2Eft78MlPyO4YUi+z9pqbPpHdtsRMEEDgPsCoBpIr49lYy4p4vHwR3c3dAZz0FusEFsDKEQha8PWvs3jMtYGz61gl9iqrIxmKd9S9cMyt2vz79CJyFIaohltLdkFpWSdZ6pWxyMl3ubOC/eDsLkcQlEWF7HReRSZW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWOj9E5MqQLkOX6Kpmk0kFKHvo8N0Pkjj+f9f1dLrwc=;
 b=mW2Kb6i3Ax3uwKFWRI5PZluHxvrV9PqIH0DzfnL1EObPSqCBbInj3BtNcO9Y1GL6ETQrdCShpq0BGH9f9GAkOSaVCW2iutkapKz1SGQt8AD3MBeAmoKWtUZMTZai0P9N4ZZ7AxC1cmx0Y/9X5/RtWrHAxmUOYhwt//RsBhVYXb5sCPJE/Euj28bfAAq7siP2KEVEa2oNvFhjUUpP/7UBZl7G35rgBG3yA8tWgXNJ/d5kEgl4blIMT++5gmaaExuLTXggMnK675CcKdlRMBSPtGn6EsKwWr/rwM/3ewC3t2HCMlEwc3Lse/IZDpAdnptXKWzu1NjNiSLbEg4KVLNpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWOj9E5MqQLkOX6Kpmk0kFKHvo8N0Pkjj+f9f1dLrwc=;
 b=ol3OS2qgNw5WqDvxKWbmh+1Sk/gzqyQvgUsj1xHpRu+Y8K3ZPdL8Tz+Ice71SKoTMB8EsMYSvgm42jAt6HXpeRHOyzVubA3aX7GERLS1v9Y1gvuNpoikM8UPje66BgsQIIFtZRCaSYpe9PFg2BfzmM5nbFAGEPtuH/jsdeE5UVYg05dQWL022OGkuVMKzPXv+zrK8QCeW2typglO2JvfCHAySGN4U67QORzjd7pJlV7bXcoQM2jPH9guu4S9z6zVedgu/8WWr7lRopGJMvkGj9RhBETBWf1Q5/70RB9w7+7JFnHJdDlxVhXiYyvH2Io5P3qy6cOy6ANEj9Wq9zRBAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 02:17:09 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 02:17:09 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v7 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Mon, 18 May 2026 10:19:45 +0800
Message-Id: <20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEF3CmoC/2XQQW6DMBCF4atEXpdoZgyDySr3qKoK7HHjRSCyE
 UoVcfeaVG2BLp+l77fsh0oSgyR1OjxUlCmkMPR51C8HZS9t/yFFcHkrAqoQqSpsCu9+iNd2HCU
 Wwo4ajeyssMrmFsWH+7P3+pb3JaRxiJ/P/ITL6XeJQO9KExZQSNcIYll3ZSPn/n472uGqls5EK
 4v13lK2TMim9QYIYWv12jZ7q7M1bMCxMzU0uLXlj2VAor0tl3s9e9s6tFq3W1ut7b/3Vtm6qjO
 gveG681vLfzb/+95ytoBARjSSUHceUjr++nmevwDpML1y2AEAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779070804; l=7850;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=VeT1Rx/xbY+fg+P/LIQzLC5Hy1Z3Z7+jECDVla/39SU=;
 b=2+fJtB2PhQKUfNqXDUYv+fhKM4Vonxsvz0chNEuu4NqsbCQ69bSwZhradcr++GxYNuAJsl6Lm
 JbQSD4s5wrXDyaTU3fMw3ku+5HEEJlKTu2/kKNRdPsgy0/pIRpBY4Ci
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2b1807-dba9-4885-00a6-08deb4839078
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|3023799003|11063799003|7136999003|38350700014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 zknbq90ZteWUu8b8lNOQvWzicomFy/oYEGNPdv5Zazt27tr74pD4IEfgV79n3GpU/RwQCz0N5fBW00lUrQT0X8WX3w6W9haD29kCScAt7Rr6leFw6eqqpJT91aAd+eQGgnKk7QUJJSCNDQT6A5/6b1tz/xxsMt9DspNvp0bAW7CbY2ML6mKQthipWxcmF+u/rlAHZWxqF+LST7U0hSCQcjM1ggob28H48bwaDhBBhzSX5+o3RhVhs96T8Lomb/dO8+V8TFTGLTXGR6r99FsONfacDwPQJHl7iaAHTeHEI4Z8zqvik2O1p3/Q6olSWC695oxa4HvezGzY1EWrvwQ9CAr6JhM6qgcjM+j/CNYwPFub2Zh2IqHTYVuzBACYgb6ipLhFLvz70sjyPOn1OJye9imvXroktUKGWuI3RqazBT8KRoRUIKOjkYijGdvHAa7sBfBr4pwTCADLq1OVFLIhvVHTQFExNEglpeHtobd8QEKgqp/1LO0GyHMEJrE/PFjKod51inNPZ1Inpz8xfwpvWMVbVFWnKM77DvS6YOp9DLKxkPFYPKYG0cNNETCXXeNFCOiZvDlGdSg2Jt03UzVbdxIdvtCjA2RmtwWtdTqRD90167IWWecKeWumn+PmDsQYImcdQOnb9rr1Odo/VNp27yuGn7A9MMrM34PeKvG610AudjmlPFSHLvVzRqkeu7pmzZIqmLnPxnhuv1+GOroZBdNE6l8WgBTmlPdvCumqEf3RNT4aH5c1xP6bNaPdPb0JEhheqteEErN4CS33GFMF0A==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(3023799003)(11063799003)(7136999003)(38350700014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MjBTWGxxZmdoc0pRNFRLeEFNRkEwNk5nM2xhUWdmSlNhWkxFeXNaWUFFZXdy?=
 =?utf-8?B?WkpIK1IyNWFZWXNXaXV5VmhBa1V0bVgvZS9CWitCb2JGSXZiQ0E3RGNObTg4?=
 =?utf-8?B?aWJ3SWtFaGlKUC8vVzRTWDNhZVRMT0UvdTN0WmdlQktCd3R4cm1WcEkzUW1N?=
 =?utf-8?B?bjdWVGlINEp0UnVLTTArSGhwYjJYMjVlejRFWWZ3RDd4UjV4djlXR0x6MFVG?=
 =?utf-8?B?WXJzNW9PSC9SUUhUbExFdDJWZW0rczlaSTJtOE9ZWDFVcERDV09CZkZuRGNW?=
 =?utf-8?B?eEJXNlpMZTJRbURNcUhmc2ZML3ZST1ZtSVNpcDN6eFZyRXZXTm11aG5pT1VH?=
 =?utf-8?B?WGdYWVNwL1RtQklDOHRoMzVzQTJZc3JFZVhEWFlpdTRaSXhpWE9MZkpKUm9z?=
 =?utf-8?B?UjYrTlBTQlFTZ0d2SmZhaWZoT29rUzAySE80dDUxZ1M5VnIyV05XYUhNcG1F?=
 =?utf-8?B?aVI5Qkx6amZGakVuVHJZQ3paRmtyUWtmMWdKaGgxNndUYWtOTTlhTE5BbFBv?=
 =?utf-8?B?NTlnUjVaeXBmVnNMeUl1WFNUMDI2MFZwVVVFMVlPdFhtQ0tWSVkxRWNKWDJx?=
 =?utf-8?B?VFlSMTJCUnUvMHAwZTRVcU5RZ1R1d2ZEbDViTitxY1FNUDV0ak5UbkxDSWRz?=
 =?utf-8?B?a1dmbldDU3RURitrN2w3MmRDbFRiM0dFVGx2ZTNrY0p2bEVSTVpWdWFzNU5u?=
 =?utf-8?B?TDZWWXE4cjhTTHJNTjhsR3l6cmJWTTV4QkpHN1VSdG9VUndER2VZZXlJemx1?=
 =?utf-8?B?NjE2YXBxZElpOS9BV1ZWT2lTMm0wcXhaUWVyNnB6c0p2MmFhUnlYNFBBREZD?=
 =?utf-8?B?WUo1RkV1UXpOUERoTzBTYVFYcytsdnU0eGkya2xtSmQ4eURpTVh2Sm1Pd2g1?=
 =?utf-8?B?S0ZRamkzOEJicWRGcVF2Mk9VQStLUjdOWkluTUZZNW1WVmxjNmFjb2o1OFY2?=
 =?utf-8?B?aEN3c1lkYmhiVEJDeXEycFRCcG9POHIwRkFYVkFCWDhhT2NUUVN2TEpSWjFD?=
 =?utf-8?B?dDNYRVdmYlBtaXNXUjVlOGhZV2hRZnJSTWh2YmtCTnd4ZEFkT1J1SlQ5Tzdo?=
 =?utf-8?B?WXBCU1luUjZFT3FaKzNMSHE3eW1kQXUwRmdwR1NmZ0xoKysxNEQ4eFdZcmtR?=
 =?utf-8?B?QjU2ZERGam5IR3BpUWxNK3NDKzNqR3ZUU2U0S0tYUUl6d0xNbUU1ZEF3ZVJ1?=
 =?utf-8?B?a0pOS20rZnEyZ1J6Ulh2bERqRDdibTV3Q1VYQ09UNkY4ZVc1ZWpEVEJsWlZM?=
 =?utf-8?B?ZDdNUzJ2N3lGRUdRd0d2ZkpXV0ovQ2kxeUpUTEpUazJwZWVOTDFnK1BRSzVj?=
 =?utf-8?B?SE9iblZkU3FFb1JiOXh6LzBtc0g0eFlHZ25PQmJZSWZIcTdGWXRkanRyMkdY?=
 =?utf-8?B?ODlxS3BncFpxRERKTUlOMEE3NDJka3dGVi9WY3ZFZTJ0ZVFydTV6Nms2TkFC?=
 =?utf-8?B?eGo5VUZYcUUzdmU1d3kzUW44MHM3NlVkRy9NMVJLODNGVlZwZ3dhKzVNR1Fj?=
 =?utf-8?B?QnNlcnQyVVBIZTN2VTh3M05pRTFtUDhnNUNxT2lTWTYxbi9KVGRyNHQyeG1Y?=
 =?utf-8?B?dG9ySU5RSnhmcnkvR2xXYlFCK2FjaWFaUzRLYlRROHlrZWpKUGZ1ZllwaE91?=
 =?utf-8?B?bEF5VHB0V2dZZjQvUnc3MVBqQXl0K2JBWHdIVmZ5WWhWTXd0Rko3UUZNVUM0?=
 =?utf-8?B?UFlqZDlkMlVsY1IxRU9rc0tIOGtyK3hEbWhTdmowQ2czUkVJckFKNFNMSERQ?=
 =?utf-8?B?VUNLUjVCdlZSdE9sRTVyaDJNRTZQQUpyK3dZOVpaSldhQmIyQTFMcTlDaEpQ?=
 =?utf-8?B?eWptUHBWeC9lblAwcmc2bWh6WCt5ZEt2aExBODgzZHFjNWxuNnFuU3ZLRTY1?=
 =?utf-8?B?L3Q0c1hlaWd6R2JVeVA3Q3VUNVpTTUNiTHNQVjdpZjZ0NWViUUhlLzB1bWpy?=
 =?utf-8?B?bmg0WVd1SHc1S3VSYmlSOXQrMDZuWldvbFZwUzRCOHlYRzVrTEtheXNsSlRO?=
 =?utf-8?B?QjFwdDZ6TTR4ajFzemVuWEFoc01JcUwrbTU3UXRtWFZEWTlZLzBHOTVtd2pV?=
 =?utf-8?B?clYyaVcvbHRyTmJzWE1tMHlleTA1ZlFIOXNVYUhvcnZsY291VmNWa3lnK1ln?=
 =?utf-8?B?ZTZpc0xCQ1o4aFBkV0hvSG9TTzk3SW0veWJrR3MrNzFQMFpjNjY3eXFNaEZ0?=
 =?utf-8?B?MUp0RGlFcDJIZUxlMDhwT2RwTUk5SXVJTzE4N0JISnJ1RmhsdkdxLzFUV0N5?=
 =?utf-8?B?MVEvSngvUmd2NFlQb3JKMVQvVnVlQTk5dThHclBPSFZVU25GWWEyd3lzSVRs?=
 =?utf-8?B?SUszdWZjeDVLblNCUkRXUW1hbkhwWmRLZUkwN0hhQTJ4cngyLzR6dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2b1807-dba9-4885-00a6-08deb4839078
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:17:09.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zTGSdDH0H1fi1+L8BQsCumqGX9CqH4p3mKFwkkjrRUJkp4fGWTfD4KwAmwBpDvdgoS8PdaCwx1zgrtJc7apzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
X-Rspamd-Queue-Id: 2C4D1564F89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61873-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Action: no action

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 7.1.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration
- Link to v6: https://lore.kernel.org/r/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com

Changes in v6:
- Rebase to latest media/next
- Update v4l2-compliace test
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
- Link to v5: https://lore.kernel.org/r/20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com

Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  87 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 776 +++++++++++++++++++++
 5 files changed, 886 insertions(+)
---
base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


