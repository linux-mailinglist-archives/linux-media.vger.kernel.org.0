Return-Path: <linux-media+bounces-59365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPDhKW7W6WmglQIAu9opvQ
	(envelope-from <linux-media+bounces-59365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:21:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E744E727
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C430630091D1
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002883BD631;
	Thu, 23 Apr 2026 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jUEewTzG"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7F371887;
	Thu, 23 Apr 2026 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932452; cv=fail; b=HkLlAE4rUXfO7y648fWFiudO1VCorM1sB5Va6f2v/5p1bu8jOTHML6UwGExBL0um3dEztYs9nbddPX0B7rrEV5Sjzi77pNALcKXMcU1WsQ50DQjNqP9dtgwK1lmJax/4EtLmYnIjXEEML5bQHW/T+uN17WwDr3XiEke/OE+bYko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932452; c=relaxed/simple;
	bh=85b0gJfRQSeLUrWu0Kjl18ZJuLyxOCXkeg39NR96Nzw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=uhCWhcMwN6/NC4ZKo+K5cQIg7dqOM+ZrqSFqk+iswK9D3GW1towvVY/TQvHeUjxRP/SvtGU2Fl2fJKUWKTeTnhOpkdPF5nyYKjZX9mLvNI1BaNs4xJcBEn30gvUTQp0+T+Ehg2jqponhpq9+XjVBVzAWV2e3ZkTBgGv798JwlzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jUEewTzG; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgHI11398w2ln0intr7zWUA7putLw+eqofe3f/aw4N2iwTPFO3Yc+xjlUtgm1Dc28oMdEiSAQNEokVSsOOE9GWlmDG9VslgGoTaOek+GJxNf2GRkqrmgTYpYyHxVFLEAyL2GZysX739IaETP2F2lcznKLo4gfUbwGsNZYMH1iYrwE9zrjDL2Recb5Y+U3Gs2lTg0Jcvn6Dr0ZvzcEBASladFslB/4jN68G4JQ+Dfp09Zx0wzxB9VWbBbJEDrplMbGOss41AD7C/nESNlyoe0htBzYBOXQA6iCLIdIHv+6yscMZDrSjatrr+dfM0bqsmnoqZIfopM8hQp915A1eDEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xVykDZMMxqcRbkI/OgsWF+lLAGvrt3jqKaNff6bj2o=;
 b=jQE3ZUokzIfJorfqMIuGtmwneHpgfWqZ6RZgL/JbjotXcNWU7AuuKtj9HgjoXfpK0vRKwfzfgkql7knruKSSOM40FotzkOyPdWqIP4lQ8Gpm7exxweeoA1/XT8SSG7bLPXk6ixkfrD5AKEmT2YHIzOHNkDI1vkx5fLOVgTXWnvUiNjjn5tLKKF1XrXCt3iFxRKLg6I5c571d1f8K4CPq4FPZbmE1DY9Lk+NKMbHmjoXFZdCB20zpx0WC1G5qvAfgMnkozfRfJJu+VnmBwAIT0yMJ6H8bSwl7BIVotnFE80HnfYbL8xMjA5ndJuQgInuvxohz/PdVndA2XH5uyWanTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xVykDZMMxqcRbkI/OgsWF+lLAGvrt3jqKaNff6bj2o=;
 b=jUEewTzG+rn2a0LjRUSoNkcMgLB1PlDtOXN97mmt5OYhZBK0YAwPaXRLAIQV/BjWWlg1Cr4nPaV6pqHujgB5NHzm14AJNByEbZcSFBvobgyyqoNyrkdlc8HcuGKYdpnq1+qWloj4qG0tRw5f+gknBTPiEUQic0l5fgpS/ItYUerABz5Gu7NvgLZ1qrJwAKETe8JJKzbTMKJM7b+78k/+SFWXxbWE3Nyc+LHpZTTDet6xTJ9pDjzbyyFoCYLqk+LeKSJqx2yq8qaO7lj+aXrfZzRs91q7iW9zmbz2ClS2jopFRweOaS4xsRISOcs3UzrptPe4x7g/SaUwk6VhlB4hPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10281.eurprd04.prod.outlook.com (2603:10a6:102:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 08:20:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:20:45 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v2 0/7] media: synopsys: enhancements and i.MX95 support
Date: Thu, 23 Apr 2026 16:22:55 +0800
Message-Id: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/W6WkC/03M0QqDIBTG8VeJcz1DLW11tfcYMURtnYsyPEMc0
 bvPBYNd/j/4fjuQj+gJhmqH6BMShrWEvFRgZ7M+PUNXGiSXmreiZZZQPnDJvWJaGcd9N+mGGyi
 HLfoJ84ndx9Iz0ivE92kn8V1/jPpnkmCcdU43U6P4tRP9LRDVa95qGxYYj+P4AEHtq4KmAAAA
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=2161;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=85b0gJfRQSeLUrWu0Kjl18ZJuLyxOCXkeg39NR96Nzw=;
 b=qCKap/RJYEOxyqm/ttxHFMPRLXM/ZnQMb05aRQJvQn6ycwj2be1oYwZhV9/VuQbEkUgi115Te
 /7gu3fQ/LD2AgiLXX/7iV8bbD+gbc9BTTfyd0jYme7/CTwuD5KkF1ws
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10281:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f71f765-e778-4f0d-4857-08dea11137b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|18002099003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 SsglkdLruaxtpGvUOACP3xhMZ0AYsw3qoDDkXdaBdjNrT3UJF9bF+JEfvWMEN4ZDdmlQQBSTR0A354vfwosigy4NxDSPmtGCsW1BRSeEfgUo9wTkM5/hx9OUz1OPdQ9ZHlWFM9Lsgms0ZylENq58sfL4DbkTAU83aDe1VR9vm7Ji5/Klci4/xEn86Wj42uhcGfv+Ti1EpriTRSJgQuJYKYwDKl3H9FWQ5fGcEUlw4sWchWKVSfC81GaRTseJJlQUMz+QLaSSETdsyFnyTCO2Pg2K2c9wYP3KeYVSMf8yrqfORbKyJxn+fQtvlCb75jspFOCMSdROpcg76oUcEqCOma4zt95Uveos4zArBqGu7UqgWUWxxeXz0UMlQd6c3262MquRGGAqndub6XcgKJQpshN/Ba/VW146jeE5JeTeqL25hA9GQFv6eW4CqIRrYmbGeVtQErMA2HnQsH3FgslF5TaeqVgiwCh1EVBnLVqDP7rsKL5MIhLGCc9MF9Y/y0RfCwj0tqZ/v+au0u3Rz7sUEcI1If22NqeOJNh817gsiRM0q1JEjni+Aipxbwv7AtKJOEFHx4l85GFzmnbx6CQIlr8WC2jpyJi52VbvJYw9eemPBzEgHvvyeLbjCMTt5gMLqzL41p6m1KhrPMuea1uJrHzg17zFIRSR+pYu2IOWfYynZ9FDqSaLFzJGCoY1WZ/GQMg6Mq8I4u8IFISyFy3BbaIabI1UXkx6G4SPW24Rx/oY1TYieehBh1V3gWJR1Qj3pBCEM/shHnKF4mGE3E+tV/YsnJxv3pMSszrebyRArzkTBjeo7860bQf62Kc03xrC
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(18002099003)(56012099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bnp0SjR1eW5lUjhXa0NjRGszY2Jnd2tzTE1DSmN2VjhPQkwzSVZnbE4zTVBN?=
 =?utf-8?B?SmZ5cDc4emJ1V1JuUXllRmdoRGJvK25RbXY0THdsUEptck1RUkRzUDREZTF0?=
 =?utf-8?B?NTZFWDZ1QWhabDFRakxKVzJEaTdnMXg2Y2ZCdDYxNHFRY1U3QzlsenVMTUMz?=
 =?utf-8?B?Skk3cWZTSlA5WDhhT2l6UkU2OXBNbllKdmt5SzE1cXZ0TkVJMTQvdDR3VkRw?=
 =?utf-8?B?blVnNmZBZm1yYWtlNUgzNGkrM2ZTN0FhdWRzRzVHdzExc3AwdUNaeTlEYjNF?=
 =?utf-8?B?OHVScmR0K1dJSG8veEhBdWxUQWU5YTYxUm5SR1doVldLQUVoc3BlMlBHUVlN?=
 =?utf-8?B?di9MSjYwRmo4RVRXZEpMU2JFS1hZU2ZFTEFKTlhlU1Z2eUFwOTZvMjlpR2JJ?=
 =?utf-8?B?S0dyWHdDWVFDalJHdm91ZU1BcngrUW1NRlQ4OVN1WUJrS0hhdk5sM0hzNHRC?=
 =?utf-8?B?UVI0a2Zxa2lIYWd1bThOelhob2hPcmhXMEJQRTBGYk8vWWlnMGFqY2FWNUU1?=
 =?utf-8?B?cmdiT1N6RklvN1lpUDNPZWk5WTJ4aUVzeFMvb21YN2x6c2twc3VmT2lNckpR?=
 =?utf-8?B?RGNtQm8vdHM2UFkxWFVMeWxMWnc5NHYydnRZYTUwSjNyS1NSUzA3eXNaYzA4?=
 =?utf-8?B?QWpBQWdJcWZrTHY2Y1hydWNORFhFZnYyWVV4Sk85eXJFb0NaRWl3VTlkZ0Fz?=
 =?utf-8?B?NTBRaHVuc2ZjYjEzc1YyN1FMRWMvbnVkREtONGhudG9tZVlQR2dieUZ4NTFC?=
 =?utf-8?B?bFBPdzFTRGtJMkluK01OWWZmMmN3TEp6cXhDZW92aWxwWGRvWStXZ0tnenJB?=
 =?utf-8?B?VDNmWjFOMkx1bkgyWWc5ejRUem9wbnlCSGpwQUQxU3M5MUpMdnIrdXlkeHpX?=
 =?utf-8?B?QVVHcXRUdDFKV3BwT0hYbG54c0dWbGlrakhRaFdGSi9haE9HWG5qK3VJS0VM?=
 =?utf-8?B?TlhrMlVXTmRPc2RYOUZaQURxS1lmQ2pQMkZHTmZMdkNWbE80QTVLL09VT0Ft?=
 =?utf-8?B?ZmY5cE9FS21VOU5KWlEvQlEwRk9EWHlJU1JYUnpuK21TNk1JRU1STDV1Rkdn?=
 =?utf-8?B?Vk1DLzExdUlQcVZLaGdBUTEwQndMZXU0VUxtMnRWcitTQWRja1JVWUVQbnZz?=
 =?utf-8?B?TnFNUUlZcmdsNjBiZ1RLOHpPdjJHcFVJc3BmdHZ6SmZpYUZLRnJmTUgwdU5C?=
 =?utf-8?B?VEVtSDZvT3QrYXI5bk9FS1pKZGpQRXp4c25YcWxka1E1aXRvZHI1c25QMVZI?=
 =?utf-8?B?bHhkeWZEREJUa1prS0pESlk2clVzTWZnU0xrOHIwbHVYKzE4dEpTaDFYcWtm?=
 =?utf-8?B?WFdDbFlYVUwzMk1pdUlXbnFyc2docnNiQzQ4cktnK3kzQ0hqdDM1N0FRK25O?=
 =?utf-8?B?OXJHMGt5clBzeVRuOGlnK0szMVBRbHZRck83TFJZWXFreENZL0lKQVZHRElV?=
 =?utf-8?B?eEd4NzdmeEVXSUlMY0lzOUlxbXIwYjhZVjhFL0k1emxzeVBLR3lleEJtKzc1?=
 =?utf-8?B?MmdlbDlNdHZhSFZNUFgvd09ZeEZUMWx5MG1lRk52T2JEMEpUaDhMRFhUUHJq?=
 =?utf-8?B?Y1FFcHQxNFBDVlRGUWl3aXhoK1VxRmJVcWtxcjdNMWlhc2JGV284SVpqaEZW?=
 =?utf-8?B?bUJUTFBLbWU5QndaTmJMM3YvK2lNUVlaWFBXYWkvRUVMYk4xbC9IUDdYY2hZ?=
 =?utf-8?B?Smt5djc4c0FPMWZYYnhzbzF5b1d6T3dDSHdOdzFTbU4xR29QREkvbGl0Vnp5?=
 =?utf-8?B?UEJoZy9Xb0VGRFZZRUtsdGxacWdRcHF0bGY0azBiZzBYUHZlSVlaM2NmaWM5?=
 =?utf-8?B?UU85VWJYVUc1NklMQXJ3Q042UUk4dUNjcEhLeWRkTzZLT3RsVnBObW5CNVBp?=
 =?utf-8?B?WkJTWW0rNEJaUEpjcFZMMG9oVEFkaTFIZGMzYTNMTi9oZFdxeE0ramFmTEhj?=
 =?utf-8?B?Z0VuZVpFUklCSWxacVk3NEVZc0hjREdKeHA3Z3F2TStBcEJjTFFEdWtsZFNl?=
 =?utf-8?B?THFzdDhaUUVHVUZVc2dDeVZVOUgwMTIzcUVVRldyNDQrZldPUEhjZThVRW05?=
 =?utf-8?B?Mk5iOHY3Y2oxTEFFdVNGODhuWG1oQmFuU3pMMk5HNjBlVW0yeFdIemJLYVRw?=
 =?utf-8?B?c2lBMnorYzEvMjBKMThUZklqWmp6TWVTc3djL1gvV3pKUW5JRzJ2NjlCbnkv?=
 =?utf-8?B?YzRYS3dUditGeS9aZXdTOGcrRHM0VEM1dDA2ZXZUdVo5UlRKV1NEZmJuUUt2?=
 =?utf-8?B?c3Q3RUNjaWdJWGlxWUtxNVl4bWdBNkNDVjNpTzNSemk4QUczdXV5NU9ZYzd5?=
 =?utf-8?B?ZHgyTWVsUld0TVMxQ2VNbEM1bUxaOTBMSnkrd3I0VkhEUG1nVjFJUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f71f765-e778-4f0d-4857-08dea11137b7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:20:45.6675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zh2Q64jzjno3rfqox6ul6sFP5wLpn1CIRDaPOBlOBEGuv2oe1OG19xIaTs510wRsKZa6Zl2m52HBUk+us6TLvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10281
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59365-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 618E744E727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
with multiple stream support and adds i.MX95 platform support.

The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
IDI is software transparent, only a different register map is needed.

Tested on i.MX93 and i.MX95 platforms.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add two new patches
- Simplify error handling by keeping goto labels instead of early returns
- Removes redundant register availability check
- Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
  readl_poll_timeout() with direct register address
- Fixes stopstate condition logic
- Check PHY stopstate after sensor enable instead of before to ensure
  correct timing.
- Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
  balance performance and responsiveness.
- Add dedicated constraint block for i.MX95 to reflect different clock
  requirements (only per clock needed vs i.MX93 which needs both per and
  pixel clocks)
- Update commit message to include more details about interface differences
- Add Reviewed-by tag from Frank Li <Frank.Li@nxp.com>
- Update commit message
- See each patch's changelog for details.
- Link to v1: https://lore.kernel.org/r/20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com

---
Guoniu Zhou (7):
      media: synopsys: Fix out-of-bounds check in enum_mbus_code
      media: synopsys: Fix IPI using hardcoded datatype
      media: synopsys: Add support for RAW16 Bayer formats
      media: synopsys: Add support for multiple streams
      media: synopsys: Add PHY stopstate wait for i.MX93
      media: dt-bindings: add NXP i.MX95 compatible string
      media: synopsys: Add support for i.MX95

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  16 +++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 109 +++++++++++++++++++--
 2 files changed, 118 insertions(+), 7 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260414-csi2_imx95-65ad0e7f630a

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


