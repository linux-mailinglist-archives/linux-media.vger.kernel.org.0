Return-Path: <linux-media+bounces-30583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BCA94DD5
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F283B3B0E
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB5825A2BF;
	Mon, 21 Apr 2025 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CxSyKsrs"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5040021146C;
	Mon, 21 Apr 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223249; cv=fail; b=EHHdooOMQyLpczMJ3BnF5aKPptSDeeZAFPkl8ppfs3+OQthEO45pEnFRYyIOnycg0u3+1I7w7VrzMuGpxjxuSZ2ePNDvXy5NeSwcuHXK0mHkkLpyyUYy10nA8JtBoTt4RuhrZ21bn4e4/HY1wyL5RyEQJ3pC/gnb6zNDmvIqFqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223249; c=relaxed/simple;
	bh=MpL9YVwbgA1za36QIXIM87QneIZSt17CsQ4iGWK+o4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OM+xJbljUlRKxeCj/L0k+8bNpK4f/sDiRFHRkbRht+Zyg0sd6uGFssg0lH7gSwicok2fPjVuGVh8djoXiLwZz4r/KyH5YX/kh0mKf6kVrE/pDGmyomo9YINs5UX3kUgm2Cqr/T03gX0JFsSjNZnn+RQBD/cEaQuBcM2wv3AU9wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CxSyKsrs; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIGtJ4cggsBBCksPClFaqHUHOy2KBS9xUPKC8dw92CSI0aemj/qK5ILBHBDUYjtMmc0tyjz86kPojO6702UjNs90G5J9dxiVSpAjRtrOox0MxoezMT3NcCHzlGEH0PMEDGBrNnQwJCK0WWLColn9vfcgSS/5wjvNUAy+mznCE8Vf1SryqS6PDBYzchhlfy0R/YEIRzGkNDY5xlnEtfksKMOXlKEKfG3Db3NfmC4o1SVv/cMv5K+pWcHcVdC5plcinyPyfhEQC4ceb3VNQbJNV4YcLYsLk1ngTqHKFRcHsKqNoMHACPQMC0WLvDLu2Au1Ov0g3wtodbKe/epg9PIHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq0vuw+xZ9el5izdapryRuRDhg/TWVyQ+UUl5G2DKjg=;
 b=m8n50/tYN9scfcUy9nk/fLSxPxEK45ovJ71os21GVUAHAoSCt4Y43jlfI49Mc8LLvdjt9RfoQqtpUXHLINVHOD9+aedcw0sRPq8QzGv80dkYRMUFdboBC6isTgYCWCBNsSJq/43a8zetGmeOOiZyBMjMTxCBEYibtnRUpEugxJj80VBE3uqDdku9rqXsNE+3PLEJayGQ8R7JtGalwGBReCjsWGftUWcvKyhWXLS77OBf52G1gV1ubKpZ+mgULEU3Jvb0f+3QWECrF6uSwfjmsgWCTHS6cCjTQfALFg0QNznR2IRUvh/CARNMa9tx27BeC2b+pGToFKFR6GODRew16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq0vuw+xZ9el5izdapryRuRDhg/TWVyQ+UUl5G2DKjg=;
 b=CxSyKsrssKuQQd7wh9ZcyNUnKkQt6B8GIhVJnm5yijH1tjWU2YXUcf4jiDIIFArNZaMkHfYKG+ovlw52Izu2hf3OERsoNV2Kjc5f+xSh8ezOyAl2upSvHb6fZOkk1EktwR/3bL+K4a+oc3CeUWznF0UqvAvUBehtL5m0MqtVRDdvghm6+LoIJ3onAz4lC0ibL64gtyc7krBE0lHoQhq+i1n49Gcu/a1RHt0srj9iKD2oGODxWKW/v4tntCP5cHhk49esBqRFKS2EbPQHDgctoOevrZfUNq0R096Db/wtoYi1UT1h7J+7Xy5Svnbf49IGXQ5ZF48KkwsygpJFfUYFYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:14:04 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:14:04 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/5] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Mon, 21 Apr 2025 16:12:56 +0800
