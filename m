Return-Path: <linux-media+bounces-39978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79640B27D1C
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5FBE7B31A8
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 09:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E482E7188;
	Fri, 15 Aug 2025 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fe9FKN0z"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB112E717C;
	Fri, 15 Aug 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755250167; cv=fail; b=PM3nN/vqfajeaqW+4md3Kjr7W8SSlh9F0u0rBj1T+EVjfHWdM2jTTuRsZRGp9GqRM8zjnh+5DVqMSE+vS0LP2MataCWQnkd2o/eR4PAms3Svd0lXoBcIVYT0434sDaOHF4Vvxfmir3aVip07GtdH2lz8Kji1KYwsqDvWjMcSfw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755250167; c=relaxed/simple;
	bh=IuCwN8e32M9DuXzhJnvz8uY6P/jS9e+e2vwTPA6liYI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=I/8zCnYlCxw0KdNtGpsGp8vogpiedA2yflcX3SqfMMiA8LZpF27FrDIEsDTcFr2tatyWF9ltlWvsDcXqc3jiO5UrztqOSrAB8NkD266SDUPTivW7XHLq9/VyHoLo76llyBwyn4BFSr6UFDo+SaYTJR3VXRfynsyYH1FfPe0Bt3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fe9FKN0z; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoRXvTV4ctU3N8JLfXpYqAG28ryFD0g46roAtsTVN/jeJqcc1Kyo8Oc2ruiuR7ICbHcVbMIVVbCClmOjYbcyGuAI2UWot3oBsqTkfsqeSTLcB6ufIPJLG74jE5X/iMWDef87RRnDq2H6R+Fip4TJtEmDx0GwYKmWY1v2eSjYsZspj6/GdH5iY4qLgVAcUOwut6o/QJSFKPNAWThiQ2NZoEyfQKZVehVxMamTkVuhWlu9PBnTOlDs1xN83dVecJFL2X0YsqEV7d3tjAqqTnAQTN6I46shnjAHvltlWL7s71ieOlPMI39hJWVidQaVgdguHQnbfrexPaKErJlpqd9NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+gltHrCX9pgbWt66YlkGvLFBy8hiS+aL7YARmGCS1k=;
 b=GJk8XYfuNICrOkxTVDJA7rx6t61L0iQdN3mWYEVorD2MLFDUscXZjS2KirrDvQRiPx+Rz2hO2EQoUwVjaR1KoTnvcOcu8Mr92xMddMjDbXQuz/WcYIQQhHylcr+1J0QShPaNcZAjoqI+xIFA/vmG78g1zqOrcHO42H7p+ZMBoMXOx6yNyD2CxlEoScGlXozrmO85GiQlcpzysySbKv9qUghL1j2W12fr9/6TZjvXd/HjpozVFyZZ1wIAaE0RcMkRK/kAWFkOBSBaWVRa3O4WYIbOFdipFjJa7N5uILRTIGOHz2APea/K4uKGFO1ADoBYkuJfg4oSNU4t+fDIrher/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+gltHrCX9pgbWt66YlkGvLFBy8hiS+aL7YARmGCS1k=;
 b=Fe9FKN0zu4Dcnf3RY7oeeMn9D0uSZlCbEnKF0QbEr9VDSCvv5CMD5ze8TYkAzcnu6jUNMeH0ON2RArpNnxrbdtHqWzyWtR6YVhNfJZE8Jxn70ibLWlKY9IQzn/4TeD64r4yQAACbXeJr2oNMLYnN3ycFZP+78gvEt+Qb8p2XM+7UR1Zfz5uyY+lghpJdFtC+kZU46akPOCazTEZR/xUyDnMim76OgMrBfoRHjfA/0uUc3ySRpWVqlr0X0yAhGfaZVUKVx3Qc07tlQNTMTm4no6UptLQMrn9BqVdaBHKBkFnhTVsQNeoLUQImgCQZo+d4Z06s1U52Pvl963W+FoLLyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9445.eurprd04.prod.outlook.com (2603:10a6:102:2b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 09:29:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.006; Fri, 15 Aug 2025
 09:29:21 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 15 Aug 2025 17:28:51 +0800
Subject: [PATCH v2] media: nxp: imx8-isi: Add suspend/resume support for
 ISI mem2mem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-isi_m2m-v2-1-32e3720880cc@nxp.com>
X-B4-Tracking: v=1; b=H4sIANL9nmgC/0XMQQ7CIBRF0a00fyyEDwKtI/dhjMGWFgZAA2Iam
 +5d4sThSe57OxSbvS1w6XbI9u2LT7GBnzoYnYmLJX5qBs64ZD1K0opH4IGI6YlKmUEPaoBWr9n
 Ofvs93e7Nc06BvFy25r/XqBk/Cyko9ohSK4JkqSn6Sj8u1WsqhcZtpWMKcBxfriqylZwAAAA=
X-Change-ID: 20250815-isi_m2m-3db166a97969
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755250153; l=4035;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=IuCwN8e32M9DuXzhJnvz8uY6P/jS9e+e2vwTPA6liYI=;
 b=ySGY9tyWpUaRbKRZyZ6P723Z5bJGQRrstdI95nmzbN1FibVRJ2vTCr91DANrWdMv9Lt7y1i/H
 hiqTivMCzX8DPxpapFV121Z0sOfqWvpDdPjBaN2ftDNQ8THyP98Wdfm
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 436ceef6-3cce-4d63-5bca-08dddbde373c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|19092799006|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Ujh2QitXQU5OQi9zZTk3N1MraGg3NXcxZm5FSG91MENYZ0FCalR5TG9obHd2?=
 =?utf-8?B?Z3U0QVBXRGZnUnEwTTJrWG5GbytWQkVCVk05UU1uK09MSytxYmZpMmdERTJq?=
 =?utf-8?B?b3hRaEtaM1FBMHNOT1lDNEh1UnA4VGxWUk9sZ2QvY3pHdEY5ZG1jaUYrMlIy?=
 =?utf-8?B?MFNFZWxBSG9ORldsdkhKSllHZjVRMFdnaVErbWVhRzluTlo1VU42VndybzJ5?=
 =?utf-8?B?UitwNjByYVdGWVo3QlV0Y3JKZTVabG5wRGNxM1lVdTEvWWZEWlVhcWROejBT?=
 =?utf-8?B?dnFxa1N3S2R1SDZTek1zeU1oRHhKditrZS9lS0VRMDR5czRxNkViMjNjOUpz?=
 =?utf-8?B?MUpCVnN0MG11ZnRHMWVqVTRGOFJoMlNuMzRhTWhFVytRaFlJT0xvTm1PNXdv?=
 =?utf-8?B?cUFyWFhpUEJIR2x0Y25WM3ZvSDlLSjFSQmd4WGpqa2V2WExndDFmb2I5RVdD?=
 =?utf-8?B?K0JQRzdtbUlZQWRaN0ttL09VKyttRHhtdEoya2RzMnJKYm9iczMxMUVBdi8w?=
 =?utf-8?B?Z1RZYndMZG9CM0VmSWFiWTQ4SVRxOU5pSlJYNVRyMldGZDloS0JMYUVJUzBj?=
 =?utf-8?B?RlZVeEZvV2RuQXIvcnVDTmRhQjFxVHRyK1J1SVp6c3pxWGlJd212VXdGWDVy?=
 =?utf-8?B?SjBRRlNsQitTRHFHS0VCQVJNcDVZY2Vkdk5OZWlZa0Y5dEhkbERrNlBsUWtu?=
 =?utf-8?B?M0xMVWhHZ0VkVUc4a20rMWlaU2F3YktWMnJjOFYzQ2tUZWs4Rk5UcG42eE9s?=
 =?utf-8?B?QTM0RkNKSXkvSTZsQUpiNzVXc2pKek5tU05oRU1ZRjBTYmpmVHVhdjdkTEtW?=
 =?utf-8?B?dS9XZTRoUi9xMHY4OHZrUC9ERlpmV1ZFeTlMbnhTdzBXQXEzbEY3ZFg5R0tL?=
 =?utf-8?B?STdUT2hhODF6SVlicTVVYWg4MFc3bnR4dmMxRHR5QStSR2lXRHRwbTFFb0hX?=
 =?utf-8?B?VnpMdDQzVHl5UEV6b2hicjRxVWxWWXRRSEp6RzMvVkp4dzVhT2xXYktzbUtK?=
 =?utf-8?B?RWxRRTZJaXdEaVdDem9QWWo2QnN1QWpSWFRicWd0TjUxbGFiZVdYSXk5N2hO?=
 =?utf-8?B?V1JxenA3OEVpaEVZUjN4RFhqWU1ES0JxY0V4Z2I3VE5WS1J4aGE2N3FyNHBz?=
 =?utf-8?B?TzkwR1lOQmZZMUtPc2UzZUFqUmZObFA0RW1wc3BZakViaFpVQ2hXM2lxRFhh?=
 =?utf-8?B?REVVU0hLd2NyVVBGOVJDRU9LL3NGZTlDbFN4aXZjWXluLzRjODF2cG1hN0RI?=
 =?utf-8?B?WFRDVXJxOUR2ZXpic3BmNmx4dTA2Vk5OQzBHV0hBM3NkZ1Rwd2RHZE1wTEwz?=
 =?utf-8?B?QmMzUUt5V29IUjNkcm11NnlreDdHU2IrWUNwWkdmMERUNGx5QmozUE5kZHJC?=
 =?utf-8?B?NllZc0p5L3NjWVUvazlRbXp4TVcrWjltbnFlbUZiV080dGJ3aDRuVXBmR1RQ?=
 =?utf-8?B?V3hYYlZ0OUVtTjZPaEdqNWZsR1ZVYnkzL3RGQlpYcVZMeU9laHl4Yi82MGhu?=
 =?utf-8?B?eGxpSS8rTnJqY1Z4OENzcWZLTmdiSVFQQ0JGOElncXpIWGNTRzQ1a3I4MlNJ?=
 =?utf-8?B?TXRDMW9YWUc4Z3Q4RFZMWnlYdHBhb0o1UUNHV0NWRnZxQjkxK2dPQjBOQ09j?=
 =?utf-8?B?M0J4REhZL3BFc09vUXJQcHNMY1V1QjFDVDUxa1d4MDB4ajFwYW5WQnpjYVFX?=
 =?utf-8?B?cjhmVWlNVVNzU2xycTR5Q2RjN0RDcXdld3Qvb2JHZ1dZWjhVOXJQL0t3WjAx?=
 =?utf-8?B?Z0xvQ0xXQ3dZcHF0eHN5cWhQenZDSWRna2xCN1ppYjhJUVZwR2tzYUh6WGkz?=
 =?utf-8?B?NG1WVWhOek9qdFI1bjVjK0RYdnNQR29rOTlMUktkdEdRbjV0ZGRKT2tRS2NB?=
 =?utf-8?B?MjZkVjMwMFpFUGhjbklvcVVYbWRDWGNVanJuZFBFUEJJOEZicmR3Q0gzcEVx?=
 =?utf-8?B?eEEwb2pLQUVWQzJyNjNzZUR4Qm5jM2l0MlU5aER5MDl6azljYzVVNm1OVE5V?=
 =?utf-8?Q?m8jGFqTxtz9r1YoNzZ03cuE5yE5aaA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dXcyZExwcEI4TURHK2FzVzFSek84RzA3dEhjZ3BYZmdZWDFCNlpaLy9wWFVU?=
 =?utf-8?B?NXRxNklSbGt1djhhVDFpeUtRK2VoM1A3aUIzTFp1VnRaejFWSnVaVEdqNU5v?=
 =?utf-8?B?d1l5MzFlU1pCN0lmczFuZ3JNbm90cnZXa2pGR0FPaGJFRXhaWktrVm4vakpi?=
 =?utf-8?B?T2lBRGRpR1BRVUI0YTA4NWRLRjlvYldTc3lnbGdoNEFCK0orakFxLzNmN1FF?=
 =?utf-8?B?bzJZa1gzcGNOem1HZWRIYUtrNXd0ekxpYUxSb2trdVZvSXNuVWpudmc4L1VS?=
 =?utf-8?B?TkNDSVJueCtuaWo2akpMTnZjTzNjV3I5ajJGWFd4dW42MGhwc0RuNFBEYXNt?=
 =?utf-8?B?azF1WUtDVFMxd2Q5MEo2RFN5cHo4bmU2c3l2Zk5GeFlJNzF3MUFBNVBnZVM0?=
 =?utf-8?B?NTN2ZHlGYS93eVRFYXh2dmNJUW1XKzhpWTl3VC91SEdEcklSdVhTNGQ5RGQz?=
 =?utf-8?B?bWpWRXdDUUYrS1JDbVJPVXNsSUZrVThKejFiRmV5VkJwaXF2RWF1dk9IVlFn?=
 =?utf-8?B?NUc3cVQ5S08vNkdXSnBSMVBQSU83Y3Q0T29NZFRrT3hobnZhNGZaQk1rRWJC?=
 =?utf-8?B?RVBRTzZ0L0JxUE1kNFRsRzFtSlZ6czBENklkSTVZaUNOVTJZWlgvK2pYeGNt?=
 =?utf-8?B?NG9UWjl6U0R1SkVqVjZHeXBPMjFqbkVZTGs2aEV2dGp1NW9rMm44TURVMndn?=
 =?utf-8?B?QzQvSWVRWllrRHBlLzAyeGFMeWdHejZ6ZDRNV3k3bmVLK3lmQ1hpUDV4dUdV?=
 =?utf-8?B?aU9DeXZ6N2tyWXlrWlVuVjhWR0JvZzduYkpDTm90ZU02b1BUQkxNOUZmSmlX?=
 =?utf-8?B?bnlMTytsV0xvajhEbVg0S2xtU25HQ2N3ZkJWTzZJZkJPU1pSM3p0RlF5Z3BF?=
 =?utf-8?B?VkRLTXcxbEpleFVrR016eG9Vbyt4bzN4amM0UFQ0VUxjSW1IWUZ0UnlMemxI?=
 =?utf-8?B?Y2hOVDM3ZnpDN1paSXZWS0MwZkZWdlRKYndsVG42NS9KNzdEQmtoK1g0QVBI?=
 =?utf-8?B?VTArZi9WaFJmSCtVa3JBbHJSWklxSm01TEZINXVmMUU3RHJXZ3MvUVdTc2sr?=
 =?utf-8?B?QWJpRVRETzNqL1ZZaWJqV3RqRjM3NnFtTmJLRnY0WUNLQ3JRalNac0QyVmdq?=
 =?utf-8?B?eERYRUU1K3dTTTQ2ZVI2TkZndE1KT0pwRWMyUlRvYlYvVDIrd0tCM1FkV1Jn?=
 =?utf-8?B?Nk5MdFNpaTVpYUVKZEtqNVZUTjBjY3dNUVZpd0MrR0U1Wi9Db0dBbkN5R252?=
 =?utf-8?B?QWM2Wmt4SHpiMitKUjczdHJ4T3VZRFdKYmdLcjVIZmRhaWZEQjUzMnpkOFlo?=
 =?utf-8?B?Wll5NGJ5ZWxjWUgrSm4vM1ZONFo2eElhZzVSaE9pLzAzc2drSDdadUtrTXRa?=
 =?utf-8?B?THE1a0k4SlFMNFZIUVVQM255UURsUy9sNmdTTTM3MnpSNDJ3QkRpSTNsaHZH?=
 =?utf-8?B?WlZNTUJYUTBxRVppUmJBVW13UW9tK0NaRnNvYkU2bGlMeExpYS9vWXpVWGxp?=
 =?utf-8?B?SURzOEJXZmdHVzhZZ3g0TVRXZC82ZjNId3EveUd6VzZYaENHNG4xbXo5KzJ0?=
 =?utf-8?B?WjdVTUo5WGdhWmsrUlA3YjVRSFZpZjIwL0ZPR25tNmNZb2g1b2ppOHJJSzZh?=
 =?utf-8?B?ZkxJYmhJa29xTHMxeWl5V3VSWHJrYURadlV3WGE0a2NBRUtubjRVWHVNbVEr?=
 =?utf-8?B?aitkVDVBZ0wzVi9EMDZDeXpPNmh4L2Y4UUd4cjVUVmJqMVBOSnQ0Mk82bWM3?=
 =?utf-8?B?dCtBWTB5Rm1MWDU0L2NSejNyZjAvVzJJVURsNXBwWVBuMVYxUndqdnhhaFNh?=
 =?utf-8?B?ZDYzelpmNW1Fa3pSNHVaTW9HTWV4WUtYRlcySG5nR3V0N01NZWNKNU1NVW1V?=
 =?utf-8?B?NjhaT2tzY3dYbzAxR0hlVVg4OENTcCtobWRYQVpmODN5WGxGVmQrUXpiR3cw?=
 =?utf-8?B?RXluMWsrZUQ2OFZLZEwwbkZ6VkF4SDNTM0NWNzdPZTlCdFlhSE1WWDNTSlRG?=
 =?utf-8?B?VEhrZzF1UDhlWWJxSXdROVpYSlF4c1ZMRzY4QXdDQzNhSEJjNHYxaW02VGo5?=
 =?utf-8?B?ME5Ec3puMVp4UFJ1RmJaNkFLMExKMUdkbTlBWG9Sc1U5ZktlTjB6MkRzcTB4?=
 =?utf-8?Q?3x50NFKv0I1/vJtxuUlt+cmKp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436ceef6-3cce-4d63-5bca-08dddbde373c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:29:21.3959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Qps2U/o1uI5jVK7X+XyXJoGgtQD3qs3BKQ43LQlCH6hIW9ZN0ZWLs1QzEu2fD19wiCm/EMW8xpai35aZlU6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9445

Add suspend/resume support for ISI when work at memory to memory mode.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
  - Move mxc_isi_m2m_suspend()/resume() out of loop.
  - Replace ctx->chained with m2m->chained_count.
  - Link to v1: https://lore.kernel.org/all/20250717024353.1811576-1-guoniu.zhou@oss.nxp.com/
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  9 ++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    | 11 +++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 34 ++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 981648a0311374597a033a7ecbf39f7b0b252cb0..408e9cb61554d05ac92562c322d6a728080bb9e5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -374,6 +374,8 @@ static int mxc_isi_pm_suspend(struct device *dev)
 		mxc_isi_video_suspend(pipe);
 	}
 
