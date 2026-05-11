Return-Path: <linux-media+bounces-61074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFGPB0anAWpDhQEAu9opvQ
	(envelope-from <linux-media+bounces-61074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:54:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A1250B63B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C85D30578E3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF123BED79;
	Mon, 11 May 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pRMguwLE"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D5309EFF;
	Mon, 11 May 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492467; cv=fail; b=Y/Og7+ZGKdwfMT9nglH0wcc1cXnUy97jfCRAeT8tHvIswi3q5lps5crG39Rm7LPL6Fcy9r8yoPtSnRb3Cn/BigZfRbE74e7/BxTsXd0GYXWwD2LYc8ER5HJnCk6GPHdN/2Ex/sekl3dLXnuGe4K5D5WT3O5TBqmrkQ5ZOcArVNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492467; c=relaxed/simple;
	bh=h698g+3Kz0+gGkzCpT8PcJunh3yOsg6qmlDH2XsxPwk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FJGN9Gw7sSH3LwMRNwFTDYVt4RpEPVnUMSykoXwBLSP4VxpwIRpaF0hXTOM9Y4LJ4tNhK0UH9G1bOU690jxlWcT0wmvW3FuC6TRPXhUMvSZsxWOHWD+z8iADNGQBLn0/NoqNvayUE8S3zv+vMylvFWbU2zqnLJrn9yFTJRVi9sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pRMguwLE; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK/86/ePG9j8BwNkfEDaZtolzwLuRqlzW1NVjIwLgFrEE+lWWFECVYE4RWb6nxdN+IQ2k9XKpBLCUVbd7bJrrhj+Sgo2wxQ/uuVpM8gRMxGIcEPlE6dHybkkoA9M8c6HSbmuIrKwCHoPSr2/LifiH3Ttyyb9yaAxb5yqGnIXJct6mH7Hh8IG7WfHvDajw1HiCkvDsx/2siwDuUJVhxriQ0F8XuR9d3J716ok9p38lY15G2m5LOG0qsohOa2sGPJHwkvat9uFNR74LG9bIKMvg76zC6s/suJDgt5XEZrPG+QKTsmebrTUInUj56a4CMBxLPvzCDWBC9X431SdG0db6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NazEYXccUFCHvpSIyTZHrI5rk+RUyMTp7OfDOD6gUuM=;
 b=D4K46CC8/p1flYLQQ3OC48V85IkdgktnfP6BYD0d38VNNGsxad5aWOAJCSwBHR2IF3KCggqTwJtIBdepDgRe1xNUZ19LTmkKpxJxFW0hTxTSW+5TdMZoLe2Yp2f0GIgVqC3cIAvUPyuR2HXvf2NWhgJbP67TNwEs9BxYKYEA3Wwah4puPLyEBCZcvpzS69f9HTxknGg32icElN80NoRv2fOlBIuBPv82fMrDIl5dPT1CEj/x5/02N5EV96U+Jj+V9JhdVEsXeT5TGAySzfwktHQK7NDwkDHaBhQbLNZgL9RTGhFAttUvi76/E04wVG5OV8ezmY1LxXz6mPiqsjJfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NazEYXccUFCHvpSIyTZHrI5rk+RUyMTp7OfDOD6gUuM=;
 b=pRMguwLEoOQtkeqXYS/2iZBzGmqkhCBaUkVYV+AgSIUAzUTkHhpO50/Fj4lwwgYfW9yd8QiraHKwQCWSsys6UxVYoCKAhx3iBnqECqJWd2wSg+9C4Rt7W0zI+B0UNqEqqa8clj7sRFSPTFWuuI3f0hfQGE8hNWNSiasGnzXWRUwDGDPlPD3q0vM2GrW6Cgmux77eIN9WtRWDtPBmXFJWIoSfv3GVTSTwSw1SIQTn4+KaTHLtyFxTOibfDM8eBI+6XtR5RhvbXp+xjV0+8elCr+873l1jgfAKClmJinCQwqLL2G45MranqJYiIDZMN3479ZV74AfXvrxoAcfLFXvk/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB10030.eurprd04.prod.outlook.com (2603:10a6:102:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:41:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:41:00 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v6 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Mon, 11 May 2026 17:43:40 +0800
Message-Id: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMykAWoC/2XPwWrEIBDG8VdZPNfijHFieup7lFKMjl0Pmywaw
 pYl716zpTRJj5/w+w/eReGcuIiX011knlNJ41AHPZ2EP7vhk2UKdQtUaADQSF/SRxzzxU0TZ8k
 UsNNAwTOJaq6ZY7o9em/vdZ9Tmcb89cjPsL7+lFDpQ2kGqST3HQM0bd90/Drcrs9+vIi1M+PGQ
 nu0WC0hkHXRKgS1t3pru6PV1VqyKlCwrepgb5tfSwoQj7ZZ70aK3gXwWru9NVv777+m2mB6q3S
 01Pbxzy7L8g0jMotzmAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778492631; l=7382;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=h698g+3Kz0+gGkzCpT8PcJunh3yOsg6qmlDH2XsxPwk=;
 b=p+ohVLWYvd8d5zpGx8xGbaUj5HdA7uYOwsjonz0b5V65IeBKvJhvEPsPp9CpgPc1YJm+r7ltH
 DHwAtgnzUR3DoRGLt2xWZlgnbhQOUDmzi6eoXohvoSLsGswbOh8W7mB
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB10030:EE_
X-MS-Office365-Filtering-Correlation-Id: 243794f6-ceee-45e1-a149-08deaf41694c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|18002099003|3023799003|7136999003|921020|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
 yPDS9U0/LpX3ML8Us5xKz8ehoo4vUyK3Q49wcqEaXjXu1W5VUZA7Olf4dB+BIlRo6kK2Tm0D6+fockNNgdNihYKTsB8upNFwitUT66ju05zgwQO8+/ALPJmAgmOJhTkMEkhpluI4J4TC3wyKdjSVhR+ZdZpoG1/8oHCoL2uSkCpuElPFcC62CblzmvsL6amWYbkOWmfl898g8oumV+MWCHiMw1CdNWFY4WBwMR9GD1PCe5KtKd/fehnRktjSC7z3aTAhRieRAeCEp3nJFZThCqOcqWdfYF5AEDbbcyFAdWHApvnzRY59nk7ONvtEwQKHkBK6HMbGNPgZosnQ8vduQ9o4n2GDGLWRCJIdweBuIlFT76YI+R16fjK0U+p4dtAazn6G8o+N1K5Ta7xvkxYq+XOJ7vO/kyXJ+Yx59kv/qCvbfBfcmk3Ksazzj3y6UIe3xcSD8OFDOTLz1050GzKqwW9nZ8Ul7VP4jLifiaJ7e9x4o56BY2lqM8b0U6hmY1EszeGrdTulqehNYhGoeF0oDGFuIPAlYiipwVVvatsbglB70SS1a0Z6TflmMnowIRNAwRifxc87o4j1CKcf47q7qwHShDzl/8oYqPPCa4oOXbAU96Ol71kKPQiL1M4Cz5pDwT5MAVZTWrQj423Bj1Ll+YbUEPI+WsgeXZ5SHB4trCxhcmRjOlhe3KvnqwI3kbUbRAVJ3bh0tu+RlctQUmw29mhp2A8/EffdX2TUOdiEEuwOOpk+OiPoJACbUgj1Qp4PTkYsqPuvB6OlJGapcpXUDA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(18002099003)(3023799003)(7136999003)(921020)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bEQ3bGM4OVFVYmZGb3Uwc0M3NUY1M1BUOS9LcG13Y1pXdjZYRXA0bFBqQSs3?=
 =?utf-8?B?VmlkbkV1WEJEZWh0SDY0K1d1d01BNVBsOTBQZWV3MklNZk1qaW9Mai84ZHN6?=
 =?utf-8?B?U3VNd2l1c2h3Y1lPNDdtQ3pUMzlKQUJDdDNqQ3FMSFRGbmVrcnlBUEsxa1hW?=
 =?utf-8?B?V0xNSmRtWFljRldES0xkdHdyMWw5RExjaEE1UWc4aml5QnkxWmVoRitmS1NQ?=
 =?utf-8?B?TzdmaVBPN21Udk9abTRnRlRpMDExaTNiUFM1L2hwT3dTVld6eFZyUmJzZlJo?=
 =?utf-8?B?cTR5RDJjUWpidlpPQTc5RlpqMEZpSFJrQnhaOWFZdkRLc2tPdFNrU2IrRGxN?=
 =?utf-8?B?T0hDQVlRMkZTUnY5amZiL0hMWXUxYWZ1QTR4UFhxWGkrMi9wN0pXdy85U2hx?=
 =?utf-8?B?dTFva1VTY1dWZEt2Ny8vZ1Z4bU81Nko0emdSeW5GdDVlY1lLUHZtWWlIbGMx?=
 =?utf-8?B?d3hTRG5PK0JaNEVIakZQWlU2ZEhLdUlSMXdZR2RZLzFlV3pvTlB6K1Y4NDhs?=
 =?utf-8?B?ZGJUQjhoTVF5S2Q4VWo4M3RWOC9Hdi8rcHZncFZ1UHpDcW1NNjc5VEllRCt6?=
 =?utf-8?B?dXpxbE1RSTVuSEVNa28wZmVZYzJ5SkwxdWFWVGhNT09pRUlqdHZ6eHZnaFZi?=
 =?utf-8?B?S1J0aUlQaENBSFJoT1JGc0hUVzRWNlEwRDl0U1NMbm15VnhvdXVVVFFnZVlj?=
 =?utf-8?B?Z0w3Tk9BaXlRdXZ2bkFDa3phQi9heWFGdk4zTThOMHRVWU1RdlNlTExiRUVC?=
 =?utf-8?B?U0NOdEYzUm1xS1RjWU9mbEsyWHB4Z3EyZk00aDNRTzgrYXkxc0VidlQxWGdq?=
 =?utf-8?B?cFUveGtuZjdJT2pRM25aYUtINGpwQ3BWczFtcjgrU1FkQ1hYUjU5SksyQTZj?=
 =?utf-8?B?UlBlY0R3RnBSMzlrNzBhR3NsUjAxZUtjOXFJZW5VbEdTcnFOa2NyamNiRVpE?=
 =?utf-8?B?SStnTGlSSnd0VDlydUt4RWlncEtSSzJXek9TS0FZM0xkTmptbHk1VUZBYlJn?=
 =?utf-8?B?bThpT1ptOUkwR2V0NS9BR0wvZFhiUUg0VE5vUUFCaDlIQ09TNU9zNEh1a1hr?=
 =?utf-8?B?dEdDMTFCUGNTYWlzQ2NMU0hIVlFhZElaWkl4SG5ycHErTDl4MVhZMHhsV0Zo?=
 =?utf-8?B?R1Zka0liTnVWdHk3OWtMaWo5b1NEaGhoRURMRzVEQW53K3NrN2tPelJWVUl4?=
 =?utf-8?B?NjZCUGNxYUUrT2pZeGlMMkdaK05Db0JpQWdLMjVpaVBCL045SHZTOURmY3ZT?=
 =?utf-8?B?ZVNYMnR4SUpzemlOQ0NENzFQM2M3TTMwMXliUmc0QUoyQnI5Q1lKVFBoaTFQ?=
 =?utf-8?B?bitmUzN1bHp4NFhUaEpjbGxLN3NQampYTnczaERqUmIveDZIcWVHMUd0dmFu?=
 =?utf-8?B?NGxKbFVKV0xmdkNnT1dWQlRFQlBBRUFhcWg3SVNGTzB2c3B2ZVg2S2NFSzhZ?=
 =?utf-8?B?M1pYbWlra2JVQjlUTDYxRFpKa1NZUFZwVjJoZStwczhNMWRET0t2REVTUXNR?=
 =?utf-8?B?N0R4bDNwdy9pbVBVd3dkM1Rlb1hPUXo1a3MvK01SQy9jc2pBYkFhYW5UV1h6?=
 =?utf-8?B?Z1JkSTFQR3VJS3NoNjZYMDdXRng2MkNHMCtpOEM1cnFhRXFZRVo1aGR1NWlQ?=
 =?utf-8?B?OURHU09Dc2FMTnF4MjhkVmhnbXVqM0tjSjIra0dTbzFFZko5OTdVeCtiSlNS?=
 =?utf-8?B?alJuTElianRIRUtsV1p5RHdRQjZNS1dEdk5GMDlDT1ZWSWV5aGpYTUVKai9R?=
 =?utf-8?B?MWdqWmI2OUk5RVg2R3FBVGhYbnMvWk5SZVIrZ1Z1L3lpSkcwVzhqenIxZDBj?=
 =?utf-8?B?ZTBkMDVxbng3VGRXdnpjYjcyakF6L2Ywd2YwR1hYNHMwMEs4VW1sd0xMWHJn?=
 =?utf-8?B?S2tmbkphUkFuQ2I3SGlUTWZXZjg3WmlqSmFzSFZIb2pUMWVzVGsrRS9iSjRz?=
 =?utf-8?B?SUNkc0xlZWVVQzJseloxY1VQS1JVUmo5R29zdlFjSGF2d0QveXVXekt0b0lP?=
 =?utf-8?B?SWRmYkVVMXlMTU5nbVVBZk8yaVZwRmYvR3JzY0c4ck5NYk85YnhOcm5DL0hJ?=
 =?utf-8?B?YXRFN2l4TS9xSmQ5cVhTUVAwWFlRNWlZT2FjclYyOHlTMjdtWUNRWml3Vzd1?=
 =?utf-8?B?eHFkemJ4ZmVDMFRqRG56Z2RSZytkZ0ZPSXZXOWlHQzNSbUlHTkJrUjAzTDdr?=
 =?utf-8?B?cExtbGcxeXlhS1djSk1yS1FUaFNaOFVXRy9QZ29rN2lxVWRoNVJqVllraE9R?=
 =?utf-8?B?NkFjUmpWcW9GUGlJZmVkVlRxNkFKM3VudG5GWTZJR1JET3ZPWDdwSVJibGtk?=
 =?utf-8?B?clN5WHlCV1FTZTVQTlJqOWQzeFE2VGlqSFZYNW1tc1VSZSs1YzhHdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243794f6-ceee-45e1-a149-08deaf41694c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:41:00.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /S0UqB8m8FHioT0HOEQ0CcgZDC3C4vgvSDFW6mafvt5/39QShO+AHP1gFnzkEkAXfyyaRTWzZanFKtG2niDM6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10030
X-Rspamd-Queue-Id: 78A1250B63B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61074-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
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
      media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

 .../bindings/media/fsl,imx9-csi-formatter.yaml     |  87 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c    | 776 +++++++++++++++++++++
 5 files changed, 886 insertions(+)
---
base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