Message-ID: <20250421081301.1304-6-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250421081301.1304-1-ming.qian@oss.nxp.com>
References: <20250421081301.1304-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: db1ffff8-7075-4cdf-fd45-08dd80ac7aea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JByMTX2joiWadHJEbMSgDyWlCkOfFdtzxfsACxS1DaAm0VD3z70k/uS6eMUj?=
 =?us-ascii?Q?1kRO+Bbay1mQzdq0NjgXC4R0PrtQuvhKiQPOb2cC0qZFeudA4bGXnkxf1gek?=
 =?us-ascii?Q?bszX0cAQANcGkwuMX6Z1doMpYGOTB1c6WGpFDE/uxtFKiSXdhmySnxvz4OBj?=
 =?us-ascii?Q?QX5mdWwLIK8kMbA80LpZdOCOkNzGowhSh+cICogaMS4r20UgDVcH0XdFA/2s?=
 =?us-ascii?Q?4ykVMM4448J1+jac6RSDynm2aEBSNp095c91yYP55GaBO6KdYYlQWq5aIDfe?=
 =?us-ascii?Q?n7+vBHouqjZDQS218xWEQO4UT+UCewPVNWJQmPA3s6N7mYjk5wavntywW32k?=
 =?us-ascii?Q?cEOMy9zmYG0eUmKmXXIUJH3OlSbwUBs91X9UGQSWc3pp6CMB1Ik+TbRSr1Dp?=
 =?us-ascii?Q?SEQmDArYY42L0UDVq1XhdLWctATXBU4zJCxr9YjKDZHGmCZR47bovJRQ5kvX?=
 =?us-ascii?Q?n0Cpd7daGzLb5BEyDdA6h6Z85hwb+Q6qBuOalYeICG30XkdozCU8ira1V7Jg?=
 =?us-ascii?Q?xPyBfEgUaZSi9pB3SsJZD6/sPDPMf4kD+Okew4SZ8NJCNtmeQ/E9ZgS/N9JS?=
 =?us-ascii?Q?VqV52CKPmDsmG+HhwiDChuz4yYOR/nsAQiu9eQVicu/gCjBKFtLXULTvnst5?=
 =?us-ascii?Q?VQ9i1wjA/SHudLmtGZxeQfsvMdkhqHbGotr7nkUqKgzWO5xgnWM0R7o1y6Ue?=
 =?us-ascii?Q?M4JyE6tShSpjQNk8tPs2WVb8vtTzR85jx3K3IUUGIIfhcHfnJf5Aur+mUWAC?=
 =?us-ascii?Q?g31/ch93oyMmJWC8dDzbuxanKI6w/M0SgkMMw/sMMsnjcRs2LzETUr7MAVlw?=
 =?us-ascii?Q?HTELXEOi9t2svb2MHxw92wlx1gLPYtkJSUwtYviW3lFpYLHD4Rt72LBDfB65?=
 =?us-ascii?Q?YFnL5JFhbkxf8A4a9hyVqieU/AXqiGSA5A5JZ4UpaJ0hDrmRNmgjhXmJKtGm?=
 =?us-ascii?Q?0cN/ve9PRCq88ABW/axAE1fJPW0h/l+tPTSTVtCwf2k6DlGZK7185VFkyhUK?=
 =?us-ascii?Q?yZtpFtlNTt+ahs9t7lhHkKYPa0ifC7Ww2WxIqhtysrQhVelJbH9Z3XyXtcVM?=
 =?us-ascii?Q?ZMTs0AF+bcTzu1dpE50FcAHPqvBJQnN3g4d4HuAv4Jrf4CE7eaf0Y15GF1fb?=
 =?us-ascii?Q?v0uorJiamnmlQChgPGiruMRRlYs7KSn0JhJbGzR37sX4PFtxOk+ubGnmx6e/?=
 =?us-ascii?Q?yXvenAXYpdYocYfHCL1ME55a8G1J4Q78hALmcbEfBnhG+zYHcruFm8phvizx?=
 =?us-ascii?Q?C97jne0h6WakRvwP99ddazmpX3HvuKZpJ9H/WRPRXNAwgUA9kSdXD8kaQPYy?=
 =?us-ascii?Q?xkdWKyaKwqc/dJMI1Znv825uI0DDYhqN4j20I7Je4VUOJmRPnxyFLKHhGU2t?=
 =?us-ascii?Q?RgibIjqUGbeaqzTvzVhMeSndpud6xG0U9OJY1KbYYA7IxgQWapEQ17A/I17f?=
 =?us-ascii?Q?N6FCf7kBe6vchHog6uh5nbY1mEu4aCcCBamLPwE+W5+5dlCZkpDgtOea1TNW?=
 =?us-ascii?Q?AjKsX+zftDPRzLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V7VFxZ+ktouH3lRUxPYW2yERzhxu98CX42ZBB01z31Oht5vZEm/RSQ1ISIu2?=
 =?us-ascii?Q?glgA7fbip3JADosHjSPZSBTyXx03MAqoJwKdMkepe07jL9vcMattb32SdHWL?=
 =?us-ascii?Q?oY08yHLk1N5PWChVpwLsi4OLaw8kox7MuHaeykDWDBRyKdhP41jZNhjE+20l?=
 =?us-ascii?Q?E6lQk+yTKmLA+Exi/9001wkk8HcHQf63oPpALs2dFC0thcrSXiZekketnF5Z?=
 =?us-ascii?Q?5E5E0cZMUc+n2gBaA/WYYvelJFYHoaqU7oNskwLJphSo91WX7rkKtdY/QK/7?=
 =?us-ascii?Q?hJZOpY3WeQlA3OhwwTqzERxRsn9CbBcmtJh8z/smWB3f81yzxavrg0XcIQsE?=
 =?us-ascii?Q?iTYS1nopNXuWvkuWmy2b7XGKqvvutQg3HACfPwHowPYWrI2d++LLu3iTh+3G?=
 =?us-ascii?Q?l+TsfVArGTguMUoRUwgl2k1q5LrFU+9CvUWeB0U6hfvM6MEM2KMWF9ns1Jj7?=
 =?us-ascii?Q?G392AeaujsGdf2ks0eD3Wqwo9YyqnTejA6Q+8tPtMVYJ6CaKS4fF/zChLQlg?=
 =?us-ascii?Q?l/Lqf3T7/LoFSVzieMMLa0xb/Ug0O+cIOppuUCQ5I689JP3EOYsK9km1tBVp?=
 =?us-ascii?Q?0E8DhKN7v+i8vLwjWLiQ6lzoC5QU1M0W5OYLVrSd0Jl6VyEKz+GuRe9o45QR?=
 =?us-ascii?Q?is7mYL1KYEXD39Ga/FnZthuF1il4eoWH2Hraq905XSKSiscjhAucAiNE4mVz?=
 =?us-ascii?Q?tKidOAYB/GeNc4EwzBMGW6ail3eKj1QZ2opqcG8ie6l6H1rpGjPDjdMJLKuT?=
 =?us-ascii?Q?VB1XlkQzCQpZYZmwuEyFwEAUCkGofIISkD5DQtaacUGVjRDr6P5Oniu5x3tP?=
 =?us-ascii?Q?NyWTZoUWjlQWzuTszIO2yS4xnizr3MftLh9DGDIezoLISerYGjwWB6tBw/sM?=
 =?us-ascii?Q?+iee4v74RuSYwYnCatD6NuKTyFml6Ze+c6XA8XvZYI1w1z9vIXXTcqxtTwkR?=
 =?us-ascii?Q?B45IF6h2oqJHu8NB1b9QpZaawXvHvv3+RsB7EgcfEbYpPe957xngo95cGog5?=
 =?us-ascii?Q?vJd1sltIjRw8BE8u5oAFs+ile46XCtKAwFaKJK5HNY0pUnzLcs55DQoBpTbh?=
 =?us-ascii?Q?prG4OgdEAPJjw+hTiJSQLJrrz1RSDX8Cul+FlTZexulcyrhxSMQ5eSQaRI2q?=
 =?us-ascii?Q?cISUw/ci+ngRhYfab6V7nzFGgJi6l4lCkf6Eoo5ushwQv5ePh82obguTLVlB?=
 =?us-ascii?Q?CN2uO21mSeewSSGimpvY3YrhWw5VVjx9cl75T88OMrnBBhYCxKMu441NHt2j?=
 =?us-ascii?Q?nCzu+18QfBgtjDb5wD6buXu29vRE3fPRgurY1azZAwXuKm5TigTEW6YehAF2?=
 =?us-ascii?Q?BrqkVFUzuwuJjG+A+9JGfLa0Ozg2XaBfNl9uL1bk6+FwB43EhrvPdonnCv4x?=
 =?us-ascii?Q?NyUGaVZGAij/TADnFij6gC8rBfM/EAFbdg6NYVI6FvEJLFr3OYhFdCOapfJb?=
 =?us-ascii?Q?uFtOGQYhRV6PdDoC+oGzLo+wFr6vZEM1BJxsb18vWC/TRQ6NshBEqkbYdiWh?=
 =?us-ascii?Q?v1Wg0tjy4j7D39Jetbn9gf2h7yDKR7khpVLJiB21OBAhpCHFvFNC1A9TzHrS?=
 =?us-ascii?Q?JkG7tf/Hgbae/hiH9dpzd6DrOSt4BH47Q4TVZj8S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1ffff8-7075-4cdf-fd45-08dd80ac7aea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:14:04.3904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brzXOrJEolJOFPRxD5GE8ij4ZB12AUJsyIV5W6n9HlelNZ3ZiYExe6YwR/998F/GiAJVq2joJQiQmsOLDm6/fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104

