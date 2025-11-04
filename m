Return-Path: <linux-media+bounces-46238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B0C2F26F
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 04:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8677F3BA63D
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 03:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160F82749C9;
	Tue,  4 Nov 2025 03:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A3WBEfAx"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0126FDB3;
	Tue,  4 Nov 2025 03:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226516; cv=fail; b=hSiZdByS1U+KOy44KVjGqY78ASIEYH7VBPd4HZMzZHGe4HQvRUZnnTQCXHS/Ke0ktObhsswiK9AEXjPr3HX5ouE3jXEgvST2PqG2xyoPcCHnzjSoKs8z/wiyL0bORyu/LyKIm/ZOTZaYeLU5D+UNGTs2cM0qANFUcyinXkNin/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226516; c=relaxed/simple;
	bh=YqgQGGQ3WFhyrOrhM4MoAM75fyTvcH7JjT1DmQs4voM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M9zcxLgJPo3WoWyjnJw6QxA70yP1uo4NnHBZIqP9Lrv5q7VAKhr6U4ybPWJSdqbIJ7eB6x1JUlLqVYL5brAeKZxltPAumwmFBX09vX9gyfqPeP8WGi29NCui0KlARAmYHD8SFxW9GYZCZW6PxK+E2HgS0fwW6uUIkyJG/4eJu28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A3WBEfAx; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dazexk9xj3+t3oOszFtJsYn/eAsfweT4qWeSE9w5zNRMylZkyO1NVXaa1ggxy91CHi15HtYEb22RNkgQzIbf6lQWD/kRUY45cYhrgWogqLcXotJcn5zdaD+t3nmZbyv1SlUp/XRt2D63lnaJHtTX/3oNjpCelm3nFvtvtxixo7LrhpwvtJp7hlaBvCfeKO4IVKE9+oF5qNRgZPWh3HG1XYTIVTnQx0IFZ12zgMzx8JDUWAvSTBZhkesefbWSfYtavM4tN+i94IRny+0lAmyuap7lNUHbLJW/O/dapoPnqqYSDG4QKXbVW8V5LktD4x7tlpgBLfVyePhPVr5LtffFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoztExghkHCqGkPqcooLTMr1ggnDhPrl3Hb86U+80HI=;
 b=jBXgPsI1+L3n0fUHIoow50t3ZjYsUSj+6fyM9Iq1N3Xw4aslLvP3ziJILHM781UvuFR2WMKwuJzvNJ/92drY282U2rvrOeIxLqSTFNwx/LQfrpS1+VDMKO/K3wfdatm+u6ZaadLwGTeZ9h11KWj6MIpPQehI1m6WmQHogsnWLCPyqpgQSv83owh+YEeF4jcMGP5UUe+wV+50CwroT1JxAQP1ya36eTk0FrzlcSNfzjBXzyX3rsTKMOozQe9YvGDrRGK8SKyHE24gwS70iubJvJRfygq9lFf/Sw3F7Ob1kU1ABE+n/9+a+iQv3XPuLWmJXxAMuVgGxD8vyTDNKcJZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoztExghkHCqGkPqcooLTMr1ggnDhPrl3Hb86U+80HI=;
 b=A3WBEfAxsPapJqN0JgpPmK3lDN7GxnYbXckgT1Bags7aV5+yCH80Vxf98fr2UxoKrZjiTWiZNSs5uAF1zniGz7HZYA3HeDfLoxUd6UPlZiWbQfuJiAy/B5GdplVHdWhNlY59KalYTVgCFDC05PComBV32xcknrgK+58lpZLT0mHDlvC4kVuOdseMd90p2V+2kKxgckSOni6M44PnZ64Ttb6W8GDTLf5zPiG/xd4E0Z+Rswl7URwj2tWUxahRgZsXqjnrA//8eHAxSEJ/WPdbIu4Yguczb7SfZN4qg3hxCCfTdMchX6I22t2x2pTVF9i6gT2S3aQQbLFgVfhr9HbNVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:20:46 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:20:46 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 04 Nov 2025 11:21:06 +0800
