Return-Path: <linux-media+bounces-51385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DEoWGefscmkOrQAAu9opvQ
	(envelope-from <linux-media+bounces-51385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 04:37:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B970256
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 04:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39423301859B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 03:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64EE2D1303;
	Fri, 23 Jan 2026 03:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x1xKpPAt"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67F355050;
	Fri, 23 Jan 2026 03:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769139423; cv=fail; b=MOrhLKIQdiJiaz23QljI6fUSYM7T58kksO7jn93wdEi1XUSPL8gIWsCgi9OAgjARD3eQDH8hmAO2hfULeWBpU2FZh9x/9+DvI50lYRHDjJHAP0aqlWhXL+npuzb3JsCOHb4vhzwC3qyrMhVdFL0k2ET/rnlZQWjXjxttlMuy5K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769139423; c=relaxed/simple;
	bh=F1zfWZdG0W1ytD8tUtpqvqGkWCCCm99DbrzOZbBDKKE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=IpUNjj5g/1sIbINsPqWe/rPlH79BDsBuztGxIc0SiU0Z7mLVua5KosKLzjdLROYDixX/cMxzuyX5SZuevkmUHgq87bRYVb6Nqk2V8A/picBcLhNHQX4B1vuepUK6GUuqxWffdwCheY+JPKkfBGICMlmWpyJDd09TTThLaOxUBUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x1xKpPAt; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2tQPTE0tp6JtACMiZNRBPtQweYClky98bbcVwpYekNsisW0JWYMB0GcaHKYYlL3awuMlqygLG7W891zbGHtDoePfT+dRP48EkI+G+XsB5iCoFdT4WHV9P8Gopv4YYLnLJ2rG4RMVXFMkM3FUdoA/jScr4S/oxzpKJd5s7ZGNXogvprYEMupJkdZQvD4hTl6Ks4oGzqHBvD8rNUJtSL72d50jZbjKy+tnfCDJviemnpx4HF/SKQKKxwBZKwrC4U6BZbnJdgNEjm6V9xCoY5N0CGmFRkOaN3QHZ64jxw8YXBpKbBRBiTlbzWVYlHYMG8+kxWXTCi48d4PR+HWcRAZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bUPfcGNZUOpgOteig7ud1scd8XgJ5Vi/zV/lbw6KHM=;
 b=h0VJDA7OUGyZr0n9xVavgfQk4XH2eK82QnCss4PEMONsbnJfwcK+5sI9sBJvFJWR932ZQmY5fW4/M3Rj4AokZJqLLNBx1Oacu35daQKaiePMlf/A8gjjVGJDpMtyEX+5+xEhS5opte/AwfXuPeNfowND59lShnA/wtURsKFbhr+3i4c+G9tFvzK5Zeq+do8IP0Z9XZPV+G63NFths3wDWeTgj5bAeTzbPhVeBLoJgbjaIq9Tj7JSDk1m4aWWeuZ9tR5Hj31qYfgzZ2htTFfGFfL1Vt/PQJtrQva0IXSx83Tvqq93AlrVeg3zoXVmZT0Mhkc2Eq1xEkkQMh+SQMlM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bUPfcGNZUOpgOteig7ud1scd8XgJ5Vi/zV/lbw6KHM=;
 b=x1xKpPAtwBe/fwwah6CsknQU7tAiRKYhS4AaU3wSrJHGNAro0GO7or+p+GyA5gcfxL4zZxH8MByHkuLQz4vASH/mW2/a6Sk6kWegctmL6j4dgAglfzbH2x+Eo3zGvEEqNoeo5rsGJOpsG4F70l14P//MrG9Ekc/OOpp+WQwJmEOmHkjZThSjvyAEHW7T+biYuxJZKiO6mE4WqD412HiPAZjU3yIe05q1o4HpTX0pYN/q1M2+FVhCXCGnb1abXgsfBmwg7ISuGHrKOfoCI1c0ZSvMSburot93G6XNrU7x8RYELaMKCqGWaKN7Rh6Qezwn8SZmn+gCURgKUeU4YeUE1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 03:36:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 03:36:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 23 Jan 2026 11:36:20 +0800
Subject: [PATCH v2] media: nxp: imx8-isi: Fix potential out-of-bounds
 issues
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-isi-v2-1-0d03b8097f86@nxp.com>
X-B4-Tracking: v=1; b=H4sIALPscmkC/1WMQQ6CMBBFr0Jm7Rg6kKKuuIdhAXUqs7AlrWkwp
 He3sGP5ft5/G0QOwhEe1QaBk0TxrgBdKjDz6N6M8ioMVJOuFREWA7vW3jo7TfdRWyjmEtjKelS
 eQ+FZ4teH3xFNal/P/6RQoWnYaCbdWtX0bl2uxn9gyDn/AWzIDIOUAAAA
X-Change-ID: 20260122-isi-74f87fbb9a6f
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Frank Li <frank.li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139400; l=3910;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=00TVgTGKW5d8Ko+WL1Hlqykufz4DsHx6G4ZWRhC5Co8=;
 b=tF9/dQwVUtDGGEwSIxxmcFWsRwvD4i6bt7XKivhhT6pSLpuNOkvEQyy5fN5GrHI3jx07YWMVi
 1VRv2r8PxvSDzEWowuJObWs7RJx1TqW0m218m7vesiF6QF5li4Es0Uy
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: e4314ec2-c118-4582-b291-08de5a309fb2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eU8zVDMzcGVUTS9vS3VoWVcwTTZkT3JCTVlpcWlhZkIrNnhaSlMwdHR0bHBT?=
 =?utf-8?B?S01GSnpIYWYxcmVCQ1JvZm5mRzBnam1KREhOaEdnTlg4OFRkQ04rVDY2VFRm?=
 =?utf-8?B?UDNQeENzU2xPL0lGY3BzR0lvTWdXOU14OW44cTc2UmtYNDZvL3d2TkFndmpH?=
 =?utf-8?B?MnJTR3pxa2tJMC8zNGUwZVJ1M0ZqYlpncEl0c0pkOHQvZmtSUGVUMytBZmsz?=
 =?utf-8?B?cjJuWHpFek1vN01adkowQ0QzbGh3c2xsbmhoWUwzRmppRWVqWHA4c2NnQ0gy?=
 =?utf-8?B?WEV5WmV4UHhSMTBIWGRGeWNTVVZWTnRxUDFuMllvbEJsV1pnTHlTZnZsemU5?=
 =?utf-8?B?YWpuQlZpNTdjNmxkMmJPM3VNNUxxV0ZSUTZlQll6MnlkUVhzbVhaN0tvVE9E?=
 =?utf-8?B?OE5iOTJPNnRKeTdBMXUvQjhxb2hCY3pmbldCZ0lVSnIybEhUUnpPeFZTUU0x?=
 =?utf-8?B?RjJCRUZoOXdJNm4zTVhSdW8yZkJQQ1lVQS9wdHo2WFprM2g0RTd5ZFo5UktX?=
 =?utf-8?B?bXZlVG8vSHpjTjlQRFBoWHlLUHB4bE01OUJCdVdvSjRGTjRSdFdWc1JjTE1q?=
 =?utf-8?B?bEw1VENMa3I0cXAvWStEL0p5Ly9SbGo5cVh2QlNRZ2VKdVlaWkFaY2s3c2lU?=
 =?utf-8?B?Sm1pR1hRS0hLdXFuZ1VFUWNTS1YweXg0bWNHZ0R5Y1NPRlNFckhKQXpGSXZu?=
 =?utf-8?B?ZEV1TTZZa2ZyY1ZnNjdDQUxkSmMyL1Z1Rm0vNmFXdTBoVzZtMk9abmlqOFpn?=
 =?utf-8?B?ZVcrbUhoTFN4MDlJbzMxYktMbzIzc3lpeW84dTgyZDMwanU3ZjJubjM3aUFz?=
 =?utf-8?B?bEVpLzB0QTFGbUxsdWt3MDZ0K3RndG5NUHM3OVlBOGZPRnpFdTlrcTI5SlQw?=
 =?utf-8?B?SVVVdnlsUDB6bWhqZUFVOGc4TDB6aGJhVXF0Y3RMVFNRaFZ0bzV4ZldEWFpa?=
 =?utf-8?B?TnFHZGJ3TFN3cjUyUEQ3TXN6cEpoYXNkcnN5ZUpQM0plSFMzSmdFZUJjOEww?=
 =?utf-8?B?akRtOVpPNUV5RUphUmN3R2ZNcnpTdks3V1hLVHBCQkhEd2lWV2xjMWZWOFdT?=
 =?utf-8?B?VXBQeGlIL0RyK0kvaGhxNTlKOE0yckQ1MjloR2J6d0RWMHVSLy9EeC9JQXVP?=
 =?utf-8?B?aHlzVFFoYUJnUHVNMEZFS2UrOGxFQ3pSSlRUbnczQVl1TURqMUE1cktpUGtV?=
 =?utf-8?B?RER0T1VwVERVNnBUTDVMTk9wVkRkUkxSa3RObGdBMTZXUGxqSHNvWmNib2l4?=
 =?utf-8?B?RzV2TWNyaGdSd21ReFh1NUVBQk8xb2RRaU81bjczc1lEelAwL1AzbUlwR3l4?=
 =?utf-8?B?K3BMZm8zczRCZVRLbDU5UXVFRGJMTXFKU0NzcFFvMUxRa1RMY0lmcjhpc1k1?=
 =?utf-8?B?V3RNT2JEdG1tM2tpUU5UTzk2THFZLzJwblBpY3djdXU3ZlY5OGtodmxmUElH?=
 =?utf-8?B?c3JHcEhveGhMcVhhN3QzSUVlcWhNbEZJRUszdXFrODFGWW9zUEJOYUQyRkxm?=
 =?utf-8?B?MVIvTThRV0lReXAxLzk2MCswQUdESDl2RzJSWmM1MWwvcFBUQkRJZ09PT0tq?=
 =?utf-8?B?Tmp0VXNvWXUyWnM3UkFuYnY4a3NyQ1dFaG0vQ3g3ZUxBakZ1cjhZU3QvSFNk?=
 =?utf-8?B?QmdqU1I0Yy9Ma2RmN1ZMWUtCdGN4aEd1YlFIanYrc0hTQThvZ0tLaDNNWXJM?=
 =?utf-8?B?TlBuUWxPNXVqRkw1SHoxZ2cwbXBmWStRZWdPYmxhRG9RYWtKZ0RQb1dhUHUz?=
 =?utf-8?B?TUNSRVNxNnRIUWt6SDFlWFVVUkdIWnVVSFdUVCs0cDQ4TFU0UE5vdnJPbGxC?=
 =?utf-8?B?MktzM1N1UkljMytKei9aemU3MDZIQ3dnUlVyTFRVbUtpRTVWNFBYWm51QmR5?=
 =?utf-8?B?ZzBXdkFkSDhnWnF1YnRXd0tvZWIxeTVqM1NhWEhEMlU2Q0U2dllvOXJMZTM1?=
 =?utf-8?B?NUltSTBHQk5SMGFXbFI2VkVaUEJTTE1QN0d0QVhYb2ZzZTV0TUxZcXFLck5Z?=
 =?utf-8?B?aW9mUkdvcHZxN1NjRHJtTVlWMmpHSlBMRjVOZlZ1L3hybno0SmJKZU9ZdEIx?=
 =?utf-8?B?Z28rdXhnbTh3bHc1QlhsWDArTW5vd0VsUnI5UkpEK2pPVFdlV0ZYREhsR1lL?=
 =?utf-8?B?TmVwRm0waVQwSEhjNkRSM1FEam4yNDhCbW9vcFVDY1ArOTg1NnZhTElzSEty?=
 =?utf-8?Q?tO5mc76ffWojM7UFRgW/TsGbh3xrzA5MKW6N26/+nBWV?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ekpQcVAveDM1YytDWUpCZ0N1bGR3MWdnU1QyYkxBWVpobHo0NmJmeVIvSm5U?=
 =?utf-8?B?bVB3RFVpNjVCQ085bXlpNWVBK1hiWU43TDFGd05kem5NdnM2dTJrQ2xtNDJL?=
 =?utf-8?B?TXhaNTRXV1ZpMGJvQStTd2ZkVWw3Zy9KVisvNTUwd0Q3QUoxY01RVFRpWjRu?=
 =?utf-8?B?SWd2WHFyVzI4REJXNXZoalErOW9JUUd5OVc2OUZxTFk0MkY0N1A2MEtxWjc0?=
 =?utf-8?B?eVlWR01VZXhOdkkzNVl5Ynd2bDJkeUlCdE1vVkpvZG9WODRvdFVWNllRRzhX?=
 =?utf-8?B?TjVRZ3FsamJiM3ZGUVlUUFZtN3lVOFNKc3lpekpTR3FCRnlYQ0ZTOFg0ODA3?=
 =?utf-8?B?a2xFT0xDUWFHU1FGeUxrQkJuOTBGcTZ5Z3NPdmZmVU5haUgvc09tUTRNT0kz?=
 =?utf-8?B?UUV0YmZ3RGNWWjY5aytsNERqaUZ0Q0M5bkU5QUxwMlVqREJrOWd4VE5abHF2?=
 =?utf-8?B?YzNnV2VoR0JhTlBkR1NPQkhqSlNkMFhqemdRL3A1MXdpWlNkNGZ1TW1Nekp0?=
 =?utf-8?B?TXN6elRqOHp5VjhsVzNCMUsvVmpOcDZ5ZlJtL0FFWUQ3RVJwWkNFWGVoT0l1?=
 =?utf-8?B?KzV0c1ZjKy96YS8vY2dCWDhYWE9RUWF0RFZBTERYMUMxZ2NEbWV0MmM5c3FL?=
 =?utf-8?B?dTNRM216eElyU3FYdGExd1hjcGMrU1BKcFplZEpwMk9aMTJFdHc0cHMrSkJ4?=
 =?utf-8?B?WXZSWTBQYk92UGFCeHpTNHZ5bzJYalRNaUlTRkJwU0hCOFRjd2dCOW1BWDk3?=
 =?utf-8?B?SU9acFhzY0tJUU95NjJJOEdMei9lY3UveS9FYnlISVAwM2V0K0NwRGVtUXpo?=
 =?utf-8?B?K28xL1plVDJLeEIreHMvWmpHRXdkRm5PSVc1UWh3NzRJMUFxR0loRG5WeEVX?=
 =?utf-8?B?bVU2M21JRllUZDl0RGl4RlUrR3FZTkhHYVRONmFFOVJySFlCczNOeUhWemdK?=
 =?utf-8?B?YnRURWFEcUMrZ2JCL3dKQmpkeDcybmJKdW0xNUVyZHRmRzNSaVV6T05LUklG?=
 =?utf-8?B?blFuZk8xVmJ6R3FjVU9YZ0tDb3FGN3dJSlVucWxLSGZHdXRLVHRHRUlBaXJF?=
 =?utf-8?B?aENFV2E4ckJtMkMvcGtIYWRnTjNMRURUUWNUV0VsZFBEQXhSRVozR21VOWNn?=
 =?utf-8?B?U3VmdXpPd0hqV2ZKOGlGV3J4czBhenRHdTdodFdiMzBXYUJxZzlXZjB5YmRj?=
 =?utf-8?B?clArY1RXdThYUkNTMU1tczlKN2VZWlJPRzlocW9LNGNjSDBycXVMUHNPQS9u?=
 =?utf-8?B?MXh2QmhQV1dUUitRZW01UVhPODNMZnRiSTdvYjRsdlphaHd1NndCTEhNeUgv?=
 =?utf-8?B?dXluN2ZhdG91YVBrblZPV01iZXpNTlluTTlsQThFRTJKSEwxTGtNU0p1Y1BS?=
 =?utf-8?B?OUw1RVdUbGQxMWNid2JVZklXNmJXZGJRbGtianJBU2tBNWE2MHh5cG1iZWtt?=
 =?utf-8?B?SWc4bWw4aTJVc3c2Y0tZUWRQMzEwWDMyd1J1ZGRDUVlQYlN4KzhsRGd1RTls?=
 =?utf-8?B?Rkx2VXBhK0s1YTZHZVlyZDkyT09OSjg0d1ZkOXRYWXo5dFJuVkxsM05tMXEz?=
 =?utf-8?B?SzZWNmNWUjRGWHBlbXVYY2RRN0xLRy9YZFF1MXdNRkFsYWp6SjJ2M2FESUlm?=
 =?utf-8?B?cDdtZWU0ZEt1YWpGbVpySW9uUDYyYzF6d1dmdDVUUWVVdTdoeEgxbDBIVTRG?=
 =?utf-8?B?M3o1cStEd28wWDRsSGlINlg4ampLcDcxSE1QZjcwMy9YSnI1dm43bnhVVVFS?=
 =?utf-8?B?ci94aEU4SXo5TFRMei9jOFZaMnJQSTNROE1TVkpZaHZxdTMxMjNJZW5kNHRR?=
 =?utf-8?B?eFdJeDhiQ1RIYXJWZjFSZDd5cER3bzJWQjBhSUk3cnF1L1QzQTJoVDN5QzV5?=
 =?utf-8?B?c0o2cVh5Q3UxZUVOUDRXMnQ2SlN3eTV2WDFoNURkVytEQ0NxSFE1UWZhUE9w?=
 =?utf-8?B?KzE5OEVHUW05ZmRsWTYyRGhmRE5SdG9JYzYrVXNiMDNpdTdEL2RTU0JoR0d3?=
 =?utf-8?B?RTZ6dFdpM09tM1hMY0UrYkJYK3NzdWlKRHBhdU53VUhxeEI3bzdyUVVMaGox?=
 =?utf-8?B?UGlRc3FDdnFxaE40ZEYycythZDVKaVZubnppekMwWUZSZ1RTRmpab0lsRlIz?=
 =?utf-8?B?K1RHRWwxWHJqd0NvemVWOXcrZCtNK2JPaEVTQ25scXlQN0xNYjdnUkVJem05?=
 =?utf-8?B?QTRNQjFjdkU5cVdzTGpjK01VV1J6MDRjZUk1WVdKSE5LQlBBOUNkQWtzdEdv?=
 =?utf-8?B?Ni9iRi84eU5Yck4xaVJYaWtydW5vVVN5K1F2aW1JbFZLRHAxcDFFRlpkYjBY?=
 =?utf-8?B?MUlLQVBubXR1dzNEODcydXh1dFI3N2owQ0NYa3c0Z0FyRzJMYUFYUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4314ec2-c118-4582-b291-08de5a309fb2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 03:36:41.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLcLKW/lHxdgzZZ7+4cFrmId0rjtCxeOA3uHpC6eFNAyLXHlNRP19sYU1PIKQRA1+eJf8Hky5x3vn4lyuxWADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51385-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: BB4B970256
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The maximum downscaling factor supported by ISI can be up to 16. Add
minimum value constraint before applying the setting to hardware.
Otherwise, the process will not respond even when Ctrl+C is executed.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Fix possible side-effects caused by 'max_val' in CLAMP_DOWNSCALE_16 macro.
- Add space line between two paragraph in comment.
- Link to v1: https://lore.kernel.org/r/20260122-isi-v1-1-c3ec6e264f13@nxp.com
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  |  6 +++---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  6 ++----
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..84e134f4d5fb26be652ac3e6aecd459bb2a0d1c6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -59,6 +59,22 @@ struct v4l2_m2m_dev;
 #define MXC_ISI_M2M			"mxc-isi-m2m"
 #define MXC_MAX_PLANES			3
 
+/*
+ * ISI scaling engine works in two parts: it performs pre-decimation of
+ * the image followed by bilinear filtering to achieve the desired
+ * downscaling factor.
+ *
+ * The decimation filter provides a maximum downscaling factor of 8, and
+ * the subsequent bilinear filter provides a maximum downscaling factor
+ * of 2. Combined, the maximum scaling factor can be up to 16.
+ */
+#define CLAMP_DOWNSCALE_16(val, max_val)			\
+({								\
+	typeof(max_val) __max_val = (max_val);			\
+								\
+	clamp((val), max(1U, __max_val >> 4), __max_val);	\
+})
+
 struct mxc_isi_dev;
 struct mxc_isi_m2m_ctx;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index f425ac7868547da401e86ce5a9b70a9890e72541..8860d89713667d06abc94e6024526fabac46feb7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -509,9 +509,9 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
 			  const enum mxc_isi_video_type type)
 {
 	if (type == MXC_ISI_VIDEO_M2M_CAP) {
-		/* Downscaling only  */
-		pix->width = min(pix->width, ctx->queues.out.format.width);
-		pix->height = min(pix->height, ctx->queues.out.format.height);
+		/* Downscaling one-sixteenth only  */
+		pix->width = CLAMP_DOWNSCALE_16(pix->width, ctx->queues.out.format.width);
+		pix->height = CLAMP_DOWNSCALE_16(pix->height, ctx->queues.out.format.height);
 	}
 
 	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..c3ffc8a38d1269c0a4e6493b4d75690f01cc87bb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -647,10 +647,8 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
 
 		sel->r.left = 0;
 		sel->r.top = 0;
-		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
-				     format->width);
-		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
-				      format->height);
+		sel->r.width = CLAMP_DOWNSCALE_16(sel->r.width, format->width);
+		sel->r.height = CLAMP_DOWNSCALE_16(sel->r.height, format->height);
 
 		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
 						    MXC_ISI_PIPE_PAD_SINK);

---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20260122-isi-74f87fbb9a6f

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