+	mxc_isi_m2m_suspend(&isi->m2m);
+
 	return pm_runtime_force_suspend(dev);
 }
 
@@ -403,6 +405,13 @@ static int mxc_isi_pm_resume(struct device *dev)
 		}
 	}
 
+	ret = mxc_isi_m2m_resume(&isi->m2m);
+	if (ret) {
+		dev_err(dev, "Failed to resume ISI%u (%d) for m2m\n", i,
+			ret);
+		err = ret;
+	}
+
 	return err;
 }
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 206995bedca4a4c5d7873f3bc872fbae18b3cb75..6493eef907010934217d9f14a0d6d56acdc59ee0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -343,6 +343,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
 int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
 int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
+void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m);
+int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m);
 #else
 static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
 				       struct v4l2_device *v4l2_dev)
@@ -353,6 +355,15 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
 {
 	return 0;
 }
+
+static inline void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
+{
+}
+
+static inline int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m)
+{
+	return 0;
+}
 #endif
 
 int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..26361fe2ca858098d907d4a0719b0fdacc6becd2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -732,6 +732,40 @@ static const struct v4l2_file_operations mxc_isi_m2m_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
+/* -----------------------------------------------------------------------------
+ * Suspend & resume
+ */
+
+void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
+{
+	if (m2m->usage_count == 0)
+		return;
+
+	v4l2_m2m_suspend(m2m->m2m_dev);
+
+	if (m2m->chained_count > 0)
+		mxc_isi_channel_unchain(m2m->pipe);
+
+	mxc_isi_channel_disable(m2m->pipe);
+	mxc_isi_channel_put(m2m->pipe);
+}
+
+int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m)
+{
+	if (m2m->usage_count == 0)
+		return 0;
+
+	mxc_isi_channel_get(m2m->pipe);
+
+	if (m2m->chained_count > 0)
+		mxc_isi_channel_chain(m2m->pipe, false);
+
+	m2m->last_ctx = NULL;
+	v4l2_m2m_resume(m2m->m2m_dev);
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Registration
  */

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-isi_m2m-3db166a97969

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


