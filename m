Return-Path: <linux-media+bounces-41150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6FB37F62
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C96623A3AF2
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7974307493;
	Wed, 27 Aug 2025 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PjvHUYLT"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E97B3469EF;
	Wed, 27 Aug 2025 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288488; cv=fail; b=Acgxtvx5RU9L9Eye+1CILbu5kAffR2hlUW7wsnorqE7//zIaYwxhfpG5bh+wUuT8tR0KFLviVATn/rqzgXz9ea+mZEy5RThGYPc60qE81Ds1kx6p/KuP14KQb6YlrGWjnopnkOq310NVkou1E7ZDCn8sOuLEYLWevrH1g6LZFmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288488; c=relaxed/simple;
	bh=Ztg+jPeoGTXj/ePNDC211zEZkGhV7cHOp1bvrPMCN+8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IkhI9S9wOmy6GWsBP/URkEkcTqUtLsjJ/GQx36rtOvX4sbrrQbJjJPuGn7Rb3J+/JM3hogF+8TK4yHMSHCQnpI6SkF/NV2xrdOwoQnKxAdOwzPu531RSIAOeU9iOQrDlmGqzWBQBgi8dh2Tl1F6S62iiuuUZlFSdwN5tpqxlHYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PjvHUYLT; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La+v9NyZxxk2QXGgyw5elOWg94Z8c1qLwQ60Rfh2O+UlRlxftU7ycd5g29y2Y17uYaU9qs2XSoRqKdNrIiykApdlAIs8ZC90wAm+RhE6kLXiV68tMCaXrNc9kyfyLsvTMrBq4/FJ3wt4HFBduE5TVi08jUIQY1kfmpLZhJdsqGMPas/ZMAr4tkXmmcUcAdgArx6DM0wJyFqo0ykX0D0e9zYL0rdiQEhr+gC3SiOlxGf7F88HLE3YDnSBbaB+Xm38hCwzE9WzCrAKoeUVr2iDF0YVAMYBrMlKj3NYI0W1qBNBzmhR53SjgUyjRyu+VJamNO4+KY+9uGEYh2LolclfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFejTwx3YaZiTIgk97mgrPdRTLibTfpJflWX1yLhcYk=;
 b=lOslTnxiZbvDo+GxGstMGHiDfY/7vnbjvTN1fkSCVZ/LaXCRjN9QE4qYd1AJZ9VNl3YdH7p/R0jKVt4kiwBjTKlBk81wxYJmxcVdaumjLexqrofxD053u0mPm9Fa0EQsQu/sdKCSUxczKmiK8PH+MOXKT9fbOIMSCInRSfTzLt6Sz3ajGM1CwjYhZNfnQNlIZhMfXMOOPr+5tfZynhYYTPkgAxxaR7+VJlBo38jZG21GzS68aZJRj/fgvvug0KDcU0Uoj58qdVJo4xykf1jONiGfUEhZrN8PHP4Pz9yf9eLn3fTAM9z4qXvhuVHfjJC40AjDnnaRHM1+K7CGAPYCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFejTwx3YaZiTIgk97mgrPdRTLibTfpJflWX1yLhcYk=;
 b=PjvHUYLTkbtlBWwaEU57JnV2RO/4z0FRbDtFTpUWdbJczI8p5o+LwYEMSHAghP30A6fE27j0jwt8uDjdknYOEM4rKj0hfuO5bMtWjHaYfEbSRUvvipnTW8LKlAGUeKMl1n4GChrnkQ+A/ZlvTCSLOvhiUIjDD9kxx1qFGfcw9J4SEwwxsSpjtaFyysQBxqXkCAdJL3s0zONrNy+Fcc19l1Je88zriXY+rHjZmy4ulCmxXqrKI2oY8YONGQiQJR0b73DciVlwMKak1psQWPntWOm47+K+JyJhq9rRgsVV0zDEmSO8+lpFZ5DPkYSxYOXHW6ZeWBS+7luAHnPgk+hfeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB11147.eurprd04.prod.outlook.com (2603:10a6:800:293::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 09:54:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 09:54:42 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 27 Aug 2025 17:53:52 +0800
Subject: [PATCH 5/5] media: nxp: imx8-isi: Add ISI support for i.MX91
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-isi_imx93-v1-5-83e6b4b50c4d@nxp.com>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
In-Reply-To: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756288458; l=2180;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Ztg+jPeoGTXj/ePNDC211zEZkGhV7cHOp1bvrPMCN+8=;
 b=YFhpWUBRX1lGBKJ0RZpWyignUHXtPlPUIMex2EZiSPwcrcwZKPYygd8moBi/BdubbIPif5nFB
 ojxQ0j1I2S1CCeqfgpxJdMIFG9jeP8jQQTcHYduo5VE0Sd+OKNvjAtQ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI2PR04MB11147:EE_
X-MS-Office365-Filtering-Correlation-Id: 69593020-bf51-405d-f4c1-08dde54fbf01
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?THB3YjdkK2RFQVQ1ZG53em9Oay80NzU5MUp6eTdjQkZSVExaQndRRURGRkd4?=
 =?utf-8?B?RTBIazMwWTBPa3RqQUxxUHdjNXV2QXRrU1ErSHlrMm9qSGhRT2FnZko3bU9h?=
 =?utf-8?B?elhlVHpHejgzWHAxZFlrR3J4L1NVVEdYZlZadzRBbThHZHZWdENJZG1TVURm?=
 =?utf-8?B?cHN4djkyZjN6NDhGb0FHb3o1ZUNXWHBSNXgxQUFTd0d4ZUM0U0tvYUQvVmt3?=
 =?utf-8?B?NjFQTmpja2g5R3g5cW5MNkZDT2o1Z092Qm9JdjF5QjZZQ2F5Q1didHRkMkhI?=
 =?utf-8?B?R1pyTUN3QnpSVlR5cVZBWU1OMUw3RU5BUXo2bTlaUUVpZmRXK1dyYUZPZTY1?=
 =?utf-8?B?NEF6SXJ3M0JRVk53T1VZaytxdkRJV1o1WjNMajJ0MDNWMytUa1FPWXdXOXhI?=
 =?utf-8?B?UlY3WGdWSTVJL3pzbmZUOXlQdnhvNGx1TnBxVFNkbzFuZUxodEQzcWQ1bkZw?=
 =?utf-8?B?RU40cklMVzZwWEpWekgxenBnVmNGOVAvbkZISTdocE5CdkRBNDZiWjdlNVdh?=
 =?utf-8?B?ZHg2WWpyU3BSODFiMVJXWTVpZVFjQ0JxSjAxSUowb3V6Z1hJemsrSEU2c21J?=
 =?utf-8?B?RmRYb2liQ1Nqd2ZoemhhbDZIVXZMOVRVRklUdVVHd08vQ3piZXZUTmZIN3BR?=
 =?utf-8?B?SEV5SDdNWHByc01FbWNsVkZkUHhIMElJRDNDSnhZL2Y5ZEMxa05ZMm5yTHdu?=
 =?utf-8?B?UnhYdm1KRlYvSmtHRjZwOVNSNFBzTGVBUmdoamJNWkhLNzZBQ0EydVBGM0tQ?=
 =?utf-8?B?bmhteDIrakowMTB1cHhGQ0cvczFaRi90VnRpSzZBWUZETHRqZTZrV2cyOWRU?=
 =?utf-8?B?U3JBRm5NYzZoMGM1M3piaEg4U2czeGRxdXcvNWMyamZMTUFYUXB1VWNndGh0?=
 =?utf-8?B?eFdKZ21qVXNEeXBNQy9DcHR0S2wyc3crSFZJT2pOUmlieUN4eUlLbkI3Rnd6?=
 =?utf-8?B?cHMzaGhQUmh5RWhJWUJ5WVFRK3hWQ1hLdXMwemN2cThpVSsyUk5IY2NJZE9m?=
 =?utf-8?B?cWtvM05pRkRTSjJoY2tCTDIrc1d6TFFISUcvUElvcm92NlErZ29xSlB2aWQw?=
 =?utf-8?B?MWZpNEdIa3RneXJFWmZzVk9RaXVtYWNtWEFMR3VEMVN4SWVoNTdieG5ZWStw?=
 =?utf-8?B?aVFiOThVQmlFTnlObDBGZDZGOGV0WnFkSmRaT2Rqb3VwaERKNEZsSjBkemoy?=
 =?utf-8?B?ZEtCdkxHSHBBakg0RmFEK2hRNlI3QXozVFlhU3pMY1BqWjNwL0FFZDhzT3N1?=
 =?utf-8?B?bkJNWHg4cDhzMjhudko2R1oxdGc5QW9JTkNVTUZMalcxMnd1bi9kUFVtbkNL?=
 =?utf-8?B?OFNNYVVPYmw1cm4xNXRlTHM2dzcvMXRYY2c2RU00Ym5nZ2p2VElxUjNzSXRU?=
 =?utf-8?B?Z1lKMGRVenBiRGFzblFoZk5FTzRjR0JnK2U3R0RRWGJBOHErWDAxYmdZZVN0?=
 =?utf-8?B?TW5kUVZLYlhneXA2NElZS0ZYTklwQ000MHVqR21kKzMyYnl5dGtZSFU3WmRG?=
 =?utf-8?B?dnBaVXRnQnBSeVBTSGI1eHNTbG41bWNZaTRyOXh6L05INDdxdDZXTlMvc2w4?=
 =?utf-8?B?ZDYzZW9oTzMxbWhTK1huVisvUVhSb3B2QWNEVER0QTlOV0dTcE9lZlBWM0di?=
 =?utf-8?B?WFZQMlhnWGJNVVF0dVU4SHRWdzlUS1lVY1c1VXpiK0VpOS96UmlSWmgvOFRR?=
 =?utf-8?B?eHdsbmVacXJzK2JxekJyRHg4cW1pRVUwUHBqQ010RHVVb1JpS1hHTk10eXpM?=
 =?utf-8?B?MUFaRkFZOUVUS2Rha1JGSmJPci9mQXU1ZUppZXJXR3p4eFdwdzlob0kvMzd2?=
 =?utf-8?B?WU5CaFZ5ejZuZVp5UkxpUjVVeWhMVXk1dWE0aXh3bUFRUVFWOWx0eGN3SndM?=
 =?utf-8?B?NzhoTm5sOUZIZ3c3eW1EbDdqTlhmTitDL3NsUU1zUm8zMkoxZytQL2l0RXpp?=
 =?utf-8?B?ZlN4dmNZekREV3hiVDdHeHYvSk91WDc0MElDN0NacVd0a3RZZU00TE45Tyt6?=
 =?utf-8?Q?AVPgoqmZRvwWvlgE3+/2wuCJfNu8HM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NGpPN0RxZE9sSEFJcjhuWEFPL2o4L3ovY250ZWpFQ1ZoRUQ3ZHNROVV4ZzNZ?=
 =?utf-8?B?a1NkUW9uaFE4UURtNnVGb2ZFa1RIRnZZK0p4R0pSZy9VWlM4QzREMTBUa2Jw?=
 =?utf-8?B?T3BKTHBtMXlqaVFGWUpEaDRBTzRHTktHSGgvZE4yNlgwbk9MaDlJT3V4WmVE?=
 =?utf-8?B?enFzMnA1WHlNOVM5UGhWSFh2UTV1Ly9ld01HYzAzeEFFMXdOQ3VRMCsyTGNk?=
 =?utf-8?B?V3puTmIzeHBySFdXNTVUZnVoT0JnME1vN0FwQml0Tjc0aDZuOE40clVSaDdr?=
 =?utf-8?B?Zi92b2FTcHZUU25BNkIxQnpVVW5PeEx6eFRCRGpOdzc3bG1DdDczeDlJNC9N?=
 =?utf-8?B?WFVkMFlVZWNXZHNFMU4xTmpRSklFbGpXR0VDdGd2bldRSEhObXdILzdjam0z?=
 =?utf-8?B?VXRIbTFLRVFSOHIrdWR4R1FPRjNCbWNnbmMwYmlDWTFWODlvYmMyektrMDY5?=
 =?utf-8?B?N0lENE95U2Z5K2pOdXJUUzZ0d2twZVhTKzkxdDVYUzYvMU1qSjVPTytLMHlE?=
 =?utf-8?B?K1N2SlU5cGU2K2thQUF2bUlCTmNzR1k4ZTVxSXcyU2VaKzRBQWJEL01ETW4y?=
 =?utf-8?B?QUxTcUloN0lrM3hYWklhWGducEw2UzNJNUdmQkdCVnV1eGl3KzBNQnREcmdt?=
 =?utf-8?B?UzhRVzBibkpWOHp1SzZnUEZWV1A4bXY2YldQdGV4eTE2M1NCeVBrN1lBVDFU?=
 =?utf-8?B?a0dlUkh4VzVUdi9kL0gvdE9MMHhoc2xDdkcycmtVbk9hQWZIbzlHY0Erc1R6?=
 =?utf-8?B?R1dYQ05sTHVPYXU4TXZZMGwrOGkva1dFajliMVd5TDlwMVZteUpNSXdLK3BM?=
 =?utf-8?B?QlJlTENNbEdtMnlSM0hwaDVtVW1tY1dMdTlIVk9oOHJXdWVyNE1ScGZXUXdx?=
 =?utf-8?B?bXFWZFpUbUpXb29MSVFlU1F0OE42VVNrSzNpRTl5cW1pbFp5RDd0dU9WR3V3?=
 =?utf-8?B?V3JHKzFFWktjelZLYnliK2ZUZGZDOVNRNGUyUW8wcTRkSDhmYjZkZVd3VU1t?=
 =?utf-8?B?Vk9Qb2d0bUk4UEN6eGx4a3hSalpKSXlUc01oa1FnZ0JzZ0g2UTVGQXJWS0lv?=
 =?utf-8?B?NGJDOVg1UWVZbStGODBESlhTeURkTitTSW9ObWpBNk1tdDFQb2FiaTdlbHFx?=
 =?utf-8?B?bk5jeDVFbDQ2ek9tZVcyU1JSb3hsZWkvMm5FVXBsY3BLQ2dtQlN6N2VuNER0?=
 =?utf-8?B?emtXQlRSdUFJSFRsNGdHUjNMRUk0b3NoMlJGK2tGUXYwaStBSU56MHRyL1NF?=
 =?utf-8?B?Qzg4NTdQeUkzcUNoVFRqUGV5clVGUjlrTGxkS3BMODA1L0I5ODBWdFdVNmRJ?=
 =?utf-8?B?U2t0RGdUdGdma3ZvcDZyZGhTdVQzbzV5UHdXbTlrYk1GakFCREMxQnpZTER5?=
 =?utf-8?B?M245NnZMME11R0JiK0lpM1kyWmJ2NlNnbTFZREZaSHA1ZjRURmFWN3VMODYy?=
 =?utf-8?B?Uk9wZ3poakhsOTQyWjF5bFNKR3FrUzNHTHc2Ukk3NmFLM1dwazdlS3l5a3pC?=
 =?utf-8?B?S1Z0V3NnUXZSL2h6dVRLSjZlblUyVGZMU3FPNlg1N1c3c05tY0dYeklERzY0?=
 =?utf-8?B?WFlBQ3FUcTFTbWZzR3FNcGdndFRMVitjbHRXMmJiaWRjMnBVWklKU1FYYzBt?=
 =?utf-8?B?eUE2TjBFVkpkeGY0c2Fhbk0xdUl0VFM3ZmxJbm5md2ordHB3SmZYbGFGZWtF?=
 =?utf-8?B?SjIvNEhaSWVyOWd2aVNFY1VsQkY4RzRZamRwSXA1a2tRTTExd3d4QzhqcHJF?=
 =?utf-8?B?WGY4dEs3K3ZyTTRBSkVnQm1PVU5LTkdjUnlRaUV4T0xUdUZjYkhxL2tQWEZa?=
 =?utf-8?B?R2dhWWQ4SXZyVVR3bnBHVzFCK0ZHOUs1WnY4elJRbVhWTFcwZ1hyeFRtM2Jv?=
 =?utf-8?B?aTg4ZEdhRW1HR3VuNG9NVWcyaXlzb3BGYTdNZjhhdGIzc3lIRjZpYmpEbnBi?=
 =?utf-8?B?aUNmZ280RGJJS1l6Zm5TYmRubHBTMWNZZCtPSjRUWk5KNVAwMXdyNVlXVktQ?=
 =?utf-8?B?REFiREl5SUNNTGFEYnVLaEY5WDlwUml3dWxkWm9KQUE2VUNLemgxVGZHakpU?=
 =?utf-8?B?Uk93aVR2aXpydGx3ODRXVk1BeHFEOXVFZUlzdjQ0THJZbE9PanJXZVpMQ1JO?=
 =?utf-8?Q?5Ox0zaQZS27RTYSwy/CVjfCs/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69593020-bf51-405d-f4c1-08dde54fbf01
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:54:42.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw5oZRfydUVe90Ylibkp3k+44WIINdqdFwyeA0UgWrSEdBKIL7+YE7OtnMjAWhAygK5oVMxnp8qfqdFYFosuXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11147

The ISI module on i.MX91 implements one channel and one camera input
which only can be connected to parallel camera input, so no need to
select camera input source in gasket ops.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index cae918792ddbe3e6f458606fbbb7d0ad5738504c..3a675321a256cae885ca2f89a31d64262ccc35f0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -347,6 +347,17 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx91_data = {
+	.model			= MXC_ISI_IMX91,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.model			= MXC_ISI_IMX93,
 	.num_ports		= 1,
@@ -539,6 +550,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
 	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
+	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 206995bedca4a4c5d7873f3bc872fbae18b3cb75..6ae023aebba9da809a0baf9a9da08672d31d5cc1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -160,6 +160,7 @@ enum model {
 	MXC_ISI_IMX8QM,
 	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
+	MXC_ISI_IMX91,
 	MXC_ISI_IMX93,
 };
 

-- 
2.34.1


