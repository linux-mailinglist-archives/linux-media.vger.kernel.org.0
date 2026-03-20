Return-Path: <linux-media+bounces-56471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGC2EerrvGkL4gIAu9opvQ
	(envelope-from <linux-media+bounces-56471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:40:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C52D64C5
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35EF9301397F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A26325710;
	Fri, 20 Mar 2026 06:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hqIfeOuE"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2BE31F99D;
	Fri, 20 Mar 2026 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988839; cv=fail; b=F8rTxXVlZiR+MccAOpiWDT296btaCftInpAMNGzpZQ7ycxlq2NHl1tsPQ01TdTv4+JLcHCqxBV3PC+iqqQiWiGA3TfK9qg6wyyE5RU7mcdlDtFFMCyf7xwu+Ni/Vu3P27SrqYRg62k7tNaiOtfzVYXIHV6eNDxGYWb3l0ygBMuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988839; c=relaxed/simple;
	bh=27xIzv/nTmBMDRlBH29D2zCNpwnoHD5VU2jp6FXuD7Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=IoYHR63zgRGD7Zt70P540kvKxPmu+1AjgnBms0vU+OIJUBhoczCE048gCeW4lRXmR2iDe4gPm4rcE+GA2IuKkYdciNDdisKnmUy+xNkXaEnsPM5oLYSAXeBfqHM4W+RV9RCU2wUgfTt31fs5DNU+azxaAFNgeDtLiCwvxrasNKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hqIfeOuE; arc=fail smtp.client-ip=52.101.72.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoOQraulOvh7DZdztkrJLeo9DGOZfaM0hx0LW9uuI/ISS2V/LH+CYIy2yhqpXt+kb857c/qeJmhfgvqbf6eohPP9AQav9KPiesljjlf6rRjHvznBnR8mx+xsQyk/INlQ6nKRJ8v9yfbF0hx6pViv1u+NeaqvbznNSYUTpDO4r8a/tvz4k1DmwZeTSy3q4vHpgNogP6uWmIiyczqUB/wYefJ/8sV2lgmFDHkUKUhyaWCG7NKi0WbTnxk04WxCudDx/rLptZRnDfOJ0uJOUsbmp3jym09yELMYVjb7uEi3KzInSAHys/RMPDI+P2ZACojTWrsQKBnzXgYj3bjZ4YYP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qbhrwtK2600cST8AVKpayiG1lHaSizcIaL2JKMlWXw=;
 b=yo1mSyWYVp0ByeuqlTRiMGMXPWTFnZ5LCCxRRqHuhN1u7RAvL0HGZs9hGGXwps1NtzpIRQ1KaaS1+NdOazZ+8woiltYIMycmEILJMBlqzi3NSUGbcWzcY49tX/j5IQxeQS3ixqQ1b6uMtTvmUiF/xXRsvGsLlBEhTcDi6Y0trXYScpfgff3/4dfQaH6op7oTFMT2xV9MlOHvtzJZkqxDgL93QjrnjGvkkzwUhw8PdNDoDzV5dIJhZ6cXTxo0AClIh/BpiB+JaB2/WRxLuNWFCat7MbS4bcDrQE54DCBP0WCKkgCFinnuR+NPE3dXz4C0hlpUMGQj8SwUBQiWr8is6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qbhrwtK2600cST8AVKpayiG1lHaSizcIaL2JKMlWXw=;
 b=hqIfeOuEP7HUlQnQdwYquYoeaCcemFK1Kr+JsyU5SCpK1xm/ujxHWOo9/aIPyG2MHOq0bpvL/MhNRtKiCUDC1eKjhB1jHUbXINWuAcN+4m0DfQ4FcbU91A4H7yWho2mogaF4yOm2SPQI6qtS+W+T6cKHpVQrqmm9QCDKcw8K411ZTHREkQIGMbg0idJLdux1kk6yTRn1hQPBF1nGFkOUolcft5DSZ+lItzYDXh14L2PaNpLYKXLxMtjqrtoaIn80uNUDc0ClpeiStrNr2CAXb+M8n5aa80AUosHrRCiBtgF91OL1Bs0aaqR+hbHh5sjLat/zO0sdSgXXHXu4O13M4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVUPR04MB12196.eurprd04.prod.outlook.com (2603:10a6:150:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 06:40:25 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 06:40:32 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/2] media: nxp: imx8-isi: Fix single frame capture and
 optimize buffer usage
Date: Fri, 20 Mar 2026 14:42:00 +0800
Message-Id: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjsvGkC/2WNQQ6CMBBFr0K6tqYdEKkr72EMKe0gs6CQVhsM4
 e4WEqMJy/cz783MAnrCwC7ZzDxGCjS4BPkhY6bT7oGcbGIGAkqRS8HTRd2Tq5tX26IPvGgKJbS
 EAiBnyRo9tjRtxds9cUfhOfj39iDKdf225K4VJRfcKFDKllhpLK9uGo9m6NlaivBvw96GZNsTa
 mnOSttK/uxlWT63L0mj6gAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773988967; l=1540;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=27xIzv/nTmBMDRlBH29D2zCNpwnoHD5VU2jp6FXuD7Y=;
 b=gF4uLKiSe/yBMY5fdsjiZi4vVttMP4wiAokDnYfH5CGEtucejBTuWN7fV3VPFvYPdQ84Ugq2h
 au51oQI+nT3Aec1LI5RWOX6PKYTcqN6CIUKC/hhiIYTcpRRHaIj1IuA
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVUPR04MB12196:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee3dd91-f6f0-4051-7da7-08de864b95d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 EQUElxiWnMV/++zp/qWeW/FUQi+TKqAQvHYFW/WWS0xX4yT8NT46PsfuvTJrmE/gUotP535YPeXu7rG6HZyf2aDaaEfoaDydFT5CC7Dc+ZHgSIbjgunQQrWVeBiwTPe2GmxiVtvcF20N31pqJ9RXgsyEOi6TqDIQ80XCeA4czdIIF5Whavxl7iKpeBbsKOdKv370Z4cJmmBe31CJGHbzR0wZ6wch2+EadQu2R53xCXuD7F5EF1ef9/UXfsKh3g6B5TUqwE0w6x/REcOlTSzjZD3EZdg/ISM7nB82Db3mgi1keqieNJgEQKJZBSdGNHbO1u2lOz71mnDYFBfhT2LWa0hEsJbvUa8qDjIcuSfTvx7hVxwVKaL1o1CuAGRXbYl2rSr6igps1k9+Or2/tll0ERdlilfB6yWSkDHxlWTbC8m0SLJB9XArDmDKW92FHBnY5dYjIR25e8Ght4xk/ZpLLIDeY/QXwk29IrbkD8shwD0gPAyrRT0ZluuUwlskNECxi+AVaOuNxDy2cOxaS+mAYf0DTPo+VLlJG5KC3x469Wqc/tSdeDnGLA3oSS3lSuiyUG5Mx6iMgeYkqAOXZ8ZiPtQ47wjL41bvJangmSAKoynQ74jx4l0uYoRkYYwfMma557u09axuecByGzN9Ft/H5nEkPR926n8zAMC8SOOt9DGPOSdWKmi3gGbpBSsxLINnX6PejNxprTZuwUV/U2qrKCxqr+c/+ZhcTFEY9arP/tKNpYyRKEc4wJ2y9e1QYeBl8vsOxmMZF0a5lOoL4SvVwGsA5lgQBfMbH4wqNWzC/FuCoHb23nk6CXjWTkhwlIer
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VTFDajErWndVUkdBZEhHSEE4T0xjZFBkUjVwbEs1d0hueTVaSFBVZkp6YURU?=
 =?utf-8?B?cUdYYnordEg4T1JPU05VaGg4c3d1L25WSENSdWRzWlNsb3JzVDc0OUZWb3Aw?=
 =?utf-8?B?TGozemVQbzhhQ2RZWkJNZWcyVDZLMDlqQVg3WXptQzZBdHZ1MmNCcmFaMjc1?=
 =?utf-8?B?VFpYL2lXZCtmYW04dlRQc1UwcEg4cW9Fa0dlRUUzdGlaVk5QQ3RTazJIZWtU?=
 =?utf-8?B?bnF2UTFrYllrclNwY3pyTDFQNkcyME1OUTB3bkhzZ2dkM0hKMDd6eDVGejRI?=
 =?utf-8?B?aTVVZGI3TEhVbjBWTkN3Y0JxNDExTWxTejNaZmxpenNyL0RETnJvYi9PcytX?=
 =?utf-8?B?d3hsZzV2aXQzTm9JSUlRTklJQ2xTZXNtS2l2c1VDTDZ4RXU4NVQxQWZXWDdE?=
 =?utf-8?B?Wk53UVNIbjF4Y3NKcUg0bHdiNDV0ZFVHT01zY04xVVBCWm1zQUhCMndSVEJ1?=
 =?utf-8?B?bjc2ak9DK0M3b3JVbnJBQXlDWG53NmNydjJhRTlra3JrdDFmL3RiTG9CS1JF?=
 =?utf-8?B?Nk5JV3BOV0J4VHBRRDAwZk9SZTZCMUxzRG9NU1MzSFNPVkQ4SVMwNGUzalZV?=
 =?utf-8?B?c1BrMG5Da1ZQNGlmS3BjaVBHcmlzYVM5NjFkSCswRURDeGtYRlc3UHB0dFM2?=
 =?utf-8?B?aEJUTklCem13UExIdktIbVAvNndRUGs5TkhzUStFbzg0cDJEOFNyaXYyYXg2?=
 =?utf-8?B?QzRydzdGMWU0UVZpUVVPTk5naHN4YjdSWkVqa05xZ1lSMTU2NkhrRzFkNEYy?=
 =?utf-8?B?NEt0VnBzalVsZHVPZFdZWnQ0dFoxR3BqV09zVmdhcGo5Zk94czViQVg3ajA0?=
 =?utf-8?B?NTIwWUxMZjMxK1EzaFkwYlF0QXVMNkFqajBHRUFRRTgyeFUxRHZDTGVNZnRE?=
 =?utf-8?B?UFlHbEFBdklQTmtna0puV2VicnJHWDUxakRscDN0UVNta2RXTXh3QzlCbFND?=
 =?utf-8?B?YXdRaFJidEtHN0JOT3pmZ0dSNmpyZnFEK2NrVlduOURIOVlwM2ZXOGpSWFFL?=
 =?utf-8?B?RjVDRlNrNDFvd3B1MjBxZ2VLVVlKeTIzeGNCdzdrK2R2ZnpxRW9mVE0rMWtM?=
 =?utf-8?B?cWRacGl3M3loeDlrK3lMakY3Z2FGSjZSVUY4YWFKT05RZGdlampsNURrYVY4?=
 =?utf-8?B?L3RnaEtDKzR6K1VkTzErK0Ura2dqSmJpTFdaSWNuL2luWDBFbXM1VVJuS3Ur?=
 =?utf-8?B?U3RuQ3Y2Y0Jwa1F3Tnd0elJOMXdLV0FSY3dQQXVYK2YyTlRJYkdRay8reVB5?=
 =?utf-8?B?Rks3a0JDM2NiK2RCVmViK1lKOThMWXM3NmVRdHEwM3RQU3RScUhXV3FYOEtW?=
 =?utf-8?B?bG9CRTdOcEIrbHFHeEd0TFlhVnpRR2JFbUlFVzBhc2xxWDBpK09DMTRYdURW?=
 =?utf-8?B?TVEwSHpaa0F3NHhsZ0pxM1NQU1RnZlBNMWxUbHdvdGdwNHRxaEZ0ZzZXWnlt?=
 =?utf-8?B?Yk9MNXhiZGREL3R4dk11Q2dJSWl4NjF6NGtvczdCRWJGcmUwVDJyL2RuR3Ar?=
 =?utf-8?B?NThjNW1Wd1B6cnVqeEJ2UWMwRE1IYU45OVdwV1JnWlJDQTJkZ3BkL1lTMk5v?=
 =?utf-8?B?R1g3QVhuMW9lT1ZSWkdNVGp4anp3YzJKKzlJckxxcnJZWW1JMUl4OHI1OHg2?=
 =?utf-8?B?SW9ZUTVkS0c4MjZKUmdUWGIrcHAxRkpkL21id3VhM3U3SWVnRDg2bFhpUWQr?=
 =?utf-8?B?bmxXM0hYMWljREhuZG9CVE1RNlZPOWtocEJXSnBuZzRMdW9iYXZQdmF2ZlVJ?=
 =?utf-8?B?dm14UU5HZG1UaGZWSkJMYzVTb0h4cjg5UXZtOUExNWJXeS9YRmdyZXlMVWto?=
 =?utf-8?B?LzkrVjc1MFZRQVBEN0FzeG1XZ2VWSVZ0LzdEUnY4N1djMHdaZW9wV2VJSzlO?=
 =?utf-8?B?bVdGR1FXTlBFaUpoS3YrZGVxTjhWdTBwK1JiRGZmOWpoNHpPYWhJK2daUCtG?=
 =?utf-8?B?VGhMdnZKcDdCWFQyM3RER1YxdGFTT0cxY0pkdW12MWRXb0NWSWcyM0ZDMFpU?=
 =?utf-8?B?SDZlSHFEM1E5Rk1ieE1uV1FJWTdGRDVsMTY0UUhHb1E2djFmYVVoUTNMRHhw?=
 =?utf-8?B?R2hseWxJMGVoT21kWXpPZ1NzbnYyczNwNGdKbE54WXFqYmFtNVEvbHd0Uml1?=
 =?utf-8?B?cFZPL0hyYjc1QnlEZEZXM0JqdEpGNCtwNkgrMTZQYy93RVJUL3VWYnlWaEhU?=
 =?utf-8?B?QWRYK29zSzZKRzZOQzkrRERqMXpxeVlwTEk2OWQxMHNuUElCeXQ3M2p5ZG1R?=
 =?utf-8?B?aGFuN05KbHM4S3pXZFkyZlpQR0drT1B1YUpXTHJkUjdvTFhiczBuTHVaalRi?=
 =?utf-8?B?ZWdheTlzOVczbGk1YU9aMDJVVHhVQWdBdk0wSk5CczVkQlptLzErQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee3dd91-f6f0-4051-7da7-08de864b95d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 06:40:32.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdaYUPvFHTOri709vwdqnKANPISqua7d/UnP/1ReOdo8BkIEn5J4VtMMpiq64IvJ94QXQ6hXYyWRU9h8SWPxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12196
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56471-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: DC4C52D64C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a hang issue when capturing single frames and improves
buffer utilization by prioritizing user buffers over discard buffers.

Patch 1 reduces min_queued_buffers to allow streaming to start without any
queued buffers.

Patch 2 changes the buffer selection logic to use pending user buffers first,
minimizing unnecessary frame drops at stream start.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Expanded commit message to explain the problem in current driver and the
  benefits gained from this change
- No code changes
- Add Rb tag from Laurent Pinchart
- Link to v2: https://lore.kernel.org/r/20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com

Changes in v2:
- Add fix tag
- Replace "This ensures" with "ensure"
- Reduce min_queued_buffers from 2 to 0 suggested by Jacopo Mondi
- Put example from commit message to comment in driver suggested by Frank
- Detailed changes can be found in each patch's changelog
- Link to v1: https://lore.kernel.org/r/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com

---
Guoniu Zhou (2):
      media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
      media: nxp: imx8-isi: Prioritize pending buffers over discard buffers

 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-isi_min_buffers-4b490a124223

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