Subject: [PATCH v2 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-isi_imx95-v2-2-c05b7cb104cd@nxp.com>
References: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
In-Reply-To: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762226484; l=1885;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=UI24isGZ2rZx/LL+s59Zl48MTTdH4ur1WhcJ2jDXedo=;
 b=mutyHgAdjooFsg1F1hFv3kDS8k+b+PDwiuu0SkX0jZ+n4BtKrWdupuecaFKNicizT4KxlLBfg
 z25d4TU22pTCFwi1HWhraif4C5GLiJnwepf4hOChj5kyd8NCYUhO3b1
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a2c54e-26b7-4b1f-eba9-08de1b51250f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MysyMDhPNlJFRUdNVEFOK1dpcEQ1cWRnRERRMDRObUphd2lSMEtiMXVJT1cw?=
 =?utf-8?B?b3dxdjhUR1czUXo1UkFwMDRwWmQzYjZFUGpJOG1DeXNRcVFoby9MSVBwMkZu?=
 =?utf-8?B?S2dhcUZoZUZqcTBwSVl6Mjd6aHJhTnJoS1loS3Yxc01XUVE2OFRvOVFBTUY4?=
 =?utf-8?B?RW5HTGhZbUsyZFJEaVBPM2RLeDNZUEJQUEw1M3VNQ21yUGp5Tnc0ak9zaE5U?=
 =?utf-8?B?ckZWd1hYdHJNbkVWVXprK01JQjk5Sy9zREJMNk5ZN2tNZ1RHZmxiWUZ4SWw1?=
 =?utf-8?B?bTdzR2pyck1Eb2h2MERnS0RWVC9reHZsN2Q0K25YeGdFVkhhbUJkTkMvOWJ5?=
 =?utf-8?B?TzdhTUtPTUxCZkMyczBJMTFtbnh6MkJoR1drRUVKaFJPZjEzSEJqRUNGNnJV?=
 =?utf-8?B?RUZ6Sld3SUhlVEpYVHFibmU4c092bzNZSldvbnhGYkpYcGtXMDBoK1ZIUGVV?=
 =?utf-8?B?ait4SUw4djdnUzR4b1FKOFR5ak9qWUlkbFFYZWJlek40elBSaGZ4aWU5VUJZ?=
 =?utf-8?B?ZWMwS05XVVhpNDhWWmRnZ25JcitBazVnTnlRQy9lTEkvMm1HYjA2VW5iRUt2?=
 =?utf-8?B?WTlOTUl5WVdtSFI3ZkdhUURDWmxLZjlLU2V1UzdXM1hqSVZPWjJHUmRNT0Qy?=
 =?utf-8?B?Zjh0KzlSZHo1Z21SVkFMcVNZT1Yycm9mNnhRUGJMd21IZjJ2b1RSVjAxVjhD?=
 =?utf-8?B?dmhVb0NNUkprM2QrRGVxWFozUWZZTS9WQk91UUV4ZmFHZ0tBU1NQckVBUFp5?=
 =?utf-8?B?ZUhXYnVPeHlzaDBFblV3RDZlVjI1NjNDWkdPeVJXK1BNVTBvWXpoMFBmNDhS?=
 =?utf-8?B?YUdJd2NUNUZSTmhNWkIvaFQ5N29jQWZvNlQ1UmVKRlMvY0Q1bUFOalYxK1Vk?=
 =?utf-8?B?Vzd6MElXZHcyckFHVGduYy82ZHFuRHFUckM3ampSQ1hnYjlSeEY0bHIvNDF0?=
 =?utf-8?B?QTZ0VUkwcmJrMi8rQXJPRStGblY4VnJ2cDNVOENOMU03ZndsRjVTRm5rTHdN?=
 =?utf-8?B?bHpZYjJ6WlFxS0lnZG4xZXBQUEx3RGFpVnhRVVVmMjhGWituZVVQN3NTQlRa?=
 =?utf-8?B?VHRPTWU5cXlGY0crQ3lObk1LUHErZG0ySUdDa1R5dWFXWkQzS1V3WWlYT3R4?=
 =?utf-8?B?RjlQYW9oZWxQQXF1MC9IcDV0cEx6eUVPUkkxM3c5dGUvcW9aQmVOYkNzSE85?=
 =?utf-8?B?eXhMN0libTJtZ0dheVVXa1dxaHVNbk5wM21ranR0UzFWYUZxVUVsa0hGbW5o?=
 =?utf-8?B?VVFndVdWSWs4eWhXY3grVHllVHRjaExMRHZpY0JaeFBuTk9ISlZMR3dwSDdS?=
 =?utf-8?B?RG9QZDJaMUYvZVdwODNnNndnaVZPeWplcVNmengyT2hERmJkVXNDNzM0YlE0?=
 =?utf-8?B?V1hkZ2wwMm1iRDhUeWh5aXlSbHovYTM0VmhET2NtRHE0SWpTcGRTN2k2V2Z6?=
 =?utf-8?B?WHU5WkdJWHZVeTZ5UzRTNGREbUdaSnNTSWJMczNHK3N6My9iTFNMaWR6aXgy?=
 =?utf-8?B?WFFRV1JWVTVHcmY1dmMwMGhyYUxwNlFMZTBBSkMvVUZ2VVQ0QWZwWER3K1N4?=
 =?utf-8?B?SVNkQ3M4WGxReDVQWTVwaGhneUZGaXBRdWhObDJEUFd5dUpnSmtjeVp2eEZr?=
 =?utf-8?B?WFJ4SFlFaWxPdUtJWWk5Q1dWam1aYTJNeGJMMzlUaFdGRFU4VGlJNG9yNVZX?=
 =?utf-8?B?RkRnUzZGd3c1cHZYVXpPRkdOUkRPZ0ozdHNCTDVCSHlVZEh1d0RKOEhuSW5B?=
 =?utf-8?B?WEtKSjB3ZkZFVzdkak96UDROZE9ERGFxdzZYeGNJMFZEQXV3cENuZVQyS3do?=
 =?utf-8?B?Q0Yxc2tXSnlaNjdVeHc2NU0wc1RVbmlxamphbk5La3psN2c4U2dHN2J1bkMv?=
 =?utf-8?B?NzRsbkd3QTFtektselA4K3NPVnh2cWVHZWZ5cFdocXkyR3pYVDNjNTIyNjl2?=
 =?utf-8?B?YzNXRmtqQjhsSjFlNDlEbUkrYXV5VXRzWkNzZEhVWnVCNlA3MnorUG84bGZJ?=
 =?utf-8?B?THljQy8rSlFnTXppdTBuQmVlOHI4d1EyeW5Rcy85MGdSaU1rdXBUYmpMNFkr?=
 =?utf-8?B?aEc1TUhUbFF3WElhMDZqaHB6V05jbjhlbkQ4QT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UytnUmZmcmtVWFVsaHJiQUEwSnlYNGZkZEdjTlRxNEwwOHVMWlpJdFk5L0FJ?=
 =?utf-8?B?aEFXNHVkR21URkY2ZmlwQ1l0ZFJUTEpwR1NCakFKREJ0eUZFRk1YZTNCM0F2?=
 =?utf-8?B?WWFNVVZ5TzBjZUMzVzYvSjJNMG02dVd0cFIvVE1mQnZNNDhZSDlhM3ZHbU5R?=
 =?utf-8?B?N3VUYXAyNVNjcnJxMElxSVN6U2JMcWlnMkc0ekt5Q0FuRU44NFY1WDBlYnN5?=
 =?utf-8?B?cWF6ZSsyZC9qVWhFR2RTVWRHZDJlRG5oejVOZWRNUjluQ0crYlo4bGp6UFhy?=
 =?utf-8?B?TlY5bSs4dUFXa3NFblhWZnN2SFpZVm1uVGszWHU1ZHlLR1RoRENPQ2RNMXFQ?=
 =?utf-8?B?bDVaM3BhTVJqNVFraXZMN09SNnhYWXpmSGMvMnRuL0R0a2J0V1E5eDVuUkx6?=
 =?utf-8?B?VTRBNm03WDdGQVJxZGhiZ3Baa3BDcFVRWVBCVVN4VERYSzltYkJlWVV6cmJo?=
 =?utf-8?B?cmxDUEVNNjdielZzTHFmSzJMOFA0NlJaSzUycXFNck9rdTRjTDFmZFFPaXZ4?=
 =?utf-8?B?Wm4xeFBrL0lHZE14OEhIYlFDcW0vUVpXL05jRXN2ditCKzBmMDVIb2F2cjNO?=
 =?utf-8?B?N3lPU1VrME1tK1RkV3BIU1QreE5mLzYvdTBuYlhBYklHUGhWWkZuWTFrRU9p?=
 =?utf-8?B?UXVpSEc0RFFiamlVZis5OWVia3JwWkdjZk9nWDdYREJTQjllVkh5cXpRZnRG?=
 =?utf-8?B?OVhSeWhMVi94K3J4YmhKVlhiZHZteExNZDdMWXJOYUZVcExURXJYNS9Ld2tI?=
 =?utf-8?B?REw1VjEzRkNlT3lLVm1XUjdPYlQ1QlA4TjZXNFFXV3BhNjMzZmx1ZzFYSVdl?=
 =?utf-8?B?czEzeldlVU1SRDhleDFpQXBlakpoeTNWb2lya1NJYkNpdkluTDlUQ1I0MHZ6?=
 =?utf-8?B?aHNHT1oyUzRmWG5VOUIySlZ5SFdFZVBUSVFNbmJRTW9JWUU4WS8vYk1yTmFT?=
 =?utf-8?B?Nm9iNkNnN1BRYkFhdXVFMkpBY2pvWk1BU3p1OEdiQnZBWUlIeW1sRUhrM0V5?=
 =?utf-8?B?ZzYzVm5QbXAwWFhkZFowM0hSY1RJUUg5R2RXcG1DNjBFSnhJUEpQSzJmYjJu?=
 =?utf-8?B?WnBBNVVDSklxQkdaVkNNVTZjdTFvMkM3RmdpdVcvQVYwK1dGU1FVZURGYU91?=
 =?utf-8?B?YitPVlhaZ0RDQWFMeER0K1piOHdJQTk4THdnM3BmMEczK292U21qaUdMR2Ir?=
 =?utf-8?B?bFdYWGVQZFExT1QwNGNKMGZITmlkUi9nVk1ySHhYaFN1N1BEME85K2I1REdR?=
 =?utf-8?B?RE0yekY0eTZFZUtWamZXZFQzcnlMUFlob25wblVhMUovMHEvcFJvc2dmaFNI?=
 =?utf-8?B?RTVxSkFvM2lYTnlyRWFRdlRhNXNJazJwWlpMNDZ6T0RGRFdjaHoyUTdIMW1K?=
 =?utf-8?B?M3JoOGM1MVRjVVY2T3o2NzFUZ0dtN1AzcXhaWCtNWjV4c0tDZWlKZ0krRWZM?=
 =?utf-8?B?UENwWmg1azVaMlRCcisyc0Zta0JzT1NIN2IvOGdIU0dPUFNJN0szQ29USG9n?=
 =?utf-8?B?ZC9SSUg5OUxLOFF6VFpNa0pWNi9UQ3J0SnJIVjlEREk0OWFaZ2dHZHQ3K0R4?=
 =?utf-8?B?TVU5bFIzVWJQSTBNUTV1VTlqODJJMVhaS0VjV1N1OGRXY2NmVERmSC96QmFR?=
 =?utf-8?B?NlNhNkhQYmQxL1ArUmJGVXN4ODlxbWVpUTV1TmRSRy9RNnZpYWZjNzE1Y0FT?=
 =?utf-8?B?NStyT0NCMVo4bWZEN1VIRDB6b0xZSjRkQVJrR1RZWWtkSkFUQy9KZEU2aW1Q?=
 =?utf-8?B?czd0MDJ4THg5dnNjYlRKR09IWC8wMmM0dDd1UjlIQzdNdG9TVE1qS2JraFB2?=
 =?utf-8?B?VHZpcDYxc3BjdVVhdWFLdTF2SXM2alFnNVFSdmJJUTVnb0haTlMyYWVEdm03?=
 =?utf-8?B?anhTd2VYL0g0RGt4Mmlzdm1MZzNVSTBqTisvRTZ1alVJQis1Y0hvbTcxVWFr?=
 =?utf-8?B?VnFocm1qNzBOcWlaSEgrZ011bGJoNHRPa0c5d3NJektHL0JYb1dLdUF3QXEv?=
 =?utf-8?B?eWtPTnJ0WFA1R3dyd2w5UHJueURINUU2UG5henNxV080UVgzaUh5MDJ5Wm83?=
 =?utf-8?B?OUV1OUNGbDBES2FBV1dOTW9jNXQ0eGRVd0t4eTF2WXJDZHV3TUJ6TUxROFR0?=
 =?utf-8?Q?eT4xJ6deK7l2MTlCluzRVt/GY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a2c54e-26b7-4b1f-eba9-08de1b51250f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:20:46.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EcOjVAHKMcL2SP9et+DE+VBKwxkLYX3vswWniRVH1FdFp0N60a3xLMlyQtRXls3iHpHpdT4GoKOnAih8lebKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The field BLANK_PXL provides the value of the blank pixel to be inserted
in the image in case an overflow error occurs in the output buffers of
the channel. Its default value is 0xff, so no need to set again.

Besides, the field only exist in i.MX8QM/XP ISI version. Other versions
like i.MX 8M series, remove the field since it won't send data to AXI bus
when overflow error occurs and mark BLANK_PXL as reserved. i.MX9 series
use it for other purposes.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 9225a7ac1c3ee7e42e64983982eb4b6c27e356fe..0187d4ab97e8e28fca9013f6864a094e08f2c570 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -309,8 +309,8 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 
 	val = mxc_isi_read(pipe, CHNL_CTRL);
 	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
-		 CHNL_CTRL_BLANK_PXL_MASK | CHNL_CTRL_SRC_TYPE_MASK |
-		 CHNL_CTRL_MIPI_VC_ID_MASK | CHNL_CTRL_SRC_INPUT_MASK);
+		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
+		 CHNL_CTRL_SRC_INPUT_MASK);
 
 	/*
 	 * If no scaling or color space conversion is needed, bypass the
@@ -323,8 +323,6 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	if (pipe->chained)
 		val |= CHNL_CTRL_CHAIN_BUF(CHNL_CTRL_CHAIN_BUF_2_CHAIN);
 
-	val |= CHNL_CTRL_BLANK_PXL(0xff);
-
 	/* Input source (including VC configuration for CSI-2) */
 	if (input == MXC_ISI_INPUT_MEM) {
 		/*

-- 
2.34.1


