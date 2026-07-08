Return-Path: <linux-media+bounces-67075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ymkHAqfKTmrSUAIAu9opvQ
	(envelope-from <linux-media+bounces-67075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:09:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714372ACD0
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:09:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=d82Xug49;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67075-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67075-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64A9F30166CE
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 22:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B325A3CA487;
	Wed,  8 Jul 2026 22:09:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6E233948;
	Wed,  8 Jul 2026 22:09:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548569; cv=fail; b=ATNTuYCNe3YDypo7sKXcfuHFgAWIGcKZ0AZmwCQXpqXrZJ1qtLbyLA/oWPnOtqq4RNlI1wuM+95Oz5SdUSGKydpjXqY0XG55+GifCB50XD+bPi22tfH04cb+fpX+Ejuonzpwx8vAuzF3Q4N8GYMxuqnk1Hven4VeiH4BNUrVQR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548569; c=relaxed/simple;
	bh=MzZor2lY3E839Y4E4xmpjp/TJykQtCY721a8HlMSQw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sXWjIWpF4giZMq1m7eC512oRz0vrcoF9mOowUH0nmBMEHuYcthJPDuRh6d1UsUhGM3CacPT5qheyrAJaQphy+0Dxv7IjCeJZOO0iKEwKflbA6BmRDf7OHooE3NbKjXjsfKF8w+SZh+NQZPPVQlOz6iD325LDk7zE1AHgHl0XEdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d82Xug49; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvbR+VX+a+mpbz50YRbQuSnJxSUGde/Z1jD7CPnzuNjLY8T/o8/T9tQr6/8xKN8Myq+/U1V1jL01A2apzJ6oy3XubCCVb8DVY0rMv2ECVoVwj0Ei6R+ihituPmtHy1Ycv/CTCC0u3oLX3is6feDZsDKAXsSBBujPJgnoiDIU5bzEi2wIRaETq+S8gkznEZPG6vmRN31heAY0cU1F2JzMNJoSebEO32v2pAD3mKWkFmOCsTc72YxzjimH8IpwDBK4s1jHjHT/a0U760BUK4BRvw1tg2COVjMmceQrVc6i9YEA0XLC6UlCmXjlhN6SW4XfXeCM8q99uh7iSWZFn/jMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cIOpYdx8X/PnTHBqfGB60HrS3SqqQW5c2M8cng6bwM=;
 b=Z3t20ygGZj/O77HzJSKKwaRt8hAqALgkcCvCgOHGxHXCJPUjoY1bsA47K8EqT2+hquaO0JsRhs/1Oo2aKsonupH4+iJvm4K5l0NqfidDWUbYdNTVCHTYRZzDKkxIy3/ObvYlZhAoukArSRgVGjU/cEPLuLeZCO/BAKdl0pB/OIPjtJtu/KNSDGQYAXydjchGDA2YL0x+WWIRnrN6q2PDckaaZr6skkQa4D9OG6kcnx98pV1EPDpVVjCgekGfK9unC5kKqwZpP6s+blQZgOtDSkThK/6gXdmKD5dNAu20UYOu9Cxy5lO1H4q+MvXYZ1PYv2Y8b1fXIG7KyrWsDbO0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cIOpYdx8X/PnTHBqfGB60HrS3SqqQW5c2M8cng6bwM=;
 b=d82Xug49o+c3nAQUv5hIq2j3vcha498EHfg/2Id5KxLTcW6IXJj2Be8cI8vtFISP1vKA5UZ2b6DPZSoZ3OaGRyFILFjam5QQPJlRzWnWdAgLXik42oPfUpG50PWAVQR4xLhoXHTPq7/SeVXEuRFcVwFaJJedXs4aRrS0tHsKYyTLD+1zFY0LOvU6OcY0Xh5GtdcZEkGf/TRQL+6qmF0dPO2SS+m8IiLZbEItqGZmho+vjcuns4erBMr/I7dutOgpLrXn+O3DebrUtTVMbnBLNdEI/dpi70Q21VfdtucAM2OzEY+77UEzhkP+mFZQNLOHsmnGmvGeehPJY8xgTb8LZg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9880.eurprd04.prod.outlook.com (2603:10a6:150:119::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 22:09:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 22:09:21 +0000
Date: Wed, 8 Jul 2026 18:09:12 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <ak7KiHpkQFghDZzj@lizhi-Precision-Tower-5810>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
X-ClientProxiedBy: SA0PR11CA0171.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0785a38d-4b36-4d30-cf2b-08dedd3d8ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|23010399003|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	neePIr/rCURo+4bROzLd7rS58BrcR4kshP4xksrYdZ5/ESWdBsyMBAOZca5ZrM3kS4AUPQDJZSWwehtzQAZ019dYYpnQS0hpuEixpI/UtdQNTJLWcQ3jSdWzLN7UyTJkmNlyZQacHtauTlgvHsoH6vouUyBx5WCMALmfwVep711L9R/blFNs/0hz3j1LPELKDoMG+B2UCM5ovKjBGt/HfYj8bnTcsXzwNMM3bobbmtjYO8VA0OFm9TlznW/KGTAQg28vZkmHZ0HUhJoIjHEuHw3ha3Cb6cMQkurVqC57ieyJKWqTia1MJ++pkL/VnovrrC+nrB0XNr+JKZjvh0HyzxFqi5h7mGZmbMrMsIIPc8mT9C5GIas6e+jsVtTKhQuaN+Rb0AX/hHmW0aT9lGHQbsfwW8E4szPsiawtAo08oTu68WcBYNuzQvSi9LUODUHQNBDM/Yok1Wxz/0eITckzuJjxrmdVx9qRhlR1s3PPn5udDqLnyuXkGo5khyYpcAHvp8At/XmtHHmsFAU6gGcWtMbkuXS3EqVQmRijmXLZuwEbRocTzq4P/VzVF09WJMXD8xlCgnma7fxYKrhi2NikSoJrY7Dved4/y0Y8Nf3l7HAEM1Z/LupzLYObTwbsJao8hKGOM9HcyO0lTmbmZBgJgjs3jXKwBanx6Te7WxV/Hsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(23010399003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTg0noWchAaNuXv1m2THl8sYWf/v1THjxeGBDpFMRLQ1ZcsQ+xogng+xvCQ5?=
 =?us-ascii?Q?z3FVwHnC2I4rnwoEoRjSBAyuVjH3zRuXEncRUyUwrjahZP2Dz0jX4jkFd/+6?=
 =?us-ascii?Q?ykFuiMiKu6YOXqplld50prM1tws+rBTVvfJJpz8oiaxiMEPmvh2SAVsWIAa8?=
 =?us-ascii?Q?eWo3/9QejX4UEiNVUuUcMSLZK7IppqFra2JkztqOisD/pWr8bdeayh76zzwr?=
 =?us-ascii?Q?Rp1JkiRetOSAL5DqdIY8ll4IECepPl99xIn206Fy/H8Mg5PARXVy3twg3VyB?=
 =?us-ascii?Q?zNkzKmtv5Cn+9TXUjqoJk5Sv9wrbqVv2xOORJUFMfW1rFq8riVRbOCu1Mijg?=
 =?us-ascii?Q?Jz6SJ+98b5T6zGt96clt7imDBBCpo6yVuSSgyzHSXoK1q2GsBLDFKG14n2kA?=
 =?us-ascii?Q?yOGOybZ9GsHEl8XNSOkQ2IRs6XXbfkGi1MSGbQMVqo5EQS1hya+CYHcRDOZ1?=
 =?us-ascii?Q?LcbSlui0tpvVRbXMiojJ1QHiTyN5IJaXH4ztAFUDhkhDff/BThe484jDdZa1?=
 =?us-ascii?Q?/8Hb3VO4tXkHMsN733mqyaIGXdt1v65b37Agb++0SLPsu6guwtuSI+M3Rgl3?=
 =?us-ascii?Q?1FEax7cs9twmPNyFwrunZT0qiiNLWp0Xx52PntwHFgmClN8AdyLia/Yv/nC6?=
 =?us-ascii?Q?ATSWQE7q8bQtM94BNZghWlNms6twWFDmKKUIslRAtuU8RTx+Qcru5wXRTIKV?=
 =?us-ascii?Q?zH5j2QNytdb28BsmxnVeoWSWYxAo7k2ae7t+BBdCltqowHtyPGTfeaHQ8hE3?=
 =?us-ascii?Q?plMON5DYjsy63S92kaS35y3SWdYVhsE4dIrMA9uTU51nJzcj/bKEwxUMc4ke?=
 =?us-ascii?Q?3OnlDagRwVqRMVkvV1JRgBDVkkRcIWNNUm0p/z8z9dW0yT2X3jih3eyp9Bpk?=
 =?us-ascii?Q?TVRg7tg+0+zwjIdBiD1fbeOzGxArk/KfItW8PMhTDrY5jKgw249YDPeWtb6R?=
 =?us-ascii?Q?avX29nLb3C4lAuwMVkEs0yMK2OGhM236/QB+wfd69QgjdFnAFspbans5yIMi?=
 =?us-ascii?Q?X7jNrUrGsjUpoNdgn8B+XnJRpu+a3QtT1pR9FcgCfHES61rflhZjHMu69aBR?=
 =?us-ascii?Q?wLm9gxwuu0f2IFkThOAvZgH/hbJSDhaFPwnaDrm9rUL+joulwRTAPORBpGCu?=
 =?us-ascii?Q?Y2V4L+OwsIesR32cCV4ygG5tmQ94HIXSxCW0ekcIECuYkftPQzmuF57ArmbK?=
 =?us-ascii?Q?9jkCeT9+tlB1BUBlx0vpdc8wv7bgEhw9b5aYuTijIcVeWq04idmU9CJdZe7A?=
 =?us-ascii?Q?CEFvefRRmVVoZAt29nGA3uKWScAQpwnXH8fSyUr+cNBmJKTuO1n3JG/77jtH?=
 =?us-ascii?Q?0dz1G2o5fHRF8PF2oeRBwKQRMdP5YrvQqXvpaaMmY7VvvgICcUraua/AgOh1?=
 =?us-ascii?Q?Qd4V+KGWosX5k9JTfHR00LvReVC/z1U8FjXgv05k3WAB9PXqhnP1TaTiBxpK?=
 =?us-ascii?Q?dRAFlj0a+Sl6rmAHXuWy/cTTLZDGw/B+qnRhloVUJ8EEsMlPQqlA6hMkrRHR?=
 =?us-ascii?Q?Zx9mbS41kLZtHcih6HKuSnD9ZXVKtwYZIU05e/g6PxbSPpCgBodaIriyzDoc?=
 =?us-ascii?Q?727AkMrl/czVxy4nzwoA1N3o7X2QRdpBG2zsJcMapyZ1kWgOerlCgD7+Zhvs?=
 =?us-ascii?Q?nkVsutCnRb0NiGL4k3j22wKINdMu80SqoYTCNiCRoPOO7sC0htU+fS9fMnur?=
 =?us-ascii?Q?8adqTV7W3P3ecac1GDWKxsd8kAtFqxtGGUjoim3gVojd/AjBrMjZLBRZcD/G?=
 =?us-ascii?Q?GgWlTZSRR53iZT/B54eucUNK9DDx3SuUrfyg4oLuhG6L+L1nzU9C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0785a38d-4b36-4d30-cf2b-08dedd3d8ff6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 22:09:21.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZ8cCqZoavgtfQoP/wn29sbP93DAMpuqoDVRPxFcXnuyQgoc2+Bm9pM5+PPBNAxhJEuyNM725WDyIfoDLcUo3nvdzHCbKhryreuB1UZBUeu0OlW433U5zkKm5ehBd5f0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9880
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67075-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,lizhi-Precision-Tower-5810:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5714372ACD0

On Wed, Jul 08, 2026 at 01:06:55AM +0100, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
>
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..c17b9757b2c86 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -39,6 +39,14 @@ properties:
>        - const: vfe_lite0
>        - const: vfe_lite1
>
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>    clocks:
>      maxItems: 29
>
> @@ -126,6 +134,16 @@ properties:
>      description:
>        1.2V supply to a PHY.
>
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +

needn't "phy" for phy-names, just csi0|csi1 ...

>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -158,6 +176,14 @@ properties:
>              required:
>                - data-lanes
>
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

Not sure why phy need be children node? does this phy is used by other
controller?

Frank
> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
>  required:
>    - compatible
>    - reg
> @@ -171,8 +197,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
>
>  additionalProperties: false
> @@ -184,6 +208,7 @@ examples:
>      #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>      #include <dt-bindings/interconnect/qcom,icc.h>
>      #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>
>      soc {
> @@ -229,6 +254,10 @@ examples:
>                          "vfe_lite0",
>                          "vfe_lite1";
>
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
>              clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                       <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                       <&camcc CAM_CC_CORE_AHB_CLK>,
>
> --
> 2.54.0
>

