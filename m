Return-Path: <linux-media+bounces-33183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F8AC12D0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F77A428F3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DEE29ACC1;
	Thu, 22 May 2025 17:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lL0f3AHj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2E298994;
	Thu, 22 May 2025 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936650; cv=fail; b=mqjFgfdM1YX8TEHGgp0vfX+SCsnV5kWeLQaPJKgqVGIzV0lL/K7f5z+C7sYvk/yy1nFNWl3vU7hL21Lx0OEYWYieJ9LJiNlhzPL4LUV+3Ourx8ZBcNkDksCXRJ3HVlt06YBowagId1lUEySPq20T9Tg68MsT5V4yXiNTLNu3JSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936650; c=relaxed/simple;
	bh=1WOdk6X4SKbrjfoujDuYUBNioWb4sTvULnF6n9hwi2Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ivDGu1ZauRr/4jiSLDSp+6hd+QrRHDRTT+A6U00B3PVt+9Wx3ApIukRuNwe1dWPU7EtqLQ58Bj/aBvaHhYqdWiIYz0aIcO3a9jFTWV7dsitI2zOLKS5mj4SJLbGoniRb/u610ow61Fexb2vleZ2NkaK6a0/B+S0u5YpmJUWCIGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lL0f3AHj; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcHpl0pUdbhgKLmjKyOrPcehL0pUG45rQL8mWjW2iRfUoGcBgztOiTBCWdhWdh/JglPKW+LEQaksdDCem8YdKvfZMu9DeV9zifMIWqOGNlzW3AoVeW/jNVOXjNv75Jm/p4xNM8YEFwbKy0178ETuS8YLSsIuYgDz5gI0QIzC2+naff0sBPMHyURLanZRUYiMqaM/iAVV/n5SwnHtqi9qeLiZtOWOSPIWvkyrWZuBUQuCv/e1e4FZKNvPcpy1q+Ew/kGn79UGKDN7do8JJQ17iCcW3n31qQtW+CnaP5hIH+Pu/G/ITREzg7WdObWpHQwxU02NPpkwzI4nqvCBRBIfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yms8VojLzC6S+Hq/lXOhPH64QgJIIDIc/Ounz5olXtA=;
 b=SZtUqXB3cZ6ARXVMwoCrfl4bQpC1QpiRgM/3udDIfAmN/UbiwI2eA0KJ4S2V9G3uMfv1T5Lr3XvG0QpDONvR4QUmmqMNHEI/kWorLAraT+DZnwBIuMlAXlgWdadp711lR7XqXL3+hHf2ESuB8O0Z6HJCEDXIMY3OdOrh45h2NL6JyWA/xtwe3X53juDklFJSRxqjofrd+360jnlwfJanv6++WsaDObG4H7MJNu+edZ+VjwRa8Os2l9qAor5H/kOYzeP6dZotiDMIyaG4Jjs79WGkvvXEM2yRuOlFvAan+IJVrOVvsv12QIlYBtLFaq4MgMt6D6pa1gmWJ9hEiEUl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yms8VojLzC6S+Hq/lXOhPH64QgJIIDIc/Ounz5olXtA=;
 b=lL0f3AHjKiZwrow2N8Mg+ZLzOw8Tpkon8Cmb+U8yaAguazZyOvUMFLHCIHGMdugB0kjySQcSgkpbGIXgQ4A3ubPf3XeWQvQgOwfcRYZAqKlaN9/tL5pGjrw/88HXVB8GkUnLpFERfew23MHP4jG/gfujlPNXMFB9OQWCCa69jNjceZaEeArfQk0HajoOf5+6zRvqeutrp8e8XL0WIZl2jQ9enDcbVIP7D6Z8LY1k8cdIF9xViVQIz0JU0Um4WDSaOgsPIcJvKA9nA5ABzg/HXpVrjjBzrLHmCLuK9XTwV1LZ88ZGbdscSQcF0hlOyhyCY7FLBqYgE5Fmam20t7pTkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:44 -0400