From: Ming Qian <ming.qian@oss.nxp.com>

As the first frame in "repeat-mode" is the pattern, the pattern done
interrupt is ignored by the driver. With small resolution bitstreams,
the interrupts might fire too quickly and hardware combine two irqs to
once because irq handle have latency. Thus the driver might miss the
frame decode done interrupt from the first actual frame.

In order to avoid the driver wait for the frame done interrupt that has
been combined to the pattern done interrupt and been ignored, driver
will check the curr_desc and slot_status registers to figure out if the
decoding of actual frame is finished or not.

Firstly we check the curr_desc register,
- if it is still pointing to the pattern descriptor, the second actual
frame is not started, we can wait for its frame-done interrupt.
- if the curr_desc has pointed to the frame descriptor, then we check the
ongoing bit of slot_status register.
- if the ongoing bit is set to 1, the decoding of the actual frame is not
finished, we can wait for its frame-done interrupt.
- if the ongoing bit is set to 0, the decoding of the actual frame is
finished, we can't wait for the second interrupt, but mark it as done.

But there is still a small problem, that the curr_desc and slot_status
registers are not synchronous. curr_desc is updated when the
next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
after the 32 bytes descriptor is loaded, there will be a short time
interval in between, which may cause fake false. Consider read register
is quite slow compared with IP read 32byte from memory, read twice
slot_status can avoid this situation.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v4
- Improve commit message

v3
- Read the slot_status register twice
- Improve commit message
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 31 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index d579c804b047..adb93e977be9 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index d72e15ee6d32..5c17bc58181e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -910,6 +910,34 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	/*
+	 * The curr_desc register is updated when next_descpt_ptr is loaded,
+	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
+	 * So there will be a short time interval in between, which may cause fake false.
+	 * Consider read register is quite slow compared with IP read 32byte from memory,
+	 * read twice slot_status can avoid this situation.
+	 */
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -979,7 +1007,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
 		goto job_unlock;
 	}
-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
+	    mxc_dec_is_ongoing(ctx)) {
 		jpeg_src_buf->dht_needed = false;
 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
 		goto job_unlock;
-- 
2.43.0-rc1