Subject: [PATCH v5 06/13] media: nxp: imx8-isi: Use dev_err_probe() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-6-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=1609;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1WOdk6X4SKbrjfoujDuYUBNioWb4sTvULnF6n9hwi2Q=;
 b=VJQHr4/GHGBGqt8vc5Aqbup+5l9GBt7KcfAZ/LtA4XTZ4TaU8peShgEsv0pF3nWmr0C4J1Yae
 wV43Ys7tZ3XCztvmCNQNXi2Hes8/AbtjQzuNn09J5CS6F7COkJUqHgB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 417c3d6d-df5f-4839-f3dd-08dd995a1c72
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?c25VaFlHV01SSUN4aExoOFR2TVNULzdGRjd0YURlSkZGdFpFeS9YUFVrSjVo?=
 =?utf-8?B?clNsY2hnY21EV0NIbEIrTnpYYlRvaGY2bUpBS1htN2Z4NzZTSlBvWXJlVzBq?=
 =?utf-8?B?VEF2ZldMcDhQRnpXcFQvL280REw3c01USkxsMkhEQk1aR1ZXS2kzOWowcW5U?=
 =?utf-8?B?R1cyWUhDN1hiK3ZQVTRUWjRiWmNkajk1UW5EaVFpZTh6QUpnSFNiVU9idmlq?=
 =?utf-8?B?NFdRVGREVUJ1anVjTlFScmMvTzZnZXo4U1NUdmkyZGQ1eWhmdWMyTUlnOVJl?=
 =?utf-8?B?MFB4aUZrelN5VHVveURUR1JoUVBVd0N0TEJ3clBFSzY0cXo4Y05Pcnhac1J5?=
 =?utf-8?B?bjNsZHh6QWNGSWpqYW9jQkJMWlMxQUlKN0tNeFhMNXlvR29kbmFEMmNPaVNn?=
 =?utf-8?B?a0F4NHBhQ3hqNXhPQ0ZUYjRtelppYVVCSUJQSlJOZmF5bkhDbUk5cCs3VFVx?=
 =?utf-8?B?Y2x6TWQyZERVZkVsSkZ0ZklVZHFzQk1jekpiTWxHdjVqMlByREFhWFZ0SUhj?=
 =?utf-8?B?cXVxeHQxeVMxMkM0bEh2ZWt2U1VseHR4MG5hRFhuenZKb3hEMDFwdTV6UWF1?=
 =?utf-8?B?S2grZHR4TnVmY2EzUndYaGZpb0dIYldRSnprcWZaZTNmNFNycUZCVEdtTzV4?=
 =?utf-8?B?Z2FFKzlHekk0NE1XTUlyRFNmMDlmVmx4SUZIL2loR0xRVno2c01DUWRLNlZN?=
 =?utf-8?B?OGZFMTBQdXFzVU5EQXpabldvUjJPWW1oWU42cmtuR01oSEhpT1V5dzBFMmNp?=
 =?utf-8?B?R2tpZmtYVVFNSkpjYk1PVnlQWEpkamVCRFhxemhROHZLbnVJQnJtaWp6YkRz?=
 =?utf-8?B?aEVGVnRGdzZ4R1FxZzIrMzQxYk54NHY1WlBYZmdOZ3Mvano0Y090OFlEeXFD?=
 =?utf-8?B?aE1sVTM2ZDFRVkpld1I2VGo1TkJGc1dzaFJ1OWpRSDhobzdLTjdoM0VkZzdG?=
 =?utf-8?B?eVhpa1gvdHFkc29ESWQ0TE04Ymc3VVBIRXdrajZ1UEdZRVQ0dFpSVEhlUjNz?=
 =?utf-8?B?UE5vNGszQXY4K0tmTFlBZC9IaDhiSjdDSUxZamtuWUh6SVd0d0FLVTlOUTh0?=
 =?utf-8?B?UEtRNloyTG1idVNFMGc0YTZsLy96WTNRR1k2VWxjTDJ6ODJNVldDcVVxbU9j?=
 =?utf-8?B?Ni9kTXJ4eGFBREplU21hNDFQcmYya2pvNUM1Z2lQVjRMSmVwOHBjek54SVRr?=
 =?utf-8?B?VFJmVFFqMW9pUDNoYm5ZdUVjendnektmWGlEYUFELyt4S2VVaWdDbGhTazQ2?=
 =?utf-8?B?UHpRbW4yUUhSaEdwd1BBLzg2WEI0WktDUU8xUXFlMDZ6dWN4ZmUrd3JURUs0?=
 =?utf-8?B?QUR1cVJ6ai80VnZrYUxUNXVSeFlmL3lMNEJ2WmhHYXBObmcrRmVIQ29hZXFo?=
 =?utf-8?B?OWEzcWRxeEVEZXU0MHJGZXB3ZHVKYXZBRGZQdW1mSzhzY3NNVldqOW5zZm4v?=
 =?utf-8?B?OUROU0RhMHNUK1g0Q2JpL0RiN0NqNHFPOC8xOWZJU2hVV05WZVBwMDRUL2sz?=
 =?utf-8?B?K2FmTU04ajRrSVdoLzI0S2lpQTlMTDVUZXMvanhNTWdlc0p3M21zVnlsbXht?=
 =?utf-8?B?b2swMU8xb1o2T2pZTEVTT1pSbDFndm9NZmtjcjZicHlNTGRmSmxXcFF2Q3A5?=
 =?utf-8?B?Skdkd2hVWHdMbFJHdnlXYTgzWVhTcG5qeFV4UStOOVF1a3JlOUplTnhoQ25s?=
 =?utf-8?B?bnRNTFJ2U3FtUW1aNG4wODkzTWUxRkRRemx3M0g3SHBQUUdzejBSblFYd295?=
 =?utf-8?B?dGErYjM1N0s1azNXZStRclpwMDBjQkl6em5rbVJNdnNNemFOYkk0ZmQ2eGZZ?=
 =?utf-8?B?WTlueDkrVzNUeVFGbjZleCtOc2FwODk1TnREQ1oxQ0QraDdha3lTNFA1VVNY?=
 =?utf-8?B?Q21ZWGgrMWxaSnVtMngzRUI3Wk51ckI2Tm13N0VRQUlMOU9YN1l5MzMyRGRF?=
 =?utf-8?B?ZnVUODlBc0l4SHZWam9VcEpTNm9yTlkwb3dzNFFDTnoxTDUwOWRjMlZNenZ3?=
 =?utf-8?Q?YnH0BLb8c+dnfqIk6c4ZUXJtXLQP4o=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WVpQUFUzMnJhSzVMVFhYcXJYeUVHendldVFoNFNtMGxXU0lnUnpqWm4zbGlK?=
 =?utf-8?B?bjVhR09KcnlrN3pTNkhrNnh5UDRIYktPUVB4Qml2V2c1UGhpS3VuSjlmUlNn?=
 =?utf-8?B?dkNrTkNjTE5TR1pVTDdhQmQvRGt4bjMvNnhCNTR2MmRxTjczU2dndjRZcys5?=
 =?utf-8?B?YjlpMEo3NEtqeG1PMHFFV3ZTVlNqYm1TSVNrdlRGaVJCS1BHQVRhTmUraGQ4?=
 =?utf-8?B?V1hldkpsQ2hOZ2ppOWEzcGF5TUdVOVdCZ2xvYTRuZTR4Qks5b3pXa2tKdTE1?=
 =?utf-8?B?Vk9DZklLSmExTjVVa2YzcHBYR2trTFNyaEh3Z0Qya0pRNDNwY0UzYmZCQ2ps?=
 =?utf-8?B?bERjdDd4eW8yRnBQV3l5S1paeFBBZzBQQzVOVzd4NGMxVlp3NjE5R2QrYkRG?=
 =?utf-8?B?cVZ0UVVRTTUzWXQ2WVhnMDlUUEtHQVdkRXJLeUkrSm1xWHAraGhXdTBGUHVG?=
 =?utf-8?B?SHJxMjRMcis4b25SMXp5L3ByV3c4KzNCR0R5QjY0UTd6aHVSOWw3Q2p6VWhP?=
 =?utf-8?B?YWhXdWRCU0Z3aDVrb1NVU2hKZWpodW5SRDNxRmEvbW5TdExQWDJMd3BIZ0RM?=
 =?utf-8?B?VDh3NEw2bTBtNmtmNDFaMklSVzNydlZCYWR4ZVlUSnlVZHpYL1F3em9FcW5x?=
 =?utf-8?B?T0FyazhCYUI0QkVnZGErMHRZQ1NzQUJNRlBONzQ0TmlZUm04Rk40bTlJN21u?=
 =?utf-8?B?cTFCVms0RHZScHNERHNDaG4wK2tHaU1MSXZlYjI0SndMOTdTM2xHZEY1aE4x?=
 =?utf-8?B?Wno5ZHJ0aElwZjBrb1RmNW9EbkI3V1VGUTNKKzFpRmIyNkJXdGxCa0tVWDJT?=
 =?utf-8?B?blZCZHg5a1k5a3RHL1dTaU5BWEVwdFhoN2VhRGVCVk0vR3VrVGhBM2NKRUxr?=
 =?utf-8?B?QXV3eFBac2wxeWpXS3h3NWIrdmpoRWwvaXFZV1I0R21GQW53TFJHTmMzMkRN?=
 =?utf-8?B?VWZhcmkvUWdwb2JaUUJ2M1FsVmhSVnN6ZjAvTkRjbC9VNDhEdGZnMnBObDJw?=
 =?utf-8?B?SGRGZlc5ZWJ6VFdDYm50TEhzd2xhbDVuMnpEYlhsWFE2bFBkalZHVTh1RDZz?=
 =?utf-8?B?cGRTYW04U1dDeUtMQ1lidGljYXBSZkJnTUJ5eGRVbjUvVmFRdUM2NWszQ2hG?=
 =?utf-8?B?NHJTVkRiOWREaVJRNjZHeWQ5eHhOZXVzQSt5Vi9xRWdOZ0xJSnkybEdVd1Fv?=
 =?utf-8?B?Ykt3dWpVRmt5aVNEU0VocWJCTXdnY3VwZFpqSmhQVVNHTnVQM0JPRjMrc24r?=
 =?utf-8?B?WEJKV3JydkhxcXAxL3RHZjZCSjIrSnVyZmdWUldsajBkWnZIOTV2NGZodjM3?=
 =?utf-8?B?Z1BOaHdQbHZpYUZHQUJUdWo3bXNLK2tMQmJ0ajR2d3pFZlorUC8yVm8vN1Br?=
 =?utf-8?B?QzNtZFRhb2ZwMkNNU3F2bXRMWStXRVM4Vk9jN05DdFdHb3Y3MnhTNlJpaVRm?=
 =?utf-8?B?NTA5MFhVbWNiVHBtVlA2L1Y4K0pVeFB1UFE4eEpqYzMyLzhhejVCOTJXbVVp?=
 =?utf-8?B?S2RiVDJDWE1WQUdtTEZIRXN5N0FlZWcxOHJUVkxjTWR2UGtBemhab3RWVkwx?=
 =?utf-8?B?TGVaR0REL0NBVko3VFZBbFMvaFhZMjl5VXk3OHE3Vjl0RWc3SFRLd0VlVFJi?=
 =?utf-8?B?UVdlOU82RDRUV1BSKzFFN0JIOTBvdVlHNUNXUFlEQ2sxSW1GNmVDQXZDLzJp?=
 =?utf-8?B?cjd0Z3VDbTRPMGtjZTFQS29ZY1JMSjA1UHFTYXQxQ2tmOHJOcExseTZ6dE5Z?=
 =?utf-8?B?WVIvYi9MRHU3S2ttejdBY21YZUxiUHB1N1h6ZHd2THFuMGJlN3VzNnlzZG9a?=
 =?utf-8?B?U2MxMTZUVjBwQmJySmZJdVcwTUhlMngzc1pKclV0aEhGTFc0aGlRNTRwQm5J?=
 =?utf-8?B?NU5UbE9nbUJvS2NZaHZENXFrc0JwMVlwSzhNQ3ZKR2FUUmhsMmJ3SVNyY1VP?=
 =?utf-8?B?RC9heVlMdStKM1RWNnBJOFkrSnY2VXlrRUZHS0RFdURQVzZ0MkhDNitCaTN1?=
 =?utf-8?B?SEIzd3htOEdXcU9VaERLOWMrRmk2QkxRaWJud2doNFpiQXF2TURSczJ3NzBH?=
 =?utf-8?B?LzF1L2Rzb0RpRkFEajhNcjJmOVBBc2FpelZ1dVBFV3VUVmUxRTFmYytXOUZ1?=
 =?utf-8?Q?fUVvf3F9uWqLsA10Ccp2Q6dLW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417c3d6d-df5f-4839-f3dd-08dd995a1c72
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:26.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr6dPoubkmRCThTGPUPq5arUQypC+Ff9nwLinzXahA66qM60JQmAmuFXJR01U6ZIl7thESRutfBh1aseQqxAVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Use dev_err_probe() simplify code. No functional changes intended.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v4 to v5
- add Laurent Pinchart review tag
- wrap error message to new line
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 073ea5912de3b..4ab2749e460d0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -428,19 +428,16 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(isi->regs)) {
-		dev_err(dev, "Failed to get ISI register map\n");
-		return PTR_ERR(isi->regs);
-	}
+	if (IS_ERR(isi->regs))
+		return dev_err_probe(dev, PTR_ERR(isi->regs),
+				     "Failed to get ISI register map\n");
 
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
-		if (IS_ERR(isi->gasket)) {
-			ret = PTR_ERR(isi->gasket);
-			dev_err(dev, "failed to get gasket: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(isi->gasket))
+			return dev_err_probe(dev, PTR_ERR(isi->gasket),
+					     "failed to get gasket\n");
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;

-- 
2.34.1


